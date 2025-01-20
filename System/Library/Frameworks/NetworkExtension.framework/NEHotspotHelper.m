@interface NEHotspotHelper
+ (BOOL)logoff:(NEHotspotNetwork *)network;
+ (BOOL)registerWithOptions:(NSDictionary *)options queue:(dispatch_queue_t)queue handler:(NEHotspotHelperHandler)handler;
+ (NSArray)supportedNetworkInterfaces;
@end

@implementation NEHotspotHelper

+ (BOOL)registerWithOptions:(NSDictionary *)options queue:(dispatch_queue_t)queue handler:(NEHotspotHelperHandler)handler
{
  v7 = options;
  v8 = queue;
  if (registerWithOptions_queue_handler__S_handler)
  {
    BOOL v9 = 0;
  }

  else
  {
    uint64_t v10 = [handler copy];
    v11 = (void *)registerWithOptions_queue_handler__S_handler;
    registerWithOptions_queue_handler__S_handler = v10;

    if (!MEMORY[0x18960D640] || (int v12 = CNPluginRegister()) == 0)
    {
      v13 = (void *)registerWithOptions_queue_handler__S_handler;
      registerWithOptions_queue_handler__S_handler = 0LL;

      int v12 = 0;
    }

    BOOL v9 = v12 != 0;
  }

  return v9;
}

+ (BOOL)logoff:(NEHotspotNetwork *)network
{
  v3 = network;
  if (MEMORY[0x18960D638]) {
    BOOL v4 = CNPluginLogoffNetwork() != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (NSArray)supportedNetworkInterfaces
{
  if (MEMORY[0x18960D630] && (v2 = (const __CFArray *)CNPluginCopySupportedInterfaces()) != 0LL)
  {
    v3 = v2;
    createHotspotNetworkArray(v2);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }

  else
  {
    BOOL v4 = 0LL;
  }

  return (NSArray *)v4;
}

void __53__NEHotspotHelper_registerWithOptions_queue_handler___block_invoke(uint64_t a1, const void *a2)
{
  v3 = objc_alloc(&OBJC_CLASS___NEHotspotHelperCommand);
  if (v3)
  {
    v9.receiver = v3;
    v9.super_class = (Class)&OBJC_CLASS___NEHotspotHelperCommand;
    BOOL v4 = objc_msgSendSuper2(&v9, sel_init);
    v5 = v4;
    if (v4)
    {
      v7 = v4;
      if (a2)
      {
        CFRetain(a2);
        v5 = v7;
      }

      v6 = (const void *)v5[1];
      if (v6)
      {
        CFRelease(v6);
        v5 = v7;
      }

      v5[1] = a2;
    }
  }

  else
  {
    v5 = 0LL;
  }

  id v8 = v5;
  (*(void (**)(void))(registerWithOptions_queue_handler__S_handler + 16))();
}

@end