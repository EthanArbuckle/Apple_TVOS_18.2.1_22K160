@interface TransparencyGPBStruct
+ (id)descriptor;
@end

@implementation TransparencyGPBStruct

+ (id)descriptor
{
  id result = (id)qword_1002EE738;
  if (!qword_1002EE738)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBStruct,  @"Struct",  off_1002E3618,  &off_1002E35F8,  1LL,  16LL,  v3);
    qword_1002EE738 = (uint64_t)result;
  }

  return result;
}

@end