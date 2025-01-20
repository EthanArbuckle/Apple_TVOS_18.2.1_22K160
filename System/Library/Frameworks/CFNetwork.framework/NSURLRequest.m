@interface NSURLRequest
+ (NSURLRequest)requestWithURL:(NSURL *)URL;
+ (__CFString)getObjectKeyWithIndex:(uint64_t)a1;
- (BOOL)_ignoreHSTS;
- (BOOL)_isSafeRequestForBackgroundDownload;
- (BOOL)_preventHSTSStorage;
- (BOOL)_requiresShortConnectionTimeout;
- (BOOL)_schemeWasUpgradedDueToDynamicHSTS;
- (BOOL)isEqual:(id)a3;
- (NSData)HTTPBody;
- (NSDictionary)allHTTPHeaderFields;
- (NSInputStream)HTTPBodyStream;
- (NSString)HTTPMethod;
- (NSString)description;
- (NSString)valueForHTTPHeaderField:(NSString *)field;
- (NSTimeInterval)timeoutInterval;
- (NSURL)URL;
- (NSURL)mainDocumentURL;
- (NSURLRequest)initWithURL:(NSURL *)URL;
- (NSURLRequest)initWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval;
- (NSURLRequestCachePolicy)cachePolicy;
- (__CFURL)cfURL;
- (id)_initWithCFURLRequest:(_CFURLRequest *)a3;
- (id)_initWithInternal:(id)a3;
- (id)_startTimeoutDate;
- (id)boundInterfaceIdentifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_inner;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLRequest

- (NSURLRequest)initWithURL:(NSURL *)URL
{
  return -[NSURLRequest initWithURL:cachePolicy:timeoutInterval:]( self,  "initWithURL:cachePolicy:timeoutInterval:",  URL,  0LL,  (double)(unint64_t)NSURLRequestTimeoutInterval);
}

- (NSURLRequest)initWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSURLRequest;
  v8 = -[NSURLRequest init](&v17, sel_init);
  if (v8)
  {
    objc_opt_self();
    char isKindOfClass = objc_opt_isKindOfClass();
    v10 = objc_alloc_init(&OBJC_CLASS___NSURLRequestInternal);
    uint64_t v11 = -[NSURLRequestInternal _inner](v10, "_inner");
    uint64_t v12 = v11;
    if ((isKindOfClass & 1) != 0) {
      *(_WORD *)(v11 + 64) |= 2u;
    }
    if (URL) {
      CFURLRef v13 = CFURLCopyAbsoluteURL((CFURLRef)URL);
    }
    else {
      CFURLRef v13 = 0LL;
    }
    if (cachePolicy) {
      __int16 v14 = 1033;
    }
    else {
      __int16 v14 = 9;
    }
    __int16 v15 = *(_WORD *)(v12 + 64) & 0xFFEF | v14;
    *(_WORD *)(v12 + 64) = v15;
    *(void *)(v12 + 8) = v13;
    *(void *)(v12 + 16) = cachePolicy;
    if (timeoutInterval != 60.0) {
      *(_WORD *)(v12 + 64) = v15 | 0x800;
    }
    *(NSTimeInterval *)(v12 + 24) = timeoutInterval;
    *(void *)(v12 + 32) = 0LL;
    v8->_internal = v10;
    if (!v10)
    {

      return 0LL;
    }
  }

  return v8;
}

- (void)_inner
{
  return -[NSURLRequestInternal _inner](self->_internal, "_inner");
}

- (NSURL)URL
{
  return *(NSURL **)(-[NSURLRequest _inner](self, "_inner") + 8);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSURLRequestInternal);
  URLRequest::initialize( (URLRequest *)-[NSURLRequestInternal _inner](v4, "_inner"),  (const URLRequest *)-[NSURLRequestInternal _inner](self->_internal, "_inner"));
  if (!v4) {
    return 0LL;
  }
  id v5 = -[NSURLRequest _initWithInternal:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "_initWithInternal:", v4);

  return v5;
}

- (id)_initWithInternal:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSURLRequest;
  v4 = -[NSURLRequest init](&v6, sel_init);
  if (v4) {
    v4->_internal = (NSURLRequestInternal *)a3;
  }
  return v4;
}

- (NSString)valueForHTTPHeaderField:(NSString *)field
{
  v4 = *(HTTPMessage **)(-[NSURLRequest _inner](self, "_inner") + 56);
  if (v4) {
    v4 = (HTTPMessage *)HTTPMessage::copyHeaderFieldValue(v4, (const __CFString *)field);
  }
  return (NSString *)v4;
}

- (NSURLRequestCachePolicy)cachePolicy
{
  return (uint64_t)*(int *)(-[NSURLRequest _inner](self, "_inner") + 16);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLRequest;
  -[NSURLRequest dealloc](&v3, sel_dealloc);
}

- (NSDictionary)allHTTPHeaderFields
{
  v2 = *(HTTPMessage **)(-[NSURLRequest _inner](self, "_inner") + 56);
  if (v2) {
    v2 = HTTPMessage::copyAllHeaderFields(v2);
  }
  return (NSDictionary *)v2;
}

- (id)_startTimeoutDate
{
  else {
    return (id)objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceReferenceDate:");
  }
}

- (NSInputStream)HTTPBodyStream
{
  return (NSInputStream *)(id)CFURLRequestCopyHTTPRequestBodyStream(self);
}

- (NSData)HTTPBody
{
  v2 = *(HTTPMessage **)(-[NSURLRequest _inner](self, "_inner") + 56);
  if (v2) {
    v2 = HTTPMessage::copyBody(v2);
  }
  return (NSData *)v2;
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLRequest;
  return -[NSString stringByAppendingFormat:]( -[NSURLRequest description](&v3, sel_description),  "stringByAppendingFormat:",  @" { URL: %@ }",  -[NSURLRequest URL](self, "URL"));
}

- (NSTimeInterval)timeoutInterval
{
  return *(double *)(-[NSURLRequest _inner](self, "_inner") + 24);
}

- (id)_initWithCFURLRequest:(_CFURLRequest *)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSURLRequest;
    v4 = -[NSURLRequest init](&v6, sel_init);
    if (v4) {
      v4->_internal = (NSURLRequestInternal *)[*((id *)a3 + 1) copy];
    }
  }

  else
  {

    return 0LL;
  }

  return v4;
}

- (BOOL)_requiresShortConnectionTimeout
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 160) != 0;
}

- (__CFURL)cfURL
{
  return *(__CFURL **)(-[NSURLRequest _inner](self, "_inner") + 8);
}

- (NSURL)mainDocumentURL
{
  return *(NSURL **)(-[NSURLRequest _inner](self, "_inner") + 32);
}

+ (NSURLRequest)requestWithURL:(NSURL *)URL
{
  return (NSURLRequest *)(id)[objc_alloc((Class)a1) initWithURL:URL];
}

- (NSString)HTTPMethod
{
  return (NSString *)(id)CFURLRequestCopyHTTPRequestMethod(self);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  int v25 = 2;
  Default = CFAllocatorGetDefault();
  v8 = (void *)-[NSURLRequest copy](self, "copy");
  if (v8)
  {
    v9 = v8;
    URLRequest::createArchiveList( (URLRequest *)[v8 _inner],  Default,  &v24,  (const void ***)&v21,  &v23,  &v22);
    CFRelease(v9);
    uint64_t v10 = v23;
    int v4 = v24;
    objc_super v3 = v21;
  }

  else
  {
    uint64_t v10 = 22LL;
    uint64_t v23 = 22LL;
  }

  [a3 encodeValueOfObjCType:"i" at:&v25];
  int v25 = v4;
  [a3 encodeValueOfObjCType:"i" at:&v25];
  int v25 = v10;
  [a3 encodeValueOfObjCType:"i" at:&v25];
  if (v10 >= 1)
  {
    unint64_t v11 = 0LL;
    while (1)
    {
      uint64_t v12 = v3[v11];
      if ([a3 requiresSecureCoding])
      {
      }

      [a3 encodeObject:v12];
      if (v12) {
        goto LABEL_11;
      }
LABEL_12:
      if (v10 == ++v11) {
        goto LABEL_13;
      }
    }

    objc_msgSend( a3,  "encodeObject:forKey:",  v12,  +[NSURLRequest getObjectKeyWithIndex:]((uint64_t)NSURLRequest, v11));
    if (!v12) {
      goto LABEL_12;
    }
LABEL_11:
    CFRelease(v12);
    goto LABEL_12;
  }

+ (__CFString)getObjectKeyWithIndex:(uint64_t)a1
{
  if (a2 >= 0x1F) {
    __assert_rtn("+[NSURLRequest getObjectKeyWithIndex:]", "NSURLRequest.mm", 374, "false");
  }
  return _objectKeys[a2];
}

- (BOOL)_preventHSTSStorage
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 161) != 0;
}

- (BOOL)_ignoreHSTS
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 162) != 0;
}

- (BOOL)_schemeWasUpgradedDueToDynamicHSTS
{
  return *(_BYTE *)(-[NSURLRequest _inner](self, "_inner") + 163) != 0;
}

- (id)boundInterfaceIdentifier
{
  v2 = *(const __CFString **)(-[NSURLRequest _inner](self, "_inner") + 112);
  if (v2) {
    Copy = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v2);
  }
  else {
    Copy = 0LL;
  }
  return Copy;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSURLRequestInternal isEqual:](self->_internal, "isEqual:", *((void *)a3 + 1));
}

- (BOOL)_isSafeRequestForBackgroundDownload
{
  v2 = -[NSString lowercaseString](-[NSURL scheme](-[NSURLRequest URL](self, "URL"), "scheme"), "lowercaseString");
  return -[NSString isEqualToString:](v2, "isEqualToString:", @"http")
      || -[NSString isEqualToString:](v2, "isEqualToString:", @"https");
}

@end