# Console Table Library - Schnellstart

## Installation

```bash
pip install -r requirements.txt
```

## Super einfache Verwendung

```python
from console_table import create

# Einfachste Verwendung
create(["Name", "Alter", "Stadt"]) \
    .add_row("Max Mustermann", 28, "Berlin") \
    .add_row("Anna Schmidt", 32, "München") \
    .display()
```

## Alle Features auf einen Blick

### Basis-Features
- `create(headers)` - Erstellt Tabelle
- `add_row(*args)` - Fügt Zeile hinzu
- `set_footer(*args)` - Fügt Footer hinzu
- `display()` - Zeigt Tabelle an

### Styling
- `set_border_style("single"|"double"|"rounded"|"minimal"|"none")`
- `set_alignment("left"|"center"|"right")`
- `set_colors(True/False)` - Aktiviert Farben
- `set_theme("default"|"dark"|"light"|"colorful")`
- `color_row(row_index, "green")` - Färbt Zeile
- `color_cell(row, col, "red")` - Färbt Zelle

### Datenmanipulation
- `sort(column_index, reverse=False)` - Sortiert nach Spalte
- `filter(lambda row: row[1] == "Berlin")` - Filtert Zeilen
- `clear_filter()` - Entfernt Filter
- `page(page_size)` - Aktiviert Pagination
- `next_page()` / `prev_page()` - Navigation

### Import/Export
- `from_csv("datei.csv")` - Lädt aus CSV
- `from_json("datei.json")` - Lädt aus JSON
- `to_csv("datei.csv")` - Exportiert nach CSV
- `to_json("datei.json")` - Exportiert nach JSON

## Komplettes Beispiel

```python
from console_table import create

create(["Monat", "Umsatz", "Gewinn"]) \
    .set_border_style("rounded") \
    .set_colors(True) \
    .set_theme("colorful") \
    .add_row("Januar", 50000, 12000) \
    .add_row("Februar", 55000, 13500) \
    .add_row("März", 60000, 15000) \
    .set_footer("Gesamt", 165000, 40500) \
    .sort(1, reverse=True) \
    .display()
```

**Die Verwendung ist verdammt einfach!** 🚀


