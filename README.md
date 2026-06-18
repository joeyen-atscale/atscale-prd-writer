# prd-writing-guide

A Claude Code skill that applies the **AtScale PRD-writing playbook** for enterprise B2B data-platform PMs — drafting, reviewing, and structuring Product Requirements Documents for semantic-layer, data-platform, and analytics-infrastructure features.

## What it does

Invoke `/prd-writing-guide` when you want to:

- Draft a new PRD for a feature, capability, or platform increment
- Review a peer's PRD before approval
- Split a too-large PRD into properly-scoped pieces
- Pick the right artifact — PRD vs RFC vs One-Pager vs Design Doc vs Tech Spec
- Write or critique a problem statement (Customer Pain Test)
- Define success metrics (primary / secondary / guardrail)
- Scope explicit non-goals
- Write Given/When/Then acceptance criteria
- Specify migration / API-versioning requirements
- Resolve multi-persona conflicts (operator vs consumer, CDO vs analyst)
- Run the 7-block PRD review checklist

## What's inside

The skill encodes:

- **14-section PRD template** — Metadata, Problem Statement, Goals/Non-Goals, User Stories, Requirements, Success Metrics, UX, Technical Considerations, Migration/Compatibility, API Specification, Security/Compliance, GTM, Open Questions, Milestones, Appendix
- **Artifact decision tree** — when a One-Pager, RFC, PRD, Design Doc, or Tech Spec is the right artifact
- **Goldilocks requirements** — testable, MUST/SHOULD/MAY, what-not-how
- **Customer Pain Test** — WHO + WHAT (job-to-be-done) + WHY + quantified impact
- **Inverted-pyramid structure** — multi-audience readability (exec stops at goals; eng reads requirements; platform reads API/migration)
- **Enterprise migration contract** — no surprise breakage, deprecation runway, migration tooling, rollback
- **Seven anti-patterns** to reject during review
- **Multi-persona operator/consumer pairs** — every analyst capability needs an admin control plane

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/joeyen-atscale/prd-writing-guide/main/install.sh | bash
```

Or from a local checkout:

```bash
git clone https://github.com/joeyen-atscale/prd-writing-guide.git
cd prd-writing-guide
bash install.sh
```

Both drop `/prd-writing-guide` into `~/.claude/skills/`.

## Prerequisites

- **git**
- **[Claude Code](https://claude.ai/code)** (CLI or IDE extension)

No Python, no build step. The skill is pure Markdown.

## Related skills

- [`/pybuilder`](https://github.com/joeyen-atscale/pybuilder) — once you have a PRD, use this to build the Python project from it
