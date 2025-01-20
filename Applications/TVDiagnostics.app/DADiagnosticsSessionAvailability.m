@interface DADiagnosticsSessionAvailability
- (BOOL)isInternalInstall;
- (id)getSessionID;
- (id)serialNumbers;
- (void)checkAvailabilityWithReply:(id)a3;
- (void)checkAvailabilityWithTicketNumber:(id)a3 response:(id)a4;
- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 exitWhenDone:(BOOL)a5 completion:(id)a6;
- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 exitWhenDone:(BOOL)a5 response:(id)a6;
- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 response:(id)a5;
@end

@implementation DADiagnosticsSessionAvailability

- (void)checkAvailabilityWithReply:(id)a3
{
  id v4 = a3;
  xpc_transaction_interrupt_clean_exit();
  objc_initWeak(&location, self);
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x3032000000LL;
  v12[3] = sub_100007974;
  v12[4] = sub_10000799C;
  id v13 = [v4 copy];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000079A4;
  v8[3] = &unk_10002C938;
  objc_copyWeak(&v11, &location);
  id v9 = v4;
  v10 = v12;
  id v7 = v4;
  dispatch_sync(v6, v8);

  objc_destroyWeak(&v11);
  _Block_object_dispose(v12, 8);

  objc_destroyWeak(&location);
}

- (void)checkAvailabilityWithTicketNumber:(id)a3 response:(id)a4
{
}

- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 response:(id)a5
{
}

- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 exitWhenDone:(BOOL)a5 response:(id)a6
{
  BOOL v6 = a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100007BF8;
  v11[3] = &unk_10002C960;
  id v12 = a6;
  id v10 = v12;
  -[DADiagnosticsSessionAvailability checkAvailabilityWithTicketNumber:timeout:exitWhenDone:completion:]( self,  "checkAvailabilityWithTicketNumber:timeout:exitWhenDone:completion:",  a3,  v6,  v11,  a4);
}

- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 exitWhenDone:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007CE4;
  block[3] = &unk_10002C9B0;
  block[4] = self;
  id v17 = v10;
  double v19 = a4;
  id v18 = v11;
  BOOL v20 = a5;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(v13, block);
}

- (id)getSessionID
{
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_1000082D8;
  double v19 = &unk_10002C9D8;
  v21 = &v22;
  v3 = dispatch_semaphore_create(0LL);
  BOOL v20 = v3;
  -[DADiagnosticsSessionAvailability checkAvailabilityWithTicketNumber:timeout:exitWhenDone:response:]( self,  "checkAvailabilityWithTicketNumber:timeout:exitWhenDone:response:",  0LL,  0LL,  &v16,  30.0);
  uint64_t v4 = DiagnosticLogHandleForCategory(0LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Waiting for response to availability check",  buf,  2u);
  }

  dispatch_time_t v6 = dispatch_time(0LL, 30000000000LL);
  uint64_t v7 = dispatch_semaphore_wait(v3, v6);
  uint64_t v8 = DiagnosticLogHandleForCategory(0LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *((unsigned __int8 *)v23 + 24);
    *(_DWORD *)buf = 134218240;
    uint64_t v26 = v7;
    __int16 v27 = 1024;
    int v28 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Finished waiting for response to availability check. timedOut: %ld validSession: %d",  buf,  0x12u);
  }

  if (*((_BYTE *)v23 + 24))
  {
    CFPreferencesAppSynchronize(@"com.apple.Diagnostics");
    id v11 = (void *)CFPreferencesCopyAppValue(@"InCurrentSession", @"com.apple.Diagnostics");
    else {
      id v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
    }
  }

  else
  {
    id v12 = 0LL;
  }

  uint64_t v13 = DiagnosticLogHandleForCategory(0LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = (uint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Session status: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v22, 8);
  return v12;
}

- (BOOL)isInternalInstall
{
  if (qword_10003A5F8 != -1) {
    dispatch_once(&qword_10003A5F8, &stru_10002C9F8);
  }
  return byte_10003A5F0;
}

- (id)serialNumbers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v3 = +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___DADeviceObserverLocal),  0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_autoreleasePoolPush();
  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[DADeviceObserverAggregator aggregatorWithObserverClasses:]( &OBJC_CLASS___DADeviceObserverAggregator,  "aggregatorWithObserverClasses:",  v4));
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v8 = DiagnosticLogHandleForCategory(10LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Discovering devices…", buf, 2u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000085E0;
  v15[3] = &unk_10002C7D0;
  id v10 = v2;
  id v16 = v10;
  dispatch_semaphore_t v17 = v7;
  id v11 = v7;
  [v6 discoverAllDevicesWithCompletionHandler:v15];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v5);
  uint64_t v12 = DiagnosticLogHandleForCategory(10LL);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Discovery complete, found: %@", buf, 0xCu);
  }

  return v10;
}

@end