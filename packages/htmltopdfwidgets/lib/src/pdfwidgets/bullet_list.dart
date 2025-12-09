import 'package:htmltopdfwidgets/htmltopdfwidgets.dart';

Widget buildBulletwidget(Widget childValue,
    {required HtmlTagStyle customStyles, required bool isArabic}) {
  // Create a container to hold the child elements.
  Widget child = Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if(!isArabic)
        BulletedListIcon(style: customStyles), // Include the bullet icon.
        Flexible(child: childValue), // Include the main content child widget.
        if(isArabic)
          BulletedListIcon(style: customStyles)
      ],
    ),
  );
  return child; // Return the resulting child widget.
}

class BulletedListIcon extends StatelessWidget {
  final HtmlTagStyle style;

  // Constructor to initialize the 'style' property.
  BulletedListIcon({required this.style});

  @override
  Widget build(Context context) {
    return SizedBox(
      width: 22,
      height: 22,
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Center(
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Bullet icon is circular.
              color: style.bulletListIconColor ??
                  PdfColors.black, // Apply custom color.
            ),
          ),
        ),
      ),
    );
  }
}
