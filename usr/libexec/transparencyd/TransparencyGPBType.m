@interface TransparencyGPBType
+ (id)descriptor;
@end

@implementation TransparencyGPBType

+ (id)descriptor
{
  id result = (id)qword_1002EE770;
  if (!qword_1002EE770)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBType,  @"Type",  off_1002E3830,  &off_1002E3770,  6LL,  48LL,  v3);
    qword_1002EE770 = (uint64_t)result;
  }

  return result;
}

@end