# 📊 Progetto SQL + Power BI: Analisi vendite ECommerce di prodotti di informatica (Aprile 2026)

## 🔗 Scarica file per visualizzare la dashboard : https://github.com/Maria2595/Analisi-vendite-sql/raw/main/SALES_DASHBOARD.pbix
** Non ho pubblicato la dashboard live per motivi di policy di sicurezza

📁 Contenuto repository

Analisi-vendite-sql/
├── Dashboard/
│   └── SALES_DASHBOARD.pbix          # Dashboard Power BI
├── AnalisiSQL/
│   └── Script.sql                    # Query: segmentazione, KPI, trend
├── KaggleDataset/
│   └── ecommerce_dataset.csv         # Dataset originale (Kaggle)
└── README.md

## 📝 Descrizione
L’open dataset contiene dati delle vendite di un ECommerce di prodotti di informatica in 35 stati in 3 anni (dal 2020 al 2022)
Il trend mensile delle vendite mostra il carattere di stagionalità dove nel periodo da febbraio a giugno si registrano le vendite più alte dell’anno.
Per analizzare le differenze nei vari stati ho stabilito dei range di vendite annuali in questo modo:

|   Categoria         |          Range        |
|---------------------| ----------------------|
| Low Sales           |     70000 - 100000    |
| Medium Sales        |     100000 - 300000   |
| Upper Medium Sales  |     300000 - 500000   |
| High Sales          |     500000 - 1000000  |
| Top Sales           |         > 1000000     |


## 🛠️ Strumenti usati
- Excel / CSV (Per estrazione giorno, mese, anno e successivo upload del file csv in DBeaver)
- SQL (SQLite, DBeaver)
- Power BI

## 📈 Insight principali
- ** Insight 1: - **Low, Medium e Upper Medium Sales:** vendite in aumento negli ultimi due anni, ma **margine di profitto in diminuzione**
  **Ipotesi (in assenza di dati su promozioni):** sconti aggressivi che hanno eroso i margini

### Insight 2 – Il segmento più efficiente
- **High Sales:** vendite e margine di profitto in costante aumento
- Modello di efficienza da imitare per gli altri segmenti
  
- ** Insight 3: ** Segmento con performance peggiore
- ** Top Sales:** calo delle vendite e del margine di profitto negli ultimi due anni
- Richiede analisi approfondita

- ** Insight 4: ** Stagionalità 
- Trend con picchi da febbraio a giugno comune a tutti gli stati

## ⚠️ Limiti dichiarati (trasparenza sull'analisi)

 Non è possibile individuare gli elementi che causano i trend osservati in quanto perchè mancano i seguenti dati:
 - Promozioni attive nel periodo
- Azioni dei competitor
- Eventi di marketing specifici

**Cosa servirebbe per andare oltre:**  
Integrare i dati attuali con fonti esterne o qualitative per identificare i fattori causali.

## 💻 Snippet SQL (esempio)

Ecco un esempio della query utilizzata per segmentare gli stati in base alle vendite annuali:

-- CLASSIFICAZIONE STATI
select distinct State_Code as State,
       Year,
       sum(Total_sales) as Revenue,
       case
       	when sum(Total_Sales) < 100000 then 'Low Sales'
       	when sum(Total_Sales) > 100000 and sum(Total_Sales) < 300000 then 'Medium Sales'
       	when sum(Total_Sales) > 300000 and sum(Total_Sales) < 500000 then 'Upper Medium Sales'
       	when sum(Total_Sales) > 500000 and sum(Total_Sales) < 1000000 then 'High Sales'
       	when sum(Total_Sales) > 1000000 then 'Top Sales'
       end as Sales_Performance
from sales 
group by 1, 2 
order by 2;


