import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mirror_wall/controller/webPage_controller.dart';
import 'package:mirror_wall/utils/color_utils.dart';
import 'package:provider/provider.dart';

class BookMarkPage extends StatelessWidget {
  const BookMarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BookMarks List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<WebPageController>(builder: (context, provider, _) {
          return (provider.bookMarkList.isEmpty)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "asset/images/noData.png",
                        scale: 7,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: provider.bookMarkList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          provider.searchBookMark(
                              data: provider.bookMarkList[index]);
                          Navigator.pop(context);
                        },
                        title: Text(
                          "${provider.bookMarkSearchList[index]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          "${provider.bookMarkList[index]}",
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        trailing: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            onPressed: () {
                              provider.removeBookMark(index: index);

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
                            },
                            icon: const Icon(
                              Icons.delete_forever_rounded,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        }),
      ),
    );
  }
}
