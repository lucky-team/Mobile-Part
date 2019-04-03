// /** 返回两个日期相差的天数 */
//   static int daysBetween(DateTime a, DateTime b, [bool ignoreTime = false]) {
//     if (ignoreTime) {
//       int v = a.millisecondsSinceEpoch ~/ 86400000 -
//           b.millisecondsSinceEpoch ~/ 86400000;
//       if (v < 0) return -v;
//       return v;
//     } else {
//       int v = a.millisecondsSinceEpoch - b.millisecondsSinceEpoch;
//       if (v < 0) v = -v;
//       return v ~/ 86400000;
//     }
//   }