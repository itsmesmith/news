import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news/module/home_page/model/news_model.dart';

class NewsCubit extends Cubit<List<NewsModel>> {
  NewsCubit() : super([]);
  getAllNews() async {
    try {
      final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      final response = await http.Client().get(url);
      final jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        final newsList = List<NewsModel>.from(jsonData.map((x) => NewsModel.fromJson(x)));
        emit(newsList);
      }
    } catch (e) {}
  }
}
