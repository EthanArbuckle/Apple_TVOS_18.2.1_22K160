@interface MCMCommandCompleteBackgroundTasks
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (void)execute;
@end

@implementation MCMCommandCompleteBackgroundTasks

+ (unint64_t)command
{
  return 46LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 codeSignInfo];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 entitlements];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v5 allowed]) {
    char v6 = 1;
  }
  else {
    char v6 = [v5 testabilityAllowed];
  }

  return v6;
}

- (void)execute
{
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  v4 = (dispatch_queue_s *)MCMSharedBackgroundQueue();
  dispatch_barrier_async_and_wait(v4, &__block_literal_global_12926);

  v5 = (dispatch_queue_s *)MCMSharedSlowWorkloop();
  dispatch_barrier_async_and_wait(v5, &__block_literal_global_1);

  char v6 = (dispatch_queue_s *)MCMDataProtectionQueue();
  dispatch_barrier_async_and_wait(v6, &__block_literal_global_2_12927);
  v7 = -[MCMCommand resultPromise](self, "resultPromise");
  v8 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", 0LL);
  [v7 completeWithResult:v8];

  objc_autoreleasePoolPop(v3);
}

  ;
}

  ;
}

  ;
}

@end