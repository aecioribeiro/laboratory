import 'package:flutter_test/flutter_test.dart';
import 'package:laboratory/data/articles_model.dart';

void main() {
  test(
    "test lazy model",
    () {
      final model = ArticlesModel(
        title: "Article title",
        urlToImage: "https://placehold.co/600x400",
      );

      assert(model.title == "Article title", true);

      expect(model.urlToImage, startsWith("https"));
    },
  );
}
