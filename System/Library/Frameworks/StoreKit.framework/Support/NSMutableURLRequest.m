@interface NSMutableURLRequest
- (void)asset_setRangeOffset:(unint64_t)a3;
@end

@implementation NSMutableURLRequest

- (void)asset_setRangeOffset:(unint64_t)a3
{
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
    +[NSURLProtocol setProperty:forKey:inRequest:]( &OBJC_CLASS___NSURLProtocol,  "setProperty:forKey:inRequest:",  v5,  @"AssetRequetPropertyRangeOffset",  self);

    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"bytes=%llu-", a3));
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](self, "setValue:forHTTPHeaderField:", v6, @"Range");
  }

  else
  {
    +[NSURLProtocol removePropertyForKey:inRequest:]( &OBJC_CLASS___NSURLProtocol,  "removePropertyForKey:inRequest:",  @"AssetRequetPropertyRangeOffset",  self);
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](self, "setValue:forHTTPHeaderField:", 0LL, @"Range");
  }

@end