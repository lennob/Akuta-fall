EKG-mallar (JSON)

Plats:
  Lennartshemsida/ekg-templates/

Så funkar det:
  - ecg-lab.html läser in mallar från: ./ekg-templates/index.json
  - Varje mall är en egen JSON-fil med fältet "patch" som innehåller inställningar att lägga på DEFAULTS.

Lägga till en mall:
  1) Skapa en ny fil i denna mapp, t.ex. my-template.json
  2) Lägg till den i index.json under "templates" med id/label/file
  3) Ladda om ecg-lab.html (Ctrl+F5 om cache strular)

Ta bort en mall:
  - Ta bort raden i index.json (och radera filen om du vill)

Mall-format (ekg-template.v1):
  {
    "schema": "ekg-template.v1",
    "id": "sinus",
    "label": "Sinusrytm (normal)",
    "patch": {
      "template": "sinus",
      "rhythm": "Sinusrytm",
      "hr": 75,
      "prMs": 160,
      "qrsMs": 90,
      "qtMs": 400,
      "axisDeg": 60,
      "linkAxis": "off",
      "pqrst": { ... },
      "leads": { ... }
    }
  }

Alternativt (snabbt sätt):
  - Du kan också lägga in en exporterad EKG-JSON från EKG-labb (schema: "ekg-lab.v1") som mallfil.
  - ecg-lab.html läser då "settings" och använder dem som patch automatiskt.

Obs:
  - Detta är en statisk site: webbläsaren kan inte spara direkt i projektmappen.
  - Du redigerar mallfilerna i VS Code/utforskaren, och ecg-lab laddar in dem via fetch när sidan körs via HTTP (t.ex. Live Server).
