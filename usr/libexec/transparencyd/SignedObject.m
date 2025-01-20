@interface SignedObject
+ (id)descriptor;
@end

@implementation SignedObject

+ (id)descriptor
{
  id result = (id)qword_1002EE950;
  if (!qword_1002EE950)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___SignedObject,  @"SignedObject",  &unk_1002E4B60,  &off_1002E4C18,  2LL,  24LL,  v3);
    qword_1002EE950 = (uint64_t)result;
  }

  return result;
}

@end