import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebPageController extends ChangeNotifier {
  InAppWebViewController? _controller;

  Map searchEngineURLList = {};

  String searchData = "flutter";
  String browser = "google";

  String browserURL = "";
  String currentURL = "";
  String currentSearchData = "";

  List<Map> bookMarkList = [];

  bool _canBack = false;
  bool _canForward = false;
  bool _canPop = false;

  double progressValue = 0;

  initController({required InAppWebViewController controller}) {
    _controller = controller;
    notifyListeners();
  }

  WebPageController() {
    setData();
    notifyListeners();
  }

  setData() {
    searchEngineURLList = {
      "google":
          "https://www.google.com/search?q=$searchData&rlz=1C1CHBF_enIN1049IN1049&oq=$searchData&aqs=chrome.0.69i59j69i64j69i59l2j0i433i512l2j0i131i433i512j0i433i512.3650j0j15&sourceid=chrome&ie=UTF-8&bshm=rimc/1",
      "bring":
          "https://www.bing.com/search?q=$searchData&form=ANSPH1&refig=4ea4f6f853dc467890eb807227c2279a&pc=U531",
      "duckduckGO": "https://duckduckgo.com/?q=$searchData&ia=web",
      "yahoo":
          "https://in.search.yahoo.com/search?ei=UTF-8&fr=crmas&p=$searchData",
      "brave": "https://search.brave.com/search?q=$searchData&source=desktop",
    };

    browserURL = searchEngineURLList[browser];
    currentURL = browserURL;
    currentSearchData = searchData;

    if (_controller != null) {
      _controller!.loadUrl(
        urlRequest: URLRequest(
          url: Uri.parse(browserURL),
        ),
      );
    }
  }

  search({required String data}) {
    searchData = data;
    setData();
    notifyListeners();
  }

  changeBrowser({required String browserName}) {
    browser = browserName;
    setData();
    notifyListeners();
  }

  checkAvaibility() async {
    _canBack = await _controller!.canGoBack();
    _canForward = await _controller!.canGoForward();
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
    _controller!.goForward();
    notifyListeners();
  }

  back() {
    _controller!.goBack();
    notifyListeners();
  }

  refresh() {
    _controller!.reload();
    notifyListeners();
  }

  addBookMark() {
    setData();

    if (!bookMarkList.contains({
      "search": "${currentSearchData}",
      "url": "${currentURL}",
    })) {
      bookMarkList.add({
        "search": "${currentSearchData}",
        "url": "${currentURL}",
      });
    }

    notifyListeners();
  }

  removeBookMark({required int index}) {
    bookMarkList.removeAt(index);
    notifyListeners();
  }

  searchBookMark({required String data}) {
    _controller!.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse(data),
      ),
    );
    notifyListeners();
  }

  get getCanPopValue {
    return _canPop;
  }

  canPopCheck() {
    if (_canBack) {
      _canPop = false;
      back();
    } else {
      _canPop = true;
    }
    notifyListeners();
  }

  loading({required int pro}) {
    progressValue = (pro / 100);
    notifyListeners();
  }
}
