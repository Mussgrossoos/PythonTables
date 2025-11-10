# GitHub Deployment Guide

## Schritt 1: Git Repository initialisieren

```bash
cd "/Users/christian/N8N Context Test/Python lol"
git init
```

## Schritt 2: Alle Dateien hinzufügen

```bash
git add .
```

## Schritt 3: Ersten Commit erstellen

```bash
git commit -m "Initial commit: Console Table Library v2.0.0"
```

## Schritt 4: GitHub Repository erstellen

1. Gehe zu https://github.com/new
2. Repository-Name: `console-table` (oder dein gewünschter Name)
3. Beschreibung: "Eine umfassende und dennoch verdammt einfache Python-Bibliothek zur Erstellung von gut formatierten Tabellen in der Konsole"
4. Wähle **Public** oder **Private**
5. **NICHT** "Initialize with README" ankreuzen (wir haben schon eine)
6. Klicke auf "Create repository"

## Schritt 5: Remote Repository hinzufügen

```bash
# Ersetze YOUR_USERNAME mit deinem GitHub-Username
git remote add origin https://github.com/YOUR_USERNAME/console-table.git
```

## Schritt 6: Auf GitHub hochladen

```bash
git branch -M main
git push -u origin main
```

## Optional: GitHub CLI verwenden

Falls du GitHub CLI installiert hast:

```bash
gh repo create console-table --public --source=. --remote=origin --push
```

## Nach dem Upload

1. Gehe zu deinem Repository auf GitHub
2. Aktualisiere die URLs in:
   - `setup.py` (Zeile mit `url=`)
   - `pyproject.toml` (project.urls)
   - `README.md` (falls Links vorhanden)

## Releases erstellen

Nach dem ersten Upload kannst du Releases erstellen:

1. Gehe zu "Releases" → "Create a new release"
2. Tag: `v2.0.0`
3. Titel: `v2.0.0 - Initial Release`
4. Beschreibung: Siehe CHANGELOG.md
5. "Publish release" klicken

