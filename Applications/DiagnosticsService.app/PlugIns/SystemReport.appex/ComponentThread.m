@interface ComponentThread
- (BOOL)isPresent;
- (id)threadAddress;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentThread

- (BOOL)isPresent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentThread threadAddress](self, "threadAddress"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    if (v2 == v3) {
      LOBYTE(v4) = 0;
    }
    else {
      unsigned int v4 = [v2 isEqualToString:&stru_10007DA88] ^ 1;
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ComponentThread threadAddress](self, "threadAddress"));
  [v4 setObject:v5 forKeyedSubscript:@"threadAddress"];
}

- (id)threadAddress
{
  v2 = (void *)MGCopyAnswer(@"W/xqvBX9L07XHb0BOtYycQ", 0LL);
  id v3 = stringOrNull(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

@end