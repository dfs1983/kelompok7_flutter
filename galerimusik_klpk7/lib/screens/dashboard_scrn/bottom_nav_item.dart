import 'package:flutter/material.dart';
import 'package:galerimusik_klpk7/screens/diary_scrn/diary_scrn.dart';
import 'package:galerimusik_klpk7/screens/search_scrn/search_scrn.dart';

import '../saved_songs_scrn.dart';
import '../settings_scrn.dart';

class BottomNavigatorItem {
  final int index;
  final String label;
  final IconData iconData;
  final Widget screen;

  BottomNavigatorItem(this.index, this.label, this.iconData, this.screen);
}

List<BottomNavigatorItem> navigatorItems = [
  BottomNavigatorItem(
    0,
    "Search",
    Icons.library_music_sharp,
    SearchScreen(),
  ),
  BottomNavigatorItem(
    1,
    "Favorite",
    Icons.favorite,
    SavedSongsScreen(),
  ),
  BottomNavigatorItem(
    2,
    "Diary",
    Icons.edit_note_sharp,
    DiaryScreen(),
  ),
  BottomNavigatorItem(
    3,
    "Settings",
    Icons.settings,
    SettingsScreen(),
  ),
];
