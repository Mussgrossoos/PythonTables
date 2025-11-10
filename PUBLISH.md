# PyPI Veröffentlichung - Console Table Library

## Warum funktioniert `pip install console-table-lib-lib-lib` nicht?

Die Bibliothek ist noch nicht auf PyPI (Python Package Index) veröffentlicht. Sie existiert nur lokal auf deinem Computer.

## Optionen

### Option 1: Lokale Installation (aktuell verfügbar)

```bash
cd "/Users/christian/N8N Context Test/Python lol"
pip install -e .
```

Das installiert die Bibliothek lokal für Entwicklung.

### Option 2: Von GitHub installieren (nach GitHub-Upload)

Nachdem du das Repository auf GitHub hochgeladen hast:

```bash
pip install git+https://github.com/YOUR_USERNAME/console-table-lib-lib.git
```

### Option 3: Auf PyPI veröffentlichen (für `pip install console-table-lib-lib-lib`)

## PyPI Veröffentlichung - Schritt für Schritt

### Voraussetzungen

1. **PyPI Account erstellen:**
   - Gehe zu https://pypi.org/account/register/
   - Erstelle einen Account
   - Notiere Username und Passwort

2. **TestPyPI Account erstellen (für Tests):**
   - Gehe zu https://test.pypi.org/account/register/
   - Erstelle einen Account
   - (Kann gleiche Daten wie PyPI verwenden)

3. **twine installieren:**
   ```bash
   pip3 install twine build
   # oder
   python3 -m pip install twine build
   ```

### Schritt 1: Package bauen

```bash
cd "/Users/christian/N8N Context Test/Python lol"

# Alte Builds entfernen
rm -rf dist/ build/ *.egg-info

# Package bauen
python -m build
```

Das erstellt:
- `dist/console-table-lib-2.0.0.tar.gz` (Source Distribution)
- `dist/console_table-2.0.0-py3-none-any.whl` (Wheel)

### Schritt 2: Auf TestPyPI testen (empfohlen)

```bash
# Upload auf TestPyPI
python -m twine upload --repository testpypi dist/*

# Test-Installation
pip install --index-url https://test.pypi.org/simple/ console-table-lib
```

### Schritt 3: Auf PyPI veröffentlichen

```bash
# Upload auf PyPI (echte Veröffentlichung)
python -m twine upload dist/*
```

Du wirst nach deinen PyPI-Credentials gefragt:
- Username: dein PyPI-Username
- Password: dein PyPI-Passwort (oder API Token)

### Schritt 4: Testen

Nach ein paar Minuten sollte es funktionieren:

```bash
pip install console-table-lib-lib
```

## Automatisches Script

Ich erstelle dir ein Script, das alles automatisch macht:

```bash
./publish.sh
```

## Wichtige Hinweise

1. **Version erhöhen:** Bei Updates die Version in `console_table/__init__.py` und `setup.py` erhöhen
2. **Beschreibung:** Stelle sicher, dass README.md vollständig ist
3. **Tests:** Führe Tests aus bevor du veröffentlichst: `pytest tests/`
4. **LICENSE:** Stelle sicher, dass LICENSE-Datei vorhanden ist

## Nach der Veröffentlichung

- Die Bibliothek ist dann verfügbar unter: `pip install console-table-lib-lib-lib`
- PyPI-Seite: `https://pypi.org/project/console-table-lib-lib/`
- Installation funktioniert weltweit!

