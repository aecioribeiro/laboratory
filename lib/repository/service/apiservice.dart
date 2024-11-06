import 'package:dio/dio.dart';
import 'package:laboratory/data/articles_model.dart';

class ApiService {
  final dio = Dio();

  Future<ArticlesResponse> fetchArticles({
    page = 1,
    pageSize = 20,
  }) async {
    try {
      dynamic response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=56537b45c1384e46a13bc1a260de5333&pageSize=$pageSize&page=$page");
      return ArticlesResponse.fromJson((response as Response).data);
    } on Exception catch (e) {
      return ArticlesResponse(error: e.toString());
    }
  }
}
