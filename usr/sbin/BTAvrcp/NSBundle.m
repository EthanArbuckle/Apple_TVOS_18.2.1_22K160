@interface NSBundle
+ (id)mobileBluetoothBundle;
@end

@implementation NSBundle

+ (id)mobileBluetoothBundle
{
  v2 = (void *)qword_10001F1B8;
  if (!qword_10001F1B8)
  {
    v3 = -[NSBundle initWithPath:]( objc_alloc(&OBJC_CLASS___NSBundle),  "initWithPath:",  @"/System/Library/PrivateFrameworks/MobileBluetooth.framework/");
    v4 = (void *)qword_10001F1B8;
    qword_10001F1B8 = (uint64_t)v3;

    v2 = (void *)qword_10001F1B8;
  }

  return v2;
}

@end