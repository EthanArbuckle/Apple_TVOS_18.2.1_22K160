@interface NWConcrete_nw_url_endpoint
- (BOOL)initWithURL:(void *)a1;
- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4;
- (char)createDescription:(BOOL)a3;
- (const)hostname;
- (id)copyDictionary;
- (id)copyEndpoint;
- (unint64_t)getHash;
- (unsigned)port;
- (unsigned)type;
- (void)dealloc;
@end

@implementation NWConcrete_nw_url_endpoint

- (id)copyEndpoint
{
  v3 = objc_alloc_init(&OBJC_CLASS___NWConcrete_nw_url_endpoint);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42__NWConcrete_nw_url_endpoint_copyEndpoint__block_invoke;
  v7[3] = &unk_189BC9238;
  v4 = v3;
  v8 = v4;
  v9 = self;
  nw_synchronize(&self->lock, (uint64_t)v7);
  v5 = v4;

  return v5;
}

- (unsigned)type
{
  return 4;
}

- (void)dealloc
{
  url_ref = self->url_ref;
  if (url_ref)
  {
    CFRelease(url_ref);
    self->url_ref = 0LL;
  }

  url = self->url;
  if (url)
  {
    free(url);
    self->url = 0LL;
  }

  scheme = self->scheme;
  if (scheme)
  {
    free(scheme);
    self->scheme = 0LL;
  }

  hostname = self->hostname;
  if (hostname)
  {
    free(hostname);
    self->hostname = 0LL;
  }

  path = self->path;
  if (path)
  {
    free(path);
    self->path = 0LL;
  }

  sanitized_url = self->sanitized_url;
  if (sanitized_url)
  {
    free(sanitized_url);
    self->sanitized_url = 0LL;
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_url_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v9, sel_dealloc);
}

- (const)hostname
{
  return self->hostname;
}

- (unsigned)port
{
  return self->port;
}

- (id)copyDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_url_endpoint;
  id v3 = -[NWConcrete_nw_endpoint copyDictionary](&v8, sel_copyDictionary);
  v4 = v3;
  if (v3)
  {
    url = self->url;
    if (url) {
      xpc_dictionary_set_string(v3, "url", url);
    }
    id v6 = v4;
  }

  return v4;
}

- (char)createDescription:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  url = self->url;
  if (a3)
  {
    size_t v5 = strlen(self->url);
    __nwlog_salted_hash(url, v5, (char *)&v12);
    url = __str;
    snprintf(__str, 0xDuLL, "%s%s", "URL#", (const char *)&v12);
  }

  id v6 = self;
  v7 = v6->super.interface;

  objc_super v8 = v7 + 104;
  objc_super v9 = "@";
  v12 = 0LL;
  if (!v7)
  {
    objc_super v9 = "";
    objc_super v8 = "";
  }

  asprintf(&v12, "%s%s%s", url, v9, v8);
  v10 = v12;

  return v10;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = (CFTypeRef *)a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_url_endpoint;

  return v7;
}

- (unint64_t)getHash
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  url = self->url;
  CC_LONG v4 = strlen(url);
  CC_SHA256_Update(&v7, url, v4);
  CC_SHA256_Final(md, &v7);
  int8x16_t v5 = veorq_s8(*(int8x16_t *)md, v9);
  return (unint64_t)veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

- (BOOL)initWithURL:(void *)a1
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v50.receiver = a1;
  v50.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_url_endpoint;
  id v3 = objc_msgSendSuper2(&v50, sel_init);
  id v4 = v3;
  if (!v3)
  {
    __nwlog_obj();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v52 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
    v27 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v48 = 0;
    if (__nwlog_fault(v27, &type, &v48))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v29 = type;
        if (os_log_type_enabled(v28, type))
        {
          *(_DWORD *)buf = 136446210;
          v52 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_181A5C000, v28, v29, "%{public}s [super init] failed", buf, 0xCu);
        }
      }

      else if (v48)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v35 = type;
        BOOL v36 = os_log_type_enabled(v28, type);
        if (backtrace_string)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v52 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
            __int16 v53 = 2082;
            v54 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v28,  v35,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_77;
        }

        if (v36)
        {
          *(_DWORD *)buf = 136446210;
          v52 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_181A5C000, v28, v35, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v46 = type;
        if (os_log_type_enabled(v28, type))
        {
          *(_DWORD *)buf = 136446210;
          v52 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl( &dword_181A5C000,  v28,  v46,  "%{public}s [super init] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

@end