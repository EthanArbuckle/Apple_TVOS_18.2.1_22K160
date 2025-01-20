@interface NWURLLoaderData
- (BOOL)allowsWrite;
- (BOOL)requestComplete;
- (NSString)multipartMixedReplaceBoundary;
- (OS_nw_connection)underlyingConnection;
- (OS_nw_http_fields)trailerFields;
- (OS_sec_trust)peerTrust;
- (id)initWithURL:(id *)a1;
- (id)takeCachedResponse;
- (void)notifyRequestCompletion:(id)a3;
- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (void)readResponse:(id)a3;
- (void)start:(id)a3;
- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation NWURLLoaderData

- (void)start:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v4 = (void (**)(void))a3;
  CFDictionaryRef properties = 0LL;
  CFDataRef resourceData = 0LL;
  SInt32 errorCode = 0;
  if (self) {
    URL = self->_URL;
  }
  else {
    URL = 0LL;
  }
  if (CFURLCreateDataAndPropertiesFromResource( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFURLRef)URL,  &resourceData,  &properties,  0LL,  &errorCode))
  {
    CFDataRef v6 = resourceData;
    v7 = (void *)-[__CFData _createDispatchData](resourceData, "_createDispatchData");
    if (self) {
      objc_storeStrong((id *)&self->_data, v7);
    }

    CFDictionaryRef v8 = properties;
    v9 = -[__CFDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", @"kCFDataURLMimeType");
    if (self) {
      objc_storeStrong((id *)&self->_MIMEType, v9);
    }
    v10 = -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", @"kCFDataURLTextEncodingName");
    if (self) {
      objc_storeStrong((id *)&self->_textEncodingName, v10);
    }

    v4[2](v4);
  }

  else
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44366);
    }
    v11 = (os_log_s *)(id)gurlLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      SInt32 v16 = errorCode;
      _os_log_impl(&dword_181A5C000, v11, OS_LOG_TYPE_ERROR, "Failed to parse data URL %d", buf, 8u);
    }

    v4[2](v4);
  }
}

- (void)readResponse:(id)a3
{
  v15 = (void (**)(id, void, NWURLLoaderData *))a3;
  if (!self || !self->_data)
  {
    v12 = objc_alloc(&OBJC_CLASS___NWURLError);
    if (v12)
    {
      uint64_t v13 = *MEMORY[0x189607740];
      v16.receiver = v12;
      v16.super_class = (Class)&OBJC_CLASS___NWURLError;
      v5 = -[NWURLLoaderData initWithDomain:code:userInfo:](&v16, sel_initWithDomain_code_userInfo_, v13, -1000LL, 0LL);
      if (self)
      {
LABEL_7:
        URL = self->_URL;
LABEL_8:
        -[NWURLLoaderData setFailingURL:](v5, "setFailingURL:", URL);
        v15[2](v15, 0LL, v5);
        goto LABEL_4;
      }
    }

    else
    {
      v5 = 0LL;
      if (self) {
        goto LABEL_7;
      }
    }

    URL = 0LL;
    goto LABEL_8;
  }

  id v4 = objc_alloc(MEMORY[0x189601EF0]);
  v5 = self->_URL;
  CFDataRef v6 = self->_MIMEType;
  data = (dispatch_data_s *)self->_data;
  size_t size = dispatch_data_get_size(data);
  textEncodingName = self->_textEncodingName;
  v10 = data;
  v11 = (void *)[v4 initWithURL:v5 MIMEType:v6 expectedContentLength:size textEncodingName:textEncodingName];
  ((void (**)(id, void *, NWURLLoaderData *))v15)[2](v15, v11, 0LL);

LABEL_4:
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  v15 = a5;
  if (self && (data = (dispatch_data_s *)self->_data) != 0LL)
  {
    size_t size = dispatch_data_get_size((dispatch_data_t)self->_data);
    size_t offset = self->_offset;
    if (size - offset >= a4) {
      size_t v10 = a4;
    }
    else {
      size_t v10 = size - offset;
    }
    subrange = (NWURLLoaderData *)dispatch_data_create_subrange(data, offset, v10);
    self->_offset += v10;
    v12 = (void (*)(void))v15[2];
  }

  else
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___NWURLError);
    if (v13)
    {
      uint64_t v14 = *MEMORY[0x189607740];
      v16.receiver = v13;
      v16.super_class = (Class)&OBJC_CLASS___NWURLError;
      subrange = -[NWURLLoaderData initWithDomain:code:userInfo:]( &v16,  sel_initWithDomain_code_userInfo_,  v14,  -1000LL,  0LL);
    }

    else
    {
      subrange = 0LL;
    }

    v12 = (void (*)(void))v15[2];
  }

  v12();
}

- (NSString)multipartMixedReplaceBoundary
{
  return 0LL;
}

- (OS_sec_trust)peerTrust
{
  return 0LL;
}

- (BOOL)requestComplete
{
  return 1;
}

- (void)notifyRequestCompletion:(id)a3
{
}

- (id)takeCachedResponse
{
  return 0LL;
}

- (OS_nw_http_fields)trailerFields
{
  return 0LL;
}

- (BOOL)allowsWrite
{
  return 0;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  _os_crash();
  __break(1u);
}

- (OS_nw_connection)underlyingConnection
{
  result = (OS_nw_connection *)_os_crash();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (id)initWithURL:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___NWURLLoaderData;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

@end