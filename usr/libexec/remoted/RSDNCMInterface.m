@interface RSDNCMInterface
- (BOOL)activate;
- (BOOL)address;
- (BOOL)is_private;
- (IONotificationPort)notification_port;
- (OS_dispatch_queue)queue;
- (RSDNCMInterface)initWithService:(unsigned int)a3 notificationPort:(IONotificationPort *)a4 queue:(id)a5;
- (RSDRemoteNCMDevice)device;
- (char)mac_addr;
- (char)name;
- (id)addressed_callback;
- (id)detached_callback;
- (id)inactive_callback;
- (unint64_t)state;
- (unsigned)index;
- (unsigned)notification;
- (unsigned)service;
- (void)addressWithRetry;
- (void)advanceState:(unint64_t)a3;
- (void)deactivate;
- (void)dealloc;
- (void)setAddressed_callback:(id)a3;
- (void)setDetached_callback:(id)a3;
- (void)setDevice:(id)a3;
- (void)setInactive_callback:(id)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setIs_private:(BOOL)a3;
- (void)setMac_addr:(char *)a3;
- (void)setName:(char *)a3;
- (void)setNotification:(unsigned int)a3;
- (void)setNotification_port:(IONotificationPort *)a3;
- (void)setQueue:(id)a3;
- (void)setService:(unsigned int)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation RSDNCMInterface

- (RSDNCMInterface)initWithService:(unsigned int)a3 notificationPort:(IONotificationPort *)a4 queue:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v9 = 0LL;
  if ((_DWORD)v6 && a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___RSDNCMInterface;
    v10 = -[RSDNCMInterface init](&v12, "init");
    self = v10;
    if (v10)
    {
      -[RSDNCMInterface setService:](v10, "setService:", v6);
      IOObjectRetain(-[RSDNCMInterface service](self, "service"));
      -[RSDNCMInterface setState:](self, "setState:", 0LL);
      -[RSDNCMInterface setNotification_port:](self, "setNotification_port:", a4);
      -[RSDNCMInterface setQueue:](self, "setQueue:", v8);
      self = self;
      v9 = self;
    }

    else
    {
      v9 = 0LL;
    }
  }

  return v9;
}

- (BOOL)activate
{
  kern_return_t v3;
  id v4;
  os_log_s *v5;
  id v6;
  os_log_s *v7;
  const char *v8;
  id v9;
  os_log_s *v10;
  int v12;
  io_object_t notification;
  uint8_t buf[4];
  const char *v15;
  notification = 0;
  v3 = IOServiceAddInterestNotification( -[RSDNCMInterface notification_port](self, "notification_port"),  -[RSDNCMInterface service](self, "service"),  "IOGeneralInterest",  (IOServiceInterestCallback)sub_10001EDFC,  self,  &notification);
  if (v3)
  {
    v4 = sub_10001E4D4();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002B9FC(v3, v5);
    }
  }

  else
  {
    -[RSDNCMInterface setNotification:](self, "setNotification:", notification);
    objc_super v12 = 0;
    if (sub_10001140C(-[RSDNCMInterface service](self, "service"), &v12))
    {
      uint64_t v6 = sub_10001E4D4();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        else {
          id v8 = (&off_10003D7A8)[v12 - 1];
        }
        *(_DWORD *)buf = 136446210;
        v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "initial linkstatus: %{public}s", buf, 0xCu);
      }

      if (v12 == 3)
      {
        v9 = sub_10001E4D4();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "arming the connected device", buf, 2u);
        }

        -[RSDNCMInterface advanceState:](self, "advanceState:", 1LL);
      }
    }
  }

  return v3 == 0;
}

- (void)deactivate
{
  if (-[RSDNCMInterface notification](self, "notification"))
  {
    IOObjectRelease(-[RSDNCMInterface notification](self, "notification"));
    -[RSDNCMInterface setNotification:](self, "setNotification:", 0LL);
  }

- (BOOL)address
{
  WORD2(v20) = -21846;
  LODWORD(v20) = -1431655766;
  id v3 = sub_10001E4D4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002BDB8();
  }

  if (!sub_100011518(-[RSDNCMInterface service](self, "service"), __s1))
  {
    id v17 = sub_10001E4D4();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10002BD58();
    }

    return 0;
  }

  id v5 = sub_10001E4D4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v24 = self;
    __int16 v25 = 2082;
    *(void *)v26 = __s1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%p] ifname: %{public}s", buf, 0x16u);
  }

  uint64_t v7 = if_nametoindex(__s1);
  if (!(_DWORD)v7) {
    sub_10002BB44(&v21, buf);
  }
  uint64_t v8 = v7;
  id v9 = sub_10001E4D4();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v24 = self;
    __int16 v25 = 1024;
    *(_DWORD *)v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%p] ifindex: %d", buf, 0x12u);
  }

  BOOL v11 = sub_1000118E8(-[RSDNCMInterface service](self, "service"), (uint64_t)&v20);
  id v12 = sub_10001E4D4();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002BC90();
    }

    return 0;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219520;
    v24 = self;
    __int16 v25 = 1024;
    *(_DWORD *)v26 = v20;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = BYTE1(v20);
    __int16 v27 = 1024;
    int v28 = BYTE2(v20);
    __int16 v29 = 1024;
    int v30 = BYTE3(v20);
    __int16 v31 = 1024;
    int v32 = BYTE4(v20);
    __int16 v33 = 1024;
    int v34 = BYTE5(v20);
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%p] MAC Address: %02x:%02x:%02x:%02x:%02x:%02x",  buf,  0x30u);
  }

  if (_dispatch_is_multithreaded())
  {
    v15 = strdup(__s1);
    if (!v15)
    {
      do
      {
        __os_temporary_resource_shortage();
        v16 = strdup(__s1);
      }

      while (!v16);
      v15 = v16;
    }
  }

  else
  {
    v15 = strdup(__s1);
    if (!v15) {
      sub_10002BBAC(__s1, &v21, buf);
    }
  }

  -[RSDNCMInterface setName:](self, "setName:", v15, v20);
  -[RSDNCMInterface setIndex:](self, "setIndex:", v8);
  -[RSDNCMInterface setMac_addr:](self, "setMac_addr:", memdup2_np(&v20, 6LL));
  return 1;
}

- (void)addressWithRetry
{
  if ((id)-[RSDNCMInterface state](self, "state") == (id)1)
  {
    ++self->address_tries;
    if (-[RSDNCMInterface address](self, "address"))
    {
      -[RSDNCMInterface advanceState:](self, "advanceState:", 2LL);
    }

    else
    {
      if (self->address_tries == 60) {
        sub_10002BE18();
      }
      dispatch_time_t v3 = dispatch_time(0LL, 5000000000LL);
      v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001F474;
      block[3] = &unk_10003CF40;
      block[4] = self;
      dispatch_after(v3, v4, block);
    }
  }

- (void)advanceState:(unint64_t)a3
{
  unint64_t v5 = -[RSDNCMInterface state](self, "state");
  if (v5 != a3)
  {
    unint64_t v6 = v5;
    id v7 = sub_10001E4D4();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      int v32 = self;
      __int16 v33 = 2048;
      unint64_t v34 = v6;
      __int16 v35 = 2048;
      unint64_t v36 = a3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "[%p] advancing state from %llu to %llu",  buf,  0x20u);
    }

    switch(v6)
    {
      case 0uLL:
        if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1) {
          sub_10002BE30(&v30, buf);
        }
        return;
      case 1uLL:
        if (a3 - 2 >= 2 && a3) {
          sub_10002BE98(a3, &v30, buf);
        }
        return;
      case 2uLL:
        if (a3 && a3 != 3) {
          sub_10002BF24(a3, &v30, buf);
        }
        return;
      case 3uLL:
        sub_10002BFB0();
      default:
        break;
    }

    -[RSDNCMInterface setState:](self, "setState:", a3);
    self->address_tries = 0LL;
    switch(a3)
    {
      case 0uLL:
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface inactive_callback](self, "inactive_callback"));

        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface inactive_callback](self, "inactive_callback"));
          BOOL v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface queue](self, "queue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10001F7F0;
          block[3] = &unk_10003D768;
          block[4] = self;
          int v28 = v10;
          id v12 = v10;
          dispatch_async(v11, block);

          v13 = v28;
          goto LABEL_17;
        }

        break;
      case 1uLL:
        v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface queue](self, "queue"));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_10001F7E8;
        v29[3] = &unk_10003CF40;
        v29[4] = self;
        dispatch_async(v14, v29);
        goto LABEL_19;
      case 2uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface addressed_callback](self, "addressed_callback"));
        v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface queue](self, "queue"));
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_10001F800;
        v25[3] = &unk_10003D768;
        v25[4] = self;
        v26 = v15;
        id v12 = v15;
        dispatch_async(v16, v25);

        v13 = v26;
LABEL_17:

        break;
      case 3uLL:
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface detached_callback](self, "detached_callback"));
        v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface queue](self, "queue"));
        v19 = _NSConcreteStackBlock;
        uint64_t v20 = 3221225472LL;
        uint64_t v21 = sub_10001F810;
        v22 = &unk_10003D768;
        v23 = self;
        id v24 = v17;
        v14 = v17;
        dispatch_async(v18, &v19);

        -[RSDNCMInterface setInactive_callback:](self, "setInactive_callback:", 0LL, v19, v20, v21, v22, v23);
        -[RSDNCMInterface setAddressed_callback:](self, "setAddressed_callback:", 0LL);
        -[RSDNCMInterface setDetached_callback:](self, "setDetached_callback:", 0LL);

LABEL_19:
        break;
      default:
        return;
    }
  }

- (void)dealloc
{
  id v3 = sub_10001E4D4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002BFC8();
  }

  if (-[RSDNCMInterface name](self, "name"))
  {
    free(-[RSDNCMInterface name](self, "name"));
    -[RSDNCMInterface setName:](self, "setName:", 0LL);
  }

  if (-[RSDNCMInterface mac_addr](self, "mac_addr"))
  {
    free(-[RSDNCMInterface mac_addr](self, "mac_addr"));
    -[RSDNCMInterface setMac_addr:](self, "setMac_addr:", 0LL);
  }

  -[RSDNCMInterface setIndex:](self, "setIndex:", 0LL);
  if (-[RSDNCMInterface service](self, "service"))
  {
    IOObjectRelease(-[RSDNCMInterface service](self, "service"));
    -[RSDNCMInterface setService:](self, "setService:", 0LL);
  }

  -[RSDNCMInterface deactivate](self, "deactivate");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RSDNCMInterface;
  -[RSDNCMInterface dealloc](&v5, "dealloc");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)inactive_callback
{
  return self->_inactive_callback;
}

- (void)setInactive_callback:(id)a3
{
}

- (id)addressed_callback
{
  return self->_addressed_callback;
}

- (void)setAddressed_callback:(id)a3
{
}

- (id)detached_callback
{
  return self->_detached_callback;
}

- (void)setDetached_callback:(id)a3
{
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (char)name
{
  return self->_name;
}

- (void)setName:(char *)a3
{
  self->_name = a3;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_notification = a3;
}

- (IONotificationPort)notification_port
{
  return self->_notification_port;
}

- (void)setNotification_port:(IONotificationPort *)a3
{
  self->_notification_port = a3;
}

- (RSDRemoteNCMDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)is_private
{
  return self->_is_private;
}

- (void)setIs_private:(BOOL)a3
{
  self->_is_private = a3;
}

- (char)mac_addr
{
  return self->_mac_addr;
}

- (void)setMac_addr:(char *)a3
{
  self->_mac_addr = a3;
}

- (void).cxx_destruct
{
}

@end