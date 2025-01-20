@interface TVPARemoteFlagsController
+ (unint64_t)_flagsForRemote:(id)a3;
- (TVPARemoteFlagsController)init;
- (void)dealloc;
- (void)invalidate;
- (void)update;
@end

@implementation TVPARemoteFlagsController

- (TVPARemoteFlagsController)init
{
  id v11 = self;
  SEL v10 = a2;
  uint32_t v8 = notify_register_check("com.apple.TVPeripheralAgent.RemoteFlagsDidChange", &out_token);
  if (v8 || out_token == -1)
  {
    os_log_t oslog = (os_log_t)sub_100008904();
    os_log_type_t type = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      sub_10000897C((uint64_t)v13, (uint64_t)"com.apple.TVPeripheralAgent.RemoteFlagsDidChange", v8);
      _os_log_fault_impl( (void *)&_mh_execute_header,  oslog,  type,  "Unable to create register token for %{public}s. err=%u",  v13,  0x12u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    v12 = 0LL;
    int v5 = 1;
  }

  else
  {
    id v2 = v11;
    id v11 = 0LL;
    v4.receiver = v2;
    v4.super_class = (Class)&OBJC_CLASS___TVPARemoteFlagsController;
    id v11 = -[TVPARemoteFlagsController init](&v4, "init");
    objc_storeStrong(&v11, v11);
    if (v11) {
      *((_DWORD *)v11 + 2) = out_token;
    }
    v12 = (TVPARemoteFlagsController *)v11;
    int v5 = 1;
  }

  objc_storeStrong(&v11, 0LL);
  return v12;
}

- (void)dealloc
{
  v15 = self;
  SEL v14 = a2;
  if (self->_remoteCapabilitiesNotifyToken != -1)
  {
    v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_remoteCapabilitiesNotifyToken == NOTIFY_TOKEN_INVALID");
    id v12 = &_os_log_default;
    char v11 = 16;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      v7 = NSStringFromSelector(v14);
      v3 = v7;
      SEL v10 = v3;
      id v2 = (objc_class *)objc_opt_class(v15);
      v6 = NSStringFromClass(v2);
      v9 = v6;
      sub_100008C14( (uint64_t)v16,  (uint64_t)v3,  (uint64_t)v9,  (uint64_t)v15,  (uint64_t)@"TVPARemoteFlagsController.m",  104,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v16,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x100008BA0LL);
  }

  v8.receiver = v15;
  v8.super_class = (Class)&OBJC_CLASS___TVPARemoteFlagsController;
  -[TVPARemoteFlagsController dealloc](&v8, "dealloc");
}

- (void)invalidate
{
  if (self->_remoteCapabilitiesNotifyToken != -1)
  {
    notify_cancel(self->_remoteCapabilitiesNotifyToken);
    self->_remoteCapabilitiesNotifyToken = -1;
  }

- (void)update
{
  v40 = self;
  SEL v39 = a2;
  if (self->_remoteCapabilitiesNotifyToken == -1)
  {
    v38 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_remoteCapabilitiesNotifyToken != NOTIFY_TOKEN_INVALID");
    id v37 = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v37;
      os_log_type_t v13 = type;
      v15 = NSStringFromSelector(v39);
      char v11 = v15;
      v35 = v11;
      id v2 = (objc_class *)objc_opt_class(v40);
      SEL v14 = NSStringFromClass(v2);
      v34 = v14;
      sub_100008C14( (uint64_t)v46,  (uint64_t)v11,  (uint64_t)v34,  (uint64_t)v40,  (uint64_t)@"TVPARemoteFlagsController.m",  122,  (uint64_t)v38);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v13,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v46,  0x3Au);

      objc_storeStrong((id *)&v34, 0LL);
      objc_storeStrong((id *)&v35, 0LL);
    }

    objc_storeStrong(&v37, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v38, "UTF8String"));
    __break(0);
    JUMPOUT(0x100008F10LL);
  }

  id v33 =  +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote");
  uint32_t state = notify_get_state(v40->_remoteCapabilitiesNotifyToken, &state64);
  if (state)
  {
    os_log_t oslog = (os_log_t)sub_100008904();
    os_log_type_t v29 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      sub_10000897C((uint64_t)v45, (uint64_t)"com.apple.TVPeripheralAgent.RemoteFlagsDidChange", state);
      _os_log_fault_impl( (void *)&_mh_execute_header,  oslog,  v29,  "Unable to get current state for %{public}s. err=%u",  v45,  0x12u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    int v28 = 1;
    goto LABEL_23;
  }

  uint64_t v27 = state64;
  uint64_t v26 = (uint64_t)[(id)objc_opt_class(v40) _flagsForRemote:v33];
  os_log_t v25 = (os_log_t)sub_100008904();
  os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v25;
    os_log_type_t v8 = v24;
    SEL v10 = sub_1000093A0(v26);
    v6 = v10;
    v23 = v6;
    v9 = sub_1000093A0(v27);
    v22 = v9;
    sub_100009554((uint64_t)v44, (uint64_t)"com.apple.TVPeripheralAgent.RemoteFlagsDidChange", (uint64_t)v6, (uint64_t)v22);
    _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "Comparing flags to determine if %{public}s should be sent: currentFlags=%{public}@, previousFlags=%{public}@",  v44,  0x20u);

    objc_storeStrong((id *)&v22, 0LL);
    objc_storeStrong((id *)&v23, 0LL);
  }

  objc_storeStrong((id *)&v25, 0LL);
  if (v27 == v26)
  {
LABEL_22:
    int v28 = 0;
    goto LABEL_23;
  }

  uint32_t state = notify_set_state(v40->_remoteCapabilitiesNotifyToken, v26);
  if (!state)
  {
    os_log_t v19 = (os_log_t)sub_100008904();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v19;
      os_log_type_t v4 = v18;
      int v5 = sub_1000093A0(v26);
      v17 = v5;
      sub_1000095C0((uint64_t)v42, (uint64_t)"com.apple.TVPeripheralAgent.RemoteFlagsDidChange", (uint64_t)v17);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Posting %{public}s. flags=%{public}@", v42, 0x16u);

      objc_storeStrong((id *)&v17, 0LL);
    }

    objc_storeStrong((id *)&v19, 0LL);
    notify_post("com.apple.TVPeripheralAgent.RemoteFlagsDidChange");
    if (state)
    {
      os_log_t v16 = (os_log_t)sub_100008904();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        sub_10000897C((uint64_t)v41, (uint64_t)"com.apple.TVPeripheralAgent.RemoteFlagsDidChange", state);
        _os_log_fault_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "Unable to post %{public}s. err=%u",  v41,  0x12u);
      }

      objc_storeStrong((id *)&v16, 0LL);
    }

    goto LABEL_22;
  }

  os_log_t v21 = (os_log_t)sub_100008904();
  os_log_type_t v20 = OS_LOG_TYPE_FAULT;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    sub_10000897C((uint64_t)v43, (uint64_t)"com.apple.TVPeripheralAgent.RemoteFlagsDidChange", state);
    _os_log_fault_impl( (void *)&_mh_execute_header,  v21,  v20,  "Unable to set current state for %{public}s. err=%u",  v43,  0x12u);
  }

  objc_storeStrong((id *)&v21, 0LL);
  int v28 = 1;
LABEL_23:
  objc_storeStrong(&v33, 0LL);
}

+ (unint64_t)_flagsForRemote:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    uint64_t v4 = 8LL;
    unint64_t v6 = v4;
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  objc_storeStrong(location, 0LL);
  return v6;
}

@end