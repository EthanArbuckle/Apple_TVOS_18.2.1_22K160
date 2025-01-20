@interface SATVActivationManager
+ (id)new;
+ (id)sharedInstance;
- (BOOL)isDeviceActivated;
- (BOOL)isDeviceFactoryActivated;
- (NSMutableArray)requests;
- (SATVActivationManager)init;
- (SATVActivator)activator;
- (id)_init;
- (void)_completeActivationRequestWithSuccessType:(unint64_t)a3 failureReason:(int64_t)a4 error:(id)a5;
- (void)_requestActivationWithNavigationController:(id)a3 completionHandler:(id)a4;
- (void)_startActivationRequestIfPossible;
- (void)activator:(id)a3 didFailWithError:(id)a4 reason:(int64_t)a5;
- (void)activator:(id)a3 didSucceedWithType:(unint64_t)a4;
- (void)requestActivationWithNavigationController:(id)a3 completionHandler:(id)a4;
- (void)requestSilentActivationWithCompletionHandler:(id)a3;
- (void)setActivator:(id)a3;
- (void)setRequests:(id)a3;
@end

@implementation SATVActivationManager

+ (id)new
{
  return 0LL;
}

- (SATVActivationManager)init
{
  return 0LL;
}

+ (id)sharedInstance
{
  if (qword_1001098E0 != -1) {
    dispatch_once(&qword_1001098E0, &stru_1000CA120);
  }
  return (id)qword_1001098D8;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVActivationManager;
  v2 = -[SATVActivationManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    requests = v2->_requests;
    v2->_requests = v3;
  }

  return v2;
}

- (BOOL)isDeviceActivated
{
  return +[SATVActivator isDeviceActivated](&OBJC_CLASS___SATVActivator, "isDeviceActivated");
}

- (BOOL)isDeviceFactoryActivated
{
  return +[SATVActivator isDeviceFactoryActivated](&OBJC_CLASS___SATVActivator, "isDeviceFactoryActivated");
}

- (void)requestActivationWithNavigationController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_1000334F4();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received activation request", v10, 2u);
  }

  -[SATVActivationManager _requestActivationWithNavigationController:completionHandler:]( self,  "_requestActivationWithNavigationController:completionHandler:",  v7,  v6);
}

- (void)requestSilentActivationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000334F4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received silent activation request", v7, 2u);
  }

  -[SATVActivationManager _requestActivationWithNavigationController:completionHandler:]( self,  "_requestActivationWithNavigationController:completionHandler:",  0LL,  v4);
}

- (void)activator:(id)a3 didSucceedWithType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = sub_1000334F4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2048;
    unint64_t v12 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Activation did succeed for activator [%@]. Success type: %lu",  (uint8_t *)&v9,  0x16u);
  }

  -[SATVActivationManager _completeActivationRequestWithSuccessType:failureReason:error:]( self,  "_completeActivationRequestWithSuccessType:failureReason:error:",  a4,  0LL,  0LL);
}

- (void)activator:(id)a3 didFailWithError:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1000334F4();
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2048;
    int64_t v15 = a5;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Activation did fail for activator [%@]. Failure Reason: %lu, Error: %@",  (uint8_t *)&v12,  0x20u);
  }

  -[SATVActivationManager _completeActivationRequestWithSuccessType:failureReason:error:]( self,  "_completeActivationRequestWithSuccessType:failureReason:error:",  0LL,  a5,  v9);
}

- (void)_requestActivationWithNavigationController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___SATVActivationManagerRequest);
  -[SATVActivationManagerRequest setCompletionHandler:](v8, "setCompletionHandler:", v6);

  -[SATVActivationManagerRequest setNavigationController:](v8, "setNavigationController:", v7);
  id v9 = sub_1000334F4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Created activation request: %@",  (uint8_t *)&v12,  0xCu);
  }

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationManager requests](self, "requests"));
  [v11 addObject:v8];

  -[SATVActivationManager _startActivationRequestIfPossible](self, "_startActivationRequestIfPossible");
}

- (void)_startActivationRequestIfPossible
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SATVActivationManager activator](self, "activator"));
  if (v3)
  {
    id v4 = (SATVActivator *)v3;
    id v5 = sub_1000334F4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      __int16 v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Activation is currently in progress with activator: %@",  (uint8_t *)&v13,  0xCu);
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationManager requests](self, "requests"));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

    if (v6)
    {
      id v4 = objc_alloc_init(&OBJC_CLASS___SATVActivator);
      -[SATVActivationManager setActivator:](self, "setActivator:", v4);
      id v8 = sub_1000334F4();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        __int16 v14 = v6;
        __int16 v15 = 2112;
        __int16 v16 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Starting activation for request [%@] with activator [%@]",  (uint8_t *)&v13,  0x16u);
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s navigationController](v6, "navigationController"));
      -[SATVActivator setNavigationController:](v4, "setNavigationController:", v10);

      -[SATVActivator start](v4, "start");
    }

    else
    {
      id v11 = sub_1000334F4();
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No activation requests are pending. Nothing to do",  (uint8_t *)&v13,  2u);
      }

      id v4 = 0LL;
    }
  }
}

- (void)_completeActivationRequestWithSuccessType:(unint64_t)a3 failureReason:(int64_t)a4 error:(id)a5
{
  id v8 = a5;
  -[SATVActivationManager setActivator:](self, "setActivator:", 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationManager requests](self, "requests"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  [v9 removeObjectAtIndex:0];
  id v11 = sub_1000334F4();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    __int16 v15 = v10;
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    __int16 v18 = 2048;
    int64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Completing activation request [%@]. Success Type: %lu, Failure Reason: %lu, Error: %@",  (uint8_t *)&v14,  0x2Au);
  }

  int v13 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v10 completionHandler]);
  ((void (**)(void, unint64_t, int64_t, id))v13)[2](v13, a3, a4, v8);
  -[SATVActivationManager _startActivationRequestIfPossible](self, "_startActivationRequestIfPossible");
}

- (void)setActivator:(id)a3
{
  id v5 = (SATVActivator *)a3;
  activator = self->_activator;
  if (activator != v5)
  {
    id v7 = v5;
    -[SATVActivator setDelegate:](activator, "setDelegate:", 0LL);
    objc_storeStrong((id *)&self->_activator, a3);
    -[SATVActivator setDelegate:](self->_activator, "setDelegate:", self);
    id v5 = v7;
  }
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (SATVActivator)activator
{
  return self->_activator;
}

- (void).cxx_destruct
{
}

@end