# waffarha_challenge

#### functionalties: 
- fetching data from api paginated
- sort data on photo title &abumId
- paginate the data when user reach limit  
- handle loading state & Empty state & failure
#### code architecture 
- the code is divided into two main parts [core, features], core contains all the shared files enables app to do some stuff like [calling apis] 
we can say that core is an abstraction for calling apis and some services like logger, Crashlytics extc,
- the features directory where i put all the files for the feature to work like [presentation layer, logic layer] 
- the flow is ui calling logic and logic talks to data layer for remote call 
- get it is used for dependency injection beside cubit for state manegment
