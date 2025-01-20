@interface PerApplicationTreeNode
+ (id)descriptor;
@end

@implementation PerApplicationTreeNode

+ (id)descriptor
{
  id v2 = (id)qword_1002EE990;
  if (!qword_1002EE990)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___PerApplicationTreeNode,  @"PerApplicationTreeNode",  &unk_1002E4B60,  &off_1002E5078,  1LL,  16LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C492];
    qword_1002EE990 = (uint64_t)v2;
  }

  return v2;
}

@end