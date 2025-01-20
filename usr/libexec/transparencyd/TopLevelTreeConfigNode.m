@interface TopLevelTreeConfigNode
+ (id)descriptor;
@end

@implementation TopLevelTreeConfigNode

+ (id)descriptor
{
  id v2 = (id)qword_1002EE9A8;
  if (!qword_1002EE9A8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TopLevelTreeConfigNode,  @"TopLevelTreeConfigNode",  &unk_1002E4B60,  &off_1002E5118,  2LL,  16LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C4B0];
    qword_1002EE9A8 = (uint64_t)v2;
  }

  return v2;
}

@end