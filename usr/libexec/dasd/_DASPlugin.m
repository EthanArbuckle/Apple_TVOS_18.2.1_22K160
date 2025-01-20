@interface _DASPlugin
+ (id)existingPluginForIdentifier:(id)a3 ofType:(id)a4;
+ (id)extensionForIdentifier:(id)a3 ofType:(id)a4;
+ (id)pluginForIdentifier:(id)a3 ofType:(id)a4;
- (BOOL)isInternal;
- (NSExtension)extension;
- (NSString)displayName;
- (NSString)extensionID;
- (NSString)extensionName;
- (NSString)pluginMapKey;
- (NSUUID)sessionID;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (_DASActivity)currentActivity;
- (_DASPlugin)initWithExtension:(id)a3 pluginMapKey:(id)a4;
- (_DASPluginDelegate)pluginDelegate;
- (id)_contextForSession;
- (id)container;
- (id)containerID;
- (id)description;
- (void)_setupExtension;
- (void)_setupSessionIfNecessary;
- (void)extensionDidFinishWithStatus:(unsigned __int8)a3;
- (void)performActivity:(id)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionName:(id)a3;
- (void)setPluginDelegate:(id)a3;
- (void)setPluginMapKey:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSessionID:(id)a3;
- (void)suspend;
- (void)unload;
@end

@implementation _DASPlugin

+ (id)extensionForIdentifier:(id)a3 ofType:(id)a4
{
  id v5 = a3;
  v41 = (os_log_s *)a4;
  if (!v5)
  {
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Missing identifier for extensionPoint %@",  buf,  0xCu);
    }

    v28 = 0LL;
    goto LABEL_33;
  }

  id v48 = 0LL;
  id v6 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v5 allowPlaceholder:0 error:&v48];
  id v7 = v48;
  if (v6)
  {
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationExtensionRecords]);
    id v9 = [v8 countByEnumeratingWithState:&v44 objects:v59 count:16];
    if (v9)
    {
      id v10 = v9;
      v37 = v7;
      id v38 = v6;
      id v40 = v5;
      uint64_t v11 = *(void *)v45;
      p_info = &OBJC_METACLASS____DASBackgroundAppKillDemo.info;
      v13 = @"plugin";
LABEL_5:
      uint64_t v14 = 0LL;
      id v39 = v10;
      while (1)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v44 + 1) + 8 * v14);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_info + 436, "logForCategory:", v13, v37));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
          v18 = (void *)objc_claimAutoreleasedReturnValue([v15 extensionPointRecord]);
          uint64_t v19 = v11;
          v20 = v13;
          v21 = v8;
          v22 = p_info;
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 name]);
          *(_DWORD *)buf = 138413058;
          v52 = v17;
          __int16 v53 = 2112;
          v54 = v23;
          __int16 v55 = 2112;
          v56 = v41;
          __int16 v57 = 2112;
          id v58 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Checking extension %@ with pointRecord %@ (want %@) for bundle %@",  buf,  0x2Au);

          p_info = v22;
          v8 = v21;
          v13 = v20;
          uint64_t v11 = v19;
          id v10 = v39;
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue([v15 extensionPointRecord]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 name]);
        unsigned __int8 v26 = [v25 isEqualToString:v41];

        if ((v26 & 1) != 0) {
          break;
        }
        if (v10 == (id)++v14)
        {
          id v10 = [v8 countByEnumeratingWithState:&v44 objects:v59 count:16];
          if (v10) {
            goto LABEL_5;
          }
          id v5 = v40;
          id v7 = v37;
          id v6 = v38;
          goto LABEL_22;
        }
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue([v15 extensionPointRecord]);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 name]);

      if (v27)
      {
        v30 = v37;
        id v43 = v37;
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSExtension extensionWithIdentifier:error:]( &OBJC_CLASS___NSExtension,  "extensionWithIdentifier:error:",  v27,  &v43));
        id v31 = v43;
        id v5 = v40;
        id v6 = v38;
        goto LABEL_28;
      }

      id v5 = v40;
      id v7 = v37;
      id v6 = v38;
      goto LABEL_23;
    }
  }

  else
  {
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000B9234();
    }

    v8 = v7;
    id v7 = 0LL;
  }

+ (id)existingPluginForIdentifier:(id)a3 ofType:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingString:a4]);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100157D78);
  id v5 = (void *)qword_100157D80;
  if (!qword_100157D80)
  {
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v7 = (void *)qword_100157D80;
    qword_100157D80 = (uint64_t)v6;

    id v5 = (void *)qword_100157D80;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100157D78);

  return v8;
}

+ (id)pluginForIdentifier:(id)a3 ofType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:v7]);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100157D78);
  id v9 = (void *)qword_100157D80;
  if (!qword_100157D80)
  {
    id v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v11 = (void *)qword_100157D80;
    qword_100157D80 = (uint64_t)v10;

    id v9 = (void *)qword_100157D80;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100157D78);
  if (!v12)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 extensionForIdentifier:v6 ofType:v7]);
    v15 = v14;
    if (v14)
    {
      if (![v14 optedIn])
      {
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000B9294();
        }

        v13 = 0LL;
        goto LABEL_13;
      }

      v16 = -[_DASPlugin initWithExtension:pluginMapKey:]( objc_alloc(&OBJC_CLASS____DASPlugin),  "initWithExtension:pluginMapKey:",  v15,  v8);
      os_unfair_lock_lock((os_unfair_lock_t)&unk_100157D78);
      [(id)qword_100157D80 setObject:v16 forKeyedSubscript:v8];
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_100157D78);
    }

    else
    {
      v16 = 0LL;
    }

    v13 = v16;
LABEL_13:

    goto LABEL_14;
  }

  v13 = v12;
LABEL_14:

  return v13;
}

- (_DASPlugin)initWithExtension:(id)a3 pluginMapKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS____DASPlugin;
  v8 = -[_DASPlugin init](&v26, "init");
  id v9 = v8;
  if (v8)
  {
    -[_DASPlugin setExtension:](v8, "setExtension:", v6);
    -[_DASPlugin setPluginMapKey:](v9, "setPluginMapKey:", v7);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 infoDictionary]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"CFBundleDisplayName"]);
    -[_DASPlugin setDisplayName:](v9, "setDisplayName:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsSeparatedByString:@"."]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lastObject]);
    -[_DASPlugin setExtensionName:](v9, "setExtensionName:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extensionName](v9, "extensionName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Extension Queue (%@)",  v15));

    id v17 = v16;
    v18 = (const char *)[v17 cStringUsingEncoding:4];
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create(v18, v20);
    -[_DASPlugin setQueue:](v9, "setQueue:", v21);

    dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
    dispatch_queue_t v24 = dispatch_queue_create("Extension Delegate Queue", v23);
    -[_DASPlugin setDelegateQueue:](v9, "setDelegateQueue:", v24);

    -[_DASPlugin _setupExtension](v9, "_setupExtension");
  }

  return v9;
}

- (void)_setupExtension
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AC2A4;
  v7[3] = &unk_100117650;
  objc_copyWeak(&v8, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
  [v3 setRequestInterruptionBlock:v7];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AC4E0;
  v5[3] = &unk_100117678;
  objc_copyWeak(&v6, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
  [v4 setRequestCancellationBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_contextForSession
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin sessionID](self, "sessionID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 _extensionContextForUUID:v4]);

  return v5;
}

- (void)_setupSessionIfNecessary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin sessionID](self, "sessionID"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
    id v11 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 beginExtensionRequestWithOptions:0 inputItems:0 error:&v11]);
    id v6 = v11;

    if (v6 || !v5)
    {
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000B9394();
      }
    }

    else
    {
      -[_DASPlugin setSessionID:](self, "setSessionID:", v5);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin _contextForSession](self, "_contextForSession"));
      [v7 setContextPlugin:self];

      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[_DASPlugin _contextForSession](self, "_contextForSession"));
      id v9 = -[os_log_s pid](v8, "pid");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin currentActivity](self, "currentActivity"));
      [v10 setPid:v9];
    }
  }

- (void)performActivity:(id)a3
{
  v4 = (os_log_s *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin currentActivity](self, "currentActivity"));

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1000B94E4(self, (uint64_t)v4, v7);
    }
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Plugin performing activity: %@", buf, 0xCu);
    }

    -[_DASPlugin setCurrentActivity:](self, "setCurrentActivity:", v4);
    -[_DASPlugin _setupSessionIfNecessary](self, "_setupSessionIfNecessary");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[_DASPlugin _contextForSession](self, "_contextForSession"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = objc_opt_class(v7);
        *(_DWORD *)buf = 138412546;
        id v17 = v7;
        __int16 v18 = 2112;
        uint64_t v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Host context %@ (%@)", buf, 0x16u);
      }

      id v15 = 0LL;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s remoteContextWithError:](v7, "remoteContextWithError:", &v15));
      id v9 = (os_log_s *)v15;
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
      v13 = v12;
      if (v9 || !v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000B9484();
        }
      }

      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[_DASPlugin sessionID](self, "sessionID"));
          *(_DWORD *)buf = 138412290;
          id v17 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Reaching out to plugin to perform action with request ID %@.",  buf,  0xCu);
        }

        [v11 performActivity:v4];
      }
    }

    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_1000B93F4(self, v9);
    }
  }
}

- (void)suspend
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping task", buf, 2u);
  }

  -[_DASPlugin _setupSessionIfNecessary](self, "_setupSessionIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin _contextForSession](self, "_contextForSession"));
  id v8 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteContextWithError:&v8]);
  id v6 = v8;
  if (v6 || !v5)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B9484();
    }
  }

  else
  {
    [v5 suspend];
  }
}

- (void)extensionDidFinishWithStatus:(unsigned __int8)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin pluginDelegate](self, "pluginDelegate"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"plugin"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Notifying delegate %@ that plugin has finished",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin currentActivity](self, "currentActivity"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[_DASPlugin delegateQueue](self, "delegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ACC30;
  block[3] = &unk_1001176A0;
  id v12 = v5;
  id v13 = v7;
  unsigned __int8 v14 = a3;
  id v9 = v7;
  id v10 = v5;
  dispatch_async(v8, block);
}

- (void)unload
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[_DASPlugin queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ACCE0;
  block[3] = &unk_1001150D0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (id)container
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _plugIn]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 containingUrl]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);

  return v5;
}

- (id)containerID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin container](self, "container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);

  return v4;
}

- (NSString)extensionID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extension](self, "extension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return (NSString *)v3;
}

- (BOOL)isInternal
{
  return 0;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPlugin extensionName](self, "extensionName"));
  unsigned int v5 = -[_DASPlugin isInternal](self, "isInternal");
  id v6 = &stru_100118C98;
  if (v5) {
    id v6 = @" (internal)";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %@%@>",  v3,  v4,  v6));

  return v7;
}

- (NSString)extensionName
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setExtensionName:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (_DASPluginDelegate)pluginDelegate
{
  return (_DASPluginDelegate *)objc_loadWeakRetained((id *)&self->_pluginDelegate);
}

- (void)setPluginDelegate:(id)a3
{
}

- (NSExtension)extension
{
  return (NSExtension *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setExtension:(id)a3
{
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSessionID:(id)a3
{
}

- (NSString)pluginMapKey
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPluginMapKey:(id)a3
{
}

- (_DASActivity)currentActivity
{
  return (_DASActivity *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCurrentActivity:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end