# waffarha_challenge!
 ![Capture](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/48192218-b785-4dee-ab7e-44fc320dda0d)
![Uploading ![Screenshot_1685711276](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/c408edcd-cfa7-4f2a-84a3-4dd52abb53fa)
Screenshot_1685711270.pn![Up![Screenshot_1685711270](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/39b2ce88-00d1-4127-ba92-2f3348c9d516)
![Screenshot_1685711284](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/780f9528-ccec-4530-8b65-db85992011bc)
![Screenshot_1685711276](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/109c52bc-4096-4551-ab29-ad515e266f2f)
![Screenshot_1685711279](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/9e8ee3b1-d9ac-4b88-8498-783927ee1c09)
![Screenshot_1685711290](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/30c5c758-6e10-4e1a-b70b-a06da9a522e0)
![Screenshot_1685711284](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/9b4b924b-532c-4b01-b998-426b7945c5ed)
![Screenshot_1685711293](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/e9ca10e5-d626-4c89-9b45-09dc1dbb01f1)
![Screenshot_1685711290](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/62e941b2-c5b0-49ac-9f7b-1f50114b7ca7)
![Screenshot_1685711293](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/936b8d7f-7ef5-48af-9e60-a842fc9b51c0)
![Capture](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/00c5c07e-e730-49c1-8467-920816609547)
loading Screenshot_1685711279.png…]()
g…]()

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
