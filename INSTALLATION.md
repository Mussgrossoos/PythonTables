# Installation Guide - Console Table Library

## Aktuelle Situation

Die Bibliothek ist **noch nicht auf PyPI veröffentlicht**, daher funktioniert `pip install console-table-lib-lib` noch nicht.

## Verfügbare Installation-Methoden

### 1. Lokale Installation (für Entwicklung)

```bash
cd "/Users/christian/N8N Context Test/Python lol"
pip install -e .
```

**Vorteil:** Änderungen am Code werden sofort übernommen (editable install)

### 2. Von GitHub installieren (nach GitHub-Upload)

Nachdem du das Repository auf GitHub hochgeladen hast:

```bash
# Von GitHub installieren
pip install git+https://github.com/YOUR_USERNAME/console-table.git

# Oder mit spezifischer Version
pip install git+https://github.com/YOUR_USERNAME/console-table.git@v2.0.0
```

**Vorteil:** Andere können die Bibliothek direkt von GitHub installieren

### 3. Direkt verwenden (ohne Installation)

```bash
cd "/Users/christian/N8N Context Test/Python lol"
python3 -c "from console_table import create; create(['Test']).add_row('OK').display()"
```

Oder in deinem Python-Script:

```python
import sys
sys.path.insert(0, '/Users/christian/N8N Context Test/Python lol')

from console_table import create
create(['Test']).add_row('OK').display()
```

### 4. Auf PyPI veröffentlichen (für `pip install console-table-lib-lib`)

Um `pip install console-table-lib-lib` zu ermöglichen, musst du die Bibliothek auf PyPI veröffentlichen.

**Schritte:**
1. Siehe `PUBLISH.md` für detaillierte Anleitung
2. Oder führe aus: `./publish.sh`

## Empfohlener Workflow

### Für Entwicklung:
```bash
pip install -e .
```

### Für Verteilung (nach GitHub-Upload):
```bash
# Andere können dann installieren mit:
pip install git+https://github.com/YOUR_USERNAME/console-table.git
```

### Für öffentliche Verteilung:
```bash
# Auf PyPI veröffentlichen (siehe PUBLISH.md)
# Dann funktioniert:
pip install console-table-lib
```

## Zusammenfassung

| Methode | Befehl | Verfügbar für |
|---------|--------|---------------|
| Lokal | `pip install -e .` | Nur lokal |
| GitHub | `pip install git+https://github.com/...` | Nach GitHub-Upload |
| PyPI | `pip install console-table-lib-lib` | Nach PyPI-Veröffentlichung |

**Aktuell:** Nutze `pip3 install -e .` für lokale Entwicklung!

