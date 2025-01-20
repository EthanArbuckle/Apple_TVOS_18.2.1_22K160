@interface TransparencyGPBMixin
+ (id)descriptor;
@end

@implementation TransparencyGPBMixin

+ (id)descriptor
{
  id result = (id)qword_1002EE808;
  if (!qword_1002EE808)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBMixin,  @"Mixin",  off_1002E3D38,  &off_1002E3E30,  2LL,  24LL,  v3);
    qword_1002EE808 = (uint64_t)result;
  }

  return result;
}

@end