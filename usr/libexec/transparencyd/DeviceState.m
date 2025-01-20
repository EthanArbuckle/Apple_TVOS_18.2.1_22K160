@interface DeviceState
+ (id)descriptor;
@end

@implementation DeviceState

+ (id)descriptor
{
  id v2 = (id)qword_1002EE858;
  if (!qword_1002EE858)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___DeviceState,  @"DeviceState",  &unk_1002E3F50,  &off_1002E40E8,  5LL,  48LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C03B];
    qword_1002EE858 = (uint64_t)v2;
  }

  return v2;
}

@end