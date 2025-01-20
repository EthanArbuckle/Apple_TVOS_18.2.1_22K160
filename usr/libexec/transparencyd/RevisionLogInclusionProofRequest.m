@interface RevisionLogInclusionProofRequest
+ (id)descriptor;
@end

@implementation RevisionLogInclusionProofRequest

+ (id)descriptor
{
  id v2 = (id)qword_1002EE8C0;
  if (!qword_1002EE8C0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___RevisionLogInclusionProofRequest,  @"RevisionLogInclusionProofRequest",  &unk_1002E46D0,  &off_1002E4808,  4LL,  24LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C0C5];
    qword_1002EE8C0 = (uint64_t)v2;
  }

  return v2;
}

@end