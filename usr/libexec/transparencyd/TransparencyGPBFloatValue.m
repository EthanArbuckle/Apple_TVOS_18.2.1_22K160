@interface TransparencyGPBFloatValue
+ (id)descriptor;
@end

@implementation TransparencyGPBFloatValue

+ (id)descriptor
{
  id result = (id)qword_1002EE7B0;
  if (!qword_1002EE7B0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBFloatValue,  @"FloatValue",  off_1002E3AE8,  &off_1002E3B00,  1LL,  8LL,  v3);
    qword_1002EE7B0 = (uint64_t)result;
  }

  return result;
}

@end