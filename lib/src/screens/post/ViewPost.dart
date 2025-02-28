import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class ViewPost extends StatefulWidget {
  final String content;
  final String like;
  final List<String>? comment;
  final List<String> tag;

  const ViewPost(
      {Key? key,
      required this.content,
      required this.like,
      this.comment,
      required this.tag})
      : super(key: key);

  @override
  ViewPostState createState() => ViewPostState();
}

class ViewPostState extends State<ViewPost> {
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? commentController;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
          child: Stack(children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: const BoxDecoration(
                          color: primaryColorSubtle,
                          borderRadius: BorderRadiusDirectional.vertical(
                              bottom: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              offset: Offset(0, 4),
                            )
                          ]),
                      child: Align(
                          alignment: const AlignmentDirectional(0.675, -0.875),
                          child: Image.asset(
                              'assets/images/background_post.png'))),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // Section-Header
                          Row(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.115,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new,
                                    color: textColor3,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.035),
                          Row(children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.0425,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: secondaryColor),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: Text(
                                    "โพสหมายเลข 124343232",
                                    style: GoogleFonts.getFont("Bai Jamjuree",
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )))
                          ]),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),

                          // Section-PostDetail
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadiusDirectional.all(
                                    Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color.fromRGBO(170, 212, 204, 0.8),
                                    offset: Offset(0, 4),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 5, 20, 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "23 Nov 2022",
                                        style: GoogleFonts.getFont("Lato",
                                            fontSize: 16, color: textColor3),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.more_horiz,
                                            color: textColor3,
                                            size: 30,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "ผู้ใช้ STOXX",
                                        style: GoogleFonts.getFont(
                                            "Bai Jamjuree",
                                            color: textColor3,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025,
                                  ),

                                  // Section-Content
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget.content,
                                          style: GoogleFonts.getFont(
                                              "Bai Jamjuree",
                                              fontSize: 16,
                                              color: textColor2),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1000,
                                          softWrap: false,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),

                                  // Section-Tag ---------------------------------------------------
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.035,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget.tag.length,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02);
                                      },
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: secondaryColor),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(10, 5, 10, 5),
                                              child: Text(
                                                widget.tag[index],
                                                style: GoogleFonts.getFont(
                                                    "Bai Jamjuree",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.015),

                                  // Section-Comments ----------------------------------------------
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            color: secondaryColor),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: 'Chat',
                                                  style: GoogleFonts.getFont(
                                                      'Lato',
                                                      fontSize: 16,
                                                      color: Colors.white)),
                                              const TextSpan(text: '  '),
                                              const WidgetSpan(
                                                  child: Icon(
                                                Icons.wechat,
                                                size: 20,
                                                color: Colors.white,
                                              ))
                                            ]),
                                          ),
                                        ),
                                      ),

                                      // Section-Like
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.175,
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: widget.like,
                                                  style: GoogleFonts.getFont(
                                                      'Lato',
                                                      fontSize: 18,
                                                      color: textColor2)),
                                              const TextSpan(text: ' '),
                                              const WidgetSpan(
                                                  child: Icon(
                                                Icons.favorite,
                                                color: Colors.black12,
                                                size: 22,
                                              ))
                                            ]),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),

                          // Section-Comment
                          Column(
                            children: [
                              // Sorter
                              Row(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      decoration: const BoxDecoration(
                                          color: thirterydColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Center(
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: " เรียงตามความใหม่ ",
                                                style: GoogleFonts.getFont(
                                                    'Bai Jamjuree',
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const WidgetSpan(
                                              child: Icon(
                                                Icons.arrow_drop_down,
                                                size: 18,
                                                color: backgroundColor3,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),

                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.comment?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.035),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadiusDirectional.all(
                                                  Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 20,
                                              color: Color.fromRGBO(
                                                  170, 212, 204, 0.5),
                                              offset: Offset(0, 2),
                                            )
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(15, 0, 0, 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "23 Nov 2022",
                                                  style: GoogleFonts.getFont(
                                                      "Lato",
                                                      fontSize: 12,
                                                      color: textColor3),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.more_horiz,
                                                      color: textColor3,
                                                      size: 24,
                                                    ))
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "ผู้ใช้ STOXX",
                                                  style: GoogleFonts.getFont(
                                                      "Bai Jamjuree",
                                                      color: textColor3,
                                                      fontSize: 10),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    widget.comment![index],
                                                    style: GoogleFonts.getFont(
                                                      "Bai Jamjuree",
                                                      color: textColor2,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1000,
                                                    softWrap: false,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.175,
                                                  child: Center(
                                                    child: RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text: "0",
                                                            style: GoogleFonts
                                                                .getFont('Lato',
                                                                    fontSize:
                                                                        14,
                                                                    color:
                                                                        textColor2)),
                                                        const TextSpan(
                                                            text: ' '),
                                                        const WidgetSpan(
                                                            child: Icon(
                                                          Icons.favorite,
                                                          color: Colors.black12,
                                                          size: 20,
                                                        ))
                                                      ]),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.06),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // BottomContainer
            Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: primaryColor,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Color.fromRGBO(170, 212, 204, 0.4),
                              offset: Offset(0, 4),
                            )
                          ]),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "เขียนความคิดเห็น",
                              hintStyle: GoogleFonts.getFont("Bai Jamjuree",
                                  color: textColor3)),
                          minLines: 1,
                          maxLines: 5,
                        ),
                      ),
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
