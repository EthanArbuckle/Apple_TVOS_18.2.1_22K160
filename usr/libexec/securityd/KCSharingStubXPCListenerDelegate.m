@interface KCSharingStubXPCListenerDelegate
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (KCSharingStubXPCListenerDelegate)init;
@end

@implementation KCSharingStubXPCListenerDelegate

- (KCSharingStubXPCListenerDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___KCSharingStubXPCListenerDelegate;
  v2 = -[KCSharingStubXPCListenerDelegate init](&v6, "init");
  if (v2)
  {
    v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.security.kcsharing");
    listener = v2->_listener;
    v2->_listener = v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener activate](v2->_listener, "activate");
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1002DE8A8 != -1) {
    dispatch_once(&qword_1002DE8A8, &stru_100284168);
  }
  return (id)qword_1002DE8B0;
}

@end