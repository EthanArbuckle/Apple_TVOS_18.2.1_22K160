@interface NSURLResponse
- (NSString)ams_storefront;
@end

@implementation NSURLResponse

- (NSString)ams_storefront
{
  v2 = self;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    v4 = v2;
  }
  else {
    v4 = 0LL;
  }

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLResponse allHeaderFields](v4, "allHeaderFields"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_objectForCaseInsensitiveKey:", AMSHTTPHeaderSetStoreFront));
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLResponse allHeaderFields](v4, "allHeaderFields"));
      id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_objectForCaseInsensitiveKey:", @"X-Apple-Request-Store-Front"));
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return (NSString *)v8;
}

@end