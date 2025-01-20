@interface DIClient2Controller_XPCHandler
- (BOOL)GUIAskForPassphraseWithEncryptionFrontend:(id)a3 error:(id *)a4;
- (BOOL)connectWithError:(id *)a3;
- (BOOL)createAndStoreInSystemKeychainWithCreator:(id)a3 account:(id)a4 error:(id *)a5;
- (BOOL)keychainUnlockWithEncryptionUnlocker:(id)a3 error:(id *)a4;
- (id)newAttachWithParams:(id)a3 error:(id *)a4;
- (id)remoteObjectInterface;
- (id)serviceName;
@end

@implementation DIClient2Controller_XPCHandler

- (id)serviceName
{
  return @"com.apple.diskimagescontroller";
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DIControllerProtocol);
}

- (BOOL)connectWithError:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DIClient2Controller_XPCHandler;
  BOOL v5 = -[DIBaseXPCHandler connectWithError:](&v7, "connectWithError:");
  if (v5)
  {
    else {
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (id)newAttachWithParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  objc_super v7 = objc_alloc_init(&OBJC_CLASS___DIController2ClientDelegate);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DIController2ClientProtocol));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  [v9 setExportedInterface:v8];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  [v10 setExportedObject:v7];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_10008683C;
  v17 = &unk_10017A420;
  objc_copyWeak(&v18, &location);
  [v11 attachWithParams:v6 reply:&v14];

  if (-[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a4, v14, v15, v16, v17)) {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2ClientDelegate deviceHandle](v7, "deviceHandle"));
  }
  else {
    v12 = 0LL;
  }
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v12;
}

- (BOOL)keychainUnlockWithEncryptionUnlocker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100086998;
  v10[3] = &unk_100183690;
  objc_copyWeak(&v12, &location);
  id v8 = v6;
  id v11 = v8;
  [v7 keychainUnlockWithEncryptionUnlocker:v8 reply:v10];

  LOBYTE(a4) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a4);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return (char)a4;
}

- (BOOL)GUIAskForPassphraseWithEncryptionFrontend:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100086B34;
  v10[3] = &unk_1001836B8;
  objc_copyWeak(&v12, &location);
  id v8 = v6;
  id v11 = v8;
  [v7 GUIAskForPassphraseWithEncryptionFrontend:v8 reply:v10];

  LOBYTE(a4) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a4);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return (char)a4;
}

- (BOOL)createAndStoreInSystemKeychainWithCreator:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100086CE4;
  v13[3] = &unk_1001836E0;
  objc_copyWeak(&v15, &location);
  id v11 = v8;
  id v14 = v11;
  [v10 createAndStoreInSystemKeychainWithCreator:v11 account:v9 reply:v13];

  LOBYTE(a5) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a5);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return (char)a5;
}

@end