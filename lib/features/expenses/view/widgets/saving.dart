import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/main.dart';

class Saving extends StatefulWidget {
  String title;
  double total;
  double saved;

  Saving({
    super.key,
    required this.title,
    required this.total,
    required this.saved,
  });

  @override
  State<Saving> createState() {
    return _SavingState();
  }
}

class _SavingState extends State<Saving> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        height: 100.h,
        width: 200.w,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,

          // border: Border.all(
          //     color: const Color.fromARGB(132, 255, 255, 255), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromARGB(206, 22, 103, 73),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Spacer(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.saved.toString()}',
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      '\$${widget.total.toString()}',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: LinearProgressIndicator(
                        minHeight: 15.sp,
                        backgroundColor: Colors.white30,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.white),
                        value: (100 -
                                (widget.total - widget.saved) /
                                    widget.total *
                                    100) /
                            100, // progress value
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        '${100 - (widget.total - widget.saved) / widget.total * 100} \%', // dynamically computed text
                        style: TextStyle(
                          color: Colors
                              .black, // choose contrast depending on theme
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
