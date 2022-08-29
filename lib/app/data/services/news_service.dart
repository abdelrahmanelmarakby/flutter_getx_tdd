import 'package:flutter_getx_tdd/app/data/models/articles_model.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class NewsService {
  // Simulating a remote database
  final _articles = List.generate(
    10,
    (_) => Article(
      title: lorem(paragraphs: 1, words: 3),
      content: lorem(paragraphs: 10, words: 500),
    ),
  );

  Future<List<Article>> getArticles() async {
    await Future.delayed(const Duration(seconds: 1));
    return _articles;
  }
}
