@interface TransparencyGPBField
+ (id)descriptor;
@end

@implementation TransparencyGPBField

+ (id)descriptor
{
  id v2 = (id)qword_1002EE778;
  if (!qword_1002EE778)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBField,  @"Field",  off_1002E3830,  &off_1002E3848,  10LL,  64LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024BF48];
    qword_1002EE778 = (uint64_t)v2;
  }

  return v2;
}

@end