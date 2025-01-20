@interface CDNamedXPCService
- (CDNamedXPCService)initWithInfo:(id)a3;
- (NSString)xpcServiceName;
- (unint64_t)options;
- (void)obtainXPCConnection:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setXpcServiceName:(id)a3;
@end

@implementation CDNamedXPCService

- (CDNamedXPCService)initWithInfo:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CDNamedXPCService;
  v3 = -[CDXPCService initWithInfo:](&v11, "initWithInfo:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](v3, "ID"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](v4, "ID"));
      -[CDNamedXPCService setXpcServiceName:](v4, "setXpcServiceName:", v6);
    }

    if (qword_100066838 != -1) {
      dispatch_once(&qword_100066838, &__block_literal_global_8);
    }
    id v7 = (id)_MergedGlobals_15;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDNamedXPCService xpcServiceName](v4, "xpcServiceName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

    LODWORD(v7) = [v9 isEqual:&__kCFBooleanTrue];
    if ((_DWORD)v7) {
      -[CDNamedXPCService setOptions:](v4, "setOptions:", -[CDNamedXPCService options](v4, "options") | 0x1000);
    }
  }

  return v4;
}

- (void)obtainXPCConnection:(id)a3
{
  v4 = (void (**)(id, NSError *, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDXPCService xpcConnection](self, "xpcConnection"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDNamedXPCService xpcServiceName](self, "xpcServiceName"));
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"com.apple.cache_delete.CDNamedXPCService.duplicate_connection",  @"Asked to build a connection to %@ but we already have a perfectly good one!",  v6);
  }

  else
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDNamedXPCService xpcServiceName](self, "xpcServiceName"));
    v9 = -[NSXPCConnection initWithMachServiceName:options:]( v7,  "initWithMachServiceName:options:",  v8,  -[CDNamedXPCService options](self, "options"));

    if (v9)
    {
      -[CDXPCService setXpcConnection:](self, "setXpcConnection:", v9);
      v10 = (NSError *)objc_claimAutoreleasedReturnValue(-[CDXPCService xpcConnection](self, "xpcConnection"));
      v4[2](v4, v10, 0LL);
    }

    else
    {
      uint64_t v11 = *__error();
      uint64_t v12 = CDGetLogHandle("daemon");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CDNamedXPCService xpcServiceName](self, "xpcServiceName"));
        *(_DWORD *)buf = 138412546;
        v21 = v17;
        __int16 v22 = 2080;
        v23 = strerror(v11);
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to create an XPC Connection to service %@: %s",  buf,  0x16u);
      }

      v10 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v11,  0LL);
      v14 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v18 = NSUnderlyingErrorKey;
      v19 = v10;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
      v16 = -[NSError initWithDomain:code:userInfo:]( v14,  "initWithDomain:code:userInfo:",  @"CacheDeleteErrorDomain",  6LL,  v15);

      ((void (**)(id, NSError *, NSError *))v4)[2](v4, 0LL, v16);
    }
  }
}

- (NSString)xpcServiceName
{
  return self->_xpcServiceName;
}

- (void)setXpcServiceName:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
}

@end