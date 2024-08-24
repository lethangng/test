// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdown extends StatefulWidget {
  final String text;
  final double? widthDropMenu;
  final double? maxHeightDropMenu;
  final List<Map<String, dynamic>>? listData;

  const CustomDropdown({
    super.key,
    required this.text,
    this.widthDropMenu,
    this.maxHeightDropMenu,
    this.listData,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late GlobalKey actionKey;
  late double height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  late OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData() {
    RenderBox renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    // debugPrint('$height');
    // debugPrint('$width');
    // debugPrint('$xPosition');
    // debugPrint('$yPosition');
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        width: widget.widthDropMenu ?? width,
        top: yPosition + height,
        // height: 4 * height + 40,
        child: DropDown(
          itemHeight: widget.maxHeightDropMenu ?? height * 3,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropdownOpened) {
            floatingDropdown.remove();
          } else {
            findDropdownData();
            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context).insert(floatingDropdown);
          }

          isDropdownOpened = !isDropdownOpened;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
          border: Border.all(width: 1, color: const Color(0xFF636363)),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_drop_down,
              color: Color(0xFFC1C1CD),
            ),
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  final double itemHeight;

  const DropDown({
    super.key,
    required this.itemHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: const Alignment(0.8, 0),
          child: SvgPicture.asset('assets/up.svg'),
        ),
        Material(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              // height: 4 * itemHeight,
              constraints: BoxConstraints(maxHeight: itemHeight),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DropDownItem(
                      text: "Add new",
                      // iconData: Icons.person_outline,
                      isSelected: false,
                    ),
                    DropDownItem(
                      text: "View Profile",
                      // iconData: Icons.person_outline,
                      isSelected: false,
                    ),
                    DropDownItem(
                      text: "Settings",
                      // iconData: Icons.settings,
                      isSelected: false,
                    ),
                    DropDownItem(
                      text: "Settings",
                      // iconData: Icons.settings,
                      isSelected: false,
                    ),
                    DropDownItem(
                      text: "Settings",
                      // iconData: Icons.settings,
                      isSelected: false,
                    ),
                    DropDownItem(
                      text: "Logout",
                      // iconData: Icons.settings,
                      isSelected: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownItem extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final bool isSelected;

  const DropDownItem({
    super.key,
    required this.text,
    this.iconData,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF6E47) : const Color(0xFF3F3F40),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFFF0F3F9),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          // const Spacer(),
          // Icon(
          //   iconData,
          //   color: Colors.white,
          // ),
        ],
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ArrowShape extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getOuterPath
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }
}
