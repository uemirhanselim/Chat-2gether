import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({super.key, required this.heightSpace});
  final double heightSpace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSpace.h,
    );
  }
}
