@interface SUCoreFSM
- (BOOL)_activateMachineWithStateTable:(id)a3 withActionTable:(id)a4;
- (BOOL)isActive;
- (BOOL)performingEvent;
- (NSDictionary)stateTable;
- (NSMutableDictionary)registeredActionTable;
- (NSMutableDictionary)usageTable;
- (NSString)currentState;
- (NSString)fsmName;
- (NSString)fullName;
- (NSString)instanceName;
- (NSString)pendingFollowupEvent;
- (NSString)startState;
- (OS_dispatch_queue)extendedStateQueue;
- (SUCoreDiag)diag;
- (id)_acceptEvent:(id)a3 withInfo:(id)a4 issueType:(id)a5 attachedAction:(id *)a6;
- (id)_initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6 usingDelegate:(id)a7 registeringAllInfoClass:(Class)a8 registeringAndActivating:(BOOL)a9;
- (id)copyCurrentState;
- (id)copyCurrentStateProtected;
- (id)initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6;
- (id)initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6 usingDelegate:(id)a7 registeringAllInfoClass:(Class)a8;
- (id)initMachine:(id)a3 withTable:(id)a4 startingIn:(id)a5;
- (id)initMachine:(id)a3 withTable:(id)a4 startingIn:(id)a5 usingDelegate:(id)a6 registeringAllInfoClass:(Class)a7;
- (id)pendingFollowupInfo;
- (unint64_t)untrackedOccurrences;
- (void)_performEvent:(id)a3 withInfo:(id)a4 issueType:(id)a5 forCell:(id)a6 attachedAction:(id)a7 checkingAttached:(BOOL)a8;
- (void)_postEvent:(id)a3 withInfo:(id)a4;
- (void)_registerAction:(id)a3 ForEvent:(id)a4 inState:(id)a5 usingDelegate:(id)a6 withInfoClass:(Class)a7 actionTable:(id)a8 loggingRegistration:(BOOL)a9;
- (void)_registerAllActions:(id)a3 withInfoClass:(Class)a4 stateTable:(id)a5 actionTable:(id)a6 loggingRegistration:(BOOL)a7;
- (void)_simulateEventAlteration:(id)a3 fsmEvent:(id *)a4 eventInfo:(id *)a5 attachedAction:(id *)a6;
- (void)_trackEventOccurrence:(id)a3 withInfo:(id)a4 issueType:(id)a5;
- (void)_triggerAction:(id)a3 usingAttached:(id)a4 onEvent:(id)a5 inState:(id)a6 withInfo:(id)a7 nextState:(id)a8;
- (void)activateMachine;
- (void)dumpEventInStateOccurrences:(id)a3;
- (void)followupEvent:(id)a3;
- (void)followupEvent:(id)a3 withInfo:(id)a4;
- (void)postEvent:(id)a3;
- (void)postEvent:(id)a3 withInfo:(id)a4;
- (void)postProtectedEvent:(id)a3;
- (void)postProtectedEvent:(id)a3 withInfo:(id)a4;
- (void)registerAction:(id)a3 ForEvent:(id)a4 inState:(id)a5 usingDelegate:(id)a6 withInfoClass:(Class)a7;
- (void)registerAllActions:(id)a3 withInfoClass:(Class)a4;
- (void)setCurrentState:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setPendingFollowupEvent:(id)a3;
- (void)setPendingFollowupInfo:(id)a3;
- (void)setPerformingEvent:(BOOL)a3;
- (void)setUntrackedOccurrences:(unint64_t)a3;
- (void)setUsageTable:(id)a3;
- (void)teardownMachine;
@end

@implementation SUCoreFSM

- (id)initMachine:(id)a3 withTable:(id)a4 startingIn:(id)a5
{
  LOBYTE(v6) = 0;
  return -[SUCoreFSM _initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:]( self,  "_initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:",  a3,  0LL,  a4,  a5,  0LL,  0LL,  v6);
}

- (id)initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6
{
  LOBYTE(v7) = 0;
  return -[SUCoreFSM _initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:]( self,  "_initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:",  a3,  a4,  a5,  a6,  0LL,  0LL,  v7);
}

- (id)initMachine:(id)a3 withTable:(id)a4 startingIn:(id)a5 usingDelegate:(id)a6 registeringAllInfoClass:(Class)a7
{
  LOBYTE(v8) = 1;
  return -[SUCoreFSM _initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:]( self,  "_initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:",  a3,  0LL,  a4,  a5,  a6,  a7,  v8);
}

- (id)initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6 usingDelegate:(id)a7 registeringAllInfoClass:(Class)a8
{
  LOBYTE(v9) = 1;
  return -[SUCoreFSM _initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:]( self,  "_initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:",  a3,  a4,  a5,  a6,  a7,  a8,  v9);
}

- (id)_initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6 usingDelegate:(id)a7 registeringAllInfoClass:(Class)a8 registeringAndActivating:(BOOL)a9
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v69 = a7;
  v70.receiver = self;
  v70.super_class = (Class)&OBJC_CLASS___SUCoreFSM;
  v19 = -[SUCoreFSM init](&v70, sel_init);
  if (!v19) {
    goto LABEL_30;
  }
  id v68 = v16;
  v20 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  [v20 trackBegin:@"[FSM] API: initMachine"];

  v19->_isActive = 0;
  v19->_performingEvent = 0;
  pendingFollowupEvent = v19->_pendingFollowupEvent;
  v19->_pendingFollowupEvent = 0LL;

  id pendingFollowupInfo = v19->_pendingFollowupInfo;
  v19->_id pendingFollowupInfo = 0LL;

  usageTable = v19->_usageTable;
  v19->_usageTable = 0LL;

  v19->_untrackedOccurrences = 0LL;
  uint64_t v24 = objc_opt_new();
  registeredActionTable = v19->_registeredActionTable;
  v19->_registeredActionTable = (NSMutableDictionary *)v24;

  if (!v15)
  {
    v27 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    v28 = v27;
    v29 = @"FSM name not provided";
    uint64_t v30 = 8101LL;
LABEL_14:
    [v27 buildError:v30 underlying:0 description:v29];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    v28 = v27;
    v29 = @"invalid FSM name";
    uint64_t v30 = 8102LL;
    goto LABEL_14;
  }

  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v28 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
      [v28 buildError:8102 underlying:0 description:@"invalid instance name"];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
  }

  if (!v17)
  {
    v28 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    uint64_t v32 = [objc_alloc(NSString) initWithFormat:@"FSM(%@) state table not provided", v15];
LABEL_19:
    v34 = (void *)v32;
    v35 = v28;
    uint64_t v36 = 8101LL;
LABEL_22:
    [v35 buildError:v36 underlying:0 description:v34];
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    uint64_t v33 = [objc_alloc(NSString) initWithFormat:@"FSM(%@) invalid state table", v15];
LABEL_21:
    v34 = (void *)v33;
    v35 = v28;
    uint64_t v36 = 8102LL;
    goto LABEL_22;
  }

  if (!v18)
  {
    v28 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    uint64_t v32 = [objc_alloc(NSString) initWithFormat:@"FSM(%@) start state not provided", v15];
    goto LABEL_19;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    uint64_t v33 = [objc_alloc(NSString) initWithFormat:@"FSM(%@) invalid start state", v15];
    goto LABEL_21;
  }

  objc_storeStrong((id *)&v19->_fsmName, a3);
  objc_storeStrong((id *)&v19->_instanceName, a4);
  if (v19->_instanceName) {
    v26 = (NSString *)[objc_alloc(NSString) initWithFormat:@"%@[%@]", v19->_fsmName, v19->_instanceName];
  }
  else {
    v26 = v19->_fsmName;
  }
  fullName = v19->_fullName;
  v19->_fullName = v26;

  v28 = (void *)[objc_alloc(NSString) initWithFormat:@"%@.%@", @"fsm", v19->_fullName];
  v62 = (void *)[objc_alloc(NSString) initWithFormat:@"SUFSM_%@_%@", v19->_fullName, @"SUDiagDump.plist"];
  v47 = -[SUCoreDiag initWithAppendedDomain:appendingDumpFilename:]( objc_alloc(&OBJC_CLASS___SUCoreDiag),  "initWithAppendedDomain:appendingDumpFilename:",  v28,  v62);
  diag = v19->_diag;
  v19->_diag = v47;
  v49 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
  uint64_t v50 = [v49 commonDomain];

  v66 = (void *)v50;
  id v63 = [objc_alloc(NSString) initWithFormat:@"%@.%@.%@", v50, @"core.fsm.extended", v19->_fullName];
  uint64_t v51 = [v63 UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v52 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  v53 = (const char *)v51;
  v54 = v52;
  dispatch_queue_t v55 = dispatch_queue_create(v53, v52);
  extendedStateQueue = v19->_extendedStateQueue;
  v19->_extendedStateQueue = (OS_dispatch_queue *)v55;

  if (v19->_extendedStateQueue)
  {
    v57 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v57 oslog];
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    v64 = v58;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = v19->_fullName;
      *(_DWORD *)buf = 138543874;
      v72 = v66;
      __int16 v73 = 2114;
      v74 = @"core.fsm.extended";
      __int16 v75 = 2114;
      v76 = v59;
      _os_log_impl( &dword_187139000,  v58,  OS_LOG_TYPE_DEFAULT,  "[FSM] DISPATCH: created extended state dispatch queue domain(%{public}@.%{public}@.%{public}@)",  buf,  0x20u);
    }

    v31 = 0LL;
    v60 = v64;
  }

  else
  {
    v65 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    v61 = (void *)[objc_alloc(NSString) initWithFormat:@"FSM(%@) failed to create extended state dispatch queue", v19->_fullName];
    [v65 buildError:8100 underlying:0 description:v61];
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = (os_log_s *)v65;
  }

LABEL_23:
  if (a9)
  {
    -[SUCoreFSM _registerAllActions:withInfoClass:stateTable:actionTable:loggingRegistration:]( v19,  "_registerAllActions:withInfoClass:stateTable:actionTable:loggingRegistration:",  v69,  a8,  v17,  v19->_registeredActionTable,  0LL);
    if (-[SUCoreFSM _activateMachineWithStateTable:withActionTable:]( v19,  "_activateMachineWithStateTable:withActionTable:",  v17,  v19->_registeredActionTable))
    {
      objc_storeStrong((id *)&v19->_currentState, a6);
      v19->_isActive = 1;
    }

    else
    {
      v37 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
      v38 = (void *)[objc_alloc(NSString) initWithFormat:@"FSM(%@) failed to validate state table and registered actions", v19->_fullName];
      uint64_t v39 = [v37 buildError:8503 underlying:0 description:v38];

      v31 = (void *)v39;
    }
  }

  v40 = v18;
  if (!v31)
  {
    objc_storeStrong((id *)&v19->_stateTable, a5);
    objc_storeStrong((id *)&v19->_startState, a6);
    v44 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    [v44 trackEnd:@"[FSM] API: initMachine"];

    id v16 = v68;
LABEL_30:
    v43 = v19;
    v40 = v18;
    goto LABEL_31;
  }
  v41 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  objc_msgSend( v41,  "trackFailure:forReason:withResult:withError:",  @"[FSM] FAILURE: initMachine",  @"unable to fully validate and setup FSM",  objc_msgSend(v31, "code"),  v31);
  v42 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  objc_msgSend(v42, "trackEnd:withResult:withError:", @"[FSM] API: initMachine", objc_msgSend(v31, "code"), v31);

  v43 = 0LL;
  id v16 = v68;
LABEL_31:

  return v43;
}

- (void)teardownMachine
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__SUCoreFSM_teardownMachine__block_invoke;
  block[3] = &unk_189FE8FE8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __28__SUCoreFSM_teardownMachine__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 trackBegin:@"[FSM] API: teardownMachine"];

  if ([*(id *)(a1 + 32) isActive])
  {
    v3 = *(void **)(a1 + 32);
    id v21 = 0LL;
    [v3 _acceptEvent:@"Teardown" withInfo:0 issueType:@"post" attachedAction:&v21];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = v21;
    if (v4)
    {
      [*(id *)(a1 + 32) pendingFollowupEvent];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        [*(id *)(a1 + 32) diag];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        id v8 = objc_alloc(NSString);
        [*(id *)(a1 + 32) fullName];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 32) pendingFollowupEvent];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 32) currentState];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)[v8 initWithFormat:@"FSM(%@) pending follow-up event(%@) [starting teardown in state(%@)] discarded", v9, v10, v11];
        [v7 trackAnomaly:@"[FSM] TEARDOWN" forReason:v12 withResult:8117 withError:0];

        [*(id *)(a1 + 32) setPendingFollowupEvent:0];
        [*(id *)(a1 + 32) setPendingFollowupInfo:0];
      }

      [*(id *)(a1 + 32) setPerformingEvent:0];
      [*(id *)(a1 + 32) _performEvent:@"Teardown" withInfo:0 issueType:@"teardown" forCell:v4 attachedAction:v5 checkingAttached:1];
      [*(id *)(a1 + 32) pendingFollowupEvent];
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        [*(id *)(a1 + 32) diag];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        id v15 = objc_alloc(NSString);
        [*(id *)(a1 + 32) fullName];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 32) pendingFollowupEvent];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 32) currentState];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)[v15 initWithFormat:@"FSM(%@) pending follow-up event(%@) [ending teardown in state(%@)] discarded", v16, v17, v18];
        [v14 trackAnomaly:@"[FSM] TEARDOWN" forReason:v19 withResult:8117 withError:0];
      }

      [*(id *)(a1 + 32) setIsActive:0];
    }
  }
  v20 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  [v20 trackEnd:@"[FSM] API: teardownMachine"];
}

- (void)registerAction:(id)a3 ForEvent:(id)a4 inState:(id)a5 usingDelegate:(id)a6 withInfoClass:(Class)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v16);

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __73__SUCoreFSM_registerAction_ForEvent_inState_usingDelegate_withInfoClass___block_invoke;
  block[3] = &unk_189FE99A0;
  block[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  Class v27 = a7;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_sync(v17, block);
}

void __73__SUCoreFSM_registerAction_ForEvent_inState_usingDelegate_withInfoClass___block_invoke(void *a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 trackBegin:@"[FSM] API: registerAction" atLevel:0];

  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  uint64_t v8 = a1[8];
  uint64_t v7 = a1[9];
  [v3 registeredActionTable];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = 1;
  [v3 _registerAction:v4 ForEvent:v5 inState:v6 usingDelegate:v8 withInfoClass:v7 actionTable:v9 loggingRegistration:v10];

  +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 trackEnd:@"[FSM] API: registerAction" atLevel:0];
}

- (void)registerAllActions:(id)a3 withInfoClass:(Class)a4
{
  id v6 = a3;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__SUCoreFSM_registerAllActions_withInfoClass___block_invoke;
  block[3] = &unk_189FE99C8;
  block[4] = self;
  id v11 = v6;
  Class v12 = a4;
  id v9 = v6;
  dispatch_sync(v8, block);
}

void __46__SUCoreFSM_registerAllActions_withInfoClass___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 trackBegin:@"[FSM] API: registerAllActions"];

  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  [v3 stateTable];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) registeredActionTable];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 _registerAllActions:v4 withInfoClass:v5 stateTable:v6 actionTable:v7 loggingRegistration:1];

  +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 trackEnd:@"[FSM] API: registerAllActions"];
}

- (void)_registerAllActions:(id)a3 withInfoClass:(Class)a4 stateTable:(id)a5 actionTable:(id)a6 loggingRegistration:(BOOL)a7
{
  id v12 = a3;
  id v13 = a6;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke;
  v16[3] = &unk_189FE9A18;
  v16[4] = self;
  id v17 = v12;
  id v18 = v13;
  Class v19 = a4;
  BOOL v20 = a7;
  id v14 = v13;
  id v15 = v12;
  [a5 enumerateKeysAndObjectsUsingBlock:v16];
}

void __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke_2;
  v9[3] = &unk_189FE99F0;
  id v6 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  *(_OWORD *)id v8 = *(_OWORD *)(a1 + 48);
  id v7 = v8[0];
  __int128 v12 = *(_OWORD *)v8;
  char v13 = *(_BYTE *)(a1 + 64);
  v8[0] = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v9];
}

void __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v7 = a2;
  [a3 safeStringForKey:@"FSMAction"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    LOBYTE(v6) = *(_BYTE *)(a1 + 72);
    [*(id *)(a1 + 32) _registerAction:v5 ForEvent:v7 inState:*(void *)(a1 + 40) usingDelegate:*(void *)(a1 + 48) withInfoClass:*(void *)(a1 + 64) actionTable:*(void *)(a1 + 56) loggingRegistration:v6];
  }
}

- (void)_registerAction:(id)a3 ForEvent:(id)a4 inState:(id)a5 usingDelegate:(id)a6 withInfoClass:(Class)a7 actionTable:(id)a8 loggingRegistration:(BOOL)a9
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 safeObjectForKey:v17 ofClass:objc_opt_class()];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    uint64_t v22 = objc_opt_new();
    if (!v22)
    {
      id v34 = objc_alloc(NSString);
      v35 = -[SUCoreFSM fullName](self, "fullName");
      uint64_t v36 = (void *)[v34 initWithFormat:@"FSM(%@) unable to create actions for state(%@) so dropping registration of action(%@) for event(%@)", v35, v17, v15, v16];
      [v20 trackAnomaly:@"[FSM] REGISTER_EVENT" forReason:v36 withResult:8100 withError:0];

      goto LABEL_11;
    }

    id v21 = (void *)v22;
    [v19 setSafeObject:v22 forKey:v17];
  }

  int v23 = [v16 isEqualToString:@"Teardown"];
  if (a7 && v23)
  {
    id v24 = objc_alloc(NSString);
    -[SUCoreFSM fullName](self, "fullName");
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v24 initWithFormat:@"FSM(%@) action delegate registering for event(%@) with Class - not supported", v25, v16];
  }

  else
  {
    [v21 objectForKey:v16];
    Class v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      uint64_t v30 = -[SUCoreFSMAttachedAction initWithAction:usingDelegate:withInfoClass:]( objc_alloc(&OBJC_CLASS___SUCoreFSMAttachedAction),  "initWithAction:usingDelegate:withInfoClass:",  v15,  v18,  a7);
      [v21 setSafeObject:v30 forKey:v16];
      [v19 setSafeObject:v21 forKey:v17];
      if (a9)
      {
        v37 = v30;
        v31 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        [v31 oslog];
        uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          -[SUCoreFSM fullName](self, "fullName");
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          uint64_t v39 = v33;
          __int16 v40 = 2114;
          id v41 = v15;
          __int16 v42 = 2114;
          id v43 = v16;
          __int16 v44 = 2114;
          id v45 = v17;
          _os_log_impl( &dword_187139000,  v32,  OS_LOG_TYPE_DEFAULT,  "[FSM] REGISTER_EVENT: FSM(%{public}@) attached action(%{public}@) handling event(%{public}@) in state(%{public}@)",  buf,  0x2Au);
        }

        uint64_t v30 = v37;
      }

      goto LABEL_10;
    }

    id v28 = objc_alloc(NSString);
    -[SUCoreFSM fullName](self, "fullName");
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v28 initWithFormat:@"FSM(%@) action delegate already registered as event handler for event(%@)", v25, v16];
  }

  v29 = (void *)v26;
  [v20 trackAnomaly:@"[FSM] REGISTER_EVENT" forReason:v26 withResult:8111 withError:0];

LABEL_10:
LABEL_11:
}

- (void)activateMachine
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__SUCoreFSM_activateMachine__block_invoke;
  block[3] = &unk_189FE8FE8;
  block[4] = self;
  dispatch_sync(v4, block);
}

void __28__SUCoreFSM_activateMachine__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 trackBegin:@"[FSM] API: activateMachine" atLevel:1];

  if ([*(id *)(a1 + 32) isActive])
  {
    v3 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v9 = v3;
    uint64_t v4 = 8502LL;
LABEL_6:
    [v3 trackEnd:@"[FSM] API: activateMachine" atLevel:1 withResult:v4 withError:0];
    goto LABEL_7;
  }

  id v5 = *(void **)(a1 + 32);
  [v5 stateTable];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) registeredActionTable];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = [v5 _activateMachineWithStateTable:v6 withActionTable:v7];

  if (!(_DWORD)v5)
  {
    v3 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v9 = v3;
    uint64_t v4 = 8503LL;
    goto LABEL_6;
  }

  [*(id *)(a1 + 32) startState];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setCurrentState:v8];

  [*(id *)(a1 + 32) setIsActive:1];
  +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 trackEnd:@"[FSM] API: activateMachine" atLevel:1];
LABEL_7:
}

- (BOOL)_activateMachineWithStateTable:(id)a3 withActionTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = 0LL;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 1;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke;
  v13[3] = &unk_189FE9A68;
  id v9 = v6;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  id v16 = self;
  id v18 = &v19;
  id v11 = v7;
  id v17 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
  LOBYTE(v7) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v7;
}

void __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke_2;
  v10[3] = &unk_189FE9A40;
  id v11 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(void **)(a1 + 56);
  id v12 = v6;
  uint64_t v13 = v7;
  uint64_t v16 = *(void *)(a1 + 64);
  id v14 = v8;
  id v15 = v5;
  id v9 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
}

void __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v29 = a2;
  id v5 = a3;
  [v5 safeStringForKey:@"FSMNextState"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:@"FSMAction"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && ([v6 isEqualToString:@"NOT_VALID"] & 1) == 0)
  {
    [*(id *)(a1 + 32) safeDictionaryForKey:v6 fromBase:@"SUCoreFSM stateTable" withKeyDescription:@"next state"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      id v9 = *(void **)(a1 + 40);
      id v10 = objc_alloc(NSString);
      [*(id *)(a1 + 48) fullName];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = (void *)[v10 initWithFormat:@"FSM(%@) with nextState(%@) that is not defined in state table", v11, v6];
      [v9 trackAnomaly:@"[FSM] ACTIVATE_MACHINE" forReason:v12 withResult:8100 withError:0];

      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
    }
  }

  if (v7)
  {
    [*(id *)(a1 + 56) safeDictionaryForKey:*(void *)(a1 + 64) fromBase:@"SUCoreFSM actionTable" withKeyDescription:@"FSM state"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 safeObjectForKey:v29 ofClass:objc_opt_class()];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v14;
    if (v14)
    {
      [v14 fsmAction];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      char v17 = [v7 isEqualToString:v16];

      if ((v17 & 1) == 0)
      {
        id v24 = *(void **)(a1 + 40);
        id v25 = objc_alloc(NSString);
        [*(id *)(a1 + 48) fullName];
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = *(void *)(a1 + 64);
        [v15 fsmAction];
        int v23 = (void *)objc_claimAutoreleasedReturnValue();
        Class v27 = (void *)[v25 initWithFormat:@"FSM(%@) forEvent(%@) inState(%@) table action(%@) != registered event action(%@)", v20, v29, v26, v7, v23];
        [v24 trackAnomaly:@"[FSM] ACTIVATE_MACHINE" forReason:v27 withResult:8100 withError:0];

        goto LABEL_15;
      }

      if (![v29 isEqualToString:@"Teardown"]
        || ![v15 eventInfoClass])
      {
        goto LABEL_16;
      }

      id v18 = *(void **)(a1 + 40);
      id v19 = objc_alloc(NSString);
      [*(id *)(a1 + 48) fullName];
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v19 initWithFormat:@"FSM(%@) forEvent(%@) inState(%@) indicates event info Class when not supported", v20, v29, *(void *)(a1 + 64), v28];
    }

    else
    {
      id v18 = *(void **)(a1 + 40);
      id v22 = objc_alloc(NSString);
      [*(id *)(a1 + 48) fullName];
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v22 initWithFormat:@"FSM(%@) forEvent(%@) inState(%@) hasAction(%@) yet event handler has not been registered", v20, v29, *(void *)(a1 + 64), v7];
    }

    int v23 = (void *)v21;
    [v18 trackAnomaly:@"[FSM] ACTIVATE_MACHINE" forReason:v21 withResult:8100 withError:0];
LABEL_15:

    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
LABEL_16:
  }
}

- (void)postEvent:(id)a3
{
}

- (void)postEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__SUCoreFSM_postEvent_withInfo___block_invoke;
  block[3] = &unk_189FE92F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __32__SUCoreFSM_postEvent_withInfo___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 trackBegin:@"[FSM] API: postEvent" atLevel:0];

  return [*(id *)(a1 + 32) _postEvent:*(void *)(a1 + 40) withInfo:*(void *)(a1 + 48)];
}

- (void)postProtectedEvent:(id)a3
{
}

- (void)postProtectedEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 trackBegin:@"[FSM] API: postProtectedEvent" atLevel:0];

  -[SUCoreFSM _postEvent:withInfo:](self, "_postEvent:withInfo:", v9, v6);
}

- (void)followupEvent:(id)a3
{
}

- (void)followupEvent:(id)a3 withInfo:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (-[SUCoreFSM performingEvent](self, "performingEvent"))
  {
    -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[SUCoreFSM setPendingFollowupEvent:](self, "setPendingFollowupEvent:", v18);
      -[SUCoreFSM setPendingFollowupInfo:](self, "setPendingFollowupInfo:", v6);
      goto LABEL_7;
    }

    -[SUCoreFSM diag](self, "diag");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = objc_alloc(NSString);
    -[SUCoreFSM fullName](self, "fullName");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreFSM currentState](self, "currentState");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = (void *)[v10 initWithFormat:@"FSM(%@) follow-up event(%@) in state(%@) ignored - already have follow-up event(%@)", v11, v18, v12, v13];
    [v9 trackAnomaly:@"[FSM] FOLLOW_UP_EVENT" forReason:v14 withResult:8111 withError:0];
  }

  else
  {
    -[SUCoreFSM diag](self, "diag");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = objc_alloc(NSString);
    -[SUCoreFSM fullName](self, "fullName");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreFSM currentState](self, "currentState");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    char v17 = (void *)[v15 initWithFormat:@"FSM(%@) follow-up event(%@) in state(%@) ignored - not performing any event", v11, v18, v16];
    [v9 trackAnomaly:@"[FSM] FOLLOW_UP_EVENT" forReason:v17 withResult:8115 withError:0];
  }

LABEL_7:
}

- (id)copyCurrentState
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = __Block_byref_object_copy__4;
  id v12 = __Block_byref_object_dispose__4;
  id v13 = 0LL;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __29__SUCoreFSM_copyCurrentState__block_invoke;
  v7[3] = &unk_189FE9010;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __29__SUCoreFSM_copyCurrentState__block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)copyCurrentStateProtected
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreFSM currentState](self, "currentState");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v4 copy];

  return v5;
}

- (void)dumpEventInStateOccurrences:(id)a3
{
  id v4 = a3;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke;
  block[3] = &unk_189FE8FC0;
  block[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, block);
}

void __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 stateTable];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_2;
    v11[3] = &unk_189FE9340;
    id v5 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v11];
  }

  else
  {
    [v3 diag];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = objc_alloc(NSString);
    uint64_t v7 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) fullName];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = (void *)[v6 initWithFormat:@"%@:FSM(%@) has no defined state table", v7, v8];
    [v10 trackAnomaly:@"[FSM] DUMP_EVENT_IN_STATE" forReason:v9 withResult:8117 withError:0];
  }

void __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  id v8[2] = __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_3;
  v8[3] = &unk_189FE9A90;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  [a3 safeStringForKey:@"FSMAction"];
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) usageTable];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [*(id *)(a1 + 32) usageTable];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 safeDictionaryForKey:*(void *)(a1 + 40) fromBase:@"dumpEventInStateOccurrences" withKeyDescription:@"state name"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      [v9 safeDictionaryForKey:v5 fromBase:@"dumpEventInStateOccurrences" withKeyDescription:@"event name"];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        uint64_t v11 = [v10 safeULLForKey:@"FSMOccurrences"];
        +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 oslog];
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 48);
          uint64_t v15 = [*(id *)(a1 + 32) fsmName];
          uint64_t v16 = (void *)v15;
          uint64_t v17 = *(void *)(a1 + 40);
          id v18 = @"NONE";
          int v24 = 138413570;
          if (v6) {
            id v18 = v6;
          }
          uint64_t v25 = v14;
          __int16 v26 = 2112;
          uint64_t v27 = v15;
          __int16 v28 = 2112;
          uint64_t v29 = v17;
          __int16 v30 = 2112;
          id v31 = v5;
          __int16 v32 = 2112;
          uint64_t v33 = v18;
          __int16 v34 = 2048;
          uint64_t v35 = v11;
          _os_log_impl( &dword_187139000,  v13,  OS_LOG_TYPE_DEFAULT,  "[FSM] DUMP_EVENT_IN_STATE | %@:FSM(%@) | STATE(%@) EVENT(%@) ACTION(%@) | occurrences:%llu",  (uint8_t *)&v24,  0x3Eu);
        }

- (void)_postEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  id v39 = 0LL;
  -[SUCoreFSM _acceptEvent:withInfo:issueType:attachedAction:]( self,  "_acceptEvent:withInfo:issueType:attachedAction:",  v6,  v7,  @"post",  &v39);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v39;
  if (v9)
  {
    -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SUCoreFSM diag](self, "diag");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = objc_alloc(NSString);
      -[SUCoreFSM fullName](self, "fullName");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM currentState](self, "currentState");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = (void *)[v13 initWithFormat:@"FSM(%@) pending follow-up event(%@) [prior to performing event(%@) in state(%@)] discarded", v14, v15, v6, v16];
      [v12 trackAnomaly:@"[FSM] POST_EVENT" forReason:v17 withResult:8117 withError:0];

      -[SUCoreFSM setPendingFollowupEvent:](self, "setPendingFollowupEvent:", 0LL);
      -[SUCoreFSM setPendingFollowupInfo:](self, "setPendingFollowupInfo:", 0LL);
    }

    id v34 = v6;
    id v18 = v6;
    -[SUCoreFSM setPerformingEvent:](self, "setPerformingEvent:", 1LL);
    while (1)
    {
      +[SUCoreSimulate sharedSimulator](&OBJC_CLASS___SUCoreSimulate, "sharedSimulator");
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM fsmName](self, "fsmName");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM currentState](self, "currentState");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 fsm:v20 forEvent:v18 inState:v21];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        id v37 = v7;
        id v38 = v18;
        id v36 = v10;
        -[SUCoreFSM _simulateEventAlteration:fsmEvent:eventInfo:attachedAction:]( self,  "_simulateEventAlteration:fsmEvent:eventInfo:attachedAction:",  v22,  &v38,  &v37,  &v36);
        id v23 = v38;

        id v24 = v37;
        id v25 = v36;

        [v25 fsmAction];
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v27 = v26 == 0LL;

        id v7 = v24;
        id v10 = v25;
        id v18 = v23;
      }

      else
      {
        BOOL v27 = 1LL;
      }

      -[SUCoreFSM _performEvent:withInfo:issueType:forCell:attachedAction:checkingAttached:]( self,  "_performEvent:withInfo:issueType:forCell:attachedAction:checkingAttached:",  v18,  v7,  @"post",  v9,  v10,  v27);

      -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28) {
        break;
      }

      -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM pendingFollowupInfo](self, "pendingFollowupInfo");
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue();
      id v35 = 0LL;
      -[SUCoreFSM _acceptEvent:withInfo:issueType:attachedAction:]( self,  "_acceptEvent:withInfo:issueType:attachedAction:",  v29,  v30,  @"follow-up",  &v35);
      id v31 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = v35;

      if (!v31)
      {
        id v9 = 0LL;
        break;
      }

      -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = -[SUCoreFSM pendingFollowupInfo](self, "pendingFollowupInfo");

      -[SUCoreFSM setPendingFollowupEvent:](self, "setPendingFollowupEvent:", 0LL);
      -[SUCoreFSM setPendingFollowupInfo:](self, "setPendingFollowupInfo:", 0LL);

      id v7 = (id)v32;
      id v9 = v31;
      if (!v18) {
        goto LABEL_14;
      }
    }

    id v31 = v9;
    uint64_t v32 = (uint64_t)v7;
LABEL_14:
    -[SUCoreFSM setPerformingEvent:](self, "setPerformingEvent:", 0LL);

    id v7 = (id)v32;
    id v6 = v34;
  }

  +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 trackEnd:@"[FSM] API: postEvent" atLevel:0];
}

- (void)_simulateEventAlteration:(id)a3 fsmEvent:(id *)a4 eventInfo:(id *)a5 attachedAction:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [v10 simAction];
  if (v11 == 10)
  {
    [v10 fsmEvent];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v19 = *a5;
    id v27 = 0LL;
    -[SUCoreFSM _acceptEvent:withInfo:issueType:attachedAction:]( self,  "_acceptEvent:withInfo:issueType:attachedAction:",  v18,  v19,  @"simulate",  &v27);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = v27;

    if (v20)
    {
      [v10 fsmEvent];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      *a6 = v21;
    }
  }

  else if (v11 == 9)
  {
    id v12 = *a6;
    id v13 = objc_alloc(&OBJC_CLASS___SUCoreFSMAttachedAction);
    [v10 alteration];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 actionDelegate];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = -[SUCoreFSMAttachedAction initWithAction:usingDelegate:withInfoClass:]( v13,  "initWithAction:usingDelegate:withInfoClass:",  v14,  v15,  [v12 eventInfoClass]);

    uint64_t v17 = v16;
    *a6 = v17;
  }

  else
  {
    -[SUCoreFSM diag](self, "diag");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = objc_alloc(NSString);
    -[SUCoreFSM fsmName](self, "fsmName");
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 summary];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v26 = (void *)[v23 initWithFormat:@"FSM(%@) unsupported simulate action: %@", v24, v25];
    [v22 trackAnomaly:@"[FSM] SIMULATE" forReason:v26 withResult:8113 withError:0];
  }
}

- (id)_acceptEvent:(id)a3 withInfo:(id)a4 issueType:(id)a5 attachedAction:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (-[SUCoreFSM isActive](self, "isActive"))
    {
      -[SUCoreFSM stateTable](self, "stateTable");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM currentState](self, "currentState");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 safeDictionaryForKey:v15 fromBase:@"SUCoreFSM stateTable" withKeyDescription:@"current state"];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

      [v16 safeDictionaryForKey:v10 fromBase:@"SUCoreFSM eventsForState" withKeyDescription:@"FSM event"];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v40 = v11;
      if (v16)
      {
        if (v17)
        {
          -[SUCoreFSM registeredActionTable](self, "registeredActionTable");
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCoreFSM currentState](self, "currentState");
          id v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 safeDictionaryForKey:v19 fromBase:@"SUCoreFSM registeredActionTable" withKeyDescription:@"current state"];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

          [v20 safeObjectForKey:v10 ofClass:objc_opt_class()];
          id v21 = (void *)objc_claimAutoreleasedReturnValue();
          id v22 = v21;
          id v11 = v40;
          if (v40)
          {
            if (v21)
            {
              if (![v21 eventInfoClass])
              {
                -[SUCoreFSM diag](self, "diag");
                id v23 = (void *)objc_claimAutoreleasedReturnValue();
                id v38 = objc_alloc(NSString);
                -[SUCoreFSM fullName](self, "fullName");
                id v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUCoreFSM currentState](self, "currentState");
                __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v27 = [v38 initWithFormat:@"FSM(%@) event info provided when registered handler is not expecting any event info parameter: %@ event(%@) in state(%@)", v25, v12, v10, v26];
                goto LABEL_24;
              }

              [v22 eventInfoClass];
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                -[SUCoreFSM diag](self, "diag");
                id v23 = (void *)objc_claimAutoreleasedReturnValue();
                id v24 = objc_alloc(NSString);
                -[SUCoreFSM fullName](self, "fullName");
                id v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUCoreFSM currentState](self, "currentState");
                __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v27 = [v24 initWithFormat:@"FSM(%@) event info Class mismatch (eventInfo of diff Class than registered): %@ event(%@) in state(%@)", v25, v12, v10, v26];
LABEL_24:
                id v39 = (void *)v27;
                [v23 trackAnomaly:@"[FSM] ACCEPT_EVENT" forReason:v27 withResult:8112 withError:0];

                id v11 = v40;
                goto LABEL_13;
              }
            }
          }

          else if (v21 && [v21 eventInfoClass])
          {
            -[SUCoreFSM diag](self, "diag");
            id v23 = (void *)objc_claimAutoreleasedReturnValue();
            id v37 = objc_alloc(NSString);
            -[SUCoreFSM fullName](self, "fullName");
            id v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCoreFSM currentState](self, "currentState");
            __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v27 = [v37 initWithFormat:@"FSM(%@) event info Class mismatch (nil eventInfo when registered handler expecting non-nil): %@ event(%@) in state(%@)", v25, v12, v10, v26];
            goto LABEL_24;
          }

          id v22 = v22;
          *a6 = v22;
          goto LABEL_14;
        }

        -[SUCoreFSM diag](self, "diag");
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        id v36 = objc_alloc(NSString);
        -[SUCoreFSM fullName](self, "fullName");
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreFSM currentState](self, "currentState");
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        id v34 = (void *)[v36 initWithFormat:@"FSM(%@) current state(%@) does not support %@ event(%@)", v32, v33, v12, v10];
        [v20 trackAnomaly:@"[FSM] ACCEPT_EVENT" forReason:v34 withResult:8501 withError:0];
      }

      else
      {
        -[SUCoreFSM diag](self, "diag");
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        id v31 = objc_alloc(NSString);
        -[SUCoreFSM fullName](self, "fullName");
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreFSM currentState](self, "currentState");
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreFSM stateTable](self, "stateTable");
        id v34 = (void *)objc_claimAutoreleasedReturnValue();
        id v35 = (void *)[v31 initWithFormat:@"FSM(%@) current state(%@) does not exist in state table when checking %@ event(%@) table:\n%@", v32, v33, v12, v10, v34];
        [v20 trackAnomaly:@"[FSM] ACCEPT_EVENT" forReason:v35 withResult:8500 withError:0];
      }

      id v11 = v40;
    }

    else
    {
      -[SUCoreFSM diag](self, "diag");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v30 = objc_alloc(NSString);
      -[SUCoreFSM fullName](self, "fullName");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = (void *)[v30 initWithFormat:@"FSM(%@) not active at %@ event(%@)", v16, v12, v10];
      [v17 trackAnomaly:@"[FSM] ACCEPT_EVENT" forReason:v20 withResult:8111 withError:0];
    }
  }

  else
  {
    -[SUCoreFSM diag](self, "diag");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v28 = objc_alloc(NSString);
    -[SUCoreFSM fullName](self, "fullName");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = (void *)[v28 initWithFormat:@"FSM(%@) invalid %@ event", v16, v12];
    [v17 trackFailure:@"[FSM] ACCEPT_EVENT" forReason:v20 withResult:8111 withError:0];
  }

  id v22 = 0LL;
LABEL_13:

  uint64_t v17 = 0LL;
LABEL_14:

  return v17;
}

- (void)_performEvent:(id)a3 withInfo:(id)a4 issueType:(id)a5 forCell:(id)a6 attachedAction:(id)a7 checkingAttached:(BOOL)a8
{
  BOOL v8 = a8;
  id v35 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  unint64_t v17 = (unint64_t)a7;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  -[SUCoreFSM _trackEventOccurrence:withInfo:issueType:]( self,  "_trackEventOccurrence:withInfo:issueType:",  v35,  v14,  v15);
  -[SUCoreFSM currentState](self, "currentState");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 safeStringForKey:@"FSMNextState"];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20) {
    -[SUCoreFSM setCurrentState:](self, "setCurrentState:", v20);
  }
  if (v8) {
    [v16 safeStringForKey:@"FSMAction"];
  }
  else {
  uint64_t v21 = [(id)v17 fsmAction];
  }
  -[SUCoreFSM diag](self, "diag");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreFSM fullName](self, "fullName");
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 trackStateEvent:v23 previousState:v19 handlingEvent:v35 nextState:v20 performingAction:v21 withInfo:v14];

  if (v17 | v21)
  {
    if (v17
      && v21
      && ([(id)v17 fsmAction],
          id v24 = (void *)objc_claimAutoreleasedReturnValue(),
          int v25 = [(id)v21 isEqualToString:v24],
          v24,
          v25))
    {
      -[SUCoreFSM _triggerAction:usingAttached:onEvent:inState:withInfo:nextState:]( self,  "_triggerAction:usingAttached:onEvent:inState:withInfo:nextState:",  v21,  v17,  v35,  v19,  v14,  v20);
    }

    else
    {
      -[SUCoreFSM diag](self, "diag");
      uint64_t v33 = v19;
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
      id v27 = objc_alloc(NSString);
      -[SUCoreFSM fullName](self, "fullName");
      id v34 = v16;
      id v28 = v15;
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM currentState](self, "currentState");
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)v17 fsmAction];
      id v31 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = (void *)[v27 initWithFormat:@"FSM(%@) event where action indicated (but table / registration mismatch) %@ event(%@) in state(%@) action(%@)!=attached(%@)", v29, v28, v35, v30, v21, v31];
      [v26 trackAnomaly:@"[FSM] PERFORM_EVENT" forReason:v32 withResult:8112 withError:0];

      id v15 = v28;
      id v16 = v34;

      id v19 = v33;
    }
  }
}

- (void)_trackEventOccurrence:(id)a3 withInfo:(id)a4 issueType:(id)a5
{
  id v22 = a3;
  id v7 = a5;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  BOOL v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SUCoreFSM usageTable](self, "usageTable");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    -[SUCoreFSM setUsageTable:](self, "setUsageTable:", v10);
  }

  -[SUCoreFSM usageTable](self, "usageTable");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SUCoreFSM usageTable](self, "usageTable");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreFSM currentState](self, "currentState");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 safeDictionaryForKey:v13 fromBase:v7 withKeyDescription:@"current state"];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14) {
      goto LABEL_6;
    }
    id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
    -[SUCoreFSM usageTable](self, "usageTable");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreFSM currentState](self, "currentState");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setSafeObject:v14 forKey:v16];

    if (v14)
    {
LABEL_6:
      [v14 safeDictionaryForKey:v22 fromBase:v7 withKeyDescription:@"FSM event"];
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        id v17 = objc_alloc_init(MEMORY[0x189603FC8]);
        [v14 setSafeObject:v17 forKey:v22];
        if (!v17)
        {
          -[SUCoreFSM setUntrackedOccurrences:]( self,  "setUntrackedOccurrences:",  -[SUCoreFSM untrackedOccurrences](self, "untrackedOccurrences") + 1);
          goto LABEL_15;
        }
      }

      [v17 safeObjectForKey:@"FSMOccurrences" ofClass:objc_opt_class()];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = [v18 unsignedLongLongValue] + 1;
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedLongLong:v20];

        if (v21)
        {
LABEL_10:
          [v17 setSafeObject:v21 forKey:@"FSMOccurrences"];
LABEL_14:

LABEL_15:
          goto LABEL_16;
        }
      }

      else
      {
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedLongLong:1];
        if (v21) {
          goto LABEL_10;
        }
      }

      -[SUCoreFSM setUntrackedOccurrences:]( self,  "setUntrackedOccurrences:",  -[SUCoreFSM untrackedOccurrences](self, "untrackedOccurrences") + 1);
      goto LABEL_14;
    }
  }

  -[SUCoreFSM setUntrackedOccurrences:]( self,  "setUntrackedOccurrences:",  -[SUCoreFSM untrackedOccurrences](self, "untrackedOccurrences") + 1);
LABEL_16:
}

- (void)_triggerAction:(id)a3 usingAttached:(id)a4 onEvent:(id)a5 inState:(id)a6 withInfo:(id)a7 nextState:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  uint64_t v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v20);

  id v21 = objc_alloc(NSString);
  -[SUCoreFSM fullName](self, "fullName");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  id v23 = (void *)[v21 initWithFormat:@"[FSM] ACTION: FSM(%@), action(%@)", v22, v19];

  +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 trackBegin:v23 atLevel:0];

  [v18 actionDelegate];
  int v25 = (void *)objc_claimAutoreleasedReturnValue();

  id v29 = 0LL;
  uint64_t v26 = [v25 performAction:v19 onEvent:v17 inState:v16 withInfo:v15 nextState:v14 error:&v29];

  id v27 = v29;
  +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 trackEnd:v23 atLevel:0 withResult:v26 withError:v27];
}

- (NSString)fsmName
{
  return self->_fsmName;
}

- (NSString)instanceName
{
  return self->_instanceName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (NSMutableDictionary)usageTable
{
  return self->_usageTable;
}

- (void)setUsageTable:(id)a3
{
}

- (unint64_t)untrackedOccurrences
{
  return self->_untrackedOccurrences;
}

- (void)setUntrackedOccurrences:(unint64_t)a3
{
  self->_untrackedOccurrences = a3;
}

- (NSString)startState
{
  return self->_startState;
}

- (SUCoreDiag)diag
{
  return self->_diag;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (NSString)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (NSMutableDictionary)registeredActionTable
{
  return self->_registeredActionTable;
}

- (BOOL)performingEvent
{
  return self->_performingEvent;
}

- (void)setPerformingEvent:(BOOL)a3
{
  self->_performingEvent = a3;
}

- (NSString)pendingFollowupEvent
{
  return self->_pendingFollowupEvent;
}

- (void)setPendingFollowupEvent:(id)a3
{
}

- (id)pendingFollowupInfo
{
  return self->_pendingFollowupInfo;
}

- (void)setPendingFollowupInfo:(id)a3
{
}

- (OS_dispatch_queue)extendedStateQueue
{
  return self->_extendedStateQueue;
}

- (void).cxx_destruct
{
}

@end