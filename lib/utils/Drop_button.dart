import 'package:fina/utils/color.dart';
import 'package:flutter/material.dart';

class PopupMenu extends StatefulWidget {
  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  String _selectedValue = 'Day'; // Giá trị mặc định
  final List<String> _options = ['Day', 'Week', 'Month'];

  void _handleMenuItemSelected(String value) {
    if (value == "Day") {
      print('Thien');
    } else if (value == "Week") {
      print('Phuc');
    } else {
      print("Dev");
    }
    // Thực hiện hành động khi một mục được chọn

    // Bạn có thể thêm logic tùy chỉnh của mình tại đây
    // Ví dụ: show a dialog or perform some other action
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          _selectedValue = value;
        });
        _handleMenuItemSelected(value); // Gọi hàm khi mục được chọn
      },
      itemBuilder: (BuildContext context) {
        return _options.map((String value) {
          return PopupMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: themColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(_selectedValue),
            SizedBox(width: 8),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
