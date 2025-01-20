@interface IAMWebProcessPlugIn
- (NSMapTable)contextControllersToLoadDelegates;
- (void)setContextControllersToLoadDelegates:(id)a3;
- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4;
- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4;
- (void)webProcessPlugIn:(id)a3 willDestroyBrowserContextController:(id)a4;
@end

@implementation IAMWebProcessPlugIn

- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToStrongObjectsMapTable",  a3,  a4));
  -[IAMWebProcessPlugIn setContextControllersToLoadDelegates:](self, "setContextControllersToLoadDelegates:", v5);
}

- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4
{
  id v5 = a4;
  v13 = objc_opt_new(&OBJC_CLASS___IAMWebProcessPlugInLoadDelegate);
  [v5 setLoadDelegate:v13];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:]( &OBJC_CLASS____WKRemoteObjectInterface,  "remoteObjectInterfaceWithProtocol:",  &OBJC_PROTOCOL___IAMWebProcessProxy));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _remoteObjectRegistry]);
  [v7 registerExportedObject:v13 interface:v6];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:]( &OBJC_CLASS____WKRemoteObjectInterface,  "remoteObjectInterfaceWithProtocol:",  &OBJC_PROTOCOL___IAMWebProcessDelegate));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 _remoteObjectRegistry]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteObjectProxyWithInterface:v8]);
  -[IAMWebProcessPlugInLoadDelegate setWebProcessDelegate:](v13, "setWebProcessDelegate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugInLoadDelegate webProcessDelegate](v13, "webProcessDelegate"));
  [v11 webProcessPlugInDidCreateBrowserContextController];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugIn contextControllersToLoadDelegates](self, "contextControllersToLoadDelegates"));
  [v12 setObject:v13 forKey:v5];
}

- (void)webProcessPlugIn:(id)a3 willDestroyBrowserContextController:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugIn contextControllersToLoadDelegates](self, "contextControllersToLoadDelegates"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v9 webProcessDelegate]);
  [v7 webProcessPlugInWillDestroyBrowserContextController];

  [v9 setWebProcessDelegate:0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IAMWebProcessPlugIn contextControllersToLoadDelegates](self, "contextControllersToLoadDelegates"));
  [v8 removeObjectForKey:v5];
}

- (NSMapTable)contextControllersToLoadDelegates
{
  return self->_contextControllersToLoadDelegates;
}

- (void)setContextControllersToLoadDelegates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end