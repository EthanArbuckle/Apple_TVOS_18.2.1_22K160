@interface KTStateMachine
- (BOOL)allowPendingFlags;
- (BOOL)halted;
- (BOOL)isPaused;
- (KTCondition)paused;
- (KTFlags)currentFlags;
- (KTLockStateTracker)lockStateTracker;
- (KTNearFutureScheduler)pendingFlagsScheduler;
- (KTReachabilityTracker)reachabilityTracker;
- (KTResultOperation)nextStateMachineCycleOperation;
- (KTStateMachine)initWithName:(id)a3 states:(id)a4 flags:(id)a5 initialState:(id)a6 queue:(id)a7 stateEngine:(id)a8 lockStateTracker:(id)a9 reachabilityTracker:(id)a10 idsConfigBag:(id)a11;
- (KTStateMachineEngine)stateEngine;
- (KTStateString)currentState;
- (NSDictionary)stateConditions;
- (NSMutableArray)stateMachineRequests;
- (NSMutableArray)stateMachineWatchers;
- (NSMutableDictionary)mutableStateConditions;
- (NSMutableDictionary)pendingFlags;
- (NSMutableSet)testHoldStates;
- (NSOperation)checkIDSDisableOperation;
- (NSOperation)checkReachabilityOperation;
- (NSOperation)checkUnlockOperation;
- (NSOperation)holdStateMachineOperation;
- (NSOperationQueue)operationQueue;
- (NSSet)allowableStates;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (TransparencyIDSConfigBag)idsConfigBag;
- (id)_onqueueNextStateMachineTransition;
- (id)createOperationToFinishAttempt:(id)a3;
- (id)description;
- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 reply:(id)a6;
- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 transitionOp:(id)a6 reply:(id)a7;
- (id)dumpCurrentFlags;
- (id)dumpPendingFlags;
- (id)pendingFlagsString;
- (id)possiblePendingFlags;
- (id)waitForState:(id)a3 wait:(unint64_t)a4;
- (unint64_t)conditionChecksInFlight;
- (unint64_t)currentConditions;
- (unint64_t)timeout;
- (void)_onqueueCancelPendingFlag:(id)a3;
- (void)_onqueueHandleFlag:(id)a3;
- (void)_onqueueHandlePendingFlag:(id)a3;
- (void)_onqueueHandlePendingFlagLater:(id)a3;
- (void)_onqueuePokeStateMachine;
- (void)_onqueueRecheckConditions;
- (void)_onqueueRegisterMultiStateArrivalWatcher:(id)a3;
- (void)_onqueueSendAnyPendingFlags;
- (void)_onqueueStartNextStateMachineOperation:(BOOL)a3;
- (void)cancelPendingFlag:(id)a3;
- (void)disablePendingFlags;
- (void)doSimpleStateMachineRPC:(id)a3 op:(id)a4 sourceStates:(id)a5 reply:(id)a6;
- (void)haltOperation;
- (void)handleExternalRequest:(id)a3;
- (void)handleFlag:(id)a3;
- (void)handlePendingFlag:(id)a3;
- (void)pokeStateMachine;
- (void)registerMultiStateArrivalWatcher:(id)a3;
- (void)registerStateTransitionWatcher:(id)a3;
- (void)setAllowPendingFlags:(BOOL)a3;
- (void)setCheckIDSDisableOperation:(id)a3;
- (void)setCheckReachabilityOperation:(id)a3;
- (void)setCheckUnlockOperation:(id)a3;
- (void)setConditionChecksInFlight:(unint64_t)a3;
- (void)setCurrentConditions:(unint64_t)a3;
- (void)setCurrentFlags:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setHalted:(BOOL)a3;
- (void)setHoldStateMachineOperation:(id)a3;
- (void)setIdsConfigBag:(id)a3;
- (void)setMutableStateConditions:(id)a3;
- (void)setName:(id)a3;
- (void)setNextStateMachineCycleOperation:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPaused:(id)a3;
- (void)setPendingFlags:(id)a3;
- (void)setPendingFlagsScheduler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateEngine:(id)a3;
- (void)setStateMachineRequests:(id)a3;
- (void)setStateMachineWatchers:(id)a3;
- (void)setTestHoldStates:(id)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)startOperation;
- (void)testPauseStateMachineAfterEntering:(id)a3;
- (void)testReleaseStateMachinePause:(id)a3;
- (void)waitToResting;
@end

@implementation KTStateMachine

- (KTStateMachine)initWithName:(id)a3 states:(id)a4 flags:(id)a5 initialState:(id)a6 queue:(id)a7 stateEngine:(id)a8 lockStateTracker:(id)a9 reachabilityTracker:(id)a10 idsConfigBag:(id)a11
{
  id v57 = a3;
  id v18 = a4;
  id v58 = a5;
  id v56 = a6;
  id v19 = a7;
  id v20 = a8;
  id v53 = a9;
  id v54 = a10;
  id v55 = a11;
  v64.receiver = self;
  v64.super_class = (Class)&OBJC_CLASS___KTStateMachine;
  v21 = -[KTStateMachine init](&v64, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_name, a3);
    objc_storeStrong((id *)&v22->_lockStateTracker, a9);
    objc_storeStrong((id *)&v22->_reachabilityTracker, a10);
    v22->_conditionChecksInFlight = 0LL;
    v22->_currentConditions = 0LL;
    v65[0] = @"not_started";
    v65[1] = @"halted";
    v65[2] = @"KTDisabled";
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v65, 3LL));
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v18 setByAddingObjectsFromArray:v23]);
    allowableStates = v22->_allowableStates;
    v22->_allowableStates = (NSSet *)v24;

    objc_storeStrong((id *)&v22->_queue, a7);
    v26 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v22->_operationQueue;
    v22->_operationQueue = v26;

    v28 = -[KTFlags initWithQueue:flags:](objc_alloc(&OBJC_CLASS___KTFlags), "initWithQueue:flags:", v19, v58);
    currentFlags = v22->_currentFlags;
    v22->_currentFlags = v28;

    objc_storeWeak((id *)&v22->_stateEngine, v20);
    uint64_t v30 = objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &stru_100284408));
    holdStateMachineOperation = v22->_holdStateMachineOperation;
    v22->_holdStateMachineOperation = (NSOperation *)v30;

    uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    testHoldStates = v22->_testHoldStates;
    v22->_testHoldStates = (NSMutableSet *)v32;

    v22->_halted = 0;
    v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    mutableStateConditions = v22->_mutableStateConditions;
    v22->_mutableStateConditions = v34;

    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_100151568;
    v62[3] = &unk_100284430;
    v36 = v22;
    v63 = v36;
    [v18 enumerateObjectsUsingBlock:v62];
    -[KTStateMachine setCurrentState:](v36, "setCurrentState:", @"not_started");
    uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    stateMachineRequests = v36->_stateMachineRequests;
    v36->_stateMachineRequests = (NSMutableArray *)v37;

    uint64_t v39 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    stateMachineWatchers = v36->_stateMachineWatchers;
    v36->_stateMachineWatchers = (NSMutableArray *)v39;

    objc_storeStrong((id *)&v36->_idsConfigBag, a11);
    id location = 0LL;
    objc_initWeak(&location, v36);
    v36->_allowPendingFlags = 1;
    uint64_t v41 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingFlags = v36->_pendingFlags;
    v36->_pendingFlags = (NSMutableDictionary *)v41;

    v43 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-pending-flag",  v57));
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_1001515D8;
    v59[3] = &unk_100276D20;
    objc_copyWeak(&v60, &location);
    v45 = -[KTNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:]( v43,  "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:",  v44,  100000000LL,  0LL,  1LL,  v59);
    pendingFlagsScheduler = v36->_pendingFlagsScheduler;
    v36->_pendingFlagsScheduler = v45;

    v47 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:entering:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:entering:",  @"initialize",  v56));
    [v47 addDependency:v22->_holdStateMachineOperation];
    -[NSOperationQueue addOperation:](v22->_operationQueue, "addOperation:", v47);
    v48 = objc_alloc_init(&OBJC_CLASS___KTCondition);
    paused = v36->_paused;
    v36->_paused = v48;

    uint64_t v50 = objc_claimAutoreleasedReturnValue(-[KTStateMachine createOperationToFinishAttempt:](v36, "createOperationToFinishAttempt:", v47));
    nextStateMachineCycleOperation = v36->_nextStateMachineCycleOperation;
    v36 = (KTStateMachine *)((char *)v36 + 128);
    v36->super.isa = (Class)v50;

    -[NSOperationQueue addOperation:](v22->_operationQueue, "addOperation:", v36->super.isa);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);
  }

  return v22;
}

- (NSDictionary)stateConditions
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_10015174C;
  v11 = sub_10015175C;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100151764;
  v6[3] = &unk_100284458;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)pendingFlagsString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@","]);

  return v4;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
  id v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlagsString](self, "pendingFlagsString"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (pending: %@)",  v5));
  }

  else
  {
    v6 = &stru_10028E390;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine name](self, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<KTStateMachine(%@,%@,%@)>",  v7,  v8,  v6));

  return v9;
}

- (KTStateString)currentState
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
        uint64_t v9 = objc_alloc_init(&OBJC_CLASS___KTCondition);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine mutableStateConditions](self, "mutableStateConditions"));
        [v10 setObject:v9 forKeyedSubscript:self->_currentState];
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine allowableStates](self, "allowableStates"));
      unsigned __int8 v12 = [v11 containsObject:v16];

      if ((v12 & 1) == 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v15 handleFailureInMethod:a2, self, @"KTStateMachine.m", 172, @"state machine tried to enter unknown state %@", v16 object file lineNumber description];
      }

      objc_storeStrong((id *)&self->_currentState, a3);
      uint64_t v7 = v16;
      if (v16)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine mutableStateConditions](self, "mutableStateConditions"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v16]);
        [v14 fulfill];

        uint64_t v7 = v16;
      }
    }
  }
}

- (id)waitForState:(id)a3 wait:(unint64_t)a4
{
  unint64_t v6 = (KTStateString *)a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine stateConditions](self, "stateConditions"));
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
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[KTStateMachine halted](self, "halted"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
    unsigned __int8 v5 = [v4 isEqualToString:@"halted"];

    if ((v5 & 1) != 0) {
      return 0LL;
    }
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:entering:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:entering:",  @"halt",  @"halted"));
  }

  else
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine stateMachineRequests](self, "stateMachineRequests", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned __int8 v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sourceStates]);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
          unsigned int v15 = [v13 containsObject:v14];

          if (v15)
          {
            uint64_t v16 = objc_claimAutoreleasedReturnValue([v12 _onqueueStart]);
            if (v16)
            {
              id v19 = (void *)v16;
              if (qword_1002EEA08 != -1) {
                dispatch_once(&qword_1002EEA08, &stru_100284478);
              }
              id v20 = (void *)qword_1002EEA10;
              if (os_log_type_enabled((os_log_t)qword_1002EEA10, OS_LOG_TYPE_DEFAULT))
              {
                v21 = v20;
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
                *(_DWORD *)buf = 138543618;
                v28 = v12;
                __int16 v29 = 2114;
                uint64_t v30 = v22;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Running state machine request %{public}@ (from %{public}@)",  buf,  0x16u);
              }

              goto LABEL_18;
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine stateEngine](self, "stateEngine"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentFlags](self, "currentFlags"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 _onqueueNextStateMachineTransition:v17 flags:v18 pendingFlags:self]);

LABEL_18:
  }

  return v19;
}

- (void)_onqueueStartNextStateMachineOperation:(BOOL)a3
{
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
  if (!v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine testHoldStates](self, "testHoldStates"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
    unsigned int v9 = [v7 containsObject:v8];

    if (v9)
    {
      if (qword_1002EEA08 != -1) {
        dispatch_once(&qword_1002EEA08, &stru_100284498);
      }
      uint64_t v10 = (void *)qword_1002EEA10;
      if (os_log_type_enabled((os_log_t)qword_1002EEA10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
        int v27 = 138412290;
        v28 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "In test hold for state %@; pausing",
          (uint8_t *)&v27,
          0xCu);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine paused](self, "paused"));
      [v13 fulfill];
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine _onqueueNextStateMachineTransition](self, "_onqueueNextStateMachineTransition"));
      if (v13)
      {
        if (qword_1002EEA08 != -1) {
          dispatch_once(&qword_1002EEA08, &stru_1002844B8);
        }
        v14 = (os_log_s *)qword_1002EEA10;
        if (os_log_type_enabled((os_log_t)qword_1002EEA10, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138543362;
          v28 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Beginning state transition attempt %{public}@",  (uint8_t *)&v27,  0xCu);
        }

        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine createOperationToFinishAttempt:](self, "createOperationToFinishAttempt:", v13));
        -[KTStateMachine setNextStateMachineCycleOperation:](self, "setNextStateMachineCycleOperation:", v15);

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
        [v16 addOperation:v17];

        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine holdStateMachineOperation](self, "holdStateMachineOperation"));
        [v13 addNullableDependency:v18];

        [v13 setQualityOfService:25];
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
        [v19 addOperation:v13];

        if (a3) {
          goto LABEL_21;
        }
        id v20 = objc_alloc_init(&OBJC_CLASS___KTCondition);
        -[KTStateMachine setPaused:](self, "setPaused:", v20);
      }

      else
      {
        if (qword_1002EEA08 != -1) {
          dispatch_once(&qword_1002EEA08, &stru_1002844D8);
        }
        v21 = (void *)qword_1002EEA10;
        if (os_log_type_enabled((os_log_t)qword_1002EEA10, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v21;
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentFlags](self, "currentFlags"));
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 contentsAsString]);
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlagsString](self, "pendingFlagsString"));
          int v27 = 138543874;
          v28 = v23;
          __int16 v29 = 2114;
          uint64_t v30 = v25;
          __int16 v31 = 2114;
          uint64_t v32 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "State machine rests (%{public}@, f:[%{public}@] p:[%{public}@])",  (uint8_t *)&v27,  0x20u);
        }

        id v20 = (KTCondition *)objc_claimAutoreleasedReturnValue(-[KTStateMachine paused](self, "paused"));
        -[KTCondition fulfill](v20, "fulfill");
      }
    }

- (id)createOperationToFinishAttempt:(id)a3
{
  id v4 = a3;
  id location = 0LL;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100152344;
  v9[3] = &unk_100284540;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[KTResultOperation named:withBlock:]( &OBJC_CLASS___KTResultOperation,  "named:withBlock:",  @"KT-state-follow-up",  v9));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine holdStateMachineOperation](self, "holdStateMachineOperation"));
  [v6 addNullableDependency:v7];

  [v6 addNullableDependency:v5];
  [v6 setQualityOfService:25];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

- (void)pokeStateMachine
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100152868;
  block[3] = &unk_100276740;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onqueuePokeStateMachine
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[KTStateMachine _onqueueStartNextStateMachineOperation:](self, "_onqueueStartNextStateMachineOperation:", 0LL);
}

- (void)handleFlag:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100152940;
  block[3] = &unk_1002777A0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)_onqueueHandleFlag:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentFlags](self, "currentFlags"));
  [v6 _onqueueSetFlag:v4];

  -[KTStateMachine _onqueuePokeStateMachine](self, "_onqueuePokeStateMachine");
}

- (void)handlePendingFlag:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100152A4C;
  block[3] = &unk_1002777A0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)_onqueueHandlePendingFlagLater:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100152B08;
  v8[3] = &unk_1002777A0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_onqueueCancelPendingFlag:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
  [v6 setObject:0 forKeyedSubscript:v4];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentFlags](self, "currentFlags"));
  [v7 _onqueueRemoveFlag:v4];
}

- (void)cancelPendingFlag:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100152C38;
  v7[3] = &unk_1002777A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_onqueueHandlePendingFlag:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 flag]);
  [v6 setObject:v4 forKeyedSubscript:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 afterOperation]);
  if (v8)
  {
    id location = 0LL;
    objc_initWeak(&location, self);
    unsigned __int8 v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    v14 = sub_100152DD8;
    unsigned int v15 = &unk_100276D20;
    objc_copyWeak(&v16, &location);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v12));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "afterOperation", v12, v13, v14, v15));
    [v9 addNullableDependency:v10];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
    [v11 addOperation:v9];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  -[KTStateMachine _onqueueRecheckConditions](self, "_onqueueRecheckConditions");
  -[KTStateMachine _onqueueSendAnyPendingFlags](self, "_onqueueSendAnyPendingFlags");
}

- (void)disablePendingFlags
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100152F88;
  block[3] = &unk_100276740;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)dumpPendingFlags
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10015174C;
  id v11 = sub_10015175C;
  id v12 = 0LL;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10015308C;
  v6[3] = &unk_100279700;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)dumpCurrentFlags
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10015174C;
  id v11 = sub_10015175C;
  id v12 = 0LL;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001532E4;
  v6[3] = &unk_100279700;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)possiblePendingFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  return v3;
}

- (void)_onqueueRecheckConditions
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if (-[KTStateMachine allowPendingFlags](self, "allowPendingFlags"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](self, "pendingFlags"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
    id v7 = [v6 copy];

    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = 0LL;
      uint64_t v11 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          v10 |= (unint64_t)[*(id *)(*((void *)&v48 + 1) + 8 * (void)i) conditions];
        }

        id v9 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }

      while (v9);

      if (v10)
      {
        unsigned __int8 v13 = -[KTStateMachine conditionChecksInFlight](self, "conditionChecksInFlight");
        id location = 0LL;
        objc_initWeak(&location, self);
        char v14 = v10 & ~v13;
        if ((v14 & 1) != 0)
        {
          unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));
          BOOL v16 = v15 == 0LL;

          if (v16)
          {
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
            [v37 handleFailureInMethod:a2 object:self file:@"KTStateMachine.m" lineNumber:438 description:@"Must have a lock state tracker to wait for unlock"];
          }

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));
          unsigned int v18 = [v17 isLocked];

          if (v18)
          {
            if (qword_1002EEA08 != -1) {
              dispatch_once(&qword_1002EEA08, &stru_100284580);
            }
            id v19 = (os_log_s *)qword_1002EEA10;
            if (os_log_type_enabled((os_log_t)qword_1002EEA10, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Waiting for unlock", buf, 2u);
            }

            -[KTStateMachine setCurrentConditions:]( self,  "setCurrentConditions:",  -[KTStateMachine currentConditions](self, "currentConditions") & 0xFFFFFFFFFFFFFFFELL);
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472LL;
            v44[2] = sub_100153A64;
            v44[3] = &unk_100276D20;
            objc_copyWeak(&v45, &location);
            id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v44));
            -[KTStateMachine setCheckUnlockOperation:](self, "setCheckUnlockOperation:", v20);

            -[KTStateMachine setConditionChecksInFlight:]( self,  "setConditionChecksInFlight:",  -[KTStateMachine conditionChecksInFlight](self, "conditionChecksInFlight") | 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine checkUnlockOperation](self, "checkUnlockOperation"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 unlockDependency]);
            [v21 addNullableDependency:v23];

            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine checkUnlockOperation](self, "checkUnlockOperation"));
            [v24 addOperation:v25];

            objc_destroyWeak(&v45);
          }

          else
          {
            -[KTStateMachine setCurrentConditions:]( self,  "setCurrentConditions:",  -[KTStateMachine currentConditions](self, "currentConditions") | 1);
          }
        }

        if ((v14 & 2) != 0)
        {
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine reachabilityTracker](self, "reachabilityTracker"));
          BOOL v27 = v26 == 0LL;

          if (v27)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
            [v38 handleFailureInMethod:a2 object:self file:@"KTStateMachine.m" lineNumber:468 description:@"Must have a network reachability tracker to use network reachability pending flags"];
          }

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine reachabilityTracker](self, "reachabilityTracker"));
          unsigned __int8 v29 = [v28 currentReachability];

          if ((v29 & 1) != 0)
          {
            -[KTStateMachine setCurrentConditions:]( self,  "setCurrentConditions:",  -[KTStateMachine currentConditions](self, "currentConditions") | 2);
          }

          else
          {
            if (qword_1002EEA08 != -1) {
              dispatch_once(&qword_1002EEA08, &stru_1002845C0);
            }
            uint64_t v30 = (os_log_s *)qword_1002EEA10;
            if (os_log_type_enabled((os_log_t)qword_1002EEA10, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Waiting for network reachability",  buf,  2u);
            }

            -[KTStateMachine setCurrentConditions:]( self,  "setCurrentConditions:",  -[KTStateMachine currentConditions](self, "currentConditions") & 0xFFFFFFFFFFFFFFFDLL);
            uint64_t v39 = _NSConcreteStackBlock;
            uint64_t v40 = 3221225472LL;
            uint64_t v41 = sub_100153BFC;
            v42 = &unk_100276D20;
            objc_copyWeak(&v43, &location);
            __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v39));
            -[KTStateMachine setCheckReachabilityOperation:]( self,  "setCheckReachabilityOperation:",  v31,  v39,  v40,  v41,  v42);

            -[KTStateMachine setConditionChecksInFlight:]( self,  "setConditionChecksInFlight:",  -[KTStateMachine conditionChecksInFlight](self, "conditionChecksInFlight") | 2);
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine checkReachabilityOperation](self, "checkReachabilityOperation"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine reachabilityTracker](self, "reachabilityTracker"));
            v34 = (void *)objc_claimAutoreleasedReturnValue([v33 reachabilityDependency]);
            [v32 addNullableDependency:v34];

            v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine checkReachabilityOperation](self, "checkReachabilityOperation"));
            [v35 addOperation:v36];

            objc_destroyWeak(&v43);
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
  v2 = self;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[KTStateMachine allowPendingFlags](v2, "allowPendingFlags"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine pendingFlags](v2, "pendingFlags"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
    id v6 = [v5 copy];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v8 = v6;
    id v51 = [v8 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (!v51)
    {

      goto LABEL_41;
    }

    uint64_t v10 = 0LL;
    char v50 = 0;
    uint64_t v11 = *(void *)v53;
    *(void *)&__int128 v9 = 138543618LL;
    __int128 v48 = v9;
LABEL_4:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v53 != v11) {
        objc_enumerationMutation(v8);
      }
      unsigned __int8 v13 = *(void **)(*((void *)&v52 + 1) + 8 * v12);
      char v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fireTime", v48));

      if (!v14) {
        goto LABEL_15;
      }
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 fireTime]);
      id v16 = [v15 compare:v7];

      if (v16 == (id)-1LL) {
        break;
      }
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 fireTime]);
      unsigned int v18 = (void *)v17;
      if (v10)
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v10 earlierDate:v17]);

        int v20 = 0;
        uint64_t v10 = (void *)v19;
      }

      else
      {
        int v20 = 0;
        uint64_t v10 = (void *)v17;
      }

- (void)testPauseStateMachineAfterEntering:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001543EC;
  block[3] = &unk_1002777A0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)testReleaseStateMachinePause:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001544C4;
  block[3] = &unk_1002777A0;
  id v8 = v4;
  __int128 v9 = self;
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
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10015469C;
  v5[3] = &unk_100284458;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)waitToResting
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  do
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
    [v3 waitUntilFinished];

    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1001547C0;
    v5[3] = &unk_100284458;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(v4, v5);
  }

  while (!*((_BYTE *)v7 + 24));
  _Block_object_dispose(&v6, 8);
}

- (void)startOperation
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154868;
  block[3] = &unk_100276740;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)haltOperation
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154974;
  block[3] = &unk_100276740;
  void block[4] = self;
  dispatch_sync(v3, block);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine nextStateMachineCycleOperation](self, "nextStateMachineCycleOperation"));
  [v4 waitUntilFinished];
}

- (void)handleExternalRequest:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154AA4;
  block[3] = &unk_1002777A0;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)registerStateTransitionWatcher:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154B78;
  block[3] = &unk_1002777A0;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)registerMultiStateArrivalWatcher:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100154C4C;
  block[3] = &unk_1002777A0;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)_onqueueRegisterMultiStateArrivalWatcher:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 states]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
  unsigned int v7 = [v5 containsObject:v6];

  if (v7)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[KTStateMachine currentState](self, "currentState"));
    [v4 onqueueEnterState:v9];
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine stateMachineWatchers](self, "stateMachineWatchers"));
    [v8 addObject:v4];

    -[KTStateMachine _onqueuePokeStateMachine](self, "_onqueuePokeStateMachine");
  }

- (void)doSimpleStateMachineRPC:(id)a3 op:(id)a4 sourceStates:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_1002EEA08 != -1) {
    dispatch_once(&qword_1002EEA08, &stru_100284680);
  }
  char v14 = (os_log_s *)qword_1002EEA10;
  if (os_log_type_enabled((os_log_t)qword_1002EEA10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Beginning a '%{public}@' rpc", buf, 0xCu);
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));
    [v16 recheck];
  }

  uint64_t v17 = objc_alloc(&OBJC_CLASS___KTStateTransitionRequest);
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  id v19 = -[KTStateTransitionRequest init:sourceStates:serialQueue:timeout:transitionOp:]( v17,  "init:sourceStates:serialQueue:timeout:transitionOp:",  v10,  v12,  v18,  30000000000LL,  v11);

  -[KTStateMachine handleExternalRequest:](self, "handleExternalRequest:", v19);
  int v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-callback", v10));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100154FD4;
  v26[3] = &unk_100279880;
  id v27 = v10;
  id v28 = v11;
  id v29 = v13;
  id v21 = v13;
  id v22 = v11;
  id v23 = v10;
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[KTResultOperation named:withBlock:](&OBJC_CLASS___KTResultOperation, "named:withBlock:", v20, v26));

  [v24 addDependency:v22];
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
  [v25 addOperation:v24];
}

- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  char v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"intial-transition-%@",  v13));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 initialState]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:entering:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:entering:",  v14,  v15));

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[KTStateMachine doWatchedStateMachineRPC:sourceStates:path:transitionOp:reply:]( self,  "doWatchedStateMachineRPC:sourceStates:path:transitionOp:reply:",  v13,  v12,  v11,  v16,  v10));
  return v17;
}

- (id)doWatchedStateMachineRPC:(id)a3 sourceStates:(id)a4 path:(id)a5 transitionOp:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = v14;
  if (qword_1002EEA08 != -1) {
    dispatch_once(&qword_1002EEA08, &stru_1002846C0);
  }
  unsigned int v18 = (os_log_s *)qword_1002EEA10;
  if (os_log_type_enabled((os_log_t)qword_1002EEA10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Beginning a '%{public}@' rpc", buf, 0xCu);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));

  if (v19)
  {
    int v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine lockStateTracker](self, "lockStateTracker"));
    [v20 recheck];
  }

  id v21 = objc_alloc(&OBJC_CLASS___KTStateTransitionRequest);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  id v23 = -[KTStateTransitionRequest init:sourceStates:serialQueue:timeout:transitionOp:]( v21,  "init:sourceStates:serialQueue:timeout:transitionOp:",  v12,  v13,  v22,  30000000000LL,  v15);

  __int128 v24 = objc_alloc(&OBJC_CLASS___KTStateTransitionWatcher);
  uint64_t v40 = v13;
  __int128 v25 = v15;
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"watcher-%@", v12));
  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine queue](self, "queue"));
  id v28 = -[KTStateTransitionWatcher initNamed:serialQueue:path:initialRequest:]( v24,  "initNamed:serialQueue:path:initialRequest:",  v26,  v27,  v17,  v23);

  unint64_t v29 = -[KTStateMachine timeout](self, "timeout");
  if (v29) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = 120000000000LL;
  }
  id v31 = [v28 timeout:v30];
  -[KTStateMachine registerStateTransitionWatcher:](self, "registerStateTransitionWatcher:", v28);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-callback", v12));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1001555B8;
  v41[3] = &unk_100284708;
  id v42 = v12;
  id v43 = v28;
  id v44 = v16;
  id v33 = v16;
  id v34 = v28;
  id v35 = v12;
  id v36 = (void *)objc_claimAutoreleasedReturnValue( +[KTResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___KTResultOperation,  "named:withBlockTakingSelf:",  v32,  v41));

  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v34 result]);
  [v36 addDependency:v37];

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateMachine operationQueue](self, "operationQueue"));
  [v38 addOperation:v36];

  -[KTStateMachine handleExternalRequest:](self, "handleExternalRequest:", v23);
  return v36;
}

- (KTCondition)paused
{
  return (KTCondition *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPaused:(id)a3
{
}

- (NSSet)allowableStates
{
  return (NSSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (KTLockStateTracker)lockStateTracker
{
  return (KTLockStateTracker *)objc_getProperty(self, a2, 48LL, 1);
}

- (KTReachabilityTracker)reachabilityTracker
{
  return (KTReachabilityTracker *)objc_getProperty(self, a2, 56LL, 1);
}

- (KTStateMachineEngine)stateEngine
{
  return (KTStateMachineEngine *)objc_loadWeakRetained((id *)&self->_stateEngine);
}

- (void)setStateEngine:(id)a3
{
}

- (NSMutableDictionary)mutableStateConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setMutableStateConditions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setName:(id)a3
{
}

- (KTFlags)currentFlags
{
  return (KTFlags *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setCurrentFlags:(id)a3
{
}

- (NSOperation)holdStateMachineOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setHoldStateMachineOperation:(id)a3
{
}

- (NSMutableSet)testHoldStates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setTestHoldStates:(id)a3
{
}

- (KTResultOperation)nextStateMachineCycleOperation
{
  return (KTResultOperation *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setNextStateMachineCycleOperation:(id)a3
{
}

- (NSMutableArray)stateMachineRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setStateMachineRequests:(id)a3
{
}

- (NSMutableArray)stateMachineWatchers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 144LL, 1);
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
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setPendingFlags:(id)a3
{
}

- (KTNearFutureScheduler)pendingFlagsScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 160LL, 1);
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
  return (NSOperation *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setCheckUnlockOperation:(id)a3
{
}

- (NSOperation)checkReachabilityOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setCheckReachabilityOperation:(id)a3
{
}

- (NSOperation)checkIDSDisableOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setCheckIDSDisableOperation:(id)a3
{
}

- (TransparencyIDSConfigBag)idsConfigBag
{
  return (TransparencyIDSConfigBag *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setIdsConfigBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end