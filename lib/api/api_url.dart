import 'package:fina/api/key_api.dart';

String urlDay =
    'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=$KeyDay';
String urlMonth =
    'https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY&symbol=IBM&apikey=$KeyMonth';
String urlWeek =
    'https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY&symbol=IBM&apikey=$KeyWeek';
String url =
    'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=$KeyApi';

//  + KeyApi;
String url2 =
    'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&tickers=COIN,CRYPTO:BTC,FOREX:USD&time_from=20220410T0130&limit=1000&apikey=$KeyApi2';
