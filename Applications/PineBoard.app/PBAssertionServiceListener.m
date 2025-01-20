@interface PBAssertionServiceListener
- (BSServiceConnectionListener)listener;
- (PBAssertionServiceListener)init;
- (PBAssertionServiceListener)initWithAssertionDomainProvider:(id)a3;
- (PBDistributedAssertionDomainProviding)domainProvider;
- (id)_assertionProvidersForDomains:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation PBAssertionServiceListener

- (PBAssertionServiceListener)initWithAssertionDomainProvider:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___PBAssertionServiceListener;
    v7 = -[PBAssertionServiceListener init](&v11, "init");
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_domainProvider, a3);
    }

    return v8;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"provider != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027159C();
    }
    result = (PBAssertionServiceListener *)_bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
  }

  return result;
}

- (PBAssertionServiceListener)init
{
  id v3 = sub_10003B84C();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[PBAssertionServiceListener initWithAssertionDomainProvider:](self, "initWithAssertionDomainProvider:", v4);

  return v5;
}

- (void)dealloc
{
  if (self->_listener)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Lifecycle error, invalidate must be called before releasing."));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271644();
    }
    _bs_set_crash_log_message([v2 UTF8String]);
    __break(0);
  }

  else
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___PBAssertionServiceListener;
    -[PBAssertionServiceListener dealloc](&v3, "dealloc");
  }

- (void)activate
{
  if (!self->_listener)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100025520;
    v5[3] = &unk_1003D0EC8;
    v5[4] = self;
    objc_super v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v5));
    listener = self->_listener;
    self->_listener = v3;

    -[BSServiceConnectionListener activate](self->_listener, "activate");
  }

- (void)invalidate
{
  listener = self->_listener;
  self->_listener = 0LL;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteProcess]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.appletv.pbs.assertion-domains"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
  id v10 = v8;
  objc_super v11 = v10;
  if (v9)
  {
    if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0) {
      v12 = v11;
    }
    else {
      v12 = 0LL;
    }
  }

  else
  {
    v12 = 0LL;
  }

  id v13 = v12;

  if (v13) {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v13));
  }
  else {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  }
  v15 = (void *)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allObjects]);

  v17 = (void *)objc_claimAutoreleasedReturnValue( -[PBAssertionServiceListener _assertionProvidersForDomains:]( self,  "_assertionProvidersForDomains:",  v16));
  if ([v17 count])
  {
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    v27 = sub_10002583C;
    v28 = &unk_1003D1070;
    v29 = -[_PBAssertionServiceClient initWithConnection:domains:]( objc_alloc(&OBJC_CLASS____PBAssertionServiceClient),  "initWithConnection:domains:",  v6,  v17);
    id v18 = v7;
    id v30 = v18;
    v19 = v29;
    [v6 configureConnection:&v25];
    id v20 = sub_1000F6D6C();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = v18;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Activating connection {client=%{public}@, connection=%@}",  buf,  0x16u);
    }

    objc_msgSend(v6, "activate", v25, v26, v27, v28);
  }

  else
  {
    id v22 = sub_1000F6D6C();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1002716EC((uint64_t)v7, v23, v24);
    }

    [v6 invalidate];
  }
}

- (id)_assertionProvidersForDomains:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v4 count]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v11, (void)v16));

        if (!v12)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBDistributedAssertionDomainProviding assertionProviderForDomain:]( self->_domainProvider,  "assertionProviderForDomain:",  v11));
          if (v13) {
            -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v13, v11);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  id v14 = -[NSMutableDictionary copy](v5, "copy");
  return v14;
}

- (PBDistributedAssertionDomainProviding)domainProvider
{
  return self->_domainProvider;
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
}

@end