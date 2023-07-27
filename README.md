### Risk Analise
  the main reason of this application is to validate a transaction. 
  and respond if it is kinda a possible chargeback.
### dependencies
 - RUBY VERSION 2.7.3 
 - POSTGRESS 9.6

## prepare database 
  * change .env with database host config

  - Development
    rake db:drop db:create db:migrate
  - tests
    RACK_ENV=test rake db:drop db:create db:migrate

## run tests
  rspec -fd

## run server
  ruby src/app -s puma 

### Understand the Industry
  ## Explain the money flow and the information flow in the acquirer market and the role of the main players.
  
  ## Explain the difference between acquirer, sub-acquirer and payment gateway and how the flow explained in question 1 changes for these players.

  ## Explain what chargebacks are, how they differ from cancellations and what is their connection with fraud in the acquiring world.

### Get your hands dirty
  ## Analyze the data provided and present your conclusions (consider that all transactions are made using a mobile device).
  ## In addition to the spreadsheet data, what other data would you look at to try to find patterns of possible frauds?
