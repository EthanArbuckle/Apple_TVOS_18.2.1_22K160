@interface NSBundle
+ (id)mobileBluetoothBundle;
@end

@implementation NSBundle

+ (id)mobileBluetoothBundle
{
  v2 = (void *)qword_100070CA0;
  if (!qword_100070CA0)
  {
    v3 = -[NSBundle initWithPath:]( objc_alloc(&OBJC_CLASS___NSBundle),  "initWithPath:",  @"/System/Library/PrivateFrameworks/MobileBluetooth.framework/");
    v4 = (void *)qword_100070CA0;
    qword_100070CA0 = (uint64_t)v3;

    v2 = (void *)qword_100070CA0;
  }

  return v2;
}

@end