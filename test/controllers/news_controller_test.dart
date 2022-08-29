import 'package:flutter_getx_tdd/app/data/models/articles_model.dart';
import 'package:flutter_getx_tdd/app/data/services/news_service.dart';
import 'package:flutter_getx_tdd/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  late MockNewsService mockNewsService;
  late HomeController controller;
  setUp(() {
    mockNewsService = MockNewsService();
    controller = HomeController(mockNewsService);
  });
  test(
    "Check if All intial values are correct",
    () {
      expect(controller.articles, []);
      expect(controller.getIsLoading, false);
    },
  );
  group(
    "Get Articles",
    (() {
      final List<Article> _articles = [
        Article(title: "Test 1", content: "Test 1 content"),
        Article(title: "Test 2", content: "Test 2 content"),
        Article(title: "Test 3", content: "Test 3 content"),
      ];
      void arrengeNewsServiceReturns3Articles() async {
        when(() => mockNewsService.getArticles())
            .thenAnswer((_) async => _articles);
      }

      test('Get Articles using the news service', () async {
        arrengeNewsServiceReturns3Articles();
        controller.getArticles();
        verify(() => mockNewsService.getArticles()).called(1);
      });

      test('''Indicates loading of data,
      sets articles to the ones from the service, 
      indicates that the data is not being loaded anymore
      ''', () async {
        arrengeNewsServiceReturns3Articles();
        final future = controller.getArticles();
        expect(controller.getIsLoading, true);
        await future;
        expect(controller.articles, _articles);
        expect(controller.getIsLoading, false);
      });
    }),
  );
}
