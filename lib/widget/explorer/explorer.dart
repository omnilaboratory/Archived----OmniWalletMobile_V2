import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';
import 'package:omni/widget/compnent/floatButton.dart';
import 'package:omni/widget/compnent/head.dart';
import 'package:omni/widget/view_model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Explorer extends StatefulWidget {
  _ExplorerState createState() => new _ExplorerState();
}

class _ExplorerState extends State<Explorer> with TickerProviderStateMixin {
  Animation<double> assetsAnimation;
  AnimationController assetsController;

  Animation<double> activeAnimation;
  AnimationController activeController;

  double activeHeight = ScreenUtil().setHeight(420);
  double activeTableHeight = ScreenUtil().setHeight(320);
  bool activeTableIsShow = true;
  String nowShow = '';

  List<Map<String, Object>> assetsData = [];
  List<Map<String, Object>> activeData = [];

  void _getAssetsData() {
    assetsData = [
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
      {
        'id': '343',
        'name': 'aal',
        'amount': '69.00000001',
        'url': 'faucethub.io/mining'
      },
    ];
    setState(() {});
  }

  void _getActiveData() {
    activeData = [
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
      {
        'name': 'BITKRUBITKRU',
        'currency': 'OMNI TOKEN',
        'bought': '409834994',
        'created': '409834994'
      },
    ];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    assetsController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    assetsAnimation = new Tween(begin: 0.1, end: 1.0).animate(assetsController)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    assetsController.forward();
    activeController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    activeAnimation = new Tween(begin: 0.1, end: 1.0).animate(activeController)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    activeController.forward();
    setState(() {});
    Future.delayed(Duration(milliseconds: 10), () {
      this._getAssetsData();
      this._getActiveData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    assetsController.dispose();
    activeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainStateModel>(
      builder: (context, child, model) {
        return Scaffold(
          floatingActionButton: new FloatButton(),
          body: new Container(
            color: Color.fromRGBO(70, 116, 182, 0.02),
            child: new Stack(
              children: <Widget>[
                Positioned(
                  child: new AfterLoginHead(),
                ),
                Positioned(
                  bottom: (assetsController.value - 1) *
                      ScreenUtil().setHeight(702),
                  child: new Container(
                    width: ScreenUtil().setWidth(376),
                    height: ScreenUtil().setHeight(702),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 244, 248, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(44),
                          topRight: Radius.circular(44),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(70, 116, 182, 0.10),
                              offset: Offset(
                                ScreenUtil().setSp(0),
                                ScreenUtil().setSp(-24),
                              ),
                              blurRadius: 48.0,
                              spreadRadius: 2.0),
                        ]),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(bottom: 12),
                          width: ScreenUtil().setWidth(376),
                          child: new FlatButton(
                            splashColor: Color(0xFFF2F4F8),
                            highlightColor: Color(0xFFF2F4F8),
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              activeTableIsShow = false;
                              activeTableHeight = 0;
                              activeHeight = 68;
                              nowShow = 'ASSETS';
                              setState(() {});
                            },
                            child: new Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  EdgeInsets.only(top: 32, left: 18, right: 18),
                              child: new Text(
                                'ASSETS',
                                style: nowShow == 'ASSETS'
                                    ? UtilStyle.tagTitleFontActive
                                    : UtilStyle.tagTitleFont,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                        new Container(
                          child: AssetTable(assetsData),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: (activeController.value - 1) * activeHeight,
                  child: new Container(
                    width: ScreenUtil().setWidth(376),
                    height: activeHeight,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 244, 248, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(44),
                          topRight: Radius.circular(44),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(70, 116, 182, 0.10),
                              offset: Offset(
                                ScreenUtil().setSp(0),
                                ScreenUtil().setSp(-24),
                              ),
                              blurRadius: 48.0,
                              spreadRadius: 2.0),
                        ]),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(bottom: 12),
                          width: ScreenUtil().setWidth(376),
                          child: new FlatButton(
                            splashColor: Color(0xFFF2F4F8),
                            highlightColor: Color(0xFFF2F4F8),
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              activeTableIsShow = true;
                              activeTableHeight = ScreenUtil().setHeight(540);
                              activeHeight = ScreenUtil().setHeight(640);
                              nowShow = 'Active';
                              setState(() {});
                            },
                            child: new Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  EdgeInsets.only(top: 32, left: 18, right: 18),
                              child: new Text(
                                'active crowdsales'.toUpperCase(),
                                style: nowShow == 'Active'
                                    ? UtilStyle.tagTitleFontActive
                                    : UtilStyle.tagTitleFont,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                        activeTableIsShow
                            ? new Container(
                                child:
                                    ActiveTable(activeData, activeTableHeight),
                              )
                            : new Container()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class AssetTable extends StatelessWidget {
  final List<Map<String, Object>> data;
  AssetTable(this.data);
  Widget buildTable() {
    Widget content;
    Widget tableHead = new Container(
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
      child: new Row(
        children: <Widget>[
          new Container(
            width: ScreenUtil().setWidth(51),
            child: new Text(
              'ID',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(52),
            child: new Text(
              'NAME',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(100),
            child: new Text(
              'AMOUNT',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(135),
            child: new Text(
              'URL',
              style: UtilStyle.tableHeadFont,
            ),
          ),
        ],
      ),
    );
    List<Widget> listUI = [];
    for (var i = 0; i < data.length; i++) {
      listUI.add(AssetTableRow(item: data[i]));
    }
    content = new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: tableHead,
          ),
          new Container(
            height: ScreenUtil().setHeight(540),
            child: new SingleChildScrollView(
              child: new Container(
                child: new Column(
                  children: listUI,
                ),
              ),
            ),
          )
        ],
      ),
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return buildTable();
  }
}

class AssetTableRow extends StatefulWidget {
  final Map<String, Object> item;
  AssetTableRow({Key key, this.item}) : super(key: key);
  _AssetTableRowState createState() => new _AssetTableRowState();
}

class _AssetTableRowState extends State<AssetTableRow> {
  Map<String, Object> item;
  @override
  void initState() {
    super.initState();
    item = widget.item;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
      child: new Row(
        children: <Widget>[
          new Container(
            width: ScreenUtil().setWidth(51),
            child: new Text(
              item['id'],
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(52),
            child: new Text(
              item['name'],
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(100),
            child: new Text(
              item['amount'],
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(135),
            child: new Text(
              item['url'],
              overflow: TextOverflow.ellipsis,
              style: UtilStyle.tableContentFontB,
            ),
          ),
        ],
      ),
    );
  }
}

class ActiveTable extends StatelessWidget {
  final List<Map<String, Object>> data;
  final double tableHeight;
  ActiveTable(this.data, this.tableHeight);
  Widget buildTable() {
    Widget content;
    Widget tableHead = new Container(
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
      child: new Row(
        children: <Widget>[
          new Container(
            width: ScreenUtil().setWidth(67),
            child: new Text(
              'NAME',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(92),
            child: new Text(
              'CURRENCY',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(108),
            child: new Text(
              'BOUGHT',
              style: UtilStyle.tableHeadFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(73),
            child: new Text(
              'CREATED',
              style: UtilStyle.tableHeadFont,
            ),
          ),
        ],
      ),
    );
    List<Widget> listUI = [];
    for (var i = 0; i < data.length; i++) {
      listUI.add(ActiveTableRow(item: data[i]));
    }
    content = new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: tableHead,
          ),
          new Container(
            height: tableHeight,
            child: new SingleChildScrollView(
              child: new Container(
                child: new Column(
                  children: listUI,
                ),
              ),
            ),
          )
        ],
      ),
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return buildTable();
  }
}

class ActiveTableRow extends StatefulWidget {
  final Map<String, Object> item;
  ActiveTableRow({Key key, this.item}) : super(key: key);
  _ActiveTableRowState createState() => new _ActiveTableRowState();
}

class _ActiveTableRowState extends State<ActiveTableRow> {
  Map<String, Object> item;
  @override
  void initState() {
    super.initState();
    item = widget.item;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
      child: new Row(
        children: <Widget>[
          new Container(
            width: ScreenUtil().setWidth(67),
            padding: EdgeInsets.only(right: 16),
            child: new Text(
              item['name'],
              overflow: TextOverflow.ellipsis,
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(92),
            child: new Text(
              item['currency'],
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(108),
            child: new Text(
              item['bought'],
              style: UtilStyle.tableContentFont,
            ),
          ),
          new Container(
            width: ScreenUtil().setWidth(73),
            child: new Text(
              item['created'],
              style: UtilStyle.tableContentFont,
            ),
          ),
        ],
      ),
    );
  }
}
