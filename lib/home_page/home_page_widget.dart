import 'package:DFG/components/highlightcards_widget.dart';
import '../backend/api_requests/api_calls.dart';
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
import 'package:go_router/go_router.dart';

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
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Generated code for this Row Widget...
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
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
                                      color: FlutterFlowTheme.of(context)
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final highlightcards =
                                            (DFGHighlightcardsCall.imagem(
                                                      rowDFGHighlightcardsResponse
                                                          .jsonBody,
                                                    )?.toList() ??
                                                    [])
                                                .take(3)
                                                .toList();
                                        return Container(
                                          width: double.infinity,
                                          height: 440,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 0),
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
                                                      highlightcards.length,
                                                  itemBuilder: (context,
                                                      highlightcardsIndex) {
                                                    final highlightcardsItem =
                                                        highlightcards[
                                                            highlightcardsIndex];
                                                    return Container(
                                                      color: null,
                                                      height: 400,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 32),
                                                        child: ClipRRect(
                                                          child: Image.network(
                                                            _fixImageUrl(
                                                                DFGHighlightcardsCall
                                                                    .imagem(
                                                              pageViewDFGHighlightcardsResponse
                                                                  .jsonBody,
                                                            )[highlightcardsIndex]),
                                                            width:
                                                                double.infinity,
                                                            height: 400,
                                                            fit: BoxFit.cover,
                                                          ),
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
                                                      .fromSTEB(8, 0, 8, 8),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: min(
                                                                0,
                                                                highlightcards
                                                                        .length -
                                                                    1)),
                                                    count:
                                                        highlightcards.length,
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
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                width: MediaQuery.of(context).size.width,
                                height: 345,
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
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(
                                  indent: 0,
                                  thickness: 4,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Anúncios recentes',
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
                                  model: _model.productsModel,
                                  updateCallback: () => setState(() {}),
                                  child: ProductsWidget(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 4, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(
                                  thickness: 4,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Promocionais',
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
                                  model: _model.promoModel,
                                  updateCallback: () => setState(() {}),
                                  child: PromoWidget(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 4, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(
                                  thickness: 4,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Mais Populares',
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
                                  model: _model.mostpopularModel,
                                  updateCallback: () => setState(() {}),
                                  child: MostpopularWidget(),
                                ),
                              ),
                            ],
                          ), //
                        ),

                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(
                                  thickness: 4,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Comentários e avaliações',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
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
                ],
              ),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
          ),
        ),
      ),
    );
  }
}
