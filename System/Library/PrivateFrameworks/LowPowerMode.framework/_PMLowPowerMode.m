@interface _PMLowPowerMode
+ (id)sharedInstance;
- (BOOL)setPowerMode:(int64_t)a3 fromSource:(id)a4;
- (BOOL)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5;
- (_PMLowPowerMode)init;
- (int64_t)getPowerMode;
- (void)dealloc;
- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withCompletion:(id)a5;
- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5 withCompletion:(id)a6;
@end

@implementation _PMLowPowerMode

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  return (id)sharedInstance_saver;
}

- (_PMLowPowerMode)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____PMLowPowerMode;
  v2 = -[_PMLowPowerMode init](&v7, sel_init);
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.powerd.lowpowermode" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6F6AF8];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->_connection, "resume");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PMLowPowerMode;
  -[_PMLowPowerMode dealloc](&v3, sel_dealloc);
}

- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withCompletion:(id)a5
{
}

- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  connection = self->_connection;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __69___PMLowPowerMode_setPowerMode_fromSource_withParams_withCompletion___block_invoke;
  v16[3] = &unk_18A13EB38;
  id v17 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  v15 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v16);
  [v15 setPowerMode:a3 fromSource:v14 withParams:v13 withCompletion:v12];
}

- (BOOL)setPowerMode:(int64_t)a3 fromSource:(id)a4
{
  return -[_PMLowPowerMode setPowerMode:fromSource:withParams:]( self,  "setPowerMode:fromSource:withParams:",  a3,  a4,  0LL);
}

- (BOOL)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 1;
  uint64_t v10 = MEMORY[0x1895F87A8];
  connection = self->_connection;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __54___PMLowPowerMode_setPowerMode_fromSource_withParams___block_invoke;
  v15[3] = &unk_18A13EB60;
  v15[4] = &v16;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v15);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472LL;
  v14[2] = __54___PMLowPowerMode_setPowerMode_fromSource_withParams___block_invoke_2;
  v14[3] = &unk_18A13EB88;
  v14[4] = &v16;
  [v12 setPowerMode:a3 fromSource:v8 withParams:v9 withCompletion:v14];

  LOBYTE(a3) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return a3;
}

- (int64_t)getPowerMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (void).cxx_destruct
{
}

@end