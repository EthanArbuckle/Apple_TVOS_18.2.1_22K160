@interface ConsistencyProofRequest_LogConsistencyRequest
+ (id)descriptor;
@end

@implementation ConsistencyProofRequest_LogConsistencyRequest

+ (id)descriptor
{
  id v2 = (id)qword_1002EE8A8;
  if (!qword_1002EE8A8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___ConsistencyProofRequest_LogConsistencyRequest,  @"LogConsistencyRequest",  &unk_1002E46D0,  &off_1002E46E8,  2LL,  24LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C0A0];
    [v2 setupContainingMessageClass:ConsistencyProofRequest];
    qword_1002EE8A8 = (uint64_t)v2;
  }

  return v2;
}

@end