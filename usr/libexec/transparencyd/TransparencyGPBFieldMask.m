@interface TransparencyGPBFieldMask
+ (id)descriptor;
@end

@implementation TransparencyGPBFieldMask

+ (id)descriptor
{
  id result = (id)qword_1002EE6F8;
  if (!qword_1002EE6F8)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBFieldMask,  @"FieldMask",  off_1002E3548,  &off_1002E3528,  1LL,  16LL,  v3);
    qword_1002EE6F8 = (uint64_t)result;
  }

  return result;
}

@end