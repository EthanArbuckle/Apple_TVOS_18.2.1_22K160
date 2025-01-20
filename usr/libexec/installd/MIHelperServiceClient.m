@interface MIHelperServiceClient
+ (id)sharedInstance;
- (BOOL)createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 withError:(id *)a7;
- (BOOL)migrateMobileContentWithError:(id *)a3;
- (BOOL)moveItemInStagingDirectory:(unint64_t)a3 atRelativePath:(id)a4 toDestinationURL:(id)a5 onBehalfOf:(id *)a6 withError:(id *)a7;
- (BOOL)wipeStagingRootAndSetUpPerUserDataDirWithError:(id *)a3;
- (NSXPCConnection)xpcConnection;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_sharedConnection;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)stageItemAtURL:(id)a3 options:(id)a4 containedSymlink:(BOOL *)a5 error:(id *)a6;
- (void)_invalidateObject;
- (void)dealloc;
- (void)setXpcConnection:(id)a3;
@end

@implementation MIHelperServiceClient

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035B44;
  block[3] = &unk_100080BC0;
  block[4] = a1;
  if (qword_100095B70 != -1) {
    dispatch_once(&qword_100095B70, block);
  }
  return (id)qword_100095B78;
}

- (void)_invalidateObject
{
  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](obj, "xpcConnection"));
  [v2 invalidate];

  -[MIHelperServiceClient setXpcConnection:](obj, "setXpcConnection:", 0LL);
  objc_sync_exit(obj);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIHelperServiceClient;
  -[MIHelperServiceClient dealloc](&v3, "dealloc");
}

- (id)_sharedConnection
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));

  if (v3) {
    goto LABEL_4;
  }
  v4 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.MobileInstallationHelperService");
  -[MIHelperServiceClient setXpcConnection:](v2, "setXpcConnection:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
  if (v5)
  {
    id v6 = sub_10000A2FC();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
    [v8 setRemoteObjectInterface:v7];

    objc_initWeak(&location, v2);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100035E28;
    v15[3] = &unk_100081740;
    objc_copyWeak(&v16, &location);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
    [v9 setInterruptionHandler:v15];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100035E54;
    v13[3] = &unk_100081740;
    objc_copyWeak(&v14, &location);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
    [v10 setInvalidationHandler:v13];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
    [v11 resume];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
  }

  objc_sync_exit(v2);

  return v5;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _sharedConnection](self, "_sharedConnection"));
  v7 = v5;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v4]);
  }

  else
  {
    id v9 = sub_1000130F4( (uint64_t)"-[MIHelperServiceClient _remoteObjectProxyWithErrorHandler:]",  85LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to get XPC connection",  v6,  v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v4[2](v4, v10);

    v8 = 0LL;
  }

  return v8;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _sharedConnection](self, "_sharedConnection"));
  v7 = v5;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 synchronousRemoteObjectProxyWithErrorHandler:v4]);
  }

  else
  {
    id v9 = sub_1000130F4( (uint64_t)"-[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:]",  96LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to get XPC connection",  v6,  v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v4[2](v4, v10);

    v8 = 0LL;
  }

  return v8;
}

- (BOOL)migrateMobileContentWithError:(id *)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_10003610C;
  id v14 = sub_10003611C;
  id v15 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100036124;
  v9[3] = &unk_100081768;
  v9[4] = &v10;
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v9));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003618C;
  v8[3] = &unk_100081768;
  v8[4] = &v10;
  [v4 migrateMobileContentWithCompletion:v8];

  v5 = (void *)v11[5];
  if (a3 && v5)
  {
    *a3 = v5;
    v5 = (void *)v11[5];
  }

  BOOL v6 = v5 == 0LL;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (BOOL)wipeStagingRootAndSetUpPerUserDataDirWithError:(id *)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_10003610C;
  id v14 = sub_10003611C;
  id v15 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000362C0;
  v9[3] = &unk_100081768;
  v9[4] = &v10;
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v9));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100036328;
  v8[3] = &unk_100081768;
  v8[4] = &v10;
  [v4 wipeStagingRootAndSetUpPerUserDataDirWithCompletion:v8];

  v5 = (void *)v11[5];
  if (a3 && v5)
  {
    *a3 = v5;
    v5 = (void *)v11[5];
  }

  BOOL v6 = v5 == 0LL;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)stageItemAtURL:(id)a3 options:(id)a4 containedSymlink:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_10003610C;
  v33 = sub_10003611C;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_10003610C;
  v27 = sub_10003611C;
  id v28 = 0LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003652C;
  v18[3] = &unk_100081768;
  v18[4] = &v23;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v18));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100036594;
  v17[3] = &unk_100081790;
  v17[4] = &v23;
  v17[5] = &v29;
  v17[6] = &v19;
  [v12 stageItemAtURL:v10 options:v11 completion:v17];

  v13 = v30;
  id v14 = (void *)v30[5];
  if (a6 && !v14)
  {
    *a6 = (id) v24[5];
    v13 = v30;
    id v14 = (void *)v30[5];
  }

  if (a5 && v14)
  {
    *a5 = *((_BYTE *)v20 + 24);
    id v14 = (void *)v13[5];
  }

  id v15 = v14;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v15;
}

- (BOOL)createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v21 = 0LL;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_10003610C;
  uint64_t v25 = sub_10003611C;
  id v26 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000367A0;
  v20[3] = &unk_100081768;
  v20[4] = &v21;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v20));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100036808;
  v19[3] = &unk_100081768;
  v19[4] = &v21;
  [v15 createSafeHarborWithIdentifier:v12 forPersona:v13 containerType:a5 andMigrateDataFrom:v14 completion:v19];

  id v16 = (void *)v22[5];
  if (a7 && v16)
  {
    *a7 = v16;
    id v16 = (void *)v22[5];
  }

  BOOL v17 = v16 == 0LL;
  _Block_object_dispose(&v21, 8);

  return v17;
}

- (BOOL)moveItemInStagingDirectory:(unint64_t)a3 atRelativePath:(id)a4 toDestinationURL:(id)a5 onBehalfOf:(id *)a6 withError:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = sub_10003610C;
  v30 = sub_10003611C;
  id v31 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000369D0;
  v21[3] = &unk_100081768;
  v21[4] = &v26;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:]( self,  "_synchronousRemoteObjectProxyWithErrorHandler:",  v21));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100036A38;
  v20[3] = &unk_1000817B8;
  v20[4] = &v26;
  void v20[5] = &v22;
  __int128 v15 = *(_OWORD *)&a6->var0[4];
  v19[0] = *(_OWORD *)a6->var0;
  v19[1] = v15;
  [v14 moveItemInStagingDirectory:a3 atRelativePath:v12 toDestinationURL:v13 onBehalfOf:v19 completion:v20];

  int v16 = *((unsigned __int8 *)v23 + 24);
  if (a7 && !*((_BYTE *)v23 + 24))
  {
    *a7 = (id) v27[5];
    int v16 = *((unsigned __int8 *)v23 + 24);
  }

  BOOL v17 = v16 != 0;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
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