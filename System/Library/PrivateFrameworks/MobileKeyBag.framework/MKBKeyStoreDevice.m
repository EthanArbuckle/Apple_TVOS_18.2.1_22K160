@interface MKBKeyStoreDevice
+ (id)sharedService;
- (BOOL)getDeviceLockStateForUser:(int)a3 extendedState:(BOOL)a4 withLockStateInfo:(int *)a5;
- (id)_CreateMKBServerConnection;
- (id)copySytemSecretBlob;
- (id)getBackupkeyForVolume:(id)a3 andCryptoID:(unint64_t)a4 withError:(id *)a5;
- (id)getFileHandleForData:(id)a3;
- (id)getLockStateForUser:(int)a3;
- (int)ChangeSystemSecretWithEscrow:(id)a3 FromOldPasscode:(id)a4 ToNew:(id)a5 withOpaqueDats:(id)a6 withKeepState:(int)a7;
- (int)Event:(int)a3;
- (int)SetSystemSecretBlob:(id)a3;
- (int)addPersonaKeyForUserSession:(unsigned int)a3 withSecret:(id)a4 withPersonaUUIDString:(id)a5 forPath:(id)a6;
- (int)backupUUIDForVolume:(id)a3 bagUUID:(id *)a4;
- (int)changeClassKeysGenerationWithSecret:(id)a3 withGenerationOption:(int)a4;
- (int)changeSystemSecretFromOldPasscode:(id)a3 ToNew:(id)a4 withOpaqueData:(id)a5 withParams:(unsigned int)a6;
- (int)createKeybagForUserSession:(id)a3 withSessionUID:(int)a4 WithSecret:(id)a5 withGracePeriod:(int)a6 withOpaqeStuff:(id)a7;
- (int)createSyncBagForUserSession:(id)a3 withSessionUID:(int)a4;
- (int)deleteKeybagForUserSession:(int)a3;
- (int)disableBackupForVolume:(id)a3;
- (int)enableBackupForVolume:(id)a3 withSecret:(id)a4 bagData:(id *)a5;
- (int)forgottenPasscodeEvent;
- (int)isKeyRollingWithKeyStatus:(int *)a3;
- (int)loadKeybagForUserSession:(id)a3 withSessionID:(int)a4 withSecret:(id)a5 shouldSetGracePeriod:(BOOL)a6 withGracePeriod:(int)a7 isInEarlyStar:(BOOL)a8;
- (int)loadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4;
- (int)migrateFS;
- (int)passcodeUnlockFailed;
- (int)passcodeUnlockStart;
- (int)passcodeUnlockSuccess;
- (int)registerOTABackup:(id)a3 withSecret:(id)a4;
- (int)removePersonaKeyForUserSession:(unsigned int)a3 withPersonaUUIDString:(id)a4 withVolumeUUIDString:(id)a5;
- (int)removeSyncBagForUserSession:(id)a3 withSessionUID:(int)a4;
- (int)setVolumeToPersona:(id)a3 withPersonaString:(id)a4;
- (int)startBackupSessionForVolume:(id)a3;
- (int)stashCommit:(unsigned int)a3 WithFlags:(unsigned int)a4;
- (int)stashCreateWithSecret:(id)a3 withMode:(int)a4 withUID:(unsigned int)a5 WithFlags:(unsigned int)a6;
- (int)stashDestroy;
- (int)stashVerifywithValidity:(int *)a3 WithUID:(unsigned int)a4 WithFlags:(unsigned int)a5;
- (int)stopBackupSessionForVolume:(id)a3;
- (int)unloadKeybagForUserSession:(int)a3;
- (int)unloadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4;
- (int)verifySyncBagForUserSession:(id)a3 withSessionUID:(int)a4;
@end

@implementation MKBKeyStoreDevice

+ (id)sharedService
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__MKBKeyStoreDevice_sharedService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, block);
  }
  return (id)sharedService_service;
}

void __34__MKBKeyStoreDevice_sharedService__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedService_service;
  sharedService_service = v0;
}

- (id)_CreateMKBServerConnection
{
  int v2 = xpc_user_sessions_enabled();
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C66E828];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = objc_alloc(MEMORY[0x189607B30]);
  if (v2) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = 4096LL;
  }
  v6 = (void *)[v4 initWithMachServiceName:@"com.apple.mobile.keybagd.xpc" options:v5];
  [v6 setRemoteObjectInterface:v3];
  if (v2)
  {
    xpc_user_sessions_get_foreground_uid();
    [v6 _xpcConnection];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_user_session_uid();
  }

  [v6 resume];

  return v6;
}

- (id)getFileHandleForData:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  uint64_t v5 = (void *)[v3 length];
  if (v5)
  {
    if (pipe(v24) == -1)
    {
      v7 = __error();
      char v8 = strerror(*v7);
      debuglog( "-[MKBKeyStoreDevice getFileHandleForData:]",  @"failed to get fds(1) with error:%s",  v9,  v10,  v11,  v12,  v13,  v14,  v8);
    }

    else
    {
      if (writen(v24[1], (char *)[v4 bytes], (size_t)v5) != -1)
      {
        close(v24[1]);
        id v6 = objc_alloc(MEMORY[0x189607898]);
        uint64_t v5 = (void *)[v6 initWithFileDescriptor:v24[0] closeOnDealloc:1];
        goto LABEL_9;
      }

      v15 = __error();
      char v16 = strerror(*v15);
      debuglog( "-[MKBKeyStoreDevice getFileHandleForData:]",  @"failed to write to pipe with error:%s",  v17,  v18,  v19,  v20,  v21,  v22,  v16);
      close(v24[0]);
      close(v24[1]);
    }

- (int)changeSystemSecretFromOldPasscode:(id)a3 ToNew:(id)a4 withOpaqueData:(id)a5 withParams:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  int v28 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && [v10 length])
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v10);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v10 length];
    if (!v11) {
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = 0LL;
    if (!v11)
    {
LABEL_8:
      char v16 = 0LL;
      uint64_t v17 = 0LL;
      goto LABEL_9;
    }
  }

  if (![v11 length]) {
    goto LABEL_8;
  }
  -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v11);
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v11 length];
LABEL_9:
  [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_1];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __87__MKBKeyStoreDevice_changeSystemSecretFromOldPasscode_ToNew_withOpaqueData_withParams___block_invoke_2;
  v22[3] = &unk_189D6A9C0;
  v24 = &v25;
  id v19 = v13;
  id v23 = v19;
  [v18 changeSystemSecretfromOldSecret:v14 oldSize:v15 toNewSecret:v16 newSize:v17 opaqueData:v12 withParams:v6 reply:v22];
  int v20 = *((_DWORD *)v26 + 6);

  _Block_object_dispose(&v25, 8);
  return v20;
}

void __87__MKBKeyStoreDevice_changeSystemSecretFromOldPasscode_ToNew_withOpaqueData_withParams___block_invoke( uint64_t a1,  char a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

uint64_t __87__MKBKeyStoreDevice_changeSystemSecretFromOldPasscode_ToNew_withOpaqueData_withParams___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)changeClassKeysGenerationWithSecret:(id)a3 withGenerationOption:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 0;
  v7 = -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  if (v6 && [v6 length])
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v6);
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v6 length];
  }

  else
  {
    char v8 = 0LL;
    uint64_t v9 = 0LL;
  }

  [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_173];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __78__MKBKeyStoreDevice_changeClassKeysGenerationWithSecret_withGenerationOption___block_invoke_2;
  v14[3] = &unk_189D6A9C0;
  char v16 = &v17;
  id v11 = v7;
  id v15 = v11;
  [v10 changeClassKeysGenerationWithSecret:v8 secretSize:v9 generationOption:v4 reply:v14];
  int v12 = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __78__MKBKeyStoreDevice_changeClassKeysGenerationWithSecret_withGenerationOption___block_invoke( uint64_t a1,  char a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

uint64_t __78__MKBKeyStoreDevice_changeClassKeysGenerationWithSecret_withGenerationOption___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (id)copySytemSecretBlob
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0LL;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_174];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__MKBKeyStoreDevice_copySytemSecretBlob__block_invoke_2;
  v7[3] = &unk_189D6AA28;
  uint64_t v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 getPasscodeBlobWithReply:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __40__MKBKeyStoreDevice_copySytemSecretBlob__block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice copySytemSecretBlob]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

void __40__MKBKeyStoreDevice_copySytemSecretBlob__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  if (a3)
  {
    char v6 = [a3 code];
    debuglog( "-[MKBKeyStoreDevice copySytemSecretBlob]_block_invoke_2",  @"got error from remote proxy for getPasscodeBlobWithReply: %ld",  v7,  v8,  v9,  v10,  v11,  v12,  v6);
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (id)getBackupkeyForVolume:(id)a3 andCryptoID:(unint64_t)a4 withError:(id *)a5
{
  id v8 = a3;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = __Block_byref_object_copy_;
  int v28 = __Block_byref_object_dispose_;
  id v29 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0LL;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_180];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __65__MKBKeyStoreDevice_getBackupkeyForVolume_andCryptoID_withError___block_invoke_2;
  v14[3] = &unk_189D6AA70;
  char v16 = &v18;
  uint64_t v17 = &v24;
  id v11 = v9;
  id v15 = v11;
  [v10 getBackupkeyForVolume:v8 andCryptoID:a4 withReply:v14];
  if (a5) {
    *a5 = (id) v19[5];
  }
  id v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __65__MKBKeyStoreDevice_getBackupkeyForVolume_andCryptoID_withError___block_invoke( uint64_t a1,  void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice getBackupkeyForVolume:andCryptoID:withError:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

void __65__MKBKeyStoreDevice_getBackupkeyForVolume_andCryptoID_withError___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v14 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    char v7 = [v6 code];
    debuglog( "-[MKBKeyStoreDevice getBackupkeyForVolume:andCryptoID:withError:]_block_invoke_2",  @"got error from remote proxy: %ld",  v8,  v9,  v10,  v11,  v12,  v13,  v7);
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (int)ChangeSystemSecretWithEscrow:(id)a3 FromOldPasscode:(id)a4 ToNew:(id)a5 withOpaqueDats:(id)a6 withKeepState:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  int v38 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && [v13 length])
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v13);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v13 length];
    if (!v14) {
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v31 = 0LL;
    uint64_t v17 = 0LL;
    if (!v14) {
      goto LABEL_8;
    }
  }

  if ([v14 length])
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v14);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v14 length];
    goto LABEL_9;
  }

void __101__MKBKeyStoreDevice_ChangeSystemSecretWithEscrow_FromOldPasscode_ToNew_withOpaqueDats_withKeepState___block_invoke( uint64_t a1,  char a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

uint64_t __101__MKBKeyStoreDevice_ChangeSystemSecretWithEscrow_FromOldPasscode_ToNew_withOpaqueDats_withKeepState___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)SetSystemSecretBlob:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_182];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __41__MKBKeyStoreDevice_SetSystemSecretBlob___block_invoke_2;
  v10[3] = &unk_189D6A9C0;
  id v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 setSystemSecretBlob:v4 reply:v10];
  int v8 = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __41__MKBKeyStoreDevice_SetSystemSecretBlob___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice SetSystemSecretBlob:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __41__MKBKeyStoreDevice_SetSystemSecretBlob___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice SetSystemSecretBlob:]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)registerOTABackup:(id)a3 withSecret:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  int v21 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && [v7 length])
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v7 length];
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
  }

  [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_183];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __50__MKBKeyStoreDevice_registerOTABackup_withSecret___block_invoke_2;
  v15[3] = &unk_189D6A9C0;
  uint64_t v17 = &v18;
  id v12 = v8;
  id v16 = v12;
  [v11 registerBackupBag:v6 withSecret:v9 secretSize:v10 reply:v15];
  int v13 = *((_DWORD *)v19 + 6);

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __50__MKBKeyStoreDevice_registerOTABackup_withSecret___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice registerOTABackup:withSecret:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __50__MKBKeyStoreDevice_registerOTABackup_withSecret___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice registerOTABackup:withSecret:]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)startBackupSessionForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_184];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __49__MKBKeyStoreDevice_startBackupSessionForVolume___block_invoke_2;
  v10[3] = &unk_189D6A9C0;
  id v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 startBackupSessionForVolume:v4 withReply:v10];
  int v8 = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __49__MKBKeyStoreDevice_startBackupSessionForVolume___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice startBackupSessionForVolume:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __49__MKBKeyStoreDevice_startBackupSessionForVolume___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice startBackupSessionForVolume:]_block_invoke_2",  @"got error from remote proxy(2): %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)stopBackupSessionForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_187];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __48__MKBKeyStoreDevice_stopBackupSessionForVolume___block_invoke_2;
  v10[3] = &unk_189D6A9C0;
  id v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 stopBackupSessionForVolume:v4 withReply:v10];
  int v8 = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __48__MKBKeyStoreDevice_stopBackupSessionForVolume___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice stopBackupSessionForVolume:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __48__MKBKeyStoreDevice_stopBackupSessionForVolume___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice stopBackupSessionForVolume:]_block_invoke_2",  @"got error from remote proxy(2): %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)enableBackupForVolume:(id)a3 withSecret:(id)a4 bagData:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0LL;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  int v30 = -1;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  char v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0LL;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && [v9 length])
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v9 length];
  }

  else
  {
    uint64_t v12 = 0LL;
    id v11 = 0LL;
  }

  [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_188];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __62__MKBKeyStoreDevice_enableBackupForVolume_withSecret_bagData___block_invoke_2;
  v17[3] = &unk_189D6AA70;
  uint64_t v19 = &v27;
  uint64_t v20 = &v21;
  id v14 = v10;
  id v18 = v14;
  [v13 enableBackupForVolume:v8 withSecret:v11 secretSize:v12 reply:v17];
  *a5 = (id) v22[5];
  int v15 = *((_DWORD *)v28 + 6);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __62__MKBKeyStoreDevice_enableBackupForVolume_withSecret_bagData___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice enableBackupForVolume:withSecret:bagData:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

void __62__MKBKeyStoreDevice_enableBackupForVolume_withSecret_bagData___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v15 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 code];
    char v8 = [v7 code];
    debuglog( "-[MKBKeyStoreDevice enableBackupForVolume:withSecret:bagData:]_block_invoke_2",  @"got error from remote proxy: %ld",  v9,  v10,  v11,  v12,  v13,  v14,  v8);
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  [*(id *)(a1 + 32) invalidate];
}

- (int)disableBackupForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_189];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __44__MKBKeyStoreDevice_disableBackupForVolume___block_invoke_2;
  v10[3] = &unk_189D6A9C0;
  uint64_t v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 disableBackupForVolume:v4 reply:v10];
  int v8 = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __44__MKBKeyStoreDevice_disableBackupForVolume___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice disableBackupForVolume:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __44__MKBKeyStoreDevice_disableBackupForVolume___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice disableBackupForVolume:]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)backupUUIDForVolume:(id)a3 bagUUID:(id *)a4
{
  id v5 = a3;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_190];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __49__MKBKeyStoreDevice_backupUUIDForVolume_bagUUID___block_invoke_2;
  v11[3] = &unk_189D6AA28;
  uint64_t v13 = &v14;
  id v8 = v6;
  id v12 = v8;
  [v7 backupUUIDForVolume:v5 reply:v11];
  int v9 = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __49__MKBKeyStoreDevice_backupUUIDForVolume_bagUUID___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice backupUUIDForVolume:bagUUID:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __49__MKBKeyStoreDevice_backupUUIDForVolume_bagUUID___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  if (a3)
  {
    id v4 = a3;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 code];
    char v5 = [v4 code];

    debuglog( "-[MKBKeyStoreDevice backupUUIDForVolume:bagUUID:]_block_invoke_2",  @"got error from remote proxy: %ld",  v6,  v7,  v8,  v9,  v10,  v11,  v5);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)passcodeUnlockStart
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_191];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__MKBKeyStoreDevice_passcodeUnlockStart__block_invoke_2;
  v7[3] = &unk_189D6A9C0;
  uint64_t v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 passcodeUnlockStartWithReply:v7];
  int v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __40__MKBKeyStoreDevice_passcodeUnlockStart__block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice passcodeUnlockStart]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __40__MKBKeyStoreDevice_passcodeUnlockStart__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice passcodeUnlockStart]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)passcodeUnlockSuccess
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_192];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42__MKBKeyStoreDevice_passcodeUnlockSuccess__block_invoke_2;
  v7[3] = &unk_189D6A9C0;
  uint64_t v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 passcodeUnlockSuccessWithReply:v7];
  int v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __42__MKBKeyStoreDevice_passcodeUnlockSuccess__block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice passcodeUnlockSuccess]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __42__MKBKeyStoreDevice_passcodeUnlockSuccess__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice passcodeUnlockSuccess]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)passcodeUnlockFailed
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_193];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__MKBKeyStoreDevice_passcodeUnlockFailed__block_invoke_2;
  v7[3] = &unk_189D6A9C0;
  uint64_t v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 passcodeUnlockFailedWithReply:v7];
  int v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __41__MKBKeyStoreDevice_passcodeUnlockFailed__block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice passcodeUnlockFailed]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __41__MKBKeyStoreDevice_passcodeUnlockFailed__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice passcodeUnlockFailed]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (id)getLockStateForUser:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = 0LL;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_194];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __41__MKBKeyStoreDevice_getLockStateForUser___block_invoke_2;
  v9[3] = &unk_189D6AC18;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 getLockSateInfoforUser:v3 WithReply:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__MKBKeyStoreDevice_getLockStateForUser___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice getLockStateForUser:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

void __41__MKBKeyStoreDevice_getLockStateForUser___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  if (a3)
  {
    char v6 = [a3 code];
    debuglog( "-[MKBKeyStoreDevice getLockStateForUser:]_block_invoke_2",  @"got error from remote proxy: %ld",  v7,  v8,  v9,  v10,  v11,  v12,  v6);
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (BOOL)getDeviceLockStateForUser:(int)a3 extendedState:(BOOL)a4 withLockStateInfo:(int *)a5
{
  uint64_t v6 = a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_196];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __79__MKBKeyStoreDevice_getDeviceLockStateForUser_extendedState_withLockStateInfo___block_invoke_2;
  v12[3] = &unk_189D6AC60;
  uint64_t v14 = &v16;
  uint64_t v15 = a5;
  id v10 = v8;
  id v13 = v10;
  [v9 getDeviceLockState:v7 needsExtended:v6 withReply:v12];
  LOBYTE(v6) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __79__MKBKeyStoreDevice_getDeviceLockStateForUser_extendedState_withLockStateInfo___block_invoke( uint64_t a1,  void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice getDeviceLockStateForUser:extendedState:withLockStateInfo:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __79__MKBKeyStoreDevice_getDeviceLockStateForUser_extendedState_withLockStateInfo___block_invoke_2( uint64_t a1,  int a2,  void *a3)
{
  if (a3)
  {
    char v4 = [a3 code];
    debuglog( "-[MKBKeyStoreDevice getDeviceLockStateForUser:extendedState:withLockStateInfo:]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    uint64_t v11 = *(_DWORD **)(a1 + 48);
    if (v11) {
      *uint64_t v11 = a2;
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)stashCreateWithSecret:(id)a3 withMode:(int)a4 withUID:(unsigned int)a5 WithFlags:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  int v24 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && [v10 length])
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v10 length];
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
  }

  [v11 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_198];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __70__MKBKeyStoreDevice_stashCreateWithSecret_withMode_withUID_WithFlags___block_invoke_2;
  v18[3] = &unk_189D6A9C0;
  uint64_t v20 = &v21;
  id v15 = v11;
  id v19 = v15;
  [v14 stashCreatewithSecret:v12 secrestSize:v13 withMode:v8 withUID:v7 WithFlags:v6 reply:v18];
  int v16 = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  return v16;
}

void __70__MKBKeyStoreDevice_stashCreateWithSecret_withMode_withUID_WithFlags___block_invoke( uint64_t a1,  void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice stashCreateWithSecret:withMode:withUID:WithFlags:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __70__MKBKeyStoreDevice_stashCreateWithSecret_withMode_withUID_WithFlags___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice stashCreateWithSecret:withMode:withUID:WithFlags:]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)stashCommit:(unsigned int)a3 WithFlags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_199];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __43__MKBKeyStoreDevice_stashCommit_WithFlags___block_invoke_2;
  v10[3] = &unk_189D6A9C0;
  uint64_t v12 = &v13;
  id v8 = v6;
  id v11 = v8;
  [v7 stashCommitwithUID:v5 WithFlags:v4 WithReply:v10];
  LODWORD(v4) = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void __43__MKBKeyStoreDevice_stashCommit_WithFlags___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice stashCommit:WithFlags:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __43__MKBKeyStoreDevice_stashCommit_WithFlags___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice stashCommit:WithFlags:]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)stashDestroy
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_200];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __33__MKBKeyStoreDevice_stashDestroy__block_invoke_2;
  v7[3] = &unk_189D6A9C0;
  uint64_t v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 stashDestroywithReply:v7];
  int v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __33__MKBKeyStoreDevice_stashDestroy__block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice stashDestroy]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __33__MKBKeyStoreDevice_stashDestroy__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice stashDestroy]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)stashVerifywithValidity:(int *)a3 WithUID:(unsigned int)a4 WithFlags:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  int v24 = -1;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_201];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __63__MKBKeyStoreDevice_stashVerifywithValidity_WithUID_WithFlags___block_invoke_2;
  v13[3] = &unk_189D6AD08;
  uint64_t v15 = &v21;
  int v16 = &v17;
  id v10 = v8;
  id v14 = v10;
  [v9 stashVerifywithUID:v6 WithFlags:v5 WithReply:v13];
  if (a3) {
    *a3 = *((_DWORD *)v18 + 6);
  }
  int v11 = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v11;
}

void __63__MKBKeyStoreDevice_stashVerifywithValidity_WithUID_WithFlags___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice stashVerifywithValidity:WithUID:WithFlags:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __63__MKBKeyStoreDevice_stashVerifywithValidity_WithUID_WithFlags___block_invoke_2( uint64_t a1,  int a2,  void *a3)
{
  if (a3)
  {
    id v4 = a3;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 code];
    char v5 = [v4 code];

    debuglog( "-[MKBKeyStoreDevice stashVerifywithValidity:WithUID:WithFlags:]_block_invoke_2",  @"got error from remote proxy: %ld",  v6,  v7,  v8,  v9,  v10,  v11,  v5);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)isKeyRollingWithKeyStatus:(int *)a3
{
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = -1;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = 0;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_202];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __47__MKBKeyStoreDevice_isKeyRollingWithKeyStatus___block_invoke_2;
  v9[3] = &unk_189D6AD08;
  uint64_t v11 = &v17;
  uint64_t v12 = &v13;
  id v6 = v4;
  id v10 = v6;
  [v5 isKeyRollingInProgresswithreply:v9];
  if (a3) {
    *a3 = *((_DWORD *)v14 + 6);
  }
  int v7 = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __47__MKBKeyStoreDevice_isKeyRollingWithKeyStatus___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice isKeyRollingWithKeyStatus:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __47__MKBKeyStoreDevice_isKeyRollingWithKeyStatus___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  if (a3)
  {
    id v4 = a3;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 code];
    char v5 = [v4 code];

    debuglog( "-[MKBKeyStoreDevice isKeyRollingWithKeyStatus:]_block_invoke_2",  @"got error from remote proxy: %ld",  v6,  v7,  v8,  v9,  v10,  v11,  v5);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)migrateFS
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_203];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __30__MKBKeyStoreDevice_migrateFS__block_invoke_2;
  v7[3] = &unk_189D6A9C0;
  uint64_t v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 migrationWithReply:v7];
  int v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __30__MKBKeyStoreDevice_migrateFS__block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice migrateFS]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __30__MKBKeyStoreDevice_migrateFS__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice migrateFS]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)forgottenPasscodeEvent
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = -1;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  char v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_204];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__MKBKeyStoreDevice_forgottenPasscodeEvent__block_invoke_2;
  v7[3] = &unk_189D6A9C0;
  uint64_t v9 = &v10;
  id v4 = v2;
  id v8 = v4;
  [v3 forgottenPasscodeEventWithReply:v7];
  int v5 = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __43__MKBKeyStoreDevice_forgottenPasscodeEvent__block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice forgottenPasscodeEvent]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __43__MKBKeyStoreDevice_forgottenPasscodeEvent__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 code];
    char v4 = [v3 code];

    debuglog( "-[MKBKeyStoreDevice forgottenPasscodeEvent]_block_invoke_2",  @"got error from remote proxy: %ld",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (int)Event:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_205];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 Event:v3];
  [v4 invalidate];

  return 0;
}

void __27__MKBKeyStoreDevice_Event___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice Event:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

- (int)createKeybagForUserSession:(id)a3 withSessionUID:(int)a4 WithSecret:(id)a5 withGracePeriod:(int)a6 withOpaqeStuff:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  int v34 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && [v13 length])
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v13);
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v13 length];
  }

  else
  {
    uint64_t v17 = 0LL;
    int v16 = 0LL;
  }

  [v15 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_206];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __105__MKBKeyStoreDevice_createKeybagForUserSession_withSessionUID_WithSecret_withGracePeriod_withOpaqeStuff___block_invoke_2;
  v28[3] = &unk_189D6A9C0;
  int v30 = &v31;
  id v19 = v15;
  id v29 = v19;
  [v18 createKeybagForUserSession:v12 withSessionUID:v10 WithSecret:v16 secretSize:v17 withGracePeriod:v8 withOpaqeStuff:v14 withReply:v28];
  if (*((_DWORD *)v32 + 6))
  {
    debuglog( "-[MKBKeyStoreDevice createKeybagForUserSession:withSessionUID:WithSecret:withGracePeriod:withOpaqeStuff:]",  @"kcreateKeybagForUserSession -> %d",  v20,  v21,  v22,  v23,  v24,  v25,  *((_DWORD *)v32 + 6));
    int v26 = *((_DWORD *)v32 + 6);
  }

  else
  {
    int v26 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v26;
}

void __105__MKBKeyStoreDevice_createKeybagForUserSession_withSessionUID_WithSecret_withGracePeriod_withOpaqeStuff___block_invoke( uint64_t a1,  void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice createKeybagForUserSession:withSessionUID:WithSecret:withGracePeriod:withOpaqeStuff:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __105__MKBKeyStoreDevice_createKeybagForUserSession_withSessionUID_WithSecret_withGracePeriod_withOpaqeStuff___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)loadKeybagForUserSession:(id)a3 withSessionID:(int)a4 withSecret:(id)a5 shouldSetGracePeriod:(BOOL)a6 withGracePeriod:(int)a7 isInEarlyStar:(BOOL)a8
{
  uint64_t v9 = *(void *)&a7;
  BOOL v10 = a6;
  uint64_t v12 = *(void *)&a4;
  id v14 = a3;
  id v15 = a5;
  uint64_t v33 = 0LL;
  int v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  int v36 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && [v15 length])
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v15 length];
  }

  else
  {
    uint64_t v18 = 0LL;
    uint64_t v17 = 0LL;
  }

  [v16 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_209];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = __122__MKBKeyStoreDevice_loadKeybagForUserSession_withSessionID_withSecret_shouldSetGracePeriod_withGracePeriod_isInEarlyStar___block_invoke_2;
  v30[3] = &unk_189D6A9C0;
  v32 = &v33;
  id v20 = v16;
  id v31 = v20;
  LOBYTE(v29) = a8;
  [v19 loadKeybagForUserSession:v14 withSessionID:v12 withSecret:v17 secretSize:v18 shouldSetGracePeriod:v10 withGracePeriod:v9 isInEarlyStar:v29 withReply:v30];
  if (*((_DWORD *)v34 + 6))
  {
    debuglog( "-[MKBKeyStoreDevice loadKeybagForUserSession:withSessionID:withSecret:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:]",  @"kcreateKeybagForUserSession -> %d",  v21,  v22,  v23,  v24,  v25,  v26,  *((_DWORD *)v34 + 6));
    int v27 = *((_DWORD *)v34 + 6);
  }

  else
  {
    int v27 = 0;
  }

  _Block_object_dispose(&v33, 8);
  return v27;
}

void __122__MKBKeyStoreDevice_loadKeybagForUserSession_withSessionID_withSecret_shouldSetGracePeriod_withGracePeriod_isInEarlyStar___block_invoke( uint64_t a1,  void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice loadKeybagForUserSession:withSessionID:withSecret:shouldSetGracePeriod:withGracePeriod:isInEarly Star:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __122__MKBKeyStoreDevice_loadKeybagForUserSession_withSessionID_withSecret_shouldSetGracePeriod_withGracePeriod_isInEarlyStar___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)unloadKeybagForUserSession:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_210];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __48__MKBKeyStoreDevice_unloadKeybagForUserSession___block_invoke_2;
  v8[3] = &unk_189D6A9C0;
  BOOL v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [v5 unloadKeybagForUserSession:v3 withReply:v8];
  LODWORD(v3) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return v3;
}

void __48__MKBKeyStoreDevice_unloadKeybagForUserSession___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice unloadKeybagForUserSession:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __48__MKBKeyStoreDevice_unloadKeybagForUserSession___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)deleteKeybagForUserSession:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_211];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __48__MKBKeyStoreDevice_deleteKeybagForUserSession___block_invoke_2;
  v8[3] = &unk_189D6A9C0;
  BOOL v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [v5 deleteKeybagForUserSession:v3 withReply:v8];
  LODWORD(v3) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return v3;
}

void __48__MKBKeyStoreDevice_deleteKeybagForUserSession___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice deleteKeybagForUserSession:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __48__MKBKeyStoreDevice_deleteKeybagForUserSession___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)setVolumeToPersona:(id)a3 withPersonaString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  int v19 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_212];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __58__MKBKeyStoreDevice_setVolumeToPersona_withPersonaString___block_invoke_2;
  v13[3] = &unk_189D6A9C0;
  id v15 = &v16;
  id v10 = v8;
  id v14 = v10;
  [v9 setVolumeToPersona:v6 withPersonaString:v7 withReply:v13];
  int v11 = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __58__MKBKeyStoreDevice_setVolumeToPersona_withPersonaString___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice setVolumeToPersona:withPersonaString:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __58__MKBKeyStoreDevice_setVolumeToPersona_withPersonaString___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)createSyncBagForUserSession:(id)a3 withSessionUID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_213];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __64__MKBKeyStoreDevice_createSyncBagForUserSession_withSessionUID___block_invoke_2;
  v11[3] = &unk_189D6A9C0;
  uint64_t v13 = &v14;
  id v9 = v7;
  id v12 = v9;
  [v8 createSyncBagForUserSession:v6 withSessionUID:v4 withReply:v11];
  LODWORD(v4) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __64__MKBKeyStoreDevice_createSyncBagForUserSession_withSessionUID___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice createSyncBagForUserSession:withSessionUID:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __64__MKBKeyStoreDevice_createSyncBagForUserSession_withSessionUID___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)loadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_214];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __62__MKBKeyStoreDevice_loadSyncBagForUserSession_withSessionUID___block_invoke_2;
  v11[3] = &unk_189D6A9C0;
  uint64_t v13 = &v14;
  id v9 = v7;
  id v12 = v9;
  [v8 loadSyncBagForUserSession:v6 withSessionUID:v4 withReply:v11];
  LODWORD(v4) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __62__MKBKeyStoreDevice_loadSyncBagForUserSession_withSessionUID___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice loadSyncBagForUserSession:withSessionUID:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __62__MKBKeyStoreDevice_loadSyncBagForUserSession_withSessionUID___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)verifySyncBagForUserSession:(id)a3 withSessionUID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_215];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __64__MKBKeyStoreDevice_verifySyncBagForUserSession_withSessionUID___block_invoke_2;
  v11[3] = &unk_189D6A9C0;
  uint64_t v13 = &v14;
  id v9 = v7;
  id v12 = v9;
  [v8 verifySyncBagForUserSession:v6 withSessionUID:v4 withReply:v11];
  LODWORD(v4) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __64__MKBKeyStoreDevice_verifySyncBagForUserSession_withSessionUID___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice verifySyncBagForUserSession:withSessionUID:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __64__MKBKeyStoreDevice_verifySyncBagForUserSession_withSessionUID___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)unloadSyncBagForUserSession:(id)a3 withSessionUID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_216];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __64__MKBKeyStoreDevice_unloadSyncBagForUserSession_withSessionUID___block_invoke_2;
  v11[3] = &unk_189D6A9C0;
  uint64_t v13 = &v14;
  id v9 = v7;
  id v12 = v9;
  [v8 unloadSyncBagForUserSession:v6 withSessionUID:v4 withReply:v11];
  LODWORD(v4) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __64__MKBKeyStoreDevice_unloadSyncBagForUserSession_withSessionUID___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice unloadSyncBagForUserSession:withSessionUID:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __64__MKBKeyStoreDevice_unloadSyncBagForUserSession_withSessionUID___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)removeSyncBagForUserSession:(id)a3 withSessionUID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_217];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __64__MKBKeyStoreDevice_removeSyncBagForUserSession_withSessionUID___block_invoke_2;
  v11[3] = &unk_189D6A9C0;
  uint64_t v13 = &v14;
  id v9 = v7;
  id v12 = v9;
  [v8 removeSyncBagForUserSession:v6 withSessionUID:v4 withReply:v11];
  LODWORD(v4) = *((_DWORD *)v15 + 6);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __64__MKBKeyStoreDevice_removeSyncBagForUserSession_withSessionUID___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice removeSyncBagForUserSession:withSessionUID:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __64__MKBKeyStoreDevice_removeSyncBagForUserSession_withSessionUID___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)addPersonaKeyForUserSession:(unsigned int)a3 withSecret:(id)a4 withPersonaUUIDString:(id)a5 forPath:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  int v26 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && [v10 length])
  {
    -[MKBKeyStoreDevice getFileHandleForData:](self, "getFileHandleForData:", v10);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v10 length];
  }

  else
  {
    uint64_t v15 = 0LL;
    uint64_t v14 = 0LL;
  }

  [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_218];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __90__MKBKeyStoreDevice_addPersonaKeyForUserSession_withSecret_withPersonaUUIDString_forPath___block_invoke_2;
  v20[3] = &unk_189D6A9C0;
  uint64_t v22 = &v23;
  id v17 = v13;
  id v21 = v17;
  [v16 createPersonaKeyForUserSession:v11 forPath:v12 withUID:v8 WithSecret:v14 secretSize:v15 withReply:v20];
  int v18 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v23, 8);
  return v18;
}

void __90__MKBKeyStoreDevice_addPersonaKeyForUserSession_withSecret_withPersonaUUIDString_forPath___block_invoke( uint64_t a1,  void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice addPersonaKeyForUserSession:withSecret:withPersonaUUIDString:forPath:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __90__MKBKeyStoreDevice_addPersonaKeyForUserSession_withSecret_withPersonaUUIDString_forPath___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

- (int)removePersonaKeyForUserSession:(unsigned int)a3 withPersonaUUIDString:(id)a4 withVolumeUUIDString:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v17 = 0LL;
  int v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 5;
  -[MKBKeyStoreDevice _CreateMKBServerConnection](self, "_CreateMKBServerConnection");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_219];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __95__MKBKeyStoreDevice_removePersonaKeyForUserSession_withPersonaUUIDString_withVolumeUUIDString___block_invoke_2;
  v14[3] = &unk_189D6A9C0;
  uint64_t v16 = &v17;
  id v12 = v10;
  id v15 = v12;
  [v11 removePersonaKeyForUserSession:v8 withUID:v6 withVolumeUUIDString:v9 withReply:v14];
  LODWORD(v6) = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return v6;
}

void __95__MKBKeyStoreDevice_removePersonaKeyForUserSession_withPersonaUUIDString_withVolumeUUIDString___block_invoke( uint64_t a1,  void *a2)
{
  char v2 = [a2 code];
  debuglog( "-[MKBKeyStoreDevice removePersonaKeyForUserSession:withPersonaUUIDString:withVolumeUUIDString:]_block_invoke",  @"got error from remote proxy: %ld",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
}

uint64_t __95__MKBKeyStoreDevice_removePersonaKeyForUserSession_withPersonaUUIDString_withVolumeUUIDString___block_invoke_2( uint64_t a1,  void *a2)
{
  if (a2) {
    int v3 = [a2 code];
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
  return [*(id *)(a1 + 32) invalidate];
}

@end