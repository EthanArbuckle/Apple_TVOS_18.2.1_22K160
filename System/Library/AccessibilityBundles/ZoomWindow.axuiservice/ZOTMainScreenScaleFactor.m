@interface ZOTMainScreenScaleFactor
@end

@implementation ZOTMainScreenScaleFactor

void __ZOTMainScreenScaleFactor_block_invoke(id a1)
{
  ZOTMainScreenScaleFactor_kZOTMainScreenScaleFactor = AXDeviceGetMainScreenScaleFactor(a1);
}

@end