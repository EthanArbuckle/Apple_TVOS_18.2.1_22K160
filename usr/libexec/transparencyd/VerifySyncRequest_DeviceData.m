@interface VerifySyncRequest_DeviceData
+ (id)descriptor;
@end

@implementation VerifySyncRequest_DeviceData

+ (id)descriptor
{
  id v2 = (id)qword_1002EE890;
  if (!qword_1002EE890)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___VerifySyncRequest_DeviceData,  @"DeviceData",  &unk_1002E3F50,  &off_1002E44D0,  8LL,  56LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C06A];
    [v2 setupContainingMessageClass:VerifySyncRequest];
    qword_1002EE890 = (uint64_t)v2;
  }

  return v2;
}

@end