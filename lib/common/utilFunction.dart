class UtilFunction {
  UtilFunction._();
  static formatCount(c, d) {
    if (c == 0 || c == null) {
      return '0';
    } else {
      String returnStr;
      String str = double.parse(c.toString()).toString();
      // 分开截取
      List<String> sub = str.split('.');
      // 处理值
      List val = List.from(sub[0].split(''));
      // 处理点
      List<String> ds = List.from(sub[1].split(''));
      //处理分割符
      for (int index = 0, i = val.length - 1;
          index < val.length;
          index++, i--) {
        // 除以三没有余数、不等于零并且不等于1 就加个逗号
        if (index % 3 == 0 && index != 0) {
          val[i] = val[i] + ',';
        }
      }
      // 处理小数点
      for (int i = 0; i <= d - ds.length; i++) {
        ds.add('0');
      }
      //如果大于长度就截取
      if (ds.length > d) {
        // 截取数组
        ds = ds.sublist(0, d);
      }
      // 判断是否有长度
      if (ds.length > 0) {
        returnStr = '${val.join('')}.${ds.join('')}';
      } else {
        returnStr = val.join('');
      }
      if(c<1){
        returnStr = returnStr.substring(1);
      }
      return returnStr;
    }
  }
}
