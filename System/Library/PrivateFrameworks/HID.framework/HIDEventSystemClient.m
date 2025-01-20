@interface HIDEventSystemClient
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (HIDEventSystemClient)initWithType:(int64_t)a3;
- (HIDEventSystemClient)initWithType:(int64_t)a3 andAttributes:(id)a4;
- (NSArray)services;
- (__IOHIDEventSystemClient)client;
- (id)description;
- (id)propertyForKey:(id)a3;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)setCancelHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventFilterHandler:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setMatching:(id)a3;
- (void)setPropertyChangedHandler:(id)a3 matching:(id)a4;
- (void)setResetHandler:(id)a3;
- (void)setServiceNotificationHandler:(id)a3;
@end

@implementation HIDEventSystemClient

- (HIDEventSystemClient)initWithType:(int64_t)a3
{
  return -[HIDEventSystemClient initWithType:andAttributes:](self, "initWithType:andAttributes:", a3, 0LL);
}

- (HIDEventSystemClient)initWithType:(int64_t)a3 andAttributes:(id)a4
{
  id v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___HIDEventSystemClient;
  v6 = -[HIDEventSystemClient init](&v10, sel_init);
  if (v6 && (uint64_t v7 = IOHIDEventSystemClientCreateWithType(), (v6->_client = (__IOHIDEventSystemClient *)v7) != 0LL)) {
    v8 = v6;
  }
  else {
    v8 = 0LL;
  }

  return v8;
}

- (void)dealloc
{
  client = self->_client;
  if (client) {
    CFRelease(client);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HIDEventSystemClient;
  -[HIDEventSystemClient dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_client];
}

- (id)propertyForKey:(id)a3
{
  return (id)(id)IOHIDEventSystemClientCopyProperty(self->_client, (CFStringRef)a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return IOHIDEventSystemClientSetProperty(self->_client, (CFStringRef)a4, a3) != 0;
}

- (void)setMatching:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[HIDManager setInputElementMatching:].cold.1(&v4, v5);
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v3 count];
    IOHIDEventSystemClientSetMatching();
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v3 count];
      IOHIDEventSystemClientSetMatchingMultiple();
    }
  }
}

- (NSArray)services
{
  return (NSArray *)IOHIDEventSystemClientCopyServices(self->_client);
}

- (void)setCancelHandler:(id)a3
{
  id aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_activated) {
    -[HIDEventSystemClient setCancelHandler:].cold.1();
  }
  uint64_t v4 = _Block_copy(aBlock);
  id cancelHandler = self->_cancelHandler;
  self->_id cancelHandler = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setEventHandler:(id)a3
{
  id aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_eventHandler) {
    -[HIDEventSystemClient setEventHandler:].cold.1();
  }
  uint64_t v4 = _Block_copy(aBlock);
  id eventHandler = self->_eventHandler;
  self->_id eventHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDEventSystemClientRegisterEventCallback();
}

- (void)setResetHandler:(id)a3
{
  id aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_resetHandler) {
    -[HIDEventSystemClient setResetHandler:].cold.1();
  }
  uint64_t v4 = _Block_copy(aBlock);
  id resetHandler = self->_resetHandler;
  self->_id resetHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDEventSystemClientRegisterResetCallback();
}

- (void)setEventFilterHandler:(id)a3
{
  id aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_filterHandler) {
    -[HIDEventSystemClient setEventFilterHandler:].cold.1();
  }
  uint64_t v4 = _Block_copy(aBlock);
  id filterHandler = self->_filterHandler;
  self->_id filterHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDEventSystemClientRegisterEventFilterCallback();
}

- (void)setServiceNotificationHandler:(id)a3
{
  id aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_serviceHandler) {
    -[HIDEventSystemClient setServiceNotificationHandler:].cold.1();
  }
  uint64_t v4 = _Block_copy(aBlock);
  id serviceHandler = self->_serviceHandler;
  self->_id serviceHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDEventSystemClientRegisterDeviceMatchingCallback();
}

- (void)setPropertyChangedHandler:(id)a3 matching:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[HIDManager setInputElementMatching:].cold.1(&v19, v21);
    }
  }

  os_unfair_recursive_lock_lock_with_options();
  if (self->_propertyChangedHandler) {
    -[HIDEventSystemClient setPropertyChangedHandler:matching:].cold.1();
  }
  v8 = _Block_copy(v6);
  id propertyChangedHandler = self->_propertyChangedHandler;
  self->_id propertyChangedHandler = v8;

  os_unfair_recursive_lock_unlock();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    IOHIDEventSystemClientRegisterPropertyChangedCallback();
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          uint64_t v14 = 0LL;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            IOHIDEventSystemClientRegisterPropertyChangedCallback();
            ++v14;
          }

          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }

        while (v12);
      }
    }
  }
}

- (void)activate
{
  self->_activated = 1;
  os_unfair_recursive_lock_unlock();
  IOHIDEventSystemClientSetCancelHandler();
  IOHIDEventSystemClientActivate();
}

void __32__HIDEventSystemClient_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 56LL);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0LL;
  }

- (void)cancel
{
}

- (__IOHIDEventSystemClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

- (void)setCancelHandler:.cold.1()
{
}

- (void)setEventHandler:.cold.1()
{
}

- (void)setResetHandler:.cold.1()
{
}

- (void)setEventFilterHandler:.cold.1()
{
}

- (void)setServiceNotificationHandler:.cold.1()
{
}

- (void)setPropertyChangedHandler:matching:.cold.1()
{
}

@end