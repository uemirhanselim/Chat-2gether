import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSpace extends StatelessWidget {
  
  const HorizontalSpace({super.key, required this.spaceWidth});
  final double spaceWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: spaceWidth.w,
    );
  }
}