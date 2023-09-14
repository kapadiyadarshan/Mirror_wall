import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebPageController extends ChangeNotifier {
  late InAppWebViewController _controller;

  List<String> searchEngine = [
    "https://www.google.com/webhp?authuser=2",
    "https://www.bing.com/search?q=uhrs&aqs=edge.0.69i64i450l8.90303275j0j1&FORM=ANSPA1&PC=LCTS",
    "https://duckduckgo.com/?q=flutter&ia=web"
  ];

  String? searchEngineURL;

  bool _canBack = false;
  bool _canForward = false;

  initController({required InAppWebViewController controller}) {
    _controller = controller;
    notifyListeners();
  }

  checkAvaibility() async {
    _canBack = await _controller.canGoBack();
    _canForward = await _controller.canGoForward();
    notifyListeners();
  }

  get getCanForward {
    checkAvaibility();
    return _canForward;
  }

  get getCanBack {
    checkAvaibility();
    return _canBack;
  }

  forward() {
    _controller.goForward();
    notifyListeners();
  }

  back() {
    _controller.goBack();
    notifyListeners();
  }

  changeSearchEngine({required int index}) {
    log(searchEngineURL.toString());
    searchEngineURL = searchEngine[index];
    _controller.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse(searchEngineURL!),
      ),
    );
    log(searchEngineURL.toString());
    notifyListeners();
  }
}
