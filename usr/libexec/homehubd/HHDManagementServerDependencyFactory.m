@interface HHDManagementServerDependencyFactory
- (id)createClientManagerWithQueue:(id)a3;
- (id)createListener;
@end

@implementation HHDManagementServerDependencyFactory

- (id)createListener
{
  return  -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.homehubd.manage");
}

- (id)createClientManagerWithQueue:(id)a3
{
  id v3 = a3;
  v4 = -[HHDClientManager initWithQueue:](objc_alloc(&OBJC_CLASS___HHDClientManager), "initWithQueue:", v3);

  return v4;
}

@end