@interface UARPControllerXPC
- (BOOL)addAccessory:(id)a3 assetID:(id)a4;
- (BOOL)changeAssetLocation:(id)a3 assetID:(id)a4;
- (BOOL)checkForUpdate:(id)a3;
- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)downloadAvailableFirmwareUpdate:(id)a3 assetID:(id)a4 withUserIntent:(BOOL)a5;
- (BOOL)downloadReleaseNotes:(id)a3 assetID:(id)a4;
- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)getAttestationCertificates:(id)a3 assetID:(id)a4;
- (BOOL)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5;
- (BOOL)getSupportedAccessories:(id)a3 forProductGroup:(id)a4;
- (BOOL)performSynchronousProviderInvocation:(id)a3 accessory:(id)a4 requireKnown:(BOOL)a5 description:(const char *)a6;
- (BOOL)personalizationVectorForAccessory:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5;
- (BOOL)removeAccessory:(id)a3;
- (BOOL)requestConsent:(id)a3;
- (BOOL)revokeConsentRequest:(id)a3;
- (BOOL)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5;
- (BOOL)useAssetAvailabilityNotifications;
- (NSXPCConnection)xpcConnection;
- (UARPControllerXPC)initWithController:(id)a3;
- (id)getAssetIDForAccessoryID:(id)a3;
- (id)getAttestationCertificates:(id)a3;
- (id)getSandboxExtensionTokenForAssetID:(id)a3;
- (id)getSupplementalAssetNameForAccessoryID:(id)a3;
- (id)invocationForProviderSelector:(SEL)a3;
- (void)dealloc;
- (void)manifestPropertiesReceivedForAccessory:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5;
- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)sendFirmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)sendFirmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5;
- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5;
- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
@end

@implementation UARPControllerXPC

- (UARPControllerXPC)initWithController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UARPControllerXPC;
  v5 = -[UARPControllerXPC init](&v14, sel_init);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __40__UARPControllerXPC_initWithController___block_invoke;
    v11[3] = &unk_18A143238;
    objc_copyWeak(&v12, &location);
    uint64_t v6 = MEMORY[0x1895B800C](v11);
    id providerErrorReply = v5->_providerErrorReply;
    v5->_id providerErrorReply = (id)v6;

    os_log_t v8 = os_log_create("com.apple.accessoryupdater.uarp", "xpc");
    xpcLog = v5->_xpcLog;
    v5->_xpcLog = v8;

    objc_storeWeak((id *)&v5->_controller, v4);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __40__UARPControllerXPC_initWithController___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 2, a2);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPControllerXPC;
  -[UARPControllerXPC dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)xpcConnection
{
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.accessoryupdater.uarp" options:4096];
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C708180];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

    v7 = (void *)MEMORY[0x189604010];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSXPCConnection remoteObjectInterface](self->_xpcConnection, "remoteObjectInterface");
    [v13 setClasses:v12 forSelector:sel_getSupportedAccessories_reply_ argumentIndex:0 ofReply:1];

    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_initWeak(&location, self);
    uint64_t v14 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __34__UARPControllerXPC_xpcConnection__block_invoke;
    v18[3] = &unk_18A141FE0;
    objc_copyWeak(&v19, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v18);
    v16[0] = v14;
    v16[1] = 3221225472LL;
    v16[2] = __34__UARPControllerXPC_xpcConnection__block_invoke_113;
    v16[3] = &unk_18A141FE0;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

void __34__UARPControllerXPC_xpcConnection__block_invoke(uint64_t a1)
{
  WeakRetained = (os_log_s **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained[4];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 0;
      _os_log_impl(&dword_187DC0000, v3, OS_LOG_TYPE_INFO, "Connection interrupted", (uint8_t *)v4, 2u);
    }
  }
}

void __34__UARPControllerXPC_xpcConnection__block_invoke_113(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = (os_log_s *)*((void *)WeakRetained + 4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_187DC0000, v3, OS_LOG_TYPE_INFO, "Connection invalidated", v5, 2u);
    }

    id v4 = (void *)v2[1];
    v2[1] = 0LL;
  }
}

- (id)invocationForProviderSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)&unk_18C708180, a3, 1, 1);
  if (MethodDescription.types)
  {
    [MEMORY[0x189603FA0] signatureWithObjCTypes:MethodDescription.types];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F88] invocationWithMethodSignature:v5];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setSelector:a3];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)performSynchronousProviderInvocation:(id)a3 accessory:(id)a4 requireKnown:(BOOL)a5 description:(const char *)a6
{
  int v7 = a5;
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (v10)
  {
    [v11 getID];
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    [v10 setArgument:&v26 atIndex:2];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    int v14 = [WeakRetained accessoryKnown:v12];

    if (v14 == v7)
    {
      lastProviderError = self->_lastProviderError;
      self->_lastProviderError = 0LL;
      v18 = -[UARPControllerXPC xpcConnection](self, "xpcConnection");
      v25[0] = MEMORY[0x1895F87A8];
      v25[1] = 3221225472LL;
      v25[2] = __93__UARPControllerXPC_performSynchronousProviderInvocation_accessory_requireKnown_description___block_invoke;
      v25[3] = &unk_18A143260;
      v25[4] = self;
      [v18 synchronousRemoteObjectProxyWithErrorHandler:v25];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();

      [v10 invokeWithTarget:v19];
      v20 = self->_lastProviderError;
      BOOL v16 = v20 == 0LL;
      if (v20)
      {
        xpcLog = self->_xpcLog;
        if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR))
        {
          v24 = self->_lastProviderError;
          *(_DWORD *)buf = 136446722;
          v28 = a6;
          __int16 v29 = 2114;
          v30 = v24;
          __int16 v31 = 2112;
          v32 = v12;
          _os_log_error_impl(&dword_187DC0000, xpcLog, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@ (%@)", buf, 0x20u);
        }
      }
    }

    else
    {
      v15 = self->_xpcLog;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v23 = "known";
        *(_DWORD *)buf = 136446722;
        v28 = a6;
        if (v7) {
          v23 = "unknown";
        }
        __int16 v29 = 2082;
        v30 = (void *)v23;
        __int16 v31 = 2112;
        v32 = v12;
        _os_log_error_impl( &dword_187DC0000,  v15,  OS_LOG_TYPE_ERROR,  "%{public}s: %{public}s accessory (%@)",  buf,  0x20u);
      }

      BOOL v16 = 0;
    }
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __93__UARPControllerXPC_performSynchronousProviderInvocation_accessory_requireKnown_description___block_invoke( uint64_t a1,  void *a2)
{
}

- (BOOL)addAccessory:(id)a3 assetID:(id)a4
{
  id v6 = a4;
  id v13 = v6;
  id v7 = a3;
  -[UARPControllerXPC invocationForProviderSelector:]( self,  "invocationForProviderSelector:",  sel_addAccessoryID_assetID_sandboxExtensionToken_reply_);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  if (v6 && !objc_msgSend(v6, "type", v12, v13))
  {
    [v6 remoteURL];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSandboxExtension readWriteTokenStringWithURL:]( &OBJC_CLASS___UARPSandboxExtension,  "readWriteTokenStringWithURL:",  v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v8, "setArgument:atIndex:", &v13, 3, v12);
  [v8 setArgument:&v12 atIndex:4];
  [v8 setArgument:&self->_providerErrorReply atIndex:5];
  BOOL v10 = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:]( self,  "performSynchronousProviderInvocation:accessory:requireKnown:description:",  v8,  v7,  0LL,  "Add accessory");

  return v10;
}

- (BOOL)removeAccessory:(id)a3
{
  id v4 = a3;
  v5 = -[UARPControllerXPC invocationForProviderSelector:]( self,  "invocationForProviderSelector:",  sel_removeAccessoryID_reply_);
  [v5 setArgument:&self->_providerErrorReply atIndex:3];
  LOBYTE(self) = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:]( self,  "performSynchronousProviderInvocation:accessory:requireKnown:description:",  v5,  v4,  1LL,  "Remove accessory");

  return (char)self;
}

- (BOOL)changeAssetLocation:(id)a3 assetID:(id)a4
{
  id v6 = a4;
  id v13 = v6;
  id v7 = a3;
  -[UARPControllerXPC invocationForProviderSelector:]( self,  "invocationForProviderSelector:",  sel_changeAssetLocation_assetID_sandboxExtensionToken_reply_);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  if (v6 && !objc_msgSend(v6, "type", v12, v13))
  {
    [v6 remoteURL];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSandboxExtension readWriteTokenStringWithURL:]( &OBJC_CLASS___UARPSandboxExtension,  "readWriteTokenStringWithURL:",  v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v8, "setArgument:atIndex:", &v13, 3, v12);
  [v8 setArgument:&v12 atIndex:4];
  [v8 setArgument:&self->_providerErrorReply atIndex:5];
  BOOL v10 = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:]( self,  "performSynchronousProviderInvocation:accessory:requireKnown:description:",  v8,  v7,  1LL,  "Change asset location");

  return v10;
}

- (BOOL)downloadAvailableFirmwareUpdate:(id)a3 assetID:(id)a4 withUserIntent:(BOOL)a5
{
  id v12 = a4;
  BOOL v11 = a5;
  id v8 = a3;
  -[UARPControllerXPC invocationForProviderSelector:]( self,  "invocationForProviderSelector:",  sel_downloadFirmwareForAccessoryID_assetID_userIntent_reply_);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setArgument:&v12 atIndex:3];
  [v9 setArgument:&v11 atIndex:4];
  [v9 setArgument:&self->_providerErrorReply atIndex:5];
  LOBYTE(self) = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:]( self,  "performSynchronousProviderInvocation:accessory:requireKnown:description:",  v9,  v8,  1LL,  "Download asset");

  return (char)self;
}

- (BOOL)downloadReleaseNotes:(id)a3 assetID:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  -[UARPControllerXPC invocationForProviderSelector:]( self,  "invocationForProviderSelector:",  sel_downloadReleaseNotesForAccessoryID_assetID_reply_);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setArgument:&v9 atIndex:3];
  [v7 setArgument:&self->_providerErrorReply atIndex:4];
  LOBYTE(self) = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:]( self,  "performSynchronousProviderInvocation:accessory:requireKnown:description:",  v7,  v6,  1LL,  "Download release notes");

  return (char)self;
}

- (void)sendFirmwareUpdateProgressForAccessory:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v14 remoteObjectProxy];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 getID];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  [v12 firmwareUpdateProgressForAccessoryID:v13 assetID:v10 bytesSent:a5 bytesTotal:a6];
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 remoteObjectProxy];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 stagingCompleteForAccessoryID:v9 assetID:v8 status:a5];
}

- (void)sendFirmwareUpdateProgressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 remoteObjectProxy];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 firmwareUpdateProgressForUARPConsent:v8 bytesSent:a4 bytesTotal:a5];
}

- (void)progressForUARPConsent:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 remoteObjectProxy];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 progressForUARPConsent:v8 bytesSent:a4 bytesTotal:a5];
}

- (void)progressForUARPConsentInPostLogout:(id)a3 bytesSent:(unint64_t)a4 bytesTotal:(unint64_t)a5
{
  id v8 = a3;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 remoteObjectProxy];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 progressForUARPConsentInPostLogout:v8 bytesSent:a4 bytesTotal:a5];
}

- (BOOL)checkForUpdate:(id)a3
{
  id v4 = a3;
  v5 = -[UARPControllerXPC invocationForProviderSelector:](self, "invocationForProviderSelector:", sel_checkForUpdate_reply_);
  [v5 setArgument:&self->_providerErrorReply atIndex:3];
  LOBYTE(self) = -[UARPControllerXPC performSynchronousProviderInvocation:accessory:requireKnown:description:]( self,  "performSynchronousProviderInvocation:accessory:requireKnown:description:",  v5,  v4,  1LL,  "Check for update");

  return (char)self;
}

- (BOOL)personalizationVectorForAccessory:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  char v10 = [WeakRetained accessoryKnown:v8];

  if ((v10 & 1) != 0)
  {
    uint64_t v27 = 0LL;
    v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    v30 = __Block_byref_object_copy__2;
    __int16 v31 = __Block_byref_object_dispose__2;
    id v32 = 0LL;
    -[UARPControllerXPC xpcConnection](self, "xpcConnection");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = MEMORY[0x1895F87A8];
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke;
    v26[3] = &unk_18A143288;
    v26[4] = &v27;
    [v11 synchronousRemoteObjectProxyWithErrorHandler:v26];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v22 = 0LL;
    v23 = &v22;
    uint64_t v24 = 0x2020000000LL;
    int v25 = 0;
    [v8 getID];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedInt:v6];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = 3221225472LL;
    v21[2] = __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke_2;
    v21[3] = &unk_18A1432B0;
    v21[4] = &v22;
    v21[5] = &v27;
    [v13 personalizationVectorForAccessoryID:v14 assetTag:v15 reply:v21];

    BOOL v16 = v28;
    if (v28[5])
    {
      xpcLog = self->_xpcLog;
      if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = v28[5];
        *(_DWORD *)buf = 136315906;
        v34 = "-[UARPControllerXPC personalizationVectorForAccessory:assetTag:outVector:]";
        __int16 v35 = 1024;
        int v36 = v6;
        __int16 v37 = 2112;
        id v38 = v8;
        __int16 v39 = 2112;
        uint64_t v40 = v20;
        _os_log_error_impl( &dword_187DC0000,  xpcLog,  OS_LOG_TYPE_ERROR,  "%s: Failed to query assetTag 0x%08x for %@ (%@)",  buf,  0x26u);
      }

      BOOL v16 = v28;
    }

    else
    {
      *a5 = *((_DWORD *)v23 + 6);
    }

    BOOL v18 = v16[5] == 0;
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v27, 8);
  }

  else
  {
    if (os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC personalizationVectorForAccessory:assetTag:outVector:].cold.1();
    }
    BOOL v18 = 0;
  }

  return v18;
}

void __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke( uint64_t a1,  void *a2)
{
}

void __74__UARPControllerXPC_personalizationVectorForAccessory_assetTag_outVector___block_invoke_2( uint64_t a1,  void *a2,  int a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    id v6 = v7;
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a3;
  }
}

- (id)getAssetIDForAccessoryID:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0LL;
  v5 = -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  uint64_t v6 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke;
  v17[3] = &unk_18A143288;
  v17[4] = &v18;
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19[5])
  {
    if (os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC getAssetIDForAccessoryID:].cold.1();
    }
    id v8 = 0LL;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000LL;
    id v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    id v16 = 0LL;
    v10[0] = v6;
    v10[1] = 3221225472LL;
    v10[2] = __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke_133;
    v10[3] = &unk_18A1432D8;
    v10[4] = &v11;
    [v7 getAssetIDForAccessoryID:v4 reply:v10];
    id v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke(uint64_t a1, void *a2)
{
}

void __46__UARPControllerXPC_getAssetIDForAccessoryID___block_invoke_133(uint64_t a1, void *a2)
{
}

- (id)getSupplementalAssetNameForAccessoryID:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0LL;
  v5 = -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  uint64_t v6 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke;
  v17[3] = &unk_18A143288;
  v17[4] = &v18;
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19[5])
  {
    if (os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC getSupplementalAssetNameForAccessoryID:].cold.1();
    }
    id v8 = 0LL;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000LL;
    id v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    id v16 = 0LL;
    v10[0] = v6;
    v10[1] = 3221225472LL;
    v10[2] = __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke_135;
    v10[3] = &unk_18A143300;
    v10[4] = &v11;
    [v7 getSupplementalAssetNameForAccessoryID:v4 reply:v10];
    id v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke(uint64_t a1, void *a2)
{
}

void __60__UARPControllerXPC_getSupplementalAssetNameForAccessoryID___block_invoke_135(uint64_t a1, void *a2)
{
}

- (void)manifestPropertiesReceivedForAccessory:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  char v11 = [WeakRetained accessoryKnown:v8];

  if ((v11 & 1) != 0)
  {
    -[UARPControllerXPC xpcConnection](self, "xpcConnection");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 remoteObjectProxy];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 getID];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 manifestPropertiesReceivedForAccessoryID:v14 assetTag:v6 properties:v9];
  }

  else if (os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPControllerXPC manifestPropertiesReceivedForAccessory:assetTag:properties:].cold.1();
  }
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  char v12 = [WeakRetained accessoryIDKnown:v8];

  if ((v12 & 1) != 0)
  {
    -[UARPControllerXPC xpcConnection](self, "xpcConnection");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 remoteObjectProxy];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 sendUpdateFirmwareAnalyticsEventForAccessoryID:v8 assetID:v9 params:v10];
  }

  else if (os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR))
  {
    -[UARPControllerXPC sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:].cold.1();
  }
}

- (BOOL)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  char v11 = [WeakRetained accessoryKnown:v9];

  if ((v11 & 1) != 0)
  {
    uint64_t v20 = 0LL;
    v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    id v23 = __Block_byref_object_copy__2;
    uint64_t v24 = __Block_byref_object_dispose__2;
    id v25 = 0LL;
    -[UARPControllerXPC xpcConnection](self, "xpcConnection");
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke;
    v19[3] = &unk_18A143288;
    v19[4] = &v20;
    [v12 synchronousRemoteObjectProxyWithErrorHandler:v19];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    [v9 getID];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472LL;
    v18[2] = __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke_2;
    v18[3] = &unk_18A143288;
    void v18[4] = &v20;
    [v14 updateProperty:a3 value:v8 forAccessory:v15 reply:v18];

    BOOL v16 = v21[5] == 0;
    _Block_object_dispose(&v20, 8);
  }

  else
  {
    if (os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC updateProperty:value:forAccessory:].cold.1();
    }
    BOOL v16 = 0;
  }

  return v16;
}

void __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke(uint64_t a1, void *a2)
{
}

void __55__UARPControllerXPC_updateProperty_value_forAccessory___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)useAssetAvailabilityNotifications
{
  return 1;
}

- (BOOL)getSupportedAccessories:(id)a3 forProductGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v27 = 0LL;
    v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    v30 = __Block_byref_object_copy__2;
    __int16 v31 = __Block_byref_object_dispose__2;
    id v32 = 0LL;
    -[UARPControllerXPC xpcConnection](self, "xpcConnection");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = MEMORY[0x1895F87A8];
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke;
    v26[3] = &unk_18A143288;
    v26[4] = &v27;
    [v8 synchronousRemoteObjectProxyWithErrorHandler:v26];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28[5])
    {
      if (os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR)) {
        -[UARPControllerXPC getSupportedAccessories:forProductGroup:].cold.2();
      }
      BOOL v11 = 0;
    }

    else
    {
      uint64_t v20 = 0LL;
      v21 = &v20;
      uint64_t v22 = 0x3032000000LL;
      id v23 = __Block_byref_object_copy__2;
      uint64_t v24 = __Block_byref_object_dispose__2;
      id v25 = 0LL;
      uint64_t v16 = 0LL;
      id v17 = &v16;
      uint64_t v18 = 0x2020000000LL;
      char v19 = 1;
      v15[0] = v9;
      v15[1] = 3221225472LL;
      v15[2] = __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke_137;
      v15[3] = &unk_18A143328;
      v15[4] = &v20;
      v15[5] = &v16;
      [v10 getSupportedAccessories:v7 reply:v15];
      [(id)v21[5] allObjects];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 addObjectsFromArray:v13];

      BOOL v11 = *((_BYTE *)v17 + 24) != 0;
      _Block_object_dispose(&v16, 8);
      _Block_object_dispose(&v20, 8);
    }

    _Block_object_dispose(&v27, 8);
  }

  else
  {
    xpcLog = self->_xpcLog;
    if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC getSupportedAccessories:forProductGroup:].cold.1(xpcLog);
    }
    BOOL v11 = 0;
  }

  return v11;
}

void __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke(uint64_t a1, void *a2)
{
}

void __61__UARPControllerXPC_getSupportedAccessories_forProductGroup___block_invoke_137( uint64_t a1,  void *a2,  char a3)
{
  id v6 = a2;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
}

- (BOOL)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  char v19 = __Block_byref_object_copy__2;
  uint64_t v20 = __Block_byref_object_dispose__2;
  id v21 = 0LL;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke;
  v15[3] = &unk_18A143288;
  v15[4] = &v16;
  [v10 synchronousRemoteObjectProxyWithErrorHandler:v15];
  char v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v11;
  v14[1] = 3221225472LL;
  v14[2] = __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke_2;
  v14[3] = &unk_18A143288;
  v14[4] = &v16;
  [v12 getSupportedAccessories:v8 assetID:v9 batchRequest:v5 reply:v14];
  LOBYTE(v5) = v17[5] == 0;

  _Block_object_dispose(&v16, 8);
  return v5;
}

void __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke( uint64_t a1,  void *a2)
{
}

void __66__UARPControllerXPC_getSupportedAccessories_assetID_batchRequest___block_invoke_2( uint64_t a1,  void *a2)
{
}

- (id)getAttestationCertificates:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  char v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0LL;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __48__UARPControllerXPC_getAttestationCertificates___block_invoke;
  v17[3] = &unk_18A143288;
  v17[4] = &v18;
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19[5])
  {
    if (os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC getAttestationCertificates:].cold.1();
    }
    id v8 = 0LL;
  }

  else
  {
    uint64_t v11 = 0LL;
    char v12 = &v11;
    uint64_t v13 = 0x3032000000LL;
    id v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    id v16 = 0LL;
    v10[0] = v6;
    v10[1] = 3221225472LL;
    v10[2] = __48__UARPControllerXPC_getAttestationCertificates___block_invoke_139;
    v10[3] = &unk_18A143350;
    v10[4] = &v11;
    [v7 getAttestationCertificates:v4 reply:v10];
    id v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __48__UARPControllerXPC_getAttestationCertificates___block_invoke(uint64_t a1, void *a2)
{
}

void __48__UARPControllerXPC_getAttestationCertificates___block_invoke_139(uint64_t a1, void *a2)
{
}

- (BOOL)getAttestationCertificates:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0LL;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke;
  v13[3] = &unk_18A143288;
  v13[4] = &v14;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v9;
  v12[1] = 3221225472LL;
  v12[2] = __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke_2;
  v12[3] = &unk_18A143288;
  v12[4] = &v14;
  [v10 getAttestationCertificates:v6 assetID:v7 reply:v12];
  LOBYTE(v8) = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return (char)v8;
}

void __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke(uint64_t a1, void *a2)
{
}

void __56__UARPControllerXPC_getAttestationCertificates_assetID___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)requestConsent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = 0LL;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __36__UARPControllerXPC_requestConsent___block_invoke;
  v10[3] = &unk_18A143288;
  v10[4] = &v11;
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472LL;
  v9[2] = __36__UARPControllerXPC_requestConsent___block_invoke_2;
  v9[3] = &unk_18A143288;
  v9[4] = &v11;
  [v7 requestConsent:v4 reply:v9];
  LOBYTE(v5) = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

void __36__UARPControllerXPC_requestConsent___block_invoke(uint64_t a1, void *a2)
{
}

void __36__UARPControllerXPC_requestConsent___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)revokeConsentRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = 0LL;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __42__UARPControllerXPC_revokeConsentRequest___block_invoke;
  v10[3] = &unk_18A143288;
  v10[4] = &v11;
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472LL;
  v9[2] = __42__UARPControllerXPC_revokeConsentRequest___block_invoke_2;
  v9[3] = &unk_18A143288;
  v9[4] = &v11;
  [v7 revokeConsentRequest:v4 reply:v9];
  LOBYTE(v5) = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

void __42__UARPControllerXPC_revokeConsentRequest___block_invoke(uint64_t a1, void *a2)
{
}

void __42__UARPControllerXPC_revokeConsentRequest___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = 0LL;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  v10[3] = &unk_18A143288;
  v10[4] = &v11;
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472LL;
  v9[2] = __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2;
  v9[3] = &unk_18A143288;
  v9[4] = &v11;
  [v7 enableTRMSystemAuthenticationForRegistryEntryID:v4 reply:v9];
  LOBYTE(v5) = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

void __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke( uint64_t a1,  void *a2)
{
}

void __69__UARPControllerXPC_enableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2( uint64_t a1,  void *a2)
{
}

- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = 0LL;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke;
  v10[3] = &unk_18A143288;
  v10[4] = &v11;
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472LL;
  v9[2] = __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2;
  v9[3] = &unk_18A143288;
  v9[4] = &v11;
  [v7 disableTRMSystemAuthenticationForRegistryEntryID:v4 reply:v9];
  LOBYTE(v5) = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

void __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke( uint64_t a1,  void *a2)
{
}

void __70__UARPControllerXPC_disableTRMSystemAuthenticationForRegistryEntryID___block_invoke_2( uint64_t a1,  void *a2)
{
}

- (id)getSandboxExtensionTokenForAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0LL;
  -[UARPControllerXPC xpcConnection](self, "xpcConnection");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke;
  v17[3] = &unk_18A143288;
  v17[4] = &v18;
  [v5 synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19[5])
  {
    if (os_log_type_enabled(self->_xpcLog, OS_LOG_TYPE_ERROR)) {
      -[UARPControllerXPC getSandboxExtensionTokenForAssetID:].cold.1();
    }
    id v8 = 0LL;
  }

  else
  {
    uint64_t v11 = 0LL;
    char v12 = &v11;
    uint64_t v13 = 0x3032000000LL;
    uint64_t v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    id v16 = 0LL;
    v10[0] = v6;
    v10[1] = 3221225472LL;
    v10[2] = __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke_141;
    v10[3] = &unk_18A143300;
    v10[4] = &v11;
    [v7 getSandboxExtensionTokenForAssetID:v4 reply:v10];
    id v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke(uint64_t a1, void *a2)
{
}

void __56__UARPControllerXPC_getSandboxExtensionTokenForAssetID___block_invoke_141(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
}

- (void)personalizationVectorForAccessory:assetTag:outVector:.cold.1()
{
}

- (void)getAssetIDForAccessoryID:.cold.1()
{
}

- (void)getSupplementalAssetNameForAccessoryID:.cold.1()
{
}

- (void)manifestPropertiesReceivedForAccessory:assetTag:properties:.cold.1()
{
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:.cold.1()
{
}

- (void)updateProperty:value:forAccessory:.cold.1()
{
}

- (void)getSupportedAccessories:(os_log_t)log forProductGroup:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136315138;
  uint64_t v2 = "-[UARPControllerXPC getSupportedAccessories:forProductGroup:]";
  _os_log_error_impl( &dword_187DC0000,  log,  OS_LOG_TYPE_ERROR,  "%s: Caller provided nil parameter set",  (uint8_t *)&v1,  0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)getSupportedAccessories:forProductGroup:.cold.2()
{
}

- (void)getAttestationCertificates:.cold.1()
{
}

- (void)getSandboxExtensionTokenForAssetID:.cold.1()
{
}

@end