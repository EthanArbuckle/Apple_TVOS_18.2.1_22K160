@interface NSString
- (id)mt_SHA1Base62String;
@end

@implementation NSString

- (id)mt_SHA1Base62String
{
  id v2 = objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 4LL));
  CC_SHA1([v2 bytes], (CC_LONG)objc_msgSend(v2, "length"), md);
  v3 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", md);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID mt_base62String](v3, "mt_base62String"));

  return v4;
}

@end