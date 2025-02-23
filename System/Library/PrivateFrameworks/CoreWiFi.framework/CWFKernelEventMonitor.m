@interface CWFKernelEventMonitor
+ (id)descriptionForKernelEventCode:(unint64_t)a3;
- (BOOL)isMonitoringEvents;
- (CWFKernelEventMonitor)init;
- (id)eventHandler;
- (unint64_t)interfaceFlagsWithInterfaceName:(id)a3;
- (void)dealloc;
- (void)setEventHandler:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFKernelEventMonitor

+ (id)descriptionForKernelEventCode:(unint64_t)a3
{
  if (a3 - 1 < 0x1E) {
    return off_189E5C0A0[a3 - 1];
  }
  objc_msgSend_stringWithFormat_(NSString, a2, (uint64_t)@"? (%lu)", v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CWFKernelEventMonitor)init
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___CWFKernelEventMonitor;
  id v2 = -[CWFKernelEventMonitor init](&v39, sel_init);
  if (!v2) {
    goto LABEL_29;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.corewifi.kevent-mutex", v3);
  v5 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v4;

  if (!*((void *)v2 + 1)) {
    goto LABEL_29;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.corewifi.kevent-event", v6);
  v8 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v7;

  if (!*((void *)v2 + 2)) {
    goto LABEL_29;
  }
  int v9 = socket(32, 3, 1);
  unsigned int v10 = v9;
  if (v9 < 0)
  {
    CWFGetOSLog();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      CWFGetOSLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v19 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v23 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v24 = *__error();
      v25 = __error();
      v26 = strerror(*v25);
      int v40 = 136447234;
      v41 = "-[CWFKernelEventMonitor init]";
      __int16 v42 = 2082;
      v43 = "CWFKernelEventMonitor.m";
      __int16 v44 = 1024;
      int v45 = 185;
      __int16 v46 = 1024;
      int v47 = v24;
      __int16 v48 = 2082;
      v49 = v26;
      _os_log_send_and_compose_impl();
    }

    if (v10 == -1) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

  int v38 = 2;
  uint64_t v37 = 0x100000001LL;
  if (ioctl(v9, 0x800C6502uLL, &v37))
  {
    CWFGetOSLog();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      CWFGetOSLog();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v21 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v27 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    int v28 = *__error();
    v29 = __error();
    v30 = strerror(*v29);
    int v40 = 136447234;
    v41 = "-[CWFKernelEventMonitor init]";
    __int16 v42 = 2082;
    v43 = "CWFKernelEventMonitor.m";
    __int16 v44 = 1024;
    int v45 = 188;
    __int16 v46 = 1024;
    int v47 = v28;
    __int16 v48 = 2082;
    v49 = v30;
    goto LABEL_26;
  }

  dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1895F8B60], v10, 0LL, *((dispatch_queue_t *)v2 + 2));
  v12 = (void *)*((void *)v2 + 3);
  *((void *)v2 + 3) = v11;

  v13 = (dispatch_source_s *)*((void *)v2 + 3);
  if (!v13)
  {
    CWFGetOSLog();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      CWFGetOSLog();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v21 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v31 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    int v40 = 136446722;
    v41 = "-[CWFKernelEventMonitor init]";
    __int16 v42 = 2082;
    v43 = "CWFKernelEventMonitor.m";
    __int16 v44 = 1024;
    int v45 = 191;
LABEL_26:
    _os_log_send_and_compose_impl();
LABEL_27:

LABEL_28:
    close(v10);
LABEL_29:

    return 0LL;
  }

  uint64_t v14 = MEMORY[0x1895F87A8];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = sub_186470350;
  handler[3] = &unk_189E5C058;
  unsigned int v36 = v10;
  dispatch_source_set_cancel_handler(v13, handler);
  v15 = (dispatch_source_s *)*((void *)v2 + 3);
  v32[0] = v14;
  v32[1] = 3221225472LL;
  v32[2] = sub_186470358;
  v32[3] = &unk_189E5C080;
  unsigned int v34 = v10;
  v16 = (CWFKernelEventMonitor *)v2;
  v33 = v16;
  dispatch_source_set_event_handler(v15, v32);

  dispatch_activate(*((dispatch_object_t *)v2 + 3));
  return v16;
}

- (void)dealloc
{
  keventSource = self->_keventSource;
  if (keventSource) {
    dispatch_source_cancel((dispatch_source_t)keventSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CWFKernelEventMonitor;
  -[CWFKernelEventMonitor dealloc](&v4, sel_dealloc);
}

- (void)startEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186470A30;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186470ABC;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_186470B7C;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)interfaceFlagsWithInterfaceName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v8 = v3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  if (v3
    && objc_msgSend_length(v3, v4, v5, v6, v7)
    && (unint64_t)objc_msgSend_length(v8, v9, v10, v11, v12) <= 0x10
    && (int v13 = socket(30, 2, 0), v13 != -1))
  {
    int v15 = v13;
    close(v15);
    unint64_t v16 = (__int16)v19;
  }

  else
  {
    unint64_t v16 = 0LL;
  }

  return v16;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end