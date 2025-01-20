@interface TransparencyGPBValue
+ (id)descriptor;
@end

@implementation TransparencyGPBValue

+ (id)descriptor
{
  id v2 = (id)qword_1002EE740;
  if (!qword_1002EE740)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBValue,  @"Value",  off_1002E3618,  &off_1002E3630,  6LL,  48LL,  v4);
    [v2 setupOneofs:off_1002E36F0 count:1 firstHasIndex:0xFFFFFFFFLL];
    qword_1002EE740 = (uint64_t)v2;
  }

  return v2;
}

@end