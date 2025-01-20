@interface TransparencyGPBEmpty
+ (id)descriptor;
@end

@implementation TransparencyGPBEmpty

+ (id)descriptor
{
  id result = (id)qword_1002EE6F0;
  if (!qword_1002EE6F0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBEmpty,  @"Empty",  off_1002E34B0,  0LL,  0LL,  4LL,  v3);
    qword_1002EE6F0 = (uint64_t)result;
  }

  return result;
}

@end