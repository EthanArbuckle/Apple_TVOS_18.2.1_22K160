@interface BatchQueryRequest
+ (id)descriptor;
@end

@implementation BatchQueryRequest

+ (id)descriptor
{
  id result = (id)qword_1002EEA58;
  if (!qword_1002EEA58)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___BatchQueryRequest,  @"BatchQueryRequest",  &unk_1002E54D0,  &off_1002E5568,  3LL,  24LL,  v3);
    qword_1002EEA58 = (uint64_t)result;
  }

  return result;
}

@end