import 'package:fina/utils/color.dart';
import 'package:flutter/material.dart';

class DropdownStyledExample extends StatefulWidget {
  @override
  _DropdownStyledExampleState createState() => _DropdownStyledExampleState();
}

class _DropdownStyledExampleState extends State<DropdownStyledExample> {
  String dropdownValue = 'Day'; // Giá trị mặc định ban đầu

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: themColor, width: 2),
        borderRadius: BorderRadius.circular(12), // Bo viền
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down), // Icon thả xuống
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple, fontSize: 16),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: [
            DropdownMenuItem(
              value: 'Day',
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    print('Day Button Pressed');
                    Navigator.pop(context);
                    setState(() {
                      dropdownValue = 'Day';
                    });
                  },
                  child: Text('Day'),
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'Week',
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    print('Week Button Pressed');
                    Navigator.pop(context);
                    setState(() {
                      dropdownValue = 'Week';
                    });
                  },
                  child: Text('Week'),
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'Month',
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    print('Month Button Pressed');
                    Navigator.pop(context);
                    setState(() {
                      dropdownValue = 'Month';
                    });
                  },
                  child: Text('Month'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
