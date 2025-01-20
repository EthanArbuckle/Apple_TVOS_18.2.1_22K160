@interface NEProvider
+ (BOOL)isNEProviderBundle:(id)a3 forExtensionPoint:(id)a4;
+ (BOOL)isRunningInProvider;
+ (void)startSystemExtensionMode;
- (NEExtensionProviderContext)context;
- (NEProvider)init;
- (NSString)appName;
- (NWPath)defaultPath;
- (NWTCPConnection)createTCPConnectionToEndpoint:(NWEndpoint *)remoteEndpoint enableTLS:(BOOL)enableTLS TLSParameters:(NWTLSParameters *)TLSParameters delegate:(id)delegate;
- (NWUDPSession)createUDPSessionToEndpoint:(NWEndpoint *)remoteEndpoint fromEndpoint:(NWHostEndpoint *)localEndpoint;
- (id)initAllowUnentitled:(BOOL)a3;
- (int64_t)_callSwiftHandleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)dealloc;
- (void)displayMessage:(NSString *)message completionHandler:(void *)completionHandler;
- (void)observerHelperHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAppName:(id)a3;
- (void)setContext:(id)a3;
- (void)setDefaultPath:(id)a3;
- (void)setdefaultPathObserver:(id)a3;
- (void)sleepWithCompletionHandler:(void *)completionHandler;
- (void)wake;
@end

@implementation NEProvider

- (int64_t)_callSwiftHandleNewUDPFlow:(id)a3 initialRemoteFlowEndpoint:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  int64_t v7 = sub_1876BC2E4((uint64_t)v5);

  swift_unknownObjectRelease();
  return v7;
}

- (NEProvider)init
{
  return (NEProvider *)-[NEProvider initAllowUnentitled:](self, "initAllowUnentitled:", 0LL);
}

- (id)initAllowUnentitled:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = SecTaskCreateFromSelf(0LL);
  if (!v5)
  {
    if (!a3) {
      goto LABEL_11;
    }
LABEL_14:
    if (!+[NEProvider isRunningInProvider](&OBJC_CLASS___NEProvider, "isRunningInProvider"))
    {
      ne_log_obj();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v12 = "NEProvider objects cannot be instantiated from non-extension processes";
        v13 = v11;
        uint32_t v14 = 2;
        goto LABEL_24;
      }

- (void)dealloc
{
  if (self && objc_getProperty(self, v3, 16LL, 1))
  {
    v4 = -[NEProvider context](self, "context");
    if (v4)
    {
      id v6 = objc_getProperty(self, v5, 16LL, 1);
      -[NEProvider context](self, "context");
      CFTypeRef v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 removeObserver:v7 forKeyPath:@"path"];
    }

    objc_setProperty_atomic(self, v5, 0LL, 16LL);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEProvider;
  -[NEProvider dealloc](&v8, sel_dealloc);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  if (self)
  {
    id v5 = objc_getProperty(self, v4, 16LL, 1);
    if (v5)
    {
      id v6 = v5;
      -[NEProvider context](self, "context");
      CFTypeRef v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        defaultPathEvaluator = self->_defaultPathEvaluator;
        -[NEProvider context](self, "context");
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        -[NWPathEvaluator addObserver:forKeyPath:options:context:]( defaultPathEvaluator,  "addObserver:forKeyPath:options:context:",  v9,  @"path",  5LL,  0LL);
      }
    }
  }

- (void)setdefaultPathObserver:(id)a3
{
  v4 = (char *)a3;
  if (self)
  {
    id v6 = v4;
    id Property = objc_getProperty(self, v4, 16LL, 1);
    v4 = v6;
    if (v6)
    {
      if (Property)
      {
        -[NWPathEvaluator addObserver:forKeyPath:options:context:]( self->_defaultPathEvaluator,  "addObserver:forKeyPath:options:context:",  v6,  @"path",  5LL,  0LL);
        v4 = v6;
      }
    }
  }
}

- (void)observerHelperHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v17 = a3;
  id v9 = a4;
  id v11 = a5;
  if (self) {
    id Property = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v13 = Property;
  if (v13 != v9)
  {
LABEL_8:

    goto LABEL_9;
  }

  int v14 = [v17 isEqualToString:@"path"];

  if (v14)
  {
    if (self) {
      id v16 = objc_getProperty(self, v15, 16LL, 1);
    }
    else {
      id v16 = 0LL;
    }
    [v16 path];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    -[NEProvider setDefaultPath:](self, "setDefaultPath:", v13);
    goto LABEL_8;
  }

- (void)sleepWithCompletionHandler:(void *)completionHandler
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v4 = completionHandler;
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    CFTypeRef v7 = self;
    _os_log_impl(&dword_1876B1000, v5, OS_LOG_TYPE_INFO, "%@: Sleeping", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4);
}

- (void)wake
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "%@: Waking", (uint8_t *)&v4, 0xCu);
  }
}

- (NWTCPConnection)createTCPConnectionToEndpoint:(NWEndpoint *)remoteEndpoint enableTLS:(BOOL)enableTLS TLSParameters:(NWTLSParameters *)TLSParameters delegate:(id)delegate
{
  BOOL v7 = enableTLS;
  id v9 = TLSParameters;
  char v10 = (objc_class *)MEMORY[0x189608E10];
  id v11 = delegate;
  v12 = remoteEndpoint;
  id v13 = objc_alloc_init(v10);
  [v13 setEnableTLS:v7];
  if (v9 && v7)
  {
    -[NWTLSParameters TLSSessionID](v9, "TLSSessionID");
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setTLSSessionID:v14];
    v15 = -[NWTLSParameters SSLCipherSuites](v9, "SSLCipherSuites");
    [v13 setSSLCipherSuites:v15];

    objc_msgSend( v13,  "setMinimumSSLProtocolVersion:",  -[NWTLSParameters minimumSSLProtocolVersion](v9, "minimumSSLProtocolVersion"));
    objc_msgSend( v13,  "setMaximumSSLProtocolVersion:",  -[NWTLSParameters maximumSSLProtocolVersion](v9, "maximumSSLProtocolVersion"));
  }

  id v16 = (void *)[objc_alloc(MEMORY[0x189608E30]) initWithEndpoint:v12 parameters:v13 delegate:v11];

  return (NWTCPConnection *)v16;
}

- (NWUDPSession)createUDPSessionToEndpoint:(NWEndpoint *)remoteEndpoint fromEndpoint:(NWHostEndpoint *)localEndpoint
{
  id v5 = localEndpoint;
  uint64_t v6 = (objc_class *)MEMORY[0x189608E10];
  BOOL v7 = remoteEndpoint;
  id v8 = objc_alloc_init(v6);
  if (v5)
  {
    id v9 = (void *)MEMORY[0x189608DE8];
    -[NWHostEndpoint hostname](v5, "hostname");
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWHostEndpoint port](v5, "port");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 endpointWithHostname:v10 port:v11];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setLocalAddress:v12];
  }

  id v13 = (void *)[objc_alloc(MEMORY[0x189608E38]) initWithEndpoint:v7 parameters:v8];

  return (NWUDPSession *)v13;
}

- (void)displayMessage:(NSString *)message completionHandler:(void *)completionHandler
{
  id v11 = message;
  uint64_t v6 = completionHandler;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v11
    && (isKindOfClass & 1) == 0
    && (-[NEProvider appName](self, "appName"), id v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    -[NEProvider context](self, "context");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProvider appName](self, "appName");
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 displayMessage:v10 message:v11 completionHandler:v6];
  }

  else
  {
    v6[2](v6, 0LL);
  }
}

- (NWPath)defaultPath
{
  return (NWPath *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDefaultPath:(id)a3
{
}

- (NEExtensionProviderContext)context
{
  return (NEExtensionProviderContext *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setContext:(id)a3
{
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAppName:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)startSystemExtensionMode
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 start];
}

+ (BOOL)isRunningInProvider
{
  if (isRunningInProvider_check_init != -1) {
    dispatch_once(&isRunningInProvider_check_init, &__block_literal_global_19761);
  }
  return isRunningInProvider_callerIsProvider;
}

+ (BOOL)isNEProviderBundle:(id)a3 forExtensionPoint:(id)a4
{
  id v5 = a4;
  [a3 infoDictionary];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsdictionary(v6))
  {
    [v6 objectForKeyedSubscript:@"CFBundlePackageType"];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!isa_nsstring(v7) || ![v7 isEqualToString:@"XPC!"])
    {
      BOOL v10 = 0;
LABEL_16:

      goto LABEL_17;
    }

    [v6 objectForKeyedSubscript:@"NSExtension"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!isa_nsdictionary(v8))
    {
      BOOL v10 = 0;
LABEL_15:

      goto LABEL_16;
    }

    [v8 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v9))
    {
      if (v5)
      {
        if ([v9 isEqualToString:v5])
        {
LABEL_8:
          BOOL v10 = 1;
LABEL_14:

          goto LABEL_15;
        }
      }

      else if ([v9 hasPrefix:@"com.apple.networkextension."])
      {
        goto LABEL_8;
      }
    }

    BOOL v10 = 0;
    goto LABEL_14;
  }

  BOOL v10 = 0;
LABEL_17:

  return v10;
}

void __33__NEProvider_isRunningInProvider__block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  isRunningInProvider_callerIsProvider = +[NEProvider isNEProviderBundle:forExtensionPoint:]( &OBJC_CLASS___NEProvider,  "isNEProviderBundle:forExtensionPoint:",  v0,  0LL);
}

@end