import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/controller/webPage_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WebPageController>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Mirror Wall"),
          centerTitle: true,
          actions: [
            Visibility(
              visible: provider.getCanBack,
              child: IconButton(
                onPressed: () {
                  provider.back();
                },
                icon: const Icon(CupertinoIcons.back),
              ),
            ),
            Visibility(
              visible: provider.getCanForward,
              child: IconButton(
                onPressed: () {
                  provider.forward();
                },
                icon: const Icon(CupertinoIcons.forward),
              ),
            ),
          ],
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(
              provider.searchEngineURL ??
                  "https://www.google.com/webhp?authuser=2",
            ),
          ),
          onLoadStart: (controller, url) {
            provider.initController(controller: controller);
          },
          onLoadStop: (controller, url) {
            provider.initController(controller: controller);
          },
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
                      return Container(
                        height: 500,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                suffixIcon: const Icon(
                                  Icons.search,
                                  size: 24,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                provider.changeSearchEngine(index: 0);
                              },
                              child: const Text("Google"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                provider.changeSearchEngine(index: 1);
                              },
                              child: const Text("MicroSoft Edge"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                provider.changeSearchEngine(index: 2);
                              },
                              child: const Text("DuckDuck GO"),
                            ),
                          ],
                        ),
                      );
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
                onPressed: () {},
                icon: const Column(
                  children: [
                    Icon(
                      Icons.bookmark,
                    ),
                    Text(
                      "Bookmark",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  provider.back();
                },
                icon: const Column(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
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
                onPressed: () {
                  provider.forward();
                },
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
      );
    });
  }
}
