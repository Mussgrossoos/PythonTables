"""
Beispiel-Code zur Demonstration der Console Table Library
"""

from console_table import create, Table

print("=" * 60)
print("Beispiel 1: Einfache Tabelle mit Headern")
print("=" * 60)
print()

table1 = create(["Name", "Alter", "Stadt"])
table1.add_row("Max Mustermann", 28, "Berlin")
table1.add_row("Anna Schmidt", 32, "München")
table1.add_row("Peter Müller", 45, "Hamburg")
table1.display()

print()
print("=" * 60)
print("Beispiel 2: Tabelle ohne Header")
print("=" * 60)
print()

table2 = create()
table2.add_row("Produkt A", 19.99, "Verfügbar")
table2.add_row("Produkt B", 29.99, "Ausverkauft")
table2.add_row("Produkt C", 15.50, "Verfügbar")
table2.display()

print()
print("=" * 60)
print("Beispiel 3: Tabelle mit Double-Border")
print("=" * 60)
print()

table3 = create(["Team", "Punkte", "Tore"])
table3.set_border_style("double")
table3.add_row("Bayern München", 45, 38)
table3.add_row("Borussia Dortmund", 42, 35)
table3.add_row("RB Leipzig", 40, 32)
table3.display()

print()
print("=" * 60)
print("Beispiel 4: Tabelle mit Rounded-Border und Center-Ausrichtung")
print("=" * 60)
print()

table4 = create(["Monat", "Umsatz", "Gewinn"])
table4.set_border_style("rounded")
table4.set_alignment("center")
table4.add_row("Januar", 50000, 12000)
table4.add_row("Februar", 55000, 13500)
table4.add_row("März", 60000, 15000)
table4.display()

print()
print("=" * 60)
print("Beispiel 5: Minimaler Border-Stil")
print("=" * 60)
print()

table5 = create(["ID", "Status", "Priorität"])
table5.set_border_style("minimal")
table5.add_row(1, "Erledigt", "Hoch")
table5.add_row(2, "In Bearbeitung", "Mittel")
table5.add_row(3, "Offen", "Niedrig")
table5.display()

print()
print("=" * 60)
print("Beispiel 6: Method Chaining - Kompakte Syntax")
print("=" * 60)
print()

create(["Sprache", "Verwendung", "Popularität"]) \
    .add_row("Python", "Backend, Data Science", "Sehr hoch") \
    .add_row("JavaScript", "Frontend, Backend", "Sehr hoch") \
    .add_row("Rust", "System Programming", "Wachsend") \
    .display()

print()
print("=" * 60)
print("Beispiel 7: Tabelle mit unterschiedlich langen Texten")
print("=" * 60)
print()

table7 = create(["Kategorie", "Beschreibung", "Wert"])
table7.add_row("Kurz", "Kurzer Text", 100)
table7.add_row("Mittel", "Dies ist ein mittellanger Text", 200)
table7.add_row("Lang", "Dies ist ein sehr langer Text, der automatisch angepasst wird", 300)
table7.display()

print()
print("=" * 60)
print("Beispiel 8: Zahlen und verschiedene Datentypen")
print("=" * 60)
print()

table8 = create(["Typ", "Beispiel", "Wert"])
table8.add_row("Integer", 42, 100)
table8.add_row("Float", 3.14159, 200.5)
table8.add_row("String", "Text", "ABC")
table8.add_row("Boolean", True, False)
table8.display()


