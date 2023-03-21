import 'package:DFG/flutter_flow/nav/nav.dart';
import 'package:flutter/rendering.dart';
import '/flutter_flow/flutter_flow_model.dart';
import '../components/promo_widget.dart';
import '../utils.dart';
import '/backend/api_requests/api_calls.dart';
import '../components/searchbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'product_model.dart';
export 'product_model.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
    this.itemID,
  }) : super(key: key);

  final dynamic itemID;

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget>
    with TickerProviderStateMixin {
  late ProductModel _model;

  String _fixImageUrl(String url) {
    if (url.startsWith('//')) {
      return 'https:' + url;
    }
    return url;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        toolbarHeight: 46,
        backgroundColor: Color.fromARGB(255, 40, 175, 148),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            context.pop();
          },
          child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
            width: 26,
            height: 26,
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
        title: Container(
          child: Text(
            'Anúncios',
            style: FlutterFlowTheme.of(context).bodyText2.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: FutureBuilder<ApiCallResponse>(
        future: DFGGroupGroup.detailsCall.call(
          itemID: widget.itemID,
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
              ),
            );
          }

          final listViewDetailsResponse = snapshot.data!;

          return Stack(
            children: [
              ListView(
                children: [
                  Visibility(
                    visible: _model.searchbarModel.textController.text.isEmpty,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0, 16.0, 0.0),
                        ),
                        // Generated code for this Row Widget...
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Builder(
                                  builder: (context) {
                                    final lista = (DFGGroupGroup.detailsCall
                                                .itemImagesimageLink(
                                                  listViewDetailsResponse
                                                      .jsonBody,
                                                )
                                                ?.map((e) => e)
                                                .toList()
                                                ?.toList() ??
                                            [])
                                        .take(8)
                                        .toList();
                                    return Container(
                                      height: 500,
                                      child: Material(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        elevation: 0,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 32),
                                              child: PageView.builder(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: min(0,
                                                            lista.length - 1)),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: lista.length,
                                                itemBuilder:
                                                    (context, listaIndex) {
                                                  return Container(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                      child: Image.network(
                                                        _fixImageUrl(
                                                          DFGGroupGroup
                                                              .detailsCall
                                                              .itemImagesimageLink(
                                                            listViewDetailsResponse
                                                                .jsonBody,
                                                          )[listaIndex],
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: smooth_page_indicator
                                                    .SmoothPageIndicator(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: min(
                                                              0,
                                                              lista.length -
                                                                  1)),
                                                  count: lista.length,
                                                  axisDirection:
                                                      Axis.horizontal,
                                                  onDotClicked: (i) {
                                                    _model.pageViewController!
                                                        .animateToPage(
                                                      i,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  effect: smooth_page_indicator
                                                      .ExpandingDotsEffect(
                                                    expansionFactor: 2,
                                                    spacing: 8,
                                                    radius: 10,
                                                    dotWidth: 10,
                                                    dotHeight: 10,
                                                    dotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryColor,
                                                    activeDotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                    paintStyle:
                                                        PaintingStyle.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          constraints: BoxConstraints(
                            maxHeight: max(30, 30),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: double.infinity,
                                child: VerticalDivider(
                                  thickness: 4,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 16, 0),
                                  child: Text(
                                    DFGGroupGroup.detailsCall
                                        .title(
                                          listViewDetailsResponse.jsonBody,
                                        )
                                        .toString(),
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            formatPrice(DFGGroupGroup
                                                .detailsCall
                                                .price(listViewDetailsResponse
                                                    .jsonBody)
                                                .toString()),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFFB04D28),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      height: 26,
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      child: Html(
                                        data: DFGGroupGroup.detailsCall
                                            .formattedUsername(
                                              listViewDetailsResponse.jsonBody,
                                            )
                                            .toString(),
                                        style: {
                                          "body": Style(
                                            color:
                                                Color.fromARGB(255, 23, 24, 24),
                                            fontSize: FontSize(16.0),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                          "a": Style(
                                            color: Color(0xFF28AF94),
                                            fontSize: FontSize(16.0),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            textDecoration: TextDecoration.none,
                                          ),
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Essa compra vale: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Text(
                                            DFGGroupGroup.detailsCall
                                                .dfgPoints(
                                                  listViewDetailsResponse
                                                      .jsonBody,
                                                )
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF28AF94),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Text(
                                            ' DFG Points',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF28AF94),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 16, 0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Html(
                                            data: DFGGroupGroup.detailsCall
                                                .description(
                                                  listViewDetailsResponse
                                                      .jsonBody,
                                                )
                                                .toString(),
                                            style: {
                                              "body": Style(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: FontSize(16.0),
                                                fontFamily: 'Inter',
                                                textDecorationColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              "a": Style(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: FontSize(16.0),
                                                fontFamily: 'Inter',
                                                textDecorationColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                          child: VerticalDivider(
                            indent: 0,
                            thickness: 4,
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Promoções',
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 220,
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: PromoModel(),
                            updateCallback: () => setState(() {}),
                            child: PromoWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                children: [
                  Container(
                    child: wrapWithModel(
                      model: _model.searchbarModel,
                      updateCallback: () => setState(() {}),
                      child: SearchbarWidget(),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
