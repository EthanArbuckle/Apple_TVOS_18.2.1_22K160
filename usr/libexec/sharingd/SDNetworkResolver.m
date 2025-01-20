@interface SDNetworkResolver
- (NSNumber)flags;
- (NSString)protocol;
- (SDNetworkResolver)initWithNode:(__SFNode *)a3;
- (SDNetworkResolverDelegate)delegate;
- (int)start;
- (void)bonjourResolverDidChange:(id)a3;
- (void)dealloc;
- (void)notifyClientAboutResolve:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setFlags:(id)a3;
- (void)setProtocol:(id)a3;
- (void)stop;
@end

@implementation SDNetworkResolver

- (SDNetworkResolver)initWithNode:(__SFNode *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SDNetworkResolver;
  v4 = -[SDNetworkResolver init](&v10, "init");
  v5 = v4;
  if (v4)
  {
    flags = v4->_flags;
    v4->_flags = 0LL;

    v5->_node = (__SFNode *)CFRetain(a3);
    protocol = v5->_protocol;
    v5->_protocol = 0LL;

    resolver = v5->_resolver;
    v5->_resolver = 0LL;

    v5->_session = 0LL;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDNetworkResolver;
  -[SDNetworkResolver dealloc](&v3, "dealloc");
}

- (void)notifyClientAboutResolve:(int)a3
{
  v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  self->_node,  kSFOperationNodeKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  self->_flags,  kSFOperationFlagsKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  self->_protocol,  kSFOperationProtocolKey);
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SFNodeError",  a3,  0LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v5, kSFOperationErrorKey);

    uint64_t v6 = 10LL;
  }

  else
  {
    uint64_t v6 = 9LL;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained networkResolver:self event:v6 withResults:v8];

  -[SDNetworkResolver stop](self, "stop");
}

- (void)bonjourResolverDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 error];
  if ((_DWORD)v5)
  {
    int v7 = (int)v5;
    uint64_t v8 = browser_log(v5, v6);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100094654(v7, v9);
    }

    objc_super v10 = self;
    uint64_t v11 = 0xFFFFFFFFLL;
    goto LABEL_16;
  }

  v12 = (const __CFURL *)SFNodeCopyURL(self->_node);
  if (v12)
  {
    v13 = v12;
    CFStringRef v14 = CFURLCopyScheme(v12);
    if (v14)
    {
      CFStringRef v15 = v14;
      CFStringRef v16 = CFURLCopyPath(v13);
      if (v16)
      {
        v17 = v16;
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 hostName]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 portNumber]);
        v20 = sub_10008D8A8(v15, 0, 0, v18, (int)[v19 intValue], v17, 0, 0);

        SFNodeSetURL(self->_node, v20);
        if (v20) {
          CFRelease(v20);
        }
        CFRelease(v17);
      }

      CFRelease(v15);
    }

    CFRelease(v13);
  }

  else
  {
    node = self->_node;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 portNumber]);
    SFNodeSetPortNumber(node, [v22 intValue]);

    v23 = self->_node;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 hostName]);
    SFNodeSetHostName(v23, v24);

    v25 = self->_node;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    SFNodeSetPath(v25, v26);

    v27 = self->_node;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 url]);
    SFNodeSetURL(v27, v28);
  }

  if (-[NSString isEqualToString:](self->_protocol, "isEqualToString:", kSFNodeProtocolVNC))
  {
    objc_super v10 = self;
    uint64_t v11 = 0LL;
LABEL_16:
    -[SDNetworkResolver notifyClientAboutResolve:](v10, "notifyClientAboutResolve:", v11);
    goto LABEL_17;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained) {
    -[SDNetworkResolver mount](self, "mount");
  }
LABEL_17:
}

- (int)start
{
  protocol = self->_protocol;
  if (!protocol)
  {
    id v4 = sub_100115100();
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = self->_protocol;
    self->_protocol = v5;

    protocol = self->_protocol;
    if (!protocol) {
      return -2;
    }
  }

  if (-[NSString isEqualToString:](protocol, "isEqualToString:", kSFNodeProtocolODisk))
  {
    int v7 = (void *)SFNodeCopyURL(self->_node);
    uint64_t v8 = (void *)SFNodeCopyDomain(self->_node);
    uint64_t v9 = SFNodeCopyServiceName(self->_node);
    uint64_t v11 = (void *)v9;
    if (v7)
    {
      uint64_t v12 = _CFNetServiceCreateFromURL(0LL, v7);
      if (v12)
      {
        v13 = (__CFNetService *)v12;
        CFStringRef v14 = objc_alloc(&OBJC_CLASS___SDBonjourResolver);
        CFStringRef Name = CFNetServiceGetName(v13);
        CFStringRef Type = CFNetServiceGetType(v13);
        v17 = -[SDBonjourResolver initWithName:type:domain:path:timeout:]( v14,  "initWithName:type:domain:path:timeout:",  Name,  Type,  CFNetServiceGetDomain(v13),  0LL,  0LL);
        resolver = self->_resolver;
        self->_resolver = v17;

        -[SDBonjourResolver setDelegate:](self->_resolver, "setDelegate:", self);
        -[SDBonjourResolver resolve](self->_resolver, "resolve");
        CFRelease(v13);
LABEL_18:

        goto LABEL_19;
      }

      if (!v11 || !v8) {
        goto LABEL_18;
      }
    }

    else if (!v9 || !v8)
    {
      uint64_t v19 = browser_log(v9, v10);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000946F4(v20, v21, v22, v23, v24, v25, v26, v27);
      }
LABEL_24:

      return -2;
    }

    v28 = sub_10008E8D4(self->_protocol);
    if (v28)
    {
      v30 = v28;
      v31 = (void *)SFNodeCopyRealName(self->_node, v29);
      v32 = objc_alloc(&OBJC_CLASS___SDBonjourResolver);
      else {
        v33 = 0LL;
      }
      v34 = -[SDBonjourResolver initWithName:type:domain:path:timeout:]( v32,  "initWithName:type:domain:path:timeout:",  v11,  v30,  v8,  v33,  0LL);
      v35 = self->_resolver;
      self->_resolver = v34;

      -[SDBonjourResolver setDelegate:](self->_resolver, "setDelegate:", self);
      -[SDBonjourResolver resolve](self->_resolver, "resolve");

      goto LABEL_18;
    }

    uint64_t v37 = browser_log(0LL, v29);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000946C4(v20, v38, v39, v40, v41, v42, v43, v44);
    }
    goto LABEL_24;
  }

- (void)stop
{
  resolver = self->_resolver;
  if (resolver)
  {
    -[SDBonjourResolver setDelegate:](resolver, "setDelegate:", 0LL);
    -[SDBonjourResolver cancel](self->_resolver, "cancel");
    id v4 = self->_resolver;
    self->_resolver = 0LL;
  }

- (NSNumber)flags
{
  return (NSNumber *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setFlags:(id)a3
{
}

- (NSString)protocol
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setProtocol:(id)a3
{
}

- (SDNetworkResolverDelegate)delegate
{
  return (SDNetworkResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end