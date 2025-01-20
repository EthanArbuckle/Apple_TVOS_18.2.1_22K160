@interface RBConnectionClient
+ (id)sharedLaunchWorkloop;
+ (id)sharedTerminationWorkloop;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasEntitlementDomain:(unint64_t)a3;
- (BOOL)intendToExit:(void *)a3 withStatus:(void *)a4 error:;
- (BOOL)invalidateAssertionWithIdentifier:(uint64_t)a3 sync:(void *)a4 error:;
- (BOOL)subscribeToProcessStateChangesWithConfiguration:(void *)a3 error:;
- (NSString)description;
- (NSString)stateCaptureTitle;
- (RBConnectionClient)init;
- (__CFString)lookupProcessName:(void *)a3 error:;
- (id)assertionDescriptorsWithFlattenedAttributes:(void *)a3 error:;
- (id)busyExtensionInstancesFromSet:(void *)a3 error:;
- (id)handshakeWithRequest:(uint64_t)a1;
- (id)hostProcessForInstance:(void *)a3 error:;
- (id)identifiersForStateCaptureSubsystemsWithError:(id *)a1;
- (id)infoPlistResultForInstance:(void *)a3 forKeys:(void *)a4 error:;
- (id)initWithContext:(void *)a3 listener:(void *)a4 process:(void *)a5 connection:;
- (id)lastExitContextForInstance:(void *)a3 error:;
- (id)limitationsForInstance:(void *)a3 error:;
- (id)lookupHandleForKey:(void *)a3 error:;
- (id)lookupHandleForPredicate:(void *)a3 error:;
- (id)lookupPortForIdentifier:(void *)a3 error:;
- (id)preventLaunchPredicates;
- (id)subscribeToProcessDeath:(void *)a3 error:;
- (uint64_t)_canInvalidateAssertionWithIdentifier:(void *)a3 error:;
- (uint64_t)_predicatesMatchOnlyAllowedProcess:(uint64_t)a1;
- (uint64_t)processIdentifier;
- (uint64_t)processIdentity;
- (uint64_t)saveEndowment:(void *)a3 withError:;
- (void)_addStatesForUntrackedProcessesTo:(void *)a3 withPredicate:;
- (void)_requestPluginHoldForProxy:(int)a3 terminate:(void *)a4 completion:;
- (void)_setReadyWithConnection:(uint64_t)a1;
- (void)_trackTargetProcessForDescriptor:(uint64_t)a1;
- (void)acquireAssertionForDescriptor:(void *)a3 withReply:;
- (void)captureStateForSubsystem:(void *)a3 withReply:;
- (void)cleanupHolds;
- (void)didInvalidateAssertions:(uint64_t)a1;
- (void)didRemoveProcess:(uint64_t)a1 withState:(void *)a2;
- (void)didUpdateProcessStates:(uint64_t)a1;
- (void)executeLaunchRequest:(uint64_t)a3 withEuid:(void *)a4 withReply:;
- (void)executeTerminateRequest:(void *)a3 withReply:;
- (void)expandPredicateForContained:(uint64_t)a1;
- (void)handleMessage:(uint64_t)a1;
- (void)inheritanceManager:(id)a3 didChangeInheritances:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)isIdentityAnAngel:(void *)a3 withError:;
- (void)preventLaunchPredicates;
- (void)statesForPredicate:(void *)a3 withDescriptor:(void *)a4 withReply:;
- (void)unsubscribeFromProcessStateChangesWithIdentifier:(uint64_t)a1;
- (void)willExpireAssertionsSoonForProcess:(double)a3 expirationTime:;
- (void)willInvalidateAssertion:(uint64_t)a1;
@end

@implementation RBConnectionClient

+ (id)sharedTerminationWorkloop
{
  if (sharedTerminationWorkloop_onceToken != -1) {
    dispatch_once(&sharedTerminationWorkloop_onceToken, &__block_literal_global_8);
  }
  return (id)sharedTerminationWorkloop_workloop;
}

void __47__RBConnectionClient_sharedTerminationWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("RBConnectionClientTermination");
  v1 = (void *)sharedTerminationWorkloop_workloop;
  sharedTerminationWorkloop_workloop = (uint64_t)inactive;

  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)sharedTerminationWorkloop_workloop);
}

+ (id)sharedLaunchWorkloop
{
  if (sharedLaunchWorkloop_onceToken != -1) {
    dispatch_once(&sharedLaunchWorkloop_onceToken, &__block_literal_global_3);
  }
  return (id)sharedLaunchWorkloop_workloop;
}

void __42__RBConnectionClient_sharedLaunchWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("RBConnectionClientLaunch");
  v1 = (void *)sharedLaunchWorkloop_workloop;
  sharedLaunchWorkloop_workloop = (uint64_t)inactive;

  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)sharedLaunchWorkloop_workloop);
}

- (RBConnectionClient)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBConnectionClient.m" lineNumber:150 description:@"-init is not allowed on RBConnectionClient"];

  return 0LL;
}

- (id)initWithContext:(void *)a3 listener:(void *)a4 process:(void *)a5 connection:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!a1) {
    goto LABEL_6;
  }
  if (v12)
  {
    if (v10) {
      goto LABEL_4;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 handleFailureInMethod:sel_initWithContext_listener_process_connection_, a1, @"RBConnectionClient.m", 155, @"Invalid parameter not satisfying: %@", @"process" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  [v46 handleFailureInMethod:sel_initWithContext_listener_process_connection_, a1, @"RBConnectionClient.m", 156, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

LABEL_4:
  v47.receiver = a1;
  v47.super_class = (Class)&OBJC_CLASS___RBConnectionClient;
  v14 = (id *)objc_msgSendSuper2(&v47, sel_init);
  a1 = v14;
  if (v14)
  {
    objc_storeStrong(v14 + 8, a2);
    uint64_t v15 = [v10 assertionManager];
    id v16 = a1[3];
    a1[3] = (id)v15;

    uint64_t v17 = [v10 entitlementManager];
    id v18 = a1[4];
    a1[4] = (id)v17;

    uint64_t v19 = [v10 processManager];
    id v20 = a1[5];
    a1[5] = (id)v19;

    uint64_t v21 = [v10 processMonitor];
    id v22 = a1[6];
    a1[6] = (id)v21;

    uint64_t v23 = [v10 stateCaptureManager];
    id v24 = a1[7];
    a1[7] = (id)v23;

    uint64_t v25 = [v10 requestManager];
    id v26 = a1[9];
    a1[9] = (id)v25;

    objc_storeStrong(a1 + 10, a3);
    uint64_t v27 = [v10 process];
    id v28 = a1[11];
    a1[11] = (id)v27;

    uint64_t v29 = [MEMORY[0x189603FE0] set];
    id v30 = a1[21];
    a1[21] = (id)v29;

    uint64_t v31 = [MEMORY[0x189603FE0] set];
    id v32 = a1[22];
    a1[22] = (id)v31;

    a1[2] = 0LL;
    id v33 = a1[24];
    a1[24] = 0LL;

    *((_BYTE *)a1 + 96) = 0;
    objc_storeStrong(a1 + 14, a4);
    uint64_t v34 = [v12 handle];
    id v35 = a1[15];
    a1[15] = (id)v34;

    uint64_t v36 = [v12 identity];
    id v37 = a1[16];
    a1[16] = (id)v36;

    uint64_t v38 = [v12 identifier];
    id v39 = a1[17];
    a1[17] = (id)v38;

    *((_DWORD *)a1 + 36) = 0;
    uint64_t v40 = [v12 shortDescription];
    id v41 = a1[13];
    a1[13] = (id)v40;

    uint64_t v42 = [a1[4] entitlementsForProcess:a1[14]];
    id v43 = a1[20];
    a1[20] = (id)v42;

    objc_storeStrong(a1 + 1, a5);
    [a1[7] addItem:a1];
  }

- (void)_setReadyWithConnection:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    rbs_connection_log();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 112) shortDescription];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v22 = 138543362;
      uint64_t v23 = v6;
      _os_log_impl( &dword_188634000,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting client for %{public}@ as ready",  (uint8_t *)&v22,  0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(_BYTE *)(a1 + 96))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    }

    else
    {
      *(_BYTE *)(a1 + 96) = 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      v7 = *(void **)(a1 + 24);
      [*(id *)(a1 + 120) identity];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 stateForIdentity:v8];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 inheritances];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 allInheritances];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      id v12 = -[RBClientInheritanceManager initWithInheritances:delegate:]( objc_alloc(&OBJC_CLASS___RBClientInheritanceManager),  "initWithInheritances:delegate:",  v11,  a1);
      id v13 = objc_alloc(&OBJC_CLASS___RBProcessMonitorObserver);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 112);
      id v16 = -[RBProcessMonitorObserverConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___RBProcessMonitorObserverConnection),  "initWithConnection:",  v4);
      uint64_t v17 = -[RBProcessMonitorObserver initWithMonitor:forProcess:connection:]( v13,  "initWithMonitor:forProcess:connection:",  v14,  v15,  v16);

      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      objc_storeStrong((id *)(a1 + 8), a2);
      id v18 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = v12;
      uint64_t v19 = v12;

      id v20 = *(void **)(a1 + 184);
      *(void *)(a1 + 184) = v17;
      uint64_t v21 = v17;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      -[RBConnectionListener connectionIsReady:](*(void *)(a1 + 80), (void *)a1);
    }
  }
}

- (void)handleMessage:(uint64_t)a1
{
  uint64_t v214 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x1896123B8] messageForXPCMessage:v3];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && ([v4 isEmpty] & 1) == 0)
    {
      uint64_t v6 = [v5 method];
      if (v6)
      {
        v7 = (const char *)v6;
        [v5 reply];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 payload];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v190 = 0LL;
        v191 = &v190;
        uint64_t v192 = 0x3032000000LL;
        uint64_t v10 = MEMORY[0x1895F87A8];
        v193 = __Block_byref_object_copy__2;
        v194 = __Block_byref_object_dispose__2;
        v187[0] = MEMORY[0x1895F87A8];
        v187[1] = 3221225472LL;
        v187[2] = __36__RBConnectionClient_handleMessage___block_invoke;
        v187[3] = &unk_18A2563B8;
        v187[4] = a1;
        id v40 = v9;
        id v188 = v40;
        id v38 = v8;
        id v189 = v38;
        id v195 = (id)MEMORY[0x1895CA0E4](v187);
        uint64_t v11 = xpc_dictionary_get_remote_connection(v3);
        RBSInvalidRealAuditToken();
        xpc_connection_get_audit_token();
        *(_OWORD *)atoken = v185;
        *(_OWORD *)&atoken[16] = v186;
        if (RBSRealAuditTokenValid())
        {
          *(_OWORD *)atoken = v185;
          *(_OWORD *)&atoken[16] = v186;
          uid_t v41 = audit_token_to_euid((audit_token_t *)atoken);
          *(_OWORD *)atoken = v185;
          *(_OWORD *)&atoken[16] = v186;
          uid_t v12 = audit_token_to_auid((audit_token_t *)atoken);
          if (v12 + 1 >= 2) {
            uid_t v13 = v12;
          }
          else {
            uid_t v13 = v41;
          }
        }

        else
        {
          uid_t v13 = 0;
          uid_t v41 = 0;
        }

        uint64_t v213 = 0LL;
        memset(v212, 0, sizeof(v212));
        __int128 v211 = 0u;
        __int128 v210 = 0u;
        __int128 v209 = 0u;
        memset(&atoken[4], 0, 32);
        *(_DWORD *)atoken = 2;
        id v39 = (void *)v11;
        uint64_t v17 = 0LL;
        if (!kpersona_info() && *(_DWORD *)&atoken[8] <= 5u && ((1 << atoken[8]) & 0x26) != 0)
        {
          [NSString stringWithUTF8String:&v212[4]];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        }

        rbs_message_log();
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = v3;
          uint64_t v20 = *(void *)(a1 + 112);
          NSStringFromSelector(v7);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          *(void *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v41;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v13;
          *(_WORD *)v207 = 2114;
          *(void *)&v207[2] = v17;
          *(_WORD *)&v207[10] = 2114;
          *(void *)&v207[12] = v21;
          _os_log_impl( &dword_188634000,  v18,  OS_LOG_TYPE_INFO,  "PERF: Received request from %{public}@ (euid %d, auid %d) (persona %{public}@): %{public}@",  buf,  0x2Cu);

          id v3 = v19;
          uint64_t v10 = MEMORY[0x1895F87A8];
        }

        if ((_os_feature_enabled_impl() & 1) == 0)
        {

          uint64_t v17 = 0LL;
        }

        v182[0] = v10;
        v182[1] = 3221225472LL;
        v182[2] = __36__RBConnectionClient_handleMessage___block_invoke_26;
        v182[3] = &unk_18A2563E0;
        uid_t v184 = v41;
        id v22 = v17;
        id v183 = v22;
        id v37 = (void *)MEMORY[0x1895CA0E4](v182);
        v179[0] = v10;
        v179[1] = 3221225472LL;
        v179[2] = __36__RBConnectionClient_handleMessage___block_invoke_2;
        v179[3] = &unk_18A256408;
        uid_t v181 = v13;
        id v23 = v22;
        id v180 = v23;
        uint64_t v36 = (void *)MEMORY[0x1895CA0E4](v179);
        v176[0] = v10;
        v176[1] = 3221225472LL;
        v176[2] = __36__RBConnectionClient_handleMessage___block_invoke_3;
        v176[3] = &unk_18A256430;
        uid_t v178 = v13;
        id v24 = v23;
        id v177 = v24;
        uint64_t v25 = (void *)MEMORY[0x1895CA0E4](v176);
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        *(void *)v207 = __Block_byref_object_copy__30;
        *(void *)&v207[8] = __Block_byref_object_dispose__31;
        *(void *)&v207[16] = 0LL;
        if (v7 == sel_handshakeWithRequest_)
        {
          activity_block[0] = v10;
          activity_block[1] = 3221225472LL;
          activity_block[2] = __36__RBConnectionClient_handleMessage___block_invoke_34;
          activity_block[3] = &unk_18A256458;
          v174 = buf;
          id v170 = v5;
          uint64_t v171 = a1;
          id v172 = v39;
          uid_t v175 = v41;
          id v173 = v40;
          _os_activity_initiate(&dword_188634000, "handshakeWithRequest", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
        }

        else if (v7 == sel_lookupHandleForKey_error_)
        {
          v164[0] = v10;
          v164[1] = 3221225472LL;
          v164[2] = __36__RBConnectionClient_handleMessage___block_invoke_2_40;
          v164[3] = &unk_18A256480;
          v168 = buf;
          id v165 = v5;
          uint64_t v166 = a1;
          id v167 = v40;
          _os_activity_initiate(&dword_188634000, "lookupHandleForKey", OS_ACTIVITY_FLAG_DEFAULT, v164);
        }

        else if (v7 == sel_lookupProcessName_error_)
        {
          v159[0] = v10;
          v159[1] = 3221225472LL;
          v159[2] = __36__RBConnectionClient_handleMessage___block_invoke_3_44;
          v159[3] = &unk_18A256480;
          v163 = buf;
          id v160 = v5;
          uint64_t v161 = a1;
          id v162 = v40;
          _os_activity_initiate(&dword_188634000, "lookupProcessName", OS_ACTIVITY_FLAG_DEFAULT, v159);
        }

        else if (v7 == sel_lookupHandleForPredicate_error_)
        {
          rbs_message_log();
          id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = *(void *)(a1 + 112);
            *(_DWORD *)v198 = 138544130;
            uint64_t v199 = v34;
            __int16 v200 = 1024;
            uid_t v201 = v41;
            __int16 v202 = 1024;
            uid_t v203 = v13;
            __int16 v204 = 2114;
            id v205 = v24;
            _os_log_impl( &dword_188634000,  v33,  OS_LOG_TYPE_DEFAULT,  "PERF: Received lookupHandleForPredicate request from %{public}@ (euid %d, auid %d) (persona %{public}@)",  v198,  0x22u);
          }

          v154[0] = v10;
          v154[1] = 3221225472LL;
          v154[2] = __36__RBConnectionClient_handleMessage___block_invoke_47;
          v154[3] = &unk_18A256480;
          v158 = buf;
          id v155 = v5;
          uint64_t v156 = a1;
          id v157 = v40;
          _os_activity_initiate(&dword_188634000, "lookupHandleForPredicate", OS_ACTIVITY_FLAG_DEFAULT, v154);
        }

        else if (v7 == sel_lookupPortForIdentifier_error_)
        {
          v149[0] = v10;
          v149[1] = 3221225472LL;
          v149[2] = __36__RBConnectionClient_handleMessage___block_invoke_2_51;
          v149[3] = &unk_18A256480;
          v153 = buf;
          id v150 = v5;
          uint64_t v151 = a1;
          id v152 = v40;
          _os_activity_initiate(&dword_188634000, "lookupPortForIdentifier", OS_ACTIVITY_FLAG_DEFAULT, v149);
        }

        else if (v7 == sel_acquireAssertionWithDescriptor_error_)
        {
          v142[0] = v10;
          v142[1] = 3221225472LL;
          v142[2] = __36__RBConnectionClient_handleMessage___block_invoke_3_55;
          v142[3] = &unk_18A2564A8;
          id v143 = v5;
          v147 = buf;
          id v146 = v37;
          uint64_t v144 = a1;
          id v145 = v38;
          v148 = &v190;
          _os_activity_initiate(&dword_188634000, "acquireAssertionWithDescriptor", OS_ACTIVITY_FLAG_DEFAULT, v142);
        }

        else if (v7 == sel_async_invalidateAssertionWithIdentifier_)
        {
          v138[0] = v10;
          v138[1] = 3221225472LL;
          v138[2] = __36__RBConnectionClient_handleMessage___block_invoke_4;
          v138[3] = &unk_18A2564D0;
          v141 = buf;
          id v139 = v5;
          uint64_t v140 = a1;
          _os_activity_initiate(&dword_188634000, "invalidateAssertionWithIdentifier", OS_ACTIVITY_FLAG_DEFAULT, v138);
        }

        else if (v7 == sel_void_invalidateAssertionWithIdentifier_error_)
        {
          v134[0] = v10;
          v134[1] = 3221225472LL;
          v134[2] = __36__RBConnectionClient_handleMessage___block_invoke_5;
          v134[3] = &unk_18A2564D0;
          v137 = buf;
          id v135 = v5;
          uint64_t v136 = a1;
          _os_activity_initiate(&dword_188634000, "invalidateAssertionWithIdentifier", OS_ACTIVITY_FLAG_DEFAULT, v134);
        }

        else if (v7 == sel_assertionDescriptorsWithFlattenedAttributes_error_)
        {
          v129[0] = v10;
          v129[1] = 3221225472LL;
          v129[2] = __36__RBConnectionClient_handleMessage___block_invoke_6;
          v129[3] = &unk_18A256480;
          v133 = buf;
          id v130 = v5;
          uint64_t v131 = a1;
          id v132 = v40;
          _os_activity_initiate( &dword_188634000,  "assertionDescriptorsWithFlattenedAttributes",  OS_ACTIVITY_FLAG_DEFAULT,  v129);
        }

        else if (v7 == sel_executeLaunchRequest_error_)
        {
          v121[0] = v10;
          v121[1] = 3221225472LL;
          v121[2] = __36__RBConnectionClient_handleMessage___block_invoke_7;
          v121[3] = &unk_18A2564F8;
          id v122 = v5;
          v126 = buf;
          id v125 = v36;
          uint64_t v123 = a1;
          uid_t v128 = v41;
          id v124 = v38;
          v127 = &v190;
          _os_activity_initiate(&dword_188634000, "executeLaunchRequest", OS_ACTIVITY_FLAG_DEFAULT, v121);
        }

        else if (v7 == sel_executeTerminateRequest_identifier_error_)
        {
          v115[0] = v10;
          v115[1] = 3221225472LL;
          v115[2] = __36__RBConnectionClient_handleMessage___block_invoke_8;
          v115[3] = &unk_18A256520;
          v119 = buf;
          id v116 = v5;
          uint64_t v117 = a1;
          id v118 = v38;
          v120 = &v190;
          _os_activity_initiate(&dword_188634000, "executeTerminateRequest", OS_ACTIVITY_FLAG_DEFAULT, v115);
        }

        else if (v7 == sel_subscribeToProcessDeath_error_)
        {
          v110[0] = v10;
          v110[1] = 3221225472LL;
          v110[2] = __36__RBConnectionClient_handleMessage___block_invoke_9;
          v110[3] = &unk_18A256480;
          v114 = buf;
          id v111 = v5;
          uint64_t v112 = a1;
          id v113 = v40;
          _os_activity_initiate(&dword_188634000, "subscribeToProcessDeath", OS_ACTIVITY_FLAG_DEFAULT, v110);
        }

        else if (v7 == sel_void_subscribeToProcessStateChangesWithConfiguration_error_)
        {
          v106[0] = v10;
          v106[1] = 3221225472LL;
          v106[2] = __36__RBConnectionClient_handleMessage___block_invoke_10;
          v106[3] = &unk_18A2564D0;
          v109 = buf;
          id v107 = v5;
          uint64_t v108 = a1;
          _os_activity_initiate( &dword_188634000,  "subscribeToProcessStateChangesWithConfiguration",  OS_ACTIVITY_FLAG_DEFAULT,  v106);
        }

        else if (v7 == sel_async_unsubscribeFromProcessStateChangesWithIdentifier_)
        {
          v102[0] = v10;
          v102[1] = 3221225472LL;
          v102[2] = __36__RBConnectionClient_handleMessage___block_invoke_11;
          v102[3] = &unk_18A2564D0;
          v105 = buf;
          id v103 = v5;
          uint64_t v104 = a1;
          _os_activity_initiate( &dword_188634000,  "unsubscribeFromProcessStateChangesWithIdentifier",  OS_ACTIVITY_FLAG_DEFAULT,  v102);
        }

        else if (v7 == sel_statesForPredicate_descriptor_error_)
        {
          v96[0] = v10;
          v96[1] = 3221225472LL;
          v96[2] = __36__RBConnectionClient_handleMessage___block_invoke_12;
          v96[3] = &unk_18A256520;
          v100 = buf;
          id v97 = v5;
          uint64_t v98 = a1;
          id v99 = v38;
          v101 = &v190;
          _os_activity_initiate(&dword_188634000, "statesForPredicate", OS_ACTIVITY_FLAG_DEFAULT, v96);
        }

        else if (v7 == sel_void_intendToExit_withStatus_)
        {
          v91[0] = v10;
          v91[1] = 3221225472LL;
          v91[2] = __36__RBConnectionClient_handleMessage___block_invoke_13;
          v91[3] = &unk_18A256548;
          id v92 = v5;
          v95 = buf;
          id v94 = v25;
          uint64_t v93 = a1;
          _os_activity_initiate(&dword_188634000, "intendToExit", OS_ACTIVITY_FLAG_DEFAULT, v91);
        }

        else if (v7 == sel_lastExitContextForInstance_error_)
        {
          v85[0] = v10;
          v85[1] = 3221225472LL;
          v85[2] = __36__RBConnectionClient_handleMessage___block_invoke_14;
          v85[3] = &unk_18A256570;
          id v86 = v5;
          v90 = buf;
          id v89 = v25;
          uint64_t v87 = a1;
          id v88 = v40;
          _os_activity_initiate(&dword_188634000, "lastExitContextForInstance", OS_ACTIVITY_FLAG_DEFAULT, v85);
        }

        else if (v7 == sel_limitationsForInstance_error_)
        {
          v79[0] = v10;
          v79[1] = 3221225472LL;
          v79[2] = __36__RBConnectionClient_handleMessage___block_invoke_15;
          v79[3] = &unk_18A256570;
          id v80 = v5;
          v84 = buf;
          id v83 = v25;
          uint64_t v81 = a1;
          id v82 = v40;
          _os_activity_initiate(&dword_188634000, "limitationsForInstance", OS_ACTIVITY_FLAG_DEFAULT, v79);
        }

        else if (v7 == sel_hostProcessForInstance_error_)
        {
          v73[0] = v10;
          v73[1] = 3221225472LL;
          v73[2] = __36__RBConnectionClient_handleMessage___block_invoke_16;
          v73[3] = &unk_18A256570;
          id v74 = v5;
          v78 = buf;
          id v77 = v25;
          uint64_t v75 = a1;
          id v76 = v40;
          _os_activity_initiate(&dword_188634000, "hostProcessForInstance", OS_ACTIVITY_FLAG_DEFAULT, v73);
        }

        else if (v7 == sel_infoPlistResultForInstance_forKeys_error_)
        {
          v68[0] = v10;
          v68[1] = 3221225472LL;
          v68[2] = __36__RBConnectionClient_handleMessage___block_invoke_17;
          v68[3] = &unk_18A256480;
          v72 = buf;
          id v69 = v5;
          uint64_t v70 = a1;
          id v71 = v40;
          _os_activity_initiate(&dword_188634000, "infoPlistResultForInstance", OS_ACTIVITY_FLAG_DEFAULT, v68);
        }

        else if (v7 == sel_captureStateForSubsystem_error_)
        {
          v62[0] = v10;
          v62[1] = 3221225472LL;
          v62[2] = __36__RBConnectionClient_handleMessage___block_invoke_18;
          v62[3] = &unk_18A256520;
          v66 = buf;
          id v63 = v5;
          uint64_t v64 = a1;
          id v65 = v38;
          v67 = &v190;
          _os_activity_initiate(&dword_188634000, "captureStateForSubsystem", OS_ACTIVITY_FLAG_DEFAULT, v62);
        }

        else if (v7 == sel_identifiersForStateCaptureSubsystemsWithError_)
        {
          v59[0] = v10;
          v59[1] = 3221225472LL;
          v59[2] = __36__RBConnectionClient_handleMessage___block_invoke_19;
          v59[3] = &unk_18A2564D0;
          v59[4] = a1;
          v61 = buf;
          id v60 = v40;
          _os_activity_initiate( &dword_188634000,  "identifiersForStateCaptureSubsystemsWithError",  OS_ACTIVITY_FLAG_DEFAULT,  v59);
        }

        else if (v7 == sel_busyExtensionInstancesFromSet_error_)
        {
          v54[0] = v10;
          v54[1] = 3221225472LL;
          v54[2] = __36__RBConnectionClient_handleMessage___block_invoke_20;
          v54[3] = &unk_18A256480;
          v58 = buf;
          id v55 = v5;
          uint64_t v56 = a1;
          id v57 = v40;
          _os_activity_initiate(&dword_188634000, "busyExtensionInstancesFromSet", OS_ACTIVITY_FLAG_DEFAULT, v54);
        }

        else if (v7 == sel_preventLaunchPredicatesWithError_)
        {
          v52[0] = v10;
          v52[1] = 3221225472LL;
          v52[2] = __36__RBConnectionClient_handleMessage___block_invoke_21;
          v52[3] = &unk_18A255B00;
          v52[4] = a1;
          id v53 = v40;
          _os_activity_initiate(&dword_188634000, "preventLaunchPredicates", OS_ACTIVITY_FLAG_DEFAULT, v52);
        }

        else if (v7 == sel_saveEndowment_withError_)
        {
          v47[0] = v10;
          v47[1] = 3221225472LL;
          v47[2] = __36__RBConnectionClient_handleMessage___block_invoke_22;
          v47[3] = &unk_18A256480;
          v51 = buf;
          id v48 = v5;
          uint64_t v49 = a1;
          id v50 = v40;
          _os_activity_initiate(&dword_188634000, "saveEndowment", OS_ACTIVITY_FLAG_DEFAULT, v47);
        }

        else if (v7 == sel_isIdentityAnAngel_withError_)
        {
          v42[0] = v10;
          v42[1] = 3221225472LL;
          v42[2] = __36__RBConnectionClient_handleMessage___block_invoke_23;
          v42[3] = &unk_18A256480;
          v46 = buf;
          id v43 = v5;
          uint64_t v44 = a1;
          id v45 = v40;
          _os_activity_initiate(&dword_188634000, "isIdentityAnAngel", OS_ACTIVITY_FLAG_DEFAULT, v42);
        }

        else
        {
          rbs_connection_log();
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            uint64_t v27 = *(void *)(a1 + 112);
            NSStringFromSelector(v7);
            id v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBConnectionClient handleMessage:].cold.2(v27, v28, (uint64_t)v198, v26);
          }

          uint64_t v29 = (void *)MEMORY[0x189607870];
          uint64_t v196 = *MEMORY[0x1896075F0];
          v197 = @"The server has no implementation for this message";
          [MEMORY[0x189603F68] dictionaryWithObjects:&v197 forKeys:&v196 count:1];
          id v30 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v31 = [v29 errorWithDomain:*MEMORY[0x1896124C0] code:501 userInfo:v30];
          id v32 = *(void **)(*(void *)&buf[8] + 40LL);
          *(void *)(*(void *)&buf[8] + 40LL) = v31;
        }

        uint64_t v35 = v191[5];
        if (v35) {
          (*(void (**)(uint64_t, void))(v35 + 16))(v35, *(void *)(*(void *)&buf[8] + 40LL));
        }
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v190, 8);
        uint64_t v15 = (os_log_s *)v38;
      }

      else
      {
        rbs_connection_log();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          -[RBConnectionClient handleMessage:].cold.1(a1, v14, v16);
          uint64_t v15 = v14;
        }
      }
    }
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    int v5 = objc_msgSend(v3, "rbs_isPermanentFailure");
    rbs_connection_log();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __36__RBConnectionClient_handleMessage___block_invoke_cold_1();
      }
    }

    else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 112LL);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uid_t v13 = v4;
      _os_log_impl( &dword_188634000,  v7,  OS_LOG_TYPE_INFO,  "Error handling message from %{public}@: <%{public}@>",  (uint8_t *)&v10,  0x16u);
    }
  }

  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    [v9 encodeObject:v4 forKey:*MEMORY[0x1896124E8]];
    [*(id *)(a1 + 48) send];
  }
}

id __36__RBConnectionClient_handleMessage___block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 copyWithEuid:*(unsigned int *)(a1 + 40)];
  [v3 processIdentity];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 personaString];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_5:
    return v3;
  }

  uint64_t v6 = *(void *)(a1 + 32);

  if (v6)
  {
    id v4 = v3;
    id v3 = (void *)[v3 copyWithPersonaString:*(void *)(a1 + 32)];
    goto LABEL_5;
  }

  return v3;
}

id __36__RBConnectionClient_handleMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 copyWithAuid:*(unsigned int *)(a1 + 40)];
  [v3 personaString];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    goto LABEL_4;
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = objc_msgSend(v3, "copyWithPersonaString:");
    id v4 = v3;
    id v3 = (void *)v5;
LABEL_4:
  }

  return v3;
}

id __36__RBConnectionClient_handleMessage___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 copyWithAuid:*(unsigned int *)(a1 + 40)];
  [v3 identity];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 personaString];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_5:
    return v3;
  }

  uint64_t v6 = *(void *)(a1 + 32);

  if (v6)
  {
    id v4 = v3;
    id v3 = (void *)[v3 copyWithPersonaString:*(void *)(a1 + 32)];
    goto LABEL_5;
  }

  return v3;
}

void __36__RBConnectionClient_handleMessage___block_invoke_34(uint64_t a1)
{
  v15[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v6)
  {
    v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896124C0];
    uint64_t v14 = *MEMORY[0x189607798];
    v15[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8LL);
    __int16 v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else
  {
    -[RBConnectionClient _setReadyWithConnection:](*(void *)(a1 + 40), *(void **)(a1 + 48));
    [v5 setEuid:*(unsigned int *)(a1 + 72)];
    v9 = -[RBConnectionClient handshakeWithRequest:](*(void *)(a1 + 40), v5);
    [*(id *)(a1 + 56) encodeObject:v9 forKey:*MEMORY[0x1896124F8]];
  }
}

- (id)handshakeWithRequest:(uint64_t)a1
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uid_t v41 = v3;
  if (a1)
  {
    id v4 = v3;
    rbs_connection_log();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 136);
      [v4 assertionDescriptors];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v6;
      __int16 v62 = 2050;
      uint64_t v63 = [v7 count];
      _os_log_impl( &dword_188634000,  v5,  OS_LOG_TYPE_DEFAULT,  "Received handshake request from %{public}@ with %{public}lu assertion descriptors",  buf,  0x16u);
    }

    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    [v4 savedEndowments];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v55;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(v8);
          }
          -[RBConnectionClient saveEndowment:withError:](a1, *(void **)(*((void *)&v54 + 1) + 8 * i), 0LL);
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }

      while (v10);
    }

    [MEMORY[0x189603FC8] dictionary];
    id v40 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FC8] dictionary];
    id v39 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FA8] array];
    id v43 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FA8] array];
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    [v4 assertionDescriptors];
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v45 = *(void *)v51;
      do
      {
        for (uint64_t j = 0LL; j != v14; ++j)
        {
          if (*(void *)v51 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v50 + 1) + 8 * j);
          [v16 identifier];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            [v43 addObject:v17];
            objc_msgSend(MEMORY[0x189612170], "identifierWithClientPid:", objc_msgSend(*(id *)(a1 + 112), "rbs_pid"));
            id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            id v19 = (void *)[v16 copyWithIdentifier:v18];
            uint64_t v20 = *(void **)(a1 + 40);
            [v19 target];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 processIdentifier];
            id v22 = (void *)objc_claimAutoreleasedReturnValue();
            id v23 = (id)[v20 processForIdentifier:v22];

            [v44 addObject:v16];
          }

          else
          {
            rbs_assertion_log();
            id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v61 = v16;
              _os_log_error_impl( &dword_188634000,  v18,  OS_LOG_TYPE_ERROR,  "Handshake request contains assertion %{public}@ without old identifier",  buf,  0xCu);
            }
          }
        }

        uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      }

      while (v14);
    }

    +[RBAssertionBatchContext contextForProcess:acquisitionCompletionPolicy:withDescriptorsToAcquire:identifiersToInvalidate:daemonContext:]( &OBJC_CLASS___RBAssertionBatchContext,  "contextForProcess:acquisitionCompletionPolicy:withDescriptorsToAcquire:identifiersToInvalidate:daemonContext:",  *(void *)(a1 + 112),  0LL,  v44,  MEMORY[0x189604A58],  *(void *)(a1 + 64));
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = *(void **)(a1 + 24);
    v46[0] = MEMORY[0x1895F87A8];
    v46[1] = 3221225472LL;
    v46[2] = __43__RBConnectionClient_handshakeWithRequest___block_invoke;
    v46[3] = &unk_18A256598;
    v46[4] = a1;
    id v26 = v43;
    id v47 = v26;
    id v27 = v40;
    id v48 = v27;
    id v28 = v39;
    id v49 = v28;
    [v25 commitBatchWithContext:v24 completion:v46];
    rbs_connection_log();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = *(void **)(a1 + 136);
      *(_DWORD *)buf = 138543362;
      v61 = v30;
      _os_log_impl( &dword_188634000,  v29,  OS_LOG_TYPE_DEFAULT,  "Handshake successful with %{public}@; sending response",
        buf,
        0xCu);
    }

    [v41 assertionDescriptors];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [v31 count];

    uint64_t v33 = [v27 count];
    uint64_t v34 = [v28 count] + v33;
    if (v34 != v32)
    {
      rbs_connection_log();
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[RBConnectionClient handshakeWithRequest:].cold.1(v32, v34, v35);
      }
    }

    id v36 = objc_alloc_init(MEMORY[0x189612210]);
    [v36 setHandle:*(void *)(a1 + 120)];
    [v36 setAssertionIdentifiersByOldIdentifier:v27];
    [v36 setAssertionErrorsByOldIdentifier:v28];
    [*(id *)(a1 + 112) managedEndpointByLaunchIdentifier];
    id v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 setManagedEndpointByLaunchIdentifier:v37];
  }

  else
  {
    id v36 = 0LL;
  }

  return v36;
}

void __36__RBConnectionClient_handleMessage___block_invoke_2_40(void *a1)
{
  v20[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[7] + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[7] + 8LL);
  uint64_t v9 = *(void *)(v6 + 40);
  uint64_t v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896124C0];
    uint64_t v19 = *MEMORY[0x189607798];
    v20[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(a1[7] + 8LL);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  else
  {
    uint64_t v16 = (void *)a1[5];
    id v17 = 0LL;
    -[RBConnectionClient lookupHandleForKey:error:](v16, v5, &v17);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v17);
    [v12 fullEncode:a1[6] forKey:*MEMORY[0x1896124F8]];
  }
}

- (id)lookupHandleForKey:(void *)a3 error:
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1896122D0], "handleForKey:fetchIfNeeded:", objc_msgSend(v5, "unsignedLongLongValue"), 0);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([a1 hasEntitlementDomain:1])
    {
      if (!v7)
      {
        rbs_general_log();
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[RBConnectionClient lookupHandleForKey:error:].cold.1(v6, v8);
        }

        uint64_t v9 = (void *)MEMORY[0x189607870];
        uint64_t v10 = *MEMORY[0x1896124B0];
        uint64_t v17 = *MEMORY[0x1896075F0];
        id v18 = @"No such process";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        [v9 errorWithDomain:v10 code:3 userInfo:v11];
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }

    else
    {
      if (!v7) {
        goto LABEL_11;
      }
      [MEMORY[0x189612320] predicateMatchingHandle:v7];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v13;
      [MEMORY[0x189603F18] arrayWithObjects:v19 count:1];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      char v15 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v14);

      if ((v15 & 1) == 0)
      {
LABEL_11:
        objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  0);
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
        rbs_connection_log();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[RBConnectionClient lookupHandleForKey:error:].cold.2();
        }
LABEL_13:

        a1 = 0LL;
        if (!a3)
        {
LABEL_15:

          goto LABEL_16;
        }

void __36__RBConnectionClient_handleMessage___block_invoke_3_44(uint64_t a1)
{
  v20[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v9 = *(void *)(v6 + 40);
  uint64_t v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896124C0];
    uint64_t v19 = *MEMORY[0x189607798];
    v20[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
    char v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  else
  {
    uint64_t v16 = *(void **)(a1 + 40);
    id v17 = 0LL;
    -[RBConnectionClient lookupProcessName:error:](v16, v5, &v17);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v17);
    [*(id *)(a1 + 48) encodeObject:v12 forKey:*MEMORY[0x1896124F8]];
  }
}

- (__CFString)lookupProcessName:(void *)a3 error:
{
  v22[11] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a1)
  {
    uint64_t v11 = 0LL;
    goto LABEL_12;
  }

  int v7 = [v5 intValue];
  if ([a1 hasEntitlementDomain:1]) {
    goto LABEL_4;
  }
  [MEMORY[0x189612320] predicateMatchingIdentifier:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v8;
  [MEMORY[0x189603F18] arrayWithObjects:&v20 count:1];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v9);

  if (v10)
  {
LABEL_4:
    if (proc_pidinfo(v7, 3, 0LL, buffer, 136) == 136)
    {
      uint64_t v11 = (__CFString *)[objc_alloc(NSString) initWithUTF8String:v22];
      __int16 v12 = 0LL;
      if (!a3) {
        goto LABEL_11;
      }
    }

    else
    {
      rbs_assertion_log();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient lookupProcessName:error:].cold.1(v7, v13);
      }

      uint64_t v14 = (void *)MEMORY[0x189607870];
      uint64_t v15 = *MEMORY[0x1896124B0];
      uint64_t v18 = *MEMORY[0x1896075F0];
      uint64_t v19 = @"Could not get proc_pidinfo for pid";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 errorWithDomain:v15 code:5 userInfo:v16];
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v11 = @"<unknown>";
      if (!a3) {
        goto LABEL_11;
      }
    }
  }

  else
  {
    objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  0);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = 0LL;
    if (!a3) {
      goto LABEL_11;
    }
  }

  *a3 = v12;
LABEL_11:

LABEL_12:
  return v11;
}

void __36__RBConnectionClient_handleMessage___block_invoke_47(void *a1)
{
  v20[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[7] + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[7] + 8LL);
  uint64_t v9 = *(void *)(v6 + 40);
  uint64_t v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    int v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896124C0];
    uint64_t v19 = *MEMORY[0x189607798];
    v20[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(a1[7] + 8LL);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  else
  {
    uint64_t v16 = a1[5];
    id v17 = 0LL;
    -[RBConnectionClient lookupHandleForPredicate:error:](v16, v5, &v17);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v17);
    [v12 fullEncode:a1[6] forKey:*MEMORY[0x1896124F8]];
  }
}

- (id)lookupHandleForPredicate:(void *)a3 error:
{
  v34[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (!a1)
  {
    int v10 = 0LL;
    goto LABEL_28;
  }

  if (([(id)a1 hasEntitlementDomain:1] & 1) == 0)
  {
    v34[0] = v5;
    [MEMORY[0x189603F18] arrayWithObjects:v34 count:1];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:](a1, v6);

    if (!v7)
    {
      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  0);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient lookupHandleForPredicate:error:].cold.3();
      }
      int v10 = 0LL;
      goto LABEL_21;
    }
  }

  [*(id *)(a1 + 40) processesMatchingPredicate:v5];
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (!-[os_log_s count](v8, "count"))
  {
    __int16 v12 = (void *)MEMORY[0x189607870];
    uint64_t v13 = *MEMORY[0x1896124B0];
    uint64_t v26 = *MEMORY[0x1896075F0];
    id v27 = @"Specified predicate did not match any processes";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 errorWithDomain:v13 code:3 userInfo:v14];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    rbs_connection_log();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 104);
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v15;
      _os_log_impl( &dword_188634000,  v9,  OS_LOG_TYPE_INFO,  "%{public}@ handle lookup could not find a matching process",  buf,  0xCu);
    }

    goto LABEL_19;
  }

  if (-[os_log_s count](v8, "count") != 1)
  {
    uint64_t v16 = (void *)MEMORY[0x189607870];
    uint64_t v17 = *MEMORY[0x1896124B0];
    uint64_t v28 = *MEMORY[0x1896075F0];
    uint64_t v29 = @"Specified predicate matched multiple processes";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 errorWithDomain:v17 code:1 userInfo:v18];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    rbs_connection_log();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBConnectionClient lookupHandleForPredicate:error:].cold.2();
    }
    goto LABEL_19;
  }

  -[os_log_s anyObject](v8, "anyObject");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (([*(id *)(a1 + 40) isActiveProcess:v9] & 1) == 0)
  {
    -[os_log_s rbs_pid](v9, "rbs_pid");
    if (!RBSPIDExists())
    {
      uint64_t v19 = (void *)MEMORY[0x189607870];
      uint64_t v20 = *MEMORY[0x1896124B0];
      uint64_t v32 = *MEMORY[0x1896075F0];
      uint64_t v33 = @"Process is no longer running";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 errorWithDomain:v20 code:3 userInfo:v21];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

      rbs_connection_log();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 104);
        *(_DWORD *)buf = 138543362;
        uint64_t v31 = v23;
        _os_log_impl( &dword_188634000,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@ handle requested for no longer running process",  buf,  0xCu);
      }

LABEL_19:
      int v10 = 0LL;
      goto LABEL_20;
    }
  }

  -[os_log_s handle](v9, "handle");
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = 0LL;
LABEL_20:

LABEL_21:
  if (!v11)
  {
    rbs_connection_log();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[RBConnectionClient lookupHandleForPredicate:error:].cold.1();
    }
  }

  if (a3) {
    *a3 = v11;
  }

LABEL_28:
  return v10;
}

void __36__RBConnectionClient_handleMessage___block_invoke_2_51(uint64_t a1)
{
  v20[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v9 = *(void *)(v6 + 40);
  uint64_t v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    int v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896124C0];
    uint64_t v19 = *MEMORY[0x189607798];
    v20[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  else
  {
    uint64_t v16 = *(id **)(a1 + 40);
    id v17 = 0LL;
    -[RBConnectionClient lookupPortForIdentifier:error:](v16, v5, &v17);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v17);
    [*(id *)(a1 + 48) encodeObject:v12 forKey:*MEMORY[0x1896124F8]];
  }
}

- (id)lookupPortForIdentifier:(void *)a3 error:
{
  id v5 = a2;
  if (!a1)
  {
LABEL_10:
    uint64_t v7 = 0LL;
    goto LABEL_11;
  }

  if (([a1 hasEntitlementDomain:1] & 1) == 0)
  {
    int v6 = objc_msgSend(a1[15], "rbs_pid");
    if (v6 != objc_msgSend(v5, "rbs_pid"))
    {
      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  0);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient lookupPortForIdentifier:error:].cold.1();
      }

      if (a3) {
        *a3 = v8;
      }

      goto LABEL_10;
    }
  }

  objc_msgSend(MEMORY[0x189612268], "taskNameForPID:", objc_msgSend(v5, "rbs_pid"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v7;
}

void __36__RBConnectionClient_handleMessage___block_invoke_3_55(uint64_t a1)
{
  v23[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896124C0];
    uint64_t v20 = *MEMORY[0x189607798];
    uint64_t v21 = v6;
    uint64_t v9 = (void *)MEMORY[0x189603F68];
    int v10 = &v21;
    uint64_t v11 = &v20;
  }

  else
  {
    uint64_t v16 = [v5 target];
    if (v16)
    {
      id v17 = (void *)v16;
      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();

      [v5 setTarget:v12];
      -[RBConnectionClient acquireAssertionForDescriptor:withReply:](*(void *)(a1 + 40), v5, *(void **)(a1 + 48));
      uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8LL);
      uint64_t v15 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = 0LL;
      goto LABEL_6;
    }

    uint64_t v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896124C0];
    uint64_t v22 = *MEMORY[0x1896075F0];
    v23[0] = @"missing valid target";
    uint64_t v9 = (void *)MEMORY[0x189603F68];
    int v10 = v23;
    uint64_t v11 = &v22;
  }

  [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v7 errorWithDomain:v8 code:3 userInfo:v12];
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
LABEL_6:
}

- (void)acquireAssertionForDescriptor:(void *)a3 withReply:
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    -[RBConnectionClient _trackTargetProcessForDescriptor:](a1, v5);
    objc_msgSend(MEMORY[0x189612170], "identifierWithClientPid:", objc_msgSend(*(id *)(a1 + 136), "pid"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (void *)[v5 copyWithIdentifier:v7];

    if (v8)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      [*(id *)(a1 + 168) addObject:v7];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      [v6 prepareForHandoff];
      +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:]( &OBJC_CLASS___RBAssertionAcquisitionContext,  "contextForProcess:withDescriptor:daemonContext:",  *(void *)(a1 + 112),  v8,  *(void *)(a1 + 64));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = *(void **)(a1 + 24);
      uint64_t v17 = MEMORY[0x1895F87A8];
      uint64_t v18 = 3221225472LL;
      uint64_t v19 = __62__RBConnectionClient_acquireAssertionForDescriptor_withReply___block_invoke;
      uint64_t v20 = &unk_18A2563B8;
      id v21 = v6;
      id v22 = v7;
      uint64_t v23 = a1;
      [v10 acquireAssertionWithContext:v9 completion:&v17];
      objc_msgSend(MEMORY[0x1896123C0], "currentContext", v17, v18, v19, v20);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        [MEMORY[0x1896077D8] currentHandler];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 handleFailureInMethod:sel_acquireAssertionForDescriptor_withReply_ object:a1 file:@"RBConnectionClient.m" lineNumber:947 description:@"xpc message context not handled"];
      }
    }

    else
    {
      __int16 v12 = (void *)MEMORY[0x189607870];
      uint64_t v13 = *MEMORY[0x1896124B0];
      uint64_t v24 = *MEMORY[0x1896075F0];
      v25[0] = @"Bad assertion descriptor";
      [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 errorWithDomain:v13 code:1 userInfo:v14];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

      [v6 payload];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 encodeObject:v9 forKey:*MEMORY[0x1896124E8]];

      [v6 send];
    }
  }

  else
  {
    uint64_t v8 = v5;
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_4(void *a1)
{
  v19[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[6] + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[6] + 8LL);
  uint64_t v7 = *(void *)(v6 + 40);
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x1896124C0];
    uint64_t v18 = *MEMORY[0x189607798];
    v19[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v8 errorWithDomain:v9 code:3 userInfo:v10];
    uint64_t v12 = *(void *)(a1[6] + 8LL);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  else
  {
    uint64_t v14 = a1[5];
    id v16 = 0LL;
    -[RBConnectionClient invalidateAssertionWithIdentifier:sync:error:](v14, v5, 0LL, &v16);
    id v15 = v16;
    int v10 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v15;
  }
}

- (BOOL)invalidateAssertionWithIdentifier:(uint64_t)a3 sync:(void *)a4 error:
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v7 = a2;
  if (a1)
  {
    id v21 = 0LL;
    int v8 = -[RBConnectionClient _canInvalidateAssertionWithIdentifier:error:]((id *)a1, v7, &v21);
    id v9 = v21;
    if (v8)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      [*(id *)(a1 + 168) removeObject:v7];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      if (([*(id *)(a1 + 24) invalidateAssertionFromOriginator:*(void *)(a1 + 136) sync:a3 withIdentifier:v7] & 1) == 0)
      {
        int v10 = (void *)MEMORY[0x189607870];
        uint64_t v11 = *MEMORY[0x1896124B0];
        uint64_t v22 = *MEMORY[0x1896075F0];
        v23[0] = @"Assertion invalidation request failed";
        [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v10 errorWithDomain:v11 code:5 userInfo:v12];

        id v9 = (id)v13;
      }
    }

    rbs_sp_assertion_log();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, (const void *)[v7 hash]);

    rbs_sp_assertion_log();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_signpost_emit_with_name_impl( &dword_188634000,  v17,  OS_SIGNPOST_INTERVAL_END,  v15,  "ClientAssertion",  "",  v20,  2u);
    }

    if (a4) {
      *a4 = v9;
    }
    BOOL v18 = v9 == 0LL;
  }

  else
  {
    BOOL v18 = 0LL;
  }

  return v18;
}

void __36__RBConnectionClient_handleMessage___block_invoke_5(void *a1)
{
  v19[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[6] + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[6] + 8LL);
  uint64_t v7 = *(void *)(v6 + 40);
  if (v7)
  {
    int v8 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x1896124C0];
    uint64_t v18 = *MEMORY[0x189607798];
    v19[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v8 errorWithDomain:v9 code:3 userInfo:v10];
    uint64_t v12 = *(void *)(a1[6] + 8LL);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  else
  {
    uint64_t v14 = a1[5];
    id v16 = 0LL;
    -[RBConnectionClient invalidateAssertionWithIdentifier:sync:error:](v14, v5, 1LL, &v16);
    id v15 = v16;
    int v10 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v15;
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_6(uint64_t a1)
{
  v19[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896124C0];
    uint64_t v18 = *MEMORY[0x189607798];
    v19[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else
  {
    uint64_t v13 = *(id **)(a1 + 40);
    uint64_t v14 = [v5 BOOLValue];
    id v15 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    id v16 = 0LL;
    -[RBConnectionClient assertionDescriptorsWithFlattenedAttributes:error:](v13, v14, &v16);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v15, v16);
    [*(id *)(a1 + 48) encodeObject:v9 forKey:*MEMORY[0x1896124F8]];
  }
}

- (id)assertionDescriptorsWithFlattenedAttributes:(void *)a3 error:
{
  if (!a1)
  {
    uint64_t v6 = 0LL;
    return v6;
  }

  if ([a1 hasEntitlement:@"com.apple.runningboard.listallassertions"])
  {
    [a1[3] assertionDescriptorsWithFlattenedAttributes:a2];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = 0LL;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.listallassertions",  1);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = 0LL;
  if (a3) {
LABEL_6:
  }
    *a3 = v7;
LABEL_7:

  return v6;
}

void __36__RBConnectionClient_handleMessage___block_invoke_7(uint64_t a1)
{
  v19[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896124C0];
    uint64_t v18 = *MEMORY[0x189607798];
    v19[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else
  {
    [v5 context];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 identity];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    [v5 context];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setIdentity:v9];

    -[RBConnectionClient executeLaunchRequest:withEuid:withReply:]( *(void **)(a1 + 40),  v5,  *(unsigned int *)(a1 + 80),  *(void **)(a1 + 48));
    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8LL);
    uint64_t v12 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0LL;
  }
}

- (void)executeLaunchRequest:(uint64_t)a3 withEuid:(void *)a4 withReply:
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a1)
  {
    if (!v8)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 handleFailureInMethod:sel_executeLaunchRequest_withEuid_withReply_, a1, @"RBConnectionClient.m", 1003, @"Invalid parameter not satisfying: %@", @"reply" object file lineNumber description];
    }

    [v9 payload];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 prepareForHandoff];
    uint64_t v11 = (void *)a1[9];
    uint64_t v12 = a1[14];
    uint64_t v13 = a1[20];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __62__RBConnectionClient_executeLaunchRequest_withEuid_withReply___block_invoke;
    v16[3] = &unk_18A2565C0;
    id v17 = v10;
    id v18 = v7;
    uint64_t v19 = a1;
    id v20 = v9;
    id v14 = v10;
    [v11 executeLaunchRequest:v18 euid:a3 requestor:v12 entitlements:v13 completion:v16];
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_8(uint64_t a1)
{
  v16[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v6)
  {
    id v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896124C0];
    uint64_t v15 = *MEMORY[0x189607798];
    v16[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else
  {
    -[RBConnectionClient executeTerminateRequest:withReply:](*(void *)(a1 + 40), v5, *(void **)(a1 + 48));
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v9 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0LL;
  }
}

- (void)executeTerminateRequest:(void *)a3 withReply:
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    __int128 v51 = v6;
    rbs_connection_log();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 104);
      char v10 = [v5 targetsAllManagedProcesses];
      if ((v10 & 1) != 0)
      {
        uint64_t v11 = @"All Managed Processes";
      }

      else
      {
        [v5 predicate];
        uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      [v5 context];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      uint64_t v65 = v9;
      __int16 v66 = 2114;
      v67 = v11;
      __int16 v68 = 2114;
      id v69 = v12;
      _os_log_impl( &dword_188634000,  v8,  OS_LOG_TYPE_DEFAULT,  "Received termination request from %{public}@ on %{public}@ with context %{public}@",  buf,  0x20u);
      if ((v10 & 1) == 0) {
    }
      }

    [v5 predicate];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 processIdentifiers];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v52 = v5;
    id v49 = v14;
    if (v14)
    {
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id obj = v14;
      uint64_t v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16, v14);
      if (v15)
      {
        uint64_t v16 = v15;
        int v17 = 0;
        uint64_t v18 = *(void *)v60;
        do
        {
          for (uint64_t i = 0LL; i != v16; ++i)
          {
            if (*(void *)v60 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v59 + 1) + 8 * i);
            id v21 = (id)[*(id *)(a1 + 40) processForIdentifier:v20];
            [MEMORY[0x1896122D0] handleForIdentifier:v20 error:0];
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            v17 |= [v22 isXPCService] ^ 1;
            if ((v17 & 1) != 0)
            {
              BOOL v23 = 0;
            }

            else
            {
              [*(id *)(a1 + 40) processForIdentifierWithoutStartingTracking:v20];
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
              int v25 = objc_msgSend(*(id *)(a1 + 112), "rbs_pid");
              [v24 hostProcess];
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v23 = v25 == objc_msgSend(v26, "rbs_pid");
            }
          }

          uint64_t v16 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
        }

        while (v16);
      }

      else
      {
        BOOL v23 = 0;
      }
    }

    else
    {
      BOOL v23 = 0;
    }

    id v7 = v51;
    objc_msgSend(v51, "payload", v49);
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v52 targetsAllManagedProcesses])
    {
      if (([(id)a1 hasEntitlement:@"com.apple.runningboard.terminatemanagedprocesses"] & 1) == 0)
      {
        rbs_connection_log();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v5 = v52;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[RBConnectionClient executeTerminateRequest:withReply:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);
        }

        [v27 encodeBool:0 forKey:*MEMORY[0x1896124F8]];
        id v36 = (void *)MEMORY[0x189607870];
        id v37 = @"com.apple.runningboard.terminatemanagedprocesses";
LABEL_34:
        objc_msgSend(v36, "rbs_errorClientNotEntitled:permanent:", v37, 1);
        id v48 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 encodeObject:v48 forKey:*MEMORY[0x1896124E8]];

        [v51 send];
        goto LABEL_35;
      }
    }

    else if ((([(id)a1 hasEntitlementDomain:4] | v23) & 1) == 0)
    {
      rbs_connection_log();
      id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      id v5 = v52;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient executeTerminateRequest:withReply:].cold.1(v40, v41, v42, v43, v44, v45, v46, v47);
      }

      [v27 encodeBool:0 forKey:*MEMORY[0x1896124F8]];
      id v36 = (void *)MEMORY[0x189607870];
      id v37 = @"com.apple.runningboard.terminateprocess";
      goto LABEL_34;
    }

    [v51 prepareForHandoff];
    [MEMORY[0x1896123C0] currentContext];
    id v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBConnectionClient sharedTerminationWorkloop]();
    id v39 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1895F87A8];
    v54[1] = 3221225472LL;
    v54[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke;
    v54[3] = &unk_18A2561D8;
    id v5 = v52;
    id v55 = v52;
    uint64_t v56 = a1;
    id v57 = v27;
    id v58 = v51;
    [v38 handoffToQueue:v39 block:v54];

LABEL_35:
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_9(uint64_t a1)
{
  v20[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v9 = *(void *)(v6 + 40);
  uint64_t v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    char v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896124C0];
    uint64_t v19 = *MEMORY[0x189607798];
    v20[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  else
  {
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = 0LL;
    -[RBConnectionClient subscribeToProcessDeath:error:](v16, v5, &v17);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v17);
    [*(id *)(a1 + 48) encodeObject:v12 forKey:*MEMORY[0x1896124F8]];
  }
}

- (id)subscribeToProcessDeath:(void *)a3 error:
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (a1)
  {
    [*(id *)(a1 + 40) processForIdentifier:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([(id)a1 hasEntitlementDomain:1]) {
      goto LABEL_4;
    }
    [MEMORY[0x189612320] predicateMatchingIdentifier:v5];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    [MEMORY[0x189603F18] arrayWithObjects:v18 count:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:](a1, v8);

    if (v9)
    {
LABEL_4:
      if (!v5)
      {
        [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x1896124B0] code:1 userInfo:0];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }

      if (v6)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
        int v10 = [*(id *)(a1 + 40) isActiveProcess:v6];
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
        if (v10)
        {
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
          [*(id *)(a1 + 176) addObject:v6];
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
          a1 = 0LL;
        }

        else
        {
          a1 = [v6 lastExitContext];
        }

        uint64_t v11 = 0LL;
        if (!a3) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }

      uint64_t v13 = (void *)MEMORY[0x189607870];
      uint64_t v14 = *MEMORY[0x1896124B0];
      uint64_t v16 = *MEMORY[0x1896075F0];
      id v17 = @"No such process";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      [v13 errorWithDomain:v14 code:3 userInfo:v12];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  0);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient subscribeToProcessDeath:error:].cold.1();
      }
    }

LABEL_13:
    a1 = 0LL;
    if (!a3)
    {
LABEL_15:

      goto LABEL_16;
    }

void __36__RBConnectionClient_handleMessage___block_invoke_10(void *a1)
{
  v19[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[6] + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[6] + 8LL);
  uint64_t v7 = *(void *)(v6 + 40);
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x1896124C0];
    uint64_t v18 = *MEMORY[0x189607798];
    v19[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v8 errorWithDomain:v9 code:3 userInfo:v10];
    uint64_t v12 = *(void *)(a1[6] + 8LL);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  else
  {
    uint64_t v14 = a1[5];
    id v16 = 0LL;
    -[RBConnectionClient subscribeToProcessStateChangesWithConfiguration:error:](v14, v5, &v16);
    id v15 = v16;
    int v10 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v15;
  }
}

- (BOOL)subscribeToProcessStateChangesWithConfiguration:(void *)a3 error:
{
  id v5 = a2;
  if (!a1)
  {
    BOOL v9 = 0LL;
    goto LABEL_10;
  }

  if (([(id)a1 hasEntitlementDomain:1] & 1) == 0)
  {
    [v5 predicates];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:](a1, v6);

    if (!v7)
    {
      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  0);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient subscribeToProcessStateChangesWithConfiguration:error:].cold.1();
      }

      if (!a3) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }

  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    [*(id *)(a1 + 184) addConfiguration:v5];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    uint64_t v8 = 0LL;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x1896124B0] code:1 userInfo:0];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3) {
LABEL_8:
  }
    *a3 = v8;
LABEL_9:
  BOOL v9 = v8 == 0LL;

LABEL_10:
  return v9;
}

void __36__RBConnectionClient_handleMessage___block_invoke_11(void *a1)
{
  v15[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[6] + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  if (v6)
  {
    int v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896124C0];
    uint64_t v14 = *MEMORY[0x189607798];
    v15[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(a1[6] + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else
  {
    -[RBConnectionClient unsubscribeFromProcessStateChangesWithIdentifier:]( a1[5],  [v5 unsignedLongLongValue]);
  }
}

- (void)unsubscribeFromProcessStateChangesWithIdentifier:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    [*(id *)(a1 + 184) removeConfigurationWithIdentifier:a2];
    os_unfair_lock_unlock(v4);
  }

void __36__RBConnectionClient_handleMessage___block_invoke_12(uint64_t a1)
{
  v21[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id v18 = 0LL;
  [v6 decodeArgumentWithClass:v7 atIndex:1 allowNil:1 error:&v18];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, v18);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x1896124C0];
    uint64_t v20 = *MEMORY[0x189607798];
    v21[0] = v10;
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v11 errorWithDomain:v12 code:3 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }

  else
  {
    -[RBConnectionClient statesForPredicate:withDescriptor:withReply:](*(id **)(a1 + 40), v5, v9, *(void **)(a1 + 48));
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v13 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0LL;
  }
}

- (void)statesForPredicate:(void *)a3 withDescriptor:(void *)a4 withReply:
{
  v20[1] = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (([a1 hasEntitlementDomain:1] & 1) != 0
      || (v20[0] = v7,
          [MEMORY[0x189603F18] arrayWithObjects:v20 count:1],
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(),
          int v11 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v10),
          v10,
          v11))
    {
      [v9 prepareForHandoff];
      [MEMORY[0x1896123C0] currentContext];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [a1[6] monitorSerializationQueue];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      void v16[2] = __66__RBConnectionClient_statesForPredicate_withDescriptor_withReply___block_invoke;
      v16[3] = &unk_18A2561D8;
      void v16[4] = a1;
      id v17 = v7;
      id v18 = v8;
      id v19 = v9;
      [v12 handoffToQueue:v13 block:v16];
    }

    else
    {
      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  0);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient statesForPredicate:withDescriptor:withReply:].cold.1();
      }

      [v9 payload];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 encodeObject:v12 forKey:*MEMORY[0x1896124E8]];

      [v9 send];
    }
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_13(void *a1)
{
  v25[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[7] + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  (*(void (**)(void))(a1[6] + 16LL))();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = (void *)a1[4];
  uint64_t v8 = objc_opt_class();
  id v9 = (id *)(*(void *)(a1[7] + 8LL) + 40LL);
  id v22 = 0LL;
  [v7 decodeArgumentWithClass:v8 atIndex:1 allowNil:0 error:&v22];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, v22);
  uint64_t v11 = *(void *)(a1[7] + 8LL);
  uint64_t v12 = *(void *)(v11 + 40);
  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x189607870];
    uint64_t v14 = *MEMORY[0x1896124C0];
    uint64_t v24 = *MEMORY[0x189607798];
    v25[0] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v13 errorWithDomain:v14 code:3 userInfo:v15];
    uint64_t v17 = *(void *)(a1[7] + 8LL);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }

  else
  {
    uint64_t v19 = a1[5];
    id v21 = 0LL;
    -[RBConnectionClient intendToExit:withStatus:error:](v19, (uint64_t)v6, v10, &v21);
    id v20 = v21;
    uint64_t v15 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v20;
  }
}

- (BOOL)intendToExit:(void *)a3 withStatus:(void *)a4 error:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (!a1)
  {
    BOOL v11 = 0LL;
    goto LABEL_8;
  }

  [*(id *)(a1 + 40) processForInstance:a2];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    rbs_process_log();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      id v21 = v7;
      _os_log_impl( &dword_188634000,  v9,  OS_LOG_TYPE_DEFAULT,  "Setting intended exit status on %{public}@ to %{public}@",  buf,  0x16u);
    }

    [v8 setIntendedExitStatus:v7];
    uint64_t v10 = 0LL;
    if (!a4) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v13 = (void *)MEMORY[0x189607870];
    uint64_t v14 = *MEMORY[0x1896124B0];
    uint64_t v16 = *MEMORY[0x1896075F0];
    uint64_t v17 = @"No process found";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 errorWithDomain:v14 code:3 userInfo:v15];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4) {
      goto LABEL_7;
    }
  }

  *a4 = v10;
LABEL_7:
  BOOL v11 = v10 == 0LL;

LABEL_8:
  return v11;
}

void __36__RBConnectionClient_handleMessage___block_invoke_14(uint64_t a1)
{
  v21[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v10 = *(void *)(v7 + 40);
  id v9 = (id *)(v7 + 40);
  uint64_t v8 = v10;
  if (v10)
  {
    BOOL v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x1896124C0];
    uint64_t v20 = *MEMORY[0x189607798];
    v21[0] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v11 errorWithDomain:v12 code:3 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }

  else
  {
    uint64_t v17 = *(id **)(a1 + 40);
    id v18 = 0LL;
    -[RBConnectionClient lastExitContextForInstance:error:](v17, (uint64_t)v6, &v18);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v18);
    [*(id *)(a1 + 48) encodeObject:v13 forKey:*MEMORY[0x1896124F8]];
  }
}

- (id)lastExitContextForInstance:(void *)a3 error:
{
  id v3 = a1;
  v12[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [a1[5] processForInstance:a2];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v3 hasEntitlementDomain:1])
    {
      if (v5)
      {
        [v5 lastExitContext];
        id v3 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = 0LL;
        if (!a3) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }

      uint64_t v8 = (void *)MEMORY[0x189607870];
      uint64_t v9 = *MEMORY[0x1896124B0];
      uint64_t v11 = *MEMORY[0x1896075F0];
      v12[0] = @"No process found";
      [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      [v8 errorWithDomain:v9 code:3 userInfo:v7];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  1);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient lastExitContextForInstance:error:].cold.1();
      }
    }

    id v3 = 0LL;
    if (!a3)
    {
LABEL_11:

      return v3;
    }

void __36__RBConnectionClient_handleMessage___block_invoke_15(uint64_t a1)
{
  v21[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v10 = *(void *)(v7 + 40);
  uint64_t v9 = (id *)(v7 + 40);
  uint64_t v8 = v10;
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x1896124C0];
    uint64_t v20 = *MEMORY[0x189607798];
    v21[0] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v11 errorWithDomain:v12 code:3 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }

  else
  {
    uint64_t v17 = *(id **)(a1 + 40);
    id v18 = 0LL;
    -[RBConnectionClient limitationsForInstance:error:](v17, v6, &v18);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v18);
    [*(id *)(a1 + 48) encodeObject:v13 forKey:*MEMORY[0x1896124F8]];
  }
}

- (id)limitationsForInstance:(void *)a3 error:
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (!a1) {
    goto LABEL_13;
  }
  if (([a1 hasEntitlementDomain:1] & 1) == 0)
  {
    int v6 = [a1[17] pid];
    if (v6 != objc_msgSend(v5, "rbs_pid"))
    {
      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  0);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient limitationsForInstance:error:].cold.1();
      }
      goto LABEL_9;
    }
  }

  [a1[5] processForInstance:v5];
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    uint64_t v9 = (void *)MEMORY[0x189607870];
    uint64_t v10 = *MEMORY[0x1896124B0];
    uint64_t v13 = *MEMORY[0x1896075F0];
    v14[0] = @"No process found";
    [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 errorWithDomain:v10 code:3 userInfo:v11];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    a1 = 0LL;
    goto LABEL_10;
  }

  [a1[3] limitationsForInstance:v5];
  a1 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = 0LL;
LABEL_10:

  if (a3) {
    *a3 = v8;
  }

LABEL_13:
  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_16(void *a1)
{
  v21[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(a1[8] + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  (*(void (**)(void))(a1[7] + 16LL))();
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = *(void *)(a1[8] + 8LL);
  uint64_t v10 = *(void *)(v7 + 40);
  uint64_t v9 = (id *)(v7 + 40);
  uint64_t v8 = v10;
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x1896124C0];
    uint64_t v20 = *MEMORY[0x189607798];
    v21[0] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v11 errorWithDomain:v12 code:3 userInfo:v13];
    uint64_t v15 = *(void *)(a1[8] + 8LL);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }

  else
  {
    uint64_t v17 = (id *)a1[5];
    id v18 = 0LL;
    -[RBConnectionClient hostProcessForInstance:error:](v17, v6, &v18);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v18);
    [v13 fullEncode:a1[6] forKey:*MEMORY[0x1896124F8]];
  }
}

- (id)hostProcessForInstance:(void *)a3 error:
{
  v21[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (a1)
  {
    if ([a1 hasEntitlementDomain:1]) {
      goto LABEL_4;
    }
    int v6 = (void *)MEMORY[0x189612320];
    [v5 identifier];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 predicateMatchingIdentifier:v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    [MEMORY[0x189603F18] arrayWithObjects:v21 count:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v9);

    if (v10)
    {
LABEL_4:
      [a1[5] processForInstance:v5];
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v11;
      if (v11)
      {
        -[os_log_s hostProcess](v11, "hostProcess");
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = v13;
        if (v13)
        {
          [v13 handle];
          a1 = (id *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          a1 = 0LL;
        }

        uint64_t v17 = 0LL;
      }

      else
      {
        uint64_t v15 = (void *)MEMORY[0x189607870];
        uint64_t v16 = *MEMORY[0x1896124B0];
        uint64_t v19 = *MEMORY[0x1896075F0];
        uint64_t v20 = @"No process found";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 errorWithDomain:v16 code:3 userInfo:v14];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = 0LL;
      }
    }

    else
    {
      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  0);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient hostProcessForInstance:error:].cold.1();
      }
      a1 = 0LL;
    }

    if (a3) {
      *a3 = v17;
    }
  }

  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_17(uint64_t a1)
{
  v26[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  int v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id v23 = 0LL;
  [v6 decodeArgumentCollection:v7 withClass:v8 atIndex:1 allowNil:0 error:&v23];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, v23);
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v14 = *(void *)(v11 + 40);
  uint64_t v13 = (id *)(v11 + 40);
  uint64_t v12 = v14;
  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x189607870];
    uint64_t v16 = *MEMORY[0x1896124C0];
    uint64_t v25 = *MEMORY[0x189607798];
    v26[0] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v15 errorWithDomain:v16 code:3 userInfo:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

  else
  {
    id v21 = *(id **)(a1 + 40);
    id v22 = 0LL;
    -[RBConnectionClient infoPlistResultForInstance:forKeys:error:](v21, v5, v10, &v22);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v13, v22);
    [*(id *)(a1 + 48) encodeObject:v17 forKey:*MEMORY[0x1896124F8]];
  }
}

- (id)infoPlistResultForInstance:(void *)a3 forKeys:(void *)a4 error:
{
  v34[1] = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    id v19 = 0LL;
    goto LABEL_23;
  }

  if ([a1 hasEntitlementDomain:1]) {
    goto LABEL_27;
  }
  uint64_t v9 = (void *)MEMORY[0x189612320];
  [v7 identifier];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 predicateMatchingIdentifier:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v34 count:1];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = -[RBConnectionClient _predicatesMatchOnlyAllowedProcess:]((uint64_t)a1, v12);

  if (v13)
  {
LABEL_27:
    if (v7 && [v8 count])
    {
      [a1[5] processForInstance:v7];
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = v14;
      if (v14)
      {
        -[os_log_s handle](v14, "handle");
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 bundle];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          [v17 bundleInfoValuesForKeys:v8];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v18 count])
          {
            id v19 = objc_alloc_init(MEMORY[0x1896122F8]);
            [v19 setValue:v18];
          }

          else
          {
            id v19 = 0LL;
          }

          id v22 = 0LL;
        }

        else
        {
          uint64_t v25 = (void *)MEMORY[0x189607870];
          uint64_t v26 = *MEMORY[0x1896124B0];
          uint64_t v32 = *MEMORY[0x1896075F0];
          uint64_t v33 = @"No bundle found";
          [MEMORY[0x189603F68] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 errorWithDomain:v26 code:3 userInfo:v18];
          id v22 = (void *)objc_claimAutoreleasedReturnValue();
          id v19 = 0LL;
        }
      }

      else
      {
        id v23 = (void *)MEMORY[0x189607870];
        uint64_t v24 = *MEMORY[0x1896124B0];
        uint64_t v30 = *MEMORY[0x1896075F0];
        uint64_t v31 = @"No process found";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 errorWithDomain:v24 code:3 userInfo:v17];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        id v19 = 0LL;
      }

      goto LABEL_20;
    }

    uint64_t v20 = (void *)MEMORY[0x189607870];
    uint64_t v21 = *MEMORY[0x1896124B0];
    uint64_t v28 = *MEMORY[0x1896075F0];
    uint64_t v29 = @"Invalid instance or keys";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [v20 errorWithDomain:v21 code:1 userInfo:v15];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  0);
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    rbs_connection_log();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RBConnectionClient infoPlistResultForInstance:forKeys:error:].cold.1();
    }
  }

  id v19 = 0LL;
LABEL_20:

  if (a4) {
    *a4 = v22;
  }

LABEL_23:
  return v19;
}

void __36__RBConnectionClient_handleMessage___block_invoke_18(uint64_t a1)
{
  v16[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:1 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  if (v6)
  {
    id v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896124C0];
    uint64_t v15 = *MEMORY[0x189607798];
    v16[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v7 errorWithDomain:v8 code:3 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else
  {
    -[RBConnectionClient captureStateForSubsystem:withReply:](*(void **)(a1 + 40), v5, *(void **)(a1 + 48));
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v9 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0LL;
  }
}

- (void)captureStateForSubsystem:(void *)a3 withReply:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ([a1 hasEntitlement:@"com.apple.runningboard.statecapture"])
    {
      [v6 prepareForHandoff];
      [MEMORY[0x1896123C0] currentContext];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v7;
        _os_log_impl(&dword_188634000, v8, OS_LOG_TYPE_DEFAULT, "In captureState with xpcContext %@", buf, 0xCu);
      }

      dispatch_get_global_queue(17LL, 0LL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      void v12[2] = __57__RBConnectionClient_captureStateForSubsystem_withReply___block_invoke;
      v12[3] = &unk_18A255970;
      v12[4] = a1;
      id v13 = v5;
      id v14 = v6;
      [v7 handoffToQueue:v9 block:v12];
    }

    else
    {
      rbs_connection_log();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_188634000,  v10,  OS_LOG_TYPE_DEFAULT,  "Error capturingStateForSubsystem, unentitled client",  buf,  2u);
      }

      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.statecapture",  1);
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 payload];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 encodeObject:v7 forKey:*MEMORY[0x1896124E8]];

      [v6 send];
    }
  }
}

void __36__RBConnectionClient_handleMessage___block_invoke_19(uint64_t a1)
{
  v2 = *(id **)(a1 + 32);
  uint64_t v3 = (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id obj = 0LL;
  -[RBConnectionClient identifiersForStateCaptureSubsystemsWithError:](v2, &obj);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v3, obj);
  [*(id *)(a1 + 40) encodeObject:v4 forKey:*MEMORY[0x1896124F8]];
}

- (id)identifiersForStateCaptureSubsystemsWithError:(id *)a1
{
  if (!a1)
  {
    id v4 = 0LL;
    return v4;
  }

  if ([a1 hasEntitlement:@"com.apple.runningboard.statecapture"])
  {
    [a1[7] identifiers];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = 0LL;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.statecapture",  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = 0LL;
  if (a2) {
LABEL_6:
  }
    *a2 = v5;
LABEL_7:

  return v4;
}

void __36__RBConnectionClient_handleMessage___block_invoke_20(uint64_t a1)
{
  v21[1] = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentCollection:v3 withClass:v4 atIndex:0 allowNil:0 error:&obj];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v10 = *(void *)(v7 + 40);
  uint64_t v9 = (id *)(v7 + 40);
  uint64_t v8 = v10;
  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x1896124C0];
    uint64_t v20 = *MEMORY[0x189607798];
    v21[0] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v11 errorWithDomain:v12 code:3 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }

  else
  {
    uint64_t v17 = *(id **)(a1 + 40);
    id v18 = 0LL;
    -[RBConnectionClient busyExtensionInstancesFromSet:error:](v17, v6, &v18);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v18);
    [*(id *)(a1 + 48) encodeObject:v13 forKey:*MEMORY[0x1896124F8]];
  }
}

- (id)busyExtensionInstancesFromSet:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    if (([a1[14] isPlatformBinary] & 1) != 0
      || [a1 hasEntitlement:@"com.apple.runningboard.statecapture"])
    {
      [a1[5] busyExtensionInstancesFromSet:v5];
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }

    else if (a3)
    {
      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.statecapture",  1);
      a1 = 0LL;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      a1 = 0LL;
    }
  }

  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_21(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) encodeObject:v2 forKey:*MEMORY[0x1896124F8]];
}

- (id)preventLaunchPredicates
{
  v1 = a1;
  if (a1)
  {
    if (([a1 hasEntitlementDomain:1] & 1) == 0)
    {
      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  1);
      id v2 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient preventLaunchPredicates].cold.1();
      }
    }

    [v1[3] systemState];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 preventLaunchPredicates];
    v1 = (id *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_22(void *a1)
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(a1[7] + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[7] + 8LL);
  uint64_t v9 = *(void *)(v6 + 40);
  uint64_t v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896124C0];
    uint64_t v21 = *MEMORY[0x189607798];
    v22[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(a1[7] + 8LL);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  else
  {
    uint64_t v16 = a1[5];
    id v19 = 0LL;
    uint64_t v17 = -[RBConnectionClient saveEndowment:withError:](v16, v5, &v19);
    objc_storeStrong(v8, v19);
    id v18 = (void *)a1[6];
    [MEMORY[0x189607968] numberWithBool:v17];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 encodeObject:v12 forKey:*MEMORY[0x1896124F8]];
  }
}

- (uint64_t)saveEndowment:(void *)a3 withError:
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (a1)
  {
    if ([*(id *)(a1 + 24) addSavedEndowment:v5 forProcess:*(void *)(a1 + 112)])
    {
      a1 = 1LL;
    }

    else
    {
      if (a3)
      {
        uint64_t v6 = (void *)MEMORY[0x189607870];
        uint64_t v7 = *MEMORY[0x1896124B0];
        uint64_t v11 = *MEMORY[0x1896075F0];
        v12[0] = @"Saved endowment already set for key";
        [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 errorWithDomain:v7 code:2 userInfo:v8];
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      rbs_connection_log();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient saveEndowment:withError:].cold.1(a1, v5, v9);
      }

      a1 = 0LL;
    }
  }

  return a1;
}

void __36__RBConnectionClient_handleMessage___block_invoke_23(void *a1)
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(a1[7] + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[7] + 8LL);
  uint64_t v9 = *(void *)(v6 + 40);
  uint64_t v8 = (id *)(v6 + 40);
  uint64_t v7 = v9;
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896124C0];
    uint64_t v21 = *MEMORY[0x189607798];
    v22[0] = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v10 errorWithDomain:v11 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(a1[7] + 8LL);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  else
  {
    uint64_t v16 = (void *)a1[5];
    id v19 = 0LL;
    uint64_t v17 = -[RBConnectionClient isIdentityAnAngel:withError:](v16, v5, &v19);
    objc_storeStrong(v8, v19);
    id v18 = (void *)a1[6];
    [MEMORY[0x189607968] numberWithBool:v17];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 encodeObject:v12 forKey:*MEMORY[0x1896124F8]];
  }
}

- (void)isIdentityAnAngel:(void *)a3 withError:
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (a1)
  {
    if ([a1 hasEntitlementDomain:1])
    {
      [v5 consistentLaunchdJobLabel];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        +[RBLaunchdProperties propertiesForLabel:error:]( &OBJC_CLASS___RBLaunchdProperties,  "propertiesForLabel:error:",  v6,  a3);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = (void *)[v7 isAngel];

LABEL_12:
        goto LABEL_13;
      }

      if (a3)
      {
        uint64_t v9 = (void *)MEMORY[0x189607870];
        uint64_t v10 = *MEMORY[0x1896124B0];
        uint64_t v13 = *MEMORY[0x1896075F0];
        v14[0] = @"Information request not supported for this identity";
        [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 errorWithDomain:v10 code:1 userInfo:v11];
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      rbs_connection_log();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient isIdentityAnAngel:withError:].cold.1();
      }
    }

    else
    {
      objc_msgSend( MEMORY[0x189607870],  "rbs_errorClientNotEntitled:permanent:",  @"com.apple.runningboard.process-state",  1);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_connection_log();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RBConnectionClient preventLaunchPredicates].cold.1();
      }
    }

    a1 = 0LL;
    goto LABEL_12;
  }

- (void)cleanupHolds
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [*(id *)(a1 + 24) assertionsForOriginator:*(void *)(a1 + 136)];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v6 = *(void *)v15;
      *(void *)&__int128 v4 = 138412290LL;
      __int128 v13 = v4;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void **)(a1 + 24);
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v7), "identifier", v13);
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 popPluginHoldForAssertion:v9];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            rbs_assertion_log();
            uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v13;
              id v19 = v10;
              _os_log_impl( &dword_188634000,  v11,  OS_LOG_TYPE_INFO,  "Releasing plugin hold token for dealloc %@",  buf,  0xCu);
            }

            [MEMORY[0x189611CB8] managerForUser:*(unsigned int *)(a1 + 144)];
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 releaseHold:v10];
          }

          ++v7;
        }

        while (v5 != v7);
        uint64_t v5 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }

      while (v5);
    }
  }

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    rbs_process_log();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 112);
      int v6 = 138543362;
      uint64_t v7 = v3;
      _os_log_impl( &dword_188634000,  v2,  OS_LOG_TYPE_DEFAULT,  "XPC connection invalidated: %{public}@",  (uint8_t *)&v6,  0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    [*(id *)(a1 + 176) removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    [*(id *)(a1 + 112) setTerminating:1];
    __int128 v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0LL;

    [*(id *)(a1 + 184) invalidate];
    uint64_t v5 = *(void **)(a1 + 184);
    *(void *)(a1 + 184) = 0LL;

    [*(id *)(a1 + 56) removeItem:a1];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    -[RBConnectionClient cleanupHolds](a1);
  }

- (BOOL)hasEntitlement:(id)a3
{
  return -[RBEntitlementPossessing hasEntitlement:](self->_entitlements, "hasEntitlement:", a3);
}

- (BOOL)hasEntitlementDomain:(unint64_t)a3
{
  return -[RBEntitlementPossessing hasEntitlementDomain:](self->_entitlements, "hasEntitlementDomain:", a3);
}

void __43__RBConnectionClient_handshakeWithRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16LL));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v7 objectForKeyedSubscript:v12];
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v12, "unsignedIntegerValue"));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 48) setObject:v13 forKeyedSubscript:v14];
        [*(id *)(*(void *)(a1 + 32) + 168) addObject:v13];
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v9);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16LL));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0LL; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        objc_msgSend(v15, "objectForKeyedSubscript:", v20, (void)v23);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v20, "unsignedIntegerValue"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 56) setObject:v21 forKeyedSubscript:v22];
      }

      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }

    while (v17);
  }
}

- (uint64_t)_predicatesMatchOnlyAllowedProcess:(uint64_t)a1
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (!a1)
  {
    uint64_t v42 = 0LL;
    goto LABEL_50;
  }

  [MEMORY[0x189603FA8] array];
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [*(id *)(a1 + 112) hostProcess];
  if (v5)
  {
    id v6 = (void *)v5;
    do
    {
      [v6 handle];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 addObject:v7];

      uint64_t v8 = [v6 hostProcess];

      id v6 = (void *)v8;
    }

    while (v8);
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id obj = v3;
  uint64_t v9 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (!v9)
  {
    uint64_t v42 = 1LL;
    goto LABEL_49;
  }

  uint64_t v10 = v9;
  id v46 = v3;
  uint64_t v11 = *(void *)v56;
  uint64_t v47 = *(void *)v56;
  uint64_t v48 = a1;
LABEL_7:
  uint64_t v12 = 0LL;
  uint64_t v49 = v10;
  while (1)
  {
    if (*(void *)v56 != v11) {
      objc_enumerationMutation(obj);
    }
    __int128 v13 = *(void **)(*((void *)&v55 + 1) + 8 * v12);
    objc_msgSend(v13, "processIdentifier", v46);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = objc_msgSend(v14, "rbs_pid");
    int v16 = objc_msgSend(*(id *)(a1 + 112), "rbs_pid");

    if (v15 == v16)
    {
      rbs_general_log();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = *(os_log_s **)(a1 + 112);
        *(_DWORD *)buf = 138543618;
        __int128 v61 = (os_log_s *)v13;
        __int16 v62 = 2114;
        uint64_t v63 = v18;
        _os_log_impl( &dword_188634000,  v17,  OS_LOG_TYPE_INFO,  "_predicatesMatchOnlyAllowedProcess allowing predicate matching self %{public}@ for process %{public}@",  buf,  0x16u);
      }

      goto LABEL_31;
    }

    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v19 = v4;
    id v20 = v4;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0LL; i != v22; ++i)
        {
          if (*(void *)v52 != v23) {
            objc_enumerationMutation(v20);
          }
          __int128 v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          [v13 processIdentifier];
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
          int v27 = objc_msgSend(v26, "rbs_pid");
          LODWORD(v25) = [v25 pid];

          if (v27 == (_DWORD)v25)
          {

            rbs_general_log();
            uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            uint64_t v10 = v49;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              a1 = v48;
              id v36 = *(os_log_s **)(v48 + 112);
              *(_DWORD *)buf = 138543618;
              __int128 v61 = (os_log_s *)v13;
              __int16 v62 = 2114;
              uint64_t v63 = v36;
              _os_log_impl( &dword_188634000,  v17,  OS_LOG_TYPE_INFO,  "_predicatesMatchOnlyAllowedProcess allowing predicate matching hosting %{public}@ for process %{public}@",  buf,  0x16u);
              __int128 v4 = v19;
            }

            else
            {
              __int128 v4 = v19;
              a1 = v48;
            }

            goto LABEL_30;
          }
        }

        uint64_t v22 = [v20 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    a1 = v48;
    __int128 v28 = *(void **)(v48 + 40);
    [v13 processIdentifier];
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 processForIdentifierWithoutStartingTracking:v29];
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    rbs_general_log();
    __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      __int128 v61 = (os_log_s *)v13;
      __int16 v62 = 2114;
      uint64_t v63 = v17;
      _os_log_impl( &dword_188634000,  v30,  OS_LOG_TYPE_INFO,  "_predicatesMatchOnlyAllowedProcess for predicate %{public}@ resolved target to %{public}@",  buf,  0x16u);
    }

    int v31 = objc_msgSend(*(id *)(v48 + 112), "rbs_pid");
    -[os_log_s hostProcess](v17, "hostProcess");
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    int v33 = objc_msgSend(v32, "rbs_pid");

    if (v31 == v33)
    {
      rbs_general_log();
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      __int128 v4 = v19;
      uint64_t v10 = v49;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        uint64_t v35 = *(os_log_s **)(v48 + 112);
        *(_DWORD *)buf = 138543618;
        __int128 v61 = (os_log_s *)v13;
        __int16 v62 = 2114;
        uint64_t v63 = v35;
        _os_log_impl( &dword_188634000,  v34,  OS_LOG_TYPE_INFO,  "_predicatesMatchOnlyAllowedProcess allowing predicate matching hosted %{public}@ for process %{public}@",  buf,  0x16u);
      }

LABEL_30:
      uint64_t v11 = v47;
      goto LABEL_31;
    }

    [*(id *)(v48 + 32) entitlementsForProcess:v17];
    id v37 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v4 = v19;
    rbs_general_log();
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = v47;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      id v39 = *(os_log_s **)(v48 + 112);
      *(_DWORD *)buf = 138543618;
      __int128 v61 = (os_log_s *)v13;
      __int16 v62 = 2114;
      uint64_t v63 = v39;
      _os_log_impl( &dword_188634000,  v38,  OS_LOG_TYPE_INFO,  "_predicatesMatchOnlyAllowedProcess allowing predicate matching trusted target %{public}@ for process %{public}@",  buf,  0x16u);
    }

- (void)_trackTargetProcessForDescriptor:(uint64_t)a1
{
  if (a1)
  {
    [a2 target];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 processIdentifier];
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    __int128 v4 = v6;
    if (v6)
    {
      id v5 = (id)[*(id *)(a1 + 40) processForIdentifier:v6];
      __int128 v4 = v6;
    }
  }

void __62__RBConnectionClient_acquireAssertionForDescriptor_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) payload];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v4 = v3;
  if (v5)
  {
    [v3 encodeObject:v5 forKey:*MEMORY[0x1896124E8]];

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16LL));
    [*(id *)(*(void *)(a1 + 48) + 168) removeObject:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16LL));
  }

  else
  {
    [v3 encodeObject:*(void *)(a1 + 40) forKey:*MEMORY[0x1896124F8]];
  }

  [*(id *)(a1 + 32) send];
}

- (uint64_t)_canInvalidateAssertionWithIdentifier:(void *)a3 error:
{
  v24[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = v5;
  if (!a1)
  {
    uint64_t v12 = 0LL;
    goto LABEL_13;
  }

  if (v5)
  {
    int v7 = [v5 clientPid];
    uint64_t v8 = (uint64_t *)(a1 + 17);
    int v9 = [a1[17] pid];
    char v10 = [a1 hasEntitlement:@"com.apple.runningboard.invalidateanyassertion"];
    uint64_t v11 = 0LL;
    uint64_t v12 = 1LL;
    if (v7 == v9 || (v10 & 1) != 0) {
      goto LABEL_10;
    }
    rbs_assertion_log();
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RBConnectionClient _canInvalidateAssertionWithIdentifier:error:].cold.1(v8, v6, v13);
    }

    __int128 v14 = (void *)MEMORY[0x189607870];
    uint64_t v15 = *MEMORY[0x1896124B0];
    uint64_t v23 = *MEMORY[0x1896075F0];
    v24[0] = @"Specified assertion identifier is not owned by the client";
    int v16 = (void *)MEMORY[0x189603F68];
    uint64_t v17 = (const __CFString **)v24;
    uint64_t v18 = &v23;
  }

  else
  {
    __int128 v14 = (void *)MEMORY[0x189607870];
    uint64_t v15 = *MEMORY[0x1896124B0];
    uint64_t v21 = *MEMORY[0x1896075F0];
    uint64_t v22 = @"No assertion identifier specified";
    int v16 = (void *)MEMORY[0x189603F68];
    uint64_t v17 = &v22;
    uint64_t v18 = &v21;
  }

  [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 errorWithDomain:v15 code:1 userInfo:v19];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = 0LL;
LABEL_10:
  if (a3) {
    *a3 = v11;
  }

LABEL_13:
  return v12;
}

void __62__RBConnectionClient_executeLaunchRequest_withEuid_withReply___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4,  void *a5)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12) {
    [*(id *)(a1 + 32) encodeObject:v12 forKey:*MEMORY[0x1896124E8]];
  }
  if (v9)
  {
    [v9 fullEncode:*(void *)(a1 + 32) forKey:*MEMORY[0x1896124F8]];
    [*(id *)(a1 + 40) context];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 attributes];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = v14;
    if (!v10)
    {
      if (![v14 count])
      {
        id v10 = 0LL;
        goto LABEL_6;
      }

      rbs_connection_log();
      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 112LL);
        [v13 identity];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        int v22 = 138543874;
        uint64_t v23 = v17;
        __int16 v24 = 2114;
        uint64_t v25 = v18;
        __int16 v26 = 2114;
        id v27 = v19;
        _os_log_impl( &dword_188634000,  v16,  OS_LOG_TYPE_INFO,  "Re-acquiring launch assertion for request %{public}@ from %{public}@ for target: %{public}@",  (uint8_t *)&v22,  0x20u);
      }

      [*(id *)(*(void *)(a1 + 48) + 72) acquireDroppedLaunchAssertion:*(void *)(a1 + 40) requestor:*(void *)(*(void *)(a1 + 48) + 112)];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10) {
        goto LABEL_6;
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16LL));
    [*(id *)(*(void *)(a1 + 48) + 168) addObject:v10];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16LL));
    [*(id *)(a1 + 32) encodeObject:v10 forKey:*MEMORY[0x1896124E0]];
LABEL_6:
    if ([v11 count]) {
      [*(id *)(a1 + 32) encodeDictionary:v11 forKey:*MEMORY[0x1896124F0]];
    }

LABEL_12:
    goto LABEL_13;
  }

  if (v10)
  {
    rbs_connection_log();
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 112LL);
      int v22 = 138544130;
      uint64_t v23 = v20;
      __int16 v24 = 2114;
      uint64_t v25 = v21;
      __int16 v26 = 2114;
      id v27 = v10;
      __int16 v28 = 2114;
      id v29 = v12;
      _os_log_fault_impl( &dword_188634000,  (os_log_t)v13,  OS_LOG_TYPE_FAULT,  "launch request %{public}@ from %{public}@ failed but still created an assertion (%{public}@) : error=%{public}@",  (uint8_t *)&v22,  0x2Au);
    }

    goto LABEL_12;
  }

- (void)_requestPluginHoldForProxy:(int)a3 terminate:(void *)a4 completion:
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    uint64_t v20 = MEMORY[0x1895F87A8];
    uint64_t v21 = 3221225472LL;
    int v22 = __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke;
    uint64_t v23 = &unk_18A2565E8;
    id v9 = v7;
    id v24 = v9;
    id v10 = v8;
    id v25 = v10;
    id v11 = (void *)MEMORY[0x1895CA0E4](&v20);
    objc_msgSend(v9, "appState", v20, v21, v22, v23);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v12 isInstalled];

    if (v13)
    {
      [v9 bundleURL];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        [MEMORY[0x189611CB8] managerForUser:*(unsigned int *)(a1 + 144)];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        int v16 = v15;
        if (a3) {
          [v15 terminatePlugInsInApplication:v14 options:0 result:v11];
        }
        else {
          [v15 holdPlugInsInApplication:v14 result:v11];
        }
      }

      else
      {
        rbs_connection_log();
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[RBConnectionClient _requestPluginHoldForProxy:terminate:completion:].cold.1(v9, v19);
        }

        (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
      }
    }

    else
    {
      rbs_connection_log();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        [v9 bundleIdentifier];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        id v27 = v18;
        _os_log_impl( &dword_188634000,  v17,  OS_LOG_TYPE_DEFAULT,  "skipping plugin hold for uninstalled proxy %{public}@",  buf,  0xCu);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
    }
  }
}

void __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    rbs_connection_log();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      [*(id *)(a1 + 32) bundleIdentifier];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = 138543618;
      __int128 v14 = v8;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl( &dword_188634000,  v7,  OS_LOG_TYPE_INFO,  "Successfully acquired plugin hold for %{public}@: %{public}@",  (uint8_t *)&v13,  0x16u);
    }

    id v9 = 0LL;
  }

  else
  {
    id v7 = (os_log_s *)objc_opt_new();
    -[os_log_s setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  @"Error acquiring hold on plugins",  *MEMORY[0x1896075F0]);
    -[os_log_s setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x189607798]);
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x1896124B0] code:5 userInfo:v7];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v6 code];
    rbs_connection_log();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10 == 14)
    {
      if (v12) {
        __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_1( a1,  (uint64_t)v6,  v11);
      }
    }

    else if (v12)
    {
      __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_2( a1,  (uint64_t)v6,  v11);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)expandPredicateForContained:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  __int128 v4 = v3;
  if (a1)
  {
    [v3 predicate];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 bundleIdentifier];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 context];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 attributes];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      rbs_connection_log();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_188634000,  v9,  OS_LOG_TYPE_DEFAULT,  "Termination predicate not expanded because complex predicate",  buf,  2u);
      }

      goto LABEL_28;
    }

    if (!v8)
    {
      id v9 = 0LL;
      id v11 = 0LL;
      int v13 = 0LL;
      goto LABEL_15;
    }

    if ([v8 count] == 1)
    {
      [v8 firstObject];
      id v9 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0LL;
      }
      id v11 = v10;

      if (v11)
      {
        -[os_log_s predicate](v11, "predicate");
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        -[os_log_s bundleIdentifier](v11, "bundleIdentifier");
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
        int v13 = v12;
        if (v12)
        {
          __int128 v14 = v9;
          if (([v12 isEqual:v6] & 1) == 0) {
            goto LABEL_25;
          }
LABEL_15:
          RBSContainedExtensionBundleIDs();
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v15 count] != 1)
          {
            [MEMORY[0x189612320] predicateMatchingBundleIdentifiers:v15];
            id v24 = (void *)objc_claimAutoreleasedReturnValue();
            rbs_connection_log();
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              [v4 predicate];
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              id v27 = v17;
              __int16 v28 = 2112;
              id v29 = v24;
              _os_log_impl( &dword_188634000,  v16,  OS_LOG_TYPE_DEFAULT,  "expanding termination predicate from %@ to %@",  buf,  0x16u);
            }

            [v4 setPredicate:v24];
            if (v8)
            {
              uint64_t v18 = (void *)MEMORY[0x189612290];
              -[os_log_s allow](v9, "allow");
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 limitationWithPredicate:v24 andException:v23];
              id v19 = (void *)objc_claimAutoreleasedReturnValue();
              id v25 = v19;
              [MEMORY[0x189603F18] arrayWithObjects:&v25 count:1];
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

              [v4 context];
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
              [v21 setAttributes:v20];
            }
          }

          goto LABEL_28;
        }

        __int128 v14 = v9;
LABEL_25:
        rbs_connection_log();
        int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_188634000,  v22,  OS_LOG_TYPE_DEFAULT,  "Termination preventLaunch attribute not expanded because it didn't match Termination Predicate",  buf,  2u);
        }

LABEL_28:
        goto LABEL_29;
      }

      __int128 v14 = 0LL;
    }

    else
    {
      id v9 = 0LL;
      __int128 v14 = 0LL;
      id v11 = 0LL;
    }

    int v13 = 0LL;
    goto LABEL_25;
  }

void __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) context];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) predicate];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v3 beforeTranslocationBundlePath];
  -[RBConnectionClient expandPredicateForContained:](*(void *)(a1 + 40), *(void **)(a1 + 32));
  [v2 attributes];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 count];

  rbs_connection_log();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      [*(id *)(a1 + 32) predicate];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      __int128 v52 = v10;
      _os_log_impl(&dword_188634000, v8, OS_LOG_TYPE_INFO, "Requesting plugIn hold for %{public}@", buf, 0xCu);
    }

    v43[0] = MEMORY[0x1895F87A8];
    v43[1] = 3221225472LL;
    v43[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_160;
    v43[3] = &unk_18A256660;
    id v11 = &v44;
    id v44 = *(id *)(a1 + 48);
    BOOL v12 = (id *)v45;
    id v13 = *(id *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 40);
    v45[0] = v13;
    v45[1] = v14;
    id v15 = v2;
    id v46 = v15;
    id v47 = *(id *)(a1 + 32);
    id v16 = (void (**)(void, void, void))MEMORY[0x1895CA0E4](v43);
    if (v4 | v5)
    {
      uint64_t v17 = (void *)MEMORY[0x189605730];
      if (v5)
      {
        [MEMORY[0x189604030] fileURLWithPath:v5];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 applicationProxyForBundleURL:v18];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v20 = [v19 bundleURL];
        if (v20)
        {
          uint64_t v21 = (void *)v20;
          uint64_t v42 = v4;
          [v19 bundleURL];
          int v22 = (void *)v5;
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 path];
          id v24 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v41 = v22;
          LOBYTE(v22) = [v22 isEqual:v24];

          if ((v22 & 1) == 0)
          {
            rbs_connection_log();
            int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            uint64_t v5 = (uint64_t)v41;
            id v11 = &v44;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              [v19 bundleURL];
              id v39 = (void *)objc_claimAutoreleasedReturnValue();
              [v39 path];
              id v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              __int128 v52 = v3;
              __int16 v53 = 2114;
              __int128 v54 = v41;
              __int16 v55 = 2114;
              __int128 v56 = v40;
              _os_log_error_impl( &dword_188634000,  v31,  OS_LOG_TYPE_ERROR,  "beforeTranslocationBundlePath does not match LS bundleURL %{public}@ (%{public}@, %{public}@)",  buf,  0x20u);
            }

            uint64_t v32 = (void *)NSString;
            [v19 bundleURL];
            int v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v33 path];
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
            [v32 stringWithFormat:@"beforeTranslocationBundlePath does not match LS bundleURL (%@, %@)", v41, v34];
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

            id v36 = (void *)objc_opt_new();
            [v36 setObject:v35 forKeyedSubscript:*MEMORY[0x1896075F0]];
            [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x1896124B0] code:1 userInfo:v36];
            id v37 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(void, void, void *))v16)[2](v16, 0LL, v37);

            id v16 = 0LL;
            uint64_t v4 = v42;
            BOOL v12 = (id *)v45;
            goto LABEL_25;
          }

          uint64_t v5 = (uint64_t)v41;
          uint64_t v4 = v42;
          id v11 = &v44;
          BOOL v12 = (id *)v45;
          if (!v16)
          {
LABEL_25:

            goto LABEL_26;
          }
        }

        else
        {
          id v11 = &v44;
          if (!v16) {
            goto LABEL_25;
          }
        }
      }

      else
      {
        [MEMORY[0x189605730] applicationProxyForIdentifier:v4];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16) {
          goto LABEL_25;
        }
      }

      if (v19)
      {
        uint64_t v28 = *(void *)(a1 + 40);
        int v29 = [v15 shouldTerminatePlugIns];
        uint64_t v30 = v28;
        BOOL v12 = (id *)v45;
        -[RBConnectionClient _requestPluginHoldForProxy:terminate:completion:](v30, v19, v29, v16);
        goto LABEL_25;
      }

      rbs_connection_log();
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int128 v52 = v3;
        _os_log_impl( &dword_188634000,  v38,  OS_LOG_TYPE_DEFAULT,  "skipping plugin hold for termination request, unable to get proxy %{public}@",  buf,  0xCu);
      }

      v16[2](v16, 0LL, 0LL);
    }

    else
    {
      rbs_connection_log();
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int128 v52 = v3;
        _os_log_impl( &dword_188634000,  v27,  OS_LOG_TYPE_DEFAULT,  "skipping plugin hold for termination request without bundle ID or beforeTranslocationBundlePath %{public}@",  buf,  0xCu);
      }

      v16[2](v16, 0LL, 0LL);
      id v16 = 0LL;
    }

    id v19 = 0LL;
    goto LABEL_25;
  }

  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_188634000,  v8,  OS_LOG_TYPE_INFO,  "No attributes, calling executeTerminateRequest directly",  buf,  2u);
  }

  uint64_t v25 = *(void *)(a1 + 32);
  __int16 v26 = *(void **)(*(void *)(a1 + 40) + 40LL);
  v48[0] = MEMORY[0x1895F87A8];
  v48[1] = 3221225472LL;
  v48[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_158;
  v48[3] = &unk_18A256610;
  id v11 = &v49;
  id v49 = *(id *)(a1 + 48);
  BOOL v12 = &v50;
  id v50 = *(id *)(a1 + 56);
  [v26 executeTerminateRequest:v25 completion:v48];
LABEL_26:
}

uint64_t __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_158( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *MEMORY[0x1896124F8];
  id v7 = a3;
  [v5 encodeBool:a2 forKey:v6];
  [*(id *)(a1 + 32) encodeObject:v7 forKey:*MEMORY[0x1896124E8]];

  return [*(id *)(a1 + 40) send];
}

void __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_160( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  if (v5 || !a3)
  {
    objc_msgSend( MEMORY[0x189612170],  "identifierWithClientPid:",  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 136), "pid"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612388] systemTarget];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = (void *)MEMORY[0x189612168];
    [*(id *)(a1 + 56) explanation];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 56) attributes];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 descriptorWithIdentifier:v6 target:v7 explanation:v9 attributes:v10];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:]( &OBJC_CLASS___RBAssertionAcquisitionContext,  "contextForProcess:withDescriptor:daemonContext:",  *(void *)(*(void *)(a1 + 48) + 112LL),  v11,  *(void *)(*(void *)(a1 + 48) + 64LL));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setAcquisitionPolicy:1];
    [v12 setHoldToken:v5];
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void **)(v13 + 24);
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    void v16[2] = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_2;
    v16[3] = &unk_18A256638;
    void v16[4] = v13;
    id v17 = v6;
    id v18 = *(id *)(a1 + 64);
    id v19 = *(id *)(a1 + 32);
    id v20 = v5;
    id v21 = *(id *)(a1 + 40);
    id v15 = v6;
    [v14 acquireAssertionWithContext:v12 completion:v16];
  }

  else
  {
    [*(id *)(a1 + 32) encodeObject:a3 forKey:*MEMORY[0x1896124E8]];
    [*(id *)(a1 + 32) encodeBool:0 forKey:*MEMORY[0x1896124F8]];
    [*(id *)(a1 + 40) send];
  }
}

void __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [MEMORY[0x189611CB8] managerForUser:*(unsigned int *)(*(void *)(a1 + 32) + 144)];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 releaseHold:*(void *)(a1 + 64)];

    [*(id *)(a1 + 56) encodeObject:v3 forKey:*MEMORY[0x1896124E8]];
    [*(id *)(a1 + 56) encodeBool:0 forKey:*MEMORY[0x1896124F8]];
  }

  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16LL));
    [*(id *)(*(void *)(a1 + 32) + 168) addObject:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16LL));
    id v5 = *(void **)(*(void *)(a1 + 32) + 40LL);
    uint64_t v7 = MEMORY[0x1895F87A8];
    uint64_t v8 = 3221225472LL;
    BOOL v9 = __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_3;
    uint64_t v10 = &unk_18A256610;
    uint64_t v6 = *(void *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    [v5 executeTerminateRequest:v6 completion:&v7];
  }

  objc_msgSend(*(id *)(a1 + 72), "send", v7, v8, v9, v10);
}

uint64_t __56__RBConnectionClient_executeTerminateRequest_withReply___block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *MEMORY[0x1896124E0];
  id v8 = a3;
  [v5 encodeObject:v6 forKey:v7];
  [*(id *)(a1 + 32) encodeObject:v8 forKey:*MEMORY[0x1896124E8]];

  return [*(id *)(a1 + 32) encodeBool:a2 forKey:*MEMORY[0x1896124F8]];
}

- (void)_addStatesForUntrackedProcessesTo:(void *)a3 withPredicate:
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v35 = a1;
  if (a1)
  {
    unint64_t v7 = [v5 count];
    [v6 processIdentifiers];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v9 = [v8 count];

    if (v7 >= v9)
    {
      a1 = v5;
    }

    else
    {
      [v6 processIdentifiers];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      id v11 = (void *)[v10 mutableCopy];

      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      id v34 = v5;
      id v12 = v5;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v41;
        do
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v41 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "process", v34);
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v17 instance];
            id v18 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 identifier];
            id v19 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 removeObject:v19];
          }

          uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }

        while (v14);
      }

      if ([v11 count])
      {
        id v20 = (void *)[v12 mutableCopy];
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        id v21 = v11;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v37;
          do
          {
            for (uint64_t j = 0LL; j != v23; ++j)
            {
              if (*(void *)v37 != v24) {
                objc_enumerationMutation(v21);
              }
              objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "rbs_pid", v34);
              if (RBSPIDExists())
              {
                __int16 v26 = (void *)v35[5];
                [v6 processIdentifier];
                id v27 = (void *)objc_claimAutoreleasedReturnValue();
                [v26 processForIdentifierWithoutStartingTracking:v27];
                uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                {
                  id v29 = v6;
                  uint64_t v30 = (void *)MEMORY[0x189612338];
                  [v28 handle];
                  int v31 = (void *)objc_claimAutoreleasedReturnValue();
                  [v30 untrackedRunningStateforProcess:v31];
                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v32) {
                    -[RBConnectionClient _addStatesForUntrackedProcessesTo:withPredicate:].cold.1();
                  }
                  [v20 addObject:v32];

                  id v6 = v29;
                }
              }
            }

            uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }

          while (v23);
        }

        a1 = (void *)[v20 copy];
      }

      else
      {
        a1 = v12;
      }

      id v5 = v34;
    }
  }

  return a1;
}

void __66__RBConnectionClient_statesForPredicate_withDescriptor_withReply___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189612338] setActiveStateDescriptor:*(void *)(a1 + 48)];
  uint64_t v3 = [v2 count];
  -[RBConnectionClient _addStatesForUntrackedProcessesTo:withPredicate:](*(void **)(a1 + 32), v2, *(void **)(a1 + 40));
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == [v7 count])
  {
    [*(id *)(a1 + 56) payload];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v7 forKey:*MEMORY[0x1896124F8]];
  }

  else
  {
    [MEMORY[0x189607A40] currentThread];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 threadDictionary];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    [v4 setObject:MEMORY[0x189604A88] forKey:@"RBSProcessHandleFullEncode"];
    [*(id *)(a1 + 56) payload];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 encodeObject:v7 forKey:*MEMORY[0x1896124F8]];

    [v4 removeObjectForKey:@"RBSProcessHandleFullEncode"];
  }

  [MEMORY[0x189612338] setActiveStateDescriptor:0];
  [*(id *)(a1 + 56) send];
}

void __57__RBConnectionClient_captureStateForSubsystem_withReply___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) payload];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 encodeObject:v3 forKey:*MEMORY[0x1896124F8]];

  [*(id *)(a1 + 48) send];
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  processIdentifier = self->_processIdentifier;
  -[RBSProcessIdentity shortDescription](self->_processIdentity, "shortDescription");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v3 initWithFormat:@"<%@| %@ name:%@ entitlements:%@ inheritanceManager:%@>", v4, processIdentifier, v6, self->_entitlements, self->_inheritanceManager];

  return (NSString *)v7;
}

- (void)inheritanceManager:(id)a3 didChangeInheritances:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v9 = self->_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    objc_msgSend( MEMORY[0x1896123B8],  "messageForMethod:varguments:",  sel_async_didChangeInheritances_completion_,  v7,  0);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __74__RBConnectionClient_inheritanceManager_didChangeInheritances_completion___block_invoke;
    v13[3] = &unk_18A256688;
    uint64_t v14 = v8;
    [v10 sendToConnection:v9 completion:v13];
  }

  else
  {
    rbs_connection_log();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      process = self->_process;
      *(_DWORD *)buf = 138543618;
      id v16 = process;
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl( &dword_188634000,  v11,  OS_LOG_TYPE_DEFAULT,  "No connection found to send inheritance for process %{public}@ with changeSet: %{public}@",  buf,  0x16u);
    }

    if (v8) {
      v8[2](v8);
    }
  }
}

uint64_t __74__RBConnectionClient_inheritanceManager_didChangeInheritances_completion___block_invoke( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didUpdateProcessStates:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [a2 processStateChangeForIdentity:*(void *)(a1 + 128)];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = v3;
    if (v3)
    {
      [v3 updatedState];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 inheritances];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 allInheritances];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();

      rbs_state_log();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 112);
        int v10 = 138543618;
        uint64_t v11 = v9;
        __int16 v12 = 2114;
        uint64_t v13 = v7;
        _os_log_impl( &dword_188634000,  v8,  OS_LOG_TYPE_INFO,  "Process: %{public}@ has changes in inheritances: %{public}@",  (uint8_t *)&v10,  0x16u);
      }

      [*(id *)(a1 + 152) setInheritances:v7];
    }
  }

- (void)willExpireAssertionsSoonForProcess:(double)a3 expirationTime:
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = v5;
  if (a1 && *(id *)(a1 + 112) == v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    id v7 = *(id *)(a1 + 8);
    if (*(void *)(a1 + 192))
    {
      if (objc_msgSend(*(id *)(a1 + 24), "hasAssertionWithIdentifier:"))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
LABEL_17:

        goto LABEL_18;
      }

      id v8 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = 0LL;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    if (!v7) {
      goto LABEL_17;
    }
    RBSMachAbsoluteTime();
    double v10 = v9;
    double v11 = a3 - v9 + -0.1;
    if ([v6 isSuspended])
    {
      rbs_connection_log();
      __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138544130;
        __int128 v37 = v6;
        __int16 v38 = 2050;
        double v39 = v11;
        __int16 v40 = 2050;
        double v41 = a3;
        __int16 v42 = 2050;
        double v43 = v10;
        _os_log_fault_impl( &dword_188634000,  v12,  OS_LOG_TYPE_FAULT,  "%{public}@ Suspension Warning for already suspened process (d:%{public}fs xt:%{public}fs n:%{public}fs)",  buf,  0x2Au);
      }
    }

    else
    {
      if (v11 <= 0.0)
      {
LABEL_16:
        objc_msgSend( MEMORY[0x1896123B8],  "messageForMethod:varguments:",  sel_async_willExpireAssertionsSoon,  0,  v28,  v29,  v30,  v31,  v32);
        id v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 sendToConnection:v7];

        goto LABEL_17;
      }

      rbs_connection_log();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void **)(a1 + 136);
        *(_DWORD *)buf = 138543618;
        __int128 v37 = v14;
        __int16 v38 = 2050;
        double v39 = v11;
        _os_log_impl( &dword_188634000,  v13,  OS_LOG_TYPE_DEFAULT,  "Boosting client %{public}@ for %{public}fs to handle expiration warning",  buf,  0x16u);
      }

      uint64_t v15 = (void *)MEMORY[0x189612170];
      __int16 v12 = (os_log_s *)*(id *)(a1 + 88);
      objc_msgSend(v15, "identifierWithClientPid:", -[os_log_s rbs_pid](v12, "rbs_pid"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x189612388], "targetWithPid:", objc_msgSend(*(id *)(a1 + 112), "rbs_pid"));
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189612190] grantUserInitiated];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v18;
      [MEMORY[0x1896121E8] attributeWithDuration:103 warningDuration:1 startPolicy:v11 endPolicy:0.0];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v19;
      [MEMORY[0x189612358] withReason:10101];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v20;
      [MEMORY[0x189603F18] arrayWithObjects:v35 count:3];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189612168] descriptorWithIdentifier:v16 target:v17 explanation:@"Will expire assertions soon" attributes:v21];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:]( &OBJC_CLASS___RBAssertionAcquisitionContext,  "contextForProcess:withDescriptor:daemonContext:",  v12,  v22,  *(void *)(a1 + 64));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = (void *)MEMORY[0x1896123B0];
      uint64_t v28 = MEMORY[0x1895F87A8];
      uint64_t v29 = 3221225472LL;
      uint64_t v30 = __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke;
      int v31 = &unk_18A255970;
      uint64_t v32 = a1;
      id v33 = v23;
      id v34 = v16;
      id v25 = v16;
      id v26 = v23;
      [v24 performBackgroundWorkWithServiceClass:25 block:&v28];
    }

    goto LABEL_16;
  }

void __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke_2;
  v4[3] = &unk_18A2566B0;
  v4[4] = v1;
  id v5 = *(id *)(a1 + 48);
  [v3 acquireAssertionWithContext:v2 completion:v4];
}

void __72__RBConnectionClient_willExpireAssertionsSoonForProcess_expirationTime___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 192);
    *(void *)(v4 + 192) = 0LL;
  }

  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v5 = *(void **)(v6 + 192);
    *(void *)(v6 + 192) = v7;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16LL));
}

- (void)willInvalidateAssertion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 136);
    id v12 = v3;
    [v3 originator];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 identifier];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = [v4 isEqual:v6];

    id v3 = v12;
    if ((_DWORD)v4)
    {
      id v7 = (os_unfair_lock_s *)(a1 + 16);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      id v8 = *(id *)(a1 + 8);
      os_unfair_lock_unlock(v7);
      if (v8)
      {
        double v9 = (void *)MEMORY[0x1896123B8];
        [v12 identifier];
        double v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "messageForMethod:varguments:", sel_async_assertionWillInvalidate_, v10, 0);
        double v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 sendToConnection:v8];
      }

      id v3 = v12;
    }
  }
}

- (void)didInvalidateAssertions:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x189603FE0] set];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v25 = v3;
    id obj = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          [v8 originator];
          double v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 identifier];
          double v10 = (void *)objc_claimAutoreleasedReturnValue();

          if ([*(id *)(a1 + 136) isEqual:v10])
          {
            [v8 identifier];
            double v11 = (void *)objc_claimAutoreleasedReturnValue();
            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
            int v12 = [*(id *)(a1 + 168) containsObject:v11];
            [*(id *)(a1 + 168) removeObject:v11];
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
            [*(id *)(a1 + 24) popPluginHoldForAssertion:v11];
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              rbs_assertion_log();
              uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v35 = v13;
                _os_log_impl(&dword_188634000, v14, OS_LOG_TYPE_INFO, "Releasing plugin hold token %@", buf, 0xCu);
              }

              [MEMORY[0x189611CB8] managerForUser:*(unsigned int *)(a1 + 144)];
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
              [v15 releaseHold:v13];
            }

            if (v12) {
              [v26 addObject:v11];
            }
          }
        }

        uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      }

      while (v5);
    }

    uint64_t v16 = [v26 count];
    if (v16)
    {
      uint64_t v17 = v16;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      id v18 = *(id *)(a1 + 8);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      if (v18)
      {
        rbs_assertion_log();
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[RBConnectionClient didInvalidateAssertions:].cold.1(a1, v17, v19);
        }

        id v20 = (void *)MEMORY[0x189607870];
        uint64_t v21 = *MEMORY[0x1896123E0];
        uint64_t v32 = *MEMORY[0x1896075F0];
        id v33 = @"Assertions were invalidated";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 errorWithDomain:v21 code:1 userInfo:v22];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend( MEMORY[0x1896123B8],  "messageForMethod:varguments:",  sel_async_assertionsDidInvalidate_withError_,  v26,  v23,  0);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 sendToConnection:v18];
      }
    }

    id v3 = v25;
  }
}

- (void)didRemoveProcess:(uint64_t)a1 withState:(void *)a2
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
    if ([*(id *)(a1 + 176) containsObject:v3])
    {
      [*(id *)(a1 + 176) removeObject:v3];
      id v4 = *(id *)(a1 + 8);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
      if (v4)
      {
        rbs_process_log();
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 112);
          [v3 lastExitContext];
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          uint64_t v13 = v6;
          __int16 v14 = 2112;
          id v15 = v3;
          __int16 v16 = 2112;
          uint64_t v17 = v7;
          _os_log_impl( &dword_188634000,  v5,  OS_LOG_TYPE_DEFAULT,  "Notifying connection %@ that process %@ exited with context %@",  buf,  0x20u);
        }

        id v8 = (void *)MEMORY[0x1896123B8];
        [v3 identifier];
        double v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 lastExitContext];
        double v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "messageForMethod:varguments:", sel_async_processDidExit_withContext_, v9, v10, 0);
        double v11 = (void *)objc_claimAutoreleasedReturnValue();

        [v11 sendToConnection:v4];
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
      id v4 = 0LL;
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    [*(id *)(a1 + 184) didObserveProcessExit:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

- (NSString)stateCaptureTitle
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBConnectionClient.m" lineNumber:1824 description:@"stateCaptureTitle should be unused for RBConnectionClient"];

  return 0LL;
}

- (uint64_t)processIdentifier
{
  if (result) {
    return *(void *)(result + 136);
  }
  return result;
}

- (uint64_t)processIdentity
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)handleMessage:(uint64_t)a3 .cold.1(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 112);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_3( &dword_188634000,  a2,  a3,  "Dropping message from %{public}@ that does not conform to expectations",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_1();
}

- (void)handleMessage:(uint64_t)a3 .cold.2(uint64_t a1, void *a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_13( &dword_188634000,  a4,  a3,  "Dropping message from %{public}@: The server is missing an implementation for %{public}@",  (uint8_t *)a3);
}

void __36__RBConnectionClient_handleMessage___block_invoke_cold_1()
{
}

- (void)handshakeWithRequest:(os_log_s *)a3 .cold.1(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_13(&dword_188634000, a3, (uint64_t)a3, "Expected %lu results; got %lu", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_1();
}

- (void)lookupHandleForKey:(void *)a1 error:(os_log_s *)a2 .cold.1(void *a1, os_log_s *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v4 = 138412546;
  __int16 v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a1 unsignedLongLongValue];
  OUTLINED_FUNCTION_2_2(&dword_188634000, a2, v3, "lookupHandleForKey failed for %@ (%llx)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)lookupHandleForKey:error:.cold.2()
{
}

- (void)lookupProcessName:(int)a1 error:(os_log_s *)a2 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_188634000,  a2,  OS_LOG_TYPE_ERROR,  "Could not get proc_pidinfo for pid %d to get name",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)lookupHandleForPredicate:error:.cold.1()
{
}

- (void)lookupHandleForPredicate:error:.cold.2()
{
}

- (void)lookupHandleForPredicate:error:.cold.3()
{
}

- (void)lookupPortForIdentifier:error:.cold.1()
{
}

- (void)executeTerminateRequest:(uint64_t)a3 withReply:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)subscribeToProcessDeath:error:.cold.1()
{
}

- (void)subscribeToProcessStateChangesWithConfiguration:error:.cold.1()
{
}

- (void)statesForPredicate:withDescriptor:withReply:.cold.1()
{
}

- (void)lastExitContextForInstance:error:.cold.1()
{
}

- (void)limitationsForInstance:error:.cold.1()
{
}

- (void)hostProcessForInstance:error:.cold.1()
{
}

- (void)infoPlistResultForInstance:forKeys:error:.cold.1()
{
}

- (void)preventLaunchPredicates
{
}

- (void)saveEndowment:(os_log_s *)a3 withError:.cold.1(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 104);
  [a2 key];
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  double v10 = v5;
  OUTLINED_FUNCTION_2_2( &dword_188634000,  a3,  v6,  "%{public}@ client tried to save endowment twice for key: <%{public}@>",  (uint8_t *)&v7);

  OUTLINED_FUNCTION_8();
}

- (void)isIdentityAnAngel:withError:.cold.1()
{
}

- (void)_canInvalidateAssertionWithIdentifier:(os_log_s *)a3 error:.cold.1( uint64_t *a1,  void *a2,  os_log_s *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *a1;
  int v5 = 138543618;
  uint64_t v6 = v4;
  __int16 v7 = 1024;
  int v8 = [a2 clientPid];
  _os_log_error_impl( &dword_188634000,  a3,  OS_LOG_TYPE_ERROR,  "Ignoring assertion invalidation request from %{public}@ because the assertion client identifier (%d) does not match",  (uint8_t *)&v5,  0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_requestPluginHoldForProxy:(void *)a1 terminate:(os_log_s *)a2 completion:.cold.1(void *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a1 bundleIdentifier];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = 138543362;
  uint64_t v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_188634000, a2, v4, "Could not get bundle URL for bundle %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1();
}

void __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_2(&dword_188634000, a3, v5, "Error acquiring hold on plugins for %{public}@: %{public}@", v6);

  OUTLINED_FUNCTION_8();
}

void __70__RBConnectionClient__requestPluginHoldForProxy_terminate_completion___block_invoke_cold_2( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_2( &dword_188634000,  a3,  v5,  "Ignoring unexpected error acquiring hold on plugins for %{public}@: %{public}@",  v6);

  OUTLINED_FUNCTION_8();
}

- (void)_addStatesForUntrackedProcessesTo:withPredicate:.cold.1()
{
}

- (void)didInvalidateAssertions:(os_log_s *)a3 .cold.1(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 136);
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_1( &dword_188634000,  a2,  a3,  "Notifying client %{public}@ of %lu invalidated assertions",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_1_1();
}

@end