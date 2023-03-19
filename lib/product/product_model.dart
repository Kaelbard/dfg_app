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

class ProductModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for searchbar component.
  late SearchbarModel searchbarModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  get promoModel => null;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchbarModel = createModel(context, () => SearchbarModel());
  }

  void dispose() {
    searchbarModel.dispose();
  }

  /// Additional helper methods are added here.
}
