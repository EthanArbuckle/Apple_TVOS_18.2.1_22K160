@interface RSDRemoteNCMHostDevice
- (BOOL)connectable;
- (BOOL)suspended;
- (RSDRemoteNCMHostDevice)initWithGeneratedName;
- (RSDRemoteNCMHostDevice)initWithInterface:(id)a3;
- (RSDRemoteNCMHostDevice)initWithUSBSerialNumber:(const __CFString *)a3;
- (uint64_t)tlsRequirement;
- (unsigned)type;
- (void)attach;
- (void)connected;
- (void)disconnect;
- (void)needsConnect;
- (void)setSuspended:(BOOL)a3;
- (void)setupConnectionTimer;
@end

@implementation RSDRemoteNCMHostDevice

- (unsigned)type
{
  return 8;
}

- (RSDRemoteNCMHostDevice)initWithGeneratedName
{
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v3;
  __int128 v8 = v3;
  int v4 = dword_1000429A8++;
  snprintf(__str, 0x20uLL, "ncm-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RSDRemoteNCMHostDevice;
  return -[RSDRemoteDevice initWithName:](&v6, "initWithName:", __str);
}

- (RSDRemoteNCMHostDevice)initWithUSBSerialNumber:(const __CFString *)a3
{
  int v4 = (id)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000430B0 objectForKeyedSubscript:v4]);
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = [v5 UTF8String];
    __int128 v8 = (os_log_s *)qword_1000430A0;
    if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Using previously allocated name %{public}s",  buf,  0xCu);
    }

    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___RSDRemoteNCMHostDevice;
    v9 = -[RSDRemoteDevice initWithName:](&v14, "initWithName:", v7);
  }

  else
  {
    v10 = (os_log_s *)qword_1000430A0;
    if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "New device attached, allocating name", buf, 2u);
    }

    v11 = -[RSDRemoteNCMHostDevice initWithGeneratedName](self, "initWithGeneratedName");
    v9 = v11;
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  -[RSDRemoteDevice device_name](v11, "device_name"),  4LL));
      [(id)qword_1000430B0 setObject:v12 forKeyedSubscript:v4];
    }
  }

  return v9;
}

- (RSDRemoteNCMHostDevice)initWithInterface:(id)a3
{
  id v4 = a3;
  CFTypeRef cf = 0LL;
  int v5 = sub_100011620((io_registry_entry_t)[v4 service], &cf);
  objc_super v6 = (os_log_s *)qword_1000430A0;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v11 = cf;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "USB Serial Number: %{public}@", buf, 0xCu);
    }

    id v7 = -[RSDRemoteNCMHostDevice initWithUSBSerialNumber:](self, "initWithUSBSerialNumber:", cf);
    CFRelease(cf);
    if (!v7) {
      goto LABEL_10;
    }
LABEL_9:
    -[RSDRemoteNCMDevice setInterface:](v7, "setInterface:", v4);
    v7->fd = -1;
    goto LABEL_10;
  }

  if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR)) {
    sub_100027B34(v6);
  }
  id v7 = -[RSDRemoteNCMHostDevice initWithGeneratedName](self, "initWithGeneratedName");
  if (v7) {
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (void)attach
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RSDRemoteNCMHostDevice;
  -[RSDRemoteDevice attach](&v5, "attach");
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  unsigned __int8 v4 = objc_msgSend(v3, "is_private");

  if ((v4 & 1) == 0) {
    -[RSDRemoteNCMHostDevice setupConnectionTimer](self, "setupConnectionTimer");
  }
}

- (void)setupConnectionTimer
{
  if (self->connection_timer) {
    sub_100027B74(&v7, v8);
  }
  __int128 v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100043098);
  connection_timer = self->connection_timer;
  self->connection_timer = v3;

  dispatch_source_set_timer((dispatch_source_t)self->connection_timer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  objc_super v5 = self->connection_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000105B4;
  handler[3] = &unk_10003CF40;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
  dispatch_resume((dispatch_object_t)self->connection_timer);
}

- (void)needsConnect
{
  __int128 v3 = (os_log_s *)qword_1000430A0;
  if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", buf, 0xCu);
  }

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

  if (v4)
  {
    objc_super v5 = (os_log_s *)qword_1000430A0;
    if (!os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    objc_super v6 = "%{public}@> already have a connection, skip";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    return;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  id v8 = [v7 state];

  if (v8 != (id)2)
  {
    objc_super v5 = (os_log_s *)qword_1000430A0;
    if (!os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    objc_super v6 = "%{public}@> NCM interface not ready";
    goto LABEL_17;
  }

  if (*(_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address")
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 1)
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 2)
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 3))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    unsigned __int8 v10 = objc_msgSend(v9, "is_private");

    if ((v10 & 1) == 0)
    {
      nw_endpoint_t bonjour_service = nw_endpoint_create_bonjour_service("ncm", "_remoted._tcp", "local.");
      -[RSDRemoteNCMDevice setEndpoint:](self, "setEndpoint:", bonjour_service);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice endpoint](self, "endpoint"));
      if (!v12) {
        sub_100027CEC(&v45, buf);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
      objc_super v14 = sub_10001E3A0((uint64_t)[v13 index], 2);
      v15 = (nw_parameters *)objc_claimAutoreleasedReturnValue(v14);

      if (v15)
      {
        id v16 = nw_parameters_copy_required_interface(v15);
        name = nw_interface_get_name(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
        int v19 = strncmp(name, (const char *)[v18 name], 0x10uLL);

        if (v19)
        {
          uint64_t v43 = 0LL;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          *(_OWORD *)buf = 0u;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            uint64_t v39 = 3LL;
          }
          else {
            uint64_t v39 = 2LL;
          }
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
          int v45 = 136315394;
          v46 = name;
          __int16 v47 = 2080;
          id v48 = [v40 name];
          uint64_t v41 = _os_log_send_and_compose_impl(v39, &v43, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);

          _os_crash_msg(v43, v41);
          __break(1u);
          return;
        }

        v20 = (nw_endpoint *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice endpoint](self, "endpoint"));
        nw_connection_t v21 = nw_connection_create(v20, v15);

        v22 = v21;
        if (!v22) {
          sub_100027D9C(&v45, buf);
        }
        v23 = v22;

        uint64_t v24 = qword_100043098;
        uint64_t failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v25);
        id v27 = (id)xpc_remote_connection_create_with_nw_connection(v23, v24, failsafe_version_flags, 2LL);
        if (!v27) {
          sub_100027E0C(&v45, buf);
        }
        v28 = v27;

        -[RSDRemoteDevice connect:](self, "connect:", v28);
        connection_timer = self->connection_timer;
        dispatch_time_t v30 = dispatch_time(0LL, 20000000000LL);
        dispatch_source_set_timer((dispatch_source_t)connection_timer, v30, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      }

      else
      {
        v35 = (os_log_s *)qword_1000430A0;
        if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_FAULT)) {
          sub_100027D5C(v35);
        }
      }

      return;
    }

    if (self->fd != -1)
    {
      objc_super v5 = (os_log_s *)qword_1000430A0;
      if (!os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      objc_super v6 = "%{public}@> already connecting, skip";
      goto LABEL_17;
    }

    v31 = -[RSDRemoteNCMDevice remote_address](self, "remote_address");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    uint64_t v33 = sub_100017464(&self->fd, (__n128 *)v31, 0xE59Fu, (int)[v32 index], (uint64_t)&xmmword_100030468);

    v34 = (os_log_s *)qword_1000430A0;
    if ((_DWORD)v33)
    {
      if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_ERROR)) {
        sub_100027C7C((uint64_t)self, v33, v34);
      }
      -[RSDRemoteDevice connect:](self, "connect:", 0LL);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%{public}@> network_connect_in6() completed successfully",  buf,  0xCu);
      }

      uint64_t fd = self->fd;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_100010C78;
      v42[3] = &unk_10003D208;
      v42[4] = self;
      -[RSDRemoteDevice pollConnect:onQueue:withLog:completion:]( self,  "pollConnect:onQueue:withLog:completion:",  fd,  qword_100043098,  qword_1000430A0,  v42);
    }
  }

  else
  {
    v37 = (os_log_s *)qword_1000430A0;
    if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%{public}@> no inet6 assigned, try again later",  buf,  0xCu);
    }

    dispatch_time_t v38 = dispatch_time(0LL, 200000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100010C70;
    block[3] = &unk_10003CF40;
    block[4] = self;
    dispatch_after(v38, (dispatch_queue_t)qword_100043098, block);
  }

- (void)disconnect
{
  __int128 v3 = (os_log_s *)qword_1000430A0;
  if (os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> disconnect", buf, 0xCu);
  }

  connection_timer = self->connection_timer;
  if (connection_timer)
  {
    dispatch_source_cancel((dispatch_source_t)connection_timer);
    objc_super v5 = self->connection_timer;
    self->connection_timer = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RSDRemoteNCMHostDevice;
  -[RSDRemoteDevice disconnect](&v6, "disconnect");
}

- (void)connected
{
  connection_timer = self->connection_timer;
  if (connection_timer) {
    dispatch_source_set_timer((dispatch_source_t)connection_timer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RSDRemoteNCMHostDevice;
  -[RSDRemoteNCMDevice connected](&v4, "connected");
}

- (BOOL)connectable
{
  if (self->_suspended) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RSDRemoteNCMHostDevice;
  return -[RSDRemoteDevice connectable](&v3, "connectable");
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = (os_log_s *)qword_1000430A0;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1000430A0, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        int v7 = 138543362;
        id v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> Suspending", (uint8_t *)&v7, 0xCu);
      }
    }

    else
    {
      if (v6)
      {
        int v7 = 138543362;
        id v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> Resuming", (uint8_t *)&v7, 0xCu);
      }

      -[RSDRemoteDevice drainPendedRequests](self, "drainPendedRequests");
    }

    self->_suspended = v3;
  }

- (BOOL)suspended
{
  return self->_suspended;
}

- (void).cxx_destruct
{
}

- (uint64_t)tlsRequirement
{
  id v0 = sub_10001E4D4();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  unint64_t v2 = sub_100013B5C(v1, @"rsd_ncm_tls_requirement", @"ncm-tls-requirement");

  if (v2 <= 1) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = v2;
  }
  id v4 = sub_10001E4D4();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = sub_100013AC8(v3);
    int v7 = (const char *)&unk_100037DBD;
    if (!v2) {
      int v7 = " by default";
    }
    int v9 = 136315394;
    unsigned __int8 v10 = v6;
    __int16 v11 = 2080;
    v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "TLS is %s for NCM peers%s",  (uint8_t *)&v9,  0x16u);
  }

  return v3;
}

@end