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
  v8 = -[DIDeviceHandle init](&v11, sel_init);
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
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v3 = -[DIDeviceHandle client2IOhandler](self, "client2IOhandler");
  if (v3)
  {
    int v4 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v12 = 0LL;
      getDIOSLog();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v14 = 25;
      __int16 v15 = 2080;
      v16 = "-[DIDeviceHandle dealloc]";
      int v10 = 18;
      v9 = buf;
      v6 = (char *)_os_log_send_and_compose_impl();

      if (v6)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v6);
        free(v6);
      }
    }

    else
    {
      getDIOSLog();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v14 = 25;
        __int16 v15 = 2080;
        v16 = "-[DIDeviceHandle dealloc]";
        _os_log_impl( &dword_188046000,  v7,  OS_LOG_TYPE_DEFAULT,  "%.*s: DIDeviceHandle object is deallocating, invalidating connection",  buf,  0x12u);
      }
    }

    *__error() = v4;
    v8 = -[DIDeviceHandle client2IOhandler](self, "client2IOhandler");
    [v8 closeConnection];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIDeviceHandle;
  -[DIDeviceHandle dealloc](&v11, sel_dealloc, v9, v10);
}

- (BOOL)updateBSDNameWithBlockDevice:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v6 = (void *)[a3 copyIOMediaWithError:a4];
  id v7 = v6;
  if (v6)
  {
    [v6 BSDName];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIDeviceHandle setBSDName:](self, "setBSDName:", v8);
    v9 = -[DIDeviceHandle BSDName](self, "BSDName");
    if (v9)
    {
      int v10 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        -[DIDeviceHandle BSDName](self, "BSDName");
        *(_DWORD *)buf = 68158210;
        int v18 = 53;
        __int16 v19 = 2080;
        v20 = "-[DIDeviceHandle updateBSDNameWithBlockDevice:error:]";
        __int16 v21 = 2114;
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = (char *)_os_log_send_and_compose_impl();

        if (v12)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v12);
          free(v12);
        }
      }

      else
      {
        getDIOSLog();
        int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[DIDeviceHandle BSDName](self, "BSDName");
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158210;
          int v18 = 53;
          __int16 v19 = 2080;
          v20 = "-[DIDeviceHandle updateBSDNameWithBlockDevice:error:]";
          __int16 v21 = 2114;
          id v22 = v15;
          _os_log_impl(&dword_188046000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: BSD name: %{public}@", buf, 0x1Cu);
        }
      }

      *__error() = v10;
      BOOL v13 = 1;
    }

    else
    {
      BOOL v13 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  @"Cannot find BSD name in IO media service",  a4);
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)waitForQuietWithService:(unsigned int)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  mach_timespec_t waitTime = (mach_timespec_t)30LL;
  while (1)
  {
    uint64_t v5 = IOServiceWaitQuiet(a3, &waitTime);
    if ((_DWORD)v5 != -536870186) {
      break;
    }
    int v6 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      int v20 = 48;
      __int16 v21 = 2080;
      id v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
      v8 = (char *)_os_log_send_and_compose_impl();

      if (v8)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v8);
        free(v8);
      }
    }

    else
    {
      getDIOSLog();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v20 = 48;
        __int16 v21 = 2080;
        id v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
        _os_log_impl( &dword_188046000,  v9,  OS_LOG_TYPE_ERROR,  "%.*s: IOServiceWaitQuiet timeout occurred, retrying.",  buf,  0x12u);
      }
    }

    *__error() = v6;
  }

  if ((_DWORD)v5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"IOServiceWaitQuiet error 0x%x", v5);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v14 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  v13,  a4);
  }

  else
  {
    int v10 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v20 = 48;
      __int16 v21 = 2080;
      id v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
      uint64_t v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v12);
        free(v12);
      }
    }

    else
    {
      getDIOSLog();
      __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v20 = 48;
        __int16 v21 = 2080;
        id v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
        _os_log_impl(&dword_188046000, v15, OS_LOG_TYPE_DEFAULT, "%.*s: IOServiceWaitQuiet done", buf, 0x12u);
      }
    }

    *__error() = v10;
    return 1;
  }

  return v14;
}

- (BOOL)waitForDeviceWithError:(id *)a3
{
  BOOL v23 = 0;
  id v5 = +[DIBlockDevice copyUnmatchedDiskImageWithRegEntryID:error:]( &OBJC_CLASS___DIBlockDevice,  "copyUnmatchedDiskImageWithRegEntryID:error:",  -[DIDeviceHandle regEntryID](self, "regEntryID"),  a3);
  int v6 = v5;
  if (v5)
  {
    refCon = &v23;
    int v21 = [v5 ioObj];
    [MEMORY[0x189604008] currentRunLoop];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (__CFRunLoop *)[v7 getCFRunLoop];
    if (!-[DIDeviceHandle waitForQuietWithService:error:]( self,  "waitForQuietWithService:error:",  [v6 ioObj],  a3)) {
      goto LABEL_16;
    }
    v9 = IONotificationPortCreate(*MEMORY[0x1896086A8]);
    if (v9)
    {
      int v10 = v9;
      RunLoopSource = IONotificationPortGetRunLoopSource(v9);
      if (RunLoopSource)
      {
        uint64_t v12 = RunLoopSource;
        BOOL v13 = (const __CFString *)*MEMORY[0x1896051B0];
        CFRunLoopAddSource(v8, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1896051B0]);
        BOOL v14 = IOServiceMatching("IOMedia");
        if (!IOServiceAddMatchingNotification( v10,  "IOServiceMatched",  v14,  (IOServiceMatchingCallback)waitForDevCB,  &refCon,  &notification))
        {
          __int16 v19 = v13;
          waitForDevCB((uint64_t)&refCon, notification);
          if (!v23)
          {
            uint64_t v15 = *MEMORY[0x189603A40];
            do
            {
              objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceNow:", 1.0, v19);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              [v7 runMode:v15 beforeDate:v16];
            }

            while (!v23);
          }

          IOObjectRelease(notification);
          BOOL v13 = v19;
        }

        CFRunLoopRemoveSource(v8, v12, v13);
      }

      else
      {
        +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  @"Failed getting runloop source",  0LL);
      }

      IONotificationPortDestroy(v10);
    }

    if (v23)
    {
      BOOL v17 = -[DIDeviceHandle updateBSDNameWithBlockDevice:error:](self, "updateBSDNameWithBlockDevice:error:", v6, a3);
      BOOL v23 = v17;
    }

    else
    {
LABEL_16:
      BOOL v17 = 0;
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DIDeviceHandle;
  id v5 = -[DIDeviceHandle init](&v12, sel_init);
  if (v5)
  {
    v5->_regEntryID = [v4 decodeInt64ForKey:@"regEntryID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"xpcEndpoint"];
    xpcEndpoint = v5->_xpcEndpoint;
    v5->_xpcEndpoint = (NSXPCListenerEndpoint *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BSDname"];
    BSDName = v5->_BSDName;
    v5->_BSDName = (NSString *)v8;

    int v10 = [v4 decodeBoolForKey:@"handleRefCount"];
    v5->_handleRefCount = v10;
    if (v10)
    {
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", -[DIDeviceHandle regEntryID](self, "regEntryID"), @"regEntryID");
  -[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v4 forKey:@"xpcEndpoint"];

  -[DIDeviceHandle BSDName](self, "BSDName");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v5 forKey:@"BSDname"];

  objc_msgSend( v6,  "encodeBool:forKey:",  -[DIDeviceHandle handleRefCount](self, "handleRefCount"),  @"handleRefCount");
}

- (BOOL)addToRefCountWithError:(id *)a3
{
  id v5 = objc_alloc(&OBJC_CLASS___DIClient2IODaemonXPCHandler);
  -[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[DIClient2IODaemonXPCHandler initWithEndpoint:](v5, "initWithEndpoint:", v6);
  -[DIDeviceHandle setClient2IOhandler:](self, "setClient2IOhandler:", v7);

  -[DIDeviceHandle client2IOhandler](self, "client2IOhandler");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = [v8 connectWithError:a3];

  if (!(_DWORD)v6) {
    return 0;
  }
  v9 = -[DIDeviceHandle client2IOhandler](self, "client2IOhandler");
  char v10 = [v9 addToRefCountWithError:a3];

  return v10;
}

- (id)description
{
  v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDeviceHandle BSDName](self, "BSDName");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = @"managed";
  if (!v7) {
    uint64_t v8 = @"unmanaged";
  }
  [v3 stringWithFormat:@"%@[%@, %@]", v5, v6, v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

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