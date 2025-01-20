@interface NESMFilterSessionStateIdle
- (NESMFilterSessionStateIdle)init;
- (void)enterWithSession:(id)a3;
- (void)handleStartMessage:(id)a3;
@end

@implementation NESMFilterSessionStateIdle

- (NESMFilterSessionStateIdle)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateIdle;
  return -[NESMFilterSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 1LL, 0LL);
}

- (void)enterWithSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateIdle;
  -[NESMFilterSessionState enterWithSession:](&v7, "enterWithSession:", a3);
  if (self) {
    id Property = objc_getProperty(self, v4, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([Property policySession]);
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10002EE70;
    v8[3] = &unk_1000BDAA0;
    v8[4] = v6;
    sub_10002BFE8((uint64_t)&OBJC_CLASS___NESMPolicyMasterSession, v8);
  }
}

- (void)handleStartMessage:(id)a3
{
  id v13 = a3;
  if (!self)
  {
    BOOL v12 = sub_100071F00(0LL, v4);
    id v9 = 0LL;
    if (v12) {
      goto LABEL_3;
    }
    [0 setLastStopReason:6];
    id v9 = 0LL;
LABEL_5:
    uint64_t v10 = 4LL;
    goto LABEL_6;
  }

  id Property = objc_getProperty(self, v4, 16LL, 1);
  BOOL v7 = sub_100071F00(Property, v6);
  id v9 = objc_getProperty(self, v8, 16LL, 1);
  if (!v7)
  {
    [v9 setLastStopReason:6];
    id v9 = objc_getProperty(self, v11, 16LL, 1);
    goto LABEL_5;
  }

@end