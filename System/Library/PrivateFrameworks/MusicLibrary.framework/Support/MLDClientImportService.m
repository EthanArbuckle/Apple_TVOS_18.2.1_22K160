@interface MLDClientImportService
+ (MLDClientImportService)sharedService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MLDClientImportService)init;
@end

@implementation MLDClientImportService

- (MLDClientImportService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MLDClientImportService;
  v2 = -[MLDClientImportService init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    activeSessions = v2->_activeSessions;
    v2->_activeSessions = (NSMutableArray *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.amp.MusicLibrary.MLDCLientImportService.accessQueue", v6);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v34 = a3;
  id v6 = a4;
  dispatch_queue_t v7 = -[MLDClientImportServiceSession initWithConnection:]( objc_alloc(&OBJC_CLASS___MLDClientImportServiceSession),  "initWithConnection:",  v6);
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015890;
  block[3] = &unk_1000251D8;
  block[4] = self;
  v9 = v7;
  v43 = v9;
  dispatch_sync(accessQueue, block);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ML3ClientImportServiceSessionXPCInterface));
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray, v11);
  v14 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  objc_opt_class(&OBJC_CLASS___ML3ClientImportItem, v13),  0LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v10 setClasses:v15 forSelector:"addItems:completion:" argumentIndex:0 ofReply:0];

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSArray, v16);
  v19 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v17,  objc_opt_class(&OBJC_CLASS___ML3ClientImportItem, v18),  0LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v10 setClasses:v20 forSelector:"updateItems:completion:" argumentIndex:0 ofReply:0];

  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray, v21);
  v24 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v22,  objc_opt_class(&OBJC_CLASS___ML3ClientImportItem, v23),  0LL);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  [v10 setClasses:v25 forSelector:"removeItems:completion:" argumentIndex:0 ofReply:0];

  [v6 setExportedInterface:v10];
  [v6 setExportedObject:v9];
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ML3ClientImportSessionXPCInterface));
  [v6 setRemoteObjectInterface:v26];
  unsigned int v27 = [v6 processIdentifier];
  if (v6) {
    [v6 auditToken];
  }
  else {
    memset(v41, 0, sizeof(v41));
  }
  uint64_t v28 = MSVBundleIDForAuditToken(v41);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v45 = self;
    __int16 v46 = 2114;
    v47 = v9;
    __int16 v48 = 2114;
    v49 = v29;
    __int16 v50 = 1024;
    unsigned int v51 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Created new session %{public}@ for incoming connection from %{public}@[%d]",  buf,  0x26u);
  }

  objc_initWeak((id *)buf, self);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10001589C;
  v38[3] = &unk_100025200;
  objc_copyWeak(&v40, (id *)buf);
  v31 = v9;
  v39 = v31;
  [v6 setInterruptionHandler:v38];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000159D4;
  v35[3] = &unk_100025200;
  objc_copyWeak(&v37, (id *)buf);
  v32 = v31;
  v36 = v32;
  [v6 setInvalidationHandler:v35];
  [v6 resume];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void).cxx_destruct
{
}

+ (MLDClientImportService)sharedService
{
  if (qword_10002BB78 != -1) {
    dispatch_once(&qword_10002BB78, &stru_1000251B0);
  }
  return (MLDClientImportService *)(id)qword_10002BB70;
}

@end