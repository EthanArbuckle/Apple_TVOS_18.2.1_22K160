@interface NSHTTPCookie
+ (NSArray)cookiesWithResponseHeaderFields:(NSDictionary *)headerFields forURL:(NSURL *)URL;
+ (NSDictionary)requestHeaderFieldsWithCookies:(NSArray *)cookies;
+ (__CFArray)_ns2cfCookies:(id)a3;
+ (id)_cf2nsCookies:(__CFArray *)a3;
+ (uint64_t)_cookiesWithResponseHeaderFields:(const __CFURL *)a3 forURL:(int)a4 singleCookie:;
- (BOOL)isHTTPOnly;
- (BOOL)isSecure;
- (BOOL)isSessionOnly;
- (HTTPCookie)_inner;
- (NSDate)expiresDate;
- (NSHTTPCookie)initWithProperties:(NSDictionary *)properties;
- (NSString)domain;
- (NSString)name;
- (NSString)path;
- (NSString)value;
- (id)_initWithInternal:(id)a3;
- (id)ensureCookieValid;
- (void)dealloc;
@end

@implementation NSHTTPCookie

- (void)dealloc
{
  self->_cookiePrivate = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSHTTPCookie;
  -[NSHTTPCookie dealloc](&v3, sel_dealloc);
}

- (NSHTTPCookie)initWithProperties:(NSDictionary *)properties
{
  id v4 = -[NSHTTPCookieInternal_Data _initWithProperties:fromString:]( objc_alloc(&OBJC_CLASS___NSHTTPCookieInternal_Data),  "_initWithProperties:fromString:",  properties,  0LL);
  id v5 = -[NSHTTPCookie _initWithInternal:](self, "_initWithInternal:", v4);

  return (NSHTTPCookie *)-[NSHTTPCookie ensureCookieValid]((uint64_t)v5);
}

- (id)_initWithInternal:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSHTTPCookie;
    id result = -[NSHTTPCookie init](&v6, sel_init);
    if (result)
    {
      id v5 = result;
      *((void *)result + 1) = a3;
      return -[NSHTTPCookie ensureCookieValid]((uint64_t)v5);
    }
  }

  else
  {

    return 0LL;
  }

  return result;
}

- (id)ensureCookieValid
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    if (!v2
      || ![v2 _inner]
      || (uint64_t v3 = [v1[1] _inner], !(*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3)))
    {

      return 0LL;
    }
  }

  return v1;
}

- (NSDate)expiresDate
{
  if (-[NSHTTPCookie isSessionOnly](self, "isSessionOnly")) {
    return 0LL;
  }
  id v4 = -[NSHTTPCookie _inner](self, "_inner");
  uint64_t v5 = (*((uint64_t (**)(HTTPCookie *))v4->var0 + 2))(v4);
  if (*(_DWORD *)v5 >= 0xCu && (*(_DWORD *)(v5 + 8) & 2) != 0) {
    return 0LL;
  }
  double v6 = 0.0;
  if (*(_DWORD *)v5 >= 0x30u) {
    double v6 = floor(*(double *)(v5 + 40));
  }
  v7 = CFGetAllocator(self);
  return (NSDate *)CFDateCreate(v7, v6);
}

- (BOOL)isSessionOnly
{
  v2 = -[NSHTTPCookie _inner](self, "_inner");
  uint64_t v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 0xCu) {
    return (v3[2] >> 1) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (HTTPCookie)_inner
{
  return (HTTPCookie *)-[NSHTTPCookieInternal _inner](self->_cookiePrivate, "_inner");
}

- (NSString)domain
{
  return (NSString *)(id)CFHTTPCookieCopyDomain(self);
}

- (NSString)path
{
  return (NSString *)(id)CFHTTPCookieCopyPath(self);
}

- (BOOL)isSecure
{
  v2 = -[NSHTTPCookie _inner](self, "_inner");
  uint64_t v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 0xCu) {
    return v3[2] & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isHTTPOnly
{
  v2 = -[NSHTTPCookie _inner](self, "_inner");
  uint64_t v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 0xCu) {
    return (v3[2] >> 2) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (NSString)name
{
  return (NSString *)(id)CFHTTPCookieCopyName(self);
}

+ (id)_cf2nsCookies:(__CFArray *)a3
{
  if (a3) {
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a3);
  }
  else {
    return 0LL;
  }
}

+ (NSDictionary)requestHeaderFieldsWithCookies:(NSArray *)cookies
{
  uint64_t v3 = +[NSHTTPCookie _ns2cfCookies:](&OBJC_CLASS___NSHTTPCookie, "_ns2cfCookies:", cookies);
  if (v3 && (BOOL v4 = v3, v5 = CFHTTPCookieCopyRequestHeaderFields(0LL, v3), CFRelease(v4), v5)) {
    return (NSDictionary *)v5;
  }
  else {
    return (NSDictionary *)[MEMORY[0x189603F68] dictionary];
  }
}

+ (__CFArray)_ns2cfCookies:(id)a3
{
  if (a3) {
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], (CFArrayRef)a3);
  }
  else {
    return 0LL;
  }
}

- (NSString)value
{
  return (NSString *)(id)CFHTTPCookieCopyValue(self);
}

+ (NSArray)cookiesWithResponseHeaderFields:(NSDictionary *)headerFields forURL:(NSURL *)URL
{
  return (NSArray *)+[NSHTTPCookie _cookiesWithResponseHeaderFields:forURL:singleCookie:]( (uint64_t)&OBJC_CLASS___NSHTTPCookie,  (const __CFDictionary *)headerFields,  (const __CFURL *)URL,  0);
}

+ (uint64_t)_cookiesWithResponseHeaderFields:(const __CFURL *)a3 forURL:(int)a4 singleCookie:
{
  if (a2
    && a3
    && (!a4
      ? (CFArrayRef v7 = CFHTTPCookieCreateWithResponseHeaderFields(0LL, a2, a3))
      : (CFArrayRef v7 = _CFHTTPParsedCookiesWithResponseHeaderFields(0LL, a2, a3)),
        (CFArrayRef v8 = v7) != 0LL
     && (id v9 = +[NSHTTPCookie _cf2nsCookies:](&OBJC_CLASS___NSHTTPCookie, "_cf2nsCookies:", v7), CFRelease(v8), v9)))
  {
    return (uint64_t)v9;
  }

  else
  {
    return [MEMORY[0x189603F18] array];
  }

@end