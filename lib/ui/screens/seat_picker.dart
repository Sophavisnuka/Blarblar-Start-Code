import 'package:blabla/ui/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';
import 'package:blabla/ui/theme/theme.dart';

class SeatPicker extends StatefulWidget {
  final int initialSeatCount;
  
  const SeatPicker({super.key, this.initialSeatCount = 1});

  @override
  State<SeatPicker> createState() => _SeatPickerState();
}

class _SeatPickerState extends State<SeatPicker> {

  late int seatCount;

  @override
  void initState() {
    super.initState();
    seatCount = widget.initialSeatCount;
  }

  void increment() async {
    setState(() {
      seatCount++;    
    });
  }

  void decrement() async {
    setState(() {
      if (seatCount > 1) {
        seatCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            size: 40,
            color: BlaColors.primary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: BlaColors.primary,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop(seatCount);
        }
      ),
      body: Padding(
        padding: EdgeInsets.all(BlaSpacings.m),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Number of seats to book',
                style: BlaTextStyles.heading,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlaButton(
                    label: '-',
                    type: ButtonType.secondary,
                    onPressed: decrement
                  ),
                  SizedBox(width: 10,),
                  Text(
                    '$seatCount',
                    style: BlaTextStyles.heading,
                  ),
                  SizedBox(width: 10,),
                  BlaButton(
                    label: '+',
                    onPressed: increment,
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}