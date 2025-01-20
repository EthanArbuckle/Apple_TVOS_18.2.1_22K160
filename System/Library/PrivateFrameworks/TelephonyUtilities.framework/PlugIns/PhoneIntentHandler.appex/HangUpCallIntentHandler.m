@interface HangUpCallIntentHandler
- (HangUpCallIntentHandler)init;
- (TUCallCenter)callCenter;
- (void)confirmHangUpCall:(id)a3 completion:(id)a4;
- (void)handleHangUpCall:(id)a3 completion:(id)a4;
- (void)setCallCenter:(id)a3;
@end

@implementation HangUpCallIntentHandler

- (HangUpCallIntentHandler)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___HangUpCallIntentHandler;
  v2 = -[HangUpCallIntentHandler init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.TelephonyUtilities.PhoneIntentHandler.%@",  objc_opt_class(v2));
    id v5 = objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TUCallCenter callCenterWithQueue:](&OBJC_CLASS___TUCallCenter, "callCenterWithQueue:", v6));
    callCenter = v3->_callCenter;
    v3->_callCenter = (TUCallCenter *)v7;
  }

  return v3;
}

- (void)confirmHangUpCall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = IntentHandlerDefaultLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Confirming Siri request to hang up: %@",  buf,  0xCu);
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[HangUpCallIntentHandler callCenter](self, "callCenter"));
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 queue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001D398;
  v13[3] = &unk_100034938;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  dispatch_sync(v11, v13);
}

- (void)handleHangUpCall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = IntentHandlerDefaultLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Handling Siri request to hang up: %@",  buf,  0xCu);
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[HangUpCallIntentHandler callCenter](self, "callCenter"));
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 queue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001D5B8;
  v13[3] = &unk_100034938;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  dispatch_sync(v11, v13);
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end