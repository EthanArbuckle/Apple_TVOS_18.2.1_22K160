@interface PerApplicationTreeConfigNode
+ (id)descriptor;
@end

@implementation PerApplicationTreeConfigNode

+ (id)descriptor
{
  id v2 = (id)qword_1002EE9A0;
  if (!qword_1002EE9A0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___PerApplicationTreeConfigNode,  @"PerApplicationTreeConfigNode",  &unk_1002E4B60,  &off_1002E50B8,  3LL,  24LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C49C];
    qword_1002EE9A0 = (uint64_t)v2;
  }

  return v2;
}

@end