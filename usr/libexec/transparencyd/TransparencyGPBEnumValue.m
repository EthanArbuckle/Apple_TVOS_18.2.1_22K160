@interface TransparencyGPBEnumValue
+ (id)descriptor;
@end

@implementation TransparencyGPBEnumValue

+ (id)descriptor
{
  id result = (id)qword_1002EE788;
  if (!qword_1002EE788)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBEnumValue,  @"EnumValue",  off_1002E3830,  &off_1002E3A28,  3LL,  24LL,  v3);
    qword_1002EE788 = (uint64_t)result;
  }

  return result;
}

@end