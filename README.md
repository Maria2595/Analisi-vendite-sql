# 📊 Progetto SQL + Power BI: Analisi vendite ECommerce di prodotti di informatica (Aprile 2026)

## 🔗 Scarica file per visualizzare la dashboard : https://github.com/Maria2595/Analisi-vendite-sql/raw/main/SALES_DASHBOARD.pbix

## 📁 Contenuto repository
File .sqlite con le query per effettuare le analisi
Dasboard interattivva .pbix
Open Dataset ECommerce (Kaggle)

## 📝 Descrizione
L’open dataset contiene dati delle vendite di un ECommerce di prodotti di informatica in 35 stati in 3 anni (dal 2020 al 2022)
Il trend mensile delle vendite mostra il carattere di stagionalità dove nel periodo da febbraio a giugno si registrano le vendite più alte dell’anno.
Per analizzare le differenze nei vari stati ho stabilito dei range di vendite annuali in questo modo:

Categoria                                         Range
Low Sales                                70000 - 100000
Medium Sales                        100000 - 300000
Upper Medium Sales            300000 - 500000
High Sales                               500000 - 1000000
Top Sales                                 > 1000000


## 🛠️ Strumenti usati
- Excel / CSV (Per estrazione giorno, mese, anno e successivo upload del file csv in DBeaver)
- SQL (SQLite, DBeaver)
- Power BI

## 📈 Insight principali
- ** Insight 1: ** Necessario analisi approfondita per i segmenti ‘Low Sales’, ‘Medium Sales’ e ‘Upper Medium Sales’ in quanto l’aumento delle vendite degli ultimi due anni ha registrato una diminuzione del margine di profitto per cui, in mancanza di ulteriori dati, è utile ipotizzare delle promozioni importanti che hanno però eroso i margini.
- ** Insight 2: ** Il segmento High Sales ha mostrato i risultati migliori con aumento delle vendite negli ultimi due anni e aumento del margine di profitto.
- ** Insight 3: ** Il segmento Top Sales ha registrato un calo delle vendite e del margine di profitto negli ultimi due anni. 
- ** Insight 4: ** Come già visibile dalla dashboard è presente il carattere di stagionalità in tutti gli stati 
** Limiti: ** mancanza di dati su operazioni di vendita, promozioni, azioni dei competitor 

## 📈 ## Perché questo è comunque un risultato
1. ** Certifica il fatto: ** sappiamo che le vendite sono cresciute ed alcuni stati necessitando di analisi approfondite
2. ** Fissa una baseline: ** avere una baseline permette di confrontare eventuali analisi future con questo periodo
3. ** Indica una direzione: ** i risultati di alcuni segmenti necessitano ulteriori analisi e la categoria ‘High Sales’ indica un’individuazione del target dei clienti più efficiente. 



