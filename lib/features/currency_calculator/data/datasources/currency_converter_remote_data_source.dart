import 'package:http/http.dart' as http;
import '../../../../core/error/failure.dart';
import '../models/converter_response.dart';

///this class makes calls directly to the api
abstract class ConverterRemoteDataSource {
  ///gets results from endpoint and returns the model
  ///or throws server exception if error
  Future<ConverterResponse> getCurrencyRate(String currency);
}

class ConverterRemoteDataSourceImpl implements ConverterRemoteDataSource {
  ConverterRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<ConverterResponse> getCurrencyRate(String currency) async {
    final response = await client.get(
      Uri.parse('http://data.fixer.io/api/latest?access_key=b641a6e48ddbb9bff685fe3b058136be&symbols=$currency&format=1'),
    );

    if (response.statusCode == 200) {
      var converterResponse = converterResponseFromJson(response.body);
      return converterResponse;
    } else {
      throw ServerException();
    }
  }
}