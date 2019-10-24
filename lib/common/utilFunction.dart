class UtilFunction {
  UtilFunction._();
  static formatCount(c, d) {
    if (c == 0 || c == null) {
      return '0';
    } else {
      String returnStr;
      String str = double.parse(c.toString()).toString();
      // split String by "."
      List<String> sub = str.split('.');
      // deal num
      List val = List.from(sub[0].split(''));
      // deal point
      List<String> ds = List.from(sub[1].split(''));
      
      for (int index = 0, i = val.length - 1;
          index < val.length;
          index++, i--) {
        // deal num by ","
        if (index % 3 == 0 && index != 0) {
          val[i] = val[i] + ',';
        }
      }
      // deal demic
      for (int i = 0; i <= d - ds.length; i++) {
        ds.add('0');
      }
      // if longer than length 
      if (ds.length > d) {
        // sub to array
        ds = ds.sublist(0, d);
      }
      // to know has length
      if (ds.length > 0) {
        returnStr = '${val.join('')}.${ds.join('')}';
      } else {
        returnStr = val.join('');
      }
      if (c < 1) {
        returnStr = returnStr.substring(1);
      }
      return returnStr;
    }
  }
}
