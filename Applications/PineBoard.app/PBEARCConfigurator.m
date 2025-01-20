@interface PBEARCConfigurator
+ (id)sharedInstance;
- (EARCSystemClient)earcClient;
- (NSHashTable)observers;
- (OS_dispatch_queue)observerQueue;
- (id)_init;
- (int64_t)_statusForStreamingProtocol:(id)a3;
- (int64_t)eARCStatus;
- (void)addEARCObserver:(id)a3;
- (void)dealloc;
- (void)enableEARC:(BOOL)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeEARCObserver:(id)a3;
- (void)toggleEARC:(BOOL)a3 completion:(id)a4;
@end

@implementation PBEARCConfigurator

+ (id)sharedInstance
{
  if (qword_100470E60 != -1) {
    dispatch_once(&qword_100470E60, &stru_1003D75B8);
  }
  return (id)qword_100470E58;
}

- (id)_init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PBEARCConfigurator;
  v2 = -[PBEARCConfigurator init](&v18, "init");
  if (v2)
  {
    if (!qword_100470E68)
    {
      __int128 v23 = off_1003D7600;
      v24 = 0LL;
      qword_100470E68 = _sl_dlopen(&v23, 0LL);
    }

    if (qword_100470E68)
    {
      uint64_t v19 = 0LL;
      v20 = &v19;
      uint64_t v21 = 0x2050000000LL;
      v3 = (void *)qword_100470E70;
      uint64_t v22 = qword_100470E70;
      if (!qword_100470E70)
      {
        *(void *)&__int128 v23 = _NSConcreteStackBlock;
        *((void *)&v23 + 1) = 3221225472LL;
        v24 = sub_1000FF06C;
        v25 = &unk_1003D0790;
        v26 = &v19;
        sub_1000FF06C((uint64_t)&v23);
        v3 = (void *)v20[3];
      }

      v4 = v3;
      _Block_object_dispose(&v19, 8);
      id v5 = objc_alloc_init(v4);
      v7 = v2 + 24;
      v6 = (void *)*((void *)v2 + 3);
      *((void *)v2 + 3) = v5;
    }

    else
    {
      v7 = v2 + 24;
      v6 = (void *)*((void *)v2 + 3);
      *((void *)v2 + 3) = 0LL;
    }

    if (!*v7)
    {
      id v8 = sub_100082B14();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100280A0C(v9);
      }
    }

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.PineBoard.eARC.observers", v11);
    v13 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v12;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 1), off_10046B9C8, *((void **)v2 + 1), 0LL);
    v14 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  517LL,  0LL);
    v15 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v14;

    [*((id *)v2 + 3) addObserver:v2 forKeyPath:@"streamingProtocol" options:1 context:off_10046B9D0];
    [*((id *)v2 + 3) addObserver:v2 forKeyPath:@"featureEnabled" options:1 context:off_10046B9D8];
    v16 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBEARCConfigurator;
  -[PBEARCConfigurator dealloc](&v3, "dealloc");
}

- (int64_t)eARCStatus
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBEARCConfigurator earcClient](self, "earcClient"));
  unsigned int v4 = [v3 isFeatureEnabled];

  if (!v4) {
    return 0LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBEARCConfigurator earcClient](self, "earcClient"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 streamingProtocol]);

  int64_t v7 = -[PBEARCConfigurator _statusForStreamingProtocol:](self, "_statusForStreamingProtocol:", v6);
  return v7;
}

- (void)enableEARC:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100082B14();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v7 = "NO";
    if (v3) {
      int64_t v7 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Request to set (e)ARC to enabled: %s",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBEARCConfigurator earcClient](self, "earcClient"));
  id v13 = 0LL;
  unsigned __int8 v9 = [v8 setFeatureState:v3 error:&v13];
  id v10 = v13;

  if ((v9 & 1) == 0)
  {
    id v11 = sub_100082B14();
    dispatch_queue_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100280A4C(v10, v12);
    }
  }
}

- (void)toggleEARC:(BOOL)a3 completion:(id)a4
{
  unsigned int v4 = a3;
  v6 = (void (**)(id, int64_t, void))a4;
  if (!qword_100470E68)
  {
    *(_OWORD *)buf = off_1003D7600;
    uint64_t v23 = 0LL;
    qword_100470E68 = _sl_dlopen(buf, 0LL);
  }

  if (qword_100470E68)
  {
    id v7 = sub_100082B14();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Request to set (e)ARC to enabled: %d (Deprecated SPI)",  buf,  8u);
    }

    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBEARCConfigurator earcClient](self, "earcClient"));
    unsigned int v10 = [v9 isFeatureEnabled];

    if (v10 == v4)
    {
      if (v6) {
        v6[2](v6, -[PBEARCConfigurator eARCStatus](self, "eARCStatus"), 0LL);
      }
    }

    else
    {
      uint64_t v11 = v4;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000FDFE0;
      v17[3] = &unk_1003D75E0;
      objc_super v18 = objc_alloc_init(&OBJC_CLASS___PBEARCDeprecatedConfigurator);
      uint64_t v19 = v6;
      dispatch_queue_t v12 = v18;
      -[PBEARCDeprecatedConfigurator _toggleFeatureState:completion:](v12, "_toggleFeatureState:completion:", v11, v17);
    }
  }

  else
  {
    id v13 = objc_alloc(&OBJC_CLASS___NSError);
    uint64_t v14 = PBSEARCConfiguratorErrorDomain;
    NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
    uint64_t v21 = @"(e)ARC is not supported on this Apple TV.";
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    v16 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", v14, 12000LL, v15);

    if (v6) {
      ((void (**)(id, int64_t, NSError *))v6)[2](v6, 0LL, v16);
    }
  }
}

- (void)addEARCObserver:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000FE0BC;
  v6[3] = &unk_1003CFEB8;
  v6[4] = self;
  id v4 = a3;
  id v7 = v4;
  id v5 = objc_retainBlock(v6);
  if (dispatch_get_specific(off_10046B9C8) == &self->_observerQueue) {
    ((void (*)(void *))v5[2])(v5);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->_observerQueue, v5);
  }
}

- (void)removeEARCObserver:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000FE194;
  v6[3] = &unk_1003CFEB8;
  v6[4] = self;
  id v4 = a3;
  id v7 = v4;
  id v5 = objc_retainBlock(v6);
  if (dispatch_get_specific(off_10046B9C8) == &self->_observerQueue) {
    ((void (*)(void *))v5[2])(v5);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->_observerQueue, v5);
  }
}

- (int64_t)_statusForStreamingProtocol:(id)a3
{
  id v3 = a3;
  if (!qword_100470E68)
  {
    __int128 v12 = off_1003D7600;
    uint64_t v13 = 0LL;
    qword_100470E68 = _sl_dlopen(&v12, 0LL);
  }

  if (!qword_100470E68)
  {
    int64_t v6 = -1LL;
    goto LABEL_21;
  }

  *(void *)&__int128 v12 = 0LL;
  *((void *)&v12 + 1) = &v12;
  uint64_t v13 = 0x2020000000LL;
  id v4 = (id *)qword_100470E78;
  uint64_t v14 = qword_100470E78;
  if (!qword_100470E78)
  {
    id v5 = (void *)sub_1000FF0C0();
    id v4 = (id *)dlsym(v5, "EARCStreamingProtocolEARC");
    *(void *)(*((void *)&v12 + 1) + 24LL) = v4;
    qword_100470E78 = (uint64_t)v4;
  }

  _Block_object_dispose(&v12, 8);
  if (!v4) {
    goto LABEL_22;
  }
  if (objc_msgSend(*v4, "isEqualToString:", v3, (void)v12))
  {
    int64_t v6 = 3LL;
    goto LABEL_21;
  }

  *(void *)&__int128 v12 = 0LL;
  *((void *)&v12 + 1) = &v12;
  uint64_t v13 = 0x2020000000LL;
  id v7 = (id *)qword_100470E80;
  uint64_t v14 = qword_100470E80;
  if (!qword_100470E80)
  {
    id v8 = (void *)sub_1000FF0C0();
    id v7 = (id *)dlsym(v8, "EARCStreamingProtocolARC");
    *(void *)(*((void *)&v12 + 1) + 24LL) = v7;
    qword_100470E80 = (uint64_t)v7;
  }

  _Block_object_dispose(&v12, 8);
  if (!v7) {
    goto LABEL_22;
  }
  if (objc_msgSend(*v7, "isEqualToString:", v3, (void)v12))
  {
    int64_t v6 = 2LL;
    goto LABEL_21;
  }

  *(void *)&__int128 v12 = 0LL;
  *((void *)&v12 + 1) = &v12;
  uint64_t v13 = 0x2020000000LL;
  unsigned __int8 v9 = (id *)qword_100470E88;
  uint64_t v14 = qword_100470E88;
  if (!qword_100470E88)
  {
    unsigned int v10 = (void *)sub_1000FF0C0();
    unsigned __int8 v9 = (id *)dlsym(v10, "EARCStreamingProtocolNone");
    *(void *)(*((void *)&v12 + 1) + 24LL) = v9;
    qword_100470E88 = (uint64_t)v9;
  }

  _Block_object_dispose(&v12, 8);
  if (!v9)
  {
LABEL_22:
    sub_100280AF0();
    __break(1u);
  }

  else {
    int64_t v6 = -1LL;
  }
LABEL_21:

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[PBEARCConfigurator earcClient](self, "earcClient"));

  if (v13 == v11)
  {
    if (off_10046B9D8 == a6)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
      unsigned int v15 = [v14 BOOLValue];

      id v16 = sub_100082B14();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v18 = "NO";
        if (v15) {
          objc_super v18 = "YES";
        }
        *(_DWORD *)buf = 136315138;
        v32 = (void *)v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "KVO : feature enabled : %s", buf, 0xCu);
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBEARCConfigurator earcClient](self, "earcClient"));
      NSErrorUserInfoKey v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v19 streamingProtocol]);

      if ((v15 & 1) == 0)
      {
        int64_t v21 = 0LL;
LABEL_16:

        id v26 = sub_100082B14();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v32) = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Sending status update to observers: %d",  buf,  8u);
        }

        NSErrorUserInfoKey v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBEARCConfigurator observerQueue](self, "observerQueue"));
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_1000FE6EC;
        v28[3] = &unk_1003D05A8;
        v28[4] = self;
        v28[5] = v21;
        dispatch_async(v20, v28);
        goto LABEL_19;
      }
    }

    else
    {
      if (off_10046B9D0 != a6)
      {
        v29.receiver = self;
        v29.super_class = (Class)&OBJC_CLASS___PBEARCConfigurator;
        -[PBEARCConfigurator observeValueForKeyPath:ofObject:change:context:]( &v29,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
        goto LABEL_20;
      }

      NSErrorUserInfoKey v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
      id v22 = sub_100082B14();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v20;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "KVO : protocol changed : %@", buf, 0xCu);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBEARCConfigurator earcClient](self, "earcClient"));
      unsigned __int8 v25 = [v24 isFeatureEnabled];

      if ((v25 & 1) == 0)
      {
LABEL_19:

        goto LABEL_20;
      }
    }

    int64_t v21 = -[PBEARCConfigurator _statusForStreamingProtocol:](self, "_statusForStreamingProtocol:", v20);
    goto LABEL_16;
  }

  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PBEARCConfigurator;
  -[PBEARCConfigurator observeValueForKeyPath:ofObject:change:context:]( &v30,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_20:
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (EARCSystemClient)earcClient
{
  return self->_earcClient;
}

- (void).cxx_destruct
{
}

@end