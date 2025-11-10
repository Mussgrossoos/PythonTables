# Pip-Problem gelöst! ✅

## Das Problem

Du hast `pip` verwendet, aber auf deinem System heißt es `pip3`.

## Lösung

Verwende immer **`pip3`** statt `pip`:

```bash
# ❌ Falsch:
pip install twine build

# ✅ Richtig:
pip3 install twine build
```

## Alternative: python3 -m pip

Du kannst auch immer `python3 -m pip` verwenden:

```bash
python3 -m pip install twine build
```

## Alias erstellen (optional)

Falls du immer `pip` statt `pip3` schreiben möchtest, füge dies zu deiner `~/.zshrc` hinzu:

```bash
echo 'alias pip="pip3"' >> ~/.zshrc
source ~/.zshrc
```

Dann funktioniert `pip` auch.

## Für dieses Projekt

Alle Befehle mit `pip` sollten durch `pip3` ersetzt werden:

```bash
# Installation
pip3 install -e .

# Dependencies
pip3 install -r requirements.txt

# Twine und Build
pip3 install twine build
```

