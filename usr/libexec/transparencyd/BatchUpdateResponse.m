@interface BatchUpdateResponse
+ (id)descriptor;
@end

@implementation BatchUpdateResponse

+ (id)descriptor
{
  id v2 = (id)qword_1002EE860;
  if (!qword_1002EE860)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___BatchUpdateResponse,  @"BatchUpdateResponse",  &unk_1002E3F50,  &off_1002E4188,  3LL,  24LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C04C];
    qword_1002EE860 = (uint64_t)v2;
  }

  return v2;
}

@end