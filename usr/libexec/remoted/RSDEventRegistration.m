@interface RSDEventRegistration
- (BOOL)dontRestartBrowse;
- (OS_remote_device_browser)browser;
- (RSDEventRegistration)initWithToken:(unint64_t)a3 name:(char *)a4;
- (char)name;
- (unint64_t)token;
- (void)cancelBrowsing;
- (void)dealloc;
- (void)fire:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setDontRestartBrowse:(BOOL)a3;
- (void)setName:(char *)a3;
- (void)setToken:(unint64_t)a3;
- (void)startBrowsing:(id)a3;
@end

@implementation RSDEventRegistration

- (RSDEventRegistration)initWithToken:(unint64_t)a3 name:(char *)a4
{
  v6 = -[RSDEventRegistration init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[RSDEventRegistration setToken:](v6, "setToken:", a3);
    -[RSDEventRegistration setName:](v7, "setName:", strdup(a4));
    v8 = v7;
  }

  return v7;
}

- (void)startBrowsing:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDEventRegistration browser](self, "browser"));

  if (v5) {
    sub_100023C50(&v15, v16);
  }
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_1000024D4;
  v12 = &unk_10003CCD0;
  v13 = self;
  id v14 = v4;
  id v6 = v4;
  v7 = objc_retainBlock(&v9);
  started = (void *)remote_device_start_browsing_matching(v6, qword_100042FF8, v7);
  -[RSDEventRegistration setBrowser:](self, "setBrowser:", started, v9, v10, v11, v12, v13);
}

- (void)cancelBrowsing
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDEventRegistration browser](self, "browser"));

  if (!v3) {
    sub_100023CD4(&v5, v6);
  }
  -[RSDEventRegistration setDontRestartBrowse:](self, "setDontRestartBrowse:", 1LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[RSDEventRegistration browser](self, "browser"));
  remote_device_browser_cancel();
}

- (void)fire:(id)a3
{
  xpc_object_t v4 = xpc_uuid_create(uuid);
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_value(v5, "UUID", v4);
  if (os_log_type_enabled((os_log_t)qword_100043000, OS_LOG_TYPE_INFO))
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v6;
    *(_OWORD *)&out[16] = v6;
    uuid_unparse(uuid, out);
    v7 = (void *)qword_100043000;
    if (os_log_type_enabled((os_log_t)qword_100043000, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      int v9 = 136446466;
      uint64_t v10 = -[RSDEventRegistration name](self, "name");
      __int16 v11 = 2082;
      v12 = out;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Delivering RSD event to %{public}s for device %{public}s",  (uint8_t *)&v9,  0x16u);
    }
  }

  xpc_event_publisher_fire(qword_100043008, -[RSDEventRegistration token](self, "token"), v5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RSDEventRegistration;
  -[RSDEventRegistration dealloc](&v3, "dealloc");
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (char)name
{
  return self->_name;
}

- (void)setName:(char *)a3
{
  self->_name = a3;
}

- (BOOL)dontRestartBrowse
{
  return self->_dontRestartBrowse;
}

- (void)setDontRestartBrowse:(BOOL)a3
{
  self->_dontRestartBrowse = a3;
}

- (OS_remote_device_browser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end