@interface LACDTONotificationManager
- (LACDTONotificationManager)initWithReplyQueue:(id)a3;
- (LACDTONotificationManager)initWithReplyQueue:(id)a3 notificationFactory:(id)a4;
- (LACDTONotificationManagerDelegate)delegate;
- (id)_securityDelayManager;
- (void)cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion:(id)a3;
- (void)cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5;
- (void)notificationManager:(id)a3 didRespondToNotification:(id)a4 fromCategory:(id)a5 withAction:(id)a6 completionHandler:(id)a7;
- (void)postNewSecurityDelayRequiredNotificationWithCompletion:(id)a3;
- (void)scheduleSecurityDelayFinishedNotificationForPendingEvaluation:(id)a3 after:(double)a4 validity:(double)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation LACDTONotificationManager

- (LACDTONotificationManager)initWithReplyQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___LACDTONotificationFactory);
  v6 = -[LACDTONotificationManager initWithReplyQueue:notificationFactory:]( self,  "initWithReplyQueue:notificationFactory:",  v4,  v5);

  return v6;
}

- (LACDTONotificationManager)initWithReplyQueue:(id)a3 notificationFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACDTONotificationManager;
  v9 = -[LACDTONotificationManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_replyQueue, a3);
    objc_storeStrong((id *)&v10->_notificationFactory, a4);
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setDelegate:self];
}

- (void)scheduleSecurityDelayFinishedNotificationForPendingEvaluation:(id)a3 after:(double)a4 validity:(double)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a6;
  -[LACDTONotificationManager _securityDelayManager](self, "_securityDelayManager");
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[LACDTONotificationFactory securityDelayEndedNotificationForPendingEvaluation:after:validity:]( self->_notificationFactory,  "securityDelayEndedNotificationForPendingEvaluation:after:validity:",  v10,  a4,  a5);
  LACLogDTONotifications();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    __int16 v26 = 2114;
    id v27 = v10;
    _os_log_impl( &dword_189219000,  v14,  OS_LOG_TYPE_DEFAULT,  "Will schedule notification %{public}@ for %{public}@",  buf,  0x16u);
  }

  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __117__LACDTONotificationManager_scheduleSecurityDelayFinishedNotificationForPendingEvaluation_after_validity_completion___block_invoke;
  v19[3] = &unk_18A369F88;
  id v20 = v13;
  id v21 = v10;
  id v22 = v12;
  id v23 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  [v15 postNotification:v18 completion:v19];
}

void __117__LACDTONotificationManager_scheduleSecurityDelayFinishedNotificationForPendingEvaluation_after_validity_completion___block_invoke( void *a1,  void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  LACLogDTONotifications();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __117__LACDTONotificationManager_scheduleSecurityDelayFinishedNotificationForPendingEvaluation_after_validity_completion___block_invoke_cold_1();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl( &dword_189219000,  v5,  OS_LOG_TYPE_DEFAULT,  "Did schedule notification %{public}@ for %{public}@",  (uint8_t *)&v8,  0x16u);
  }

  (*(void (**)(void))(a1[7] + 16LL))();
}

- (void)postNewSecurityDelayRequiredNotificationWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[LACDTONotificationManager _securityDelayManager](self, "_securityDelayManager");
  id v6 = -[LACDTONotificationFactory newSecurityDelayRequiredNotification]( self->_notificationFactory,  "newSecurityDelayRequiredNotification");
  LACLogDTONotifications();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_189219000, v7, OS_LOG_TYPE_DEFAULT, "Will post notification %{public}@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __84__LACDTONotificationManager_postNewSecurityDelayRequiredNotificationWithCompletion___block_invoke;
  v11[3] = &unk_18A3694B8;
  id v13 = v5;
  id v14 = v4;
  id v12 = v6;
  id v8 = v5;
  id v9 = v4;
  id v10 = v6;
  [v8 postNotification:v10 completion:v11];
}

void __84__LACDTONotificationManager_postNewSecurityDelayRequiredNotificationWithCompletion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  LACLogDTONotifications();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__LACDTONotificationManager_postNewSecurityDelayRequiredNotificationWithCompletion___block_invoke_cold_1();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_189219000, v5, OS_LOG_TYPE_DEFAULT, "Did post notification %{public}@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v18[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v9 = a3;
  -[LACDTONotificationManager _securityDelayManager](self, "_securityDelayManager");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 identifier];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:1];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __122__LACDTONotificationManager_cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation_scheduledOnly_completion___block_invoke;
  v15[3] = &unk_18A368880;
  id v16 = v10;
  id v17 = v8;
  id v13 = v10;
  id v14 = v8;
  [v13 cancelNotificationsWithIdentifiers:v12 scheduledOnly:v5 completion:v15];
}

uint64_t __122__LACDTONotificationManager_cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation_scheduledOnly_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[LACDTONotificationManager _securityDelayManager](self, "_securityDelayManager");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = @"com.apple.coreauthd.notifications.newSecurityDelayRequired";
  [MEMORY[0x189603F18] arrayWithObjects:v12 count:1];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __94__LACDTONotificationManager_cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion___block_invoke;
  v9[3] = &unk_18A368880;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  [v7 cancelNotificationsWithIdentifiers:v6 scheduledOnly:0 completion:v9];
}

uint64_t __94__LACDTONotificationManager_cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)notificationManager:(id)a3 didRespondToNotification:(id)a4 fromCategory:(id)a5 withAction:(id)a6 completionHandler:(id)a7
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v11 = a4;
  id v12 = a6;
  id v13 = (void (**)(void))a7;
  if ([a5 isEqualToString:@"com.apple.coreauthd.notifications.category.securityDelay.required"])
  {
    -[LACDTONotificationManager delegate](self, "delegate");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 notificationManager:self didReceiveUserAction:v12 completionHandler:v13];
  }

  else
  {
    LACLogDTONotifications();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl( &dword_189219000,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - not handling notification %{public}@",  (uint8_t *)&v16,  0x16u);
    }

    v13[2](v13);
  }
}

- (id)_securityDelayManager
{
  v9[2] = *MEMORY[0x1895F89C0];
  id v3 = +[LACDTOMutableNotificationCategory newSecurityDelayRequiredCategory]( &OBJC_CLASS___LACDTOMutableNotificationCategory,  "newSecurityDelayRequiredCategory");
  v9[0] = v3;
  +[LACDTOMutableNotificationCategory securityDelayEndedCategory]( &OBJC_CLASS___LACDTOMutableNotificationCategory,  "securityDelayEndedCategory");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  [MEMORY[0x189603F18] arrayWithObjects:v9 count:2];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[LACUNManagerProvider sharedInstance](&OBJC_CLASS___LACUNManagerProvider, "sharedInstance");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 sharedInstanceWithBundleIdentifier:@"com.apple.CoreAuthUI" categories:v5 replyQueue:self->_replyQueue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (LACDTONotificationManagerDelegate)delegate
{
  return (LACDTONotificationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

  ;
}

void __117__LACDTONotificationManager_scheduleSecurityDelayFinishedNotificationForPendingEvaluation_after_validity_completion___block_invoke_cold_1()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_0_5();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl( &dword_189219000,  v3,  OS_LOG_TYPE_ERROR,  "Could not schedule notification %{public}@ for %{public}@ (error:=%{public}@)",  v4,  0x20u);
}

void __84__LACDTONotificationManager_postNewSecurityDelayRequiredNotificationWithCompletion___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_0_5();
  uint64_t v3 = v0;
  _os_log_error_impl( &dword_189219000,  v1,  OS_LOG_TYPE_ERROR,  "Could not post notification %{public}@ (error:=%{public}@)",  v2,  0x16u);
}

@end