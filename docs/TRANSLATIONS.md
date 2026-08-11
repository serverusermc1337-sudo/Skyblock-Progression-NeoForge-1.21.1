# FTB Quests translations

## Files

| File | Language |
|------|----------|
| `config/ftbquests/quests/lang/en_us.snbt` | English |
| `config/ftbquests/quests/lang/de_de.snbt` | German (Deutsch) |

## How to use

1. Copy the whole `config/ftbquests` folder into your instance.
2. Set Minecraft language to **Deutsch (Deutschland)** for `de_de`.
3. Run `/ftbquests reload` (or restart).

FTB Quests picks `lang/<code>.snbt` from the quests folder based on the client language.

## Keys covered (German)

- All chapter groups (Kaltstart, Stabilisieren, Wrack-Protokoll, …)
- All chapter titles
- Full **Cold Start** + **Stabilize** quest titles and descriptions
- Starter quests for Wreck Protocol, Industry Afloat, Bastion

## Adding more languages

Copy `en_us.snbt` → e.g. `fr_fr.snbt` / `es_es.snbt` and translate values only. Keep keys identical.
