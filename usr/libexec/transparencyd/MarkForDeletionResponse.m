@interface MarkForDeletionResponse
+ (id)descriptor;
@end

@implementation MarkForDeletionResponse

+ (id)descriptor
{
  id v2 = (id)qword_1002EE878;
  if (!qword_1002EE878)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___MarkForDeletionResponse,  @"MarkForDeletionResponse",  &unk_1002E3F50,  &off_1002E42D0,  4LL,  32LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C090];
    qword_1002EE878 = (uint64_t)v2;
  }

  return v2;
}

@end