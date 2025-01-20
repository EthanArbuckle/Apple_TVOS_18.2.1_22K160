@interface NSHTTPCookieStorage
+ (NSHTTPCookieStorage)sharedHTTPCookieStorage;
- (NSArray)cookiesForURL:(NSURL *)URL;
- (OpaqueCFHTTPCookieStorage)_cookieStorage;
@end

@implementation NSHTTPCookieStorage

+ (NSHTTPCookieStorage)sharedHTTPCookieStorage
{
  v2 = (NSHTTPCookieStorage *)sSharedInstance;
  if (!sSharedInstance)
  {
    if (+[NSHTTPCookieStorage sharedHTTPCookieStorage]::sOnce != -1) {
      dispatch_once(&+[NSHTTPCookieStorage sharedHTTPCookieStorage]::sOnce, &__block_literal_global_28);
    }
    v2 = (NSHTTPCookieStorage *)sSharedInstance;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedCookieStorageLock);
  return v2;
}

- (NSArray)cookiesForURL:(NSURL *)URL
{
  if (URL)
  {
    uint64_t v5 = -[NSString isEqualToString:](-[NSURL scheme](URL, "scheme"), "isEqualToString:", 0x18C5B2B50LL)
      || -[NSString isEqualToString:](-[NSURL scheme](URL, "scheme"), "isEqualToString:", 0x18C5B2C68LL);
    v7 = -[NSHTTPCookieStorage _cookieStorage](self, "_cookieStorage");
    if (v7)
    {
      v8 = v7;
      CFRetain(v7);
      v9 = CFHTTPCookieStorageCopyCookiesForURL(v8, URL, v5);
      CFRelease(v8);
      if (v9)
      {
        v10 = +[NSHTTPCookie _cf2nsCookies:](&OBJC_CLASS___NSHTTPCookie, "_cf2nsCookies:", v9);
        CFRelease(v9);
        return v10;
      }
    }
  }

  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v6 = (os_log_s *)CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_18298D000, v6, OS_LOG_TYPE_ERROR, "cookiesForURL called with a nil url", v12, 2u);
    }
  }

  return 0LL;
}

- (OpaqueCFHTTPCookieStorage)_cookieStorage
{
  internal = self->_internal;
  uint64_t v3 = 2LL;
  return (OpaqueCFHTTPCookieStorage *)(&internal->super.isa)[v3];
}

@end