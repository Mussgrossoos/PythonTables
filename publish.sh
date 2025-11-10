#!/bin/bash

# PyPI Publishing Script für Console Table Library

set -e  # Exit on error

echo "📦 Console Table Library - PyPI Publishing"
echo "=========================================="
echo ""

# Prüfe ob wir im richtigen Verzeichnis sind
if [ ! -f "setup.py" ]; then
    echo "❌ Fehler: setup.py nicht gefunden. Bitte führe das Script im Projekt-Root aus."
    exit 1
fi

# Prüfe ob twine und build installiert sind
if ! python3 -c "import twine" 2>/dev/null; then
    echo "📥 Installiere twine und build..."
    pip3 install twine build || python3 -m pip install twine build
fi

# Alte Builds entfernen
echo "🧹 Entferne alte Builds..."
rm -rf dist/ build/ *.egg-info console_table.egg-info

# Package bauen
echo "🔨 Baue Package..."
python3 -m build

if [ ! -d "dist" ] || [ -z "$(ls -A dist/)" ]; then
    echo "❌ Fehler: Build fehlgeschlagen. Keine Distribution-Dateien gefunden."
    exit 1
fi

echo ""
echo "✅ Build erfolgreich!"
echo ""
ls -lh dist/
echo ""

# Frage nach TestPyPI oder direkt PyPI
echo "Wohin möchtest du hochladen?"
echo "1) TestPyPI (empfohlen für ersten Test)"
echo "2) PyPI (echte Veröffentlichung)"
read -p "Wähle (1 oder 2): " CHOICE

if [ "$CHOICE" = "1" ]; then
    echo ""
    echo "📤 Lade auf TestPyPI hoch..."
    echo "   Du wirst nach deinen TestPyPI-Credentials gefragt."
    echo "   Falls du noch keinen Account hast: https://test.pypi.org/account/register/"
    echo ""
    python3 -m twine upload --repository testpypi dist/*
    
    echo ""
    echo "✅ Erfolgreich auf TestPyPI hochgeladen!"
    echo ""
    echo "🧪 Teste die Installation:"
    echo "   pip install --index-url https://test.pypi.org/simple/ console-table-lib"
    echo ""
    echo "🌐 TestPyPI Seite: https://test.pypi.org/project/console-table-lib/"
    
elif [ "$CHOICE" = "2" ]; then
    echo ""
    echo "⚠️  WARNUNG: Du lädst jetzt auf die ECHTE PyPI hoch!"
    echo "   Stelle sicher, dass:"
    echo "   - Alle Tests bestehen"
    echo "   - Die Version korrekt ist"
    echo "   - README.md vollständig ist"
    echo ""
    read -p "Bist du sicher? (j/n): " CONFIRM
    
    if [ "$CONFIRM" != "j" ] && [ "$CONFIRM" != "J" ]; then
        echo "❌ Abgebrochen."
        exit 0
    fi
    
    echo ""
    echo "📤 Lade auf PyPI hoch..."
    echo "   Du wirst nach deinen PyPI-Credentials gefragt."
    echo "   Falls du noch keinen Account hast: https://pypi.org/account/register/"
    echo ""
    python3 -m twine upload dist/*
    
    echo ""
    echo "✅ Erfolgreich auf PyPI hochgeladen!"
    echo ""
    echo "🎉 Die Bibliothek ist jetzt verfügbar unter:"
    echo "   pip install console-table-lib-lib"
    echo ""
    echo "🌐 PyPI Seite: https://pypi.org/project/console-table-lib-lib/"
    echo ""
    echo "⏳ Es kann ein paar Minuten dauern, bis die Bibliothek verfügbar ist."
    
else
    echo "❌ Ungültige Auswahl. Abgebrochen."
    exit 1
fi

