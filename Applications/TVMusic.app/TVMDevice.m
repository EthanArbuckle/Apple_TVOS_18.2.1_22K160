@interface TVMDevice
+ (BOOL)isSingSupported;
- (TVMDevice)init;
@end

@implementation TVMDevice

+ (BOOL)isSingSupported
{
  if (qword_1002B71D8 != -1) {
    swift_once(&qword_1002B71D8, sub_10015F74C);
  }
  return byte_1002C5EA0;
}

- (TVMDevice)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Device();
  return -[TVMDevice init](&v3, "init");
}

@end