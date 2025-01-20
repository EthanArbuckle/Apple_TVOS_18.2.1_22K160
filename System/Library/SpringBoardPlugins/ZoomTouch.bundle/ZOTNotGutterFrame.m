@interface ZOTNotGutterFrame
@end

@implementation ZOTNotGutterFrame

void __ZOTNotGutterFrame_block_invoke(id a1)
{
  double v1 = ZOTMainScreenSize(a1);
  double v3 = v2;
  float v4 = ZOTGutterDistance();
  *(double *)&uint64_t v5 = v4;
  double v6 = (float)(v4 + v4);
  ZOTNotGutterFrame_nonGutterFrame_0 = v5;
  ZOTNotGutterFrame_nonGutterFrame_1 = v5;
  *(double *)&ZOTNotGutterFrame_nonGutterFrame_2 = v1 - v6;
  *(double *)&ZOTNotGutterFrame_nonGutterFrame_3 = v3 - v6;
}

@end