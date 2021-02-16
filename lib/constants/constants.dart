import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/models/book.dart';

String infoChannel = "info";
String reqChannel = "req";
String redisURL = "redis://192.168.87.105:6379";
DrawableRoot svgDuck;
String mainScreen = "mainScreen";
String bookDetail = "/bookDetail";
String booksList = "/booksList";
String bookStoresRoute = "/bookStores";
final String smallDuckString =
    """<<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="225px" height="225px" viewBox="0 0 225 225" enable-background="new 0 0 225 225" xml:space="preserve">  <image id="image0" width="225" height="225" x="0" y="0"
    xlink:href="data:image/png;base64,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" />
</svg>
""";
