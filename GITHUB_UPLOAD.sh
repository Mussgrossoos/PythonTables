#!/bin/bash

# GitHub Upload Script für Console Table Library
# Führe dieses Script aus, nachdem du ein GitHub Repository erstellt hast

echo "🚀 Console Table Library - GitHub Upload"
echo "========================================"
echo ""

# Prüfe ob Git initialisiert ist
if [ ! -d .git ]; then
    echo "❌ Git Repository nicht gefunden. Bitte führe zuerst 'git init' aus."
    exit 1
fi

# Frage nach GitHub Username
read -p "📝 Dein GitHub Username: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ Username darf nicht leer sein!"
    exit 1
fi

# Frage nach Repository-Namen
read -p "📝 Repository-Name (Standard: console-table-lib-lib): " REPO_NAME
REPO_NAME=${REPO_NAME:-console-table-lib-lib}

echo ""
echo "📋 Zusammenfassung:"
echo "   Username: $GITHUB_USERNAME"
echo "   Repository: $REPO_NAME"
echo "   URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""

read -p "✅ Ist das korrekt? (j/n): " CONFIRM

if [ "$CONFIRM" != "j" ] && [ "$CONFIRM" != "J" ]; then
    echo "❌ Abgebrochen."
    exit 1
fi

echo ""
echo "🔗 Füge Remote Repository hinzu..."

# Prüfe ob Remote bereits existiert
if git remote get-url origin &>/dev/null; then
    echo "⚠️  Remote 'origin' existiert bereits. Überschreibe..."
    git remote remove origin
fi

git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

echo ""
echo "📤 Pushe auf GitHub..."

# Setze Branch auf main
git branch -M main

# Versuche zu pushen
if git push -u origin main; then
    echo ""
    echo "✅ Erfolgreich auf GitHub hochgeladen!"
    echo ""
    echo "🌐 Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo ""
    echo "📝 Nächste Schritte:"
    echo "   1. Gehe zu deinem Repository auf GitHub"
    echo "   2. Aktualisiere die URLs in setup.py und pyproject.toml"
    echo "   3. Optional: Erstelle ein Release (v2.0.0)"
else
    echo ""
    echo "❌ Fehler beim Pushen!"
    echo ""
    echo "💡 Mögliche Lösungen:"
    echo "   1. Stelle sicher, dass das Repository auf GitHub existiert"
    echo "   2. Prüfe deine GitHub-Authentifizierung"
    echo "   3. Erstelle das Repository manuell auf GitHub und versuche es erneut"
    echo ""
    echo "📖 Siehe DEPLOY.md für manuelle Anweisungen"
fi

