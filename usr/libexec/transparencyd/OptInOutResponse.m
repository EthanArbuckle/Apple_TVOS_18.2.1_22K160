@interface OptInOutResponse
+ (id)descriptor;
@end

@implementation OptInOutResponse

+ (id)descriptor
{
  id v2 = (id)qword_1002EE880;
  if (!qword_1002EE880)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___OptInOutResponse,  @"OptInOutResponse",  &unk_1002E3F50,  &off_1002E4350,  4LL,  32LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C090];
    qword_1002EE880 = (uint64_t)v2;
  }

  return v2;
}

@end