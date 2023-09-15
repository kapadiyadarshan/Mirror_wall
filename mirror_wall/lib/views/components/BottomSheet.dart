import 'package:flutter/material.dart';
import 'package:mirror_wall/controller/webPage_controller.dart';
import 'package:mirror_wall/utils/color_utils.dart';
import 'package:provider/provider.dart';

Widget MyBottomShhet({required BuildContext context}) {
  return Consumer<WebPageController>(builder: (context, provider, _) {
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
              trailing: Icon(
                provider.browser == "google"
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: MyColor.theme1,
              ),
              onTap: () {
                provider.changeBrowser(browserName: "google");
                // Navigator.pop(context);
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
              trailing: Icon(
                provider.browser == "bring"
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: MyColor.theme1,
              ),
              onTap: () {
                provider.changeBrowser(browserName: "bring");
                // Navigator.pop(context);
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
              trailing: Icon(
                provider.browser == "duckduckGO"
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: MyColor.theme1,
              ),
              onTap: () {
                provider.changeBrowser(browserName: "duckduckGO");
                // Navigator.pop(context);
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
              trailing: Icon(
                provider.browser == "yahoo"
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: MyColor.theme1,
              ),
              onTap: () {
                provider.changeBrowser(browserName: "yahoo");
                // Navigator.pop(context);
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
              trailing: Icon(
                provider.browser == "brave"
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: MyColor.theme1,
              ),
              onTap: () {
                provider.changeBrowser(browserName: "brave");
                // Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  });
}
