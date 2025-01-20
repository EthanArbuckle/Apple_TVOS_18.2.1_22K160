@interface NSURLResponse
- (BOOL)hasStatusCode:(int64_t)a3;
- (BOOL)requiresAuthorization;
- (BOOL)successful;
- (id)metadata;
- (id)responseValueForHeader:(id)a3;
@end

@implementation NSURLResponse

- (BOOL)hasStatusCode:(int64_t)a3
{
  return -[NSURLResponse statusCode](self, "statusCode") == (id)a3;
}

- (BOOL)successful
{
  return -[NSURLResponse hasStatusCode:](self, "hasStatusCode:", 200LL);
}

- (BOOL)requiresAuthorization
{
  return -[NSURLResponse hasStatusCode:](self, "hasStatusCode:", 401LL);
}

- (id)metadata
{
  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLResponse allHeaderFields](v2, "allHeaderFields"));
    v5 = (NSMutableDictionary *)[v4 mutableCopy];

    if (!v5) {
      v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLResponse valueForHTTPHeaderField:]( v3,  "valueForHTTPHeaderField:",  @"X-Apple-Server-Hint"));
    if (v6) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  kTransparencyResponseMetadataKeyServerHint);
    }
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)responseValueForHeader:(id)a3
{
  if (self) {
    self = (NSURLResponse *)objc_claimAutoreleasedReturnValue(-[NSURLResponse valueForHTTPHeaderField:](self, "valueForHTTPHeaderField:", a3));
  }
  return self;
}

@end