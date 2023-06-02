# waffarha_challenge!


<img src="https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/6587fd14-9da9-4d18-8dea-71aac72a3eaf" alt="alt-text" style="width:desired-width;height:desired-height;">

<img src="[https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/6587fd14-9da9-4d18-8dea-71aac72a3eaf](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/23bd3012-9032-4446-8b3e-c0afbfe2cbe2)" alt="alt-text" style="width:desired-width;height:desired-height;">

<img src="https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/6d0db0f7-672d-4957-a78a-9cca8bfe1b32" alt="alt-text" style="width:desired-width;height:desired-height;">


#### functionalties: ![Screenshot_1685711293](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/6587fd14-9da9-4d18-8dea-71aac72a3eaf)
![Capture](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/23bd3012-9032-4446-8b3e-c0afbfe2cbe2)
![Screenshot_1685711270](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/50044dee-6c4a-483a-8bae-5a238ef34749)
![Screenshot_1685711276](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/792520ab-ffb1-4866-90aa-a2a7cf32280c)
![Screenshot_1685711279](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/e74b71cd-5d8b-4fd8-8204-96b7d751ad9a)
![Screenshot_1685711284](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/934bb301-060b-47b6-94dc-b41f4fbfe7c0)
![Screenshot_1685711290](https://github.com/monaGamal2022/Waffarha-Flutter-Challenge/assets/109663539/6d0db0f7-672d-4957-a78a-9cca8bfe1b32)

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
