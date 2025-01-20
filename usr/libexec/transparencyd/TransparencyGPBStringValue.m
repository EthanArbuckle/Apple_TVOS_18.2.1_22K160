@interface TransparencyGPBStringValue
+ (id)descriptor;
@end

@implementation TransparencyGPBStringValue

+ (id)descriptor
{
  id result = (id)qword_1002EE7E0;
  if (!qword_1002EE7E0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBStringValue,  @"StringValue",  off_1002E3AE8,  &off_1002E3BC0,  1LL,  16LL,  v3);
    qword_1002EE7E0 = (uint64_t)result;
  }

  return result;
}

@end