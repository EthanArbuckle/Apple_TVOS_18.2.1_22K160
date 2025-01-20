@interface NESMFilterSessionStateRunning
- (BOOL)handleSleep;
- (NESMFilterSessionStateRunning)init;
- (void)enterWithSession:(id)a3;
- (void)handleUpdateConfiguration;
- (void)handleWakeup;
@end

@implementation NESMFilterSessionStateRunning

- (NESMFilterSessionStateRunning)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateRunning;
  return -[NESMFilterSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 3LL, 0LL);
}

- (void)enterWithSession:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateRunning;
  -[NESMFilterSessionState enterWithSession:](&v9, "enterWithSession:", a3);
  if (self) {
    id Property = objc_getProperty(self, v4, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([Property server]);
  if (self) {
    id v8 = objc_getProperty(self, v6, 16LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  [v7 requestInstallForSession:v8 withParentSession:0 exclusive:1];
}

- (BOOL)handleSleep
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateRunning;
  -[NESMFilterSessionState handleSleep](&v12, "handleSleep");
  if (self)
  {
    id Property = objc_getProperty(self, v3, 16LL, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 400LL, 1);
    }
    id v6 = Property;
    sub_100016378(v6);

    id v8 = objc_getProperty(self, v7, 16LL, 1);
    if (v8) {
      id v8 = objc_getProperty(v8, v9, 408LL, 1);
    }
  }

  else
  {
    id v8 = 0LL;
  }

  id v10 = v8;
  sub_100016378(v10);

  return 1;
}

- (void)handleWakeup
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateRunning;
  -[NESMFilterSessionState handleWakeup](&v11, "handleWakeup");
  if (self)
  {
    id Property = objc_getProperty(self, v3, 16LL, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 400LL, 1);
    }
    id v6 = Property;
    sub_10001663C(v6);

    id v8 = objc_getProperty(self, v7, 16LL, 1);
    if (v8) {
      id v8 = objc_getProperty(v8, v9, 408LL, 1);
    }
  }

  else
  {
    id v8 = 0LL;
  }

  id v10 = v8;
  sub_10001663C(v10);
}

- (void)handleUpdateConfiguration
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateRunning;
  -[NESMFilterSessionState handleUpdateConfiguration](&v18, "handleUpdateConfiguration");
  if (self)
  {
    id Property = objc_getProperty(self, v3, 16LL, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 400LL, 1);
    }
    id v6 = Property;
    id v8 = objc_msgSend(objc_getProperty(self, v7, 16, 1), "configuration");
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    sub_100016324(v6, v9);

    id v11 = objc_getProperty(self, v10, 16LL, 1);
    if (v11) {
      id v11 = objc_getProperty(v11, v12, 408LL, 1);
    }
    id v13 = v11;
    id v15 = objc_getProperty(self, v14, 16LL, 1);
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([0 configuration]);
    sub_100016324(0LL, v17);

    id v13 = 0LL;
    id v15 = 0LL;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 configuration]);
  sub_100016324(v13, v16);
}

@end