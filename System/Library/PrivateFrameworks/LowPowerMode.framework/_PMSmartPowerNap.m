@interface _PMSmartPowerNap
- (BOOL)connection_interrupted;
- (NSString)identifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)callback_queue;
- (_PMSmartPowerNap)init;
- (id)callback;
- (unsigned)current_state;
- (unsigned)state;
- (unsigned)syncState;
- (void)dealloc;
- (void)init;
- (void)reRegister;
- (void)registerWithCallback:(id)a3 callback:(id)a4;
- (void)registerWithIdentifier:(id)a3;
- (void)setCallback:(id)a3;
- (void)setCallback_queue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnection_interrupted:(BOOL)a3;
- (void)setCurrent_state:(unsigned __int8)a3;
- (void)setIdentifier:(id)a3;
- (void)setSPNMotionAlarmStartThreshold:(unsigned int)a3;
- (void)setSPNMotionAlarmThreshold:(unsigned int)a3;
- (void)setSPNReentryCoolOffPeriod:(unsigned int)a3;
- (void)setSPNReentryDelaySeconds:(unsigned int)a3;
- (void)setSPNRequeryDelta:(unsigned int)a3;
- (void)setState:(unsigned __int8)a3;
- (void)syncStateWithHandler:(id)a3;
- (void)unregister;
- (void)unregisterWithIdentifier:(id)a3;
- (void)updateState:(unsigned __int8)a3;
@end

@implementation _PMSmartPowerNap

- (_PMSmartPowerNap)init
{
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS____PMSmartPowerNap;
  v2 = -[_PMSmartPowerNap init](&v40, sel_init);
  os_log_t v3 = os_log_create("com.apple.powerd", "smartpowernap");
  v4 = (void *)smartpowernap_log;
  smartpowernap_log = (uint64_t)v3;

  if (!v2) {
    return v2;
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.powerd.smartpowernap" options:4096];
  connection = v2->_connection;
  v2->_connection = (NSXPCConnection *)v5;

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6F6760];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v7);

  -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6F67D0];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v8);

  objc_initWeak(&location, v2);
  v9 = v2->_connection;
  uint64_t v10 = MEMORY[0x1895F87A8];
  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __24___PMSmartPowerNap_init__block_invoke;
  v37[3] = &unk_18A13E8B0;
  objc_copyWeak(&v38, &location);
  -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v37);
  v11 = v2->_connection;
  v35[0] = v10;
  v35[1] = 3221225472LL;
  v35[2] = __24___PMSmartPowerNap_init__block_invoke_21;
  v35[3] = &unk_18A13E8B0;
  objc_copyWeak(&v36, &location);
  -[NSXPCConnection setInvalidationHandler:](v11, "setInvalidationHandler:", v35);
  -[NSXPCConnection resume](v2->_connection, "resume");
  v2->_connection_interrupted = 0;
  uint64_t v12 = smartpowernap_log;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = (os_log_s *)v12;
LABEL_7:
      _os_log_impl(&dword_187DA9000, v13, OS_LOG_TYPE_DEFAULT, "Initialized connection", buf, 2u);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v13 = (os_log_s *)MEMORY[0x1895F8DA0];
    goto LABEL_7;
  }

  v14 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
  id v15 = MEMORY[0x1895F8AE0];
  handler[0] = v10;
  handler[1] = 3221225472LL;
  handler[2] = __24___PMSmartPowerNap_init__block_invoke_23;
  handler[3] = &unk_18A13E8D8;
  objc_copyWeak(&v33, &location);
  uint64_t v16 = notify_register_dispatch( "com.apple.system.powermanagement.assertionresync",  (int *)&init_resync_token,  v14,  handler);

  if ((_DWORD)v16)
  {
    v17 = (os_log_s *)smartpowernap_log;
    if (smartpowernap_log)
    {
      if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_ERROR)) {
        -[_PMSmartPowerNap init].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      -[_PMSmartPowerNap init].cold.1(v16, v24, v25, v26, v27, v28, v29, v30);
    }
  }

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PMSmartPowerNap;
  -[_PMSmartPowerNap dealloc](&v3, sel_dealloc);
}

- (void)registerWithCallback:(id)a3 callback:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v6 = (OS_dispatch_queue *)a3;
  id v7 = a4;
  pid_t v8 = getpid();
  proc_name(v8, buffer, 0x80u);
  v9 = (void *)NSString;
  [MEMORY[0x189607AB8] UUID];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 UUIDString];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringWithFormat:@"%@:%s", v11, buffer];
  uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v12;

  -[_PMSmartPowerNap registerWithIdentifier:](self, "registerWithIdentifier:", self->_identifier);
  callback_queue = self->_callback_queue;
  self->_callback_queue = v6;
  id v15 = v6;

  uint64_t v16 = (void *)MEMORY[0x1895B6E18](v7);
  id callback = self->_callback;
  self->_id callback = v16;
}

- (unsigned)state
{
  return self->_current_state;
}

- (void)registerWithIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = (os_log_s *)smartpowernap_log;
  if (v4)
  {
    if (smartpowernap_log)
    {
      if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v15 = 138412290;
        *(void *)&v15[4] = v4;
        v6 = v5;
LABEL_9:
        _os_log_impl(&dword_187DA9000, v6, OS_LOG_TYPE_DEFAULT, "registerWithIdentifier %@", v15, 0xCu);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v15 = 138412290;
      *(void *)&v15[4] = v4;
      v6 = (os_log_s *)MEMORY[0x1895F8DA0];
      goto LABEL_9;
    }
    v14 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global,  *(_OWORD *)v15);
    [v14 registerWithIdentifier:v4];

    goto LABEL_11;
  }

  if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_FAULT)) {
    -[_PMSmartPowerNap registerWithIdentifier:].cold.1(v5, v7, v8, v9, v10, v11, v12, v13);
  }
LABEL_11:
}

- (void)reRegister
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = smartpowernap_log;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)uint64_t v7 = 138412290;
      *(void *)&v7[4] = identifier;
      uint64_t v5 = (os_log_s *)v3;
LABEL_6:
      _os_log_impl(&dword_187DA9000, v5, OS_LOG_TYPE_DEFAULT, "re-register with powerd with identifier: %@", v7, 0xCu);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_identifier;
    *(_DWORD *)uint64_t v7 = 138412290;
    *(void *)&v7[4] = v6;
    uint64_t v5 = (os_log_s *)MEMORY[0x1895F8DA0];
    goto LABEL_6;
  }

  -[_PMSmartPowerNap registerWithIdentifier:](self, "registerWithIdentifier:", self->_identifier, *(_OWORD *)v7);
}

- (void)unregister
{
}

- (void)unregisterWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = smartpowernap_log;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v8 = 138412290;
      *(void *)&v8[4] = v4;
      v6 = (os_log_s *)v5;
LABEL_6:
      _os_log_impl(&dword_187DA9000, v6, OS_LOG_TYPE_DEFAULT, "unregisterWithIdentifier %@", v8, 0xCu);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v8 = 138412290;
    *(void *)&v8[4] = v4;
    v6 = (os_log_s *)MEMORY[0x1895F8DA0];
    goto LABEL_6;
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_32,  *(_OWORD *)v8);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 unregisterWithIdentifier:v4];
}

- (void)updateState:(unsigned __int8)a3
{
  self->_current_state = a3;
  uint64_t v5 = (void *)os_transaction_create();
  v6 = v5;
  if (self->_callback)
  {
    callback_queue = (dispatch_queue_s *)self->_callback_queue;
    if (callback_queue)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __32___PMSmartPowerNap_updateState___block_invoke;
      block[3] = &unk_18A13E960;
      id v9 = v5;
      uint64_t v10 = self;
      unsigned __int8 v11 = a3;
      dispatch_async(callback_queue, block);
    }
  }
}

- (void)setState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v5 = smartpowernap_log;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v8) = 67109120;
      HIDWORD(v8) = v3;
      v6 = (os_log_s *)v5;
LABEL_6:
      _os_log_impl(&dword_187DA9000, v6, OS_LOG_TYPE_DEFAULT, "Updating state to %d", (uint8_t *)&v8, 8u);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v8) = 67109120;
    HIDWORD(v8) = v3;
    v6 = (os_log_s *)MEMORY[0x1895F8DA0];
    goto LABEL_6;
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_34,  v8,  v9);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setState:v3];
}

- (void)setSPNReentryCoolOffPeriod:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = smartpowernap_log;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v6 = (uint8_t *)&v10;
      uint64_t v7 = (os_log_s *)v5;
LABEL_6:
      _os_log_impl(&dword_187DA9000, v7, OS_LOG_TYPE_DEFAULT, "Updating SPN Re-entry cool off period", v6, 2u);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_35,  v9);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setSPNReentryCoolOffPeriod:v3];
}

- (void)setSPNReentryDelaySeconds:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = smartpowernap_log;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v6 = (uint8_t *)&v10;
      uint64_t v7 = (os_log_s *)v5;
LABEL_6:
      _os_log_impl(&dword_187DA9000, v7, OS_LOG_TYPE_DEFAULT, "Updating SPN Re-entry delay", v6, 2u);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_36,  v9);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setSPNReentryDelaySeconds:v3];
}

- (void)setSPNRequeryDelta:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = smartpowernap_log;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v6 = (uint8_t *)&v10;
      uint64_t v7 = (os_log_s *)v5;
LABEL_6:
      _os_log_impl(&dword_187DA9000, v7, OS_LOG_TYPE_DEFAULT, "Updating SPN Re-query delay", v6, 2u);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_37,  v9);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setSPNRequeryDelta:v3];
}

- (void)setSPNMotionAlarmThreshold:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = smartpowernap_log;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v6 = (uint8_t *)&v10;
      uint64_t v7 = (os_log_s *)v5;
LABEL_6:
      _os_log_impl(&dword_187DA9000, v7, OS_LOG_TYPE_DEFAULT, "Updating SPN motion alarm threshold", v6, 2u);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_38,  v9);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setSPNMotionAlarmThreshold:v3];
}

- (void)setSPNMotionAlarmStartThreshold:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = smartpowernap_log;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v6 = (uint8_t *)&v10;
      uint64_t v7 = (os_log_s *)v5;
LABEL_6:
      _os_log_impl(&dword_187DA9000, v7, OS_LOG_TYPE_DEFAULT, "Updating SPN motion alarm start threshold", v6, 2u);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    v6 = (uint8_t *)&v9;
    goto LABEL_6;
  }

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_39,  v9);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setSPNMotionAlarmStartThreshold:v3];
}

- (void)syncStateWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connection,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_40);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 syncStateWithHandler:v4];
}

- (unsigned)syncState
{
  v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  &__block_literal_global_41);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __29___PMSmartPowerNap_syncState__block_invoke_42;
  v5[3] = &unk_18A13EA88;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 syncStateWithHandler:v5];

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (OS_dispatch_queue)callback_queue
{
  return self->_callback_queue;
}

- (void)setCallback_queue:(id)a3
{
}

- (unsigned)current_state
{
  return self->_current_state;
}

- (void)setCurrent_state:(unsigned __int8)a3
{
  self->_current_state = a3;
}

- (BOOL)connection_interrupted
{
  return self->_connection_interrupted;
}

- (void)setConnection_interrupted:(BOOL)a3
{
  self->_connection_interrupted = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
}

- (void)registerWithIdentifier:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end