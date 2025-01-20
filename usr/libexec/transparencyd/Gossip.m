@interface Gossip
+ (id)descriptor;
@end

@implementation Gossip

+ (id)descriptor
{
  id result = (id)qword_1002EE8E0;
  if (!qword_1002EE8E0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___Gossip,  @"Gossip",  &unk_1002E4AE8,  &off_1002E4AA8,  2LL,  16LL,  v3);
    qword_1002EE8E0 = (uint64_t)result;
  }

  return result;
}

@end