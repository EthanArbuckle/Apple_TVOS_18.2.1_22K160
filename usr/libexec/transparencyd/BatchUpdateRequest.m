@interface BatchUpdateRequest
+ (id)descriptor;
@end

@implementation BatchUpdateRequest

+ (id)descriptor
{
  id v2 = (id)qword_1002EE848;
  if (!qword_1002EE848)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___BatchUpdateRequest,  @"BatchUpdateRequest",  &unk_1002E3F50,  &off_1002E3ED0,  4LL,  32LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C01C];
    qword_1002EE848 = (uint64_t)v2;
  }

  return v2;
}

@end