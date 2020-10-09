import 'package:flutter/material.dart';

class pageModel{
  String _titles;
  String _descriptions;
  IconData _icons;
  String _images;

  pageModel(this._titles, this._descriptions, this._icons, this._images);

  String get images => _images;

  IconData get icons => _icons;

  String get descriptions => _descriptions;

  String get titles => _titles;
}