@interface TransparencyGPBMethod
+ (id)descriptor;
@end

@implementation TransparencyGPBMethod

+ (id)descriptor
{
  id v2 = (id)qword_1002EE800;
  if (!qword_1002EE800)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBMethod,  @"Method",  off_1002E3D38,  &off_1002E3D50,  7LL,  40LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024BFE0];
    qword_1002EE800 = (uint64_t)v2;
  }

  return v2;
}

@end