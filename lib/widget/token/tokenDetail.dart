import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni/common/untilStyle.dart';

class TokenDetailDilog extends Dialog {
  final data;
  TokenDetailDilog(this.data);
  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency,
      child: new Stack(
        children: <Widget>[
          new Positioned(
            top: 0,
            left: 0,
            child: new Container(
              child: new FlatButton(
                splashColor: Color(0x00ffffff),
                highlightColor: Color(0x00ffffff),
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Container(
                  height: ScreenUtil().setHeight(812),
                  width: ScreenUtil().setWidth(376),
                ),
              ),
            ),
          ),
          new Positioned(
            top: ScreenUtil().setHeight(70),
            child: new Container(
              height: ScreenUtil().setHeight(742),
              width: ScreenUtil().setWidth(376),
              child: TokenDetail(data: data),
            ),
          )
        ],
      ),
    );
  }
}

class TokenDetail extends StatefulWidget {
  final data;
  TokenDetail({Key key, this.data}) : super(key: key);
  _TokenDetailState createState() => new _TokenDetailState();
}

class _TokenDetailState extends State<TokenDetail> {
  var data;
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
          color: Color(0xfff2f4f8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
          )),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(104),
            decoration: BoxDecoration(
                color: Color(0xff000000),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(44),
                  topRight: Radius.circular(44),
                )),
            child: new Container(
              padding: EdgeInsets.only(top: 32,left: 18,right: 18,bottom: 16),
              child: new Column(
                children: <Widget>[
                  new Container(
                    color: Colors.transparent,
                    child: new Container(
                      width: ScreenUtil().setWidth(54),
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(5),
                        color: Color.fromRGBO(255, 255, 255, 0.5)
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 10),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            child: new Row(
                              children: <Widget>[
                                new Container(
                                  child: new Text(
                                    'STATUS: ',
                                    style:new TextStyle(
                                      color:Color.fromRGBO(255, 255, 255, 0.5),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                ),
                                new Container(
                                  child: new Text(
                                    'PENDING',
                                    style:new TextStyle(
                                      color:Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        new Container(
                          height: 24,
                          child: Image.asset('images/info.png'),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          new Container(
            padding: EdgeInsets.only(left: 18,right: 18,top: 22,bottom: 22),
            height: 510,
            child: new SingleChildScrollView(
              child: new Container(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 24),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'NAME',
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Text(
                          'QTR',
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                
                new Container(
                  margin: EdgeInsets.only(top: 24),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'WEBSITE',
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Text(
                          'WWW.QTRCAPITAL.COM',
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                    ],
                  ),
                ),

                new Container(
                  margin: EdgeInsets.only(top: 24),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'DESCRIPTION',
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Text(
                          'Capital is financing that investors provide to startup companies.'.toUpperCase(),
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                    ],
                  ),
                ),

                new Container(
                  margin: EdgeInsets.only(top: 24),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'CATEGORY',
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Text(
                          'FINANCE & iNSURNACE',
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                    ],
                  ),
                ),

                new Container(
                  margin: EdgeInsets.only(top: 24),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'SUB CATEGORY',
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Text(
                          'INVESTMENT COMPANY',
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                    ],
                  ),
                ),

                new Container(
                  margin: EdgeInsets.only(top: 24),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'ADDRESS',
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(right: 6),
                              width: 27,
                              height: 19,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.black,
                              ),
                              child: new Center(
                                child: new Text(
                                'ID',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  letterSpacing: 2.89
                                ),
                              ),
                              ),
                            ),
                            new Container(
                        
                        child: new Text(
                          '1YjsJhJH12918nmHkKUwjaAHj2341Aj',
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                new Container(
                  margin: EdgeInsets.only(top: 24),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'ISSUANCE',
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Text(
                          'crowd sale'.toUpperCase(),
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 24),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'RATE',
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                        child: new Text(
                          '.43215'.toUpperCase(),
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(left: 6),
                        width: 38,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: new Center(
                          child: new Text(
                          'OMNI',
                          style:UtilStyle.tokenDetailContentStyle
                        ),
                        ),
                      )
                          ],
                        ),
                      )
                    ],
                  ),
                        ),
                      ),
                      new Expanded(
                        child: new Container(
                          child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'BONUS',
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                        child: new Text(
                          '+1.5%'.toUpperCase(),
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                          ],
                        ),
                      )
                    ],
                  ),
                        ),
                      ),
                      new Expanded(
                        child: new Container(
                          child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'miner fees'.toUpperCase(),
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                        child: new Text(
                          '0.0012'.toUpperCase(),
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(left: 6),
                        width: 38,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: new Center(
                          child: new Text(
                          'BTC',
                          style:UtilStyle.tokenDetailContentStyle
                        ),
                        ),
                      )
                          ],
                        ),
                      )
                    ],
                  ),
                        ),
                      ),
                    
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 24),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'END DATE',
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.only(right: 6),
                        child: new Text(
                          '28'.toUpperCase(),
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(right: 6),
                        child: new Text(
                          'sep'.toUpperCase(),
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                      new Container(
                        child: new Text(
                          '2020'.toUpperCase(),
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                      
                          ],
                        ),
                      )
                    ],
                  ),
                        ),
                      ),
                      new Expanded(
                        child: new Container(
                          child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'END TIME (UTC)',
                          style: UtilStyle.tokenDetailTitleStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 8),
                        child: new Row(
                          children: <Widget>[
                            new Container(
                        child: new Text(
                          '08:30'.toUpperCase(),
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(left: 6),
                        child: new Text(
                          'AM'.toUpperCase(),
                          style: UtilStyle.tokenDetailContentStyle,
                        ),
                      ),
                          ],
                        ),
                      )
                    ],
                  ),
                        ),
                      ),
                    
                    ],
                  ),
                ),

              ],
            ),
          
              ),
            ),
            )
        ],
      ),
    );
  }
}
