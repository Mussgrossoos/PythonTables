#!/bin/bash

# Saubere GitHub-Update-Funktion für Package-Name-Änderung
# Aktualisiert alle Dateien und pusht auf GitHub

set -e  # Exit on error

echo "🔄 Console Table Library - GitHub Update"
echo "========================================"
echo ""

# Prüfe ob wir im richtigen Verzeichnis sind
if [ ! -f "setup.py" ]; then
    echo "❌ Fehler: setup.py nicht gefunden. Bitte führe das Script im Projekt-Root aus."
    exit 1
fi

# Prüfe ob Git initialisiert ist
if [ ! -d .git ]; then
    echo "❌ Git Repository nicht gefunden. Initialisiere..."
    git init
fi

# Alten Namen und neuen Namen
OLD_NAME="console-table"
NEW_NAME="console-table-lib"

echo "📝 Aktualisiere alle Dateien von '$OLD_NAME' zu '$NEW_NAME'..."
echo ""

# Liste der Dateien, die aktualisiert werden müssen
FILES_TO_UPDATE=(
    "README.md"
    "PUBLISH.md"
    "INSTALLATION.md"
    "DEPLOY.md"
    "GITHUB_UPLOAD.sh"
    "publish.sh"
)

# Aktualisiere README.md
if [ -f "README.md" ]; then
    echo "  ✓ README.md"
    # Ersetze nur in Installation-Befehlen, nicht in Beschreibungen
    sed -i '' "s/pip install console-table/pip install console-table-lib/g" README.md 2>/dev/null || \
    sed -i "s/pip install console-table/pip install console-table-lib/g" README.md
fi

# Aktualisiere PUBLISH.md
if [ -f "PUBLISH.md" ]; then
    echo "  ✓ PUBLISH.md"
    sed -i '' "s/pip install console-table/pip install console-table-lib/g" PUBLISH.md 2>/dev/null || \
    sed -i "s/pip install console-table/pip install console-table-lib/g" PUBLISH.md
    sed -i '' "s/console-table/console-table-lib/g" PUBLISH.md 2>/dev/null || \
    sed -i "s/console-table/console-table-lib/g" PUBLISH.md
fi

# Aktualisiere INSTALLATION.md
if [ -f "INSTALLATION.md" ]; then
    echo "  ✓ INSTALLATION.md"
    sed -i '' "s/pip install console-table/pip install console-table-lib/g" INSTALLATION.md 2>/dev/null || \
    sed -i "s/pip install console-table/pip install console-table-lib/g" INSTALLATION.md
fi

# Aktualisiere DEPLOY.md
if [ -f "DEPLOY.md" ]; then
    echo "  ✓ DEPLOY.md"
    sed -i '' "s/console-table/console-table-lib/g" DEPLOY.md 2>/dev/null || \
    sed -i "s/console-table/console-table-lib/g" DEPLOY.md
fi

# Aktualisiere GITHUB_UPLOAD.sh
if [ -f "GITHUB_UPLOAD.sh" ]; then
    echo "  ✓ GITHUB_UPLOAD.sh"
    sed -i '' "s/console-table/console-table-lib/g" GITHUB_UPLOAD.sh 2>/dev/null || \
    sed -i "s/console-table/console-table-lib/g" GITHUB_UPLOAD.sh
fi

# Aktualisiere publish.sh
if [ -f "publish.sh" ]; then
    echo "  ✓ publish.sh"
    sed -i '' "s/console-table/console-table-lib/g" publish.sh 2>/dev/null || \
    sed -i "s/console-table/console-table-lib/g" publish.sh
fi

# Aktualisiere QUICKSTART.md falls vorhanden
if [ -f "QUICKSTART.md" ]; then
    echo "  ✓ QUICKSTART.md"
    sed -i '' "s/pip install console-table/pip install console-table-lib/g" QUICKSTART.md 2>/dev/null || \
    sed -i "s/pip install console-table/pip install console-table-lib/g" QUICKSTART.md
fi

echo ""
echo "✅ Alle Dateien aktualisiert!"
echo ""

# Prüfe Git Status
echo "📊 Git Status:"
git status --short
echo ""

# Frage ob committen
read -p "💾 Änderungen committen? (j/n): " COMMIT_CHOICE

if [ "$COMMIT_CHOICE" = "j" ] || [ "$COMMIT_CHOICE" = "J" ]; then
    echo ""
    echo "📝 Erstelle Commit..."
    
    # Füge alle geänderten Dateien hinzu
    git add -u
    
    # Füge neue Dateien hinzu falls vorhanden
    git add FIX_NAME.md NAME_OPTIONS.md 2>/dev/null || true
    
    # Erstelle Commit
    git commit -m "Rename package to console-table-lib

- Changed package name from console-table to console-table-lib
- Updated all documentation and scripts
- Reason: console-table already exists on PyPI
- Installation: pip install console-table-lib
- Import remains: from console_table import create" || {
        echo "⚠️  Keine Änderungen zum Committen oder Commit fehlgeschlagen"
    }
    
    echo ""
    echo "✅ Commit erstellt!"
    echo ""
    
    # Prüfe ob Remote existiert
    if git remote get-url origin &>/dev/null; then
        REMOTE_URL=$(git remote get-url origin)
        echo "🌐 Remote Repository gefunden: $REMOTE_URL"
        echo ""
        
        read -p "📤 Auf GitHub pushen? (j/n): " PUSH_CHOICE
        
        if [ "$PUSH_CHOICE" = "j" ] || [ "$PUSH_CHOICE" = "J" ]; then
            echo ""
            echo "📤 Pushe auf GitHub..."
            
            # Stelle sicher, dass wir auf main branch sind
            git branch -M main 2>/dev/null || true
            
            # Pushe
            if git push -u origin main; then
                echo ""
                echo "✅ Erfolgreich auf GitHub gepusht!"
                echo ""
                echo "🌐 Repository: $REMOTE_URL"
            else
                echo ""
                echo "❌ Fehler beim Pushen!"
                echo ""
                echo "💡 Mögliche Lösungen:"
                echo "   1. Prüfe deine GitHub-Authentifizierung"
                echo "   2. Stelle sicher, dass das Repository existiert"
                echo "   3. Versuche manuell: git push -u origin main"
            fi
        else
            echo ""
            echo "ℹ️  Änderungen sind committed, aber noch nicht gepusht."
            echo "   Führe aus: git push -u origin main"
        fi
    else
        echo ""
        echo "ℹ️  Kein Remote Repository konfiguriert."
        echo ""
        echo "📝 Um ein Remote hinzuzufügen:"
        echo "   git remote add origin https://github.com/YOUR_USERNAME/console-table-lib.git"
        echo "   git push -u origin main"
        echo ""
        echo "   Oder führe aus: ./GITHUB_UPLOAD.sh"
    fi
else
    echo ""
    echo "ℹ️  Änderungen wurden nicht committed."
    echo "   Du kannst sie manuell committen mit:"
    echo "   git add -u"
    echo "   git commit -m 'Rename package to console-table-lib'"
fi

echo ""
echo "✨ Fertig!"
echo ""
echo "📋 Zusammenfassung:"
echo "   - Package-Name: console-table-lib"
echo "   - Installation: pip install console-table-lib"
echo "   - Import: from console_table import create"
echo ""

