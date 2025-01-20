@interface RSDRemoteNCMDeviceDevice
- (BOOL)isTrusted;
- (RSDRemoteNCMDeviceDevice)initWithGeneratedName;
- (RSDRemoteNCMDeviceDevice)initWithInterface:(id)a3;
- (unsigned)type;
- (void)attach;
- (void)createBonjourListener;
- (void)createPortListener;
- (void)disconnect;
- (void)needsConnect;
@end

@implementation RSDRemoteNCMDeviceDevice

- (unsigned)type
{
  return 9;
}

- (BOOL)isTrusted
{
  if (self->_researchInfraEnforcementDisabled)
  {
    v3 = (os_log_s *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Treating ncm host as trusted on research VM",  buf,  0xCu);
    }

    return 1;
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___RSDRemoteNCMDeviceDevice;
    return -[RSDRemoteDevice isTrusted](&v5, "isTrusted");
  }

- (RSDRemoteNCMDeviceDevice)initWithGeneratedName
{
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v3;
  __int128 v8 = v3;
  int v4 = dword_1000429AC++;
  snprintf(__str, 0x20uLL, "ncmhost-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RSDRemoteNCMDeviceDevice;
  return -[RSDRemoteDevice initWithName:](&v6, "initWithName:", __str);
}

- (RSDRemoteNCMDeviceDevice)initWithInterface:(id)a3
{
  id v4 = a3;
  objc_super v5 = -[RSDRemoteNCMDeviceDevice initWithGeneratedName](self, "initWithGeneratedName");
  objc_super v6 = v5;
  if (v5)
  {
    -[RSDRemoteNCMDevice setInterface:](v5, "setInterface:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)attach
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RSDRemoteNCMDeviceDevice;
  -[RSDRemoteDevice attach](&v5, "attach");
  if (sub_10001E594()) {
    -[RSDRemoteNCMDeviceDevice createBonjourListener](self, "createBonjourListener");
  }
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  unsigned int v4 = objc_msgSend(v3, "is_private");

  if (v4) {
    -[RSDRemoteNCMDeviceDevice createPortListener](self, "createPortListener");
  }
}

- (void)disconnect
{
  __int128 v3 = (os_log_s *)qword_1000430D8;
  if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> disconnect", buf, 0xCu);
  }

  if (self->bonjour_listener)
  {
    unsigned int v4 = (os_log_s *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@> cancelling bonjour listener",  buf,  0xCu);
    }

    nw_listener_cancel(self->bonjour_listener);
  }

  if (self->listener_source)
  {
    objc_super v5 = (os_log_s *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@> cancelling port listener",  buf,  0xCu);
    }

    dispatch_source_cancel((dispatch_source_t)self->listener_source);
  }

  if (self->reestablished_connection) {
    xpc_remote_connection_cancel();
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RSDRemoteNCMDeviceDevice;
  -[RSDRemoteDevice disconnect](&v6, "disconnect");
}

- (void)needsConnect
{
  __int128 v3 = (os_log_s *)qword_1000430D8;
  if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", (uint8_t *)&v9, 0xCu);
  }

  self->_researchInfraEnforcementDisabled = sub_100002BE4((void *)qword_1000430D8);
  if (self->reestablished_connection)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));

    objc_super v5 = (os_log_s *)qword_1000430D8;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        int v9 = 138543362;
        v10 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@> wait for current connection to invalidate before applying reestablished connection",  (uint8_t *)&v9,  0xCu);
      }
    }

    else
    {
      if (v6)
      {
        int v9 = 138543362;
        v10 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@> Applying re-established connection",  (uint8_t *)&v9,  0xCu);
      }

      reestablished_connection = self->reestablished_connection;
      self->reestablished_connection = 0LL;
      __int128 v8 = reestablished_connection;

      -[RSDRemoteDevice connect:](self, "connect:", v8);
    }
  }

- (void)createBonjourListener
{
  __int128 v3 = (os_log_s *)qword_1000430D8;
  if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 138543362;
    *(void *)((char *)buf + 4) = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@> create bonjour listener start",  (uint8_t *)buf,  0xCu);
  }

  if (*(_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address")
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 1)
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 2)
    || *((_DWORD *)-[RSDRemoteNCMDevice local_address](self, "local_address") + 3))
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    objc_super v5 = sub_10001E3A0((uint64_t)[v4 index], 1);
    BOOL v6 = (nw_parameters *)objc_claimAutoreleasedReturnValue(v5);

    if (!v6)
    {
      v20 = (os_log_s *)qword_1000430D8;
      if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_FAULT)) {
        sub_100027D5C(v20);
      }
      goto LABEL_16;
    }

    v7 = nw_parameters_copy_required_interface(v6);
    name = nw_interface_get_name(v7);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    int v10 = strncmp(name, (const char *)[v9 name], 0x10uLL);

    if (!v10)
    {
      v11 = nw_listener_create(v6);
      bonjour_listener = self->bonjour_listener;
      self->bonjour_listener = v11;

      v13 = self->bonjour_listener;
      if (!v13) {
        sub_100028688(&v31, buf);
      }

      v14 = nw_advertise_descriptor_create_bonjour_service("ncm", "_remoted._tcp", "local.");
      if (!v14) {
        sub_1000286F8(&v31, buf);
      }
      v15 = v14;

      nw_advertise_descriptor_set_no_auto_rename(v15, 1);
      nw_listener_set_advertise_descriptor(self->bonjour_listener, v15);
      v16 = self->bonjour_listener;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100012D74;
      handler[3] = &unk_10003CEA0;
      handler[4] = self;
      nw_listener_set_new_connection_handler(v16, handler);
      v17 = self->bonjour_listener;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100012F18;
      v27[3] = &unk_10003D2D0;
      v27[4] = self;
      nw_listener_set_state_changed_handler(v17, v27);
      v18 = self->bonjour_listener;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100013274;
      v26[3] = &unk_10003D2F8;
      v26[4] = self;
      nw_listener_set_advertised_endpoint_changed_handler(v18, v26);
      nw_listener_set_queue(self->bonjour_listener, (dispatch_queue_t)qword_1000430D0);
      nw_listener_start(self->bonjour_listener);
      v19 = (os_log_s *)qword_1000430D8;
      if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 138543362;
        *(void *)((char *)buf + 4) = self;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@> create bonjour listener done",  (uint8_t *)buf,  0xCu);
      }

LABEL_16:
      return;
    }

    uint64_t v29 = 0LL;
    memset(buf, 0, sizeof(buf));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v23 = 3LL;
    }
    else {
      uint64_t v23 = 2LL;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    int v31 = 136315394;
    v32 = name;
    __int16 v33 = 2080;
    id v34 = [v24 name];
    uint64_t v25 = _os_log_send_and_compose_impl(v23, &v29, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);

    _os_crash_msg(v29, v25);
    __break(1u);
  }

  else
  {
    v21 = (os_log_s *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = self;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@> no inet6 assigned, try again later",  (uint8_t *)buf,  0xCu);
    }

    dispatch_time_t v22 = dispatch_time(0LL, 200000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100012D38;
    block[3] = &unk_10003CF40;
    block[4] = self;
    dispatch_after(v22, (dispatch_queue_t)qword_1000430D0, block);
  }

- (void)createPortListener
{
  __int128 v3 = (os_log_s *)qword_1000430D8;
  if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    dispatch_time_t v22 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@> create port listener start",  buf,  0xCu);
  }

  __int16 v20 = -6753;
  int v19 = -1;
  unsigned int v4 = -[RSDRemoteNCMDevice local_address](self, "local_address");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  int v6 = sub_100017998(&v19, (__n128 *)v4, &v20, (int)[v5 index], (uint64_t)&unk_10003047C);

  if (v6)
  {
    v7 = (os_log_s *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_ERROR)) {
      sub_100028850((uint64_t)self, v6, v7);
    }
    dispatch_time_t v8 = dispatch_time(0LL, 200000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000135DC;
    block[3] = &unk_10003CF40;
    block[4] = self;
    dispatch_after(v8, (dispatch_queue_t)qword_1000430D0, block);
  }

  else
  {
    int v9 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  v19,  0LL,  (dispatch_queue_t)qword_1000430D0);
    listener_source = self->listener_source;
    self->listener_source = v9;

    v11 = self->listener_source;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100013618;
    handler[3] = &unk_10003D320;
    int v17 = v19;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v11, handler);
    v12 = self->listener_source;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100013810;
    v14[3] = &unk_10003D340;
    int v15 = v19;
    dispatch_source_set_mandatory_cancel_handler(v12, v14);
    dispatch_activate((dispatch_object_t)self->listener_source);
    v13 = (os_log_s *)qword_1000430D8;
    if (os_log_type_enabled((os_log_t)qword_1000430D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      dispatch_time_t v22 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@> create port listener done",  buf,  0xCu);
    }
  }

- (void).cxx_destruct
{
}

@end