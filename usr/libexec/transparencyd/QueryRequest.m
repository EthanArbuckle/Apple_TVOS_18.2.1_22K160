@interface QueryRequest
+ (id)descriptor;
@end

@implementation QueryRequest

+ (id)descriptor
{
  id v2 = (id)qword_1002EEA48;
  if (!qword_1002EEA48)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___QueryRequest,  @"QueryRequest",  &unk_1002E54D0,  &off_1002E5450,  4LL,  32LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C4C8];
    qword_1002EEA48 = (uint64_t)v2;
  }

  return v2;
}

@end