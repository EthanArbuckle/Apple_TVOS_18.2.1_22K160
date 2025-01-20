@interface TopLevelTreeNode
+ (id)descriptor;
@end

@implementation TopLevelTreeNode

+ (id)descriptor
{
  id v2 = (id)qword_1002EE998;
  if (!qword_1002EE998)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TopLevelTreeNode,  @"TopLevelTreeNode",  &unk_1002E4B60,  &off_1002E5098,  1LL,  16LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C497];
    qword_1002EE998 = (uint64_t)v2;
  }

  return v2;
}

@end