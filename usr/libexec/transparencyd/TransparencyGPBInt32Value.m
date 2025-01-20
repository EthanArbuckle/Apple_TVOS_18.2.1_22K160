@interface TransparencyGPBInt32Value
+ (id)descriptor;
@end

@implementation TransparencyGPBInt32Value

+ (id)descriptor
{
  id result = (id)qword_1002EE7C8;
  if (!qword_1002EE7C8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBInt32Value,  @"Int32Value",  off_1002E3AE8,  &off_1002E3B60,  1LL,  8LL,  v3);
    qword_1002EE7C8 = (uint64_t)result;
  }

  return result;
}

@end