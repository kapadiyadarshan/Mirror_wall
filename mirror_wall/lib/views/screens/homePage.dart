import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/controller/webPage_controller.dart';
import 'package:mirror_wall/utils/color_utils.dart';
import 'package:mirror_wall/utils/route_utils.dart';
import 'package:mirror_wall/views/components/BottomSheet.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WebPageController>(builder: (context, provider, _) {
      return PopScope(
        canPop: provider.getCanPopValue,
        onPopInvoked: (didPop) {
          provider.canPopCheck();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Mirror Wall",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MyRoute.bookMarkPage);
                },
                icon: const Icon(
                  Icons.list,
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                    provider.browserURL,
                  ),
                ),
                onLoadStart: (controller, url) {
                  provider.initController(controller: controller);
                },
                onLoadStop: (controller, url) {
                  provider.initController(controller: controller);
                },
                onProgressChanged: (controller, progress) {
                  provider.loading(pro: progress);
                },
              ),
              provider.progressValue < 1
                  ? Container(
                      child: LinearProgressIndicator(
                        value: provider.progressValue,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          bottomNavigationBar: Container(
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return MyBottomShhet(context: context);
                      },
                    );
                  },
                  icon: const Column(
                    children: [
                      Icon(
                        Icons.search_rounded,
                      ),
                      Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.addBookMark();

                    if (provider.getBookMarkValue) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            "Add BookMark !!",
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: MyColor.theme1,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Remove Bookmark !!",
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.redAccent,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  icon: Column(
                    children: [
                      Icon(
                        provider.getBookMarkValue
                            ? Icons.bookmark_remove
                            : Icons.bookmark_add,
                      ),
                      const Text(
                        "Bookmark",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: provider.getCanBack
                      ? () {
                          provider.back();
                        }
                      : null,
                  icon: const Column(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                      ),
                      Text(
                        "Back ",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.refresh();
                  },
                  icon: const Column(
                    children: [
                      Icon(
                        Icons.refresh,
                      ),
                      Text(
                        "Refresh",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: provider.getCanForward
                      ? () {
                          provider.forward();
                        }
                      : null,
                  icon: const Column(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                      ),
                      Text(
                        "Forward",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
