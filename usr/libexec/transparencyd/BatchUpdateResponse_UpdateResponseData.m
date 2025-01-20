@interface BatchUpdateResponse_UpdateResponseData
+ (id)descriptor;
@end

@implementation BatchUpdateResponse_UpdateResponseData

+ (id)descriptor
{
  id v2 = (id)qword_1002EE868;
  if (!qword_1002EE868)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___BatchUpdateResponse_UpdateResponseData,  @"UpdateResponseData",  &unk_1002E3F50,  &off_1002E41E8,  3LL,  32LL,  v4);
    [v2 setupOneofs:off_1002E4248 count:1 firstHasIndex:0xFFFFFFFFLL];
    [v2 setupExtraTextInfo:&unk_10024C051];
    [v2 setupContainingMessageClass:BatchUpdateResponse];
    qword_1002EE868 = (uint64_t)v2;
  }

  return v2;
}

@end