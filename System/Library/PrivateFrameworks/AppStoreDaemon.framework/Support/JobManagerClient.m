@interface JobManagerClient
- (JobManagerClient)initWithConnection:(id)a3;
@end

@implementation JobManagerClient

- (JobManagerClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___JobManagerClient;
  v6 = -[XPCClient initWithConnection:](&v16, "initWithConnection:", v5);
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class(v6, v7);
      id v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient clientID](v6, "clientID"));
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%@]: Client connected: %@",  buf,  0x16u);
    }

    objc_storeStrong((id *)&v6->_connection, a3);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.appstored.JobManagerClient", v12);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v13;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end