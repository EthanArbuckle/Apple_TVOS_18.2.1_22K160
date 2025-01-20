@interface ConsistencyProofRequest
+ (id)descriptor;
@end

@implementation ConsistencyProofRequest

+ (id)descriptor
{
  id v2 = (id)qword_1002EE8A0;
  if (!qword_1002EE8A0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___ConsistencyProofRequest,  @"ConsistencyProofRequest",  &unk_1002E46D0,  &off_1002E4630,  5LL,  32LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C098];
    qword_1002EE8A0 = (uint64_t)v2;
  }

  return v2;
}

@end