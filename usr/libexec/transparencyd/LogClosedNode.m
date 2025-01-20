@interface LogClosedNode
+ (id)descriptor;
@end

@implementation LogClosedNode

+ (id)descriptor
{
  id v2 = (id)qword_1002EE9B0;
  if (!qword_1002EE9B0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___LogClosedNode,  @"LogClosedNode",  &unk_1002E4B60,  &off_1002E5158,  2LL,  16LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C4B8];
    qword_1002EE9B0 = (uint64_t)v2;
  }

  return v2;
}

@end