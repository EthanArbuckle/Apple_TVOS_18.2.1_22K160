@interface HHDClientProxy
+ (id)clientProxyWithServiceRegistry:(id)a3 connection:(id)a4;
- (BOOL)clientEntitledForNotificationWithSelector:(SEL)a3;
- (BOOL)clientEntitledForRequestWithSelector:(SEL)a3;
- (BOOL)clientRegisteredForSelector:(SEL)a3;
- (HHDClientProxy)initWithServiceRegistry:(id)a3 connection:(id)a4 entitlementChecker:(id)a5;
- (NSString)processName;
- (NSXPCConnection)connection;
- (void)_handleNotificationRegistrationChange;
- (void)activateEndpointWithIdentifier:(id)a3 callback:(id)a4;
- (void)createEndpointWithAccessoryIdentifier:(id)a3 mediaRouteId:(id)a4 callback:(id)a5;
- (void)deactivateEndpointWithIdentifier:(id)a3 callback:(id)a4;
- (void)deleteEndpointWithIdentifier:(id)a3 callback:(id)a4;
- (void)getDaemonVersionInformationWithCallback:(id)a3;
- (void)getEndpointAppStateListWithCallback:(id)a3;
- (void)getEndpointWithBubbleIdentifier:(id)a3 callback:(id)a4;
- (void)getEndpointWithIdentifier:(id)a3 callback:(id)a4;
- (void)listEndpointsWithCallback:(id)a3;
- (void)registerForNotifications:(id)a3 callback:(id)a4;
@end

@implementation HHDClientProxy

- (HHDClientProxy)initWithServiceRegistry:(id)a3 connection:(id)a4 entitlementChecker:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___HHDClientProxy;
  v12 = -[HHDClientProxy init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceRegistry, a3);
    objc_storeStrong((id *)&v13->_entitlementChecker, a5);
    objc_storeWeak((id *)&v13->_connection, v10);
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[ProcessInfo processNameWithPid:]( ProcessInfo,  "processNameWithPid:",  [v10 processIdentifier]));
    processName = v13->_processName;
    v13->_processName = (NSString *)v14;
  }

  return v13;
}

+ (id)clientProxyWithServiceRegistry:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[HHDEntitlementChecker entitlementCheckerWithConnection:]( &OBJC_CLASS___HHDEntitlementChecker,  "entitlementCheckerWithConnection:",  v6));
  if (v7)
  {
    v8 = -[HHDClientProxy initWithServiceRegistry:connection:entitlementChecker:]( objc_alloc(&OBJC_CLASS___HHDClientProxy),  "initWithServiceRegistry:connection:entitlementChecker:",  v5,  v6,  v7);
  }

  else
  {
    id v9 = sub_10000DC4C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      v13 = &stru_100024E50;
      __int16 v14 = 2048;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@Connection [%p] did not have any entitlements",  (uint8_t *)&v12,  0x16u);
    }

    v8 = 0LL;
  }

  return v8;
}

- (BOOL)clientRegisteredForSelector:(SEL)a3
{
  NSUInteger v5 = -[NSPointerArray count](self->_registeredSelectors, "count");
  if (v5)
  {
    NSUInteger v6 = v5;
    if (-[NSPointerArray pointerAtIndex:](self->_registeredSelectors, "pointerAtIndex:", 0LL) == a3)
    {
      LOBYTE(v5) = 1;
    }

    else
    {
      uint64_t v7 = 1LL;
      do
      {
        unint64_t v8 = v7;
        if (v6 == v7) {
          break;
        }
        SEL v9 = -[NSPointerArray pointerAtIndex:](self->_registeredSelectors, "pointerAtIndex:", v7);
        uint64_t v7 = v8 + 1;
      }

      while (v9 != a3);
      LOBYTE(v5) = v8 < v6;
    }
  }

  return v5;
}

- (BOOL)clientEntitledForRequestWithSelector:(SEL)a3
{
  return -[HHDEntitlementChecker hasEntitlement:]( self->_entitlementChecker,  "hasEntitlement:",  +[HHDClientEntitlements getRequestEntitlementForSelector:]( &OBJC_CLASS___HHDClientEntitlements,  "getRequestEntitlementForSelector:",  a3));
}

- (BOOL)clientEntitledForNotificationWithSelector:(SEL)a3
{
  return -[HHDEntitlementChecker hasEntitlement:]( self->_entitlementChecker,  "hasEntitlement:",  +[HHDClientEntitlements getNotificationEntitlementForSelector:]( &OBJC_CLASS___HHDClientEntitlements,  "getNotificationEntitlementForSelector:",  a3));
}

- (void)createEndpointWithAccessoryIdentifier:(id)a3 mediaRouteId:(id)a4 callback:(id)a5
{
  serviceRegistry = self->_serviceRegistry;
  unint64_t v8 = (void (**)(id, void *, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](serviceRegistry, "endpointManager"));
  id v17 = 0LL;
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 createEndpointWithAccessoryIdentifier:v10 mediaRouteId:v9 error:&v17]);

  id v13 = v17;
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 bridgedEndpoint]);

  id v15 = sub_10000DC4C();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = &stru_100024E50;
    __int16 v20 = 2112;
    v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@Created endpoint: %@", buf, 0x16u);
  }

  v8[2](v8, v14, v13);
}

- (void)activateEndpointWithIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](self->_serviceRegistry, "endpointManager"));
  id v13 = 0LL;
  unsigned __int8 v9 = [v8 activateEndpointWithIdentifier:v6 error:&v13];
  id v10 = v13;

  if ((v9 & 1) == 0)
  {
    id v11 = sub_10000DC4C();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = &stru_100024E50;
      __int16 v16 = 2114;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@Failed to activate endpoint with identifier %{public}@: %@",  buf,  0x20u);
    }
  }

  v7[2](v7, v10);
}

- (void)deactivateEndpointWithIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a4;
  serviceRegistry = self->_serviceRegistry;
  id v8 = a3;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](serviceRegistry, "endpointManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000E0B4;
  v11[3] = &unk_100024AC8;
  id v12 = v6;
  id v10 = v6;
  [v9 deactivateEndpointWithIdentifier:v8 callback:v11];
}

- (void)deleteEndpointWithIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](self->_serviceRegistry, "endpointManager"));
  id v13 = 0LL;
  unsigned __int8 v9 = [v8 deleteEndpointWithIdentifier:v6 error:&v13];
  id v10 = v13;

  if ((v9 & 1) == 0)
  {
    id v11 = sub_10000DC4C();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = &stru_100024E50;
      __int16 v16 = 2114;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@Failed to delete endpoint with identifier %{public}@: %@",  buf,  0x20u);
    }
  }

  v7[2](v7, v10);
}

- (void)getEndpointWithIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  serviceRegistry = self->_serviceRegistry;
  id v8 = (void (**)(id, void *, id))a4;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](serviceRegistry, "endpointManager"));
  id v15 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointForIdentifier:v6 error:&v15]);
  id v11 = v15;

  if (!v10)
  {
    id v12 = sub_10000DC4C();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = &stru_100024E50;
      __int16 v18 = 2114;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@Failed to retrieve endpoint with id %{public}@: %@",  buf,  0x20u);
    }
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 bridgedEndpoint]);
  v8[2](v8, v14, v11);
}

- (void)listEndpointsWithCallback:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  id v5 = sub_10000DC4C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = &stru_100024E50;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@Retrieving list of endpoints.",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](self->_serviceRegistry, "endpointManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointList]);

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray hhd_bridgedArrayWithEndpoints:](&OBJC_CLASS___NSArray, "hhd_bridgedArrayWithEndpoints:", v8));
  v4[2](v4, v9, 0LL);
}

- (void)getEndpointAppStateListWithCallback:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  id v5 = sub_10000DC4C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    int v10 = &stru_100024E50;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@Retrieving endpoint app state list.",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry sideBoardManager](self->_serviceRegistry, "sideBoardManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointAppStateList]);
  v4[2](v4, v8, 0LL);
}

- (void)registerForNotifications:(id)a3 callback:(id)a4
{
  id v6 = a3;
  v27 = (void (**)(id, void))a4;
  uint64_t v7 = self;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClientProxy connection](self, "connection"));
  int v9 = (NSPointerArray *)objc_claimAutoreleasedReturnValue( +[NSPointerArray pointerArrayWithOptions:]( &OBJC_CLASS___NSPointerArray,  "pointerArrayWithOptions:",  258LL));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(NSString **)(*((void *)&v28 + 1) + 8LL * (void)i);
        SEL v16 = NSSelectorFromString(v15);
        if (v16)
        {
          -[NSPointerArray addPointer:](v9, "addPointer:", v16);
        }

        else
        {
          id v17 = sub_10000DC4C();
          __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClientProxy processName](v7, "processName"));
            unsigned int v20 = [v8 processIdentifier];
            *(_DWORD *)buf = 138413314;
            v33 = &stru_100024E50;
            __int16 v34 = 2112;
            v35 = v15;
            __int16 v36 = 2114;
            *(void *)v37 = v19;
            *(_WORD *)&v37[8] = 1024;
            *(_DWORD *)&v37[10] = v20;
            __int16 v38 = 2048;
            id v39 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%@Bad selector '%@' received from client [name='%{public}@', pid=%d] (conn=%p)",  buf,  0x30u);
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }

    while (v12);
  }

  id v21 = sub_10000DC4C();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (NSString *)objc_claimAutoreleasedReturnValue(-[HHDClientProxy processName](v7, "processName"));
    unsigned int v24 = [v8 processIdentifier];
    id v25 = -[NSPointerArray count](v9, "count");
    *(_DWORD *)buf = 138413314;
    v33 = &stru_100024E50;
    __int16 v34 = 2114;
    v35 = v23;
    __int16 v36 = 1024;
    *(_DWORD *)v37 = v24;
    *(_WORD *)&v37[4] = 2048;
    *(void *)&v37[6] = v8;
    __int16 v38 = 2048;
    id v39 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%@Client [name='%{public}@', pid=%d] (conn=%p) registered for %lu notification(s)",  buf,  0x30u);
  }

  registeredSelectors = v7->_registeredSelectors;
  v7->_registeredSelectors = v9;

  v27[2](v27, 0LL);
  -[HHDClientProxy _handleNotificationRegistrationChange](v7, "_handleNotificationRegistrationChange");
}

- (void)getEndpointWithBubbleIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *))a4;
  id v8 = sub_10000DC4C();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int128 v28 = &stru_100024E50;
    __int16 v29 = 2114;
    id v30 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@Retrieving endpoint with bubble id %{public}@.",  buf,  0x16u);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](self->_serviceRegistry, "endpointManager", 0LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 endpointList]);

  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v24;
LABEL_5:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v24 != v14) {
        objc_enumerationMutation(v11);
      }
      SEL v16 = *(void **)(*((void *)&v23 + 1) + 8 * v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 launchInstanceId]);
      unsigned __int8 v18 = [v17 isEqual:v6];

      if ((v18 & 1) != 0) {
        break;
      }
      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v13) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 bridgedEndpoint]);

    if (!v19) {
      goto LABEL_14;
    }
    unsigned int v20 = 0LL;
  }

  else
  {
LABEL_11:

LABEL_14:
    id v21 = sub_10000DC4C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      __int128 v28 = &stru_100024E50;
      __int16 v29 = 2114;
      id v30 = v6;
      __int16 v31 = 2112;
      uint64_t v32 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%@Failed to retrieve endpoint with bubble id %{public}@: %@",  buf,  0x20u);
    }

    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  5LL,  @"Endpoint not found."));
    id v19 = 0LL;
  }

  v7[2](v7, v19, v20);
}

- (void)getDaemonVersionInformationWithCallback:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "137.3.1"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "xbs"));
  (*((void (**)(id, id, void *))a3 + 2))(v4, v6, v5);
}

- (void)_handleNotificationRegistrationChange
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HHDClientProxy connection](self, "connection"));
  if (v3)
  {
    if (-[HHDClientProxy clientRegisteredForSelector:](self, "clientRegisteredForSelector:", "endpointListChanged:"))
    {
      id v4 = sub_10000DC4C();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        SEL v16 = &stru_100024E50;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%@Client registered for endpointListChanged notification, sending latest value",  (uint8_t *)&v15,  0xCu);
      }

      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry endpointManager](self->_serviceRegistry, "endpointManager"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 endpointList]);

      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxy]);
      int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray hhd_bridgedArrayWithEndpoints:]( &OBJC_CLASS___NSArray,  "hhd_bridgedArrayWithEndpoints:",  v7));
      [v8 endpointListChanged:v9];
    }

    if (-[HHDClientProxy clientRegisteredForSelector:]( self,  "clientRegisteredForSelector:",  "endpointAppStateListChanged:"))
    {
      id v10 = sub_10000DC4C();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        SEL v16 = &stru_100024E50;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%@Client registered for endpointAppStateListChanged notification, sending latest value",  (uint8_t *)&v15,  0xCu);
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceRegistry sideBoardManager](self->_serviceRegistry, "sideBoardManager"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 endpointAppStateList]);

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxy]);
      [v14 endpointAppStateListChanged:v13];
    }
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (NSString)processName
{
  return self->_processName;
}

- (void).cxx_destruct
{
}

@end