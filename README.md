# waffarha_challenge!!
[Screenshot_1685711270](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/cf7e3307-e17f-4dfb-8e2d-4f32c02374a2)



  <img src="https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/cf7e3307-e17f-4dfb-8e2d-4f32c02374a2" height="100" width="100" >

 <img src="https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/143864e1-e486-4c8e-aa7f-23fa9fb61ce9" height="100" width="100" >

 <img src="https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/5d1add83-4bd5-4481-b3d9-b1b966729b84" height="100" width="100" >

  
 <img src="https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/92e19e72-92b2-4ffd-ade1-f972ca65c20a" height="100" width="100" >

 
 <img src="https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/345e0c9a-7cdb-4e85-be8b-08fbe0dfbef2" height="100" width="100" >

 
 

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
