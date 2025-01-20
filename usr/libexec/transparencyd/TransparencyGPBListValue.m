@interface TransparencyGPBListValue
+ (id)descriptor;
@end

@implementation TransparencyGPBListValue

+ (id)descriptor
{
  id result = (id)qword_1002EE748;
  if (!qword_1002EE748)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBListValue,  @"ListValue",  off_1002E3618,  &off_1002E36F8,  1LL,  16LL,  v3);
    qword_1002EE748 = (uint64_t)result;
  }

  return result;
}

@end