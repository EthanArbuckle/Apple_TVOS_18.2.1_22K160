@interface BatchUpdateRequest_UpdateData
+ (id)descriptor;
@end

@implementation BatchUpdateRequest_UpdateData

+ (id)descriptor
{
  id v2 = (id)qword_1002EE850;
  if (!qword_1002EE850)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___BatchUpdateRequest_UpdateData,  @"UpdateData",  &unk_1002E3F50,  &off_1002E3F68,  12LL,  72LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C021];
    [v2 setupContainingMessageClass:BatchUpdateRequest];
    qword_1002EE850 = (uint64_t)v2;
  }

  return v2;
}

@end