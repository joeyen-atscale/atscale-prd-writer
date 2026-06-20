# atscale-prd-writer

A Claude Code skill that writes and reviews PRDs for enterprise B2B data platforms — the way an AtScale PM would.

## Why it exists

Most PRDs fail the same way. They lead with a solution and reverse-engineer a problem to justify it. They write "fast" and "scalable" and call that a requirement. They collapse what-to-build and how-to-build into one document that serves neither the executive who needs the first nor the engineer who needs the second. And in enterprise B2B they skip the things that actually decide adoption — migration, API stability, the admin control plane behind every analyst feature.

This skill encodes the discipline that catches those failures: problem before solution, requirements in the band that's testable without over-specifying design, and the three enterprise non-negotiables — multi-persona conflict, migration as a product requirement, and API/protocol stability as a customer contract — treated as first-class rather than as afterthoughts.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/joeyen-atscale/atscale-prd-writer/main/install.sh | bash
```

Or from a checkout:

```bash
git clone https://github.com/joeyen-atscale/atscale-prd-writer.git
cd atscale-prd-writer
bash install.sh
```

Both symlink `~/.claude/skills/atscale-prd-writer` to the `skill/` directory, so a `git pull` updates the skill in place. No Python, no build step — the skill is one Markdown file.

**Prerequisites:** `git` and [Claude Code](https://claude.ai/code).

## Use it

Invoke `/atscale-prd-writer` in Claude Code when you're working on a PRD:

- Draft a new PRD, or split one that has grown into several
- Review a peer's PRD before approval
- Pick the right artifact — One-Pager, RFC, PRD, Design Doc, or Tech Spec
- Write or critique a problem statement, define success metrics, scope non-goals
- Write Given/When/Then acceptance criteria
- Specify migration and API-versioning requirements
- Resolve a multi-persona conflict — CDO governance versus analyst flexibility, operator versus consumer

## What's inside

The skill is the playbook, not just a template. The pieces it applies:

- **Artifact decision tree** — when an idea wants a One-Pager ("should we invest"), an RFC ("how should we build"), a PRD ("what/who/why"), a Design Doc ("technical architecture"), or a Tech Spec ("implementation details"). PRD and Design Doc stay separate documents.
- **14-section PRD template** — Metadata, Problem Statement, Goals/Non-Goals, User Stories, Requirements, Success Metrics, UX, Technical Considerations, Migration/Compatibility, API Specification, Security/Compliance, GTM, Open Questions, Milestones, Appendix — each marked Required, Recommended, or As-Needed.
- **Customer Pain Test** — the problem statement should make the affected customer say "yes, that's exactly my problem." WHO + the job they can't do today + why + what it costs them, quantified.
- **Goldilocks requirements** — too vague is "fast," too prescriptive is "Redis 5-min TTL LRU," just right is "p95 <200ms to 10B rows, cold-cache <2s." Specify what, not how. MUST/SHOULD/MAY on every requirement; P0/P1/P2 priority bands.
- **Inverted pyramid** — structured so an executive can stop at goals, engineering and QA read the requirements, and platform engineers read the API and migration sections.
- **Enterprise migration contract** — no surprise breakage, deprecation with runway, migration tooling rather than just documentation, and rollback.
- **Multi-persona pairs** — every consumer capability needs its operator control plane; privilege the operator, because if the data engineer can't configure and debug it, the analyst never gets to use it.
- **Success metrics** — at least one primary, one secondary, one guardrail, each with baseline, target, measurement method, and timeframe.
- **Seven anti-patterns** the review checklist refuses to ship, and a 7-block review pass to find them.

The full playbook — heuristics, the Ship-Independently split test, the hedge-phrase audit, and the worked detail behind each concept — lives in [`skill/SKILL.md`](skill/SKILL.md).

## Related

- [`/pybuilder`](https://github.com/joeyen-atscale/pybuilder) — once the PRD is written, build the Python project from it.
