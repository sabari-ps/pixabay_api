import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:images_app/api_key.dart';
import 'package:images_app/models/image.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'images_store.g.dart';

class ImagesStore = _ImagesStore with _$ImagesStore;

abstract class _ImagesStore with Store {
  final scrlCntrl = ScrollController();
  final keyContrl = TextEditingController();

  @observable
  int currentPage = 1;

  @observable
  int totalPages = 1;

  @observable
  bool dataLoading = false;

  @observable
  List<ImageModel> images = [];

  @action
  Future<void> getImages({required String keyword}) async {
    dataLoading = true;
    String url =
        "$baseAPIUrl?key=$apiKey&q=$keyword&page=$currentPage&per_page=25";

    try {
      http.Response response = await http.get(Uri.parse(url));
      var body = jsonDecode(response.body);
      // log("RESPONSE: ${body['hits']}");
      images = List.from(body['hits'])
          .map(
            (e) => ImageModel.fromJson(e),
          )
          .toList();

      if (body['totalHits'] % 25 == 0) {
        totalPages = body['totalHits'] ~/ 25;
      } else {
        totalPages = (body['totalHits'] / 25).floor() + 1;
      }
      dataLoading = false;
    } on Exception catch (e) {
      log(e.toString());
      dataLoading = false;
    }
  }

  @action
  viewImage({required String url, required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Image.network(
              url,
              fit: BoxFit.cover,
              // loadingBuilder: (context, child, loadingProgress) => Center(
              //   child: CircularProgressIndicator(
              //     value: loadingProgress?.cumulativeBytesLoaded.toDouble(),
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
