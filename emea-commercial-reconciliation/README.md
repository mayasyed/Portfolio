# EMEA Commercial Revenue Reconciliation

A commercial data reconciliation project built in Microsoft Excel, simulating the kind of multi-market, multi-currency revenue validation work common in media and advertising operations.

**Headline result: 48 matches, 32 flagged for review, 17 escalated across 100 records covering 7 EMEA markets and 10 partner agencies.**

🔗 [View in Google Sheets](https://docs.google.com/spreadsheets/d/1Ie-t5AwX5xTFWl-XOcmikoPioKNgRpgBFY_QCLhQAY0)

---

## Background

This project uses a fictional dataset representing H1 2024 commercial revenue records between a streaming platform and its media agency partners across France, Germany, Italy, Netherlands, Spain, Sweden, and the UK. Each row represents a reported revenue figure from an agency alongside the corresponding invoice amount, which in a real commercial team would need to be reconciled before payment is authorised.

The raw data was deliberately messy to reflect what real operational data often looks like before any cleaning has been done.

---

## What the raw data looked like

The raw dataset had 100 rows and the following problems:

- **Market name inconsistency** — Germany appeared as Germany, DE, Deutschland interchangeably. Sweden appeared as Sweden, SE, and sweden. The UK appeared as UK, U.K., and United Kingdom. The Netherlands appeared as NL, Netherlands, and The Netherlands.
- **Date format inconsistency** — the same month appeared in at least five different formats including Jan-24, January 2024, 01/2024, Jan-2024, and March 2024.
- **Mixed currencies without conversion** — records were a mix of GBP and EUR with no consistent handling. Some rows had currency symbols embedded in the numeric revenue field (£36,966.96 in a number column).
- **Status field inconsistency** — confirmed, CONFIRMED, and Confirmed were all present, as were disputed, Disputed, and DISPUTED.
- **Duplicate row** — Row 14 appeared twice in the raw data.
- **Missing values** — three rows had no invoice amount (rows 12, 34, and 56), and two rows had no market recorded.
- **Blank row** — a completely empty row sat between rows 49 and 50.

---

## What was done to fix it

**Sheet 2 (Cleaned Data)** addresses every issue above:

- All market names standardised to a single consistent label per country using a lookup mapping table
- All dates normalised to MMM-YYYY format (e.g. Jan-2024)
- Currency symbols stripped from numeric fields
- All status values normalised to title case
- The duplicate row removed
- Missing invoice amounts flagged explicitly as MISSING rather than left blank or zeroed
- A Data_Issue_Flag column added to label each row as Clean, or to describe the specific issue

**FX conversion** was applied using real approximate month-end EUR to GBP exchange rates for January through June 2024. A dedicated FX_Rates reference sheet holds the rates, and the cleaned data uses a VLOOKUP to pull the correct rate per row based on the original currency and month, converting all figures into a single GBP base for comparison.

---

## Reconciliation logic

Sheet 3 calculates the variance between Reported_Revenue_GBP and Invoice_Amount_GBP for each record and assigns a status:

- **Match** — variance is zero
- **Review** — variance exists but below the escalation threshold
- **Escalate** — variance exceeds the threshold, requiring active follow-up

Rows with missing invoice amounts are included with a status of Missing Invoice rather than being excluded, so they remain visible as outstanding items.

---

## What the output shows

**Summary Dashboard (Sheet 4)** breaks down the results three ways:

- **By market** — Germany had the highest reported revenue at £1.44M. France showed the largest negative variance at -16%, driven partly by the three missing invoice rows inflating reported revenue without a corresponding invoice amount.
- **By agency** — Hearts & Science showed the largest positive variance at 11.28%, suggesting invoices consistently exceeding reported figures. IPG Mediabrands showed a -1.52% variance.
- **By month** — January was the highest volume month at £1.45M reported revenue. Variances were relatively consistent across the period with no single month showing a significant outlier.

**Escalation Log (Sheet 5)** lists all 17 escalated records with market, agency, month, variance amount, and placeholder columns for action owner and resolution date, ready for a commercial team to action.

---

## Skills demonstrated

- Data cleaning and standardisation in Excel
- Multi-currency FX conversion using VLOOKUP and reference tables
- Variance analysis and threshold-based status assignment
- SUMIF-based aggregation across multiple dimensions
- Dashboard design with conditional formatting
- Structured escalation logging

---

## Files

| File | Description |
|---|---|
| Task_1_EMEA_Commercial_Reconciliation.xlsx | Full workbook with all 6 sheets |
| [Google Sheets version](https://docs.google.com/spreadsheets/d/1Ie-t5AwX5xTFWl-XOcmikoPioKNgRpgBFY_QCLhQAY0) | Key sheets replicated in Google Sheets |
