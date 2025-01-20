@interface DIController2IO_XPCHandlerAttach
- (BOOL)createDeviceWithError:(id *)a3;
- (BOOL)disconnectFromDriverWithError:(id *)a3;
- (BOOL)isNewDevice;
- (BOOL)setupDriverWithError:(id *)a3;
- (BOOL)updateFileBackingInfoWithRootDeviceEntryID:(unint64_t *)a3 error:(id *)a4;
- (DIAttachParams)attachParams;
- (DIController2IO_XPCHandlerAttach)initWithParams:(id)a3;
- (id)launchIODaemonWithError:(id *)a3;
- (id)runWithError:(id *)a3;
- (unsigned)getInterconnectLocation;
- (unsigned)ucConnection;
- (void)setIsNewDevice:(BOOL)a3;
@end

@implementation DIController2IO_XPCHandlerAttach

- (DIController2IO_XPCHandlerAttach)initWithParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DIController2IO_XPCHandlerAttach;
  v6 = -[DIController2IO_XPCHandlerBase initWithParams:](&v9, "initWithParams:", v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attachParams, a3);
    v7->_ucConnection = 0;
  }

  return v7;
}

- (id)launchIODaemonWithError:(id *)a3
{
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_10002BA64;
  v33 = sub_10002BA74;
  id v34 = 0LL;
  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10002BA7C;
  v26[3] = &unk_100175B50;
  objc_copyWeak(&v27, &location);
  v26[4] = &v29;
  id v5 = objc_retainBlock(v26);
  if (-[DIController2IO_XPCHandlerAttach isNewDevice](self, "isNewDevice"))
  {
    int v6 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v25 = 0LL;
      uint64_t v7 = sub_1000BE278();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v9 = 3LL;
      }
      else {
        uint64_t v9 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v36 = 60;
      __int16 v37 = 2080;
      v38 = "-[DIController2IO_XPCHandlerAttach launchIODaemonWithError:]";
      LODWORD(v24) = 18;
      v10 = (char *)_os_log_send_and_compose_impl( v9,  &v25,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%.*s: Device created, attaching to the new device",  (int)buf,  v24);

      if (v10)
      {
        fprintf(__stderrp, "%s\n", v10);
        free(v10);
      }
    }

    else
    {
      uint64_t v16 = sub_1000BE278();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v36 = 60;
        __int16 v37 = 2080;
        v38 = "-[DIController2IO_XPCHandlerAttach launchIODaemonWithError:]";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%.*s: Device created, attaching to the new device",  buf,  0x12u);
      }
    }

    *__error() = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
    [v18 attachToNewDeviceWithParams:v19 reply:v5];
  }

  else
  {
    int v11 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v25 = 0LL;
      uint64_t v12 = sub_1000BE278();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = 3LL;
      }
      else {
        uint64_t v14 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v36 = 60;
      __int16 v37 = 2080;
      v38 = "-[DIController2IO_XPCHandlerAttach launchIODaemonWithError:]";
      LODWORD(v24) = 18;
      v15 = (char *)_os_log_send_and_compose_impl( v14,  &v25,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%.*s: Attaching to an existing device",  (int)buf,  v24);

      if (v15)
      {
        fprintf(__stderrp, "%s\n", v15);
        free(v15);
      }
    }

    else
    {
      uint64_t v20 = sub_1000BE278();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v36 = 60;
        __int16 v37 = 2080;
        v38 = "-[DIController2IO_XPCHandlerAttach launchIODaemonWithError:]";
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%.*s: Attaching to an existing device",  buf,  0x12u);
      }
    }

    *__error() = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
    [v18 attachToExistingDeviceWithParams:v19 reply:v5];
  }

  if (-[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a3)) {
    id v22 = (id)v30[5];
  }
  else {
    id v22 = 0LL;
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v29, 8);

  return v22;
}

- (BOOL)setupDriverWithError:(id *)a3
{
  id v5 = +[DIIOObject copyDiskImagesControllerWithError:](&OBJC_CLASS___DIIOObject, "copyDiskImagesControllerWithError:");
  int v6 = v5;
  if (v5)
  {
    io_service_t v7 = [v5 ioObj];
    uint64_t v8 = IOServiceOpen(v7, mach_task_self_, 0, &self->_ucConnection);
    if ((_DWORD)v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IOServiceOpen failed. error=0x%x",  v8));
      BOOL v10 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  v9,  a3);
    }

    else
    {
      BOOL v10 = 1;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)disconnectFromDriverWithError:(id *)a3
{
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    uint64_t v6 = sub_1000BE278();
    io_service_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v20 = 66;
    __int16 v21 = 2080;
    id v22 = "-[DIController2IO_XPCHandlerAttach disconnectFromDriverWithError:]";
    LODWORD(v17) = 18;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%.*s: Closing IO service",  (int)buf,  v17);

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }

  else
  {
    uint64_t v10 = sub_1000BE278();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v20 = 66;
      __int16 v21 = 2080;
      id v22 = "-[DIController2IO_XPCHandlerAttach disconnectFromDriverWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: Closing IO service", buf, 0x12u);
    }
  }

  *__error() = v5;
  p_ucConnection = &self->_ucConnection;
  uint64_t v13 = IOServiceClose(*p_ucConnection);
  unsigned int *p_ucConnection = 0;
  if (!(_DWORD)v13) {
    return 1;
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IOServiceClose failed. error=0x%x",  v13));
  BOOL v15 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  v14,  a3);

  return v15;
}

- (BOOL)updateFileBackingInfoWithRootDeviceEntryID:(unint64_t *)a3 error:(id *)a4
{
  io_service_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 inputStatFS]);
  if (!v8)
  {

    goto LABEL_14;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 inputStatFS]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mountedFrom]);

  if (!v11)
  {
LABEL_14:
    *a3 = 0LL;
    int v29 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v42 = 0LL;
      uint64_t v30 = sub_1000BE278();
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v32 = 3LL;
      }
      else {
        uint64_t v32 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v44 = 85;
      __int16 v45 = 2080;
      v46 = "-[DIController2IO_XPCHandlerAttach updateFileBackingInfoWithRootDeviceEntryID:error:]";
      LODWORD(v40) = 18;
      v33 = (char *)_os_log_send_and_compose_impl( v32,  &v42,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "%.*s: Disk image file is not backed by local storage, root device entry ID will be the disk image device itself",  (int)buf,  v40);

      if (v33)
      {
        fprintf(__stderrp, "%s\n", v33);
        free(v33);
      }
    }

    else
    {
      uint64_t v34 = sub_1000BE278();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v44 = 85;
        __int16 v45 = 2080;
        v46 = "-[DIController2IO_XPCHandlerAttach updateFileBackingInfoWithRootDeviceEntryID:error:]";
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%.*s: Disk image file is not backed by local storage, root device entry ID will be the disk image device itself",  buf,  0x12u);
      }
    }

    *__error() = v29;
    return 1;
  }

  uint64_t v12 = objc_alloc(&OBJC_CLASS___DIIOMedia);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 inputStatFS]);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mountedFrom]);
  uint64_t v16 = -[DIIOMedia initWithDevName:error:](v12, "initWithDevName:error:", v15, a4);

  if (v16)
  {
    id v17 = -[DIIOMedia copyBlockDeviceWithError:](v16, "copyBlockDeviceWithError:", a4);
    uint64_t v18 = v17;
    if (v17)
    {
      id v19 = [v17 copyRootBlockDeviceWithError:a4];
      int v20 = v19;
      if (v19)
      {
        id v21 = [v19 registryEntryIDWithError:a4];
        *a3 = (unint64_t)v21;
        if (v21)
        {
          int v22 = *__error();
          if (sub_1000BE2F0())
          {
            uint64_t v42 = 0LL;
            uint64_t v23 = sub_1000BE278();
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
            unint64_t v26 = *a3;
            if (v25) {
              uint64_t v27 = 3LL;
            }
            else {
              uint64_t v27 = 2LL;
            }
            *(_DWORD *)buf = 68158210;
            int v44 = 85;
            __int16 v45 = 2080;
            v46 = "-[DIController2IO_XPCHandlerAttach updateFileBackingInfoWithRootDeviceEntryID:error:]";
            __int16 v47 = 2048;
            unint64_t v48 = v26;
            LODWORD(v40) = 28;
            v28 = (char *)_os_log_send_and_compose_impl( v27,  &v42,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "%.*s: Entry ID of root block storage device: 0x%llx",  (int)buf,  v40,  v41);

            if (v28)
            {
              fprintf(__stderrp, "%s\n", v28);
              free(v28);
            }
          }

          else
          {
            uint64_t v37 = sub_1000BE278();
            v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v39 = *a3;
              *(_DWORD *)buf = 68158210;
              int v44 = 85;
              __int16 v45 = 2080;
              v46 = "-[DIController2IO_XPCHandlerAttach updateFileBackingInfoWithRootDeviceEntryID:error:]";
              __int16 v47 = 2048;
              unint64_t v48 = v39;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%.*s: Entry ID of root block storage device: 0x%llx",  buf,  0x1Cu);
            }
          }

          *__error() = v22;

          return 1;
        }
      }
    }
  }

  return 0;
}

- (unsigned)getInterconnectLocation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputURL]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scheme]);

  if ([v4 isEqualToString:@"file"])
  {
    unsigned __int8 v5 = 1;
  }

  else if ([v4 isEqualToString:@"ram"])
  {
    unsigned __int8 v5 = 2;
  }

  else if ([v4 isEqualToString:@"http"])
  {
    unsigned __int8 v5 = 3;
  }

  else if ([v4 isEqualToString:@"https"])
  {
    unsigned __int8 v5 = 3;
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)createDeviceWithError:(id *)a3
{
  size_t outputStructCnt = 12LL;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
  [v5 autoMount];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
  io_service_t v7 = v6;
  if (!v6)
  {
    v131 = 0LL;
    lpsrc = 0LL;
LABEL_6:
    p_lpsrc = buf;
    goto LABEL_7;
  }

  [v6 backend];
  if (!lpsrc) {
    goto LABEL_6;
  }
  if (!v8) {
    goto LABEL_6;
  }
  *(void *)buf = v8;
  *(void *)v120 = v131;
  p_lpsrc = &lpsrc;
LABEL_7:
  void *p_lpsrc = 0LL;
  p_lpsrc[1] = 0LL;
  uint64_t v10 = v131;
  if (v131)
  {
    p_shared_owners = (unint64_t *)&v131->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  if (*(void *)buf)
  {
    v114 = -[QuarantineFileHandler initWithFD:error:]( objc_alloc(&OBJC_CLASS___QuarantineFileHandler),  "initWithFD:error:",  (***(uint64_t (****)(void))buf)(*(void *)buf),  a3);
    if (!v114) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 inputURL]);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 scheme]);
  if ([v15 isEqualToString:@"http"])
  {
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 inputURL]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 scheme]);
    unsigned int v19 = [v18 isEqualToString:@"https"];

    if (!v19)
    {
      v114 = 0LL;
      goto LABEL_21;
    }
  }

  int v20 = objc_alloc(&OBJC_CLASS___QuarantineFileHandler);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
  int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 inputURL]);
  v114 = -[QuarantineFileHandler initWithURL:error:](v20, "initWithURL:error:", v22, a3);

  if (v114)
  {
LABEL_21:
    int v23 = 1;
    goto LABEL_22;
  }

- (id)runWithError:(id *)a3
{
  if (!-[DIController2IO_XPCHandlerAttach setupDriverWithError:](self, "setupDriverWithError:"))
  {
    int v11 = 0LL;
LABEL_11:
    id v8 = 0LL;
    goto LABEL_13;
  }

  if (!-[DIController2IO_XPCHandlerAttach createDeviceWithError:](self, "createDeviceWithError:", a3)
    || -[DIController2IO_XPCHandlerAttach isNewDevice](self, "isNewDevice")
    && (unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams")),
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 diskImageParamsXPC]),
        unsigned __int8 v7 = [v6 lockWritableBackendsWithError:a3],
        v6,
        v5,
        (v7 & 1) == 0)
    || !-[DIBaseXPCHandler connectWithError:](self, "connectWithError:", a3)
    || (id v8 = -[DIController2IO_XPCHandlerAttach launchIODaemonWithError:](self, "launchIODaemonWithError:", a3)) == 0LL)
  {
    -[DIController2IO_XPCHandlerAttach disconnectFromDriverWithError:](self, "disconnectFromDriverWithError:", 0LL);
    int v11 = 0LL;
    id v8 = 0LL;
    goto LABEL_13;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerAttach attachParams](self, "attachParams"));
  unsigned int v10 = [v9 handleRefCount];

  if (!v10)
  {
    -[DIController2IO_XPCHandlerAttach disconnectFromDriverWithError:](self, "disconnectFromDriverWithError:", 0LL);
    goto LABEL_15;
  }

  if (-[DIController2IO_XPCHandlerAttach disconnectFromDriverWithError:](self, "disconnectFromDriverWithError:", a3))
  {
LABEL_15:
    int v11 = v8;
    goto LABEL_11;
  }

  int v11 = 0LL;
LABEL_13:

  return v11;
}

- (DIAttachParams)attachParams
{
  return self->_attachParams;
}

- (unsigned)ucConnection
{
  return self->_ucConnection;
}

- (BOOL)isNewDevice
{
  return self->_isNewDevice;
}

- (void)setIsNewDevice:(BOOL)a3
{
  self->_isNewDevice = a3;
}

- (void).cxx_destruct
{
}

@end