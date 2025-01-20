@interface LSInstallProgressObserver
- (LSInstallProgressObserver)initWithConnection:(id)a3;
- (NSString)description;
- (NSXPCConnection)connection;
- (int)pid;
- (unint64_t)hash;
- (void)_lsPing:(id)a3 reply:(id)a4;
- (void)addObserver;
- (void)createInstallProgressForApplication:(id)a3 withPhase:(unint64_t)a4 andPublishingString:(id)a5 reply:(id)a6;
- (void)installationEndedForApplication:(id)a3 withState:(unint64_t)a4;
- (void)installationFailedForApplication:(id)a3 reply:(id)a4;
- (void)removeObserver;
- (void)sendNotification:(int)a3 forApplicationWithBundleIdentifier:(id)a4 completion:(id)a5;
- (void)sendNotification:(int)a3 forApplications:(id)a4 withPlugins:(BOOL)a5;
- (void)setConnection:(id)a3;
- (void)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 completion:(id)a5;
@end

@implementation LSInstallProgressObserver

- (LSInstallProgressObserver)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LSInstallProgressObserver;
  v5 = -[LSInstallProgressObserver init](&v8, sel_init);
  v6 = v5;
  if (v5) {
    -[LSInstallProgressObserver setConnection:](v5, "setConnection:", v4);
  }

  return v6;
}

- (void)addObserver
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  _LSProgressLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "LSInstallProgress: adding observer %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addObserver:self];
}

- (void)removeObserver
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  _LSProgressLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "LSInstallProgress: Removing observer %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 removeObserver:self];
}

- (void)_lsPing:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id))a4;
  id v7 = a3;
  _LSProgressLog();
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LSInstallProgressObserver _lsPing:reply:].cold.1(self, v8);
  }

  v6[2](v6, v7);
}

- (void)createInstallProgressForApplication:(id)a3 withPhase:(unint64_t)a4 andPublishingString:(id)a5 reply:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v12 createInstallProgressForApplication:v11 withPhase:a4 andPublishingString:v10 reply:v9];
}

- (void)sendNotification:(int)a3 forApplications:(id)a4 withPlugins:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  _LSProgressLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[LSInstallProgressObserver connection](self, "connection");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 67109890;
    v12[1] = [v10 processIdentifier];
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v5;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_DEFAULT,  "connection from %d sending notification %d for proxies (plugins %d) %@",  (uint8_t *)v12,  0x1Eu);
  }

  +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 sendNotification:v6 forAppProxies:v8 Plugins:v5 completion:0];
}

- (void)sendNotification:(int)a3 forApplicationWithBundleIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  -[LSInstallProgressObserver connection](self, "connection");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 _xpcConnection];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (_LSCheckEntitlementForXPCConnection( v11,  @"com.apple.private.coreservices.can-send-install-notifications"))
  {
    _LSProgressLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[LSInstallProgressObserver connection](self, "connection");
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      int v21 = [v13 processIdentifier];
      __int16 v22 = 1024;
      int v23 = v6;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "connection from %d sending notification %d for %@",  buf,  0x18u);
    }

    +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v19 = v8;
    [MEMORY[0x189603F18] arrayWithObjects:&v19 count:1];
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __92__LSInstallProgressObserver_sendNotification_forApplicationWithBundleIdentifier_completion___block_invoke;
    v17[3] = &unk_189D73B48;
    id v18 = v9;
    [v14 sendNotification:v6 forApps:v15 withPlugins:(v6 & 0xFFFFFFFE) == 4 completion:v17];
  }

  else
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[LSInstallProgressObserver sendNotification:forApplicationWithBundleIdentifier:completion:]",  338LL,  0LL);
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v16);
  }
}

uint64_t __92__LSInstallProgressObserver_sendNotification_forApplicationWithBundleIdentifier_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  -[LSInstallProgressObserver connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 _xpcConnection];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = _LSCheckEntitlementForXPCConnection(v12, @"com.apple.private.coreservices.can-send-install-notifications");

  if (!v13)
  {
    _LSProgressLog();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[LSInstallProgressObserver setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:].cold.1( self,  v17);
    }

    id v18 = (void *)*MEMORY[0x189607670];
    uint64_t v19 = -54LL;
    uint64_t v20 = 353LL;
    goto LABEL_10;
  }

  int v14 = (void *)objc_opt_class();
  __int16 v15 = (void *)objc_opt_class();
  if (!_LSIsDictionaryWithKeysAndValuesOfClass(v8, v14, v15))
  {
    _LSProgressLog();
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[LSInstallProgressObserver setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:].cold.2();
    }

    id v18 = (void *)*MEMORY[0x189607670];
    uint64_t v19 = -50LL;
    uint64_t v20 = 349LL;
LABEL_10:
    _LSMakeNSErrorImpl( v18,  v19,  (uint64_t)"-[LSInstallProgressObserver setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:]",  v20,  0LL);
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v16);
    goto LABEL_11;
  }

  +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setProgressProportionsByPhase:v8 forInstallOfApplicationWithIdentifier:v9 completion:v10];
LABEL_11:
}

- (void)installationEndedForApplication:(id)a3 withState:(unint64_t)a4
{
  id v5 = a3;
  +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 installationEndedForApplication:v5 withState:a4];
}

- (void)installationFailedForApplication:(id)a3 reply:(id)a4
{
  id v7 = (void (**)(id, uint64_t))a4;
  id v5 = a3;
  +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 installationFailedForApplication:v5];

  v7[2](v7, 1LL);
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int)pid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 processIdentifier];

  return v3;
}

- (NSString)description
{
  int v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LSInstallProgressObserver;
  -[LSInstallProgressObserver description](&v8, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [v3 stringWithFormat:@"%@ for pid: %d", v4, objc_msgSend(WeakRetained, "processIdentifier")];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_lsPing:(void *)a1 reply:(os_log_s *)a2 .cold.1(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 connection];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_183E58000, a2, v4, "Received connection ping from %@", v5);

  OUTLINED_FUNCTION_5_0();
}

- (void)setProgressProportionsByPhase:(void *)a1 forInstallOfApplicationWithIdentifier:(os_log_s *)a2 completion:.cold.1( void *a1,  os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [a1 connection];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109120;
  v4[1] = [v3 processIdentifier];
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "Refusing to set progress proportions for unentitled client %d",  (uint8_t *)v4,  8u);

  OUTLINED_FUNCTION_1();
}

- (void)setProgressProportionsByPhase:forInstallOfApplicationWithIdentifier:completion:.cold.2()
{
}

@end