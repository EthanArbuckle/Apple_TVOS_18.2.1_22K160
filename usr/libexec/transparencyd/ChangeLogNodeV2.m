@interface ChangeLogNodeV2
+ (id)descriptor;
@end

@implementation ChangeLogNodeV2

+ (id)descriptor
{
  id result = (id)qword_1002EE988;
  if (!qword_1002EE988)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___ChangeLogNodeV2,  @"ChangeLogNodeV2",  &unk_1002E4B60,  &off_1002E5058,  1LL,  16LL,  v3);
    qword_1002EE988 = (uint64_t)result;
  }

  return result;
}

@end