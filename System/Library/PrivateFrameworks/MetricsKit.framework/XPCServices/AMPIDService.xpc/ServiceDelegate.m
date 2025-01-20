@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)secretStore;
@end

@implementation ServiceDelegate

- (id)secretStore
{
  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = (MTIDCompositeSecretStore *)objc_loadWeakRetained((id *)&v2->_secretStore);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(&OBJC_CLASS___MTIDCompositeSecretStore);
    objc_storeWeak((id *)&v2->_secretStore, WeakRetained);
    id v4 = MTMetricsKitOSLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "MetricsKit: AMPIDService shared secret store created",  v7,  2u);
    }
  }

  objc_sync_exit(v2);

  return WeakRetained;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MTXPCServiceInterface));
  [v7 setExportedInterface:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 exportedInterface]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 classesForSelector:"doResetSchemes:options:completion:" argumentIndex:0 ofReply:0]);
  id v11 = [v10 mutableCopy];

  uint64_t v36 = objc_opt_class(&OBJC_CLASS___MTIDScheme);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
  [v11 addObjectsFromArray:v12];

  [v9 setClasses:v11 forSelector:"doResetSchemes:options:completion:" argumentIndex:0 ofReply:0];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 classesForSelector:"doMaintainSchemes:options:" argumentIndex:0 ofReply:0]);
  id v14 = [v13 mutableCopy];

  uint64_t v35 = objc_opt_class(&OBJC_CLASS___MTIDScheme);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  [v14 addObjectsFromArray:v15];

  [v9 setClasses:v14 forSelector:"doMaintainSchemes:options:" argumentIndex:0 ofReply:0];
  v16 = (void *)objc_claimAutoreleasedReturnValue( [v9 classesForSelector:"syncForSchemes:options:completion:" argumentIndex:0 ofReply:0]);
  id v17 = [v16 mutableCopy];

  uint64_t v34 = objc_opt_class(&OBJC_CLASS___MTIDScheme);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
  [v17 addObjectsFromArray:v18];

  [v9 setClasses:v17 forSelector:"syncForSchemes:options:completion:" argumentIndex:0 ofReply:0];
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_100005074;
  v30 = sub_100005084;
  id v31 = (id)objc_claimAutoreleasedReturnValue(-[ServiceDelegate secretStore](self, "secretStore"));
  v19 = objc_alloc(&OBJC_CLASS___MTXPCConnection);
  v20 = -[MTXPCConnection initWithXPCConnection:secretStore:](v19, "initWithXPCConnection:secretStore:", v7, v27[5]);
  [v7 setExportedObject:v20];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000508C;
  v25[3] = &unk_1000204A0;
  v25[4] = &v26;
  [v7 setInvalidationHandler:v25];
  [v7 setInterruptionHandler:&stru_1000204E0];
  [v7 resume];
  id v21 = MTMetricsKitOSLog();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    signed int v23 = [v7 processIdentifier];
    *(_DWORD *)buf = 134217984;
    uint64_t v33 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "MetricsKit: AMPIDService XPC connection made from pid %ld",  buf,  0xCu);
  }

  _Block_object_dispose(&v26, 8);
  return 1;
}

- (void).cxx_destruct
{
}

@end