@interface RSDRemoteService
- (OS_xpc_object)properties;
- (OS_xpc_object)service_listener;
- (RSDRemoteDevice)device;
- (RSDRemoteService)initWithName:(const char *)a3 description:(id)a4;
- (char)entitlement;
- (char)name;
- (char)port;
- (id)copyClientDescription;
- (id)description;
- (int)getSocketWithTcpOption:(id *)a3;
- (void)cancel;
- (void)dealloc;
- (void)setDevice:(id)a3;
- (void)setEntitlement:(char *)a3;
- (void)setName:(char *)a3;
- (void)setPort:(char *)a3;
- (void)setProperties:(id)a3;
- (void)setService_listener:(id)a3;
- (void)updateWithDescription:(id)a3;
@end

@implementation RSDRemoteService

- (RSDRemoteService)initWithName:(const char *)a3 description:(id)a4
{
  id v6 = a4;
  v7 = -[RSDRemoteService init](self, "init");
  if (v7)
  {
    -[RSDRemoteService setName:](v7, "setName:", strdup(a3));
    xpc_object_t value = xpc_dictionary_get_value(v6, "Port");
    v9 = (void *)objc_claimAutoreleasedReturnValue(value);
    v10 = v9;
    if (v9)
    {
      if (xpc_get_type(v9) != (xpc_type_t)&_xpc_type_string)
      {
        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
          sub_100025D00();
        }
        v11 = 0LL;
        goto LABEL_25;
      }

      string_ptr = xpc_string_get_string_ptr(v10);
      -[RSDRemoteService setPort:](v7, "setPort:", strdup(string_ptr));
    }

    xpc_object_t v13 = xpc_dictionary_get_value(v6, "EntitlementOverride");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    if (v14 && xpc_get_type(v14) == (xpc_type_t)&_xpc_type_string)
    {
      v19 = xpc_string_get_string_ptr(v15);
      -[RSDRemoteService setEntitlement:](v7, "setEntitlement:", strdup(v19));
    }

    else
    {
      xpc_object_t v16 = xpc_dictionary_get_value(v6, "Entitlement");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = v17;
      if (!v17 || xpc_get_type(v17) != (xpc_type_t)&_xpc_type_string)
      {
        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
          sub_100025C74();
        }
LABEL_21:
        v11 = 0LL;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }

      v20 = xpc_string_get_string_ptr(v18);
      -[RSDRemoteService setEntitlement:](v7, "setEntitlement:", strdup(v20));
    }

    xpc_object_t v21 = xpc_dictionary_get_value(v6, "Properties");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v18 = v22;
    if (v22)
    {
      if (xpc_get_type(v22) != (xpc_type_t)&_xpc_type_dictionary)
      {
        if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
          sub_100025CD4();
        }
        goto LABEL_21;
      }

      -[RSDRemoteService setProperties:](v7, "setProperties:", v18);
    }

    v11 = v7;
    goto LABEL_24;
  }

  v11 = 0LL;
LABEL_26:

  return v11;
}

- (void)updateWithDescription:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "Port");
  v5 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v6 = v5;
  if (v5)
  {
    if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_string)
    {
      free(-[RSDRemoteService port](self, "port"));
      string_ptr = xpc_string_get_string_ptr(v6);
      -[RSDRemoteService setPort:](self, "setPort:", strdup(string_ptr));
    }

    else if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
    {
      sub_100025D00();
    }
  }
}

- (void)cancel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteService service_listener](self, "service_listener"));

  if (v3)
  {
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RSDRemoteService service_listener](self, "service_listener"));
    xpc_connection_cancel(v4);

    -[RSDRemoteService setService_listener:](self, "setService_listener:", 0LL);
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RSDRemoteService;
  -[RSDRemoteService dealloc](&v3, "dealloc");
}

- (int)getSocketWithTcpOption:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteService device](self, "device"));
  unsigned int v6 = [v5 state];

  if (v6 == 5) {
    sub_100025D2C(&v10, v11);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteService device](self, "device"));
  int v8 = objc_msgSend(v7, "connectToService:withTcpOption:", -[RSDRemoteService port](self, "port"), a3);

  return v8;
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteService device](self, "device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%s/%s",  objc_msgSend(v3, "device_name"),  -[RSDRemoteService name](self, "name")));

  return v4;
}

- (char)name
{
  return self->_name;
}

- (void)setName:(char *)a3
{
  self->_name = a3;
}

- (char)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(char *)a3
{
  self->_entitlement = a3;
}

- (char)port
{
  return self->_port;
}

- (void)setPort:(char *)a3
{
  self->_port = a3;
}

- (OS_xpc_object)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (RSDRemoteDevice)device
{
  return (RSDRemoteDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (void)setDevice:(id)a3
{
}

- (OS_xpc_object)service_listener
{
  return self->_service_listener;
}

- (void)setService_listener:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)copyClientDescription
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v3, "name", -[RSDRemoteService name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteService properties](self, "properties"));

  if (v4) {
    xpc_object_t v5 = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[RSDRemoteService properties](self, "properties"));
  }
  else {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  unsigned int v6 = v5;
  xpc_dictionary_set_value(v3, "properties", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteService service_listener](self, "service_listener"));
  if (!v7)
  {
    int v8 = (void *)qword_100043198;
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      *(_DWORD *)buf = 136446210;
      v17 = -[RSDRemoteService name](self, "name");
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Creating service listener for \"%{public}s\"",  buf,  0xCu);
    }

    xpc_connection_t v10 = xpc_connection_create(0LL, (dispatch_queue_t)qword_1000431A0);
    -[RSDRemoteService setService_listener:](self, "setService_listener:", v10);

    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RSDRemoteService service_listener](self, "service_listener"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100018D1C;
    handler[3] = &unk_10003CDB8;
    handler[4] = self;
    xpc_connection_set_event_handler(v11, handler);

    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RSDRemoteService service_listener](self, "service_listener"));
    xpc_connection_activate(v12);
  }

  xpc_object_t v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[RSDRemoteService service_listener](self, "service_listener"));
  xpc_dictionary_set_connection(v3, "endpoint", v13);

  return v3;
}

@end