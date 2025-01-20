@interface AKPCSAuthController
- (AKPCSAuthController)initWithPCSKeyProvider:(id)a3;
- (void)PCSAuthContextForWebSessionIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5;
- (void)_updateContext:(id)a3 serviceName:(id)a4;
- (void)removeAllPCSAuthCredential;
@end

@implementation AKPCSAuthController

- (AKPCSAuthController)initWithPCSKeyProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKPCSAuthController;
  v6 = -[AKPCSAuthController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyProvider, a3);
  }

  return v7;
}

- (void)PCSAuthContextForWebSessionIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  keyProvider = self->_keyProvider;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10002F510;
  v13[3] = &unk_1001C7950;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  -[AKWebSessionPCSKeyProvider fetchContextForWebSessionIdentifier:completion:]( keyProvider,  "fetchContextForWebSessionIdentifier:completion:",  a3,  v13);
}

- (void)removeAllPCSAuthCredential
{
}

- (void)_updateContext:(id)a3 serviceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Updating context for new service request: %@",  (uint8_t *)&buf,  0xCu);
  }

  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  uint64_t v12 = AKWalrusWebAccessRequestedServices;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKWalrusWebAccessRequestedServices]);

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0) {
    -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v13);
  }
  -[NSMutableArray addObject:](v10, "addObject:", v7);
  uint64_t v27 = v12;
  v28 = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  [v6 setUserInfo:v16];

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_10002F7BC;
  v25 = sub_10002F7CC;
  v26 = self;
  keyProvider = v26->_keyProvider;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002F7D4;
  v19[3] = &unk_1001C7978;
  id v18 = v6;
  id v20 = v18;
  p___int128 buf = &buf;
  -[AKWebSessionPCSKeyProvider updateContext:completion:](keyProvider, "updateContext:completion:", v18, v19);

  _Block_object_dispose(&buf, 8);
}

- (void).cxx_destruct
{
}

@end