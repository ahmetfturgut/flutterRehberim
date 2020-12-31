import 'package:flutter/material.dart';
import 'package:flutter_rehberim/codes.dart';
import 'package:flutter_rehberim/preview.dart';
import 'package:flutter_rehberim/services/advert_service.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class WidgetPage extends StatefulWidget {
  String widgetKey;

  WidgetPage({this.widgetKey});

  @override
  _WidgetPageState createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  var codes = Codes();
  final AdvertService _advertService = AdvertService();
  @override
  void initState() {
    _advertService.showIntersitial();
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: Preview(widgetKey: widget.widgetKey)),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: SourceCodeView(
          filePath: getCode(widget.widgetKey),
        ),
      ),
    ];
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.phone_android), text: 'Preview'),
      Tab(icon: Icon(Icons.code), text: 'Code'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.widgetKey),
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: _kTabPages,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getCode(widgetKey) {
    if (widgetKey == "Icon") {
      return "lib/widgets/icon_widget.dart";
    } else if (widgetKey == "Text") {
      return "lib/widgets/text_widget.dart";
    } else if (widgetKey == "TextField") {
      return "lib/widgets/text_field_widget.dart";
    } else if (widgetKey == "TextFormField") {
      return "lib/widgets/text_form_field_widget.dart";
    } else if (widgetKey == "Image") {
      return "lib/widgets/image_widget.dart";
    } else if (widgetKey == "Card,Inkwell") {
      return "lib/widgets/card_inkwell_widget.dart";
    } else if (widgetKey == "Buttons") {
      return "lib/widgets/buttons_widget.dart";
    } else if (widgetKey == "DropdownButton,MenuButton") {
      return "lib/widgets/dropdownbutton_menubutton.dart";
    } else if (widgetKey == "Switch") {
      return "lib/widgets/switch_widget.dart";
    } else if (widgetKey == "Checkbox") {
      return "lib/widgets/checkbox_widget.dart";
    } else if (widgetKey == "Slider") {
      return "lib/widgets/slider_widget.dart";
    } else if (widgetKey == "Indicator") {
      return "lib/widgets/indicators_widget.dart";
    } else if (widgetKey == "Radio") {
      return "lib/widgets/radio_widget.dart";
    } else if (widgetKey == "Container") {
      return "lib/layauts/container_widget.dart";
    } else if (widgetKey == "Row") {
      return "lib/layauts/row_layaut.dart";
    } else if (widgetKey == "Column") {
      return "lib/layauts/column_layaut.dart";
    } else if (widgetKey == "Wrap") {
      return "lib/layauts/wrap_layaut.dart";
    } else if (widgetKey == "Expanded") {
      return "lib/layauts/expanded_layaut.dart";
    } else if (widgetKey == "SizedBox") {
      return "lib/layauts/sizebox_layaut.dart";
    } else if (widgetKey == "Stack") {
      return "lib/layauts/stack_layaut.dart";
    } else if (widgetKey == "ListTile") {
      return "lib/lists/listtile.dart";
    } else if (widgetKey == "ListView.builder") {
      return "lib/lists/listview_builder.dart";
    } else if (widgetKey == "GridList") {
      return "lib/lists/gridlist.dart";
    } else if (widgetKey == "ExpansionTile") {
      return "lib/lists/expansiontile.dart";
    } else if (widgetKey == "Swipe To Dismiss") {
      return "lib/lists/swipte_to_dismiss.dart";
    } else if (widgetKey == "Reorderable List") {
      return "lib/lists/reorderable_list.dart";
    } else if (widgetKey == "Sade Appbar") {
      return "lib/appbar/basic_appbar.dart";
    } else if (widgetKey == "Bottom Appbar") {
      return "lib/appbar/bottom_appbar.dart";
    } else if (widgetKey == "Search") {
      return "lib/appbar/search_appbar.dart";
    } else if (widgetKey == "Backdrop") {
      return "lib/appbar/backdrop.dart";
    } else if (widgetKey == "Tabs") {
      return "lib/navigation/tabs.dart";
    } else if (widgetKey == "Routes") {
      return "lib/navigation/routes.dart";
    } else if (widgetKey == "Dialogs") {
      return "lib/navigation/dialogs.dart";
    } else if (widgetKey == "Navigation Drawer") {
      return "lib/navigation/navigation_drawer.dart";
    } else if (widgetKey == "BottomSheet") {
      return "lib/navigation/bottom_sheet.dart";
    } else if (widgetKey == "BottomTabbar") {
      return "lib/navigation/bottomtabbar.dart";
    } else if (widgetKey == "Page Selector") {
      return "lib/navigation/page_selector.dart";
    } else if (widgetKey == "SQLite") {
      return "lib/advenced/sqlite.dart";
    } else if (widgetKey == "Alert Dialog") {
      return "lib/widgets/alert-dialog.dart";
    } else if (widgetKey == "Animated Align") {
      return "lib/animation/animated-align.dart";
    } else if (widgetKey == "Animated Container") {
      return "lib/animation/animated-container.dart";
    } else if (widgetKey == "Animated Cross Fade") {
      return "lib/animation/animated-cross-fade.dart";
    } else if (widgetKey == "Animated Icons") {
      return "lib/animation/animated-icons.dart";
    } else if (widgetKey == "Animated List") {
      return "lib/animation/animated-list.dart";
    } else if (widgetKey == "Animated Opacity") {
      return "lib/animation/animated-opacity.dart";
    } else if (widgetKey == "Animated Padding") {
      return "lib/animation/animated-padding.dart";
    } else if (widgetKey == "Animated Psitioned") {
      return "lib/animation/animated-positioned.dart";
    } else if (widgetKey == "Animated Switcher") {
      return "lib/animation/animated-switcher.dart";
    } else if (widgetKey == "Shared preference") {
      return "lib/advenced/shared_preference.dart";
    } else if (widgetKey == "Local file R/W") {
      return "lib/advenced/local_file.dart";
    } else if (widgetKey == "Sembast") {
      return "lib/advenced/sembast.dart";
    } else if (widgetKey == "StreamBuilder") {
      return "lib/state_management/stream_builder.dart";
    } else if (widgetKey == "SteamController") {
      return "lib/state_management/stream_controller.dart";
    } else if (widgetKey == "Inherited Widget") {
      return "lib/state_management/inherited_widget.dart";
    } else if (widgetKey == "Scoped Model") {
      return "lib/state_management/scope_model.dart";
    } else if (widgetKey == "BLoC Pettern") {
      return "lib/state_management/bloc_pettern.dart";
    } else if (widgetKey == "Easier BLoC Pettern") {
      return "lib/state_management/easier_bloc_pettern.dart";
    } else if (widgetKey == "Provider") {
      return "lib/state_management/easier_bloc_pettern.dart";
    } else if (widgetKey == "Image Picker") {
      return "lib/plugins/image_picker.dart";
    } else if (widgetKey == "Web View") {
      return "lib/plugins/web_view.dart";
    } else if (widgetKey == "Hive") {
      return "lib/advenced/hive.dart";
    } else if (widgetKey == "Markdown rendering") {
      return "lib/plugins/markdown_rendering.dart";
    } else if (widgetKey == "Local auth") {
      return "lib/plugins/local_auth.dart";
    } else if (widgetKey == "TimeSeriesChart") {
      return "lib/charts/chart_time_series.dart";
    } else if (widgetKey == "PieChart") {
      return "lib/charts/pie_chart.dart";
    } else if (widgetKey == "LineChart") {
      return "lib/charts/line_chart.dart";
    } else if (widgetKey == "BarChart") {
      return "lib/charts/bar_chart.dart";
    } else if (widgetKey == "GraphView") {
      return "lib/charts/graph_chart.dart";
    } else if (widgetKey == "HeatmapCalender") {
      return "lib/charts/heatmap_calender.dart";
    } else if (widgetKey == "RadarChart") {
      return "lib/charts/radar_chart.dart";
    }
  }
}
