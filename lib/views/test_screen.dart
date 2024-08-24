import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Item extends StatefulWidget {
  final String title;

  const Item({super.key, required this.title});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Card(
        margin: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
        child: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}

//only ListView
class OnlyListView extends StatefulWidget {
  const OnlyListView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnlyListViewState();
  }
}

class _OnlyListViewState extends State<OnlyListView> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<String> data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];

  Widget buildCtn() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Item(
          title: data[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        physics: const BouncingScrollPhysics(),
        // header: CustomHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("pull up load");
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
              body = const Text("No more Data");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        onRefresh: () async {
          //monitor fetch data from network
          await Future.delayed(const Duration(milliseconds: 1000));

          for (int i = 0; i < 10; i++) {
            // data.add("Item $i");
          }

          if (mounted) setState(() {});
          _refreshController.refreshCompleted();

          /*
          if(failed){
           _refreshController.refreshFailed();
          }
        */
        },
        onLoading: () async {
          //monitor fetch data from network
          await Future.delayed(const Duration(milliseconds: 2000));
          for (int i = 0; i < 10; i++) {
            data.add("Item $i");
          }
          if (mounted) setState(() {});
          _refreshController.loadFailed();
        },
        child: buildCtn(),
      ),
    );
  }
}
