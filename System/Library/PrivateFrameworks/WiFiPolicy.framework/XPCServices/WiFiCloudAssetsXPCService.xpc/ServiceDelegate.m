@interface ServiceDelegate
- (BOOL)allowXPCConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)allowXPCConnection:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v7 = 0;
  id v6 = @"com.apple.wifi.cloudasset-access";
  if (v6)
  {
    id v5 = [location[0] valueForEntitlement:v6];
    char v7 = [v5 BOOLValue] & 1;
  }

  char v4 = v7;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  if (-[ServiceDelegate allowXPCConnection:](v11, "allowXPCConnection:", v9))
  {
    id v5 =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___WiFiCloudAssetsXPCServiceProtocol);
    objc_msgSend(v9, "setExportedInterface:");

    char v7 = objc_opt_new(&OBJC_CLASS___WCAXPCService);
    [v9 setExportedObject:v7];
    [v9 resume];
    char v12 = 1;
    objc_storeStrong((id *)&v7, 0LL);
  }

  else
  {
    NSLog(@"MISSING ENTITLEMENT, invalidating connection");
    [v9 invalidate];
    char v12 = 0;
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v12 & 1;
}

@end