"""Install Spacemacs AI Agents for GitHub Copilot and Gemini CLI."""

import os
import re

# ==========================================
#  SPACEMACS AGENT BUILDER (V12 - FIX MISSING INSTRUCTIONS)
# ==========================================
# GOAL:
# 1. Include the "The Team: Personas & Activation" block in the System Prompt.
# 2. Parse agents correctly starting from the specific sub-header.
# ==========================================

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
BASE_DIR = ".github"
GEMINI_CMD_DIR = os.path.join(".gemini", "commands")

# Configuration: Source Files and their Start Markers for AGENTS
# The 'marker' here is where the LIST OF AGENTS begins.
# Everything BEFORE this marker is treated as the System Prompt (Header).
SOURCES = [
    {
        "file": "coding_ai.md",
        "marker": "### The Specialist Team Roster",
        "type": "specialist"
    },
    {
        "file": "general_ai.md",
        # CHANGED: Use the sub-header to ensure "The Team" intro is included in header
        "marker": "### Default Universal Persona",
        "type": "strategic"
    },
    {
        "file": "stakeholder_ai.md",
        "marker": "## 1. The Core User Base (The Community)",
        "type": "simulation"
    }
]

# Mapping & Profile logic remains the same...
NAME_MAPPING = {
    "professor": "professor",
    "mckarthy": "professor",
    "kael": "kaelthas",
    "bob": "bob",
    "lector": "lector",
    "freud": "freud",
    "griznak": "griznak",
    "orb": "orb",
    "magos": "magos",
    "scribe": "scribe",
    "reginald": "reginald",
    "kallista": "kallista",
    "spacky": "spacky",
    "bzzrts": "bzzrts",
    "vala": "vala",
    "nexus": "nexus",
    "marjin": "marjin",
    "dok": "dok",
    "golem": "golem",
    "skeek": "skeek",
    "don": "don",
    "chen": "chen",
    "vlad": "vlad",
    "rms": "rms",
    "noobie": "noobie",
    "sarah": "sarah"
}

PROFILE_MAP = {
    "spacky": "ai/profile_elisp.md",
    "bzzrts": "ai/profile_emacs_ui.md",
    "nexus": "ai/profile_layers.md",
    "vala": "ai/profile_ci_github.md",
    "don": "ai/profile_elisp_testing.md",
    "golem": "ai/profile_doc.md"
}

def ensure_dir(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

def clean_slug(name):
    name_lower = name.lower()
    for key, slug in NAME_MAPPING.items():
        if key in name_lower:
            return slug
    return name_lower.split()[0].replace(".", "").replace("'", "").strip()

def parse_agents_from_text(roster_content, source_type):
    agents = []
    # Generic splitter
    raw_splits = re.split(r"(?m)^-\s+\*\*(Role|Name):\*\*\s+", roster_content)

    iterator = iter(raw_splits[1:])
    for key, chunk in zip(iterator, iterator):
        role = "Unknown"
        name = "Unknown"

        # Clean up chunk (remove trailing headers if next section starts)
        # Specifically handle "### Strategic..." headers that might appear between agents
        chunk = re.split(r"(?m)^### ", chunk)[0]

        if key == "Role":
            role = chunk.split("\n")[0].strip()
            name_match = re.search(r"-\s+\*\*Name:\*\*\s+(.*?)$", chunk, re.MULTILINE)
            name = name_match.group(1).strip() if name_match else "Unknown"
        elif key == "Name":
            name = chunk.split("\n")[0].strip()
            role_match = re.search(r"-\s+\*\*Role:\*\*\s+(.*?)$", chunk, re.MULTILINE)
            role = role_match.group(1).strip() if role_match else "Simulation Persona"

        slug_name = clean_slug(name)
        full_body = f"- **{key}:** {chunk.strip()}"

        agents.append({
            "name": name,
            "slug": slug_name,
            "role": role,
            "body": full_body,
            "type": source_type
        })
    return agents

def generate_copilot_files(global_headers, agents):
    print(f"📝 Generating GitHub Copilot Agents in {BASE_DIR}/agents/...")
    agents_dir = os.path.join(BASE_DIR, "agents")
    ensure_dir(agents_dir)

    for agent in agents:
        filename = f"{agent['slug']}.agent.md"
        path = os.path.join(agents_dir, filename)
        yaml = f"---\nname: {agent['slug']}\ndescription: {agent['role']}\n---"
        context = global_headers.get(agent["type"], "")
        content = f"{yaml}\n\n{context}\n\n# Identity: {agent['name']}\n{agent['body']}"

        with open(path, "w", encoding="utf-8") as f:
            f.write(content)

    print(f"   Generated {len(agents)} agent files.")

def generate_gemini_commands(global_headers, agents):
    print(f"💎 Generating Gemini CLI Commands in {GEMINI_CMD_DIR}...")
    ensure_dir(GEMINI_CMD_DIR)

    for agent in agents:
        slug = agent["slug"]
        profile_path = None
        if slug in PROFILE_MAP:
             profile_path = PROFILE_MAP[slug]

        toolbox_section = ""
        if profile_path:
            toolbox_section = f"""
---
TOOLBOX (AUTO-LOADED):
!{{cat {profile_path}}}
"""
        elif agent["type"] == "strategic":
             toolbox_section = """
---
MODE: STRATEGIC PLANNING & ARCHITECTURE
(Focus on high-level design, user stories, and requirements. Use Github MCP if available to read issues.)
"""
        elif agent["type"] == "simulation":
             toolbox_section = """
---
MODE: USER SIMULATION
(Focus on subjective feedback, usability, and constraints. Do not write code.)
"""
        else:
            toolbox_section = """
---
TOOLBOX:
(No specific profile loaded. Ask user to load one if implementation is needed.)
"""

        system_header = global_headers.get(agent["type"], "")
        prompt_text = f"""
SYSTEM INSTRUCTIONS:
{system_header}

---
AGENT PERSONA:
{agent['body']}
{toolbox_section}
---
USER INPUT:
{{{{args}}}}
"""
        clean_desc = agent['role'].replace('"', "'")
        toml_content = f'description = "{clean_desc}"\n'
        toml_content += 'prompt = """' + prompt_text + '"""\n'

        filename = f"{slug}.toml"
        path = os.path.join(GEMINI_CMD_DIR, filename)

        with open(path, "w", encoding="utf-8") as f:
            f.write(toml_content)

    print(f"   Generated {len(agents)} commands.")

def main():
    all_agents = []
    global_headers = {}

    for source in SOURCES:
        file_path = os.path.join(SCRIPT_DIR, source["file"])
        if not os.path.exists(file_path):
            print(f"❌ Error: {file_path} not found.")
            continue

        print(f"🚀 Reading {source['file']}...")
        with open(file_path, "r", encoding="utf-8") as f:
            full_content = f.read()

        if source["marker"] not in full_content:
            print(f"⚠️ Warning: Marker '{source['marker']}' not found in {source['file']}.")
            continue

        # Split logic:
        # Everything BEFORE the marker is the System Prompt (Header)
        # Everything AFTER the marker is the Roster to parse
        header = full_content.split(source["marker"])[0].strip()
        roster = full_content.split(source["marker"])[1].strip()

        # If the marker was a subsection, we might want to include the marker text in the roster?
        # Actually, for parsing, we just need the list.
        # But wait! For general_ai.md, the marker is "### Default Universal Persona".
        # This means the "Strategic & Authoring Roles" section (which follows) needs to be included in the roster.

        # FIX: Ensure we capture ALL agents by simply taking everything after the marker.
        # But since "Strategic & Authoring Roles" comes AFTER "Default Universal Persona", it will be included in `roster`.

        global_headers[source["type"]] = header

        # Parse agents
        agents = parse_agents_from_text(roster, source["type"])
        all_agents.extend(agents)
        print(f"   Found {len(agents)} agents.")

    generate_copilot_files(global_headers, all_agents)
    generate_gemini_commands(global_headers, all_agents)

    print("\n✅ Done! Unified Framework Active.")

if __name__ == "__main__":
    main()
