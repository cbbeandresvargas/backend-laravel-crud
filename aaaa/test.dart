List<int> days28() {
  List<int> numeros = List<int>.generate(28, (index) => index + 1);
  return numeros;
}

List<int> calendardays(DateTime currenttime) {

  List<int> months31 = [1, 3, 5, 7, 8, 10, 12];
  List<int> months30 = [4, 6, 9, 11];

  List<int> calendar = List<int>.filled(42, 0);

  int firstday = DateTime(currenttime.year, currenttime.month, 1).weekday;
  int daysinmonth = 0;
  int year = currenttime.year;

  bool isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

  if (months31.contains(currenttime.month)) {
    daysinmonth = 31;
  } else if (months30.contains(currenttime.month)) {
    daysinmonth = 30;
  } else {
    daysinmonth = isLeapYear ? 29 : 28;
  }
  int calendarIndex = (firstday - 1) % 7;

  for (int i = 0; i < daysinmonth; i++) {
    calendar[calendarIndex] = i + 1;
    calendarIndex = (calendarIndex + 1) % 42;
  }

  return calendar;
}

DateTime nextmonth(DateTime currenttime) {
  return DateTime(currenttime.year, currenttime.month + 1, 1);
}

DateTime previusmonth(DateTime currenttime) {
  return DateTime(currenttime.year, currenttime.month - 1, 1);
}


class Rangeslider extends StatefulWidget {
  const Rangeslider({
    Key? key,
    this.width,
    this.height,
    this.minval,
    this.maxval,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? minval;
  final double? maxval;

  @override
  _RangesliderState createState() => _RangesliderState();
}

class _RangesliderState extends State<Rangeslider> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = RangeValues(widget.minval ?? 0, widget.maxval ?? 50);
  }

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color(0xFFFfffff);
    const Color inactiveColor = Color(0xFFF2B40E);

    final double minRange = _currentRangeValues.start;
    final double maxRange = _currentRangeValues.end;

    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 50, 50, 0),
                  child: Builder(builder: (context) {
                    final columns = filtercolumns();
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (var i = 0; i < columns.length; i++)
                          Container(
                            width: 14,
                            height: columns[i].toDouble(),
                            color: (i >= minRange && i <= maxRange)
                                ? activeColor
                                : inactiveColor,
                          ),
                      ],
                    );
                  }),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 105, 10, 0),
                  child: RangeSlider(
                    activeColor: activeColor,
                    inactiveColor: inactiveColor,
                    values: _currentRangeValues,
                    min: widget.minval ?? 0,
                    max: /*widget.maxval ??*/ 42,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                    /*divisions: (widget.maxval ?? 50).toInt(),*/
                    /*labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),*/
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFFfffff),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Minimal',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                        Text(
                          '% ${minRange.round()}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 20,
                    height: 1,
                    color: const Color(0xFFFfffff),
                  ),
                ),
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFFfffff),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Maximum',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                        Text(
                          '% ${maxRange.round()} +',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<int> filtercolumns() {
  return [
    8,
    6,
    10,
    12,
    19,
    27,
    29,
    41,
    37,
    58,
    53,
    63,
    53,
    58,
    77,
    60,
    34,
    50,
    60,
    56,
    34,
    51,
    56,
    68,
    40,
    63,
    48,
    38,
    51,
    31,
    22,
    34,
    34,
    20,
    31,
    8,
    12,
    12,
    17,
    15,
    17,
    8,
    10
  ];
}