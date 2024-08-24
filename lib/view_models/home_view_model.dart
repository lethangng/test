import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeViewModel extends GetxController {
  final RxList posts = [].obs;
  int _page = 1;
  final int _limit = 10;

  // final ScrollController scrollController = ScrollController();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> fetchPosts() async {
    String url =
        'https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=$_limit&page=$_page';
    final Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // Valid response
      final json = jsonDecode(response.body) as List;
      posts.addAll(json);
      posts.refresh();
    } else {
      debugPrint('Unexpected response');
      // print('Unexpected response');
    }
  }

  void onLoading() async {
    _page++;
    await fetchPosts();
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    _page = 1;
    posts.value = [];
    await fetchPosts();
    refreshController.refreshCompleted();
    // if(failed){
    //   refreshController.refreshFailed();
    // }
  }

  // Future<void> _scrollListener() async {
  //   if (isLoading.value) return;
  //   if (scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) {
  //     // debugPrint('Call');
  //     isLoading.value = true;
  //     _page++;
  //     await fetchPosts();
  //     isLoading.value = false;
  //   } else {
  //     // debugPrint('Don\'t call');
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    // scrollController.addListener(_scrollListener);
    fetchPosts();
  }
}
