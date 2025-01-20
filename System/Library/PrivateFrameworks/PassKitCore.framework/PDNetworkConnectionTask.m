@interface PDNetworkConnectionTask
- (id)request;
- (void)_destroyConnectionManager;
- (void)_handleConnectionFailureWithError:(id)a3;
- (void)_handleConnectionSuccessWithResponse:(id)a3 data:(id)a4;
- (void)_startConnection:(BOOL)a3;
- (void)dealloc;
- (void)performCancel;
- (void)performReset;
- (void)performStart:(BOOL)a3;
@end

@implementation PDNetworkConnectionTask

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDNetworkConnectionTask;
  -[PDNetworkConnectionTask dealloc](&v3, "dealloc");
}

- (void)performStart:(BOOL)a3
{
}

- (void)performCancel
{
}

- (void)performReset
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDNetworkConnectionTask;
  -[PDNetworkTask performReset](&v3, "performReset");
  -[PDNetworkConnectionTask _destroyConnectionManager](self, "_destroyConnectionManager");
}

- (void)_startConnection:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___PDSecureConnectionManager);
  connectionManager = self->_connectionManager;
  self->_connectionManager = v5;

  objc_initWeak(&location, self);
  v7 = self->_connectionManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10017A410;
  v15[3] = &unk_100647A88;
  objc_copyWeak(&v16, &location);
  -[PDSecureConnectionManager setSuccessHandler:](v7, "setSuccessHandler:", v15);
  v8 = self->_connectionManager;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10017A474;
  v13[3] = &unk_100642098;
  objc_copyWeak(&v14, &location);
  -[PDSecureConnectionManager setFailureHandler:](v8, "setFailureHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDNetworkConnectionTask request](self, "request"));
  uint64_t v10 = PKAllowHTTP([v9 setAllowsCellularAccess:v3]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 URL]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 host]);
  +[NSURLRequest setAllowsAnyHTTPSCertificate:forHost:]( &OBJC_CLASS___NSURLRequest,  "setAllowsAnyHTTPSCertificate:forHost:",  v10,  v12);

  -[PDSecureConnectionManager setRequest:](self->_connectionManager, "setRequest:", v9);
  -[PDSecureConnectionManager start](self->_connectionManager, "start");

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_handleConnectionSuccessWithResponse:(id)a3 data:(id)a4
{
}

- (void)_handleConnectionFailureWithError:(id)a3
{
}

- (void)_destroyConnectionManager
{
  connectionManager = self->_connectionManager;
  self->_connectionManager = 0LL;
}

- (id)request
{
  return 0LL;
}

- (void).cxx_destruct
{
}

@end