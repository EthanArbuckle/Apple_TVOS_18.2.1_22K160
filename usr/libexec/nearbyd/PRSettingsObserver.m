@interface PRSettingsObserver
- (NSObject)settings;
- (PRSettingsObserver)initWithSettings:(id)a3 queue:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startObserving:(id)a3 observeImmediately:(BOOL)a4 callback:(id)a5;
- (void)stopObserving:(id)a3;
@end

@implementation PRSettingsObserver

- (PRSettingsObserver)initWithSettings:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PRSettingsObserver;
  v9 = -[PRSettingsObserver init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_settings, a3);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    settingsSubscriptions = v10->_settingsSubscriptions;
    v10->_settingsSubscriptions = v11;
  }

  return v10;
}

- (void)startObserving:(id)a3 observeImmediately:(BOOL)a4 callback:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = (void (**)(void, void))v9;
  if (v8 && v9)
  {
    v11 = self;
    objc_sync_enter(v11);
    settingsSubscriptions = v11->_settingsSubscriptions;
    id v13 = objc_retainBlock(v10);
    -[NSMutableDictionary setObject:forKey:](settingsSubscriptions, "setObject:forKey:", v13, v8);

    -[NSObject addObserver:forKeyPath:options:context:]( v11->_settings,  "addObserver:forKeyPath:options:context:",  v11,  v8,  0LL,  0LL);
    objc_sync_exit(v11);

    if (v6)
    {
      queue = (dispatch_queue_s *)v11->_queue;
      if (queue)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_1002B519C;
        v16[3] = &unk_1007BBF88;
        v18 = v10;
        id v17 = v8;
        dispatch_async(queue, v16);
      }

      else
      {
        ((void (**)(void, id))v10)[2](v10, v8);
      }
    }
  }

  else
  {
    v15 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A69F8(v15);
    }
  }
}

- (void)stopObserving:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSObject removeObserver:forKeyPath:](v4->_settings, "removeObserver:forKeyPath:", v4, v5);
  -[NSMutableDictionary removeObjectForKey:](v4->_settingsSubscriptions, "removeObjectForKey:", v5);
  objc_sync_exit(v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  objc_sync_enter(v12);
  id v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v12->_settingsSubscriptions,  "objectForKey:",  v9));
  objc_super v14 = v13;
  if (v13)
  {
    queue = (dispatch_queue_s *)v12->_queue;
    if (queue)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1002B5380;
      v17[3] = &unk_1007BBF88;
      v19 = v13;
      id v18 = v9;
      dispatch_sync(queue, v17);
    }

    else
    {
      ((void (**)(void, id))v13)[2](v13, v9);
    }
  }

  else
  {
    v16 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A6A38((uint64_t)v9, v16);
    }
    -[NSObject removeObserver:forKeyPath:](v12->_settings, "removeObserver:forKeyPath:", v12, v9);
  }

  objc_sync_exit(v12);
}

- (NSObject)settings
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end