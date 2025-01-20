@interface SKStepWiFiPreflight
- (BOOL)checkWiFiAndReturnError:(id *)a3;
- (BOOL)preventAppleWiFi;
- (CUEnvironment)environment;
- (CUMessaging)skMessaging;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (SKSetupBase)skSetupObject;
- (SKStepWiFiPreflight)init;
- (id)skCompletionHandler;
- (void)activate;
- (void)dealloc;
- (void)setDispatchQueue:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPreventAppleWiFi:(BOOL)a3;
- (void)setSkCompletionHandler:(id)a3;
- (void)setSkMessaging:(id)a3;
- (void)setSkSetupObject:(id)a3;
@end

@implementation SKStepWiFiPreflight

- (SKStepWiFiPreflight)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKStepWiFiPreflight;
  v2 = -[SKStepWiFiPreflight init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_preventAppleWiFi = 1;
    v3->_ucat = (LogCategory *)&gLogCategory_SKStepWiFiPreflight;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SKStepWiFiPreflight;
  -[SKStepWiFiPreflight dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];

  LogCategoryReplaceF();
}

- (void)activate
{
  uint64_t v3 = MEMORY[0x1895CC3E8](self->_skCompletionHandler, a2);
  if (!v3)
  {
    CUFatalErrorF();
    JUMPOUT(0x1887BCAD0LL);
  }

  id v4 = (void *)v3;
  id v8 = 0LL;
  -[SKStepWiFiPreflight checkWiFiAndReturnError:](self, "checkWiFiAndReturnError:", &v8);
  id v5 = v8;
  uint64_t v6 = MEMORY[0x1895CC3E8](self->_skCompletionHandler);
  v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

- (BOOL)checkWiFiAndReturnError:(id *)a3
{
  int var0 = self->_ucat->var0;
  -[CUEnvironment objectForKeyedSubscript:](self->_environment, "objectForKeyedSubscript:", @"_wifiInfo");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetTypeID();
  CFGetTypedObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7) {
    v7 = (void *)WiFiCopyCurrentNetworkInfoEx();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (a3) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }

  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (CFDictionaryGetInt64())
  {
    if (Int64Ranged != 1)
    {
      uint64_t v10 = NSPrintF();
      if (v10)
      {
        v14 = (void *)v10;
        if (a3)
        {
          NSErrorF_safe();
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_27;
      }
    }
  }

  if (Int64Ranged >= 2)
  {
    if (a3) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }

  if (self->_preventAppleWiFi && [v8 isEqual:@"AppleWiFi"])
  {
    if (a3)
    {
LABEL_29:
      NSErrorF_safe();
      BOOL v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (CUEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (id)skCompletionHandler
{
  return self->_skCompletionHandler;
}

- (void)setSkCompletionHandler:(id)a3
{
}

- (CUMessaging)skMessaging
{
  return self->_skMessaging;
}

- (void)setSkMessaging:(id)a3
{
}

- (SKSetupBase)skSetupObject
{
  return (SKSetupBase *)objc_loadWeakRetained((id *)&self->_skSetupObject);
}

- (void)setSkSetupObject:(id)a3
{
}

- (BOOL)preventAppleWiFi
{
  return self->_preventAppleWiFi;
}

- (void)setPreventAppleWiFi:(BOOL)a3
{
  self->_preventAppleWiFi = a3;
}

- (void).cxx_destruct
{
}

@end