@interface CCDServicer
- (CCDServer)server;
- (CCDServicer)initWithXPCConnection:(id)a3 server:(id)a4;
- (NSXPCConnection)xpcConnection;
- (void)dealloc;
- (void)fetchConfigurationWithCompletionBlock:(id)a3;
- (void)fetchConfigurationWithoutValidationWithCompletionBlock:(id)a3;
- (void)pingWithCompletionBlock:(id)a3;
- (void)provisionallyEnrollWithNonce:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadOrganizationsWithCredentials:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadRequestTypesWithCredentials:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadSoldToIdsForOrganization:(id)a3 credentials:(id)a4 completionBlock:(id)a5;
- (void)setServer:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)submitDeviceUploadRequest:(id)a3 credentials:(id)a4 completionBlock:(id)a5;
- (void)syncDEPPushToken:(id)a3 pushTopic:(id)a4 completionBlock:(id)a5;
- (void)unenrollWithCompletionBlock:(id)a3;
@end

@implementation CCDServicer

- (CCDServicer)initWithXPCConnection:(id)a3 server:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CCDServicer;
  v9 = -[CCDServicer init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcConnection, a3);
    objc_storeStrong((id *)&v10->_server, a4);
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CCDServicer;
  -[CCDServicer dealloc](&v3, "dealloc");
}

- (void)provisionallyEnrollWithNonce:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  [v8 provisionallyEnrollWithNonce:v7 completionBlock:v6];
}

- (void)fetchConfigurationWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  [v5 fetchConfigurationWithCompletionBlock:v4];
}

- (void)fetchConfigurationWithoutValidationWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  [v5 fetchConfigurationWithoutValidationWithCompletionBlock:v4];
}

- (void)unenrollWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  [v5 unenrollWithCompletionBlock:v4];
}

- (void)retrieveDeviceUploadOrganizationsWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  [v8 retrieveDeviceUploadOrganizationsWithCredentials:v7 completionBlock:v6];
}

- (void)retrieveDeviceUploadRequestTypesWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  [v8 retrieveDeviceUploadRequestTypesWithCredentials:v7 completionBlock:v6];
}

- (void)retrieveDeviceUploadSoldToIdsForOrganization:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  [v11 retrieveDeviceUploadSoldToIdsForOrganization:v10 credentials:v9 completionBlock:v8];
}

- (void)submitDeviceUploadRequest:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  [v11 submitDeviceUploadRequest:v10 credentials:v9 completionBlock:v8];
}

- (void)syncDEPPushToken:(id)a3 pushTopic:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[DMCFeatureFlags isDEPPushEnabled](&OBJC_CLASS___DMCFeatureFlags, "isDEPPushEnabled");
  if ((v11 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
    [v14 syncDEPPushToken:v8 pushTopic:v9 completionBlock:v10];
  }

  else
  {
    v15 = *(os_log_s **)(DEPLogObjects(v11, v12, v13) + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "DEPPush feature flag is not enabled. Return...",  v16,  2u);
    }

    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0LL, 0LL, 0LL);
  }
}

- (void)pingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CCDServicer server](self, "server"));
  [v5 pingWithCompletionBlock:v4];
}

- (CCDServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end