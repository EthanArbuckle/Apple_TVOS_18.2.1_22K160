@interface IPLocalizationSwitcherServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IPLocalizationSwitcherServiceDelegate)init;
- (NSMutableSet)subscribers;
- (OS_dispatch_queue)queue;
- (OS_xpc_event_publisher)publisher;
- (void)addSubscriber:(unint64_t)a3;
- (void)preferredLanguageChangedForBundleID:(id)a3;
- (void)removeSubscriber:(unint64_t)a3;
- (void)setPublisher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSubscribers:(id)a3;
@end

@implementation IPLocalizationSwitcherServiceDelegate

- (IPLocalizationSwitcherServiceDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IPLocalizationSwitcherServiceDelegate;
  v2 = -[IPLocalizationSwitcherServiceDelegate init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSMutableSet *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.IntlPreferences.events", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___IPLocalizationSwitcherProtocol));
  [v5 setExportedInterface:v6];

  v7 = objc_opt_new(&OBJC_CLASS___IPLocalizationSwitcher);
  -[IPLocalizationSwitcher setDelegate:](v7, "setDelegate:", self);
  [v5 setExportedObject:v7];
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.localizationswitcher"]);
  if (v8
    && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && [v8 BOOLValue])
  {
    [v5 resume];
    BOOL v10 = 1;
  }

  else
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_10000279C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    [v5 invalidate];
    BOOL v10 = 0;
  }

  return v10;
}

- (void)addSubscriber:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IPLocalizationSwitcherServiceDelegate subscribers](self, "subscribers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  [v5 addObject:v4];
}

- (void)removeSubscriber:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IPLocalizationSwitcherServiceDelegate subscribers](self, "subscribers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  [v5 removeObject:v4];
}

- (void)preferredLanguageChangedForBundleID:(id)a3
{
  id v4 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[IPLocalizationSwitcherServiceDelegate subscribers](self, "subscribers"));
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&__int128 v6 = 134217984LL;
    __int128 v13 = v6;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v9), "unsignedLongLongValue", v13);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[IPLocalizationSwitcherServiceDelegate publisher](self, "publisher"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IPLocalizationSwitcherServiceDelegate queue](self, "queue"));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_100001910;
        v15[3] = &unk_100004250;
        id v18 = v10;
        id v16 = v4;
        uint64_t v17 = self;
        xpc_event_publisher_fire_with_reply(v11, v10, 0LL, v12, v15);

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          id v24 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Fired initial XPC event to ping the subscriber [%llu]",  buf,  0xCu);
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }

    while (v7);
  }
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (NSMutableSet)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end