@interface IOUSBHostInterestNotifier
- (BOOL)destroyed;
- (IONotificationPort)notificationPortRef;
- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 callback:(void *)a4;
- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 matchingDictionary:(id)a4 callback:(void *)a5;
- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 service:(unsigned int)a4 callback:(void *)a5;
- (NSObject)owner;
- (NSRecursiveLock)lock;
- (OS_dispatch_queue)queue;
- (unsigned)matchingIterator;
- (unsigned)notifier;
- (unsigned)service;
- (void)callback;
- (void)dealloc;
- (void)destroy;
- (void)setCallback:(void *)a3;
- (void)setDestroyed:(BOOL)a3;
- (void)setLock:(id)a3;
- (void)setMatchingIterator:(unsigned int)a3;
- (void)setNotificationPortRef:(IONotificationPort *)a3;
- (void)setNotifier:(unsigned int)a3;
- (void)setOwner:(id)a3;
- (void)setQueue:(id)a3;
- (void)setService:(unsigned int)a3;
@end

@implementation IOUSBHostInterestNotifier

- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 callback:(void *)a4
{
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___IOUSBHostInterestNotifier;
  id v5 = a3;
  v6 = -[IOUSBHostInterestNotifier init](&v43, sel_init);
  -[IOUSBHostInterestNotifier setDestroyed:](v6, "setDestroyed:", 0LL);
  -[IOUSBHostInterestNotifier setOwner:](v6, "setOwner:", v5);

  -[IOUSBHostInterestNotifier setCallback:](v6, "setCallback:", a4);
  id v7 = objc_alloc_init(MEMORY[0x1896079F8]);
  -[IOUSBHostInterestNotifier setLock:](v6, "setLock:", v7);
  v8 = -[IOUSBHostInterestNotifier lock](v6, "lock");
  if (!v8)
  {
    BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v18) {
      -[IOUSBHostInterestNotifier initWithOwner:callback:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_11;
  }

  v9 = (void *)NSString;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = [v9 stringWithFormat:@"%@.%@", @"com.apple.iokit.usb.framework.IOUSBHost", v11, v43.receiver, v43.super_class];
  dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
  -[IOUSBHostInterestNotifier setQueue:](v6, "setQueue:", v13);
  v14 = -[IOUSBHostInterestNotifier queue](v6, "queue");
  if (!v14)
  {
    BOOL v26 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v26) {
      -[IOUSBHostInterestNotifier initWithOwner:callback:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_11;
  }

  -[IOUSBHostInterestNotifier setNotificationPortRef:]( v6,  "setNotificationPortRef:",  IONotificationPortCreate(*MEMORY[0x1896086A8]));
  if (!-[IOUSBHostInterestNotifier notificationPortRef](v6, "notificationPortRef"))
  {
    BOOL v34 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v34) {
      -[IOUSBHostInterestNotifier initWithOwner:callback:].cold.3(v34, v35, v36, v37, v38, v39, v40, v41);
    }
LABEL_11:
    -[IOUSBHostInterestNotifier destroy](v6, "destroy");
    v17 = 0LL;
    goto LABEL_12;
  }

  v15 = -[IOUSBHostInterestNotifier notificationPortRef](v6, "notificationPortRef");
  -[IOUSBHostInterestNotifier queue](v6, "queue");
  v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  IONotificationPortSetDispatchQueue(v15, v16);

  v17 = v6;
LABEL_12:

  return v17;
}

- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 service:(unsigned int)a4 callback:(void *)a5
{
  uint64_t v5 = *(void *)&a4;
  v6 = -[IOUSBHostInterestNotifier initWithOwner:callback:](self, "initWithOwner:callback:", a3, a5);
  id v7 = v6;
  if (!(_DWORD)v5)
  {
LABEL_6:
    -[IOUSBHostInterestNotifier destroy](v7, "destroy");
    v8 = 0LL;
    goto LABEL_7;
  }

  -[IOUSBHostInterestNotifier setService:](v6, "setService:", v5);
  if (!-[IOUSBHostInterestNotifier notifier](v7, "notifier"))
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v9) {
      -[IOUSBHostInterestNotifier initWithOwner:service:callback:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_6;
  }

  v8 = v7;
LABEL_7:

  return v8;
}

- (IOUSBHostInterestNotifier)initWithOwner:(id)a3 matchingDictionary:(id)a4 callback:(void *)a5
{
  id v8 = a4;
  BOOL v9 = -[IOUSBHostInterestNotifier initWithOwner:callback:](self, "initWithOwner:callback:", a3, a5);
  uint64_t v10 = -[IOUSBHostInterestNotifier notificationPortRef](v9, "notificationPortRef");
  uint64_t v11 = (const __CFDictionary *)v8;
  IOServiceAddMatchingNotification( v10,  "IOServiceFirstMatch",  v11,  (IOServiceMatchingCallback)_internalMatchingCallback,  v9,  &v9->_matchingIterator);
  if (-[IOUSBHostInterestNotifier matchingIterator](v9, "matchingIterator"))
  {
    uint64_t v12 = IOIteratorNext(-[IOUSBHostInterestNotifier matchingIterator](v9, "matchingIterator"));
    if ((_DWORD)v12)
    {
      -[IOUSBHostInterestNotifier setService:](v9, "setService:", v12);
      IOObjectRelease(-[IOUSBHostInterestNotifier matchingIterator](v9, "matchingIterator"));
      -[IOUSBHostInterestNotifier setMatchingIterator:](v9, "setMatchingIterator:", 0LL);
    }

    uint64_t v13 = v9;
  }

  else
  {
    BOOL v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v14) {
      -[IOUSBHostInterestNotifier initWithOwner:matchingDictionary:callback:].cold.1( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21);
    }
    -[IOUSBHostInterestNotifier destroy](v9, "destroy");
    uint64_t v13 = 0LL;
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IOUSBHostInterestNotifier;
  -[IOUSBHostInterestNotifier dealloc](&v3, sel_dealloc);
}

- (void)destroy
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[IOUSBHostInterestNotifier lock](self, "lock");
    [v4 lock];

    if (!-[IOUSBHostInterestNotifier destroyed](self, "destroyed"))
    {
      -[IOUSBHostInterestNotifier setDestroyed:](self, "setDestroyed:", 1LL);
      if (-[IOUSBHostInterestNotifier service](self, "service")) {
        -[IOUSBHostInterestNotifier setService:](self, "setService:", 0LL);
      }
      if (-[IOUSBHostInterestNotifier notificationPortRef](self, "notificationPortRef"))
      {
        IONotificationPortDestroy(-[IOUSBHostInterestNotifier notificationPortRef](self, "notificationPortRef"));
        -[IOUSBHostInterestNotifier setNotificationPortRef:](self, "setNotificationPortRef:", 0LL);
      }

      -[IOUSBHostInterestNotifier queue](self, "queue");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        uint64_t v10 = 0LL;
        uint64_t v11 = &v10;
        uint64_t v12 = 0x3032000000LL;
        uint64_t v13 = __Block_byref_object_copy__0;
        BOOL v14 = __Block_byref_object_dispose__0;
        uint64_t v15 = (IOUSBHostInterestNotifier *)0xAAAAAAAAAAAAAAAALL;
        v6 = self;
        uint64_t v15 = v6;
        [(id)v11[5] queue];
        id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __36__IOUSBHostInterestNotifier_destroy__block_invoke;
        block[3] = &unk_18A274950;
        block[4] = &v10;
        dispatch_async(v7, block);

        -[IOUSBHostInterestNotifier setQueue:](v6, "setQueue:", 0LL);
        _Block_object_dispose(&v10, 8);
      }
    }

    -[IOUSBHostInterestNotifier lock](self, "lock");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 unlock];
  }

  else
  {
    -[IOUSBHostInterestNotifier setDestroyed:](self, "setDestroyed:", 1LL);
  }

void __36__IOUSBHostInterestNotifier_destroy__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  objc_super v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;
}

- (void)setService:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  -[IOUSBHostInterestNotifier lock](self, "lock");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 lock];

  if (-[IOUSBHostInterestNotifier notifier](self, "notifier"))
  {
    IOObjectRelease(-[IOUSBHostInterestNotifier notifier](self, "notifier"));
    -[IOUSBHostInterestNotifier setNotifier:](self, "setNotifier:", 0LL);
  }

  if (-[IOUSBHostInterestNotifier service](self, "service")) {
    IOObjectRelease(-[IOUSBHostInterestNotifier service](self, "service"));
  }
  self->_service = a3;
  if (-[IOUSBHostInterestNotifier service](self, "service")
    && !-[IOUSBHostInterestNotifier destroyed](self, "destroyed"))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      v15[0] = 67109120;
      v15[1] = a3;
      _os_log_impl( &dword_18874A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "IOUSBHostInterfaceNotifier: adding interest for %d\n",  (uint8_t *)v15,  8u);
    }

    IOObjectRetain(-[IOUSBHostInterestNotifier service](self, "service"));
    IOServiceAddInterestNotification( -[IOUSBHostInterestNotifier notificationPortRef](self, "notificationPortRef"),  -[IOUSBHostInterestNotifier service](self, "service"),  "IOGeneralInterest",  (IOServiceInterestCallback)_internalInterestCallback_0,  self,  &self->_notifier);
    if (!-[IOUSBHostInterestNotifier notifier](self, "notifier"))
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v6) {
        -[IOUSBHostInterestNotifier setService:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }

  -[IOUSBHostInterestNotifier lock](self, "lock");
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 unlock];
}

- (NSObject)owner
{
  return objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
}

- (BOOL)destroyed
{
  return self->_destroyed;
}

- (void)setDestroyed:(BOOL)a3
{
  self->_destroyed = a3;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IONotificationPort)notificationPortRef
{
  return self->_notificationPortRef;
}

- (void)setNotificationPortRef:(IONotificationPort *)a3
{
  self->_notificationPortRef = a3;
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (unsigned)service
{
  return self->_service;
}

- (unsigned)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(unsigned int)a3
{
  self->_notifier = a3;
}

- (unsigned)matchingIterator
{
  return self->_matchingIterator;
}

- (void)setMatchingIterator:(unsigned int)a3
{
  self->_matchingIterator = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithOwner:(uint64_t)a3 callback:(uint64_t)a4 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithOwner:(uint64_t)a3 callback:(uint64_t)a4 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithOwner:(uint64_t)a3 callback:(uint64_t)a4 .cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithOwner:(uint64_t)a3 service:(uint64_t)a4 callback:(uint64_t)a5 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithOwner:(uint64_t)a3 matchingDictionary:(uint64_t)a4 callback:(uint64_t)a5 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)setService:(uint64_t)a3 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end