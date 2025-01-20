@interface VerifySyncResponse
+ (id)descriptor;
@end

@implementation VerifySyncResponse

+ (id)descriptor
{
  id v2 = (id)qword_1002EE898;
  if (!qword_1002EE898)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___VerifySyncResponse,  @"VerifySyncResponse",  &unk_1002E3F50,  &off_1002E45D0,  3LL,  16LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C04C];
    qword_1002EE898 = (uint64_t)v2;
  }

  return v2;
}

@end