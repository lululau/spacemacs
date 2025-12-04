"""Install Spacemacs AI Agents for GitHub Copilot and Gemini CLI."""

import os
import re

# ==========================================
#  SPACEMACS AGENT BUILDER (V8 - English & Dual Stack Info)
# ==========================================
# GOAL:
# 1. Runnable from anywhere (Root or ai/ folder).
# 2. Finds coding_ai.md relative to the script.
# 3. Profiles are located directly in the 'ai/' folder.
# ==========================================

# 1. Where is THIS script located? (e.g., /home/user/.emacs.d/ai)
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))

# 2. The source file is in the same folder as the script
SOURCE_FILE = os.path.join(SCRIPT_DIR, "coding_ai.md")

# 3. Output folders are relative to the current execution location (Project Root)
BASE_DIR = ".github"
GEMINI_CMD_DIR = os.path.join(".gemini", "commands")

# 4. Profile Paths (Relative to Project Root for the 'cat' command)
# NOTE: Profiles are expected directly in the 'ai/' folder.
PROFILE_MAP = {
    "spacky": "ai/profile_elisp.md",
    "bzzrts": "ai/profile_emacs_ui.md",
    "nexus-7": "ai/profile_layers.md",
    "vala_grudge_keeper": "ai/profile_ci_github.md",
    "don_testote": "ai/profile_elisp_testing.md",
    "golem": "ai/profile_doc.md"
    # Marjin, Dok, Skeek are NOT listed here -> No Auto-Load (User context required).
}

def ensure_dir(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

def clean_slug(name):
    # Cleans names for filenames (lowercase, no special characters, snake_case)
    return name.lower().replace(".", "").replace(" ", "_").replace("(", "").replace(")", "")

def parse_agents_from_list(roster_content):
    """Parses the nested list structure from coding_ai.md"""
    agents = []
    # Split at the main bullet point "- **Role:**"
    raw_splits = re.split(r"(?m)^-\s+\*\*Role:\*\*\s+", roster_content)

    for chunk in raw_splits[1:]:
        role_match = re.match(r"(.*?)$", chunk, re.MULTILINE)
        role = role_match.group(1).strip() if role_match else "Unknown Role"

        name_match = re.search(r"-\s+\*\*Name:\*\*\s+(.*?)$", chunk, re.MULTILINE)
        name = name_match.group(1).strip() if name_match else "Unknown Name"

        # Simplify name (e.g., "Marjin (or ...)" -> "Marjin")
        simple_name = name.split("(")[0].strip()

        full_body = f"- **Role:** {role}\n" + chunk

        agents.append({
            "name": simple_name,
            "full_name": name,
            "role": role,
            "body": full_body
        })
    return agents

def generate_copilot_files(global_header, agents):
    """Generates .github structure for GitHub Copilot"""
    print(f"📝 Generating GitHub Copilot Config in {BASE_DIR}...")
    agents_dir = os.path.join(BASE_DIR, "agents")
    ensure_dir(agents_dir)

    table_rows = []
    for agent in agents:
        slug = clean_slug(agent["name"]).replace("_", "-")
        cmd = f"`@{slug}`"
        table_rows.append(f"| **{agent['name']}** | {cmd} | {agent['role']} |")

    agent_table = "\n".join(table_rows)

    global_content = f"""# Spacemacs Maintainer Framework

{global_header}

## 🧭 Agent Router

| Agent | Command | Specialization |
| :--- | :--- | :--- |
{agent_table}
"""
    with open(os.path.join(BASE_DIR, "copilot-instructions.md"), "w", encoding="utf-8") as f:
        f.write(global_content)

    for agent in agents:
        slug = clean_slug(agent["name"]).replace("_", "-")
        path = os.path.join(agents_dir, f"{slug}.agent.md")

        yaml = f"---\nname: {slug}\ndescription: {agent['role']}\n---"
        content = f"{yaml}\n\n# Identity: {agent['name']}\n{agent['body']}"

        with open(path, "w", encoding="utf-8") as f:
            f.write(content)

def generate_gemini_commands(global_header, agents):
    """Generates .toml files for Gemini CLI Slash Commands"""
    print(f"💎 Generating Gemini CLI Commands in {GEMINI_CMD_DIR}...")
    ensure_dir(GEMINI_CMD_DIR)

    for agent in agents:
        slug = clean_slug(agent["name"])

        # 1. Profile Check
        profile_path = None
        # Look for a key in the mapping that is contained in the slug
        for key, path in PROFILE_MAP.items():
            if key in slug:
                profile_path = path
                break

        # 2. Build TOML Content
        toolbox_section = ""
        if profile_path:
            toolbox_section = f"""
---
TOOLBOX (AUTO-LOADED):
!{{cat {profile_path}}}
"""
        else:
            # For Marjin, Dok etc.
            toolbox_section = """
---
TOOLBOX:
(No profile loaded automatically. If you need code, please ensure the user provided the context or load a profile manually via !{cat ai/profile_NAME.md}.)
"""

        prompt_text = f"""
SYSTEM INSTRUCTIONS (GLOBAL):
{global_header}

---
AGENT PERSONA:
{agent['body']}
{toolbox_section}
---
USER INPUT:
{{{{args}}}}
"""

        clean_desc = agent['role'].replace('"', "'")

        # Build TOML manually
        toml_content = f'description = "{clean_desc}"\n'
        toml_content += 'prompt = """' + prompt_text + '"""\n'

        filename = f"{slug}.toml"
        path = os.path.join(GEMINI_CMD_DIR, filename)

        with open(path, "w", encoding="utf-8") as f:
            f.write(toml_content)

def main():
    if not os.path.exists(SOURCE_FILE):
        print(f"❌ Error: {SOURCE_FILE} not found.")
        print(f"   (Searched in: {SCRIPT_DIR})")
        return

    print(f"🚀 Reading {SOURCE_FILE}...")
    with open(SOURCE_FILE, "r", encoding="utf-8") as f:
        full_content = f.read()

    split_marker = "### The Specialist Team Roster"
    if split_marker not in full_content:
        print("❌ Error: Marker '### The Specialist Team Roster' not found.")
        return

    global_header = full_content.split(split_marker)[0].strip()
    roster_content = full_content.split(split_marker)[1].strip()

    agents = parse_agents_from_list(roster_content)
    print(f"ℹ️  {len(agents)} agents found.")

    # 1. Copilot
    generate_copilot_files(global_header, agents)

    # 2. Gemini
    generate_gemini_commands(global_header, agents)

    print("\n✅ Done! Structure created for:")
    print(f"   📂 .github/agents/        (GitHub Copilot: @spacky)")
    print(f"   📂 .gemini/commands/      (Gemini CLI: /spacky)")

    print("\n👉 Usage Guide:")
    print("   1. GitHub Copilot: Use 'copilot in root, then type '@spacky refactor this'")
    print("   2. Gemini CLI:     Run 'gemini' in root, then type '/spacky refactor this'")

if __name__ == "__main__":
    main()
