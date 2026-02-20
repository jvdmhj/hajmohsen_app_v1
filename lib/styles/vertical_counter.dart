import 'package:flutter/material.dart';

class VerticalCounter extends StatefulWidget {
  final int initialValue;
  final Function(int) onChanged;

  const VerticalCounter({
    super.key,
    this.initialValue = 1,
    required this.onChanged,
  });




  @override
  State<VerticalCounter> createState() => _VerticalCounterState();
}

class _VerticalCounterState extends State<VerticalCounter> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialValue;
  }

  void increment() {
    setState(() {
      count++;
    });
    widget.onChanged(count);
  }

  void decrement() {
    if (count > 1) {
      // حداقل 1
      setState(() {
        count--;
      });
      widget.onChanged(count);
    }
  }



  String toPersianNumber(num input) {
  const english = ['0','1','2','3','4','5','6','7','8','9'];
  const persian = ['۰','۱','۲','۳','۴','۵','۶','۷','۸','۹'];

  String result = input.toString();
  for (int i = 0; i < english.length; i++) {
    result = result.replaceAll(english[i], persian[i]);
  }
  return result;
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 240, 187),
        borderRadius:BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          IconButton(
            icon: Icon(Icons.remove),
            color: Colors.amber,
            iconSize: 30,
            onPressed: decrement,
          ),


          Text(
             toPersianNumber(count),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'BNazanin',
            ),
          ),

          IconButton(
            icon: Icon(Icons.add),
            color: Colors.amber,
            iconSize: 30,
            onPressed: increment,
          ),
        ],
      ),
    );
  }
}
