@interface HIDVirtualEventService
- (BOOL)dispatchEvent:(id)a3;
- (HIDEventSystemClient)client;
- (HIDServiceClient)serviceClient;
- (HIDVirtualEventService)init;
- (HIDVirtualEventServiceDelegate)delegate;
- (OS_dispatch_queue)queue;
- (id)description;
- (unint64_t)serviceID;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)setCancelHandler:(id)a3;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceClient:(id)a3;
@end

@implementation HIDVirtualEventService

- (HIDVirtualEventService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HIDVirtualEventService;
  v2 = -[HIDVirtualEventService init](&v6, sel_init);
  if (v2)
  {
    v3 = -[HIDEventSystemClient initWithType:](objc_alloc(&OBJC_CLASS___HIDEventSystemClient), "initWithType:", 4LL);
    -[HIDVirtualEventService setClient:](v2, "setClient:", v3);

    -[HIDVirtualEventService client](v2, "client");
    v4 = (HIDVirtualEventService *)objc_claimAutoreleasedReturnValue();

    if (v4) {
      v4 = v2;
    }
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"<HIDVirtualEventService serviceID:0x%llx>",  -[HIDVirtualEventService serviceID](self, "serviceID"));
}

- (void)setCancelHandler:(id)a3
{
  id v4 = a3;
  -[HIDVirtualEventService client](self, "client");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setCancelHandler:v4];
}

- (void)setDispatchQueue:(id)a3
{
  id v5 = a3;
  -[HIDVirtualEventService client](self, "client");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setDispatchQueue:v5];

  -[HIDVirtualEventService setQueue:](self, "setQueue:", v5);
}

- (void)activate
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

void __34__HIDVirtualEventService_activate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained delegate];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 notification:11 withProperty:0 forService:v3];

    id WeakRetained = v3;
  }
}

- (void)cancel
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

- (void)dealloc
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (BOOL)dispatchEvent:(id)a3
{
  id v4 = a3;
  -[HIDVirtualEventService serviceClient](self, "serviceClient");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HIDVirtualEventService serviceClient](self, "serviceClient");
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = IOHIDVirtualServiceClientDispatchEvent() != 0;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)serviceID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    return 0LL;
  }
  -[HIDVirtualEventService serviceClient](self, "serviceClient");
  id v4 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
  IOHIDServiceClientGetRegistryID(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  unint64_t v6 = [v5 unsignedLongLongValue];
  return v6;
}

- (HIDVirtualEventServiceDelegate)delegate
{
  return (HIDVirtualEventServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (HIDEventSystemClient)client
{
  return (HIDEventSystemClient *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setClient:(id)a3
{
}

- (HIDServiceClient)serviceClient
{
  return (HIDServiceClient *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setServiceClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end