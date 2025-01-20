@interface PluginBackendXPC
+ (BOOL)supportsSecureCoding;
- (DIURL)URL;
- (PluginBackendXPC)initWithCoder:(id)a3;
- (PluginBackendXPC)initWithURL:(id)a3 openMode:(int)a4;
- (const)pluginHeader;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PluginBackendXPC

- (PluginBackendXPC)initWithURL:(id)a3 openMode:(int)a4
{
  id v7 = a3;
  unsigned int v31 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PluginBackendXPC;
  v8 = -[PluginBackendXPC init](&v30, "init");
  if (v8)
  {
    id v9 = objc_claimAutoreleasedReturnValue([v7 pluginName]);
    v10 = (char *)[v9 UTF8String];

    v29 = v10;
    if (!v10)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &off_100189E78;
      v23 = std::generic_category();
      exception[1] = 22LL;
      exception[2] = v23;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = "Invalid plugin URL, plugin name is missing";
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 pluginParams]);
    v26 = v11;
    sub_1000B80A4(&v29, (uint64_t *)&v26, &v31, &v27);

    sub_1000B8260(&v27, &v24);
    __int128 v25 = v24;
    __int128 v24 = 0uLL;
    -[BackendXPC setBackend:](v8, "setBackend:", &v25, 0LL);
    v12 = (std::__shared_weak_count *)*((void *)&v25 + 1);
    if (*((void *)&v25 + 1))
    {
      v13 = (unint64_t *)(*((void *)&v25 + 1) + 8LL);
      do
        unint64_t v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }

    v15 = (std::__shared_weak_count *)*((void *)&v24 + 1);
    if (*((void *)&v24 + 1))
    {
      v16 = (unint64_t *)(*((void *)&v24 + 1) + 8LL);
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    objc_storeStrong((id *)&v8->_URL, a3);
    v18 = v28;
    if (v28)
    {
      p_shared_owners = (unint64_t *)&v28->__shared_owners_;
      do
        unint64_t v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }

  return v8;
}

- (PluginBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___PluginBackendXPC;
  v6 = -[BackendXPC initWithCoder:](&v40, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIURL, v5), @"URL");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    URL = v6->_URL;
    v6->_URL = (DIURL *)v8;

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData, v10);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14);
    unint64_t v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v11,  v13,  v15,  objc_opt_class(&OBJC_CLASS___NSFileHandle, v16),  0LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v18 forKey:@"encodedDict"]);

    __int128 v38 = *(_OWORD *)off_10017C828;
    v39 = j__free_0;
    id v20 = objc_claimAutoreleasedReturnValue(-[DIURL pluginName](v6->_URL, "pluginName"));
    uint64_t v34 = 0LL;
    v35 = (char *)[v20 UTF8String];
    v33 = v19;
    sub_1000B8480(&v35, (uint64_t)&v34, (uint64_t)&unk_10013D25F, (uint64_t)&v38, &v33, &v36);

    sub_1000B8260(&v36, &v31);
    __int128 v32 = v31;
    __int128 v31 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v32);
    v21 = (std::__shared_weak_count *)*((void *)&v32 + 1);
    if (*((void *)&v32 + 1))
    {
      v22 = (unint64_t *)(*((void *)&v32 + 1) + 8LL);
      do
        unint64_t v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }

    __int128 v24 = (std::__shared_weak_count *)*((void *)&v31 + 1);
    if (*((void *)&v31 + 1))
    {
      __int128 v25 = (unint64_t *)(*((void *)&v31 + 1) + 8LL);
      do
        unint64_t v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }

    uint64_t v27 = v37;
    if (v37)
    {
      p_shared_owners = (unint64_t *)&v37->__shared_owners_;
      do
        unint64_t v29 = __ldaxr(p_shared_owners);
      while (__stlxr(v29 - 1, p_shared_owners));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PluginBackendXPC;
  -[BackendXPC encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PluginBackendXPC URL](self, "URL"));
  [v4 encodeObject:v5 forKey:@"URL"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  (*(void (**)(void))(*(void *)-[PluginBackendXPC pluginHeader](self, "pluginHeader") + 64LL))();
  if ([v6 count]) {
    [v4 encodeObject:v6 forKey:@"encodedDict"];
  }
}

- (const)pluginHeader
{
  v2 = *(const void **)(v6 + 24);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end