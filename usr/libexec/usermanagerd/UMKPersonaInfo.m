@interface UMKPersonaInfo
- (UMKPersonaInfo)init;
@end

@implementation UMKPersonaInfo

- (UMKPersonaInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UMKPersonaInfo;
  v2 = -[UMKPersonaInfo init](&v6, "init");
  if (!v2) {
    sub_1000A9AD0();
  }
  v3 = v2;

  *(void *)&v3->_id = 0xFFFFFFFFLL;
  name = v3->_name;
  v3->_name = (NSString *)&stru_1000D0A68;

  v3->_uid = -101;
  return v3;
}

- (void).cxx_destruct
{
}

@end