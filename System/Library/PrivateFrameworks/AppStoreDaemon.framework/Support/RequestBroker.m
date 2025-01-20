@interface RequestBroker
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (RequestBroker)init;
@end

@implementation RequestBroker

- (RequestBroker)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RequestBroker;
  v2 = -[RequestBroker init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    clients = v2->_clients;
    v2->_clients = v3;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)objc_opt_class(v2, v5);
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      id v7 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[%@]: Starting request broker",  buf,  0xCu);
    }

    v8 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.appstored.xpc.request");
    -[NSXPCListener setDelegate:](v8, "setDelegate:", v2);
    -[NSXPCListener resume](v8, "resume");
    objc_setProperty_atomic(v2, v9, v8, 16LL);
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v41 = a3;
  id v5 = a4;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v6 = [&off_10040DDF8 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v6)
  {
    uint64_t v42 = *(void *)v50;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v50 != v42) {
        objc_enumerationMutation(&off_10040DDF8);
      }
      v8 = *(void **)(*((void *)&v49 + 1) + 8 * v7);
      id v9 = v5;
      v10 = v8;
      uint64_t v11 = objc_opt_self(&OBJC_CLASS___RequestBroker);
      unsigned int v12 = [v9 processIdentifier];
      if (v5)
      {
        [v9 auditToken];
      }

      else
      {
        *(_OWORD *)location = 0u;
        __int128 v55 = 0u;
      }

      *(_OWORD *)token = *(_OWORD *)location;
      *(_OWORD *)&token[16] = v55;
      v13 = SecTaskCreateWithAuditToken(0LL, (audit_token_t *)token);
      v14 = v13;
      if (v13)
      {
        CFErrorRef error = 0LL;
        CFTypeRef v15 = SecTaskCopyValueForEntitlement(v13, v10, &error);
        if (error && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v25 = (void *)objc_opt_class(v11, v16);
          *(_DWORD *)token = 138413058;
          *(void *)&token[4] = v25;
          *(_WORD *)&token[12] = 2112;
          *(void *)&token[14] = v10;
          *(_WORD *)&token[22] = 1024;
          *(_DWORD *)&token[24] = v12;
          *(_WORD *)&token[28] = 2112;
          *(void *)&token[30] = error;
          id v26 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[%@]: Unable to get entitlements: %@ for pid: %i error: %@",  token,  0x26u);
        }

        if (v15)
        {
          CFTypeID TypeID = CFBooleanGetTypeID();
          BOOL v18 = TypeID == CFGetTypeID(v15) && CFBooleanGetValue((CFBooleanRef)v15) != 0;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (void *)objc_opt_class(v11, v22);
            *(_DWORD *)token = 138413058;
            *(void *)&token[4] = v23;
            *(_WORD *)&token[12] = 2112;
            *(void *)&token[14] = v10;
            *(_WORD *)&token[22] = 1024;
            *(_DWORD *)&token[24] = v12;
            *(_WORD *)&token[28] = 1024;
            *(_DWORD *)&token[30] = v18;
            id v24 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%@]: We have the entitlement: %@ for pid: %i result: %d",  token,  0x22u);
          }

          CFRelease(v15);
          CFRelease(v14);

          if (v18)
          {
            v30 = sub_10030B08C((id *)objc_alloc(&OBJC_CLASS___RequestBrokerClient), v9);
            v31 = self;
            objc_sync_enter(v31);
            -[NSMutableSet addObject:](v31->_clients, "addObject:", v30);
            objc_sync_exit(v31);

            [v9 setExportedObject:v30];
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[ASDRequestBroker interface](&OBJC_CLASS___ASDRequestBroker, "interface"));
            [v9 setExportedInterface:v32];

            objc_initWeak(location, v31);
            objc_initWeak((id *)&error, v30);
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472LL;
            v46[2] = sub_100246794;
            v46[3] = &unk_1003EE2A0;
            objc_copyWeak(&v47, location);
            objc_copyWeak(&v48, (id *)&error);
            [v9 setInvalidationHandler:v46];
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472LL;
            v43[2] = sub_1002468FC;
            v43[3] = &unk_1003EE2A0;
            objc_copyWeak(&v44, location);
            objc_copyWeak(&v45, (id *)&error);
            [v9 setInterruptionHandler:v43];
            [v9 resume];
            id v33 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v35 = (void *)objc_opt_class(v31, v34);
              *(_DWORD *)token = 138412546;
              *(void *)&token[4] = v35;
              *(_WORD *)&token[12] = 2112;
              *(void *)&token[14] = v30;
              id v36 = v35;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[%@]: Broker client connected: %@",  token,  0x16u);
            }

            objc_destroyWeak(&v45);
            objc_destroyWeak(&v44);
            objc_destroyWeak(&v48);
            objc_destroyWeak(&v47);
            objc_destroyWeak((id *)&error);
            objc_destroyWeak(location);

            BOOL v29 = 1;
            goto LABEL_32;
          }

          goto LABEL_24;
        }

        CFRelease(v14);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_opt_class(v11, v19);
        *(_DWORD *)token = 138412802;
        *(void *)&token[4] = v20;
        *(_WORD *)&token[12] = 2112;
        *(void *)&token[14] = v10;
        *(_WORD *)&token[22] = 1024;
        *(_DWORD *)&token[24] = v12;
        id v21 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[%@]: No task for entitlement: %@ pid: %i",  token,  0x1Cu);
      }

LABEL_24:
      if (v6 == (id)++v7)
      {
        id v6 = [&off_10040DDF8 countByEnumeratingWithState:&v49 objects:v56 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  unsigned int v27 = [v5 processIdentifier];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v38 = (void *)objc_opt_class(self, v28);
    *(_DWORD *)token = 138412546;
    *(void *)&token[4] = v38;
    *(_WORD *)&token[12] = 1024;
    *(_DWORD *)&token[14] = v27;
    id v39 = v38;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[%@]: Connection denied for pid: %i for non entitled client",  token,  0x12u);
  }

  BOOL v29 = 0;
LABEL_32:

  return v29;
}

- (void).cxx_destruct
{
}

@end