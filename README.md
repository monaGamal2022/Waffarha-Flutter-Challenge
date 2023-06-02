# waffarha_challenge![Screenshot_1685711276](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/56c68271-cef4-49c5-a42f-b0b7f13337c5)
![Screenshot_1685711279](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/260fcc14-2e47-4fd4-933d-55e11b1c2746)
![Screenshot_1685711284](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/dfd74f2e-5235-4e83-b003-0df2940fcd82)
![Screenshot_1685711290](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/62ca5a3e-9c82-4dce-9152-239f4d0542c0)
![Screenshot_1685711293](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/08daeee9-f7bb-47da-a9c6-1cc40a97a613)
![Capture](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/a2d96ed5-5877-4e6d-8197-464399bf7248)
![Screenshot_1685711270](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/cb9ff099-cea2-4d2d-b2ba-9a4aecd8ca44)


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
