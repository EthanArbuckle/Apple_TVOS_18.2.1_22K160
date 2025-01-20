@interface NSUserDefaults
- (TVPABluetoothRemoteUsage)tvpa_remoteUsage;
- (void)tvpa_setRemoteUsage:(id)a3;
@end

@implementation NSUserDefaults

- (TVPABluetoothRemoteUsage)tvpa_remoteUsage
{
  v9[2] = self;
  v9[1] = (id)a2;
  v9[0] = 0LL;
  id v8 = -[NSUserDefaults objectForKey:](self, "objectForKey:", @"RemoteUsage");
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id location = sub_10001B0D8(v8, v2);
  if (location)
  {
    v3 = -[TVPABluetoothRemoteUsage initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___TVPABluetoothRemoteUsage),  "initWithDictionaryRepresentation:",  location);
    id v4 = v9[0];
    v9[0] = v3;
  }

  id v6 = v9[0];
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(v9, 0LL);
  return (TVPABluetoothRemoteUsage *)v6;
}

- (void)tvpa_setRemoteUsage:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] dictionaryRepresentation];
  -[NSUserDefaults setObject:forKey:](v5, "setObject:forKey:", v3, @"RemoteUsage");
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

@end