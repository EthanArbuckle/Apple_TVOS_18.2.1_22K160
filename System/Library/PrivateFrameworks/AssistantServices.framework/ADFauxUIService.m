@interface ADFauxUIService
- (ADFauxUIService)init;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)_appPunchOutHandler:(id)a3 forDomain:(id)a4 completion:(id)a5;
- (void)_unhandledCommand:(id)a3 error:(id)a4 forDomain:(id)a5 completion:(id)a6;
- (void)_unhandledCommand:(id)a3 forDomain:(id)a4 completion:(id)a5;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
@end

@implementation ADFauxUIService

- (ADFauxUIService)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADFauxUIService;
  v2 = -[ADFauxUIService init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("Faux UI Service Queue", v4);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = (objc_class *)objc_opt_class(v2);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[ADService setIdentifier:](v2, "setIdentifier:", v9);
  }

  return v2;
}

- (id)domains
{
  uint64_t v3 = SAUIGroupIdentifier;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

- (id)commandsForDomain:(id)a3
{
  uint64_t v3 = SAUIGroupIdentifier;
  if ([a3 isEqualToString:SAUIGroupIdentifier])
  {
    uint64_t v6 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v10 encodedClassName]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 groupIdentifier]);
    *(_DWORD *)buf = 136315650;
    v30 = "-[ADFauxUIService handleCommand:forDomain:executionContext:reply:]";
    __int16 v31 = 2112;
    v32 = v16;
    __int16 v33 = 2112;
    v34 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Dispatching command (%@) for domain (%@)",  buf,  0x20u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10029F69C;
  block[3] = &unk_1004FCBB0;
  id v24 = v10;
  v25 = self;
  id v27 = v12;
  id v28 = v13;
  id v26 = v11;
  id v19 = v12;
  id v20 = v13;
  id v21 = v11;
  id v22 = v10;
  dispatch_async(serialQueue, block);
}

- (void)_appPunchOutHandler:(id)a3 forDomain:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  if (AFIsATV(v10, v11))
  {
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      id v21 = "-[ADFauxUIService _appPunchOutHandler:forDomain:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Waking system for app punchout",  (uint8_t *)&v20,  0xCu);
    }

    id v13 = [off_100575648() sharedInstance];
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = off_100575650();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v14 wakeSystemForReason:v16];

    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 punchOutUri]);
    LODWORD(v16) = sub_1001EADA8(v17);

    v18 = (Class *)&OBJC_CLASS___SACommandSucceeded_ptr;
    if (!(_DWORD)v16) {
      v18 = (Class *)&OBJC_CLASS___SACommandFailed_ptr;
    }
    id v19 = objc_alloc_init(*v18);
    if (v10) {
      v10[2](v10, v19, 0LL);
    }
  }

  else
  {
    -[ADFauxUIService _unhandledCommand:forDomain:completion:]( self,  "_unhandledCommand:forDomain:completion:",  v8,  v9,  v10);
  }
}

- (void)_unhandledCommand:(id)a3 forDomain:(id)a4 completion:(id)a5
{
}

- (void)_unhandledCommand:(id)a3 error:(id)a4 forDomain:(id)a5 completion:(id)a6
{
  if (a6)
  {
    id v8 = a6;
    id v9 = a4;
    id v10 = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"Command not supported ");
    (*((void (**)(id, SACommandFailed *, id))a6 + 2))(v8, v10, v9);
  }

- (void).cxx_destruct
{
}

@end