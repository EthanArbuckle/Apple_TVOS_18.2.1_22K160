@interface VerifySyncRequest
+ (id)descriptor;
@end

@implementation VerifySyncRequest

+ (id)descriptor
{
  id v2 = (id)qword_1002EE888;
  if (!qword_1002EE888)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___VerifySyncRequest,  @"VerifySyncRequest",  &unk_1002E3F50,  &off_1002E43D0,  8LL,  56LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C05C];
    qword_1002EE888 = (uint64_t)v2;
  }

  return v2;
}

@end