@interface WatchedServiceInfo
+ (int)processWatchCommand:(id)a3;
- (BOOL)hasHeartbeatRef:(unint64_t)a3 pid:(int)a4;
- (NSString)descriptionOverride;
- (NSString)hostClient;
- (NSString)hostID;
- (NSString)peerName;
- (NSString)serviceName;
- (NSUUID)serviceInstanceID;
- (OS_dispatch_source)procExitSource;
- (WatchedServiceInfo)initWithWatchCommand:(id)a3;
- (double)serviceStartTime;
- (id)description;
- (int)ourFD;
- (int)theirPID;
- (unint64_t)heartbeatRef;
- (void)dealloc;
- (void)invalidate;
- (void)logService:(const char *)a3;
- (void)setDescriptionOverride:(id)a3;
- (void)setHeartbeatRef:(unint64_t)a3;
- (void)setHostClient:(id)a3;
- (void)setHostID:(id)a3;
- (void)setOurFD:(int)a3;
- (void)setPeerName:(id)a3;
- (void)setProcExitSource:(id)a3;
- (void)setServiceInstanceID:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceStartTime:(double)a3;
- (void)setTheirPID:(int)a3;
@end

@implementation WatchedServiceInfo

+ (int)processWatchCommand:(id)a3
{
  id v3 = a3;
  v4 = -[WatchedServiceInfo initWithWatchCommand:]( objc_alloc(&OBJC_CLASS___WatchedServiceInfo),  "initWithWatchCommand:",  v3);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      v10 = "Failed to allocate service.";
      v11 = (uint8_t *)&v14;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }

- (WatchedServiceInfo)initWithWatchCommand:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___WatchedServiceInfo;
  v5 = -[WatchedServiceInfo init](&v45, "init");
  if (!v5) {
    goto LABEL_50;
  }
  bzero(buffer, 0x401uLL);
  objc_initWeak(&location, v5);
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  v7 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v6;

  if (!*((void *)v5 + 4))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v20 = "Failed to create UUID.";
LABEL_21:
    uint32_t v21 = 2;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
    goto LABEL_23;
  }

  double v8 = TMGetKernelMonotonicClock();
  *((double *)v5 + 3) = v8;
  if (v8 <= 0.0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v20 = "Failed to query monotonic clock time.";
    goto LABEL_21;
  }

  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  v5[3] = xpc_connection_get_pid(v10);

  if (!v5[3])
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v20 = "Failed to query remote PID.";
    goto LABEL_21;
  }

  string = xpc_dictionary_get_string(v4, "HB_PARAM_HOSTID");
  if (!string)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    unsigned int v23 = v5[3];
    *(_DWORD *)buf = 67109120;
    LODWORD(v47) = v23;
    v20 = "Failed to query HOST ID from client pid %d";
    goto LABEL_31;
  }

  v12 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  string,  4LL);
  __int16 v13 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v12;

  if (!*((void *)v5 + 5))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136446210;
    v47 = string;
    v20 = "Failed to create string for %{public}s.";
    goto LABEL_28;
  }

  *((void *)v5 + 2) = mach_absolute_time();
  int v14 = xpc_dictionary_dup_fd(v4, "HB_PARAM_FD");
  v5[2] = v14;
  if (!v14)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    unsigned int v24 = v5[3];
    *(_DWORD *)buf = 67109120;
    LODWORD(v47) = v24;
    v20 = "Failed to retrieve valid FD from client pid %d.";
LABEL_31:
    uint32_t v21 = 8;
    goto LABEL_22;
  }

  if (!sub_100001CC8(v14))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v20 = "Failed setting _ourFD options";
    goto LABEL_21;
  }

  id v15 = sub_100005218(v5[2]);
  uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v16;

  if (!*((void *)v5 + 7))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v20 = "Failed to get _peerName from socket.";
    goto LABEL_21;
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "HB_PARAM_THEIRFD");
  if (!(_DWORD)uint64 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unknown client FD.",  buf,  2u);
  }

  if (proc_pidinfo(v5[3], 11, 1uLL, buffer, 1025))
  {
    v19 = "Unknown process";
  }

  else
  {
    v19 = buffer;
    v25 = rindex(buffer, 47);
    if (v25) {
      v19 = v25 + 1;
    }
  }

  v26 = xpc_dictionary_get_string(v4, "HB_PARAM_CLIENTNAME");
  if (v26) {
    v27 = v26;
  }
  else {
    v27 = "Unknown client";
  }
  v28 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v27);
  v29 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v28;

  if (!*((void *)v5 + 6))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136446210;
    v47 = v27;
    v20 = "Failed to create string for %{public}s.";
    goto LABEL_28;
  }

  v30 = xpc_dictionary_get_string(v4, "HB_PARAM_HOSTNAME");
  if (v30) {
    v31 = v30;
  }
  else {
    v31 = "Unknown host";
  }
  v32 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v19);
  v33 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v32;

  if (!*((void *)v5 + 8))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136446210;
    v47 = v19;
    v20 = "Failed to create string for %{public}s.";
LABEL_28:
    uint32_t v21 = 12;
    goto LABEL_22;
  }

  v34 = objc_alloc(&OBJC_CLASS___NSString);
  v35 = (objc_class *)objc_opt_class(v5);
  v36 = -[NSString initWithFormat:]( v34,  "initWithFormat:",  @"<%s: %p> [client=%@ '%s' (%@ %@)] [fd=%d] [pid=%d (%@ fd=%d)] [hb=%lld]",  class_getName(v35),  v5,  *((void *)v5 + 6),  v31,  *((void *)v5 + 5),  *((void *)v5 + 7),  v5[2],  v5[3],  *((void *)v5 + 8),  uint64,  *((void *)v5 + 2));
  v37 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v36;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100008134((uint64_t)v5);
  }
  dispatch_source_t v38 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_proc,  (int)v5[3],  0x80000000uLL,  (dispatch_queue_t)qword_100010C08);
  v39 = (void *)*((void *)v5 + 10);
  *((void *)v5 + 10) = v38;

  v40 = (dispatch_source_s *)*((void *)v5 + 10);
  if (v40)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100006498;
    handler[3] = &unk_10000C6D0;
    objc_copyWeak(&v43, &location);
    dispatch_source_set_event_handler(v40, handler);
    dispatch_resume(*((dispatch_object_t *)v5 + 10));
    +[HostWatcher addService:forHostID:](&OBJC_CLASS___HostWatcher, "addService:forHostID:", v5, *((void *)v5 + 5));
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
LABEL_50:
    v22 = v5;
    goto LABEL_51;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v20 = "Failed to create dispatch source.";
    goto LABEL_21;
  }

- (void)dealloc
{
  int ourFD = self->_ourFD;
  if (ourFD != -1)
  {
    shutdown(ourFD, 2);
    close(self->_ourFD);
    self->_int ourFD = -1;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WatchedServiceInfo;
  -[WatchedServiceInfo dealloc](&v4, "dealloc");
}

- (void)invalidate
{
  id v3 = (dispatch_queue_s *)qword_100010C08;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000065EC;
  v4[3] = &unk_10000C6D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[WatchedServiceInfo descriptionOverride](self, "descriptionOverride"));

  if (v3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[WatchedServiceInfo descriptionOverride](self, "descriptionOverride"));
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___WatchedServiceInfo;
    id v5 = -[WatchedServiceInfo description](&v7, "description");
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  return v4;
}

- (void)logService:(const char *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    uint64_t v6 = a3;
    __int16 v7 = 2114;
    double v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%{public}s: %{public}@",  (uint8_t *)&v5,  0x16u);
  }

- (BOOL)hasHeartbeatRef:(unint64_t)a3 pid:(int)a4
{
  return -[WatchedServiceInfo heartbeatRef](self, "heartbeatRef") == a3
      && -[WatchedServiceInfo theirPID](self, "theirPID") == a4;
}

- (unint64_t)heartbeatRef
{
  return self->_heartbeatRef;
}

- (void)setHeartbeatRef:(unint64_t)a3
{
  self->_heartbeatRef = a3;
}

- (double)serviceStartTime
{
  return self->_serviceStartTime;
}

- (void)setServiceStartTime:(double)a3
{
  self->_serviceStartTime = a3;
}

- (NSUUID)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (void)setServiceInstanceID:(id)a3
{
}

- (int)ourFD
{
  return self->_ourFD;
}

- (void)setOurFD:(int)a3
{
  self->_int ourFD = a3;
}

- (int)theirPID
{
  return self->_theirPID;
}

- (void)setTheirPID:(int)a3
{
  self->_theirPID = a3;
}

- (NSString)hostID
{
  return self->_hostID;
}

- (void)setHostID:(id)a3
{
}

- (NSString)hostClient
{
  return self->_hostClient;
}

- (void)setHostClient:(id)a3
{
}

- (NSString)peerName
{
  return self->_peerName;
}

- (void)setPeerName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)descriptionOverride
{
  return self->_descriptionOverride;
}

- (void)setDescriptionOverride:(id)a3
{
}

- (OS_dispatch_source)procExitSource
{
  return self->_procExitSource;
}

- (void)setProcExitSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end