@interface NSHTTPURLResponse
+ (BOOL)isErrorStatusCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (NSString)localizedStringForStatusCode:(NSInteger)statusCode;
- (NSDictionary)allHeaderFields;
- (NSHTTPURLResponse)initWithCoder:(id)a3;
- (NSHTTPURLResponse)initWithHTTPPropertyList:(id)a3 URL:(id)a4;
- (NSHTTPURLResponse)initWithURL:(NSURL *)url statusCode:(NSInteger)statusCode HTTPVersion:(NSString *)HTTPVersion headerFields:(NSDictionary *)headerFields;
- (NSHTTPURLResponse)initWithURL:(id)a3 statusCode:(int64_t)a4 headerFields:(id)a5 requestTime:(double)a6;
- (NSInteger)statusCode;
- (NSString)valueForHTTPHeaderField:(NSString *)field;
- (id)HTTPPropertyList;
- (id)_allHTTPHeaderFieldsAsArrays;
- (id)_initWithCFURLResponse:(_CFURLResponse *)a3;
- (id)_peerCertificateChain;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSHTTPURLResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSHTTPURLResponse;
  -[NSURLResponse dealloc](&v3, sel_dealloc);
}

- (id)_initWithCFURLResponse:(_CFURLResponse *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSHTTPURLResponse;
  objc_super v3 = -[NSURLResponse _initWithCFURLResponse:](&v5, sel__initWithCFURLResponse_, a3);
  if (v3) {
    v3[3] = objc_alloc_init(&OBJC_CLASS___NSHTTPURLResponseInternal);
  }
  return v3;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSHTTPURLResponse;
  return (id)objc_msgSend( -[NSURLResponse description](&v3, sel_description),  "stringByAppendingFormat:",  @" { Status Code: %ld, Headers %@ }",  -[NSHTTPURLResponse statusCode](self, "statusCode"),  -[NSHTTPURLResponse _allHTTPHeaderFieldsAsArrays](self, "_allHTTPHeaderFieldsAsArrays"));
}

- (NSInteger)statusCode
{
  uint64_t v2 = (uint64_t)-[NSURLResponse _inner](self, "_inner")[88];
  if (v2) {
    return CFHTTPMessageGetResponseStatusCode((CFHTTPMessageRef)(v2 - 16));
  }
  else {
    return 0LL;
  }
}

- (id)_allHTTPHeaderFieldsAsArrays
{
  if (self->super._internal
    && ((v2 = (uint64_t)-[NSURLResponse _inner](self, "_inner")[88]) != 0 ? (uint64_t v3 = v2 - 16) : (uint64_t v3 = 0LL), v2))
  {
    CFDictionaryRef v4 = HTTPMessage::copyAsMultiValueDict((HTTPMessage *)(v3 + 16));
  }

  else
  {
    CFDictionaryRef v4 = 0LL;
  }

  return v4;
}

- (NSDictionary)allHeaderFields
{
  uint64_t v2 = (uint64_t)-[NSURLResponse _inner](self, "_inner")[88];
  if (v2
    && (CFDictionaryRef v3 = CFHTTPMessageCopyAllHeaderFields((CFHTTPMessageRef)(v2 - 16))) != 0LL
    && (v4 = v3, objc_super v5 = (NSDictionary *)(id)-[__CFDictionary copy](v3, "copy"), CFRelease(v4), v5))
  {
    return v5;
  }

  else
  {
    return (NSDictionary *)[MEMORY[0x189603F68] dictionary];
  }

- (NSString)valueForHTTPHeaderField:(NSString *)field
{
  uint64_t v4 = (uint64_t)-[NSURLResponse _inner](self, "_inner")[88];
  if (!v4) {
    return 0LL;
  }
  CFStringRef v5 = CFHTTPMessageCopyHeaderFieldValue((CFHTTPMessageRef)(v4 - 16), (CFStringRef)field);
  return (NSString *)(id)CFMakeCollectable(v5);
}

+ (NSString)localizedStringForStatusCode:(NSInteger)statusCode
{
  if ((unint64_t)statusCode > 0xC7)
  {
    if ((unint64_t)statusCode > 0x12B)
    {
      if ((unint64_t)statusCode > 0x18F)
      {
        if ((unint64_t)statusCode > 0x1F3)
        {
          NSInteger v5 = statusCode - 500;
          v6 = off_189C02378;
        }

        else
        {
          NSInteger v5 = statusCode - 400;
          v6 = off_189C022E8;
        }
      }

      else
      {
        NSInteger v5 = statusCode - 300;
        v6 = off_189C022A8;
      }
    }

    else
    {
      NSInteger v5 = statusCode - 200;
      v6 = off_189C02270;
    }

    return &v6[v5]->isa;
  }

  uint64_t v4 = @"informational";
  if (statusCode == 101) {
    uint64_t v4 = @"switching protocols";
  }
  if (statusCode == 100) {
    return (NSString *)@"continue";
  }
  else {
    return &v4->isa;
  }
}

- (void)encodeWithCoder:(id)a3
{
  char v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSHTTPURLResponse;
  -[NSURLResponse encodeWithCoder:](&v4, sel_encodeWithCoder_);
  int v6 = 9;
  [a3 encodeValueOfObjCType:"i" at:&v6];
  [a3 encodeValueOfObjCType:"B" at:&v5];
}

- (NSHTTPURLResponse)initWithURL:(id)a3 statusCode:(int64_t)a4 headerFields:(id)a5 requestTime:(double)a6
{
  return -[NSHTTPURLResponse initWithURL:statusCode:HTTPVersion:headerFields:]( self,  "initWithURL:statusCode:HTTPVersion:headerFields:",  a3,  a4,  @"HTTP/1.1",  a5,  a6);
}

- (NSHTTPURLResponse)initWithURL:(NSURL *)url statusCode:(NSInteger)statusCode HTTPVersion:(NSString *)HTTPVersion headerFields:(NSDictionary *)headerFields
{
  ResponseNoParser = _CFHTTPMessageCreateResponseNoParser( *MEMORY[0x189604DB0],  statusCode,  0LL,  (const __CFString *)HTTPVersion);
  if (ResponseNoParser)
  {
    v10 = (__CFHTTPMessage *)ResponseNoParser;
    if (headerFields)
    {
      ResponseNoParser = -[NSDictionary count](headerFields, "count");
      if (ResponseNoParser) {
        _CFHTTPMessageSetMultipleHeaderFields(v10, (CFDictionaryRef)headerFields);
      }
    }

    id v11 = CFURLResponseCreateWithHTTPResponse((uint64_t)ResponseNoParser, url, (uint64_t)v10, 0);
    if (v11)
    {
      v12 = v11;
      v13 = -[NSHTTPURLResponse _initWithCFURLResponse:](self, "_initWithCFURLResponse:", v11);
      CFRelease(v12);
    }

    else
    {

      v13 = 0LL;
    }

    CFRelease(v10);
  }

  else
  {

    return 0LL;
  }

  return v13;
}

- (NSHTTPURLResponse)initWithCoder:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NSHTTPURLResponse;
  objc_super v4 = -[NSURLResponse initWithCoder:](&v28, sel_initWithCoder_);
  if (v4)
  {
    [a3 decodeValueOfObjCType:"i" at:&v27 size:4];
    if (v27 - 10 < 0xFFFFFFFC)
    {
LABEL_3:

      return 0LL;
    }

    if (v27 > 7)
    {
      if (!v4->_httpInternal) {
        v4->_httpInternal = objc_alloc_init(&OBJC_CLASS___NSHTTPURLResponseInternal);
      }
      [a3 decodeValueOfObjCType:"B" at:&v26 size:1];
    }

    else
    {
      char v5 = (const void *)[a3 decodeObject];
      if (!v5) {
        goto LABEL_3;
      }
      uint64_t v6 = (uint64_t)v5;
      CFTypeID v7 = CFGetTypeID(v5);
      if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      {
        CFTypeID v20 = v7;
        dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5084);
        CFTypeID v7 = v20;
      }

      [a3 decodeValueOfObjCType:"d" at:&v26 size:8];
      [a3 decodeValueOfObjCType:"d" at:v22 size:8];
      [a3 decodeValueOfObjCType:"B" at:&v21 size:1];
      [a3 decodeValueOfObjCType:"B" at:&v23 size:1];
      [a3 decodeValueOfObjCType:"B" at:&v25 size:1];
      [a3 decodeValueOfObjCType:"B" at:&v24 size:1];
      if (!v4->_httpInternal) {
        v4->_httpInternal = objc_alloc_init(&OBJC_CLASS___NSHTTPURLResponseInternal);
      }
      if (v27 == 7) {
        [a3 decodeValueOfObjCType:"B" at:&v21 size:1];
      }
      v8 = (const void *)-[NSURLResponse _inner](v4, "_inner")[8];
      uint64_t v9 = -[NSURLResponse _inner](v4, "_inner");
      v10 = (id *)CFURLResponseCreateWithHTTPResponse(v9, v8, v6, *(_DWORD *)(v9 + 72));
      uint64_t v11 = v26;
      *(void *)([v10 _inner] + 48) = v11;
      if (v24)
      {
        uint64_t ExpectedContentLength = CFURLResponseGetExpectedContentLength(v4);
        uint64_t v13 = [v10 _inner];
        *(void *)(v13 + 32) = ExpectedContentLength;
        uint64_t v14 = *(void *)(v13 + 88);
        if (v14)
        {
          *(_WORD *)(v14 + 297) |= 0x100u;
          *(_WORD *)(*(void *)(v13 + 88) + 297LL) |= 0x2000u;
        }
      }

      if (v25)
      {
        MIMEType = URLResponse::getMIMEType(-[NSURLResponse _inner](v4, "_inner"));
        CFURLResponseSetMIMEType(v10, MIMEType);
      }

      if (v23)
      {
        double ExpirationTime = CFURLResponseGetExpirationTime(v4);
        uint64_t v17 = [v10 _inner];
        *(double *)(v17 + 40) = ExpirationTime;
        uint64_t v18 = *(void *)(v17 + 88);
        if (v18) {
          *(_WORD *)(v18 + 297) |= 0x1000u;
        }
      }

      v4->super._internal = (NSURLResponseInternal *)v10[1];
    }
  }

  return v4;
}

- (id)_peerCertificateChain
{
  uint64_t v2 = (const __CFDictionary *)-[NSURLResponse _inner](self, "_inner")[64];
  if (v2 && (Value = CFDictionaryGetValue(v2, @"kCFStreamPropertySSLPeerCertificates")) != 0LL) {
    return (id)[MEMORY[0x189603F18] arrayWithArray:Value];
  }
  else {
    return 0LL;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isErrorStatusCode:(int64_t)a3
{
  return (unint64_t)(a3 - 400) < 0xFFFFFFFFFFFFFED4LL;
}

- (NSHTTPURLResponse)initWithHTTPPropertyList:(id)a3 URL:(id)a4
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CFTypeID v7 = (const void *)[a3 objectForKeyedSubscript:@"statusDescription"];
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = (void *)[a3 objectForKeyedSubscript:@"headerFields"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ([v8 count])
        {
          unint64_t v9 = 0LL;
          uint64_t v10 = -1LL;
          while (1)
          {
            uint64_t v11 = (void *)[v8 objectAtIndexedSubscript:v9];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            v12 = (void *)[v11 objectForKeyedSubscript:@"name"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            uint64_t v13 = (void *)[v11 objectForKeyedSubscript:@"value"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            if ([v12 hasPrefix:@":"])
            {
              if (++v9 < [v8 count]) {
                continue;
              }
            }

            if (v10 == -1) {
              break;
            }
            ResponseNoParser = _CFHTTPMessageCreateResponseNoParser(*MEMORY[0x189604DB0], v10, v7, @"HTTP/1.1");
            v23[0] = MEMORY[0x1895F87A8];
            v23[1] = 3221225472LL;
            char v24 = __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke;
            char v25 = &__block_descriptor_40_e5_v8__0l;
            uint64_t v26 = ResponseNoParser;
            while (1)
            {
              unint64_t v15 = [v8 count];
              if (v9 >= v15)
              {
                id v21 = CFURLResponseCreateWithHTTPResponse(v15, a4, (uint64_t)ResponseNoParser, 0);
                v22[0] = MEMORY[0x1895F87A8];
                v22[1] = 3221225472LL;
                v22[2] = __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke_2;
                v22[3] = &__block_descriptor_40_e5_v8__0l;
                v22[4] = v21;
                v19 = -[NSHTTPURLResponse _initWithCFURLResponse:](self, "_initWithCFURLResponse:", v21);
                __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke_2((uint64_t)v22);
                goto LABEL_27;
              }

              v16 = (void *)[v8 objectAtIndexedSubscript:v9];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              uint64_t v17 = (__CFString *)[v16 objectForKeyedSubscript:@"name"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              uint64_t v18 = (__CFString *)[v16 objectForKeyedSubscript:@"value"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                || (-[__CFString hasPrefix:](v17, "hasPrefix:", @":") & 1) != 0)
              {
                break;
              }

              _CFHTTPMessageAddHeaderFieldValue((uint64_t)ResponseNoParser, v17, v18);
              ++v9;
            }

            v19 = 0LL;
LABEL_27:
            v24((uint64_t)v23);
            return v19;
          }
        }
      }
    }
  }

  return 0LL;
}

- (id)HTTPPropertyList
{
  void v23[2] = *MEMORY[0x1895F89C0];
  CFDictionaryRef v3 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:2];
  uint64_t v4 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v19 = __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke;
  CFTypeID v20 = &unk_189C1A548;
  id v21 = v3;
  uint64_t v5 = (uint64_t)-[NSURLResponse _inner](self, "_inner")[88];
  if (v5) {
    uint64_t v6 = v5 - 16;
  }
  else {
    uint64_t v6 = 0LL;
  }
  if (v5)
  {
    if (*(_BYTE *)(v6 + 40))
    {
      uint64_t v7 = *(void *)(v6 + 152);
      if (v7) {
        [v3 setObject:v7 forKeyedSubscript:@"statusDescription"];
      }
    }
  }

  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  v14[0] = v4;
  v14[1] = 3221225472LL;
  unint64_t v15 = __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_2;
  v16 = &unk_189C1A548;
  id v17 = v8;
  v22[0] = @"name";
  v22[1] = @"value";
  v23[0] = @":status";
  v23[1] = objc_msgSend( NSString,  "stringWithFormat:",  @"%ld",  CFHTTPMessageGetResponseStatusCode((CFHTTPMessageRef)v6));
  objc_msgSend( v8,  "addObject:",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
  if (v5) {
    uint64_t v9 = v6 + 16;
  }
  else {
    uint64_t v9 = 0LL;
  }
  v13[0] = v4;
  v13[1] = 3221225472LL;
  v13[2] = __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_3;
  v13[3] = &unk_189C13B00;
  v13[4] = v8;
  (*(void (**)(uint64_t, void *))(*(void *)v9 + 56LL))(v9, v13);
  uint64_t v10 = (void *)[v8 copy];
  [v3 setObject:v10 forKeyedSubscript:@"headerFields"];

  id v11 = (id)[v3 copy];
  v15((uint64_t)v14);
  v19((uint64_t)v18);
  return v11;
}

void __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke(uint64_t a1)
{
}

void __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_2(uint64_t a1)
{
}

uint64_t __49__NSHTTPURLResponse_SwiftTypes__HTTPPropertyList__block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v6[2] = *MEMORY[0x1895F89C0];
  CFDictionaryRef v3 = *(void **)(a1 + 32);
  v5[0] = @"name";
  v5[1] = @"value";
  v6[0] = a2;
  v6[1] = a3;
  return objc_msgSend( v3,  "addObject:",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
}

void __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __62__NSHTTPURLResponse_SwiftTypes__initWithHTTPPropertyList_URL___block_invoke_2(uint64_t a1)
{
}

@end