@interface TransparencyGPBInt64Value
+ (id)descriptor;
@end

@implementation TransparencyGPBInt64Value

+ (id)descriptor
{
  id result = (id)qword_1002EE7B8;
  if (!qword_1002EE7B8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBInt64Value,  @"Int64Value",  off_1002E3AE8,  &off_1002E3B20,  1LL,  16LL,  v3);
    qword_1002EE7B8 = (uint64_t)result;
  }

  return result;
}

@end