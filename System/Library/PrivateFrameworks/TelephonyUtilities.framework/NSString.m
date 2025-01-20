@interface NSString
+ (id)csd_stringWithCSDVoIPApplicationMessageTransportType:(int64_t)a3;
- (NSUUID)csd_UUIDv5;
@end

@implementation NSString

- (NSUUID)csd_UUIDv5
{
  v3 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", self);
  if (!v3) {
    v3 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID csd_UUIDv5ForString:](&OBJC_CLASS___NSUUID, "csd_UUIDv5ForString:", self));
  }
  return v3;
}

+ (id)csd_stringWithCSDVoIPApplicationMessageTransportType:(int64_t)a3
{
  else {
    return off_1003DC720[a3];
  }
}

@end