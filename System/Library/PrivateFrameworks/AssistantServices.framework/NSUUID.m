@interface NSUUID
+ (id)ad_createV5UUIDWithNamespace:(id)a3;
@end

@implementation NSUUID

+ (id)ad_createV5UUIDWithNamespace:(id)a3
{
  id v3 = a3;
  CC_SHA1_Init(&c);
  sub_1000741D4(&c, v3);
  v8 = (void **)&v14;
  v4 = v13;
  if (v13)
  {
    do
    {
      sub_1000741D4(&c, v4);
      v5 = v8++;
      v4 = *v5;
    }

    while (*v5);
  }

  CC_SHA1_Final(md, &c);
  char v11 = v11 & 0xF | 0x50;
  char v12 = v12 & 0x3F | 0x80;
  v6 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", md);

  return v6;
}

@end