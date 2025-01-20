@interface IXClientDelegateProtocolInterface
+ (id)interface;
+ (id)interfaceProtocol;
+ (id)new;
- (IXClientDelegateProtocolInterface)init;
@end

@implementation IXClientDelegateProtocolInterface

- (IXClientDelegateProtocolInterface)init
{
  result = (IXClientDelegateProtocolInterface *)_os_crash( "-[IXClientDelegateProtocolInterface init] unexpectedly called",  a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result = (id)_os_crash("+[IXClientDelegateProtocolInterface new] unexpectedly called", a2);
  __break(1u);
  return result;
}

+ (id)interface
{
  id v2 = a1;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&qword_1000E8FE8);
  if (!WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 interfaceProtocol]);
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  v4));

    [v2 configureInterface:WeakRetained];
    objc_storeWeak(&qword_1000E8FE8, WeakRetained);
  }

  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &OBJC_PROTOCOL___IXClientDelegateProtocol;
}

@end