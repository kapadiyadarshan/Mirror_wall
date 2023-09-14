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
              provider.browserURL,
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
                            const Text(
                              "SearchBar",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "  Search here",
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                suffixIcon: const Icon(
                                  Icons.search,
                                  size: 24,
                                ),
                              ),
                              onFieldSubmitted: (value) {
                                provider.search(data: value);
                                Navigator.pop(context);
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              "Browsers",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Card(
                              child: ListTile(
                                title: const Text(
                                  "Google",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: Image.asset(
                                  "asset/images/google.png",
                                  scale: 1.3,
                                ),
                                tileColor: (provider.browser == "google")
                                    ? Colors.yellow
                                    : null,
                                onTap: () {
                                  provider.changeBrowser(browserName: "google");
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: const Text(
                                  "Microsoft Edge",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: Image.asset(
                                  "asset/images/edge.png",
                                  scale: 1.3,
                                ),
                                tileColor: (provider.browser == "bring")
                                    ? Colors.yellow
                                    : null,
                                onTap: () {
                                  provider.changeBrowser(browserName: "bring");
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: const Text(
                                  "DuckDuckGo",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: Image.asset(
                                  "asset/images/duckduckgo.png",
                                  scale: 1.3,
                                ),
                                tileColor: (provider.browser == "duckduckGO")
                                    ? Colors.yellow
                                    : null,
                                onTap: () {
                                  provider.changeBrowser(
                                      browserName: "duckduckGO");
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: const Text(
                                  "Yahoo",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: Image.asset(
                                  "asset/images/yahoo.png",
                                  scale: 1.3,
                                ),
                                tileColor: (provider.browser == "yahoo")
                                    ? Colors.yellow
                                    : null,
                                onTap: () {
                                  provider.changeBrowser(browserName: "yahoo");
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: const Text(
                                  "Brave",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: Image.asset(
                                  "asset/images/brave.png",
                                  scale: 1.3,
                                ),
                                tileColor: (provider.browser == "brave")
                                    ? Colors.yellow
                                    : null,
                                onTap: () {
                                  provider.changeBrowser(browserName: "brave");
                                  Navigator.pop(context);
                                },
                              ),
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
      );
    });
  }
}
