@interface NESMVPNSessionStatePreparingNetwork
- (NESMVPNSessionStatePreparingNetwork)init;
- (void)enterWithSession:(id)a3;
- (void)handleNetworkPrepareResult:(id)a3;
- (void)handleTimeout;
@end

@implementation NESMVPNSessionStatePreparingNetwork

- (NESMVPNSessionStatePreparingNetwork)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStatePreparingNetwork;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 2LL, 0LL);
}

- (void)enterWithSession:(id)a3
{
  id v4 = a3;
  kdebug_trace(726990908LL, 0LL, 0LL, 0LL, 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStatePreparingNetwork;
  -[NESMVPNSessionState enterWithSession:](&v5, "enterWithSession:", v4);
  [v4 prepareNetwork];
}

- (void)handleNetworkPrepareResult:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStatePreparingNetwork;
  -[NESMVPNSessionState handleNetworkPrepareResult:](&v30, "handleNetworkPrepareResult:");
  if (!a3)
  {
    if (self)
    {
      id Property = objc_getProperty(self, v5, 16LL, 1);
      uint64_t v26 = 4LL;
LABEL_20:
      [Property setLastStopReason:v26];
      id v24 = objc_getProperty(self, v27, 16LL, 1);
LABEL_21:
      uint64_t v25 = 5LL;
      goto LABEL_22;
    }

    uint64_t v29 = 4LL;
LABEL_31:
    [0 setLastStopReason:v29];
    id v24 = 0LL;
    goto LABEL_21;
  }

  kdebug_trace(726990920LL, 0LL, 0LL, 0LL, 0LL);
  if (self)
  {
    unsigned int v7 = objc_msgSend(objc_getProperty(self, v6, 16, 1), "initializePlugins");
    id Property = objc_getProperty(self, v8, 16LL, 1);
    if (v7) {
      goto LABEL_4;
    }
    uint64_t v26 = 6LL;
    goto LABEL_20;
  }

  unsigned __int8 v28 = [0 initializePlugins];
  id Property = 0LL;
  if ((v28 & 1) == 0)
  {
    uint64_t v29 = 6LL;
    goto LABEL_31;
  }

- (void)handleTimeout
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStatePreparingNetwork;
  -[NESMVPNSessionState handleTimeout](&v6, "handleTimeout");
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v3, 16, 1), "setLastStopReason:", 41);
    id Property = objc_getProperty(self, v4, 16LL, 1);
  }

  else
  {
    [0 setLastStopReason:41];
    id Property = 0LL;
  }

  [Property setState:5];
}

@end