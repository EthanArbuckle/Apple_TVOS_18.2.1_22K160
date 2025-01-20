@interface TransparencyGPBEnum
+ (id)descriptor;
@end

@implementation TransparencyGPBEnum

+ (id)descriptor
{
  id result = (id)qword_1002EE780;
  if (!qword_1002EE780)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBEnum,  @"Enum",  off_1002E3830,  &off_1002E3988,  5LL,  40LL,  v3);
    qword_1002EE780 = (uint64_t)result;
  }

  return result;
}

@end