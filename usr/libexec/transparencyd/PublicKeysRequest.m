@interface PublicKeysRequest
+ (id)descriptor;
@end

@implementation PublicKeysRequest

+ (id)descriptor
{
  id v2 = (id)qword_1002EE8D0;
  if (!qword_1002EE8D0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___PublicKeysRequest,  @"PublicKeysRequest",  &unk_1002E46D0,  &off_1002E48E8,  3LL,  24LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C0CA];
    qword_1002EE8D0 = (uint64_t)v2;
  }

  return v2;
}

@end