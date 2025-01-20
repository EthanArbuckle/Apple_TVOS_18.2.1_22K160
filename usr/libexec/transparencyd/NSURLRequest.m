@interface NSURLRequest
- (id)kt_requestId;
@end

@implementation NSURLRequest

- (id)kt_requestId
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLRequest allHTTPHeaderFields](self, "allHTTPHeaderFields"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:off_1002E6240]);

  if (v3) {
    v4 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v3);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

@end