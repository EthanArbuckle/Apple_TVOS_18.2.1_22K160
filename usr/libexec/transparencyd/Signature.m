@interface Signature
+ (id)descriptor;
@end

@implementation Signature

+ (id)descriptor
{
  id v2 = (id)qword_1002EE948;
  if (!qword_1002EE948)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___Signature,  @"Signature",  &unk_1002E4B60,  &off_1002E4BB8,  3LL,  24LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C40D];
    qword_1002EE948 = (uint64_t)v2;
  }

  return v2;
}

@end