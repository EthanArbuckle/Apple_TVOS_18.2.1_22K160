@interface IXAppInstallObserverProtocolInterface
+ (id)interface;
+ (id)interfaceProtocol;
+ (id)new;
- (IXAppInstallObserverProtocolInterface)init;
@end

@implementation IXAppInstallObserverProtocolInterface

- (IXAppInstallObserverProtocolInterface)init
{
  result = (IXAppInstallObserverProtocolInterface *)_os_crash( "-[IXAppInstallObserverProtocolInterface init] unexpectedly called",  a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result = (id)_os_crash("+[IXAppInstallObserverProtocolInterface new] unexpectedly called", a2);
  __break(1u);
  return result;
}

+ (id)interface
{
  id v2 = a1;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&qword_1000E8FC8);
  if (!WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 interfaceProtocol]);
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  v4));

    [v2 configureInterface:WeakRetained];
    objc_storeWeak(&qword_1000E8FC8, WeakRetained);
  }

  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &OBJC_PROTOCOL___IXAppInstallObserverProtocol;
}

@end