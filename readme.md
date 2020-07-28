# Namnsdagar

Den här repon är till för att scrapa namnsdagar från [Svenska Akademins namnlista](https://www.svenskaakademien.se/svenska-akademien/almanackan/akademialmanackan/namnlista).

CSV-filerna är public domain, för jag tror verkligen att namnlistan är det också. Svenska Akademin ger ut det fritt;
och akademin är ju minst sagt ganska offentlig.

Gött e de

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

En csv-fil utan filtrering. Vanligtvis vill du använda dig av namnlängden eller namnsdagarna.

Kolumner:

- `Namn`
- `Dag` (1-31)
- `Månad` (1-12)
- `Ingår i namnlängden` (Ja / Nej)
- `Typ` (Högtid / Namn)

## namnlängd.csv

Namnlängden är den samling med namn som oftast menas med traditionell "namnsdag".
Det är dessa namn som återfinns i de flesta fysiska kalendrar. 31 december har bara
Sylvester namnsdag i namnlängden.

`Ingår i namnlängden == "Ja" && Typ == "Namn"`

Kolumner:

- `Namn`
- `Dag` (1-31)
- `Månad` (1-12)

## namnsdag.csv

Den "utökade" namnsdaglistan som vanliga namnlängden plus några besläktade namn i sig.
31 december har både Sylvester och Sylve namnsdag.

`Typ == "Namn"`

Kolumner:

- `Namn`
- `Dag` (1-31)
- `Månad` (1-12)
- `Ingår i namnlängden` (Ja / Nej)

## högtider.csv

En lista med högtiderna. 

`Typ == "Högtid"`

Kolumner:

- `Namn`
- `Dag` (1-31)
- `Månad` (1-12)
- `Ingår i namnlängden` (Ja / Nej)
