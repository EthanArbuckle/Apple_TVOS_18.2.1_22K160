@interface NEAgentPacketTunnelExtension
- (void)extension:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5;
- (void)handleExtensionStartedWithCompletionHandler:(id)a3;
- (void)setAppUUIDMap:(id)a3;
@end

@implementation NEAgentPacketTunnelExtension

- (void)handleExtensionStartedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = -[NEAgentExtension sessionContext](self, "sessionContext");
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke;
  v7[3] = &unk_18A08E168;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchVirtualInterfaceTypeWithCompletionHandler:v7];
}

- (void)extension:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self && self->_interfaceType == 3 && !self->_isUserEthernetInterfaceCreated)
  {
    id v11 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v11 ethernetAddress];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      createEthernetAddressFromString(v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_alloc(&OBJC_CLASS___NEVirtualInterfaceParameters);
      int64_t interfaceType = self->_interfaceType;
      [v11 MTU];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[NEVirtualInterfaceParameters initWithType:maxPendingPackets:ethernetAddress:mtu:]( v13,  "initWithType:maxPendingPackets:ethernetAddress:mtu:",  interfaceType,  64LL,  v21,  v15);
      v17 = -[NEAgentExtension managerObjectFactory](self, "managerObjectFactory");
      uint64_t v18 = MEMORY[0x1895F87A8];
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 3221225472LL;
      v26[2] = __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke;
      v26[3] = &unk_18A090968;
      v26[4] = self;
      id v19 = v10;
      id v27 = v19;
      [v17 managerObjectWithErrorHandler:v26];
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v22[0] = v18;
      v22[1] = 3221225472LL;
      v22[2] = __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_9;
      v22[3] = &unk_18A08E190;
      v22[4] = self;
      id v25 = v19;
      id v23 = v8;
      id v24 = v11;
      [v20 createVirtualInterfaceWithParameters:v16 completionHandler:v22];
    }

    else
    {
      v28.receiver = self;
      v28.super_class = (Class)&OBJC_CLASS___NEAgentPacketTunnelExtension;
      -[NEAgentTunnelExtension extension:didSetTunnelConfiguration:completionHandler:]( &v28,  sel_extension_didSetTunnelConfiguration_completionHandler_,  v8,  v11,  v10);
    }
  }

  else
  {
    v29.receiver = self;
    v29.super_class = (Class)&OBJC_CLASS___NEAgentPacketTunnelExtension;
    -[NEAgentTunnelExtension extension:didSetTunnelConfiguration:completionHandler:]( &v29,  sel_extension_didSetTunnelConfiguration_completionHandler_,  v8,  v9,  v10);
  }
}

- (void)setAppUUIDMap:(id)a3
{
  id v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setAppUUIDMap:v4];
}

void __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%@: Got an error on the XPC connection while waiting for a virtual interface: %@",  (uint8_t *)&v7,  0x16u);
  }

  [MEMORY[0x189607870] errorWithDomain:@"NEAgentErrorDomain" code:1 userInfo:0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_9( id *a1,  void *a2)
{
  id v3 = a2;
  [a1[4] queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_18A08F218;
  id v5 = a1[4];
  id v8 = v3;
  id v9 = v5;
  id v12 = a1[7];
  id v10 = a1[5];
  id v11 = a1[6];
  id v6 = v3;
  dispatch_async(v4, block);
}

void __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      *(_BYTE *)(v2 + 128) = 1;
      id v3 = *(void **)(a1 + 40);
    }

    else
    {
      id v3 = 0LL;
    }

    [v3 sessionContext];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setupVirtualInterface:*(void *)(a1 + 32)];

    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    v11.receiver = *(id *)(a1 + 40);
    v11.super_class = (Class)&OBJC_CLASS___NEAgentPacketTunnelExtension;
    objc_msgSendSuper2(&v11, sel_extension_didSetTunnelConfiguration_completionHandler_, v5, v6, v7);
  }

  else
  {
    ne_log_obj();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v10;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "%@: Failed to create a user ethernet virtual interface",  buf,  0xCu);
    }

    [MEMORY[0x189607870] errorWithDomain:@"NEAgentErrorDomain" code:1 userInfo:0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

void __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v12;
    __int16 v20 = 2048;
    uint64_t v21 = a2;
    _os_log_debug_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEBUG, "%@: Fetched virtual interface type %ld", buf, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    *(void *)(v5 + 136) = a2;
  }
  if (a2 == 3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    [*(id *)(a1 + 32) managerObjectFactory];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = MEMORY[0x1895F87A8];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_1;
    v16[3] = &unk_18A090968;
    id v8 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v8;
    [v6 managerObjectWithErrorHandler:v16];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = -[NEVirtualInterfaceParameters initWithType:maxPendingPackets:ethernetAddress:mtu:]( objc_alloc(&OBJC_CLASS___NEVirtualInterfaceParameters),  "initWithType:maxPendingPackets:ethernetAddress:mtu:",  a2,  64LL,  0LL,  0LL);
    v13[0] = v7;
    v13[1] = 3221225472LL;
    v13[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_18A08E140;
    objc_super v11 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    uint64_t v15 = a2;
    id v14 = v11;
    [v9 createVirtualInterfaceWithParameters:v10 completionHandler:v13];
  }

void __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_1( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%@: Got an error on the XPC connection while waiting for a virtual interface: %@",  (uint8_t *)&v6,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_18A08E118;
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  v8[1] = 3221225472LL;
  uint64_t v12 = *(void *)(a1 + 48);
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, v8);
}

uint64_t __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) sessionContext];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setupVirtualInterface:*(void *)(a1 + 32)];
  }

  else
  {
    ne_log_obj();
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 56);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2048;
      uint64_t v9 = v5;
      _os_log_error_impl( &dword_1876B1000,  (os_log_t)v2,  OS_LOG_TYPE_ERROR,  "%@: Failed to obtain a virtual interface of type %ld, aborting",  (uint8_t *)&v6,  0x16u);
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

@end