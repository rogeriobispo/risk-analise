### Risk Analise

the main reason of this application is to validate a transaction.
and respond if it is kinda a possible chargeback.

### dependencies

- RUBY VERSION 2.7.3
- POSTGRESS 9.6

## prepare database

- change .env with database host config
- create database with docker compose
  - docker compose up -d postgres

* Development
  - rake db:drop db:create db:migrate
* tests
  - RACK_ENV=test rake db:drop db:create db:migrate

## run tests

- rspec -fd

## run server

- ruby src/app -s puma

## Coverage

![coverage](https://github.com/rogeriobispo/risk-analise/blob/main/__markdown/coverage.png)

# Understand the Industry

##### 1. Explain the money flow and the information flow in the acquirer market and the role of the main players.

##### 2. Explain the difference between acquirer, sub-acquirer and payment gateway and how the flow explained in question 1 changes for these players.

##### 3. Explain what chargebacks are, how they differ from cancellations and what is their connection with fraud in the acquiring world.

# Get your hands dirty

##### 1. Analyze the data provided and present your conclusions (consider that all transactions are made using a mobile device).

##### 3. In addition to the spreadsheet data, what other data would you look at to try to find patterns of possible frauds?
