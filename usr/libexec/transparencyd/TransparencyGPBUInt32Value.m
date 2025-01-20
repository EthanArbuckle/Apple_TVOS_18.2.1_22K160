@interface TransparencyGPBUInt32Value
+ (id)descriptor;
@end

@implementation TransparencyGPBUInt32Value

+ (id)descriptor
{
  id result = (id)qword_1002EE7D0;
  if (!qword_1002EE7D0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBUInt32Value,  @"UInt32Value",  off_1002E3AE8,  &off_1002E3B80,  1LL,  8LL,  v3);
    qword_1002EE7D0 = (uint64_t)result;
  }

  return result;
}

@end