@interface RBRequestManager
- (RBRequestManager)initWithContext:(id)a3;
- (id)acquireDroppedLaunchAssertion:(id)a3 requestor:(id)a4;
- (uint64_t)_checkAndAdjustLaunchRequest:(void *)a3 requestor:(void *)a4 entitlements:;
- (uint64_t)_checkExtensionLaunchFromRequstor:(id *)a3 AndAdjustRequest:;
- (uint64_t)_checkLaunchByAnyAndAdjustRequest:(uint64_t)a1;
- (void)_createAcquisitionContext:(void *)a3 requestor:(void *)a4 assertionIdentifier:(int)a5 isAbstractTarget:;
- (void)_executeLaunchRequestWithAssertion:(void *)a3 requestor:(void *)a4 completion:;
- (void)_finishLaunchRequestAfterAssertionAcquisition:(void *)a3 requestor:(void *)a4 identifier:(void *)a5 error:(void *)a6 completion:;
- (void)executeLaunchRequest:(id)a3 euid:(unsigned int)a4 requestor:(id)a5 entitlements:(id)a6 completion:(id)a7;
@end

@implementation RBRequestManager

- (RBRequestManager)initWithContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RBRequestManager;
  v6 = -[RBRequestManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemonContext, a3);
    v8 = v7;
  }

  return v7;
}

- (uint64_t)_checkExtensionLaunchFromRequstor:(id *)a3 AndAdjustRequest:
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (a1)
  {
    [*a3 context];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 identity];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v7 isExtension])
    {
      a1 = 0LL;
LABEL_21:

      goto LABEL_22;
    }

    [v7 hostIdentifier];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 identifier];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {
    }

    else
    {
      objc_super v10 = v9;
      if (!v8 || !v9)
      {

LABEL_13:
        rbs_process_log();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          id v31 = v5;
          __int16 v32 = 2114;
          v33 = v7;
          _os_log_impl( &dword_188634000,  v14,  OS_LOG_TYPE_INFO,  "Not mutating extension launch from %{public}@ for %{public}@ since requestor is not the host",  buf,  0x16u);
        }

        a1 = 0LL;
LABEL_20:

        goto LABEL_21;
      }

      char v11 = [v8 isEqual:v9];

      if ((v11 & 1) == 0) {
        goto LABEL_13;
      }
    }

    v12 = (void *)MEMORY[0x189612240];
    [v6 identity];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 contextWithIdentity:v13];
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    [v6 attributes];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_log_s setAttributes:](v14, "setAttributes:", v15);

    [v6 explanation];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_log_s setExplanation:](v14, "setExplanation:", v16);

    [v6 oneShotUUID];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_log_s setOneShotUUID:](v14, "setOneShotUUID:", v17);

    [v5 handle];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_log_s setRequestorHandle:](v14, "setRequestorHandle:", v18);

    [v5 identifier];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_log_s setHostPid:](v14, "setHostPid:", objc_msgSend(v19, "rbs_pid"));

    [v6 managedEndpointLaunchIdentifiers];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_log_s setManagedEndpointLaunchIdentifiers:](v14, "setManagedEndpointLaunchIdentifiers:", v20);

    [v6 requiredExistingProcess];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_log_s setRequiredExistingProcess:](v14, "setRequiredExistingProcess:", v21);

    [*(id *)(a1 + 8) extensionDataProvider];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v29 = 0LL;
    a1 = [v22 configureLaunchContext:v14 error:&v29];
    id v23 = v29;

    if ((_DWORD)a1)
    {
      [v6 attributes];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_log_s setAttributes:](v14, "setAttributes:", v24);

      [v6 managedEndpointLaunchIdentifiers];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_log_s setManagedEndpointLaunchIdentifiers:](v14, "setManagedEndpointLaunchIdentifiers:", v25);

      [v6 requiredExistingProcess];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_log_s setRequiredExistingProcess:](v14, "setRequiredExistingProcess:", v26);

      *a3 = (id)[objc_alloc(MEMORY[0x189612250]) initWithContext:v14];
    }

    else
    {
      rbs_process_log();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v31 = v5;
        __int16 v32 = 2114;
        v33 = v7;
        __int16 v34 = 2114;
        id v35 = v23;
        _os_log_impl( &dword_188634000,  v27,  OS_LOG_TYPE_DEFAULT,  "Extension launch from %{public}@ for %{public}@ failed with error %{public}@",  buf,  0x20u);
      }
    }

    goto LABEL_20;
  }

- (uint64_t)_checkLaunchByAnyAndAdjustRequest:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  [*a2 context];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 identity];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 embeddedApplicationIdentifier];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13) {
    goto LABEL_7;
  }
  v14 = (void *)MEMORY[0x189605730];
  [v4 embeddedApplicationIdentifier];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 applicationProxyForIdentifier:v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  [v16 entitlementValueForKey:@"com.apple.runningboard.trustedtarget" ofClass:objc_opt_class()];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  int v18 = [v17 BOOLValue];

  if (v18)
  {
LABEL_3:
    id v5 = (void *)MEMORY[0x189612240];
    [v3 identity];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 contextWithIdentity:v6];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v3 attributes];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setAttributes:v8];

    [v3 explanation];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setExplanation:v9];

    [v3 managedEndpointLaunchIdentifiers];
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setManagedEndpointLaunchIdentifiers:v10];

    [v3 requiredExistingProcess];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setRequiredExistingProcess:v11];

    *a2 = (id)[objc_alloc(MEMORY[0x189612250]) initWithContext:v7];
    uint64_t v12 = 1LL;
  }

  else
  {
LABEL_7:
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (uint64_t)_checkAndAdjustLaunchRequest:(void *)a3 requestor:(void *)a4 entitlements:
{
  id v7 = a3;
  id v8 = a4;
  if (!a1)
  {
    uint64_t v11 = 0LL;
    goto LABEL_12;
  }

  if (!a2) {
    -[RBRequestManager _checkAndAdjustLaunchRequest:requestor:entitlements:].cold.1();
  }
  [*a2 context];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 identity];
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v10 isXPCService] & 1) != 0 || objc_msgSend(v9, "hostPid"))
  {
  }

  else
  {
    [v9 extensionOverlay];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      [v9 identity];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 isDext];

      if ((v17 & 1) == 0)
      {
        if ([v8 hasEntitlementDomain:2]) {
          goto LABEL_7;
        }
        uint64_t v13 = -[RBRequestManager _checkLaunchByAnyAndAdjustRequest:](a1, a2);
LABEL_10:
        uint64_t v11 = v13;
        goto LABEL_11;
      }

      uint64_t v12 = RBLaunchDextsEntitlement;
LABEL_9:
      uint64_t v13 = [v8 hasEntitlement:*v12];
      goto LABEL_10;
    }
  }

  if ((-[RBRequestManager _checkExtensionLaunchFromRequstor:AndAdjustRequest:](a1, v7, a2) & 1) == 0)
  {
    uint64_t v12 = RBLaunchExtensionsEntitlement;
    goto LABEL_9;
  }

- (void)_finishLaunchRequestAfterAssertionAcquisition:(void *)a3 requestor:(void *)a4 identifier:(void *)a5 error:(void *)a6 completion:
{
  v35[1] = *MEMORY[0x1895F89C0];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    if (v14)
    {
      v16 = (void *)MEMORY[0x189607870];
      uint64_t v17 = *MEMORY[0x1896124B0];
      uint64_t v18 = *MEMORY[0x189607798];
      v32[0] = *MEMORY[0x1896075F0];
      v32[1] = v18;
      v33[0] = @"Unable to execute launch request";
      v33[1] = v14;
      [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:v32 count:2];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v16 errorWithDomain:v17 code:5 userInfo:v19];

      (*((void (**)(id, void, void, void, uint64_t))v15 + 2))(v15, 0LL, 0LL, 0LL, v20);
      id v14 = (id)v20;
    }

    else
    {
      [*(id *)(a1 + 8) processManager];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 8) assertionManager];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v27[0] = MEMORY[0x1895F87A8];
        v27[1] = 3221225472LL;
        v27[2] = __104__RBRequestManager__finishLaunchRequestAfterAssertionAcquisition_requestor_identifier_error_completion___block_invoke;
        v27[3] = &unk_18A256FB0;
        id v31 = v15;
        id v28 = v13;
        id v29 = v22;
        id v30 = v12;
        [v21 executeLaunchRequest:v11 withCompletion:v27];

        id v14 = 0LL;
      }

      else
      {
        id v23 = (void *)MEMORY[0x189607870];
        uint64_t v24 = *MEMORY[0x1896124B0];
        uint64_t v34 = *MEMORY[0x1896075F0];
        v35[0] = @"Unable to execute launch request";
        [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:&v34 count:1];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 errorWithDomain:v24 code:5 userInfo:v25];
        id v14 = (id)objc_claimAutoreleasedReturnValue();

        [v12 identifier];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 invalidateAssertionFromOriginator:v26 withIdentifier:v13];

        (*((void (**)(id, void, void, void, id))v15 + 2))(v15, 0LL, 0LL, 0LL, v14);
      }
    }
  }
}

void __104__RBRequestManager__finishLaunchRequestAfterAssertionAcquisition_requestor_identifier_error_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v8 = a4;
  if (!a2)
  {
    v6 = *(void **)(a1 + 40);
    [*(id *)(a1 + 48) identifier];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 invalidateAssertionFromOriginator:v7 withIdentifier:*(void *)(a1 + 32)];
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_createAcquisitionContext:(void *)a3 requestor:(void *)a4 assertionIdentifier:(int)a5 isAbstractTarget:
{
  id v5 = a1;
  if (a1)
  {
    id v9 = a4;
    id v10 = a3;
    [a2 context];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 attributes];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 identity];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612388] targetWithProcessIdentity:v13];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 explanation];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }

    else
    {
      [NSString stringWithFormat:@"RBSLaunchRequest for %@", v14];
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v18 = v17;

    [MEMORY[0x189612168] descriptorWithIdentifier:v9 target:v14 explanation:v18 attributes:v12];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:]( &OBJC_CLASS___RBAssertionAcquisitionContext,  "contextForProcess:withDescriptor:daemonContext:",  v10,  v19,  v5[1]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5) {
      [v5 setAllowAbstractTarget:1];
    }
    [v5 setAcquisitionPolicy:1];
  }

  return v5;
}

- (void)_executeLaunchRequestWithAssertion:(void *)a3 requestor:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    [v7 context];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 identity];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x189612170], "identifierWithClientPid:", objc_msgSend(v8, "rbs_pid"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBRequestManager _createAcquisitionContext:requestor:assertionIdentifier:isAbstractTarget:]( (void *)a1,  v7,  v8,  v12,  1);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 8) processMonitor];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 suppressUpdatesForIdentity:v11];

    [*(id *)(a1 + 8) assertionManager];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke;
    v18[3] = &unk_18A257000;
    v18[4] = a1;
    id v19 = v7;
    id v20 = v8;
    id v21 = v12;
    id v22 = v11;
    id v23 = v9;
    id v16 = v11;
    id v17 = v12;
    [v15 acquireAssertionWithContext:v13 completion:v18];
  }
}

void __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1896123C0];
  +[RBConnectionClient sharedLaunchWorkloop]();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke_2;
  v8[3] = &unk_18A256FD8;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = v3;
  id v14 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 64);
  id v7 = v3;
  [v4 handoffContextOnQueue:v5 block:v8];
}

void __76__RBRequestManager__executeLaunchRequestWithAssertion_requestor_completion___block_invoke_2( uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 unsuppressUpdatesForIdentity:*(void *)(a1 + 72)];
}

- (id)acquireDroppedLaunchAssertion:(id)a3 requestor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 context];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 identity];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x189612170], "identifierWithClientPid:", objc_msgSend(v6, "rbs_pid"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBRequestManager _createAcquisitionContext:requestor:assertionIdentifier:isAbstractTarget:](self, v7, v6, v10, 0);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBDaemonContextProviding processMonitor](self->_daemonContext, "processMonitor");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 suppressUpdatesForIdentity:v9];

  -[RBDaemonContextProviding assertionManager](self->_daemonContext, "assertionManager");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke;
  v18[3] = &unk_18A2563B8;
  id v19 = v9;
  id v14 = v10;
  id v20 = v14;
  id v21 = self;
  id v15 = v9;
  [v13 acquireAssertionWithContext:v11 completion:v18];

  id v16 = v14;
  return v16;
}

void __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    rbs_assertion_log();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }

  [*(id *)(*(void *)(a1 + 48) + 8) processMonitor];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 unsuppressUpdatesForIdentity:*(void *)(a1 + 32)];
}

- (void)executeLaunchRequest:(id)a3 euid:(unsigned int)a4 requestor:(id)a5 entitlements:(id)a6 completion:(id)a7
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  [v11 context];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 appID];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    [MEMORY[0x1896122E8] identityForLSApplicationIdentity:v16];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    rbs_connection_log();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      [v16 identityString];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v35 = v19;
      __int16 v36 = 2114;
      v37 = v17;
      _os_log_impl( &dword_188634000,  v18,  OS_LOG_TYPE_INFO,  "Resolved identity for launch request for %{public}@ to %{public}@",  buf,  0x16u);
    }

    if (v17)
    {
      [v11 context];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 setIdentity:v17];
    }
  }

  id v33 = v11;
  char v21 = -[RBRequestManager _checkAndAdjustLaunchRequest:requestor:entitlements:]((uint64_t)self, &v33, v12, v13);
  id v22 = v33;

  if ((v21 & 1) != 0)
  {
    [v22 context];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 attributes];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v24 count])
    {
      -[RBRequestManager _executeLaunchRequestWithAssertion:requestor:completion:]((uint64_t)self, v22, v12, v14);
    }

    else
    {
      v26 = (void *)MEMORY[0x1896123C0];
      v27 = +[RBConnectionClient sharedLaunchWorkloop]();
      v28[0] = MEMORY[0x1895F87A8];
      v28[1] = 3221225472LL;
      v28[2] = __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke;
      v28[3] = &unk_18A257050;
      v28[4] = self;
      id v29 = v22;
      id v30 = v23;
      id v31 = v12;
      id v32 = v14;
      [v26 handoffContextOnQueue:v27 block:v28];
    }
  }

  else
  {
    rbs_connection_log();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[RBRequestManager executeLaunchRequest:euid:requestor:entitlements:completion:].cold.1((uint64_t)v12, v25);
    }

    objc_msgSend(MEMORY[0x189607870], "rbs_errorClientNotAuthorized");
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void, void *))v14 + 2))(v14, 0LL, 0LL, 0LL, v23);
  }
}

void __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke( uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  [*(id *)(*(void *)(a1 + 32) + 8) processManager];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    rbs_ttl_log();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 40) context];
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 identity];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 shortDescription];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) explanation];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      id v19 = v6;
      __int16 v20 = 2114;
      char v21 = v7;
      __int16 v22 = 2114;
      uint64_t v23 = v8;
      _os_log_impl( &dword_188634000,  v3,  OS_LOG_TYPE_DEFAULT,  "Executing launch request for %{public}@ (%{public}@) from requestor: %{public}@",  buf,  0x20u);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke_21;
    v14[3] = &unk_18A257028;
    id v15 = *(id *)(a1 + 64);
    [v2 executeLaunchRequest:v9 withCompletion:v14];
    id v10 = v15;
  }

  else
  {
    id v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x1896124B0];
    uint64_t v16 = *MEMORY[0x1896075F0];
    id v17 = @"Unable to execute launch request";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 errorWithDomain:v12 code:5 userInfo:v13];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }
}

uint64_t __80__RBRequestManager_executeLaunchRequest_euid_requestor_entitlements_completion___block_invoke_21( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void).cxx_destruct
{
}

- (void)_checkAndAdjustLaunchRequest:requestor:entitlements:.cold.1()
{
}

void __60__RBRequestManager_acquireDroppedLaunchAssertion_requestor___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl( &dword_188634000,  log,  OS_LOG_TYPE_ERROR,  "Error acquiring launch assertion for target: %@: identifier %{public}@ error: <%{public}@>",  (uint8_t *)&v5,  0x20u);
}

- (void)executeLaunchRequest:(uint64_t)a1 euid:(os_log_s *)a2 requestor:entitlements:completion:.cold.1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_188634000,  a2,  OS_LOG_TYPE_ERROR,  "Rejecting launch request because %{public}@ is not entitled to launch processes",  (uint8_t *)&v2,  0xCu);
}

@end