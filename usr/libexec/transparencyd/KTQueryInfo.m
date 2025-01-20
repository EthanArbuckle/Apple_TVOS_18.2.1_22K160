@interface KTQueryInfo
+ (id)descriptor;
@end

@implementation KTQueryInfo

+ (id)descriptor
{
  id v2 = (id)qword_1002EED20;
  if (!qword_1002EED20)
  {
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___KTQueryInfo, a2);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___KtsmdataStoreMessagesRoot, v4);
    if (!qword_1002EED28) {
      qword_1002EED28 = -[TransparencyGPBFileDescriptor initWithPackage:syntax:]( objc_alloc(&OBJC_CLASS___TransparencyGPBFileDescriptor),  "initWithPackage:syntax:",  &stru_10028E390,  3LL);
    }
    LODWORD(v7) = 12;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:",  v3,  v5,  v7);
    [v2 setupExtraTextInfo:&unk_10024C578];
    qword_1002EED20 = (uint64_t)v2;
  }

  return v2;
}

@end