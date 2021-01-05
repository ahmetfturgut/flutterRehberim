import 'package:flutter/material.dart';
import 'package:flutter_rehberim/advenced/local_file.dart';
import 'package:flutter_rehberim/advenced/sembast.dart';
import 'package:flutter_rehberim/advenced/shared_preference.dart';
import 'package:flutter_rehberim/animation/animated-align.dart';
import 'package:flutter_rehberim/advenced/sqlite.dart';
import 'package:flutter_rehberim/animation/animated-cross-fade.dart';
import 'package:flutter_rehberim/animation/animated-icons.dart';
import 'package:flutter_rehberim/animation/animated-list.dart';
import 'package:flutter_rehberim/animation/animated-opacity.dart';
import 'package:flutter_rehberim/animation/animated-padding.dart';
import 'package:flutter_rehberim/animation/animated-positioned.dart';
import 'package:flutter_rehberim/animation/animated-switcher.dart';
import 'package:flutter_rehberim/appbar/backdrop.dart';
import 'package:flutter_rehberim/appbar/basic_appbar.dart';
import 'package:flutter_rehberim/appbar/bottom_appbar.dart';
import 'package:flutter_rehberim/appbar/search_appbar.dart';
import 'package:flutter_rehberim/charts/bar_chart.dart';
import 'package:flutter_rehberim/charts/chart_time_series.dart';
import 'package:flutter_rehberim/charts/graph_chart.dart';
import 'package:flutter_rehberim/charts/heatmap_calender.dart';
import 'package:flutter_rehberim/charts/line_chart.dart';
import 'package:flutter_rehberim/charts/pie_chart.dart';
import 'package:flutter_rehberim/charts/radar_chart.dart';
import 'package:flutter_rehberim/multimedia/extendedImage.dart';
import 'package:flutter_rehberim/plugins/image_picker.dart';
import 'package:flutter_rehberim/plugins/local_auth.dart';
import 'package:flutter_rehberim/plugins/markdown_rendering.dart';
import 'package:flutter_rehberim/plugins/web_view.dart';
import 'package:flutter_rehberim/state_management/bloc_pettern.dart';
import 'package:flutter_rehberim/state_management/easier_bloc_pettern.dart';
import 'package:flutter_rehberim/state_management/inherited_widget.dart';
import 'package:flutter_rehberim/state_management/provider.dart';
import 'package:flutter_rehberim/state_management/scope_model.dart';
import 'package:flutter_rehberim/state_management/stream_builder.dart';
import 'package:flutter_rehberim/state_management/stream_controller.dart';
import 'package:flutter_rehberim/widgets/alert-dialog.dart';
import 'package:flutter_rehberim/widgets/buttons_widget.dart';
import 'package:flutter_rehberim/widgets/card_inkwell_widget.dart';
import 'package:flutter_rehberim/widgets/checkbox_widget.dart';
import 'package:flutter_rehberim/widgets/dropdownbutton_menubutton.dart';
import 'package:flutter_rehberim/widgets/icon_widget.dart';
import 'package:flutter_rehberim/widgets/image_widget.dart';
import 'package:flutter_rehberim/widgets/indicators_widget.dart';
import 'package:flutter_rehberim/layauts/column_layaut.dart';
import 'package:flutter_rehberim/layauts/container_widget.dart';
import 'package:flutter_rehberim/layauts/expanded_layaut.dart';
import 'package:flutter_rehberim/layauts/row_layaut.dart';
import 'package:flutter_rehberim/layauts/sizebox_layaut.dart';
import 'package:flutter_rehberim/layauts/stack_layaut.dart';
import 'package:flutter_rehberim/layauts/wrap_layaut.dart';
import 'package:flutter_rehberim/lists/expansiontile.dart';
import 'package:flutter_rehberim/lists/gridlist.dart';
import 'package:flutter_rehberim/lists/listtile.dart';
import 'package:flutter_rehberim/lists/listview_builder.dart';
import 'package:flutter_rehberim/lists/reorderable_list.dart';
import 'package:flutter_rehberim/lists/swipte_to_dismiss.dart';
import 'package:flutter_rehberim/navigation/bottom_sheet.dart';
import 'package:flutter_rehberim/navigation/bottomtabbar.dart';
import 'package:flutter_rehberim/navigation/dialogs.dart';
import 'package:flutter_rehberim/navigation/navigation_drawer.dart';
import 'package:flutter_rehberim/navigation/page_selector.dart';
import 'package:flutter_rehberim/navigation/routes.dart';
import 'package:flutter_rehberim/navigation/tabs.dart';
import 'package:flutter_rehberim/widgets/radio_widget.dart';
import 'package:flutter_rehberim/widgets/slider_widget.dart';
import 'package:flutter_rehberim/widgets/switch_widget.dart';
import 'package:flutter_rehberim/widgets/text_field_widget.dart';
import 'package:flutter_rehberim/widgets/text_form_field_widget.dart';
import 'package:flutter_rehberim/widgets/text_widget.dart';

class Preview extends StatefulWidget {
  String widgetKey;

  Preview({this.widgetKey});

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    if (widget.widgetKey == "Icon") {
      return IconWidget();
    } else if (widget.widgetKey == "Text") {
      return TextWidget();
    } else if (widget.widgetKey == "TextField") {
      return TextFieldExample();
    } else if (widget.widgetKey == "TextFormField") {
      return TextFormFieldExample();
    } else if (widget.widgetKey == "Image") {
      return ImageExample();
    } else if (widget.widgetKey == "Card,Inkwell") {
      return CardExample();
    } else if (widget.widgetKey == "Buttons") {
      return ButtonsExample();
    } else if (widget.widgetKey == "DropdownButton,MenuButton") {
      return DropdownButtonExample();
    } else if (widget.widgetKey == "Switch") {
      return SwitchWidget();
    } else if (widget.widgetKey == "Checkbox") {
      return CheckBoxWidget();
    } else if (widget.widgetKey == "Slider") {
      return SliderWidget();
    } else if (widget.widgetKey == "Indicator") {
      return IndicatorWidget();
    } else if (widget.widgetKey == "Radio") {
      return RadioWidget();
    } else if (widget.widgetKey == "Container") {
      return ContainerWidget();
    } else if (widget.widgetKey == "Row") {
      return LRow();
    } else if (widget.widgetKey == "Column") {
      return LColumn();
    } else if (widget.widgetKey == "Wrap") {
      return LWrap();
    } else if (widget.widgetKey == "Expanded") {
      return LExpanded();
    } else if (widget.widgetKey == "SizedBox") {
      return LSizedBox();
    } else if (widget.widgetKey == "Stack") {
      return LStack();
    } else if (widget.widgetKey == "ListTile") {
      return ListTilE();
    } else if (widget.widgetKey == "ListView.builder") {
      return ListViewBuilder();
    } else if (widget.widgetKey == "GridList") {
      return GridList();
    } else if (widget.widgetKey == "ExpansionTile") {
      return ExpansionTilE();
    } else if (widget.widgetKey == "Swipe To Dismiss") {
      return ListSwipeToDismiss();
    } else if (widget.widgetKey == "Reorderable List") {
      return ReorderableList();
    } else if (widget.widgetKey == "Sade Appbar") {
      return BasicAppbar();
    } else if (widget.widgetKey == "Bottom Appbar") {
      return BottomAppbar();
    } else if (widget.widgetKey == "Search") {
      return AppBarSearch();
    } else if (widget.widgetKey == "Backdrop") {
      return Backdrop();
    } else if (widget.widgetKey == "Tabs") {
      return Tabs();
    } else if (widget.widgetKey == "Dialogs") {
      return Dialogs();
    } else if (widget.widgetKey == "Routes") {
      return Routes();
    } else if (widget.widgetKey == "Navigation Drawer") {
      return NavDrawer();
    } else if (widget.widgetKey == "BottomSheet") {
      return BottomSheetExample();
    } else if (widget.widgetKey == "BottomTabbar") {
      return BottomTabbarExample();
    } else if (widget.widgetKey == "Page Selector") {
      return PageSelector();
    } else if (widget.widgetKey == "SQLite") {
      return Sqlite();
    } else if (widget.widgetKey == "Alert Dialog") {
      return IAlertDialog();
    } else if (widget.widgetKey == "Animated Align") {
      return IAnimatedAlign();
    } else if (widget.widgetKey == "Animated Cross Fade") {
      return IAnimatedCrossFade();
    } else if (widget.widgetKey == "Animated Icons") {
      return IAnimatedIcons();
    } else if (widget.widgetKey == "Animated List") {
      return IAnimatedList();
    } else if (widget.widgetKey == "Animated Opacity") {
      return IAnimatedOpacity();
    } else if (widget.widgetKey == "Animated Padding") {
      return IAnimatedPadding();
    } else if (widget.widgetKey == "Animated Psitioned") {
      return IAnimatedPositioned();
    } else if (widget.widgetKey == "Animated Switcher") {
      return IAnimatedSwitcher();
    } else if (widget.widgetKey == "Shared preference") {
      return SharedPreference();
    } else if (widget.widgetKey == "Local file R/W") {
      return FileReadWrite();
    } else if (widget.widgetKey == "Sembast") {
      return SembastExample();
    }
    // else if (widget.widgetKey == "Hive") {
    //   return HiveExample();
    // }
    else if (widget.widgetKey == "StreamBuilder") {
      return StreamBuilderExample();
    } else if (widget.widgetKey == "SteamController") {
      return StreamControllerExample();
    } else if (widget.widgetKey == "Inherited Widget") {
      return InheritedWidgetExample();
    } else if (widget.widgetKey == "Scoped Model") {
      return ScopedModelExample();
    } else if (widget.widgetKey == "BLoC Pettern") {
      return BlocExample();
    } else if (widget.widgetKey == "BLoC Pettern") {
      return BlocExample();
    } else if (widget.widgetKey == "Easier BLoC Pettern") {
      return BlocLibExample();
    } else if (widget.widgetKey == "Provider") {
      return ProviderExample();
    } else if (widget.widgetKey == "Image Picker") {
      return ImagePickerExample();
    } else if (widget.widgetKey == "Web View") {
      return WebViewExample();
    } else if (widget.widgetKey == "Markdown rendering") {
      return MarkdownExample();
    } else if (widget.widgetKey == "Local auth") {
      return LocalAuthExample();
    } else if (widget.widgetKey == "TimeSeriesChart") {
      return TimeseriesChartExample();
    } else if (widget.widgetKey == "PieChart") {
      return PieChartExample();
    } else if (widget.widgetKey == "LineChart") {
      return FlLineChartExample();
    } else if (widget.widgetKey == "BarChart") {
      return FlBarChartExample();
    } else if (widget.widgetKey == "GraphView") {
      return GraphViewExample();
    } else if (widget.widgetKey == "HeatmapCalender") {
      return HeatmapCalendarExample();
    } else if (widget.widgetKey == "RadarChart") {
      return RadarChartExample();
    }
    // else if (widget.widgetKey == "ExtendedImage") {
    // return ExtendedImageExample();
    // }
  }
}
