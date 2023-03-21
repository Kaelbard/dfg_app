import 'package:DFG/flutter_flow/flutter_flow_animations.dart';
import 'package:DFG/flutter_flow/nav/nav.dart';
import '../backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import '../utils.dart';

import 'searchbar_model.dart';
export 'searchbar_model.dart';

class SearchbarWidget extends StatefulWidget {
  final double width;
  final TextEditingController textController;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String helpText;
  final int animationDurationInMilli;
  final onSuffixTap;
  final bool rtl;
  final bool autoFocus;
  final TextStyle? style;
  final bool closeSearchOnSuffixTap;
  final Color? color;
  final Color? textFieldColor;
  final Color? searchIconColor;
  final Color? textFieldIconColor;
  final List<TextInputFormatter>? inputFormatters;
  final bool boxShadow;
  final Function(String) onSubmitted;

  const SearchbarWidget({
    Key? key,
    required this.width,
    required this.textController,
    this.suffixIcon,
    this.prefixIcon,
    this.helpText = "O que você procura?",
    this.color = Colors.white,
    this.textFieldColor = Colors.white,
    this.searchIconColor = Colors.black,
    this.textFieldIconColor = Colors.black,
    required this.onSuffixTap,
    this.animationDurationInMilli = 375,
    required this.onSubmitted,
    this.rtl = false,
    this.autoFocus = false,
    this.style,
    this.closeSearchOnSuffixTap = false,
    this.boxShadow = true,
    this.inputFormatters,
  }) : super(key: key);

  @override
  _SearchbarWidgetState createState() => _SearchbarWidgetState();
}

int toggle = 0;

String textFieldValue = '';

class _SearchbarWidgetState extends State<SearchbarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _con;
  FocusNode focusNode = FocusNode();

  final animationsMap = {
    'cardOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(400, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  String _fixImageUrl(String url) {
    if (url.startsWith('//')) {
      return 'https:' + url;
    }
    return url;
  }

  @override
  void initState() {
    super.initState();
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDurationInMilli),
    );
  }

  unfocusKeyboard() {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: DFGGroupGroup.searchCall.call(
        query: widget.textController == null ? '' : widget.textController.text,
        count: 40,
        skip: 0,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final columnSearchResponse = snapshot.data!;
        return Container(
          child: AnimatedContainer(
            duration: Duration(milliseconds: widget.animationDurationInMilli),
            height: 48.0,
            width: (toggle == 0) ? 48.0 : widget.width,
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              color: toggle == 1 ? widget.textFieldColor : widget.color,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: !widget.boxShadow
                  ? null
                  : [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: -10.0,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      ),
                    ],
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration:
                      Duration(milliseconds: widget.animationDurationInMilli),
                  top: 6.0,
                  right: 7.0,
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    opacity: (toggle == 0) ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        /// can add custom color or the color will be white
                        color: widget.color,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: AnimatedBuilder(
                        child: GestureDetector(
                          onTap: () {
                            try {
                              widget.onSuffixTap();
                              if (textFieldValue == '') {
                                unfocusKeyboard();
                                setState(() {
                                  toggle = 0;
                                });

                                _con.reverse();
                              }

                              widget.textController.clear();
                              textFieldValue = '';
                              if (widget.closeSearchOnSuffixTap) {
                                unfocusKeyboard();
                                setState(() {
                                  toggle = 0;
                                });
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: widget.suffixIcon != null
                              ? widget.suffixIcon
                              : Icon(
                                  Icons.close,
                                  size: 20.0,
                                  color: widget.textFieldIconColor,
                                ),
                        ),
                        builder: (context, widget) {
                          ///Using Transform.rotate to rotate the suffix icon when it gets expanded
                          return Transform.rotate(
                            angle: _con.value * 2.0 * pi,
                            child: widget,
                          );
                        },
                        animation: _con,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration:
                      Duration(milliseconds: widget.animationDurationInMilli),
                  left: (toggle == 0) ? 20.0 : 40.0,
                  curve: Curves.easeOut,
                  top: 11.0,
                  child: AnimatedOpacity(
                    opacity: (toggle == 0) ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 200),
                    child: Container(),
                  ),
                ),
                Material(
                  color: toggle == 0 ? widget.color : widget.textFieldColor,
                  borderRadius: BorderRadius.circular(30.0),
                  child: IconButton(
                    splashRadius: 19.0,
                    icon: widget.prefixIcon != null
                        ? toggle == 1
                            ? Icon(
                                Icons.arrow_back_ios,
                                color: widget.textFieldIconColor,
                              )
                            : widget.prefixIcon!
                        : Icon(
                            toggle == 1 ? Icons.arrow_back_ios : Icons.search,
                            // search icon color when closed
                            color: toggle == 0
                                ? widget.searchIconColor
                                : widget.textFieldIconColor,
                            size: 20.0,
                          ),
                    onPressed: () {
                      setState(
                        () {
                          if (toggle == 0) {
                            toggle = 1;
                            setState(() {
                              if (widget.autoFocus)
                                FocusScope.of(context).requestFocus(focusNode);
                            });
                            _con.forward();
                          } else {
                            toggle = 0;
                            setState(() {
                              if (widget.autoFocus) unfocusKeyboard();
                            });
                            _con.reverse();
                          }
                        },
                      );
                    },
                  ),
                ),
                if (columnSearchResponse.jsonBody != null)
                  if (columnSearchResponse.jsonBody != null)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: DFGGroupGroup.detailsCall.call(),
                        builder: (context, snapshot) {
                          final retorno = (DFGGroupGroup.searchCall
                                      .itemID(
                                        columnSearchResponse.jsonBody,
                                      )
                                      ?.toList() ??
                                  [])
                              .take(40)
                              .toList();
                          return ListView.builder(
                            //page
                            physics: PageScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: retorno.length,
                            itemBuilder: (context, retornoIndex) {
                              final retornoItem = retorno[retornoIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          context.pushNamed(
                                            'product',
                                            queryParams: {
                                              'itemID': serializeParam(
                                                retornoItem,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.network(
                                                    _fixImageUrl(DFGGroupGroup
                                                        .searchCall
                                                        .thumbnailLink(
                                                      columnSearchResponse
                                                          .jsonBody,
                                                    )[retornoIndex]),
                                                    width: 115,
                                                    height: 90,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 8, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 220,
                                                            height: 29.4,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                (DFGGroupGroup
                                                                        .searchCall
                                                                        .titlelist(
                                                                  columnSearchResponse
                                                                      .jsonBody,
                                                                ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()[
                                                                        retornoIndex]
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          60,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 8, 4),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            formatPrice((DFGGroupGroup
                                                                        .searchCall
                                                                        .price(
                                                              columnSearchResponse
                                                                  .jsonBody,
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()[
                                                                retornoIndex]),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Color(
                                                                      0xFFB04D28),
                                                                  fontSize: 18,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'cardOnPageLoadAnimation']!),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
