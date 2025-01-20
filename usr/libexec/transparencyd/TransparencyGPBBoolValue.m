@interface TransparencyGPBBoolValue
+ (id)descriptor;
@end

@implementation TransparencyGPBBoolValue

+ (id)descriptor
{
  id result = (id)qword_1002EE7D8;
  if (!qword_1002EE7D8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBBoolValue,  @"BoolValue",  off_1002E3AE8,  &off_1002E3BA0,  1LL,  4LL,  v3);
    qword_1002EE7D8 = (uint64_t)result;
  }

  return result;
}

@end