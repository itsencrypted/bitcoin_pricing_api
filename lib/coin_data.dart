import 'dart:convert';
import 'package:http/http.dart' as http;


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'SAI',
  'DAI',
  'LINK',
  'REP',
  'LTC',
];


const coinbaseURL = 'https://api.coinbase.com/v2/prices';


class CoinData {
  Future getCoinData(String selectedCurrency) async {

    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {

      String requestURL = '$coinbaseURL/$crypto-$selectedCurrency/spot';
      http.Response response = await http.get(requestURL);

      print(requestURL);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body)['data']['amount'];
        print(decodedData);
        cryptoPrices[crypto] = decodedData;
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}


//const bitcoinAverageURL =
//    'https://apiv2.bitcoinaverage.com/indices/global/ticker';
//
//const coindeskBTCURL = 'https://api.coindesk.com/v1/bpi/currentprice.json';
//
//class CoinData {
//
//  Map<String, String> cryptoCurrencyMap = {};
//  Future<Map<String, String>> getCoinData(String currency) async {
//    for (String cryptoCoin in cryptoList) {
//      http.Response response =
////      await http.get('$bitcoinAverageURL/$cryptoCoin$currency');
//      await http.get('$coindeskBTCURL');
//
//      if (response.statusCode == 200) {
//        String data = response.body;
//        var fetchedCurrencyCoindesk = jsonDecode(data)['bpi']['USD']['rate'];
////        var fetchedCurrencyCoinbase = jsonDecode(data)['data']['rates']['USD'];
//        print(fetchedCurrencyCoindesk);
//        print (cryptoList[0]);
//        cryptoCurrencyMap[cryptoCoin] = fetchedCurrencyCoindesk;
//      } else {
//        print(response.statusCode);
//        throw 'Problem with the get request';
//      }
//    }
//    return cryptoCurrencyMap;
//  }
//}