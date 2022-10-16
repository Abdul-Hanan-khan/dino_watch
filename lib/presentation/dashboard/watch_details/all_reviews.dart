import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/presentation/commamn/rateing_bar.dart';
import 'package:watch_app/presentation/dashboard/watch_details/get_comments_controller.dart';

import '../../commamn/app_bar.dart';

class AllReviews extends StatelessWidget {
  int watchId;

  AllReviews(this.watchId, {Key? key}) : super(key: key);

  var _con = Get.put(GetCommentsController());

  @override
  Widget build(BuildContext context) {
    _con.getComments(watchId.toString());
    return Scaffold(
      appBar: appBar(text: "Reviews".tr, actionIcon: true, back: true),
      body: SingleChildScrollView(
        child: Obx(
          () => _con.loading.value
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                )
              : _con.allComments.value.data!.isNull ||
                      _con.allComments.value.data!.length < 1
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: Text("No Comments Yet"),
                      ),
                    )
                  : SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _con.allComments.value.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Card(
                                elevation: 4,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        // child:CachedNetworkImage(
                                        //   imageUrl: '${_con.allComments.value.data![index].userProfile}',
                                        //   height: 115,
                                        //   width: Get.width,
                                        //   fit: BoxFit.contain,
                                        //   placeholder: (context, url) => const SizedBox(
                                        //     // height: 150,
                                        //     child: CupertinoActivityIndicator(),
                                        //   ),
                                        //   errorWidget: (context, url, error) => const SizedBox(
                                        //     // height: 150,
                                        //     child: Icon(Icons.error),
                                        //   ),
                                        // ),
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage("${_con.allComments.value.data![index].userProfile??"https://static.thenounproject.com/png/212110-200.png"}"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${_con.allComments.value.data![index].senderName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                            SizedBox(height: 5,),
                                            StarRating(
                                              size: 15,
                                              rating: double.parse(_con.allComments.value.data![index].rating.toString())
                                                  .round(),
                                            ),
                                            SizedBox(height: 5,),

                                            Text("${_con.allComments.value.data![index].review}"),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
        ),
      ),
    );
  }
}
