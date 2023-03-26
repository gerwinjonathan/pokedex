import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stocks/config/constant.dart';

mixin BaseServices on GetxServiceMixin {
  postService(String url, Map map) async {
    try {
      final response = await http.post(Uri.parse(url), body: map);
      debugPrint("$url: Response: ${jsonDecode(response.body)}");
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  getService(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      debugPrint("$url: Response: ${jsonDecode(response.body)}");
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
