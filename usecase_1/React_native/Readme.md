# Run test

 
## Android
0.  Установити залежності   `npm install`
1.  Під'єднати девайс  до компютера  (бажано відключити  інтернет)
2.  зібрати  релізний білд   `./gradlew assembleRelease`  з  `android`  папки 
3.   запуск appium server  `npm run start:appium` 
4.  запуск e2e тестів   `npm run test:e2e:android`

## iOS
0. становити залежності   `npm install`
1. Під'єднати девайс  до компютера  (бажано відключити  інтернет)
2.  зібрати  релізний білд  `react-native run-ios --configuration Release`
3.  запуск appium server   `npm run start:appium`  or open the desktop application
4.  запуск e2e тестів  `npm run test:e2e:ios`