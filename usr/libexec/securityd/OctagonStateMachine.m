@interface OctagonStateMachine
- (BOOL)allowPendingFlags;
- (BOOL)halted;
- (BOOL)isPaused;
- (CKKSCondition)paused;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)pendingFlagsScheduler;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKKSResultOperation)nextStateMachineCycleOperation;
- (NSDictionary)stateConditions;
- (NSDictionary)stateNumberMap;
- (NSMutableArray)stateMachineRequests;
- (NSMutableArray)stateMachineWatchers;
- (NSMutableDictionary)mutableStateConditions;
- (NSMutableDictionary)pendingFlags;
- (NSMutableSet)testHoldStates;
- (NSOperation)checkReachabilityOperation;
- (NSOperation)checkUnlockOperation;
- (NSOperation)holdStateMachineOperation;
- (NSOperationQueue)operationQueue;
- (NSSet)allowableStates;
- (NSString)name;
- (NSString)unexpectedStateErrorDomain;
- (OS_dispatch_queue)queue;
- (OctagonFlags)currentFlags;
- (OctagonStateMachine)initWithName:(id)a3 states:(id)a4 flags:(id)a5 initialState:(id)a6 queue:(id)a7 stateEngine:(id)a8 unexpectedStateErrorDomain:(id)a9 lockStateTracker:(id)a10 reachabilityTracker:(id)a11;
- (OctagonStateMachineEngine)stateEngine;
- (OctagonStateString)currentState;
- (id)_onqueueNextStateMachineTransition;
- (id)createOperationToFinishAttempt:(id)a3;
- (id)description;
- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 reply:(id)a6;
- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 transitionOp:(id)a6 reply:(id)a7;
- (id)dumpPendingFlags;
- (id)pendingFlagsString;
- (id)possiblePendingFlags;
- (id)timeoutErrorForState:(id)a3;
- (id)waitForState:(id)a3 wait:(unint64_t)a4;
- (unint64_t)conditionChecksInFlight;
- (unint64_t)currentConditions;
- (unint64_t)timeout;
- (void)_onqueueHandleFlag:(id)a3;
- (void)_onqueueHandlePendingFlag:(id)a3;
- (void)_onqueueHandlePendingFlagLater:(id)a3;
- (void)_onqueuePokeStateMachine;
- (void)_onqueueRecheckConditions;
- (void)_onqueueRegisterMultiStateArrivalWatcher:(id)a3 startTimeout:(unint64_t)a4;
- (void)_onqueueSendAnyPendingFlags;
- (void)_onqueueStartNextStateMachineOperation:(BOOL)a3;
- (void)disablePendingFlags;
- (void)doSimpleStateMachineRPC:(id)a3 op:(id)a4 sourceStates:(id)a5 reply:(id)a6;
- (void)haltOperation;
- (void)handleExternalRequest:(id)a3 startTimeout:(unint64_t)a4;
- (void)handleFlag:(id)a3;
- (void)handlePendingFlag:(id)a3;
- (void)pokeStateMachine;
- (void)registerMultiStateArrivalWatcher:(id)a3 startTimeout:(unint64_t)a4;
- (void)registerStateTransitionWatcher:(id)a3 startTimeout:(unint64_t)a4;
- (void)setAllowPendingFlags:(BOOL)a3;
- (void)setCheckReachabilityOperation:(id)a3;
- (void)setCheckUnlockOperation:(id)a3;
- (void)setConditionChecksInFlight:(unint64_t)a3;
- (void)setCurrentConditions:(unint64_t)a3;
- (void)setCurrentFlags:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setHalted:(BOOL)a3;
- (void)setHoldStateMachineOperation:(id)a3;
- (void)setMutableStateConditions:(id)a3;
- (void)setName:(id)a3;
- (void)setNextStateMachineCycleOperation:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPaused:(id)a3;
- (void)setPendingFlags:(id)a3;
- (void)setPendingFlagsScheduler:(id)a3;
- (void)setStateEngine:(id)a3;
- (void)setStateMachineRequests:(id)a3;
- (void)setStateMachineWatchers:(id)a3;
- (void)setTestHoldStates:(id)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)setWatcherTimeout:(unint64_t)a3;
- (void)startOperation;
- (void)testPauseStateMachineAfterEntering:(id)a3;
- (void)testReleaseStateMachinePause:(id)a3;
@end

@implementation OctagonStateMachine

- (OctagonStateMachine)initWithName:(id)a3 states:(id)a4 flags:(id)a5 initialState:(id)a6 queue:(id)a7 stateEngine:(id)a8 unexpectedStateErrorDomain:(id)a9 lockStateTracker:(id)a10 reachabilityTracker:(id)a11
{
  id v61 = a3;
  id v65 = a4;
  id v62 = a5;
  id v60 = a6;
  id v64 = a7;
  id obj = a8;
  id v57 = a9;
  id v58 = a10;
  id v59 = a11;
  v73.receiver = self;
  v73.super_class = (Class)&OBJC_CLASS___OctagonStateMachine;
  v18 = -[OctagonStateMachine init](&v73, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v19->_lockStateTracker, a10);
    objc_storeStrong((id *)&v19->_reachabilityTracker, a11);
    v19->_conditionChecksInFlight = 0LL;
    v19->_currentConditions = 0LL;
    id v20 = [v65 mutableCopy];
    [v20 setObject:&off_1002AD6E0 forKeyedSubscript:@"not_started"];
    [v20 setObject:&off_1002AD6F8 forKeyedSubscript:@"halted"];
    objc_storeStrong((id *)&v19->_stateNumberMap, v20);
    objc_storeStrong((id *)&v19->_unexpectedStateErrorDomain, a9);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allKeys]);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v21));
    allowableStates = v19->_allowableStates;
    v19->_allowableStates = (NSSet *)v22;

    objc_storeStrong((id *)&v19->_queue, a7);
    v24 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = v24;

    v26 = -[OctagonFlags initWithQueue:flags:](objc_alloc(&OBJC_CLASS___OctagonFlags), "initWithQueue:flags:", v64, v62);
    currentFlags = v19->_currentFlags;
    v19->_currentFlags = v26;

    objc_storeWeak((id *)&v19->_stateEngine, obj);
    uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &stru_100286340));
    holdStateMachineOperation = v19->_holdStateMachineOperation;
    v19->_holdStateMachineOperation = (NSOperation *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    testHoldStates = v19->_testHoldStates;
    v19->_testHoldStates = (NSMutableSet *)v30;

    v19->_halted = 0;
    v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    mutableStateConditions = v19->_mutableStateConditions;
    v19->_mutableStateConditions = v32;

    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    v34 = (void *)objc_claimAutoreleasedReturnValue([v20 allKeys]);
    id v35 = [v34 countByEnumeratingWithState:&v69 objects:v74 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v70;
      do
      {
        for (i = 0LL; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v70 != v36) {
            objc_enumerationMutation(v34);
          }
          uint64_t v38 = *(void *)(*((void *)&v69 + 1) + 8LL * (void)i);
          v39 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine mutableStateConditions](v19, "mutableStateConditions"));
          [v40 setObject:v39 forKeyedSubscript:v38];
        }

        id v35 = [v34 countByEnumeratingWithState:&v69 objects:v74 count:16];
      }

      while (v35);
    }

    -[OctagonStateMachine setCurrentState:](v19, "setCurrentState:", @"not_started");
    uint64_t v41 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    stateMachineRequests = v19->_stateMachineRequests;
    v19->_stateMachineRequests = (NSMutableArray *)v41;

    uint64_t v43 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    stateMachineWatchers = v19->_stateMachineWatchers;
    v19->_stateMachineWatchers = (NSMutableArray *)v43;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v19->_allowPendingFlags = 1;
    uint64_t v45 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingFlags = v19->_pendingFlags;
    v19->_pendingFlags = (NSMutableDictionary *)v45;

    v47 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-pending-flag",  v61,  v57,  v58));
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_1000F1384;
    v66[3] = &unk_100291A38;
    objc_copyWeak(&v67, &location);
    v49 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:]( v47,  "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:",  v48,  100000000LL,  0LL,  1006LL,  v66);
    pendingFlagsScheduler = v19->_pendingFlagsScheduler;
    v19->_pendingFlagsScheduler = v49;

    v51 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"initialize",  v60));
    [v51 addDependency:v19->_holdStateMachineOperation];
    -[NSOperationQueue addOperation:](v19->_operationQueue, "addOperation:", v51);
    v52 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    paused = v19->_paused;
    v19->_paused = v52;

    uint64_t v54 = objc_claimAutoreleasedReturnValue(-[OctagonStateMachine createOperationToFinishAttempt:](v19, "createOperationToFinishAttempt:", v51));
    nextStateMachineCycleOperation = v19->_nextStateMachineCycleOperation;
    v19->_nextStateMachineCycleOperation = (CKKSResultOperation *)v54;

    -[NSOperationQueue addOperation:](v19->_operationQueue, "addOperation:", v19->_nextStateMachineCycleOperation);
    objc_destroyWeak(&v67);
    objc_destroyWeak(&location);
  }

  return v19;
}

- (NSDictionary)stateConditions
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_1000F0C08;
  v11 = sub_1000F0C18;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000F1334;
  v6[3] = &unk_1002916D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)pendingFlagsString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@","]);

  return v4;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
  id v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlagsString](self, "pendingFlagsString"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (pending: %@)",  v5));
  }

  else
  {
    v6 = &stru_100294B48;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<OctagonStateMachine(%@,%@,%@)>",  v7,  v8,  v6));

  return v9;
}

- (OctagonStateString)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  unint64_t v6 = (unint64_t)a3;
  uint64_t v7 = (void *)v6;
  if (v6 | (unint64_t)self->_currentState)
  {
    id v16 = (id)v6;
    unsigned __int8 v8 = objc_msgSend((id)v6, "isEqualToString:");
    uint64_t v7 = v16;
    if ((v8 & 1) == 0)
    {
      if (self->_currentState)
      {
        uint64_t v9 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine mutableStateConditions](self, "mutableStateConditions"));
        [v10 setObject:v9 forKeyedSubscript:self->_currentState];
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine allowableStates](self, "allowableStates"));
      unsigned __int8 v12 = [v11 containsObject:v16];

      if ((v12 & 1) == 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v15 handleFailureInMethod:a2, self, @"OctagonStateMachine.m", 182, @"state machine tried to enter unknown state %@", v16 object file lineNumber description];
      }

      objc_storeStrong((id *)&self->_currentState, a3);
      uint64_t v7 = v16;
      if (v16)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine mutableStateConditions](self, "mutableStateConditions"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v16]);
        [v14 fulfill];

        uint64_t v7 = v16;
      }
    }
  }
}

- (id)waitForState:(id)a3 wait:(unint64_t)a4
{
  unint64_t v6 = (OctagonStateString *)a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine stateConditions](self, "stateConditions"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
  id v9 = [v8 wait:a4];

  currentState = v6;
  if (v9) {
    currentState = self->_currentState;
  }
  v11 = currentState;

  return v11;
}

- (id)_onqueueNextStateMachineTransition
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[OctagonStateMachine halted](self, "halted"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
    unsigned __int8 v5 = [v4 isEqualToString:@"halted"];

    if ((v5 & 1) != 0) {
      return 0LL;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"halt",  @"halted"));
  }

  else
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine stateMachineRequests](self, "stateMachineRequests"));
    id v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned __int8 v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sourceStates]);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
          unsigned int v15 = [v13 containsObject:v14];

          if (v15)
          {
            uint64_t v16 = objc_claimAutoreleasedReturnValue([v12 _onqueueStart]);
            if (v16)
            {
              v19 = (void *)v16;
              id v20 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
              v21 = sub_10001253C((const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v20,  @"state"));
              uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);

              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
                *(_DWORD *)buf = 138412546;
                v29 = v12;
                __int16 v30 = 2112;
                v31 = v23;
                _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Running state machine request %@ (from %@)",  buf,  0x16u);
              }

              goto LABEL_17;
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine stateEngine](self, "stateEngine"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentFlags](self, "currentFlags"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 _onqueueNextStateMachineTransition:v17 flags:v18 pendingFlags:self]);

LABEL_17:
  }

  return v19;
}

- (void)_onqueueStartNextStateMachineOperation:(BOOL)a3
{
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
  if (!v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine testHoldStates](self, "testHoldStates"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
    unsigned int v9 = [v7 containsObject:v8];

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
      v11 = sub_10001253C((const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v10,  @"state"));
      unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
        *(_DWORD *)buf = 138412290;
        __int16 v30 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "In test hold for state %@; pausing",
          buf,
          0xCu);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine paused](self, "paused"));
      [v14 fulfill];
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[OctagonStateMachine _onqueueNextStateMachineTransition]( self,  "_onqueueNextStateMachineTransition"));
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
      uint64_t v16 = sub_10001253C((const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v15,  @"state"));
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412290;
          __int16 v30 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Beginning state transition attempt %@",  buf,  0xCu);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue( -[OctagonStateMachine createOperationToFinishAttempt:]( self,  "createOperationToFinishAttempt:",  v14));
        -[OctagonStateMachine setNextStateMachineCycleOperation:](self, "setNextStateMachineCycleOperation:", v19);

        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
        [v20 addOperation:v21];

        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine holdStateMachineOperation](self, "holdStateMachineOperation"));
        [v14 addNullableDependency:v22];

        [v14 setQualityOfService:25];
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
        [v23 addOperation:v14];

        if (a3) {
          goto LABEL_15;
        }
        __int128 v24 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
        -[OctagonStateMachine setPaused:](self, "setPaused:", v24);
      }

      else
      {
        if (v18)
        {
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentFlags](self, "currentFlags"));
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 contentsAsString]);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlagsString](self, "pendingFlagsString"));
          *(_DWORD *)buf = 138412802;
          __int16 v30 = v25;
          __int16 v31 = 2112;
          v32 = v27;
          __int16 v33 = 2112;
          v34 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "State machine rests (%@, f:[%@] p:[%@])",  buf,  0x20u);
        }

        __int128 v24 = (CKKSCondition *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine paused](self, "paused"));
        -[CKKSCondition fulfill](v24, "fulfill");
      }
    }

- (id)createOperationToFinishAttempt:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000F0EEC;
  v9[3] = &unk_100290FC8;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"octagon-state-follow-up",  v9));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine holdStateMachineOperation](self, "holdStateMachineOperation"));
  [v6 addNullableDependency:v7];

  [v6 addNullableDependency:v5];
  [v6 setQualityOfService:25];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

- (void)pokeStateMachine
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0EE4;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onqueuePokeStateMachine
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[OctagonStateMachine _onqueueStartNextStateMachineOperation:](self, "_onqueueStartNextStateMachineOperation:", 0LL);
}

- (void)handleFlag:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0ED8;
  block[3] = &unk_100290788;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)_onqueueHandleFlag:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentFlags](self, "currentFlags"));
  [v6 _onqueueSetFlag:v4];

  -[OctagonStateMachine _onqueuePokeStateMachine](self, "_onqueuePokeStateMachine");
}

- (void)handlePendingFlag:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0ECC;
  block[3] = &unk_100290788;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)_onqueueHandlePendingFlagLater:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000F0EC0;
  v8[3] = &unk_100290788;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_onqueueHandlePendingFlag:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 flag]);
  [v6 setObject:v4 forKeyedSubscript:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 afterOperation]);
  if (v8)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    unsigned __int8 v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    v14 = sub_1000F0D8C;
    unsigned int v15 = &unk_100291A38;
    objc_copyWeak(&v16, &location);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v12));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "afterOperation", v12, v13, v14, v15));
    [v9 addNullableDependency:v10];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
    [v11 addOperation:v9];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  -[OctagonStateMachine _onqueueRecheckConditions](self, "_onqueueRecheckConditions");
  -[OctagonStateMachine _onqueueSendAnyPendingFlags](self, "_onqueueSendAnyPendingFlags");
}

- (void)disablePendingFlags
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0D80;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)dumpPendingFlags
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1000F0C08;
  id v11 = sub_1000F0C18;
  id v12 = (id)0xAAAAAAAAAAAAAAAALL;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000F0C20;
  v6[3] = &unk_1002916D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)possiblePendingFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  return v3;
}

- (void)_onqueueRecheckConditions
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if (-[OctagonStateMachine allowPendingFlags](self, "allowPendingFlags"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
    id v7 = [v6 copy];

    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = 0LL;
      uint64_t v11 = *(void *)v50;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v50 != v11) {
            objc_enumerationMutation(v8);
          }
          v10 |= (unint64_t)[*(id *)(*((void *)&v49 + 1) + 8 * (void)i) conditions];
        }

        id v9 = [v8 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }

      while (v9);

      if (v10)
      {
        unsigned __int8 v13 = -[OctagonStateMachine conditionChecksInFlight](self, "conditionChecksInFlight");
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        char v14 = v10 & ~v13;
        if ((v14 & 1) != 0)
        {
          unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
          BOOL v16 = v15 == 0LL;

          if (v16)
          {
            uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
            [v41 handleFailureInMethod:a2 object:self file:@"OctagonStateMachine.m" lineNumber:419 description:@"Must have a lock state tracker to wait for unlock"];
          }

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
          unsigned int v18 = [v17 isLocked];

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
            id v20 = sub_10001253C((const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v19,  @"pending-flag"));
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Waiting for unlock", buf, 2u);
            }

            -[OctagonStateMachine setCurrentConditions:]( self,  "setCurrentConditions:",  -[OctagonStateMachine currentConditions](self, "currentConditions") & 0xFFFFFFFFFFFFFFFELL);
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472LL;
            v45[2] = sub_1000F0958;
            v45[3] = &unk_100291A38;
            objc_copyWeak(&v46, &location);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v45));
            -[OctagonStateMachine setCheckUnlockOperation:](self, "setCheckUnlockOperation:", v22);

            -[OctagonStateMachine setConditionChecksInFlight:]( self,  "setConditionChecksInFlight:",  -[OctagonStateMachine conditionChecksInFlight](self, "conditionChecksInFlight") | 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine checkUnlockOperation](self, "checkUnlockOperation"));
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 unlockDependency]);
            [v23 addNullableDependency:v25];

            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine checkUnlockOperation](self, "checkUnlockOperation"));
            [v26 addOperation:v27];

            objc_destroyWeak(&v46);
          }

          else
          {
            -[OctagonStateMachine setCurrentConditions:]( self,  "setCurrentConditions:",  -[OctagonStateMachine currentConditions](self, "currentConditions") | 1);
          }
        }

        if ((v14 & 2) != 0)
        {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine reachabilityTracker](self, "reachabilityTracker"));
          BOOL v29 = v28 == 0LL;

          if (v29)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
            [v42 handleFailureInMethod:a2 object:self file:@"OctagonStateMachine.m" lineNumber:447 description:@"Must have a network reachability tracker to use network reachability pending flags"];
          }

          __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine reachabilityTracker](self, "reachabilityTracker"));
          unsigned __int8 v31 = [v30 currentReachability];

          if ((v31 & 1) != 0)
          {
            -[OctagonStateMachine setCurrentConditions:]( self,  "setCurrentConditions:",  -[OctagonStateMachine currentConditions](self, "currentConditions") | 2);
          }

          else
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
            __int16 v33 = sub_10001253C((const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v32,  @"pending-flag"));
            v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);

            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Waiting for network reachability",  buf,  2u);
            }

            -[OctagonStateMachine setCurrentConditions:]( self,  "setCurrentConditions:",  -[OctagonStateMachine currentConditions](self, "currentConditions") & 0xFFFFFFFFFFFFFFFDLL);
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472LL;
            v43[2] = sub_1000F09DC;
            v43[3] = &unk_100291A38;
            objc_copyWeak(&v44, &location);
            id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v43));
            -[OctagonStateMachine setCheckReachabilityOperation:](self, "setCheckReachabilityOperation:", v35);

            -[OctagonStateMachine setConditionChecksInFlight:]( self,  "setConditionChecksInFlight:",  -[OctagonStateMachine conditionChecksInFlight](self, "conditionChecksInFlight") | 2);
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine checkReachabilityOperation](self, "checkReachabilityOperation"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine reachabilityTracker](self, "reachabilityTracker"));
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 reachabilityDependency]);
            [v36 addNullableDependency:v38];

            v39 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine checkReachabilityOperation](self, "checkReachabilityOperation"));
            [v39 addOperation:v40];

            objc_destroyWeak(&v44);
          }
        }

        objc_destroyWeak(&location);
      }
    }

    else
    {
    }
  }

- (void)_onqueueSendAnyPendingFlags
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[OctagonStateMachine allowPendingFlags](self, "allowPendingFlags"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
    id v6 = [v5 copy];

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (!v8)
    {

      goto LABEL_37;
    }

    id v9 = v8;
    uint64_t v10 = 0LL;
    char v45 = 0;
    uint64_t v11 = *(void *)v49;
    id obj = v7;
LABEL_4:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v49 != v11) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
      char v14 = (void *)objc_claimAutoreleasedReturnValue([v13 fireTime]);

      if (!v14)
      {
        BOOL v17 = 1;
        goto LABEL_16;
      }

      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 fireTime]);
      id v16 = [v15 compare:v47];

      BOOL v17 = v16 == (id)-1LL;
      if (v16 == (id)-1LL) {
        break;
      }
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v13 fireTime]);
      v19 = (void *)v18;
      if (v10)
      {
        uint64_t v20 = objc_claimAutoreleasedReturnValue([v10 earlierDate:v18]);

        uint64_t v10 = (void *)v20;
LABEL_14:

        goto LABEL_16;
      }

      BOOL v17 = 0;
      uint64_t v10 = (void *)v18;
LABEL_16:
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v13 afterOperation]);

      if (v24)
      {
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v13 afterOperation]);
        unsigned int v26 = [v25 isFinished];

        if (v26)
        {
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
          uint64_t v28 = sub_10001253C((const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v27,  @"pending-flag"));
          BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);

          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v13 flag]);
            unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue([v13 afterOperation]);
            *(_DWORD *)buf = 138412546;
            v53 = v30;
            __int16 v54 = 2112;
            v55 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Operation has ended for pending flag %@: %@",  buf,  0x16u);
          }
        }

        else
        {
          BOOL v17 = 0;
        }
      }

      if (![v13 conditions]) {
        goto LABEL_27;
      }
      unint64_t v32 = (unint64_t)[v13 conditions];
      id v33 = (id)(-[OctagonStateMachine currentConditions](self, "currentConditions") & v32);
      if (v33 == [v13 conditions])
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
        id v35 = sub_10001253C((const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v34,  @"pending-flag"));
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);

        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue([v13 flag]);
          *(_DWORD *)buf = 138412290;
          v53 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Conditions are right for %@", buf, 0xCu);
        }

LABEL_27:
        if (v17)
        {
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentFlags](self, "currentFlags"));
          v39 = (void *)objc_claimAutoreleasedReturnValue([v13 flag]);
          [v38 _onqueueSetFlag:v39];

          v40 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlags](self, "pendingFlags"));
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v13 flag]);
          [v40 setObject:0 forKeyedSubscript:v41];

          char v45 = 1;
        }
      }

      if (v9 == (id)++v12)
      {
        id v7 = obj;
        id v9 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (!v9)
        {

          if (v10)
          {
            [v10 timeIntervalSinceDate:v47];
            unint64_t v43 = (unint64_t)(v42 * 1000000000.0);
            id v44 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine pendingFlagsScheduler](self, "pendingFlagsScheduler"));
            [v44 triggerAt:v43];

            if ((v45 & 1) == 0)
            {
LABEL_38:

              return;
            }

- (void)testPauseStateMachineAfterEntering:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0918;
  block[3] = &unk_100290788;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)testReleaseStateMachinePause:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F080C;
  block[3] = &unk_100290788;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (BOOL)isPaused
{
  v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F07D0;
  v5[3] = &unk_1002916D0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)startOperation
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0748;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)haltOperation
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F06B0;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(v3, block);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
  [v4 waitUntilFinished];
}

- (id)timeoutErrorForState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine stateNumberMap](self, "stateNumberMap"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine unexpectedStateErrorDomain](self, "unexpectedStateErrorDomain"));
    id v8 = [v6 integerValue];
    char v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Current state: '%@'",  v4));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  v7,  v8,  v9));
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (void)handleExternalRequest:(id)a3 startTimeout:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F051C;
  block[3] = &unk_100291850;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)registerStateTransitionWatcher:(id)a3 startTimeout:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0388;
  block[3] = &unk_100291850;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)registerMultiStateArrivalWatcher:(id)a3 startTimeout:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0378;
  block[3] = &unk_100291850;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)_onqueueRegisterMultiStateArrivalWatcher:(id)a3 startTimeout:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 states]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
  unsigned int v9 = [v7 containsObject:v8];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine currentState](self, "currentState"));
    [v6 onqueueEnterState:v10];
  }

  else
  {
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine stateMachineWatchers](self, "stateMachineWatchers"));
    [v11 addObject:v6];

    -[OctagonStateMachine _onqueuePokeStateMachine](self, "_onqueuePokeStateMachine");
    if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      dispatch_time_t v12 = dispatch_time(0LL, a4);
      unsigned __int8 v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000F0304;
      block[3] = &unk_100290FC8;
      objc_copyWeak(&v16, &location);
      id v15 = v6;
      dispatch_after(v12, v13, block);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (void)doSimpleStateMachineRPC:(id)a3 op:(id)a4 sourceStates:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
  id v15 = sub_10001253C((const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v14,  @"state-rpc"));
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Beginning a '%@' rpc", buf, 0xCu);
  }

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
    [v18 recheck];
  }

  v19 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionRequest);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  id v21 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:]( v19,  "init:sourceStates:serialQueue:transitionOp:",  v10,  v12,  v20,  v11);

  -[OctagonStateMachine handleExternalRequest:startTimeout:]( self,  "handleExternalRequest:startTimeout:",  v21,  60000000000LL);
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-callback", v10));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000F01B8;
  v28[3] = &unk_100286368;
  objc_copyWeak(&v32, (id *)buf);
  id v23 = v10;
  id v29 = v23;
  id v24 = v11;
  id v30 = v24;
  id v25 = v13;
  id v31 = v25;
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  v22,  v28));

  [v26 addDependency:v24];
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
  [v27 addOperation:v26];

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);
}

- (void)setWatcherTimeout:(unint64_t)a3
{
}

- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  char v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"intial-transition-%@",  v13));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 initialState]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  v14,  v15));

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( -[OctagonStateMachine doWatchedStateMachineRPC:sourceStates:path:transitionOp:reply:]( self,  "doWatchedStateMachineRPC:sourceStates:path:transitionOp:reply:",  v13,  v12,  v11,  v16,  v10));
  return v17;
}

- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 transitionOp:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine name](self, "name"));
  uint64_t v18 = sub_10001253C((const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v17,  @"state-rpc"));
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v12;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Beginning a '%@' rpc", buf, 0xCu);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine lockStateTracker](self, "lockStateTracker"));
    [v21 recheck];
  }

  uint64_t v22 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionRequest);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine queue](self, "queue"));
  id v24 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:]( v22,  "init:sourceStates:serialQueue:transitionOp:",  v12,  v16,  v23,  v14);

  id v25 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionWatcher);
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"watcher-%@", v12));
  id v27 = -[OctagonStateTransitionWatcher initNamed:stateMachine:path:initialRequest:]( v25,  "initNamed:stateMachine:path:initialRequest:",  v26,  self,  v15,  v24);

  unint64_t v28 = -[OctagonStateMachine timeout](self, "timeout");
  if (v28) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = 240000000000LL;
  }
  -[OctagonStateMachine registerStateTransitionWatcher:startTimeout:]( self,  "registerStateTransitionWatcher:startTimeout:",  v27,  v29);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-callback", v12));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000F0010;
  v40[3] = &unk_100286390;
  v40[4] = self;
  id v41 = v12;
  id v42 = v27;
  id v43 = v13;
  id v31 = v13;
  id v32 = v27;
  id v33 = v12;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  v30,  v40));

  id v35 = (void *)objc_claimAutoreleasedReturnValue([v32 result]);
  [v34 addDependency:v35];

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateMachine operationQueue](self, "operationQueue"));
  [v36 addOperation:v34];

  unint64_t v37 = -[OctagonStateMachine timeout](self, "timeout");
  if (v37) {
    uint64_t v38 = v37;
  }
  else {
    uint64_t v38 = 120000000000LL;
  }
  -[OctagonStateMachine handleExternalRequest:startTimeout:](self, "handleExternalRequest:startTimeout:", v24, v38);

  return v34;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (CKKSCondition)paused
{
  return (CKKSCondition *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPaused:(id)a3
{
}

- (NSSet)allowableStates
{
  return (NSSet *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSDictionary)stateNumberMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)unexpectedStateErrorDomain
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 72LL, 1);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 80LL, 1);
}

- (OctagonStateMachineEngine)stateEngine
{
  return (OctagonStateMachineEngine *)objc_loadWeakRetained((id *)&self->_stateEngine);
}

- (void)setStateEngine:(id)a3
{
}

- (NSMutableDictionary)mutableStateConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setMutableStateConditions:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setName:(id)a3
{
}

- (OctagonFlags)currentFlags
{
  return (OctagonFlags *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setCurrentFlags:(id)a3
{
}

- (NSOperation)holdStateMachineOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setHoldStateMachineOperation:(id)a3
{
}

- (NSMutableSet)testHoldStates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setTestHoldStates:(id)a3
{
}

- (CKKSResultOperation)nextStateMachineCycleOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setNextStateMachineCycleOperation:(id)a3
{
}

- (NSMutableArray)stateMachineRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setStateMachineRequests:(id)a3
{
}

- (NSMutableArray)stateMachineWatchers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setStateMachineWatchers:(id)a3
{
}

- (BOOL)halted
{
  return self->_halted;
}

- (void)setHalted:(BOOL)a3
{
  self->_halted = a3;
}

- (BOOL)allowPendingFlags
{
  return self->_allowPendingFlags;
}

- (void)setAllowPendingFlags:(BOOL)a3
{
  self->_allowPendingFlags = a3;
}

- (NSMutableDictionary)pendingFlags
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setPendingFlags:(id)a3
{
}

- (CKKSNearFutureScheduler)pendingFlagsScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setPendingFlagsScheduler:(id)a3
{
}

- (unint64_t)conditionChecksInFlight
{
  return self->_conditionChecksInFlight;
}

- (void)setConditionChecksInFlight:(unint64_t)a3
{
  self->_conditionChecksInFlight = a3;
}

- (unint64_t)currentConditions
{
  return self->_currentConditions;
}

- (void)setCurrentConditions:(unint64_t)a3
{
  self->_currentConditions = a3;
}

- (NSOperation)checkUnlockOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setCheckUnlockOperation:(id)a3
{
}

- (NSOperation)checkReachabilityOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setCheckReachabilityOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end