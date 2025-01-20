@interface RSDListener
- (RSDListener)initWithInterface:(id)a3 targetQueue:(id)a4;
- (RSDNetworkInterface)interface;
- (int)listenOnBonjourName:(const char *)a3 type:(const char *)a4 domain:(const char *)a5 configureTLS:(id)a6 connectionHandler:(id)a7;
- (int)listenOnPort:(unsigned __int16)a3 connectionHandler:(id)a4;
- (void)cancel;
@end

@implementation RSDListener

- (RSDListener)initWithInterface:(id)a3 targetQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RSDListener;
  v9 = -[RSDListener init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_interface, a3);
    objc_storeStrong((id *)&v10->queue, a4);
    v10->canceled = 0;
    v11 = v10;
  }

  return v10;
}

- (int)listenOnPort:(unsigned __int16)a3 connectionHandler:(id)a4
{
  unsigned __int16 v23 = a3;
  id v5 = a4;
  if (self->listener_source) {
    sub_10002975C(&v22, handle);
  }
  handle[0] = -1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDListener interface](self, "interface"));
  id v7 = (__n128 *)objc_msgSend(v6, "local_address");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDListener interface](self, "interface"));
  int v9 = sub_100017998(handle, v7, &v23, (int)[v8 index], (uint64_t)&unk_10003047C);

  if (v9)
  {
    id v10 = sub_10001D718();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002B2E0(v9, v11);
    }
  }

  else
  {
    v12 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  handle[0],  0LL,  (dispatch_queue_t)self->queue);
    listener_source = self->listener_source;
    self->listener_source = v12;

    v14 = self->listener_source;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10001D758;
    handler[3] = &unk_10003D670;
    v20 = (os_log_s *)v5;
    int v21 = handle[0];
    dispatch_source_set_event_handler((dispatch_source_t)v14, handler);
    v15 = self->listener_source;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10001D76C;
    v17[3] = &unk_10003D340;
    int v18 = handle[0];
    dispatch_source_set_mandatory_cancel_handler(v15, v17);
    dispatch_activate((dispatch_object_t)self->listener_source);
    v11 = v20;
  }

  return v9;
}

- (int)listenOnBonjourName:(const char *)a3 type:(const char *)a4 domain:(const char *)a5 configureTLS:(id)a6 connectionHandler:(id)a7
{
  id v12 = a6;
  nw_listener_new_connection_handler_t handler = a7;
  if (self->bonjour_listener) {
    sub_10002B500(&v55, buf);
  }
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[RSDListener interface](self, "interface"));
  id v14 = [v13 index];
  id v15 = v12;
  nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp(v15, _nw_parameters_configure_protocol_default_configuration);
  if (!(_DWORD)v14) {
    sub_10002B350(&v55, buf);
  }
  v17 = secure_tcp;
  int v18 = a3;
  v19 = a4;
  v20 = a5;
  int v21 = (nw_interface *)nw_interface_create_with_index(v14);
  if (v21)
  {
    nw_parameters_require_interface(v17, v21);
    nw_parameters_set_local_only(v17, 1);
    nw_parameters_set_required_address_family(v17, 30LL);
    nw_parameters_set_required_interface_type(v17, nw_interface_type_wired);
    nw_parameters_set_no_fallback(v17, 1LL);
    nw_parameters_set_indefinite(v17, 0LL);
    xpc_remote_connection_setup_nw_parameters(v17, 1LL);
    uint64_t v22 = v17;
  }

  else
  {
    id v23 = sub_10001D718();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002B4C4(v24);
    }

    uint64_t v22 = 0LL;
  }

  if (!v22)
  {
    id v41 = sub_10001D718();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_10002B3B8(v25);
    }
    int v40 = 6;
    v36 = handler;
    goto LABEL_18;
  }

  v25 = nw_parameters_copy_required_interface(v22);
  name = nw_interface_get_name(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RSDListener interface](self, "interface"));
  int v28 = strncmp(name, (const char *)[v27 name], 0x10uLL);

  if (!v28)
  {
    v29 = nw_listener_create(v22);
    bonjour_listener = self->bonjour_listener;
    self->bonjour_listener = v29;

    v31 = self->bonjour_listener;
    if (!v31) {
      sub_10002B3F4(&v55, buf);
    }
    v32 = v20;

    v33 = v19;
    v34 = nw_advertise_descriptor_create_bonjour_service(v18, v19, v32);
    if (!v34) {
      sub_10002B45C(&v55, buf);
    }
    v35 = v34;

    nw_advertise_descriptor_set_no_auto_rename(v35, 1);
    nw_listener_set_advertise_descriptor(self->bonjour_listener, v35);
    v36 = handler;
    nw_listener_set_new_connection_handler(self->bonjour_listener, handler);
    v37 = self->bonjour_listener;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10001DBC8;
    v47[3] = &unk_10003D6C0;
    v47[4] = self;
    v50 = v18;
    v51 = v33;
    v52 = v32;
    id v48 = v15;
    id v49 = handler;
    int v53 = -1;
    nw_listener_set_state_changed_handler(v37, v47);
    nw_listener_set_advertised_endpoint_changed_handler(self->bonjour_listener, &stru_10003D700);
    nw_listener_set_queue(self->bonjour_listener, (dispatch_queue_t)self->queue);
    nw_listener_start(self->bonjour_listener);
    id v38 = sub_10001D718();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "create bonjour listener done", buf, 2u);
    }

    int v40 = 0;
LABEL_18:

    return v40;
  }

  uint64_t v54 = 0LL;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  *(_OWORD *)buf = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v43 = 3LL;
  }
  else {
    uint64_t v43 = 2LL;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RSDListener interface](self, "interface"));
  int v55 = 136315394;
  v56 = name;
  __int16 v57 = 2080;
  id v58 = [v44 name];
  uint64_t v45 = _os_log_send_and_compose_impl(v43, &v54, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);

  int result = _os_crash_msg(v54, v45);
  __break(1u);
  return result;
}

- (void)cancel
{
  listener_source = self->listener_source;
  if (listener_source)
  {
    dispatch_source_cancel((dispatch_source_t)listener_source);
    v4 = self->listener_source;
    self->listener_source = 0LL;
  }

  bonjour_listener = self->bonjour_listener;
  if (bonjour_listener)
  {
    nw_listener_cancel(bonjour_listener);
    v6 = self->bonjour_listener;
    self->bonjour_listener = 0LL;
  }

  interface = self->_interface;
  self->_interface = 0LL;

  self->canceled = 1;
}

- (RSDNetworkInterface)interface
{
  return self->_interface;
}

- (void).cxx_destruct
{
}

@end