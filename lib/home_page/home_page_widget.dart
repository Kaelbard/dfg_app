import 'package:myapp/components/highlightcards_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/appbar_widget.dart';
import '../components/category_widget.dart';
import '../components/navbar_widget.dart';
import '../components/products_widget.dart';
import '../components/promo_widget.dart';
import '../components/comment_widget.dart';
import '../components/mostpopular_widget.dart';
import '../components/searchbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/highlightcards_model.dart';
export '../components/highlightcards_model.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  String _fixImageUrl(String url) {
    if (url.startsWith('//')) {
      return 'https:' + url;
    }
    return url;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.appbarModel,
                            updateCallback: () => setState(() {}),
                            child: AppbarWidget(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: wrapWithModel(
                                model: _model.searchbarModel,
                                updateCallback: () => setState(() {}),
                                child: SearchbarWidget(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView(
                        physics: RangeMaintainingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // Generated code for this Row Widget...
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: DFGHighlightcardsCall.call(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      final rowDFGHighlightcardsResponse =
                                              snapshot.data!,
                                          pageViewDFGHighlightcardsResponse =
                                              snapshot.data!;
                                      return Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Builder(
                                              builder: (context) {
                                                final highlightcards =
                                                    (DFGHighlightcardsCall
                                                                .imagem(
                                                              rowDFGHighlightcardsResponse
                                                                  .jsonBody,
                                                            )?.toList() ??
                                                            [])
                                                        .take(3)
                                                        .toList();
                                                return Container(
                                                  width: double.infinity,
                                                  height: 410,
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    16, 32),
                                                        child: PageView.builder(
                                                          controller: _model
                                                                  .pageViewController ??=
                                                              PageController(
                                                                  initialPage: min(
                                                                      0,
                                                                      highlightcards
                                                                              .length -
                                                                          1)),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              highlightcards
                                                                  .length,
                                                          itemBuilder: (context,
                                                              highlightcardsIndex) {
                                                            final highlightcardsItem =
                                                                highlightcards[
                                                                    highlightcardsIndex];
                                                            return Card(
                                                              color: null,
                                                              elevation: 1,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  child: Image
                                                                      .network(
                                                                    _fixImageUrl(
                                                                        DFGHighlightcardsCall
                                                                            .imagem(
                                                                      pageViewDFGHighlightcardsResponse
                                                                          .jsonBody,
                                                                    )[highlightcardsIndex]),
                                                                    width: 320,
                                                                    height: 300,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 1),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 8, 8),
                                                          child: smooth_page_indicator
                                                              .SmoothPageIndicator(
                                                            controller: _model
                                                                    .pageViewController ??=
                                                                PageController(
                                                                    initialPage: min(
                                                                        0,
                                                                        highlightcards.length -
                                                                            1)),
                                                            count:
                                                                highlightcards
                                                                    .length,
                                                            axisDirection:
                                                                Axis.horizontal,
                                                            onDotClicked: (i) {
                                                              _model
                                                                  .pageViewController!
                                                                  .animateToPage(
                                                                i,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
                                                            effect: smooth_page_indicator
                                                                .ExpandingDotsEffect(
                                                              expansionFactor:
                                                                  2,
                                                              spacing: 8,
                                                              radius: 10,
                                                              dotWidth: 10,
                                                              dotHeight: 10,
                                                              dotColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              activeDotColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              paintStyle:
                                                                  PaintingStyle
                                                                      .fill,
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
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Categorias',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 112,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: wrapWithModel(
                                          model: _model.categoryModel,
                                          updateCallback: () => setState(() {}),
                                          child: CategoryWidget(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Anuncios recentes',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
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
                                        height: 210,
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model.productsModel,
                                          updateCallback: () => setState(() {}),
                                          child: ProductsWidget(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Promocionais',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
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
                                        height: 210,
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model.promoModel,
                                          updateCallback: () => setState(() {}),
                                          child: PromoWidget(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Mais Populares',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
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
                                        height: 210,
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model.mostpopularModel,
                                          updateCallback: () => setState(() {}),
                                          child: MostpopularWidget(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Color.fromARGB(255, 40, 175, 148),
                                  indent: 100.0,
                                  endIndent: 100.0,
                                  thickness: 2,
                                ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 16),
                                  height: 248,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: wrapWithModel(
                                          model: _model.commentModel,
                                          updateCallback: () => setState(() {}),
                                          child: CommentWidget(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ) // Generated code for this Row Widget...
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            wrapWithModel(
                              model: _model.navbarModel,
                              updateCallback: () => setState(() {}),
                              child: NavbarWidget(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
