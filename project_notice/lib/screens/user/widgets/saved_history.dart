import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_notice/screens/user/widgets/post_detail.dart';

import '../../../constants/colors.dart';

class SavedHistory extends StatefulWidget {
  const SavedHistory({super.key});

  @override
  State<SavedHistory> createState() => _SavedHistoryState();
}

class _SavedHistoryState extends State<SavedHistory> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                      print(_selectedIndex);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedIndex == 0 ? kAccent : kFont,
                          width: _selectedIndex == 0 ? 4.0 : 1,
                        ),
                      ),
                    ),
                    child: Text(
                      'Give Away',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: _selectedIndex == 0 ? kAccent : kFontLight,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                      print(_selectedIndex);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedIndex == 1 ? kAccent : kFont,
                          width: _selectedIndex == 1 ? 4.0 : 1,
                        ),
                      ),
                    ),
                    child: Text(
                      'Lost/Found',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: _selectedIndex == 1 ? kAccent : kFontLight,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          PostDetail(),
        ],
      ),
    );
  }
}
