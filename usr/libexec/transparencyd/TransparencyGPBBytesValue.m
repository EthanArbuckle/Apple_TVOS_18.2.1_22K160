@interface TransparencyGPBBytesValue
+ (id)descriptor;
@end

@implementation TransparencyGPBBytesValue

+ (id)descriptor
{
  id result = (id)qword_1002EE7E8;
  if (!qword_1002EE7E8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBBytesValue,  @"BytesValue",  off_1002E3AE8,  &off_1002E3BE0,  1LL,  16LL,  v3);
    qword_1002EE7E8 = (uint64_t)result;
  }

  return result;
}

@end