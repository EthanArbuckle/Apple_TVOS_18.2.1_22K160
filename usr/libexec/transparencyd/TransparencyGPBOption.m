@interface TransparencyGPBOption
+ (id)descriptor;
@end

@implementation TransparencyGPBOption

+ (id)descriptor
{
  id result = (id)qword_1002EE790;
  if (!qword_1002EE790)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBOption,  @"Option",  off_1002E3830,  &off_1002E3A88,  2LL,  24LL,  v3);
    qword_1002EE790 = (uint64_t)result;
  }

  return result;
}

@end