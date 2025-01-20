@interface DACRoleService
- (DACRoleService)init;
- (id)_createClientForConnection:(id)a3;
- (void)_configureServiceInterfacesOnConnection:(id)a3;
- (void)_lostClient:(id)a3;
- (void)coordinator:(id)a3 roleChanged:(id)a4;
- (void)requestLeaderRole:(id)a3;
- (void)subscribeWithLastLeaderAt:(id)a3;
@end

@implementation DACRoleService

- (DACRoleService)init
{
  uint64_t v3 = DACRoleServiceServiceName;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DACRoleServiceResetNotificationName));
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DACRoleService;
  v5 = -[DACService _initWithServiceName:entitlement:resetNotificationName:]( &v14,  "_initWithServiceName:entitlement:resetNotificationName:",  v3,  @"com.apple.private.DeviceActivityConductor.role",  v4);

  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    coordinators = v5->_coordinators;
    v5->_coordinators = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    roles = v5->_roles;
    v5->_roles = (NSMutableDictionary *)v8;

    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](v5, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005F90;
    block[3] = &unk_10001C3C0;
    v13 = v5;
    dispatch_async(v10, block);
  }

  return v5;
}

- (void)coordinator:(id)a3 roleChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006054;
  block[3] = &unk_10001C460;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)subscribeWithLastLeaderAt:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1000050FC();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[DACService _currentClient](self, "_currentClient"));
  id v9 = (void *)v8;
  if (v8)
  {
    objc_storeStrong((id *)(v8 + 24), v7);
    if (self) {
      coordinators = self->_coordinators;
    }
    else {
      coordinators = 0LL;
    }
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](coordinators, "objectForKey:", v7));
    if (v11)
    {
      id v12 = (id *)v11;
      sub_1000031A0(v11, v4);
      if (self)
      {
LABEL_6:
        roles = self->_roles;
LABEL_7:
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](roles, "objectForKey:", v7));
        if (v14) {
          sub_1000065E8(self, v9, v14);
        }

        goto LABEL_12;
      }
    }

    else
    {
      id v12 = sub_100002D3C((id *)objc_alloc(&OBJC_CLASS___DACRoleCoordinator), self, v4, v7);
      if (self) {
        v16 = self->_coordinators;
      }
      else {
        v16 = 0LL;
      }
      -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v12, v7);
      id v17 = sub_100014610(5);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134218498;
        v20 = self;
        __int16 v21 = 2048;
        v22 = v12;
        __int16 v23 = 2114;
        id v24 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%p created Coordinator %p with last leader %{public}@",  (uint8_t *)&v19,  0x20u);
      }

      if (self) {
        goto LABEL_6;
      }
    }

    roles = 0LL;
    goto LABEL_7;
  }

  id v15 = sub_100014610(5);
  id v12 = (id *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
  {
    int v19 = 134217984;
    v20 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "%p no client to subscribe to",  (uint8_t *)&v19,  0xCu);
  }

- (void)requestLeaderRole:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (!self) {
    goto LABEL_15;
  }
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[DACService _currentClient](self, "_currentClient"));
  uint64_t v8 = (void *)v7;
  if (!v7)
  {
    id v12 = sub_100014610(5);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v21 = 134217984;
      v22 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%p no current Role Coordinator, no client",  (uint8_t *)&v21,  0xCu);
    }

    goto LABEL_12;
  }

  id v9 = (os_log_s *)*(id *)(v7 + 24);
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_coordinators, "objectForKey:", v9));
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      goto LABEL_13;
    }

    id v18 = sub_100014610(5);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v21 = 134217984;
    v22 = self;
    id v15 = "%p no current Role Coordinator";
    v16 = v14;
    uint32_t v17 = 12;
    goto LABEL_20;
  }

  id v13 = sub_100014610(5);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v21 = 134218242;
    v22 = self;
    __int16 v23 = 2114;
    id v24 = v8;
    id v15 = "%p no current Role Coordinator, no subscription from %{public}@";
    v16 = v14;
    uint32_t v17 = 22;
LABEL_20:
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v21, v17);
  }

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DACRoleService;
  id v4 = a3;
  -[DACService _configureServiceInterfacesOnConnection:](&v10, "_configureServiceInterfacesOnConnection:", v4);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue", v10.receiver, v10.super_class));
  dispatch_assert_queue_V2(v5);

  id v6 = &OBJC_PROTOCOL___DACRoleServiceInterface;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](&OBJC_CLASS___NSXPCInterface, "interfaceWithProtocol:", v6));
  [v4 setExportedInterface:v7];
  [v4 setExportedObject:self];
  uint64_t v8 = &OBJC_PROTOCOL___DACRoleClientInterface;

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](&OBJC_CLASS___NSXPCInterface, "interfaceWithProtocol:", v8));
  [v4 setRemoteObjectInterface:v9];
}

- (id)_createClientForConnection:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = -[DACRoleServiceClient initWithConnection:]( objc_alloc(&OBJC_CLASS___DACRoleServiceClient),  "initWithConnection:",  v4);
  return v6;
}

- (void)_lostClient:(id)a3
{
  id v4 = (id *)a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___DACRoleService;
  -[DACService _lostClient:](&v24, "_lostClient:", v4);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = v4[3];
    if (v6)
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients", 0LL));
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v21;
        while (2)
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
            if (v12) {
              id v12 = (void *)v12[3];
            }
            id v13 = v12;
            unsigned __int8 v14 = [v6 isEqual:v13];

            if ((v14 & 1) != 0)
            {

              goto LABEL_19;
            }
          }

          id v9 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      id v15 = sub_100014610(5);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v26 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%p tearing down - no clients subscribed",  buf,  0xCu);
      }

      if (self)
      {
        uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_coordinators, "objectForKey:", v6));
        sub_100003140((uint64_t)v17);

        -[NSMutableDictionary removeObjectForKey:](self->_coordinators, "removeObjectForKey:", v6);
        roles = self->_roles;
      }

      else
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([0 objectForKey:v6]);
        sub_100003140((uint64_t)v19);

        [0 removeObjectForKey:v6];
        roles = 0LL;
      }

      -[NSMutableDictionary removeObjectForKey:](roles, "removeObjectForKey:", v6);
    }
  }

  else
  {
    id v6 = 0LL;
  }

- (void).cxx_destruct
{
}

@end