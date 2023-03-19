import '../components/category_widget.dart';
import '../components/comment_widget.dart';
import '../components/navbar_widget.dart';
import '../components/searchbar_widget.dart';
import '../components/products_widget.dart';
import '../components/highlightcards_widget.dart';
import '../components/promo_widget.dart';
import '../components/mostpopular_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for appbar component.
  // Model for searchbar component.
  late SearchbarModel searchbarModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;
  // Model for category component.
  late CategoryModel categoryModel;
  // Model for products component.
  late ProductModel productsModel;
  late PromoModel promoModel;
  late MostpopularModel mostpopularModel;
  late HighlightcardsModel highlightcardsModel;
  late CommentModel commentModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchbarModel = createModel(context, () => SearchbarModel());
    categoryModel = createModel(context, () => CategoryModel());
    productsModel = createModel(context, () => ProductModel());
    promoModel = createModel(context, () => PromoModel());
    commentModel = createModel(context, () => CommentModel());
    highlightcardsModel = createModel(context, () => HighlightcardsModel());
    mostpopularModel = createModel(context, () => MostpopularModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  void dispose() {
    searchbarModel.dispose();
    categoryModel.dispose();
    productsModel.dispose();
    commentModel.dispose();
    mostpopularModel.dispose();
    promoModel.dispose();
    highlightcardsModel.dispose();
    navbarModel.dispose();
  }

  /// Additional helper methods are added here.
}
