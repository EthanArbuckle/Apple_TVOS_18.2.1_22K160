@interface NSUUID
+ (id)lib_UUIDWithLegacyJobID:(int64_t)a3;
+ (id)lib_shortLogKey;
+ (id)lib_shortLogKeyWithAPIVersion:(int64_t)a3;
- (NSString)lib_logUUID;
- (int64_t)lib_legacyJobID;
- (unint64_t)lib_signpostId;
- (void)_lib_getBytes:(void *)a3 count:(unint64_t)a4;
@end

@implementation NSUUID

+ (id)lib_UUIDWithLegacyJobID:(int64_t)a3
{
  v4[0] = a3;
  v4[1] = 0LL;
  return -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v4);
}

- (int64_t)lib_legacyJobID
{
  int64_t v3 = 0LL;
  -[NSUUID _lib_getBytes:count:](self, "_lib_getBytes:count:", &v3, 8LL);
  return v3;
}

- (NSString)lib_logUUID
{
  unsigned int v3 = 0;
  -[NSUUID _lib_getBytes:count:](self, "_lib_getBytes:count:", &v3, 4LL);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%08X",  v3));
}

- (unint64_t)lib_signpostId
{
  unint64_t v3 = 0LL;
  -[NSUUID _lib_getBytes:count:](self, "_lib_getBytes:count:", &v3, 4LL);
  return v3;
}

+ (id)lib_shortLogKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@"-"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  return v5;
}

+ (id)lib_shortLogKeyWithAPIVersion:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lib_shortLogKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_SK%ld", v4, a3));

  return v5;
}

- (void)_lib_getBytes:(void *)a3 count:(unint64_t)a4
{
  __src[0] = 0LL;
  __src[1] = 0LL;
  -[NSUUID getUUIDBytes:](self, "getUUIDBytes:", __src);
  if (a4 >= 0x11) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSRangeException,  @"%@: count %lu exceeds available length: %lu",  self,  a4,  16LL);
  }
  memcpy(a3, __src, a4);
}

@end