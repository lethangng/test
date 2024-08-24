// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../view_models/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeViewModel homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List data'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // SvgPicture.network(
          //   'https://upload.wikimedia.org/wikipedia/commons/6/6c/SVG_Simple_Icon.svg',
          //   placeholderBuilder: (BuildContext context) => const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // ),
          // CachedNetworkImage(
          //   imageUrl:
          //       'https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png',
          //   height: 100,
          //   fit: BoxFit.cover,
          //   placeholder: (context, url) => const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          // ),
          // Image.network(
          //     'https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png',
          //     height: 100, loadingBuilder: (
          //   BuildContext context,
          //   Widget child,
          //   ImageChunkEvent? loadingProgress,
          // ) {
          //   if (loadingProgress == null) return child;
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }),
          Expanded(
            child: Obx(
              () => SmartRefresher(
                controller: homeViewModel.refreshController,
                enablePullUp: true,
                physics: const BouncingScrollPhysics(),
                // header: CustomHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = const Text("Kéo lên để tải thêm.");
                    } else if (mode == LoadStatus.loading) {
                      body = const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CupertinoActivityIndicator(),
                          SizedBox(width: 4),
                          Text('Loading...'),
                        ],
                      );
                    } else if (mode == LoadStatus.failed) {
                      body = const Text("Load Failed! Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = const Text("release to load more");
                    } else {
                      body = const Text('Không còn dữ liệu.');
                    }
                    return SizedBox(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                onRefresh: homeViewModel.onRefresh,
                onLoading: homeViewModel.onLoading,
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: homeViewModel.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final post = homeViewModel.posts[index];
                    final String title = post['title']['rendered'];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(title),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: RefreshIndicator(
          //     onRefresh: () => homeViewModel.refreshPosts(),
          //     child: Obx(
          //       () => ListView.builder(
          //         physics: const BouncingScrollPhysics(),
          //         padding: const EdgeInsets.all(20),
          //         controller: homeViewModel.scrollController,
          //         itemCount: homeViewModel.isLoading.value
          //             ? homeViewModel.posts.length + 1
          //             : homeViewModel.posts.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           if (index < homeViewModel.posts.length) {
          //             final post = homeViewModel.posts[index];
          //             final String title = post['title']['rendered'];
          //             return Card(
          //               child: ListTile(
          //                 leading: CircleAvatar(child: Text('${index + 1}')),
          //                 title: Text(title),
          //               ),
          //             );
          //           } else {
          //             return const Center(
          //               child: CircularProgressIndicator(),
          //             );
          //           }
          //         },
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
