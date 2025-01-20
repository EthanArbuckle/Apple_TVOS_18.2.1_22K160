@interface SDRPNearFieldController
+ (BOOL)isAvailable;
+ (id)supportedApplicationLabels;
- (BOOL)supportsApplicationLabel:(id)a3;
- (NSString)currentApplicationLabel;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearFieldController)nearFieldController;
- (SDRPNearFieldController)initWithDispatchQueue:(id)a3 delegate:(id)a4;
- (SDRPNearFieldControllerDelegate)delegate;
- (SDRPNearFieldTransaction)currentTransaction;
- (int64_t)currentPreferredPollingType;
- (void)invalidate;
- (void)invalidateTransaction:(id)a3 updatedPkData:(id)a4 bonjourListenerUUID:(id)a5;
- (void)setCurrentApplicationLabel:(id)a3;
- (void)startPolling:(int64_t)a3 applicationLabel:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6;
- (void)stop;
@end

@implementation SDRPNearFieldController

+ (BOOL)isAvailable
{
  return NSClassFromString(@"RPNearFieldController") != 0LL;
}

+ (id)supportedApplicationLabels
{
  if (qword_100656F08 != -1) {
    dispatch_once(&qword_100656F08, &stru_1005CCC30);
  }
  return (id)qword_100656F00;
}

- (BOOL)supportsApplicationLabel:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "supportedApplicationLabels");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned __int8 v8 = [v7 containsObject:v4];

  return v8;
}

- (SDRPNearFieldController)initWithDispatchQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SDRPNearFieldController;
  v9 = -[SDRPNearFieldController init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = airdrop_log(v9);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController init", v16, 2u);
    }

    objc_storeStrong((id *)&v10->_dispatchQueue, a3);
    v13 = -[RPNearFieldController initWithDispatchQueue:delegate:]( objc_alloc(&OBJC_CLASS___RPNearFieldController),  "initWithDispatchQueue:delegate:",  v7,  v8);
    nearFieldController = v10->_nearFieldController;
    v10->_nearFieldController = v13;
  }

  return v10;
}

- (SDRPNearFieldControllerDelegate)delegate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDRPNearFieldController nearFieldController](self, "nearFieldController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);

  return (SDRPNearFieldControllerDelegate *)v3;
}

- (int64_t)currentPreferredPollingType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDRPNearFieldController nearFieldController](self, "nearFieldController"));
  id v3 = [v2 currentPreferredPollingType];

  return (int64_t)v3;
}

- (NSString)currentApplicationLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDRPNearFieldController nearFieldController](self, "nearFieldController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentApplicationLabel]);

  return (NSString *)v3;
}

- (SDRPNearFieldTransaction)currentTransaction
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDRPNearFieldController nearFieldController](self, "nearFieldController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentTransaction]);

  return (SDRPNearFieldTransaction *)v3;
}

- (void)startPolling:(int64_t)a3 applicationLabel:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  uint64_t v13 = airdrop_log(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController start", v19, 2u);
  }

  id v15 = objc_alloc(&OBJC_CLASS___RPNearFieldContext);
  if ((objc_opt_respondsToSelector( v15,  "initWithApplicationLabel:supportedApplicationLabels:pkData:bonjourListenerUUID:") & 1) != 0)
  {
    id v16 = v15;
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue( +[SDRPNearFieldController supportedApplicationLabels]( &OBJC_CLASS___SDRPNearFieldController,  "supportedApplicationLabels"));
    id v18 = [v16 initWithApplicationLabel:v12 supportedApplicationLabels:v17 pkData:v10 bonjourListenerUUID:v11];
  }

  else
  {
    id v18 = [v15 initWithApplicationLabel:v12 pkData:v10 bonjourListenerUUID:v11];
  }

  -[SDRPNearFieldController setCurrentApplicationLabel:](self, "setCurrentApplicationLabel:", v12);

  -[RPNearFieldController startPolling:context:](self->_nearFieldController, "startPolling:context:", a3, v18);
}

- (void)stop
{
  uint64_t v4 = airdrop_log(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController stop", v6, 2u);
  }

  -[RPNearFieldController stop](self->_nearFieldController, "stop");
  -[SDRPNearFieldController setCurrentApplicationLabel:](self, "setCurrentApplicationLabel:", 0LL);
}

- (void)invalidate
{
  uint64_t v4 = airdrop_log(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController invalidate", v6, 2u);
  }

  -[RPNearFieldController invalidate](self->_nearFieldController, "invalidate");
  -[SDRPNearFieldController setCurrentApplicationLabel:](self, "setCurrentApplicationLabel:", 0LL);
}

- (void)invalidateTransaction:(id)a3 updatedPkData:(id)a4 bonjourListenerUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc(&OBJC_CLASS___RPNearFieldContext);
  if ((objc_opt_respondsToSelector( v11,  "initWithApplicationLabel:supportedApplicationLabels:pkData:bonjourListenerUUID:") & 1) != 0)
  {
    id v12 = v11;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SDRPNearFieldController currentApplicationLabel](self, "currentApplicationLabel"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[SDRPNearFieldController supportedApplicationLabels]( &OBJC_CLASS___SDRPNearFieldController,  "supportedApplicationLabels"));
    id v17 = [v12 initWithApplicationLabel:v13 supportedApplicationLabels:v14 pkData:v9 bonjourListenerUUID:v8];

    id v15 = v9;
    id v8 = (id)v14;
    id v9 = (id)v13;
  }

  else
  {
    nearFieldController = self->_nearFieldController;
    id v15 = v11;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldController currentApplicationLabel](nearFieldController, "currentApplicationLabel"));
    id v17 = [v15 initWithApplicationLabel:v12 pkData:v9 bonjourListenerUUID:v8];
  }

  -[RPNearFieldController invalidateTransaction:context:]( self->_nearFieldController,  "invalidateTransaction:context:",  v10,  v17);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setCurrentApplicationLabel:(id)a3
{
}

- (RPNearFieldController)nearFieldController
{
  return self->_nearFieldController;
}

- (void).cxx_destruct
{
}

@end