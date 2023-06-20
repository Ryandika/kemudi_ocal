import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_regist/models/question_models.dart';

class DBConnect {
  //push data ke url firbase
  final url = Uri.parse(
      'https://kemudi-1db2a-default-rtdb.asia-southeast1.firebasedatabase.app/question.json');

  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json.encode({
          'title': question.title,
          'options': question.options,
        }));
  }

  //fetch data ke app
  Future<List<Question>> fetchQuestion() async {
    //get data dan print ke halaman app
    return http.get(url).then((response) {
      //setelah di get maka akan di return dengan fuction then

      //convert data dengan map <dynamic> format lalu diconvert ke map<string>
      var data = json.decode(response.body) as Map<String, dynamic>;

      //list data yang sudah di masukan pada index
      List<Question> newQuestionList = [];

      //untuk pair question tambahkan key, value
      data.forEach((key, value) {
       

        var newQuestion = Question(
          id: key,
          title: value['title'], //title dari question
          options: Map.castFrom(value['options']), //option dari question
        );

        //masukan data yang sudah di mapping ke list
        newQuestionList.add(newQuestion);

        // print(newQuestionList);
      });
      return newQuestionList;
    });
  }
}