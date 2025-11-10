"""
Erweiterte Beispiele für die Console Table Library
Demonstriert alle neuen Features bei einfacher Verwendung
"""

from console_table import create

print("=" * 70)
print("BEISPIEL 1: Einfachste Verwendung (wie vorher)")
print("=" * 70)
print()

create(["Name", "Alter", "Stadt"]) \
    .add_row("Max Mustermann", 28, "Berlin") \
    .add_row("Anna Schmidt", 32, "München") \
    .display()

print()
print("=" * 70)
print("BEISPIEL 2: Mit Footer")
print("=" * 70)
print()

create(["Produkt", "Preis", "Lager"]) \
    .add_row("Laptop", 999.99, 5) \
    .add_row("Maus", 29.99, 20) \
    .add_row("Tastatur", 79.99, 15) \
    .set_footer("Gesamt", 1109.97, 40) \
    .display()

print()
print("=" * 70)
print("BEISPIEL 3: Mit Farben und Theme")
print("=" * 70)
print()

create(["Status", "Anzahl", "Prozent"]) \
    .set_colors(True) \
    .set_theme("colorful") \
    .add_row("Erfolgreich", 150, "75%") \
    .add_row("Fehler", 30, "15%") \
    .add_row("Warnung", 20, "10%") \
    .display()

print()
print("=" * 70)
print("BEISPIEL 4: Sortierung")
print("=" * 70)
print()

create(["Team", "Punkte", "Tore"]) \
    .add_row("Bayern München", 45, 38) \
    .add_row("Borussia Dortmund", 42, 35) \
    .add_row("RB Leipzig", 40, 32) \
    .add_row("Bayer Leverkusen", 38, 30) \
    .sort(1, reverse=True) \
    .display()

print()
print("=" * 70)
print("BEISPIEL 5: Filterung")
print("=" * 70)
print()

create(["Name", "Alter", "Stadt"]) \
    .add_row("Max Mustermann", 28, "Berlin") \
    .add_row("Anna Schmidt", 32, "München") \
    .add_row("Peter Müller", 25, "Berlin") \
    .add_row("Lisa Weber", 35, "Hamburg") \
    .filter(lambda row: row[2] == "Berlin") \
    .display()

print()
print("=" * 70)
print("BEISPIEL 6: Pagination")
print("=" * 70)
print()

table = create(["ID", "Name", "Wert"])
for i in range(1, 21):
    table.add_row(i, f"Item {i}", i * 10)

print("Seite 1 (5 Einträge pro Seite):")
table.page(5).display()

print("\nSeite 2:")
table.next_page().display()

print()
print("=" * 70)
print("BEISPIEL 7: Zeilen- und Zellfarben")
print("=" * 70)
print()

create(["Produkt", "Status", "Preis"]) \
    .set_colors(True) \
    .color_row(0, "green") \
    .color_row(1, "yellow") \
    .color_row(2, "red") \
    .color_cell(0, 2, "bold green") \
    .add_row("Laptop", "Verfügbar", 999.99) \
    .add_row("Maus", "Wenig", 29.99) \
    .add_row("Monitor", "Ausverkauft", 299.99) \
    .display()

print()
print("=" * 70)
print("BEISPIEL 8: Kombination aller Features")
print("=" * 70)
print()

create(["Monat", "Umsatz", "Gewinn", "Trend"]) \
    .set_border_style("rounded") \
    .set_alignment("center") \
    .set_colors(True) \
    .set_theme("colorful") \
    .add_row("Januar", 50000, 12000, "↑") \
    .add_row("Februar", 55000, 13500, "↑") \
    .add_row("März", 60000, 15000, "↑") \
    .add_row("April", 58000, 14000, "↓") \
    .set_footer("Gesamt", 223000, 54500, "") \
    .sort(1, reverse=True) \
    .display()

print()
print("=" * 70)
print("BEISPIEL 9: CSV-Export/Import (wird als Kommentar gezeigt)")
print("=" * 70)
print()

# Erstelle Tabelle
table = create(["Name", "Alter", "Stadt"]) \
    .add_row("Max Mustermann", 28, "Berlin") \
    .add_row("Anna Schmidt", 32, "München") \
    .add_row("Peter Müller", 45, "Hamburg")

# Exportiere nach CSV
table.to_csv("example_export.csv")
print("✓ Tabelle nach 'example_export.csv' exportiert")

# Importiere aus CSV
print("\nAus CSV importiert:")
create().from_csv("example_export.csv").display()

print()
print("=" * 70)
print("BEISPIEL 10: JSON-Export/Import")
print("=" * 70)
print()

# Exportiere nach JSON
table.to_json("example_export.json")
print("✓ Tabelle nach 'example_export.json' exportiert")

# Importiere aus JSON
print("\nAus JSON importiert:")
create().from_json("example_export.json").display()

print()
print("=" * 70)
print("FERTIG! Die Verwendung ist verdammt einfach, oder? 😊")
print("=" * 70)


