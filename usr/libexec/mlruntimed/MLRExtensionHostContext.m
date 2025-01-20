@interface MLRExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)issueSandBoxExtensionsForFileURLs:(id)a3 requireWrite:(BOOL)a4 outError:(id *)a5;
- (int)pid;
- (void)performOnRemoteObjectSynchronously:(BOOL)a3 WithBlock:(id)a4 errorHandler:(id)a5;
- (void)performOnRemoteObjectSynchronouslyWithBlock:(id)a3 errorHandler:(id)a4;
- (void)performOnRemoteObjectWithBlock:(id)a3 errorHandler:(id)a4;
@end

@implementation MLRExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_10001B3A0 != -1) {
    dispatch_once(&qword_10001B3A0, &stru_100014B28);
  }
  return (id)qword_10001B3A8;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_10001B3B0 != -1) {
    dispatch_once(&qword_10001B3B0, &stru_100014B48);
  }
  return (id)qword_10001B3B8;
}

- (int)pid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  int v3 = [v2 processIdentifier];

  return v3;
}

- (void)performOnRemoteObjectWithBlock:(id)a3 errorHandler:(id)a4
{
}

- (void)performOnRemoteObjectSynchronouslyWithBlock:(id)a3 errorHandler:(id)a4
{
}

- (void)performOnRemoteObjectSynchronously:(BOOL)a3 WithBlock:(id)a4 errorHandler:(id)a5
{
  BOOL v6 = a3;
  v8 = (void (**)(id, void *))a4;
  id v9 = a5;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_10000BDA8;
  v24 = sub_10000BDB8;
  id v25 = 0LL;
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10000BDC0;
    v19[3] = &unk_100014B70;
    v19[5] = &v20;
    v11 = v19;
    v19[4] = v9;
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 synchronousRemoteObjectProxyWithErrorHandler:v19]);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000BE50;
    v18[3] = &unk_100014B70;
    v18[5] = &v20;
    v11 = v18;
    v18[4] = v9;
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 remoteObjectProxyWithErrorHandler:v18]);
  }

  v13 = (void *)v12;

  if (!v13)
  {
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000BF70(v14);
    }

    if (!v21[5])
    {
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      v27 = @"Fail to create remote object proxy.";
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kDESDistributedEvaluationErrorDomain,  8000LL,  v15));
      v17 = (void *)v21[5];
      v21[5] = v16;
    }

    if (v9) {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, v21[5]);
    }
  }

  if (v8) {
    v8[2](v8, v13);
  }

  _Block_object_dispose(&v20, 8);
}

- (id)issueSandBoxExtensionsForFileURLs:(id)a3 requireWrite:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MLRExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[DESSandBoxManager sandboxExtensionsToXPCConnection:fileURLs:requireWrite:outError:]( &OBJC_CLASS___DESSandBoxManager,  "sandboxExtensionsToXPCConnection:fileURLs:requireWrite:outError:",  v9,  v8,  v6,  a5));

  return v10;
}

@end