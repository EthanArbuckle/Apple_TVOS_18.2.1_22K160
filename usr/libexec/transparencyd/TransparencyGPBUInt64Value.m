@interface TransparencyGPBUInt64Value
+ (id)descriptor;
@end

@implementation TransparencyGPBUInt64Value

+ (id)descriptor
{
  id result = (id)qword_1002EE7C0;
  if (!qword_1002EE7C0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBUInt64Value,  @"UInt64Value",  off_1002E3AE8,  &off_1002E3B40,  1LL,  16LL,  v3);
    qword_1002EE7C0 = (uint64_t)result;
  }

  return result;
}

@end