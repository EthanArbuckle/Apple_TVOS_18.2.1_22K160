@interface InsertResponse
+ (id)descriptor;
@end

@implementation InsertResponse

+ (id)descriptor
{
  id v2 = (id)qword_1002EE870;
  if (!qword_1002EE870)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___InsertResponse,  @"InsertResponse",  &unk_1002E3F50,  &off_1002E4250,  4LL,  32LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C088];
    qword_1002EE870 = (uint64_t)v2;
  }

  return v2;
}

@end