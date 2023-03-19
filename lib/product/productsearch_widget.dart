import 'package:DFG/flutter_flow/nav/nav.dart';
import '../utils.dart';
import '/backend/api_requests/api_calls.dart';
import '../components/searchbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape_small.dart';
import 'package:flutter/material.dart';

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

  get bodyIndex => null;

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
        ),
        title: Text(
          ' ',
          style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF151B1E),
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: wrapWithModel(
              model: _model.searchbarModel,
              updateCallback: () => setState(() {}),
              child: SearchbarWidget(),
            ),
          ),
          Expanded(
            child: FutureBuilder<ApiCallResponse>(
              future: DFGGroupGroup.detailsCall.call(
                itemID: widget.itemID,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
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
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Text(
                          DFGGroupGroup.detailsCall
                              .title(
                                listViewDetailsResponse.jsonBody,
                              )
                              .toString(),
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Inter',
                                color: Color(0xFF0D6352),
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                      // Generated code for this Row Widget...
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
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
                                    width: 300,
                                    height: 350,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 32),
                                          child: PageView.builder(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(
                                                    initialPage: min(
                                                        0, lista.length - 1)),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: lista.length,
                                            itemBuilder: (context, listaIndex) {
                                              final listaItem =
                                                  lista[listaIndex];
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 1,
                                                  child: Container(
                                                    padding: EdgeInsets.all(1),
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 245, 245, 245),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 3,
                                                          color: Color.fromARGB(
                                                              100, 0, 0, 0),
                                                          offset: Offset(0, 1),
                                                        )
                                                      ],
                                                    ),
                                                    child: Image.network(
                                                      _fixImageUrl(
                                                        DFGGroupGroup
                                                            .detailsCall
                                                            .itemImagesimageLink(
                                                          listViewDetailsResponse
                                                              .jsonBody,
                                                        )[listaIndex],
                                                      ),
                                                      width: 300,
                                                      height: 350,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: smooth_page_indicator
                                                .SmoothPageIndicator(
                                              controller: _model
                                                      .pageViewController ??=
                                                  PageController(
                                                      initialPage: min(
                                                          0, lista.length - 1)),
                                              count: lista.length,
                                              axisDirection: Axis.horizontal,
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
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                activeDotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          formatPrice(DFGGroupGroup.detailsCall
                                              .price(listViewDetailsResponse
                                                  .jsonBody)
                                              .toString()),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFFB04D28),
                                                fontSize: 24,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .92,
                                        child: Html(
                                          data: DFGGroupGroup.detailsCall
                                              .formattedUsername(
                                                listViewDetailsResponse
                                                    .jsonBody,
                                              )
                                              .toString(),
                                          style: {
                                            "body": Style(
                                              color: Color(0xFF0D6352),
                                              fontSize: FontSize(16.0),
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                            "a": Style(
                                              color: Color(0xFF0D6352),
                                              fontSize: FontSize(16.0),
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              textDecoration:
                                                  TextDecoration.none,
                                            ),
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints.tightFor(),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.92,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.22,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Scrollbar(
                                          child: ListView(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 8, 8),
                                                child: Html(
                                                  data:
                                                      DFGGroupGroup.detailsCall
                                                          .description(
                                                            listViewDetailsResponse
                                                                .jsonBody,
                                                          )
                                                          .toString(),
                                                  style: {
                                                    "body": Style(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: FontSize(16.0),
                                                      fontFamily: 'Inter',
                                                      textDecorationColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                    "a": Style(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: FontSize(16.0),
                                                      fontFamily: 'Inter',
                                                      textDecorationColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                  },
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
                          ),
                        ],
                      ),
                      Divider(
                        height: 8.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Essa compra vale: ',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Text(
                              DFGGroupGroup.detailsCall
                                  .dfgPoints(
                                    listViewDetailsResponse.jsonBody,
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
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
