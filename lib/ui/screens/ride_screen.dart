import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

class RideScreen extends StatelessWidget {
  final RidePref ridePref;
  const RideScreen({super.key, required this.ridePref});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(BlaSpacings.m),
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: BlaColors.greyLight,
                borderRadius: BorderRadius.circular(10)
              ),
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Station Road or The Bridge Cafe',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              )
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: BlaColors.greyLight,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Text(
                    'Departure: ${ridePref.departure.name}',
                    style: BlaTextStyles.label,
                  ),
                  Text(
                    'Arrival: ${ridePref.arrival.name}',
                    style: BlaTextStyles.label,
                  ),
                  Text(
                    'Date: ${DateTimeUtils.formatDateTime(ridePref.departureDate)}',
                    style: BlaTextStyles.label,
                  ),
                  Text(
                    'Seat: 1',
                    style: BlaTextStyles.label,
                  ),
                ],
              )
            )
          ]
        ),
      ),
    );
  }
}