European data status
================

## Truth data

### Cases and deaths

We evaluate forecasts of cases and deaths against [Johns Hopkins
University data](https://github.com/CSSEGISandData/COVID-19), and we
recommend using this dataset as the basis for forecasts.

  - Daily numbers of cases and deaths are available to download from
    [JHU](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series),
    or from [our
    repository](https://github.com/epiforecasts/covid19-forecast-hub-europe/data-truth).
  - JHU also provide [country
    metadata](https://github.com/CSSEGISandData/COVID-19/blob/master/csse_covid_19_data/UID_ISO_FIPS_LookUp_Table.csv),
    including population counts and ISO-3 codes.

Note there are some differences between the format of the JHU data and
what we require in a forecast. Please check the
[Wiki](https://github.com/epiforecasts/covid19-forecast-hub-europe/wiki/Targets-and-horizons#truth-data)
for more on forecast formatting.

#### Potential issues in the JHU dataset

As of 2022-03-20

| country        | created    | updated    | issue                                                                                             | message                                                 | url                                                      |
| :------------- | :--------- | :--------- | :------------------------------------------------------------------------------------------------ | :------------------------------------------------------ | :------------------------------------------------------- |
| france         | 2022-03-03 | 2022-03-09 | death data is not correct for france: negative value & discrepancy                                | \[JHU Feed\](<https://github.com/CSSEGISandData/COVID>… | <https://github.com/CSSEGISandData/COVID-19/issues/5489> |
| spain          | 2022-03-01 | 2022-03-01 | negative data entry for country spain, france                                                     | Hi, There are many negative entries on a dataset …      | <https://github.com/CSSEGISandData/COVID-19/issues/5480> |
| poland         | 2022-02-23 | 2022-02-24 | poland data now includes reinfections                                                             | Thanks to the help of @jbracher and @eMaerthin, we…     | <https://github.com/CSSEGISandData/COVID-19/issues/5456> |
| france         | 2022-02-21 | 2022-02-21 | some wrong cases for france in the past two weeks                                                 | Hi, I noted some mistakes in the daily cases for F…     | <https://github.com/CSSEGISandData/COVID-19/issues/5433> |
| germany        | 2022-02-01 | 2022-02-01 | official sources for germany                                                                      | Dear all, since you cite a newspaper as your sour…      | <https://github.com/CSSEGISandData/COVID-19/issues/5327> |
| germany        | 2022-02-01 | 2022-02-01 | discrepancy in germany new cases data of 29th & 30th jan.                                         | For Germany, As per the \[feed\](<https://github.com/>… | <https://github.com/CSSEGISandData/COVID-19/issues/5324> |
| united kingdom | 2022-01-28 | 2022-01-28 | united kingdom data to include reinfections january 31, 2022: upcoming spikes in cases and deaths | Please see the below text from the \[UK Coronavirus…    | <https://github.com/CSSEGISandData/COVID-19/issues/5310> |
| switzerland    | 2022-01-27 | 2022-01-27 | the covid cases are inaccurate for switzerland                                                    | The new cases on 24th Jan is 87,281, which is quit…     | <https://github.com/CSSEGISandData/COVID-19/issues/5301> |
| austria        | 2022-01-23 | 2022-01-23 | incorrect data for 19/01/2022 to 22/01/2022 for austria                                           | I originally filed this against ourworldindata as …     | <https://github.com/CSSEGISandData/COVID-19/issues/5279> |

Open issues updated over the last eight weeks: from [JHU CSSEGISandData
Github](https://github.com/CSSEGISandData/COVID-19/)

### Hospitalisations

We gather general hospital admissions data from various sources. See
separate [Hospitalisations
README](https://github.com/epiforecasts/covid19-forecast-hub-europe/tree/main/code/auto_download/hospitalisations#readme).

Hospitalisation data can be difficult to produce and interpret, and is
not consistent across all the countries in the ECDC Forecast Hub. To
keep data and forecasts consistent, we include hospitalisations
forecasts for the following locations only:

  - Belgium, Croatia, Cyprus, Czechia, Denmark, Estonia, France,
    Iceland, Ireland, Latvia, Liechtenstein, Malta, Norway, Slovenia,
    Switzerland, United Kingdom

![Plot of truth data from different sources for all countries covered by
the forecast hub](plots/hospitalisations.svg)

The Hub validates and evaluates forecasts against the single dataset in
[ECDC/truth\_ECDC-Incident
Hospitalizations.csv](ECDC/truth_ECDC-Incident%20Hospitalizations.csv).
While we provide raw data files with multiple sources for
hospitalisation data in each location, this is for reference only to
cover daily as well as weekly data.

#### Data revisions

##### Cases

![Plot of revisions in case data](plots/revisions-Cases.svg)

##### Deaths

![Plot of revisions in case data](plots/revisions-Deaths.svg)

##### Hospitalisations

![Plot of revisions in case data](plots/revisions-Hospitalizations.svg)

## Additional data sources

We do not use or evaluate against these data, but the following might be
useful for modelling targets:

| Data                | Description                                                                                                                              | Source | Link                                                                                                                            |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------- |
| Vaccination         | Number of vaccine doses distributed by manufacturers, number of first, second and unspecified doses administered                         | ECDC   | [Data on COVID-19 vaccination in the EU/EEA](https://www.ecdc.europa.eu/en/publications-data/data-covid-19-vaccination-eu-eea)  |
| Variants of concern | Volume of COVID-19 sequencing, the number and percentage distribution of VOC for each country, week and variant submitted since 2020-W40 | ECDC   | [Data on SARS-CoV-2 variants in the EU/EEA](https://www.ecdc.europa.eu/en/publications-data/data-virus-variants-covid-19-eueea) |
| Testing             | Weekly testing rate and weekly test positivity                                                                                           | ECDC   | [Data on testing for COVID-19 by week and country](https://www.ecdc.europa.eu/en/publications-data/covid-19-testing)            |
