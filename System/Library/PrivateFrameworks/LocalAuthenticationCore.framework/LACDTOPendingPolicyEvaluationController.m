@interface LACDTOPendingPolicyEvaluationController
- (BOOL)_canFinishPendingEvaluationsForRatchetState:(id)a3;
- (BOOL)_hasPendingEvaluationRecordForRequest:(id)a3;
- (BOOL)_isRatchetRestartRequest:(id)a3;
- (BOOL)_shouldPrunePendingEvaluation:(id)a3 uuid:(id)a4;
- (LACDTONotificationManager)notificationManager;
- (LACDTOPendingPolicyEvaluationController)initWithRatchetStateProvider:(id)a3 ratchetHandler:(id)a4 device:(id)a5 evaluationIdentifierFactory:(id)a6 persistentStore:(id)a7 workQueue:(id)a8;
- (id)_coolOffStartedTimestampForIdentifier:(id)a3 currentState:(id)a4;
- (void)_addPendingEvaluationRecord:(id)a3 currentState:(id)a4;
- (void)_addPendingEvaluationRecordForRequest:(id)a3 currentState:(id)a4;
- (void)_cancelPreviousNotificationForPendingEvaluationRecord:(id)a3 scheduledOnly:(BOOL)a4;
- (void)_cancelPreviousNotificationForRatchetRestartWithRatchetState:(id)a3;
- (void)_checkIsRatchetStateIn:(id)a3 completion:(id)a4;
- (void)_checkShouldAddPendingEvaluationRecordForRequest:(id)a3 completion:(id)a4;
- (void)_checkShouldKeepPendingEvaluationRecordForResult:(id)a3 completion:(id)a4;
- (void)_forEachObserver:(id)a3;
- (void)_handleRatchetStateChanged:(id)a3;
- (void)_handleSwitchToCoolOffState:(id)a3;
- (void)_handleSwitchToFinalState:(id)a3;
- (void)_loadPendingEvaluations;
- (void)_postNotificationForRatchetRestartIfNeeded;
- (void)_pruneInvalidatedEvaluations;
- (void)_prunePendingEvaluationsWithUUID:(id)a3;
- (void)_registerNotificationObservers;
- (void)_removePendingEvaluationRecordForRequest:(id)a3 completion:(id)a4;
- (void)_removePendingEvaluationRecordWithIdentifier:(id)a3 completion:(id)a4;
- (void)_rescheduleNotifications;
- (void)_resetRatchetWithCompletion:(id)a3;
- (void)_restartRatchetForInvalidatedEvaluations;
- (void)_scheduleNotificationForPendingEvaluationRecord:(id)a3 after:(double)a4 validity:(double)a5;
- (void)_scheduleNotificationForRatchetRestart;
- (void)_updatePendingEvaluationsWithBlock:(id)a3;
- (void)_updatePendingEvaluationsWithUpdateBlock:(id)a3 observerFilter:(id)a4;
- (void)addObserver:(id)a3;
- (void)cancelPendingEvaluationForClient:(id)a3 ratchetIdentifier:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)handleEvent:(id)a3 sender:(id)a4;
- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4;
- (void)notificationManager:(id)a3 didReceiveUserAction:(id)a4 completionHandler:(id)a5;
- (void)policyController:(id)a3 didFinishPolicyEvaluation:(id)a4 result:(id)a5;
- (void)policyController:(id)a3 willStartPolicyEvaluation:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)startController;
@end

@implementation LACDTOPendingPolicyEvaluationController

- (LACDTOPendingPolicyEvaluationController)initWithRatchetStateProvider:(id)a3 ratchetHandler:(id)a4 device:(id)a5 evaluationIdentifierFactory:(id)a6 persistentStore:(id)a7 workQueue:(id)a8
{
  id v28 = a3;
  id v27 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___LACDTOPendingPolicyEvaluationController;
  v19 = -[LACDTOPendingPolicyEvaluationController init](&v29, sel_init);
  if (v19)
  {
    v20 = -[LACDTONotificationManager initWithReplyQueue:]( objc_alloc(&OBJC_CLASS___LACDTONotificationManager),  "initWithReplyQueue:",  v18,  v27,  v28);
    notificationManager = v19->_notificationManager;
    v19->_notificationManager = v20;

    -[LACDTONotificationManager setDelegate:](v19->_notificationManager, "setDelegate:", v19);
    v22 = -[LACDTOPendingPolicyEvaluationStore initWithPersistentStore:workQueue:]( objc_alloc(&OBJC_CLASS____TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore),  "initWithPersistentStore:workQueue:",  v17,  v18);
    evaluationStore = v19->_evaluationStore;
    v19->_evaluationStore = (_TtP23LocalAuthenticationCore38LACDTOPendingPolicyEvaluationStoreType_ *)v22;

    uint64_t v24 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v24;

    v19->_shouldPostRestartRatchetPrompt = 0;
    objc_storeStrong((id *)&v19->_ratchetStateProvider, a3);
    objc_storeStrong((id *)&v19->_ratchetHandler, a4);
    objc_storeStrong((id *)&v19->_device, a5);
    objc_storeStrong((id *)&v19->_evaluationIdentifierFactory, a6);
    objc_storeStrong((id *)&v19->_workQueue, a8);
  }

  return v19;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LACDTOPendingPolicyEvaluationController;
  -[LACDTOPendingPolicyEvaluationController dealloc](&v4, sel_dealloc);
}

- (void)startController
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __55__LACDTOPendingPolicyEvaluationController_addObserver___block_invoke_2;
  v6[3] = &unk_18A36A140;
  id v7 = v4;
  id v5 = v4;
  -[LACDTOPendingPolicyEvaluationController _updatePendingEvaluationsWithUpdateBlock:observerFilter:]( self,  "_updatePendingEvaluationsWithUpdateBlock:observerFilter:",  &__block_literal_global_14,  v6);
}

uint64_t __55__LACDTOPendingPolicyEvaluationController_addObserver___block_invoke()
{
  return 1LL;
}

uint64_t __55__LACDTOPendingPolicyEvaluationController_addObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (void)removeObserver:(id)a3
{
}

- (void)cancelPendingEvaluationForClient:(id)a3 ratchetIdentifier:(id)a4 reason:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v10 = a5;
  evaluationIdentifierFactory = self->_evaluationIdentifierFactory;
  v12 = (void (**)(id, void))a6;
  v13 = -[LACDTOPolicyEvaluationIdentifierFactory evaluationIdentifierForClient:ratchetIdentifier:]( evaluationIdentifierFactory,  "evaluationIdentifierForClient:ratchetIdentifier:",  a3,  a4);
  v14 = -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluationWithIdentifier:]( self->_evaluationStore,  "pendingEvaluationWithIdentifier:",  v13);
  LACLogDTOEvaluation();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      int v17 = 138412802;
      id v18 = v10;
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl( &dword_189219000,  v15,  OS_LOG_TYPE_DEFAULT,  "Canceling pending evaluation with reason: %@, identifier: %@, did find instance: %@",  (uint8_t *)&v17,  0x20u);
    }

    -[LACDTOPendingPolicyEvaluationController _removePendingEvaluationRecordWithIdentifier:completion:]( self,  "_removePendingEvaluationRecordWithIdentifier:completion:",  v13,  v12);
  }

  else
  {
    if (v16)
    {
      int v17 = 138412546;
      id v18 = v10;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl( &dword_189219000,  v15,  OS_LOG_TYPE_DEFAULT,  "Skipping cancellation of pending evaluation with reason: %@, identifier: %@",  (uint8_t *)&v17,  0x16u);
    }

    v12[2](v12, 0LL);
  }
}

- (void)handleEvent:(id)a3 sender:(id)a4
{
  id v8 = a3;
  if (![v8 rawValue])
  {
    [v8 value];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      [v8 value];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTOPendingPolicyEvaluationController _handleRatchetStateChanged:](self, "_handleRatchetStateChanged:", v7);
    }
  }
}

- (void)policyController:(id)a3 willStartPolicyEvaluation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isInteractiveRatchetEvaluation])
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __86__LACDTOPendingPolicyEvaluationController_policyController_willStartPolicyEvaluation___block_invoke;
    v8[3] = &unk_18A36A168;
    objc_copyWeak(&v10, &location);
    id v9 = v7;
    -[LACDTOPendingPolicyEvaluationController _checkShouldAddPendingEvaluationRecordForRequest:completion:]( self,  "_checkShouldAddPendingEvaluationRecordForRequest:completion:",  v9,  v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __86__LACDTOPendingPolicyEvaluationController_policyController_willStartPolicyEvaluation___block_invoke( uint64_t a1,  int a2,  void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained && a2) {
    [WeakRetained _addPendingEvaluationRecordForRequest:*(void *)(a1 + 32) currentState:v7];
  }
}

- (void)policyController:(id)a3 didFinishPolicyEvaluation:(id)a4 result:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isInteractiveRatchetEvaluation])
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __93__LACDTOPendingPolicyEvaluationController_policyController_didFinishPolicyEvaluation_result___block_invoke;
    v11[3] = &unk_18A36A168;
    objc_copyWeak(&v13, &location);
    id v12 = v9;
    -[LACDTOPendingPolicyEvaluationController _checkShouldKeepPendingEvaluationRecordForResult:completion:]( self,  "_checkShouldKeepPendingEvaluationRecordForResult:completion:",  v10,  v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __93__LACDTOPendingPolicyEvaluationController_policyController_didFinishPolicyEvaluation_result___block_invoke( uint64_t a1,  int a2,  void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (a2)
    {
      if (([WeakRetained _hasPendingEvaluationRecordForRequest:v7] & 1) == 0) {
        [v6 _addPendingEvaluationRecordForRequest:*(void *)(a1 + 32) currentState:v8];
      }
    }

    else
    {
      [WeakRetained _removePendingEvaluationRecordForRequest:v7 completion:0];
    }
  }
}

- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  if (LACDarwinNotificationsEqual(a4, @"SignificantTimeChangeNotification"))
  {
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke;
    v12[3] = &unk_18A368B68;
    id v8 = &v13;
    objc_copyWeak(&v13, &location);
    id v9 = v12;
LABEL_5:
    dispatch_async(workQueue, v9);
    objc_destroyWeak(v8);
    goto LABEL_6;
  }

  if (LACDarwinNotificationsEqual(a4, @"com.apple.springboard.lockstate"))
  {
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke_2;
    block[3] = &unk_18A368B68;
    id v8 = &v11;
    objc_copyWeak(&v11, &location);
    id v9 = block;
    goto LABEL_5;
  }

void __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _rescheduleNotifications];
    id WeakRetained = v2;
  }
}

void __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke_2( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _postNotificationForRatchetRestartIfNeeded];
    id WeakRetained = v2;
  }
}

- (void)_registerNotificationObservers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addObserver:self notification:@"SignificantTimeChangeNotification"];

  +[LACDarwinNotificationCenter sharedInstance](&OBJC_CLASS___LACDarwinNotificationCenter, "sharedInstance");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObserver:self notification:@"com.apple.springboard.lockstate"];
}

- (void)_rescheduleNotifications
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __67__LACDTOPendingPolicyEvaluationController__rescheduleNotifications__block_invoke;
  v3[3] = &unk_18A36A190;
  objc_copyWeak(&v4, &location);
  -[LACDTOPendingPolicyEvaluationController _checkIsRatchetStateIn:completion:]( self,  "_checkIsRatchetStateIn:completion:",  &unk_18A39F4C0,  v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __67__LACDTOPendingPolicyEvaluationController__rescheduleNotifications__block_invoke( uint64_t a1,  char a2,  void *a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      objc_msgSend(WeakRetained[3], "pendingEvaluations", 0);
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0LL; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            [v7 _cancelPreviousNotificationForPendingEvaluationRecord:v13 scheduledOnly:0];
            double v14 = 0.0;
            if ([v5 rawValue] == 1)
            {
              [v5 duration];
              double v14 = v15;
            }

            [v5 resetDuration];
            [v7 _scheduleNotificationForPendingEvaluationRecord:v13 after:v14 validity:v16];
          }

          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }

        while (v10);
      }

      [v7[3] persistEvaluations];
      LACLogDTOEvaluation();
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        [v7[3] pendingEvaluations];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v18;
        _os_log_impl( &dword_189219000,  v17,  OS_LOG_TYPE_DEFAULT,  "Updated pending evaluations after significant time change: %@",  buf,  0xCu);
      }
    }

    else
    {
      LACLogDTOEvaluation();
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_189219000,  v17,  OS_LOG_TYPE_DEFAULT,  "Did not update pending evaluations after significant time change because we are not in the state of interest",  buf,  2u);
      }
    }
  }
}

- (void)notificationManager:(id)a3 didReceiveUserAction:(id)a4 completionHandler:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  LACLogDTONotifications();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl( &dword_189219000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - will handle notification action %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  if ([v7 isEqualToString:@"com.apple.coreauthd.notifications.action.securityDelay.dismiss"])
  {
    -[LACDTOPendingPolicyEvaluationController _pruneInvalidatedEvaluations](self, "_pruneInvalidatedEvaluations");
  }

  else if ([v7 isEqualToString:@"com.apple.coreauthd.notifications.action.securityDelay.start"])
  {
    -[LACDTOPendingPolicyEvaluationController _restartRatchetForInvalidatedEvaluations]( self,  "_restartRatchetForInvalidatedEvaluations");
  }

  v8[2](v8);
}

- (void)_checkShouldAddPendingEvaluationRecordForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __103__LACDTOPendingPolicyEvaluationController__checkShouldAddPendingEvaluationRecordForRequest_completion___block_invoke;
  v10[3] = &unk_18A36A1B8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[LACDTOPendingPolicyEvaluationController _checkIsRatchetStateIn:completion:]( self,  "_checkIsRatchetStateIn:completion:",  &unk_18A39F4D8,  v10);
}

void __103__LACDTOPendingPolicyEvaluationController__checkShouldAddPendingEvaluationRecordForRequest_completion___block_invoke( uint64_t a1,  char a2,  void *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    LACLogDTOEvaluation();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) identifier];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl( &dword_189219000,  v6,  OS_LOG_TYPE_DEFAULT,  "Does not need pending evaluation record for '%@' for current ratchet state: %@",  (uint8_t *)&v8,  0x16u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)_checkShouldKeepPendingEvaluationRecordForResult:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isSuccess])
  {
    LACLogDTOEvaluation();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [v6 identifier];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      __int128 v19 = v9;
      __int16 v10 = "Does not need pending evaluation record for '%@' after success";
LABEL_8:
      _os_log_impl(&dword_189219000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
    }
  }

  else
  {
    uint64_t v11 = [v6 error];
    if (!v11
      || (uint64_t v12 = (void *)v11,
          [v6 error],
          id v13 = (void *)objc_claimAutoreleasedReturnValue(),
          BOOL v14 = +[LACError error:hasCode:](&OBJC_CLASS___LACError, "error:hasCode:", v13, -2LL),
          v13,
          v12,
          !v14))
    {
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __103__LACDTOPendingPolicyEvaluationController__checkShouldKeepPendingEvaluationRecordForResult_completion___block_invoke;
      v15[3] = &unk_18A36A1B8;
      id v16 = v6;
      id v17 = v7;
      -[LACDTOPendingPolicyEvaluationController _checkIsRatchetStateIn:completion:]( self,  "_checkIsRatchetStateIn:completion:",  &unk_18A39F4F0,  v15);

      goto LABEL_11;
    }

    LACLogDTOEvaluation();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [v6 identifier];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      __int128 v19 = v9;
      __int16 v10 = "Does not need pending evaluation record for '%@' after user cancel";
      goto LABEL_8;
    }
  }

  (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
LABEL_11:
}

void __103__LACDTOPendingPolicyEvaluationController__checkShouldKeepPendingEvaluationRecordForResult_completion___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  LACLogDTOEvaluation();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v7)
    {
      [*(id *)(a1 + 32) identifier];
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      id v9 = "Does need pending evaluation record for '%@' for current ratchet state: %@";
LABEL_6:
      _os_log_impl(&dword_189219000, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x16u);
    }
  }

  else if (v7)
  {
    [*(id *)(a1 + 32) identifier];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    id v9 = "Does not need pending evaluation record for '%@' for current ratchet state: %@";
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  v5,  v10);
}

- (void)_handleRatchetStateChanged:(id)a3
{
  id v5 = a3;
  [v5 uuid];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOPendingPolicyEvaluationController _prunePendingEvaluationsWithUUID:]( self,  "_prunePendingEvaluationsWithUUID:",  v4);

  -[LACDTOPendingPolicyEvaluationController _handleSwitchToCoolOffState:](self, "_handleSwitchToCoolOffState:", v5);
  -[LACDTOPendingPolicyEvaluationController _handleSwitchToFinalState:](self, "_handleSwitchToFinalState:", v5);
  -[LACDTOPendingPolicyEvaluationController _cancelPreviousNotificationForRatchetRestartWithRatchetState:]( self,  "_cancelPreviousNotificationForRatchetRestartWithRatchetState:",  v5);
}

- (void)_handleSwitchToCoolOffState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ([v4 rawValue] == 1)
  {
    [MEMORY[0x189603F50] now];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x1895F87A8];
    uint64_t v10 = 3221225472LL;
    int v11 = __71__LACDTOPendingPolicyEvaluationController__handleSwitchToCoolOffState___block_invoke;
    uint64_t v12 = &unk_18A36A1E0;
    objc_copyWeak(&v15, &location);
    id v13 = v4;
    id v6 = v5;
    id v14 = v6;
    -[LACDTOPendingPolicyEvaluationController _updatePendingEvaluationsWithBlock:]( self,  "_updatePendingEvaluationsWithBlock:",  &v9);
    LACLogDTOEvaluation();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations]( self->_evaluationStore,  "pendingEvaluations",  v9,  v10,  v11,  v12,  v13);
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl( &dword_189219000,  v7,  OS_LOG_TYPE_DEFAULT,  "Updated pending evaluations after switch to cool off state: %@",  buf,  0xCu);
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

BOOL __71__LACDTOPendingPolicyEvaluationController__handleSwitchToCoolOffState___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [*(id *)(a1 + 32) duration];
  double v6 = v5;
  [*(id *)(a1 + 32) resetDuration];
  [WeakRetained _scheduleNotificationForPendingEvaluationRecord:v3 after:v6 validity:v7];

  [v3 coolOffStarted];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8) {
    [v3 setCoolOffStarted:*(void *)(a1 + 40)];
  }

  return v8 == 0LL;
}

- (void)_handleSwitchToFinalState:(id)a3
{
  id v4 = a3;
  if (-[LACDTOPendingPolicyEvaluationController _canFinishPendingEvaluationsForRatchetState:]( self,  "_canFinishPendingEvaluationsForRatchetState:",  v4))
  {
    objc_initWeak(&location, self);
    dispatch_time_t v5 = dispatch_time(0LL, 500000000LL);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __69__LACDTOPendingPolicyEvaluationController__handleSwitchToFinalState___block_invoke;
    v7[3] = &unk_18A36A208;
    objc_copyWeak(&v9, &location);
    v7[4] = self;
    id v8 = v4;
    dispatch_after(v5, workQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __69__LACDTOPendingPolicyEvaluationController__handleSwitchToFinalState___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] pendingEvaluations];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          uint64_t v10 = *(void **)(a1 + 32);
          [*(id *)(a1 + 40) resetDuration];
          [v10 _scheduleNotificationForPendingEvaluationRecord:v9 after:0.0 validity:v11];
          ++v8;
        }

        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v6);
    }
  }
}

- (BOOL)_isRatchetRestartRequest:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 hasSuffix:@"com.apple.coreauthd.dto.request.identifier.restart"];

  return v4;
}

- (BOOL)_hasPendingEvaluationRecordForRequest:(id)a3
{
  v21[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[LACDTOPendingPolicyEvaluationController _isRatchetRestartRequest:](self, "_isRatchetRestartRequest:", v4))
  {
    [v4 payload];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 objectForKeyedSubscript:@"kLACDTOPolicyEvaluationRequestPayloadKeyAssociatedIdentifiers"];
  }

  else
  {
    [v4 identifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    uint64_t v6 = [MEMORY[0x189603F18] arrayWithObjects:v21 count:1];
  }

  uint64_t v7 = (void *)v6;

  if ([v7 count])
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      char v12 = 1;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluationWithIdentifier:]( self->_evaluationStore,  "pendingEvaluationWithIdentifier:",  *(void *)(*((void *)&v16 + 1) + 8 * i),  (void)v16);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          v12 &= v14 != 0LL;
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v10);
    }

    else
    {
      char v12 = 1;
    }
  }

  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)_addPendingEvaluationRecordForRequest:(id)a3 currentState:(id)a4
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_opt_new();
  [v7 uuid];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = -[LACDTOPendingPolicyEvaluationController _isRatchetRestartRequest:](self, "_isRatchetRestartRequest:", v6);
  uint64_t v11 = MEMORY[0x1895F87A8];
  v38 = v6;
  v39 = v9;
  if (v10)
  {
    id v12 = (id)objc_opt_new();
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v52;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v52 != v15) {
            objc_enumerationMutation(obj);
          }
          __int128 v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v17, "isInvalidated", v38))
          {
            [v17 identifier];
            __int128 v18 = v12;
            __int128 v19 = v8;
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[LACDTOPendingPolicyEvaluationController _coolOffStartedTimestampForIdentifier:currentState:]( self,  "_coolOffStartedTimestampForIdentifier:currentState:",  v20,  v7);
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();

            id v8 = v19;
            id v12 = v18;
            [v17 setNotificationScheduledAt:0];
            [v17 setRatchetUUID:v39];
            [v17 setCoolOffStarted:v21];
            [v17 setIsInvalidated:0];
            [v8 addObject:v17];
            [v17 identifier];
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 addObject:v22];
          }
        }

        uint64_t v14 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      }

      while (v14);
    }

    [v38 payload];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = (void *)[v23 mutableCopy];
    v25 = v24;
    if (v24) {
      id v26 = v24;
    }
    else {
      id v26 = (id)objc_opt_new();
    }
    id v29 = v26;

    [v29 setObject:v12 forKeyedSubscript:@"kLACDTOPolicyEvaluationRequestPayloadKeyAssociatedIdentifiers"];
    [v38 updatePayload:v29];
  }

  else
  {
    [v6 identifier];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACDTOPendingPolicyEvaluationController _coolOffStartedTimestampForIdentifier:currentState:]( self,  "_coolOffStartedTimestampForIdentifier:currentState:",  v27,  v7);
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v11;
    v46[1] = 3221225472LL;
    v46[2] = __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke;
    v46[3] = &unk_18A36A230;
    id v47 = v27;
    id v48 = v6;
    id v49 = v9;
    id v50 = v28;
    id v29 = v28;
    id v12 = v27;
    __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke((uint64_t)v46);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 addObject:v30];
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v31 = v8;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v43;
    do
    {
      for (uint64_t j = 0LL; j != v33; ++j)
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        -[LACDTOPendingPolicyEvaluationController _addPendingEvaluationRecord:currentState:]( self,  "_addPendingEvaluationRecord:currentState:",  v36,  v7,  v38);
        [v36 coolOffStarted];
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v41[0] = MEMORY[0x1895F87A8];
          v41[1] = 3221225472LL;
          v41[2] = __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke_2;
          v41[3] = &unk_18A36A258;
          v41[4] = v36;
          -[LACDTOPendingPolicyEvaluationController _updatePendingEvaluationsWithBlock:]( self,  "_updatePendingEvaluationsWithBlock:",  v41);
        }
      }

      uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }

    while (v33);
  }

  -[LACDTOPendingPolicyEvaluationStoreType persistEvaluations](self->_evaluationStore, "persistEvaluations");
}

_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *__94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke( uint64_t a1)
{
  id v2 = -[LACDTOMutablePendingPolicyEvaluation initWithIdentifier:]( objc_alloc(&OBJC_CLASS____TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation),  "initWithIdentifier:",  *(void *)(a1 + 32));
  [*(id *)(a1 + 40) options];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:1063];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutablePendingPolicyEvaluation setCallbackReason:](v2, "setCallbackReason:", v5);

  [*(id *)(a1 + 40) options];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:1064];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutablePendingPolicyEvaluation setCallbackURL:](v2, "setCallbackURL:", v8);

  -[LACDTOMutablePendingPolicyEvaluation setNotificationScheduledAt:](v2, "setNotificationScheduledAt:", 0LL);
  -[LACDTOMutablePendingPolicyEvaluation setRatchetUUID:](v2, "setRatchetUUID:", *(void *)(a1 + 48));
  -[LACDTOMutablePendingPolicyEvaluation setCoolOffStarted:](v2, "setCoolOffStarted:", *(void *)(a1 + 56));
  return v2;
}

uint64_t __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke_2( uint64_t a1,  void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (id)_coolOffStartedTimestampForIdentifier:(id)a3 currentState:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluationWithIdentifier:]( self->_evaluationStore,  "pendingEvaluationWithIdentifier:",  v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    LACLogDTOEvaluation();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = (void *)MEMORY[0x189607848];
      [v8 coolOffStarted];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 localizedStringFromDate:v11 dateStyle:0 timeStyle:3];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      __int128 v21 = v12;
      _os_log_impl( &dword_189219000,  v9,  OS_LOG_TYPE_DEFAULT,  "The pending evaluation for %@ is using the existing cool off timestamp: %@",  (uint8_t *)&v18,  0x16u);
    }

    [v8 coolOffStarted];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else if ([v7 rawValue] == 1)
  {
    [MEMORY[0x189603F50] now];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    LACLogDTOEvaluation();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      [MEMORY[0x189607848] localizedStringFromDate:v13 dateStyle:0 timeStyle:3];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      __int128 v21 = v15;
      _os_log_impl( &dword_189219000,  v14,  OS_LOG_TYPE_DEFAULT,  "The pending evaluation for %@ will use the current time for cool off timestamp: %@",  (uint8_t *)&v18,  0x16u);
    }
  }

  else
  {
    LACLogDTOEvaluation();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl( &dword_189219000,  v16,  OS_LOG_TYPE_DEFAULT,  "The pending evaluation for %@ has no cool off timestamp yet",  (uint8_t *)&v18,  0xCu);
    }

    uint64_t v13 = 0LL;
  }

  return v13;
}

- (void)_addPendingEvaluationRecord:(id)a3 currentState:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 isInvalidated];
  LACLogDTOEvaluation();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      [v6 identifier];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      int v18 = v11;
      _os_log_impl( &dword_189219000,  v9,  OS_LOG_TYPE_DEFAULT,  "Not adding new pending evaluation with identifier: %@, the evaluation is invalidated",  buf,  0xCu);
    }
  }

  else
  {
    if (v10)
    {
      [v6 identifier];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      int v18 = v12;
      _os_log_impl( &dword_189219000,  v9,  OS_LOG_TYPE_DEFAULT,  "Will add new pending evaluation with identifier: %@",  buf,  0xCu);
    }

    if ([v7 rawValue] != 1 && objc_msgSend(v7, "rawValue") != 2) {
      -[LACDTOPendingPolicyEvaluationController _cancelPreviousNotificationForPendingEvaluationRecord:scheduledOnly:]( self,  "_cancelPreviousNotificationForPendingEvaluationRecord:scheduledOnly:",  v6,  0LL);
    }
    if ([v7 rawValue] == 1)
    {
      [v7 duration];
      double v14 = v13;
      [v7 resetDuration];
      -[LACDTOPendingPolicyEvaluationController _scheduleNotificationForPendingEvaluationRecord:after:validity:]( self,  "_scheduleNotificationForPendingEvaluationRecord:after:validity:",  v6,  v14,  v15);
    }

    -[LACDTOPendingPolicyEvaluationStoreType addPendingEvaluation:](self->_evaluationStore, "addPendingEvaluation:", v6);
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __84__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecord_currentState___block_invoke;
    v16[3] = &unk_18A36A280;
    v16[4] = self;
    -[LACDTOPendingPolicyEvaluationController _forEachObserver:](self, "_forEachObserver:", v16);
  }
}

uint64_t __84__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecord_currentState___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 pendingEvaluationControllerDidStartTrackingPendingEvaluations:*(void *)(a1 + 32)];
}

- (void)_removePendingEvaluationRecordForRequest:(id)a3 completion:(id)a4
{
  v33[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v18 = a4;
  if (-[LACDTOPendingPolicyEvaluationController _isRatchetRestartRequest:](self, "_isRatchetRestartRequest:", v6))
  {
    objc_msgSend(v6, "payload", v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:@"kLACDTOPolicyEvaluationRequestPayloadKeyAssociatedIdentifiers"];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend(v6, "identifier", v6);
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v8;
    [MEMORY[0x189603F18] arrayWithObjects:v33 count:1];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if ([v19 count])
  {
    uint64_t v9 = dispatch_group_create();
    v30[0] = 0LL;
    v30[1] = v30;
    v30[2] = 0x3032000000LL;
    v30[3] = __Block_byref_object_copy__5;
    v30[4] = __Block_byref_object_dispose__5;
    id v31 = 0LL;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v10 = v19;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
    uint64_t v12 = MEMORY[0x1895F87A8];
    if (v11)
    {
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          dispatch_group_enter(v9);
          v23[0] = v12;
          v23[1] = 3221225472LL;
          v23[2] = __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke;
          v23[3] = &unk_18A36A2A8;
          v25 = v30;
          uint64_t v24 = v9;
          -[LACDTOPendingPolicyEvaluationController _removePendingEvaluationRecordWithIdentifier:completion:]( self,  "_removePendingEvaluationRecordWithIdentifier:completion:",  v15,  v23);
        }

        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }

      while (v11);
    }

    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = v12;
    block[1] = 3221225472LL;
    block[2] = __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke_2;
    block[3] = &unk_18A36A2D0;
    id v21 = v18;
    uint64_t v22 = v30;
    dispatch_group_notify(v9, workQueue, block);

    _Block_object_dispose(v30, 8);
  }

  else
  {
    (*((void (**)(id, void))v18 + 2))(v18, 0LL);
  }
}

void __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v2 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v7 = *(void **)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  id v6 = v7;
  if (v7) {
    a2 = v6;
  }
  objc_storeStrong(v5, a2);
  id v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke_2( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))( result,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }
  return result;
}

- (void)_removePendingEvaluationRecordWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_18A3689D8;
  id v9 = v7;
  id v20 = v9;
  id v10 = _Block_copy(aBlock);
  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluationWithIdentifier:]( self->_evaluationStore,  "pendingEvaluationWithIdentifier:",  v6);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11) {
    goto LABEL_5;
  }
  LACLogDTOEvaluation();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl( &dword_189219000,  v12,  OS_LOG_TYPE_DEFAULT,  "Will remove pending evaluation with identifier: %@",  buf,  0xCu);
  }

  -[LACDTOPendingPolicyEvaluationStoreType removePendingEvaluationWith:]( self->_evaluationStore,  "removePendingEvaluationWith:",  v6);
  -[LACDTOPendingPolicyEvaluationController _cancelPreviousNotificationForPendingEvaluationRecord:scheduledOnly:]( self,  "_cancelPreviousNotificationForPendingEvaluationRecord:scheduledOnly:",  v11,  1LL);
  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v14 = [v13 count] == 0;

  if (v14)
  {
    v18[0] = v8;
    v18[1] = 3221225472LL;
    v18[2] = __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_28;
    v18[3] = &unk_18A36A280;
    v18[4] = self;
    -[LACDTOPendingPolicyEvaluationController _forEachObserver:](self, "_forEachObserver:", v18);
    objc_initWeak((id *)buf, self);
    v15[0] = v8;
    v15[1] = 3221225472LL;
    v15[2] = __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_2;
    v15[3] = &unk_18A36A2F8;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = v10;
    -[LACDTOPendingPolicyEvaluationController _checkIsRatchetStateIn:completion:]( self,  "_checkIsRatchetStateIn:completion:",  &unk_18A39F508,  v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

  else
  {
LABEL_5:
    (*((void (**)(void *, void))v10 + 2))(v10, 0LL);
  }
}

uint64_t __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_28( uint64_t a1,  void *a2)
{
  return [a2 pendingEvaluationControllerDidStopTrackingPendingEvaluations:*(void *)(a1 + 32)];
}

void __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_2( uint64_t a1,  int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained
    && a2
    && ([WeakRetained[3] pendingEvaluations],
        id v6 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        !v7))
  {
    LACLogDTOEvaluation();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 0;
      _os_log_impl( &dword_189219000,  v8,  OS_LOG_TYPE_DEFAULT,  "Reseting Ratchet as there are no pending evaluations",  (uint8_t *)v9,  2u);
    }

    [v5 _resetRatchetWithCompletion:*(void *)(a1 + 32)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

- (void)_updatePendingEvaluationsWithBlock:(id)a3
{
}

uint64_t __78__LACDTOPendingPolicyEvaluationController__updatePendingEvaluationsWithBlock___block_invoke()
{
  return 1LL;
}

- (void)_updatePendingEvaluationsWithUpdateBlock:(id)a3 observerFilter:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = (unsigned int (**)(id, void))a3;
  id v7 = a4;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    char v10 = 0;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v6[2](v6, v13))
        {
          objc_initWeak(&location, self);
          v14[0] = MEMORY[0x1895F87A8];
          v14[1] = 3221225472LL;
          v14[2] = __99__LACDTOPendingPolicyEvaluationController__updatePendingEvaluationsWithUpdateBlock_observerFilter___block_invoke;
          v14[3] = &unk_18A36A360;
          id v15 = v7;
          objc_copyWeak(&v16, &location);
          v14[4] = v13;
          -[LACDTOPendingPolicyEvaluationController _forEachObserver:](self, "_forEachObserver:", v14);
          objc_destroyWeak(&v16);

          objc_destroyWeak(&location);
          char v10 = 1;
        }
      }

      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);

    if ((v10 & 1) != 0) {
      -[LACDTOPendingPolicyEvaluationStoreType persistEvaluations](self->_evaluationStore, "persistEvaluations");
    }
  }

  else
  {
  }
}

void __99__LACDTOPendingPolicyEvaluationController__updatePendingEvaluationsWithUpdateBlock_observerFilter___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16LL))())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v4 pendingEvaluationController:WeakRetained updatedPendingEvaluation:*(void *)(a1 + 32)];
  }
}

- (BOOL)_canFinishPendingEvaluationsForRatchetState:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __87__LACDTOPendingPolicyEvaluationController__canFinishPendingEvaluationsForRatchetState___block_invoke;
  v7[3] = &unk_18A36A388;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [&unk_18A39F520 indexOfObjectPassingTest:v7] != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

BOOL __87__LACDTOPendingPolicyEvaluationController__canFinishPendingEvaluationsForRatchetState___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v6 = [a2 integerValue];
  BOOL result = v6 == [*(id *)(a1 + 32) rawValue];
  *a4 = result;
  return result;
}

- (void)_cancelPreviousNotificationForPendingEvaluationRecord:(id)a3 scheduledOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 setNotificationScheduledAt:0];
  -[LACDTONotificationManager cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation:scheduledOnly:completion:]( self->_notificationManager,  "cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation:scheduledOnly:completion:",  v6,  v4,  &__block_literal_global_38);
}

- (void)_cancelPreviousNotificationForRatchetRestartWithRatchetState:(id)a3
{
  if ([a3 rawValue] >= 1) {
    -[LACDTONotificationManager cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion:]( self->_notificationManager,  "cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion:",  &__block_literal_global_39_0);
  }
}

- (void)_scheduleNotificationForRatchetRestart
{
  self->_shouldPostRestartRatchetPrompt = 1;
  -[LACDTOPendingPolicyEvaluationController _postNotificationForRatchetRestartIfNeeded]( self,  "_postNotificationForRatchetRestartIfNeeded");
}

- (void)_postNotificationForRatchetRestartIfNeeded
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v4 = [*a1 hasCompletedSetup];
  int v5 = [*a1 hasBeenUnlockedSinceBoot];
  v6[0] = 67109376;
  v6[1] = v4;
  __int16 v7 = 1024;
  int v8 = v5;
  _os_log_error_impl( &dword_189219000,  a2,  OS_LOG_TYPE_ERROR,  "Skipping notification for security delay restart migration: %d, unlock: %d",  (uint8_t *)v6,  0xEu);
}

void __85__LACDTOPendingPolicyEvaluationController__postNotificationForRatchetRestartIfNeeded__block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    LACLogDTOEvaluation();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __85__LACDTOPendingPolicyEvaluationController__postNotificationForRatchetRestartIfNeeded__block_invoke_cold_1( (uint64_t)v3,  v6,  v7,  v8,  v9,  v10,  v11,  v12);
      }

      WeakRetained[48] = 1;
    }

    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl( &dword_189219000,  v6,  OS_LOG_TYPE_DEFAULT,  "Posted notification for security delay restart",  v13,  2u);
      }
    }
  }
}

- (void)_scheduleNotificationForPendingEvaluationRecord:(id)a3 after:(double)a4 validity:(double)a5
{
  id v8 = a3;
  [MEMORY[0x189603F50] dateWithTimeIntervalSinceNow:a4];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v8 isNotificationScheduledForDate:v9] & 1) == 0
    && ([v8 hasNotifiedUserAboutCompletion] & 1) == 0)
  {
    [v8 setNotificationScheduledAt:v9];
    objc_initWeak(&location, self);
    notificationManager = self->_notificationManager;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke;
    v11[3] = &unk_18A36A418;
    objc_copyWeak(v13, &location);
    id v12 = v8;
    v13[1] = *(id *)&a4;
    -[LACDTONotificationManager scheduleSecurityDelayFinishedNotificationForPendingEvaluation:after:validity:completion:]( notificationManager,  "scheduleSecurityDelayFinishedNotificationForPendingEvaluation:after:validity:completion:",  v12,  v11,  a4,  a5);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      id v6 = *(void **)(a1 + 32);
      int v5 = (uint64_t *)(a1 + 32);
      [v6 setNotificationScheduledAt:0];
      LACLogDTOEvaluation();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke_cold_1( v5,  (uint64_t)v3,  v7);
      }
    }

    else
    {
      LACLogDTOEvaluation();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 48);
        int v10 = 138543618;
        uint64_t v11 = v8;
        __int16 v12 = 2048;
        uint64_t v13 = v9;
        _os_log_impl( &dword_189219000,  v7,  OS_LOG_TYPE_DEFAULT,  "Scheduled notification for evaluation: %{public}@ after: %.2f secs",  (uint8_t *)&v10,  0x16u);
      }
    }

    [WeakRetained[3] persistEvaluations];
  }
}

- (void)_checkIsRatchetStateIn:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ratchetStateProvider = self->_ratchetStateProvider;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __77__LACDTOPendingPolicyEvaluationController__checkIsRatchetStateIn_completion___block_invoke;
  v11[3] = &unk_18A36A440;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  -[LACDTORatchetStateProvider ratchetStateWithCompletion:](ratchetStateProvider, "ratchetStateWithCompletion:", v11);
}

void __77__LACDTOPendingPolicyEvaluationController__checkIsRatchetStateIn_completion___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  id v7 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v5, "rawValue"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) containsObject:v6],  v7);
  }
}

- (void)_forEachObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  int v4 = (void (**)(id, void))a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)MEMORY[0x189603F18];
  -[NSHashTable allObjects](self->_observers, "allObjects", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 arrayWithArray:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)_resetRatchetWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  ratchetHandler = self->_ratchetHandler;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __71__LACDTOPendingPolicyEvaluationController__resetRatchetWithCompletion___block_invoke;
  v7[3] = &unk_18A368FB8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[LACDTORatchetHandler resetRatchetWithCompletion:](ratchetHandler, "resetRatchetWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__LACDTOPendingPolicyEvaluationController__resetRatchetWithCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    if (!v4) {
      [WeakRetained[4] ratchetStateWithCompletion:&__block_literal_global_41_0];
    }
  }
}

- (void)_restartRatchetForInvalidatedEvaluations
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v7) isInvalidated])
        {

          LACLogDTOEvaluation();
          id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v10 = 0;
            _os_log_impl( &dword_189219000,  v9,  OS_LOG_TYPE_DEFAULT,  "Restarting security delay for invalidated evaluations",  v10,  2u);
          }

          -[LACDTORatchetHandler restartRatchetWithIdentifier:]( self->_ratchetHandler,  "restartRatchetWithIdentifier:",  @"com.apple.coreauthd.dto.request.identifier.restart");
          return;
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  LACLogDTOEvaluation();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl( &dword_189219000,  v8,  OS_LOG_TYPE_DEFAULT,  "Not restarting security delay - no invalidated evaluations",  v10,  2u);
  }
}

- (void)_loadPendingEvaluations
{
  ratchetStateProvider = self->_ratchetStateProvider;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke;
  v4[3] = &unk_18A368B40;
  objc_copyWeak(&v5, &location);
  -[LACDTORatchetStateProvider ratchetStateWithCompletion:](ratchetStateProvider, "ratchetStateWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOEvaluation();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_cold_1( (uint64_t)v6,  v10,  v11,  v12,  v13,  v14,  v15,  v16);
      }
    }

    else
    {
      uint64_t v17 = (void *)*((void *)WeakRetained + 3);
      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_42;
      v18[3] = &unk_18A36A488;
      objc_copyWeak(&v20, v7);
      id v19 = v5;
      [v17 loadPersistedEvaluationsWithCompletion:v18];

      objc_destroyWeak(&v20);
    }
  }
}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_42( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOEvaluation();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_42_cold_1( (uint64_t)v6,  v8,  v9,  v10,  v11,  v12,  v13,  v14);
      }
    }

    else
    {
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v15 = v5;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        id v27 = v5;
        char v18 = 0;
        char v28 = 0;
        uint64_t v19 = *(void *)v30;
        do
        {
          for (uint64_t i = 0LL; i != v17; ++i)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v15);
            }
            __int128 v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if ([v21 isInvalidated])
            {
              [WeakRetained[3] addPendingEvaluation:v21];
            }

            else
            {
              [*(id *)(a1 + 32) uuid];
              id v22 = (void *)objc_claimAutoreleasedReturnValue();
              int v23 = [WeakRetained _shouldPrunePendingEvaluation:v21 uuid:v22];

              if (v23)
              {
                [*(id *)(a1 + 32) uuid];
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

                char v18 = 1;
                if (!v24)
                {
                  [v21 setIsInvalidated:1];
                  [WeakRetained[3] addPendingEvaluation:v21];
                  char v28 = 1;
                }
              }

              else
              {
                [v21 ratchetUUID];
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v25)
                {
                  [*(id *)(a1 + 32) uuid];
                  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
                  [v21 setRatchetUUID:v26];
                }

                [WeakRetained _addPendingEvaluationRecord:v21 currentState:*(void *)(a1 + 32)];
              }
            }
          }

          uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }

        while (v17);

        if ((v28 & 1) != 0) {
          [WeakRetained _scheduleNotificationForRatchetRestart];
        }
        id v6 = 0LL;
        id v5 = v27;
        if ((v18 & 1) != 0) {
          [WeakRetained[3] persistEvaluations];
        }
      }

      else
      {
      }
    }
  }
}

- (void)_pruneInvalidatedEvaluations
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  LACLogDTOEvaluation();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_189219000, v3, OS_LOG_TYPE_DEFAULT, "Pruning invalidated evaluations", buf, 2u);
  }

  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v4 copy];

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isInvalidated", (void)v15))
        {
          evaluationStore = self->_evaluationStore;
          [v12 identifier];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[LACDTOPendingPolicyEvaluationStoreType removePendingEvaluationWith:]( evaluationStore,  "removePendingEvaluationWith:",  v14);

          char v9 = 1;
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v8);

    if ((v9 & 1) != 0) {
      -[LACDTOPendingPolicyEvaluationStoreType persistEvaluations](self->_evaluationStore, "persistEvaluations");
    }
  }

  else
  {
  }
}

- (void)_prunePendingEvaluationsWithUUID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LACLogDTOEvaluation();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v4;
    _os_log_impl( &dword_189219000,  v5,  OS_LOG_TYPE_DEFAULT,  "Pruning pending evaluations with uuid: %{public}@",  buf,  0xCu);
  }

  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v6 copy];

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (-[LACDTOPendingPolicyEvaluationController _shouldPrunePendingEvaluation:uuid:]( self,  "_shouldPrunePendingEvaluation:uuid:",  v14,  v4,  (void)v17))
        {
          [v14 identifier];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[LACDTOPendingPolicyEvaluationController _removePendingEvaluationRecordWithIdentifier:completion:]( self,  "_removePendingEvaluationRecordWithIdentifier:completion:",  v15,  &__block_literal_global_44);
        }

        else
        {
          [v14 ratchetUUID];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            [v14 setRatchetUUID:v4];
            char v11 = 1;
          }
        }
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);

    if ((v11 & 1) != 0) {
      -[LACDTOPendingPolicyEvaluationStoreType persistEvaluations](self->_evaluationStore, "persistEvaluations");
    }
  }

  else
  {
  }
}

- (BOOL)_shouldPrunePendingEvaluation:(id)a3 uuid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 ratchetUUID];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v5 ratchetUUID];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v6 isEqualToString:v8] ^ 1;
  }

  else
  {
    LOBYTE(v9) = v6 == 0LL;
  }

  return v9;
}

- (LACDTONotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
}

- (void).cxx_destruct
{
}

void __85__LACDTOPendingPolicyEvaluationController__postNotificationForRatchetRestartIfNeeded__block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke_cold_1( uint64_t *a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_189219000,  log,  OS_LOG_TYPE_ERROR,  "Did not schedule notification for evaluation: %{public}@ due to error: %{public}@",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_2();
}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_42_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end