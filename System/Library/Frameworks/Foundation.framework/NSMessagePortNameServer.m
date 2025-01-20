@interface NSMessagePortNameServer
+ (id)sharedInstance;
- (BOOL)registerPort:(id)a3 name:(id)a4;
- (BOOL)removePortForName:(id)a3;
- (NSPort)portForName:(NSString *)name;
- (NSPort)portForName:(NSString *)name host:(NSString *)host;
@end

@implementation NSMessagePortNameServer

+ (id)sharedInstance
{
  id result = (id)sharedInstance___NSMessagePortNameServerShared;
  if (!sharedInstance___NSMessagePortNameServerShared)
  {
    id result = (id)[objc_allocWithZone((Class)a1) init];
    sharedInstance___NSMessagePortNameServerShared = (uint64_t)result;
  }

  return result;
}

- (NSPort)portForName:(NSString *)name
{
  return (NSPort *)(id)[objc_allocWithZone((Class)NSMessagePort) initWithRemoteName:name];
}

- (NSPort)portForName:(NSString *)name host:(NSString *)host
{
  else {
    return -[NSMessagePortNameServer portForName:](self, "portForName:", name);
  }
}

- (BOOL)registerPort:(id)a3 name:(id)a4
{
  return [a3 setName:a4];
}

- (BOOL)removePortForName:(id)a3
{
  return 0;
}

@end