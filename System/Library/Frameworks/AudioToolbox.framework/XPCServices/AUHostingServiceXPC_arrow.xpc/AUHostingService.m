@interface AUHostingService
+ (BOOL)conformsToProtocol:(id)a3;
+ (BOOL)instancesRespondToSelector:(SEL)a3;
- (AUHostingService)initWithConnection:(id)a3;
- (id).cxx_construct;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)closeHost:(id)a3;
- (void)dealloc;
- (void)establishConnection:(id)a3;
- (void)loadAudioUnitInRemoteHost:(AudioComponentDescription *)a3 config:(id)a4 reply:(id)a5;
- (void)retrieveAudioUnitInstanceID:(id)a3;
@end

@implementation AUHostingService

- (AUHostingService)initWithConnection:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AUHostingService;
  v5 = -[AUHostingService init](&v19, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_connection, v4);
    do
      unsigned int v7 = __ldaxr((unsigned int *)&unk_100011900);
    while (__stlxr(v7 + 1, (unsigned int *)&unk_100011900));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener _UUID](&OBJC_CLASS___NSXPCListener, "_UUID"));
    v9 = v8;
    if (v8)
    {
      id v10 = objc_claimAutoreleasedReturnValue([v8 UUIDString]);
      sub_10000694C((std::string *)&v6->_instanceUUID, (char *)[v10 UTF8String]);
    }

    if (!v7)
    {
      unsigned __int8 v11 = atomic_load((unsigned __int8 *)&qword_100011950);
      if ((v11 & 1) == 0 && __cxa_guard_acquire(&qword_100011950))
      {
        sub_100006880("com.apple.coreaudio", "AUHostingService");
        __cxa_guard_release(&qword_100011950);
      }

      v12 = (os_log_s *) (id) qword_100011940;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        p_instanceUUID = (__long *)&v6->_instanceUUID;
        *(_DWORD *)buf = 136315650;
        v21 = "AUHostingService.mm";
        __int16 v22 = 1024;
        int v23 = 96;
        __int16 v24 = 2080;
        v25 = p_instanceUUID;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%25s:%-5d Launched new Audio Unit Hosting Service %s",  buf,  0x1Cu);
      }
    }

    unsigned __int8 v14 = atomic_load((unsigned __int8 *)&qword_100011950);
    if ((v14 & 1) == 0 && __cxa_guard_acquire(&qword_100011950))
    {
      sub_100006880("com.apple.coreaudio", "AUHostingService");
      __cxa_guard_release(&qword_100011950);
    }

    v15 = (os_log_s *) (id) qword_100011940;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (__long *)&v6->_instanceUUID;
      *(_DWORD *)buf = 136315650;
      v21 = "AUHostingService.mm";
      __int16 v22 = 1024;
      int v23 = 100;
      __int16 v24 = 2080;
      v25 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%25s:%-5d New connection with Audio Unit Hosting Service %s",  buf,  0x1Cu);
    }

    v17 = v6;
  }

  return v6;
}

- (void)establishConnection:(id)a3
{
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  host = self->_host;
  if (host)
  {
    if ((objc_opt_respondsToSelector(host, a3) & 1) != 0) {
      host = self->_host;
    }
    else {
      host = 0LL;
    }
  }

  return host;
}

- (void)retrieveAudioUnitInstanceID:(id)a3
{
  v6 = (void (**)(id, void, void *))a3;
  host = self->_host;
  if (host)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AURemoteHost audioUnitUUID](host, "audioUnitUUID"));
    v6[2](v6, 0LL, v5);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -10867LL,  0LL));
    ((void (**)(id, void *, void *))v6)[2](v6, v5, 0LL);
  }
}

- (void)loadAudioUnitInRemoteHost:(AudioComponentDescription *)a3 config:(id)a4 reply:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void))a5;
  UInt32 componentFlagsMask = a3->componentFlagsMask;
  *(_OWORD *)&self->_componentDescription.componentType = *(_OWORD *)&a3->componentType;
  self->_componentDescription.UInt32 componentFlagsMask = componentFlagsMask;
  unsigned __int8 v11 = objc_alloc(&OBJC_CLASS___NSUUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"audioUnitInstanceUUID"]);
  v13 = -[NSUUID initWithUUIDString:](v11, "initWithUUIDString:", v12);

  if (v13)
  {
    unsigned __int8 v14 = atomic_load((unsigned __int8 *)&qword_100011950);
    if ((v14 & 1) == 0 && __cxa_guard_acquire(&qword_100011950))
    {
      sub_100006880("com.apple.coreaudio", "AUHostingService");
      __cxa_guard_release(&qword_100011950);
    }

    v15 = (os_log_s *) (id) qword_100011940;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v39 = "AUHostingService.mm";
      __int16 v40 = 1024;
      int v41 = 148;
      __int16 v42 = 2112;
      v43 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%25s:%-5d Attempting to retrieve %@",  buf,  0x1Cu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[AUHostingServiceInstanceMap sharedInstance]( &OBJC_CLASS___AUHostingServiceInstanceMap,  "sharedInstance"));
    v17 = (AURemoteHost *)objc_claimAutoreleasedReturnValue([v16 retrieveInstance:v13]);
    host = self->_host;
    self->_host = v17;

    unsigned __int8 v19 = atomic_load((unsigned __int8 *)&qword_100011950);
    if ((v19 & 1) == 0 && __cxa_guard_acquire(&qword_100011950))
    {
      sub_100006880("com.apple.coreaudio", "AUHostingService");
      __cxa_guard_release(&qword_100011950);
    }

    v20 = (os_log_s *) (id) qword_100011940;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[AURemoteHost audioUnitUUID](self->_host, "audioUnitUUID"));
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
      int v23 = self->_host;
      *(_DWORD *)buf = 136315906;
      v39 = "AUHostingService.mm";
      __int16 v40 = 1024;
      int v41 = 150;
      __int16 v42 = 2112;
      v43 = v22;
      __int16 v44 = 2112;
      v45 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%25s:%-5d Connected to Audio Unit with UUID: %@ host instance: %@",  buf,  0x26u);
    }
  }

  else
  {
    __int16 v24 = objc_alloc(&OBJC_CLASS___AURemoteHost);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v26 = -[AURemoteHost initWithConnection:config:](v24, "initWithConnection:config:", WeakRetained, v8);
    v27 = self->_host;
    self->_host = v26;

    unsigned __int8 v28 = atomic_load((unsigned __int8 *)&qword_100011950);
    if ((v28 & 1) == 0 && __cxa_guard_acquire(&qword_100011950))
    {
      sub_100006880("com.apple.coreaudio", "AUHostingService");
      __cxa_guard_release(&qword_100011950);
    }

    v29 = (os_log_s *) (id) qword_100011940;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[AURemoteHost audioUnitUUID](self->_host, "audioUnitUUID"));
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 UUIDString]);
      v32 = self->_host;
      *(_DWORD *)buf = 136315906;
      v39 = "AUHostingService.mm";
      __int16 v40 = 1024;
      int v41 = 153;
      __int16 v42 = 2112;
      v43 = v31;
      __int16 v44 = 2112;
      v45 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%25s:%-5d Hosting Audio Unit with UUID: %@ host instance: %@",  buf,  0x26u);
    }

    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AUHostingServiceInstanceMap sharedInstance]( &OBJC_CLASS___AUHostingServiceInstanceMap,  "sharedInstance"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[AURemoteHost audioUnitUUID](self->_host, "audioUnitUUID"));
    -[os_log_s registerInstance:instance:](v20, "registerInstance:instance:", v33, self->_host);
  }

  if (self->_host)
  {
    CAFormatter::CAFormatter((CAFormatter *)&v37, &self->_componentDescription);
    unsigned __int8 v34 = atomic_load((unsigned __int8 *)&qword_100011950);
    if ((v34 & 1) == 0 && __cxa_guard_acquire(&qword_100011950))
    {
      sub_100006880("com.apple.coreaudio", "AUHostingService");
      __cxa_guard_release(&qword_100011950);
    }

    v35 = (os_log_s *) (id) qword_100011940;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v39 = "AUHostingService.mm";
      __int16 v40 = 1024;
      int v41 = 164;
      __int16 v42 = 2080;
      v43 = v37;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%25s:%-5d Hosting Audio Unit: %s", buf, 0x1Cu);
    }

    v9[2](v9, 0LL);
    if (v37) {
      free(v37);
    }
  }

  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -10875LL,  0LL));
    ((void (**)(id, void *))v9)[2](v9, v36);
  }
}

- (void)closeHost:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained auditToken];
  }
  else {
    memset(&task_info_out[1], 0, sizeof(audit_token_t));
  }
  task_info_outCnt.val[0] = 8;
  if (task_info(mach_task_self_, 0xFu, (task_info_t)task_info_out, task_info_outCnt.val))
  {
    uint64_t v18 = _os_assert_log(0LL);
    _os_crash(v18);
    __break(1u);
  }

  else
  {
    audit_token_t task_info_outCnt = task_info_out[1];
    pid_t v7 = audit_token_to_pid(&task_info_outCnt);
    audit_token_t atoken = task_info_out[0];
    if (v7 == audit_token_to_pid(&atoken))
    {
      audit_token_t v24 = task_info_out[1];
      int v8 = audit_token_to_pidversion(&v24);
      audit_token_t v23 = task_info_out[0];
      BOOL v9 = v8 == audit_token_to_pidversion(&v23);
    }

    else
    {
      BOOL v9 = 0;
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100006450;
    v19[3] = &unk_10000CAF0;
    v19[4] = self;
    BOOL v21 = v9;
    id v10 = v4;
    id v20 = v10;
    unsigned __int8 v11 = objc_retainBlock(v19);
    v12 = (uint64_t (**)(void, void))v11;
    do
    {
      unsigned int v13 = __ldaxr((unsigned int *)&unk_100011900);
      uint64_t v14 = v13 - 1;
    }

    while (__stlxr(v14, (unsigned int *)&unk_100011900));
    if (v9)
    {
      uint64_t v15 = ((uint64_t (*)(void *, BOOL))v11[2])(v11, v13 == 1);
      v16 = (void (**)(void))objc_claimAutoreleasedReturnValue(v15);
      v16[2]();
    }

    else
    {
      (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0LL, v14);
      uint64_t v17 = ((uint64_t (**)(void, BOOL))v12)[2](v12, (_DWORD)v14 == 0);
      v16 = (void (**)(void))objc_claimAutoreleasedReturnValue(v17);
      dispatch_async(&_dispatch_main_q, v16);
    }
  }

- (void)dealloc
{
  if (self->_host)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[AUHostingServiceInstanceMap sharedInstance]( &OBJC_CLASS___AUHostingServiceInstanceMap,  "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AURemoteHost audioUnitUUID](self->_host, "audioUnitUUID"));
    [v3 unregisterInstance:v4];

    host = self->_host;
    self->_host = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AUHostingService;
  -[AUHostingService dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0uLL;
  *((void *)self + 8) = 0LL;
  return self;
}

+ (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  else {
    unsigned __int8 v5 = objc_msgSend(objc_msgSend(a1, "superclass"), "conformsToProtocol:", v4);
  }

  return v5;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if ((+[AURemoteHost instancesRespondToSelector:]( &OBJC_CLASS___AURemoteHost,  "instancesRespondToSelector:") & 1) != 0) {
    return 1;
  }
  else {
    return objc_msgSend(objc_msgSend(a1, "superclass"), "instancesRespondToSelector:", a3);
  }
}

@end