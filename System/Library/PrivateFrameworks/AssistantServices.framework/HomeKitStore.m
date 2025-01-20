@interface HomeKitStore
+ (id)sharedInstance;
- (HomeKitStore)init;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation HomeKitStore

- (HomeKitStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___HomeKitStore;
  v2 = -[HomeKitStore init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[HMMutableHomeManagerConfiguration defaultPrivateConfiguration]( &OBJC_CLASS___HMMutableHomeManagerConfiguration,  "defaultPrivateConfiguration"));
    [v3 setOptions:34397];
    [v3 setCachePolicy:3];
    v4 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[HomeKitStore init]";
      __int16 v12 = 2112;
      v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Started initialization of homemanager with configuration %@",  buf,  0x16u);
    }

    uint64_t v5 = mach_absolute_time();
    v2->fetchStartTime = AFMachAbsoluteTimeGetMilliseconds(v5);
    v6 = -[HMHomeManager initWithConfiguration:](objc_alloc(&OBJC_CLASS___HMHomeManager), "initWithConfiguration:", v3);
    homeManager = v2->homeManager;
    v2->homeManager = v6;

    -[HMHomeManager setDelegate:](v2->homeManager, "setDelegate:", v2);
  }

  return v2;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006618;
  block[3] = &unk_1000146A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_10001AA40, block);
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10001AA48 != -1) {
    dispatch_once(&qword_10001AA48, &stru_100014448);
  }
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  objc_super v9 = sub_1000067F0;
  v10 = sub_100006800;
  id v11 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100006808;
  v5[3] = &unk_100014470;
  v5[4] = &v6;
  v5[5] = a1;
  dispatch_sync((dispatch_queue_t)qword_10001AA40, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

@end