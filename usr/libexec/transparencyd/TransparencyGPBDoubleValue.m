@interface TransparencyGPBDoubleValue
+ (id)descriptor;
@end

@implementation TransparencyGPBDoubleValue

+ (id)descriptor
{
  id result = (id)qword_1002EE7A8;
  if (!qword_1002EE7A8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBDoubleValue,  @"DoubleValue",  off_1002E3AE8,  &off_1002E3AC8,  1LL,  16LL,  v3);
    qword_1002EE7A8 = (uint64_t)result;
  }

  return result;
}

@end