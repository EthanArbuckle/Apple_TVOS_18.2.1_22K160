@interface NSURLResponse
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (__CFString)getObjectKeyWithIndex:(uint64_t)a1;
+ (id)_responseWithCFURLResponse:(_CFURLResponse *)a3;
- (BOOL)_mustRevalidate;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSDictionary)allHeaderFields;
- (NSString)MIMEType;
- (NSString)suggestedFilename;
- (NSURL)URL;
- (NSURLResponse)init;
- (NSURLResponse)initWithCoder:(id)a3;
- (NSURLResponse)initWithURL:(NSURL *)URL MIMEType:(NSString *)MIMEType expectedContentLength:(NSInteger)length textEncodingName:(NSString *)name;
- (URLResponse)_cf_resp_data;
- (URLResponse)_inner;
- (double)_freshnessLifetime;
- (id)_initWithCFURLResponse:(_CFURLResponse *)a3;
- (id)_initWithInternal:(id)a3;
- (id)_lastModifiedDate;
- (id)_peerCertificateChain;
- (id)description;
- (int64_t)statusCode;
- (void)_setExpectedContentLength:(int64_t)a3;
- (void)_setMIMEType:(id)a3;
- (void)_setSSLCertificateContext:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)set_cf_resp_data:(URLResponse *)a3;
@end

@implementation NSURLResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLResponse;
  -[NSURLResponse dealloc](&v3, sel_dealloc);
}

- (id)_initWithInternal:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSURLResponse;
  v4 = -[NSURLResponse init](&v6, sel_init);
  if (v4) {
    v4->_internal = (NSURLResponseInternal *)a3;
  }
  return v4;
}

- (URLResponse)_inner
{
  return -[NSURLResponseInternal _inner](self->_internal, "_inner");
}

+ (id)_responseWithCFURLResponse:(_CFURLResponse *)a3
{
  uint64_t v4 = -[_CFURLResponse _inner](a3, "_inner");
  v5 = off_189BFE0C8;
  if (*(void *)(v4 + 88)) {
    v5 = &off_189BFDF78;
  }
  return (id)[objc_alloc(*v5) _initWithCFURLResponse:a3];
}

- (id)_initWithCFURLResponse:(_CFURLResponse *)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSURLResponse;
    uint64_t v4 = -[NSURLResponse init](&v6, sel_init);
    if (v4) {
      v4->_internal = (NSURLResponseInternal *)*((id *)a3 + 1);
    }
  }

  else
  {

    return 0LL;
  }

  return v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() && (sel_isEqual(a3, sel_statusCode) || sel_isEqual(a3, sel_allHeaderFields))) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSURLResponse;
  return -[NSURLResponse respondsToSelector:](&v7, sel_respondsToSelector_, a3);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLResponse;
  return (id)objc_msgSend( -[NSURLResponse description](&v3, sel_description),  "stringByAppendingFormat:",  @" { URL: %@ }",  -[NSURLResponse URL](self, "URL"));
}

- (NSURL)URL
{
  return (NSURL *)-[NSURLResponse _inner](self, "_inner")[8];
}

- (NSString)MIMEType
{
  return (NSString *)URLResponse::getMIMEType(-[NSURLResponse _inner](self, "_inner"));
}

- (void)encodeWithCoder:(id)a3
{
  int v13 = 8;
  Default = CFAllocatorGetDefault();
  if (self)
  {
    URLResponse::createArchiveList(-[NSURLResponse _inner](self, "_inner"), Default, &v12, (const void ***)&v10, &v11);
    self = v10;
    uint64_t v7 = v11;
    int v3 = v12;
  }

  else
  {
    uint64_t v7 = 7LL;
  }

  [a3 encodeValueOfObjCType:"i" at:&v13];
  int v13 = v3;
  [a3 encodeValueOfObjCType:"i" at:&v13];
  int v13 = v7;
  [a3 encodeValueOfObjCType:"i" at:&v13];
  if (v7 >= 1)
  {
    unint64_t v8 = 0LL;
    while (1)
    {
      Class v9 = (&self->super.isa)[v8];
      if ([a3 requiresSecureCoding])
      {
      }

      [a3 encodeObject:v9];
      if (v9) {
        goto LABEL_11;
      }
LABEL_12:
      if (v7 == ++v8) {
        goto LABEL_13;
      }
    }

    objc_msgSend( a3,  "encodeObject:forKey:",  v9,  +[NSURLResponse getObjectKeyWithIndex:]((uint64_t)NSURLResponse, v8));
    if (!v9) {
      goto LABEL_12;
    }
LABEL_11:
    CFRelease(v9);
    goto LABEL_12;
  }

+ (__CFString)getObjectKeyWithIndex:(uint64_t)a1
{
  if (a2 >= 0x1F) {
    __assert_rtn("+[NSURLResponse getObjectKeyWithIndex:]", "NSURLResponse.mm", 210, "false");
  }
  return _objectKeys[a2];
}

- (NSURLResponse)initWithURL:(NSURL *)URL MIMEType:(NSString *)MIMEType expectedContentLength:(NSInteger)length textEncodingName:(NSString *)name
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSURLResponse;
  v10 = -[NSURLResponse init](&v19, sel_init);
  if (v10)
  {
    if (!MIMEType) {
      MIMEType = (NSString *)@"application/octet-stream";
    }
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSURLResponseInternal);
    v10->_internal = v11;
    URLResponse::initialize( (uint64_t)-[NSURLResponseInternal _inner](v11, "_inner"),  URL,  (const __CFString *)MIMEType,  length,  (const __CFString *)name,  0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v12 = -[NSURLResponseInternal _inner](v10->_internal, "_inner");
      if (!*(void *)(v12 + 88))
      {
        uint64_t v13 = v12;
        CFHTTPMessageRef Empty = CFHTTPMessageCreateEmpty((CFAllocatorRef)*MEMORY[0x189604DB0], 0);
        uint64_t Instance = _CFRuntimeCreateInstance();
        uint64_t v16 = Instance;
        if (Instance)
        {
          *(_OWORD *)(Instance + 16) = 0u;
          uint64_t v16 = Instance + 16;
          *(void *)(Instance + 352) = 0LL;
          *(_OWORD *)(Instance + 320) = 0u;
          *(_OWORD *)(Instance + 336) = 0u;
          *(_OWORD *)(Instance + 288) = 0u;
          *(_OWORD *)(Instance + 304) = 0u;
          *(_OWORD *)(Instance + 256) = 0u;
          *(_OWORD *)(Instance + 272) = 0u;
          *(_OWORD *)(Instance + 224) = 0u;
          *(_OWORD *)(Instance + 240) = 0u;
          *(_OWORD *)(Instance + 192) = 0u;
          *(_OWORD *)(Instance + 208) = 0u;
          *(_OWORD *)(Instance + 160) = 0u;
          *(_OWORD *)(Instance + 176) = 0u;
          *(_OWORD *)(Instance + 128) = 0u;
          *(_OWORD *)(Instance + 144) = 0u;
          *(_OWORD *)(Instance + 96) = 0u;
          *(_OWORD *)(Instance + 112) = 0u;
          *(_OWORD *)(Instance + 64) = 0u;
          *(_OWORD *)(Instance + 80) = 0u;
          *(_OWORD *)(Instance + 32) = 0u;
          *(_OWORD *)(Instance + 48) = 0u;
        }

        if (*((_BYTE *)Empty + 40)) {
          v17 = (CFHTTPMessageRef)((char *)Empty + 16);
        }
        else {
          v17 = 0LL;
        }
        HTTPResponseMessage::HTTPResponseMessage((HTTPResponseMessage *)v16, v17);
        *(void *)uint64_t v16 = &off_189C06E00;
        *(void *)(v16 + 8) = &unk_189C06E70;
        *(void *)(v16 + 16) = &unk_189C06E90;
        *(_WORD *)(v16 + 297) = 0;
        *(_BYTE *)(v16 + 299) = 0;
        *(void *)(v13 + 88) = v16;
        *(_WORD *)(v16 + 297) |= 0x200u;
        *(_WORD *)(*(void *)(v13 + 88) + 297LL) |= 0x4000u;
        *(_WORD *)(*(void *)(v13 + 88) + 297LL) |= 0x100u;
        *(_WORD *)(*(void *)(v13 + 88) + 297LL) |= 0x2000u;
        CFRelease(Empty);
      }
    }
  }

  return v10;
}

- (NSURLResponse)init
{
  return -[NSURLResponse initWithURL:MIMEType:expectedContentLength:textEncodingName:]( self,  "initWithURL:MIMEType:expectedContentLength:textEncodingName:",  0LL,  0LL,  -1LL,  0LL);
}

- (NSURLResponse)initWithCoder:(id)a3
{
  if (v23 <= 6) {
    goto LABEL_17;
  }
  if (v23 == 7)
  {
    uint64_t v5 = [a3 decodeObject];
    if (!v5 || (objc_opt_self(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v6 = [a3 decodeObject];
      if (v6)
      {
        uint64_t v7 = v6;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v8 = [a3 decodeObject];
          if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [a3 decodeValueOfObjCType:"q" at:&v22 size:8];
            Class v9 = -[NSURLResponse initWithURL:MIMEType:expectedContentLength:textEncodingName:]( self,  "initWithURL:MIMEType:expectedContentLength:textEncodingName:",  v5,  v7,  v22,  v8);
            [a3 decodeValueOfObjCType:"d" at:&v21 size:8];
            uint64_t v10 = -[NSURLResponse _inner](v9, "_inner");
            *(void *)(v10 + 40) = v21;
            uint64_t v11 = *(void *)(v10 + 88);
            if (v11) {
              *(_WORD *)(v11 + 297) |= 0x1000u;
            }
            return v9;
          }
        }
      }
    }

- (NSString)suggestedFilename
{
  return (NSString *)(id)URLResponse::copySuggestedFilename(-[NSURLResponse _inner](self, "_inner"));
}

- (int64_t)statusCode
{
  if (dyld_program_sdk_at_least())
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4727);
    }
    v2 = (os_log_s *)__CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl(&dword_18298D000, v2, OS_LOG_TYPE_FAULT, "-statusCode called on NSURLResponse", v4, 2u);
    }
  }

  return 200LL;
}

- (NSDictionary)allHeaderFields
{
  if (dyld_program_sdk_at_least())
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4727);
    }
    v2 = (os_log_s *)__CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_fault_impl(&dword_18298D000, v2, OS_LOG_TYPE_FAULT, "-allHeaderFields called on NSURLResponse", v4, 2u);
    }
  }

  return (NSDictionary *)MEMORY[0x189604A60];
}

- (URLResponse)_cf_resp_data
{
  return self->__cf_resp_data;
}

- (void)set_cf_resp_data:(URLResponse *)a3
{
  self->__cf_resp_data = a3;
}

id __31__NSURLResponse_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x189604010];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id result = (id)objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  -[NSURLResponse initWithCoder:]::plistClasses = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if ((id)objc_opt_class() == a1 && (sel_isEqual(a3, sel_statusCode) || sel_isEqual(a3, sel_allHeaderFields))) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSURLResponse;
  return objc_msgSendSuper2(&v6, sel_instancesRespondToSelector_, a3);
}

- (void)_setExpectedContentLength:(int64_t)a3
{
  uint64_t v4 = -[NSURLResponse _inner](self, "_inner");
  v4->fExpectedContentLength = a3;
  fHTTP = v4->fHTTP;
  if (fHTTP)
  {
    *(_WORD *)((char *)fHTTP + 297) |= 0x100u;
    *(_WORD *)((char *)v4->fHTTP + 297) |= 0x2000u;
  }

- (void)_setMIMEType:(id)a3
{
}

- (void)_setSSLCertificateContext:(id)a3
{
  uint64_t v4 = -[NSURLResponse _inner](self, "_inner");
  fSSLCertContext = v4->fSSLCertContext;
  if (fSSLCertContext) {
    CFRelease(fSSLCertContext);
  }
  if (a3) {
    objc_super v6 = (__CFDictionary *)CFRetain(a3);
  }
  else {
    objc_super v6 = 0LL;
  }
  v4->fSSLCertContext = v6;
}

- (id)_lastModifiedDate
{
  if (URLResponse::getLastModifiedDate(-[NSURLResponse _inner](self, "_inner")) == 0.0) {
    return 0LL;
  }
  else {
    return (id)objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceReferenceDate:");
  }
}

- (BOOL)_mustRevalidate
{
  return _CFURLResponseMustRevalidate(self) != 0;
}

- (double)_freshnessLifetime
{
  uint64_t v2 = -[NSURLResponse _inner](self, "_inner");
  if (!v2->fHTTP) {
    return 1.79769313e308;
  }
  URLResponse::freshnessLifetimeForResponse(v2);
  return result;
}

- (id)_peerCertificateChain
{
  return 0LL;
}

@end