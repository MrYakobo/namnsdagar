# Namnsdagar

Den här repon är till för att scrapa namnsdagar från Svenska Akademin.

CSV-filerna är public domain, för jag tror verkligen att namnlistan är det också. Svenska Akademin ger ut det fritt, och är ganska offenligt. Gött e de.

---------------------------

Högtider är följande dagar:

- Allhelgonadagen
- Johannes Döparens dag
- Juldagen
- Kyndelsmässodagen
- Marie Bebådelsedag
- Nyårsdagen
- Skottdagen
- Tjugondedag jul
- Trettondedag jul
- Värnlösa barns dag

## all.csv

Kolumner:

- `Namn`
- `Dag` (1-31)
- `Månad` (1-12)
- `Ingår i namnlängden` (Ja / Nej)
- `Typ` (Högtid / Namn)

## högtider.csv

`all.csv` där `Typ == "Högtid"`

Kolumner:

- `Namn`
- `Dag` (1-31)
- `Månad` (1-12)
- `Ingår i namnlängden` (Ja / Nej)

## namnsdag.csv

`all.csv` där `Typ == "Namn"`

Kolumner:

- `Namn`
- `Dag` (1-31)
- `Månad` (1-12)
- `Ingår i namnlängden` (Ja / Nej)

## namnlängd.csv

`namnsdag.csv` där `Ingår i namnlängden == "Ja"`

Kolumner:

- `Namn`
- `Dag` (1-31)
- `Månad` (1-12)