@interface KDeviceSet
- (KDeviceSet)init;
- (NSMutableSet)devices;
- (id)addDevice:(id)a3 registationData:(id)a4 app:(id)a5;
- (void)setDevices:(id)a3;
@end

@implementation KDeviceSet

- (KDeviceSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___KDeviceSet;
  v2 = -[KDeviceSet init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[KDeviceSet setDevices:](v2, "setDevices:", v3);

    v4 = v2;
  }

  return v2;
}

- (id)addDevice:(id)a3 registationData:(id)a4 app:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = -[KDevice initWithPushToken:registrationData:]( objc_alloc(&OBJC_CLASS___KDevice),  "initWithPushToken:registrationData:",  v10,  v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](self, "devices"));
  v13 = (KDevice *)objc_claimAutoreleasedReturnValue([v12 member:v11]);

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](self, "devices"));
    [v14 addObject:v11];

    v13 = v11;
  }

  -[KDevice addApplication:](v13, "addApplication:", v8);

  return v13;
}

- (NSMutableSet)devices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end