@interface TransparencyGPBApi
+ (id)descriptor;
@end

@implementation TransparencyGPBApi

+ (id)descriptor
{
  id result = (id)qword_1002EE7F8;
  if (!qword_1002EE7F8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBApi,  @"Api",  off_1002E3D38,  &off_1002E3C58,  7LL,  56LL,  v3);
    qword_1002EE7F8 = (uint64_t)result;
  }

  return result;
}

@end