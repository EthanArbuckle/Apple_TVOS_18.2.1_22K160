@interface NSURLResponse
- (NSString)asset_cdnUUID;
- (int64_t)asset_statusCode;
@end

@implementation NSURLResponse

- (NSString)asset_cdnUUID
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLResponse valueForHTTPHeaderField:](self, "valueForHTTPHeaderField:", @"CDNUUID"));
  }
  else {
    v4 = 0LL;
  }
  return (NSString *)v4;
}

- (int64_t)asset_statusCode
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0) {
    return (int64_t)-[NSURLResponse statusCode](self, "statusCode");
  }
  else {
    return -1LL;
  }
}

@end