@interface DIDeviceHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)addToRefCountWithError:(id *)a3;
- (BOOL)handleRefCount;
- (BOOL)updateBSDNameWithBlockDevice:(id)a3 error:(id *)a4;
- (BOOL)waitForDeviceWithError:(id *)a3;
- (BOOL)waitForQuietWithService:(unsigned int)a3 error:(id *)a4;
- (DIClient2IODaemonXPCHandler)client2IOhandler;
- (DIDeviceHandle)initWithCoder:(id)a3;
- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3;
- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3 xpcEndpoint:(id)a4;
- (NSString)BSDName;
- (NSXPCListenerEndpoint)xpcEndpoint;
- (id)description;
- (unint64_t)regEntryID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBSDName:(id)a3;
- (void)setClient2IOhandler:(id)a3;
- (void)setHandleRefCount:(BOOL)a3;
- (void)setXpcEndpoint:(id)a3;
@end

@implementation DIDeviceHandle

- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3 xpcEndpoint:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIDeviceHandle;
  v8 = -[DIDeviceHandle init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_regEntryID = a3;
    objc_storeStrong((id *)&v8->_xpcEndpoint, a4);
  }

  return v9;
}

- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3
{
  return -[DIDeviceHandle initWithRegEntryID:xpcEndpoint:](self, "initWithRegEntryID:xpcEndpoint:", a3, 0LL);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle client2IOhandler](self, "client2IOhandler"));

  if (v3)
  {
    int v4 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v14 = 0LL;
      uint64_t v5 = sub_1000BE278();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v7 = 3LL;
      }
      else {
        uint64_t v7 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v16 = 25;
      __int16 v17 = 2080;
      v18 = "-[DIDeviceHandle dealloc]";
      LODWORD(v12) = 18;
      v8 = (char *)_os_log_send_and_compose_impl( v7,  &v14,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%.*s: DIDeviceHandle object is deallocating, invalidating connection",  (int)buf,  v12);

      if (v8)
      {
        fprintf(__stderrp, "%s\n", v8);
        free(v8);
      }
    }

    else
    {
      uint64_t v9 = sub_1000BE278();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v16 = 25;
        __int16 v17 = 2080;
        v18 = "-[DIDeviceHandle dealloc]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%.*s: DIDeviceHandle object is deallocating, invalidating connection",  buf,  0x12u);
      }
    }

    *__error() = v4;
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle client2IOhandler](self, "client2IOhandler"));
    [v11 closeConnection];
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DIDeviceHandle;
  -[DIDeviceHandle dealloc](&v13, "dealloc");
}

- (BOOL)updateBSDNameWithBlockDevice:(id)a3 error:(id *)a4
{
  id v6 = [a3 copyIOMediaWithError:a4];
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 BSDName]);
    -[DIDeviceHandle setBSDName:](self, "setBSDName:", v8);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle BSDName](self, "BSDName"));
    if (v9)
    {
      int v10 = *__error();
      if (sub_1000BE2F0())
      {
        uint64_t v21 = 0LL;
        uint64_t v11 = sub_1000BE278();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v13 = 3LL;
        }
        else {
          uint64_t v13 = 2LL;
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle BSDName](self, "BSDName"));
        *(_DWORD *)buf = 68158210;
        int v23 = 53;
        __int16 v24 = 2080;
        v25 = "-[DIDeviceHandle updateBSDNameWithBlockDevice:error:]";
        __int16 v26 = 2114;
        v27 = v14;
        v15 = (char *)_os_log_send_and_compose_impl( v13,  &v21,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%.*s: BSD name: %{public}@",  buf,  28);

        if (v15)
        {
          fprintf(__stderrp, "%s\n", v15);
          free(v15);
        }
      }

      else
      {
        uint64_t v17 = sub_1000BE278();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle BSDName](self, "BSDName"));
          *(_DWORD *)buf = 68158210;
          int v23 = 53;
          __int16 v24 = 2080;
          v25 = "-[DIDeviceHandle updateBSDNameWithBlockDevice:error:]";
          __int16 v26 = 2114;
          v27 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%.*s: BSD name: %{public}@", buf, 0x1Cu);
        }
      }

      *__error() = v10;
      BOOL v16 = 1;
    }

    else
    {
      BOOL v16 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  @"Cannot find BSD name in IO media service",  a4);
    }
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)waitForQuietWithService:(unsigned int)a3 error:(id *)a4
{
  mach_timespec_t waitTime = (mach_timespec_t)30LL;
  while (1)
  {
    uint64_t v5 = IOServiceWaitQuiet(a3, &waitTime);
    if ((_DWORD)v5 != -536870186) {
      break;
    }
    int v6 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v26 = 0LL;
      uint64_t v7 = sub_1000BE278();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      if (v9) {
        uint64_t v10 = 3LL;
      }
      else {
        uint64_t v10 = 2LL;
      }
      int v29 = 48;
      __int16 v30 = 2080;
      v31 = "-[DIDeviceHandle waitForQuietWithService:error:]";
      LODWORD(v24) = 18;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl( v10,  &v26,  0LL,  0LL,  &_mh_execute_header,  v8,  16LL,  "%.*s: IOServiceWaitQuiet timeout occurred, retrying.",  (int)buf,  v24);

      if (v11)
      {
        fprintf(__stderrp, "%s\n", v11);
        free(v11);
      }
    }

    else
    {
      uint64_t v12 = sub_1000BE278();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v29 = 48;
        __int16 v30 = 2080;
        v31 = "-[DIDeviceHandle waitForQuietWithService:error:]";
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%.*s: IOServiceWaitQuiet timeout occurred, retrying.",  buf,  0x12u);
      }
    }

    *__error() = v6;
  }

  if ((_DWORD)v5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IOServiceWaitQuiet error 0x%x",  v5));
    BOOL v20 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  v19,  a4);
  }

  else
  {
    int v14 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v26 = 0LL;
      uint64_t v15 = sub_1000BE278();
      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = 3LL;
      }
      else {
        uint64_t v17 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v29 = 48;
      __int16 v30 = 2080;
      v31 = "-[DIDeviceHandle waitForQuietWithService:error:]";
      LODWORD(v24) = 18;
      v18 = (char *)_os_log_send_and_compose_impl( v17,  &v26,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%.*s: IOServiceWaitQuiet done",  (int)buf,  v24);

      if (v18)
      {
        fprintf(__stderrp, "%s\n", v18);
        free(v18);
      }
    }

    else
    {
      uint64_t v21 = sub_1000BE278();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v29 = 48;
        __int16 v30 = 2080;
        v31 = "-[DIDeviceHandle waitForQuietWithService:error:]";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%.*s: IOServiceWaitQuiet done", buf, 0x12u);
      }
    }

    *__error() = v14;
    return 1;
  }

  return v20;
}

- (BOOL)waitForDeviceWithError:(id *)a3
{
  BOOL v22 = 0;
  id v5 = +[DIBlockDevice copyUnmatchedDiskImageWithRegEntryID:error:]( &OBJC_CLASS___DIBlockDevice,  "copyUnmatchedDiskImageWithRegEntryID:error:",  -[DIDeviceHandle regEntryID](self, "regEntryID"),  a3);
  int v6 = v5;
  if (v5)
  {
    refCon = &v22;
    unsigned int v20 = [v5 ioObj];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    v8 = (__CFRunLoop *)[v7 getCFRunLoop];
    if (!-[DIDeviceHandle waitForQuietWithService:error:]( self,  "waitForQuietWithService:error:",  [v6 ioObj],  a3)) {
      goto LABEL_15;
    }
    BOOL v9 = IONotificationPortCreate(kIOMainPortDefault);
    if (v9)
    {
      uint64_t v10 = v9;
      RunLoopSource = IONotificationPortGetRunLoopSource(v9);
      if (RunLoopSource)
      {
        uint64_t v12 = RunLoopSource;
        uint64_t v13 = kCFRunLoopDefaultMode;
        CFRunLoopAddSource(v8, RunLoopSource, kCFRunLoopDefaultMode);
        int v14 = IOServiceMatching("IOMedia");
        if (!IOServiceAddMatchingNotification( v10,  "IOServiceMatched",  v14,  (IOServiceMatchingCallback)sub_100030F74,  &refCon,  &notification))
        {
          CFRunLoopMode v18 = kCFRunLoopDefaultMode;
          sub_100030F74((uint64_t)&refCon, notification);
          while (!v22)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  1.0,  v18));
            [v7 runMode:NSDefaultRunLoopMode beforeDate:v15];
          }

          IOObjectRelease(notification);
          uint64_t v13 = v18;
        }

        CFRunLoopRemoveSource(v8, v12, v13);
      }

      else
      {
        +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  @"Failed getting runloop source",  0LL);
      }

      IONotificationPortDestroy(v10);
    }

    if (v22)
    {
      BOOL v16 = -[DIDeviceHandle updateBSDNameWithBlockDevice:error:](self, "updateBSDNameWithBlockDevice:error:", v6, a3);
      BOOL v22 = v16;
    }

    else
    {
LABEL_15:
      BOOL v16 = 0;
    }
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DIDeviceHandle;
  id v5 = -[DIDeviceHandle init](&v16, "init");
  if (v5)
  {
    v5->_regEntryID = (unint64_t)[v4 decodeInt64ForKey:@"regEntryID"];
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSXPCListenerEndpoint, v6),  @"xpcEndpoint");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    xpcEndpoint = v5->_xpcEndpoint;
    v5->_xpcEndpoint = (NSXPCListenerEndpoint *)v8;

    id v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), @"BSDname");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    BSDName = v5->_BSDName;
    v5->_BSDName = (NSString *)v12;

    unsigned int v14 = [v4 decodeBoolForKey:@"handleRefCount"];
    v5->_handleRefCount = v14;
    if (v14)
    {
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", -[DIDeviceHandle regEntryID](self, "regEntryID"), @"regEntryID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint"));
  [v6 encodeObject:v4 forKey:@"xpcEndpoint"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle BSDName](self, "BSDName"));
  [v6 encodeObject:v5 forKey:@"BSDname"];

  objc_msgSend( v6,  "encodeBool:forKey:",  -[DIDeviceHandle handleRefCount](self, "handleRefCount"),  @"handleRefCount");
}

- (BOOL)addToRefCountWithError:(id *)a3
{
  id v5 = objc_alloc(&OBJC_CLASS___DIClient2IODaemonXPCHandler);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint"));
  id v7 = -[DIClient2IODaemonXPCHandler initWithEndpoint:](v5, "initWithEndpoint:", v6);
  -[DIDeviceHandle setClient2IOhandler:](self, "setClient2IOhandler:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle client2IOhandler](self, "client2IOhandler"));
  LODWORD(v6) = [v8 connectWithError:a3];

  if (!(_DWORD)v6) {
    return 0;
  }
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle client2IOhandler](self, "client2IOhandler"));
  unsigned __int8 v10 = [v9 addToRefCountWithError:a3];

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle BSDName](self, "BSDName"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint"));
  uint64_t v8 = @"managed";
  if (!v7) {
    uint64_t v8 = @"unmanaged";
  }
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@[%@, %@]",  v5,  v6,  v8));

  return v9;
}

- (NSString)BSDName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBSDName:(id)a3
{
}

- (DIClient2IODaemonXPCHandler)client2IOhandler
{
  return self->_client2IOhandler;
}

- (void)setClient2IOhandler:(id)a3
{
}

- (BOOL)handleRefCount
{
  return self->_handleRefCount;
}

- (void)setHandleRefCount:(BOOL)a3
{
  self->_handleRefCount = a3;
}

- (unint64_t)regEntryID
{
  return self->_regEntryID;
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end