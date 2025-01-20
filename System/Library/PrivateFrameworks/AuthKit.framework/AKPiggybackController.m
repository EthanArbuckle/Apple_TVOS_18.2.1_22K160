@interface AKPiggybackController
+ (id)sharedController;
+ (void)tearDown;
- (BOOL)_hasPrimaryiCloudAccountForPayload:(id)a3;
- (BOOL)_processPendingCompletionsForPayload:(id)a3;
- (BOOL)shouldSuppressPushMessage:(id)a3;
- (double)_processingTimeOut;
- (id)_acceptingControllerForTransactionId:(id)a3;
- (id)performCircleRequestWithContext:(id)a3 completion:(id)a4;
- (id)serviceControllerForContext:(id)a3;
- (void)_displaySwitchWiFiAlert;
- (void)_processPiggybackPayload:(id)a3;
- (void)_processUIIfNeededForError:(id)a3 circleStep:(unint64_t)a4;
- (void)_removeAcceptingControllerForTransaction:(id)a3;
- (void)processPushMessage:(id)a3;
- (void)startRequestSessionWithController:(id)a3 completion:(id)a4;
@end

@implementation AKPiggybackController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A4560;
  block[3] = &unk_1001C8DA0;
  block[4] = a1;
  if (qword_10020F610 != -1) {
    dispatch_once(&qword_10020F610, block);
  }
  return (id)qword_10020F608;
}

+ (void)tearDown
{
  v3 = (id *)objc_claimAutoreleasedReturnValue(+[AKPiggybackController sharedController](&OBJC_CLASS___AKPiggybackController, "sharedController"));
  [v3[1] removeAllObjects];
  id v2 = v3[2];
  objc_sync_enter(v2);
  [v3[5] cancelAllOperations];
  [v3[5] waitUntilAllOperationsAreFinished];
  [v3[2] removeAllObjects];
  objc_sync_exit(v2);

  objc_storeWeak(v3 + 3, 0LL);
}

- (BOOL)shouldSuppressPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)700)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKCircleRequestPayload payloadWithMessage:]( &OBJC_CLASS___AKCircleRequestPayload,  "payloadWithMessage:",  v4));
    id v6 = objc_alloc_init(&OBJC_CLASS___AKAnisetteProvisioningController);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 anisetteDataWithError:0]);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 machineID]);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v7 machineID]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 serverMachineId]);
      self->_requiresHSA2Repair = [v9 isEqualToString:v10] ^ 1;
      p_requiresHSA2Repair = &self->_requiresHSA2Repair;
    }

    else
    {
      self->_requiresHSA2Repair = 0;
      p_requiresHSA2Repair = &self->_requiresHSA2Repair;
    }

    uint64_t v14 = _AKLogSystem(v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (*p_requiresHSA2Repair) {
        v16 = @"YES";
      }
      else {
        v16 = @"NO";
      }
      int v21 = 138412290;
      v22 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "HSA2 repair required: %@",  (uint8_t *)&v21,  0xCu);
    }

    if (!*p_requiresHSA2Repair && ![v5 clientErrorCode])
    {
      if (![v5 isAcceptingPayload]
        || (BOOL v18 = -[AKPiggybackController _hasPrimaryiCloudAccountForPayload:]( self,  "_hasPrimaryiCloudAccountForPayload:",  v5)))
      {
        BOOL v12 = 0;
        goto LABEL_14;
      }

      uint64_t v19 = _AKLogSystem(v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Suppressing piggybacking for non-primary iCloud accounts",  (uint8_t *)&v21,  2u);
      }
    }

    BOOL v12 = 1;
LABEL_14:

    goto LABEL_15;
  }

  BOOL v12 = 0;
LABEL_15:

  return v12;
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)700)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKCircleRequestPayload payloadWithMessage:]( &OBJC_CLASS___AKCircleRequestPayload,  "payloadWithMessage:",  v4));
    uint64_t v6 = _AKSignpostLogSystem(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    os_signpost_id_t v8 = _AKSignpostCreate();
    uint64_t v10 = v9;

    uint64_t v12 = _AKSignpostLogSystem(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = v13;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      int v30 = 67240192;
      LODWORD(v31) = [v5 circleStep];
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "PiggybackingProcessPushPayload",  " CircleStep=%{public,signpost.telemetry:number1,name=CircleStep}d  enableTelemetry=YES ",  (uint8_t *)&v30,  8u);
    }

    uint64_t v16 = _AKSignpostLogSystem(v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = [v5 circleStep];
      int v30 = 134218240;
      os_signpost_id_t v31 = v8;
      __int16 v32 = 1026;
      LODWORD(v33) = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggybackingProcessPushPayload  CircleStep=%{public,signpost.telemetry:number1,name=CircleStep}d enableTelemetry=YES ",  (uint8_t *)&v30,  0x12u);
    }

    if (([v5 isRequestingPayload] & 1) != 0
      || (BOOL v20 = -[AKPiggybackController _hasPrimaryiCloudAccountForPayload:]( self,  "_hasPrimaryiCloudAccountForPayload:",  v5))
      && !self->_requiresHSA2Repair)
    {
      -[AKPiggybackController _processPiggybackPayload:](self, "_processPiggybackPayload:", v5);
      int v19 = 1;
    }

    else
    {
      uint64_t v21 = _AKLogSystem(v20);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138412290;
        os_signpost_id_t v31 = (os_signpost_id_t)v5;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Suppressed payload: %@",  (uint8_t *)&v30,  0xCu);
      }

      int v19 = 0;
    }

    unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v8, v10);
    uint64_t v24 = _AKSignpostLogSystem(Nanoseconds);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      int v30 = 67240192;
      LODWORD(v31) = v19;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_END,  v8,  "PiggybackingProcessPushPayload",  " DidProcess=%{public,signpost.telemetry:number2,name=DidProcess}d ",  (uint8_t *)&v30,  8u);
    }

    uint64_t v28 = _AKSignpostLogSystem(v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 134218496;
      os_signpost_id_t v31 = v8;
      __int16 v32 = 2048;
      double v33 = (double)Nanoseconds / 1000000000.0;
      __int16 v34 = 1026;
      int v35 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs:PiggybackingProcessPushPayload  DidProcess=%{public,signpost.telemetry:number2,name=DidProcess}d ",  (uint8_t *)&v30,  0x1Cu);
    }
  }
}

- (void)_processPiggybackPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clientErrorCode];
  uint64_t v6 = _AKLogSystem(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 == (id)-9000LL)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Suppressing the circle error payload";
      uint64_t v10 = v7;
      uint32_t v11 = 2;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }

  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v47 = (os_signpost_id_t)v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We received a reply: %@", buf, 0xCu);
    }

    BOOL v12 = -[AKPiggybackController _processPendingCompletionsForPayload:]( self,  "_processPendingCompletionsForPayload:",  v4);
    if (v12)
    {
      uint64_t v13 = _AKLogSystem(v12);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v47 = (os_signpost_id_t)v4;
        uint64_t v9 = "Processed a pending reply with payload: %@";
        uint64_t v10 = v7;
        uint32_t v11 = 12;
        goto LABEL_9;
      }
    }

    else
    {
      id v14 = [v4 isAcceptingPayload];
      int v15 = (int)v14;
      uint64_t v16 = _AKLogSystem(v14);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      v7 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          os_signpost_id_t v47 = (os_signpost_id_t)v4;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Starting an accepting session with payload: %@",  buf,  0xCu);
        }

        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionId]);
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[AKPiggybackController _acceptingControllerForTransactionId:]( self,  "_acceptingControllerForTransactionId:",  v18));

        if (!v7)
        {
          uint64_t v20 = _AKLogSystem(v19);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10013FF7C();
          }
        }

        uint64_t v22 = _AKSignpostLogSystem(v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        os_signpost_id_t v24 = _AKSignpostCreate();
        uint64_t v26 = v25;

        uint64_t v28 = _AKSignpostLogSystem(v27);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        int v30 = v29;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          __int16 v32 = (objc_class *)objc_opt_class(v7, v31);
          double v33 = NSStringFromClass(v32);
          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          *(_DWORD *)buf = 138543362;
          os_signpost_id_t v47 = (os_signpost_id_t)v34;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_BEGIN,  v24,  "PiggybackingProcessPiggybackPayloadWithController",  " Class=%{public,signpost.telemetry:string1,name=Class}@  enableTelemetry=YES ",  buf,  0xCu);
        }

        uint64_t v36 = _AKSignpostLogSystem(v35);
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v39 = (objc_class *)objc_opt_class(v7, v38);
          v40 = NSStringFromClass(v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
          *(_DWORD *)buf = 134218242;
          os_signpost_id_t v47 = v24;
          __int16 v48 = 2114;
          v49 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggybackingProcessPiggybackPayloadWithController  Class=%{public,signpost.telemetry:string1,n ame=Class}@  enableTelemetry=YES ",  buf,  0x16u);
        }

        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_1000A4FA0;
        v42[3] = &unk_1001CA700;
        os_signpost_id_t v44 = v24;
        uint64_t v45 = v26;
        v42[4] = self;
        id v43 = v4;
        -[os_log_s processPushPayload:completion:](v7, "processPushPayload:completion:", v43, v42);
      }

      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        sub_10013FFA8();
      }
    }
  }
}

- (void)_displaySwitchWiFiAlert
{
  uint64_t v2 = _AKLogSystem(self);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100140070();
  }

  int v4 = MGGetBoolAnswer(@"wapi");
  id v5 = @"WIFI";
  if (v4) {
    id v5 = @"WLAN";
  }
  uint64_t v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_PBV2_WINDOWS_IP_MISMATCH_TITLE",  v6));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v7 value:&stru_1001D1450 table:@"Localizable"]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
  uint32_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"PBV2_WINDOWS_IP_MISMATCH_MSG" value:&stru_1001D1450 table:@"Localizable"]);

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_PBV2_WINDOWS_IP_MISMATCH_BUTTON_SETTINGS",  v6));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:v12 value:&stru_1001D1450 table:@"Localizable"]);

  int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"PBV2_WINDOWS_IP_MISMATCH_BUTTON_CANCEL" value:&stru_1001D1450 table:@"Localizable"]);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AKAlertHandler sharedInstance](&OBJC_CLASS___AKAlertHandler, "sharedInstance"));
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 notificationDictionaryWithTitle:v9 message:v11 defaultButton:v14 alternateButton:v16]);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AKAlertHandler sharedInstance](&OBJC_CLASS___AKAlertHandler, "sharedInstance"));
  [v19 showAlert:v18 primaryAction:&stru_1001CA720 altAction:&stru_1001CA740];
}

- (BOOL)_hasPrimaryiCloudAccountForPayload:(id)a3
{
  id v3 = a3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 altDSID]);

  LOBYTE(v3) = [v4 hasPrimaryiCloudAccountForAltDSID:v5];
  return (char)v3;
}

- (BOOL)_processPendingCompletionsForPayload:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionId]);

  if (v5)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000LL;
    char v15 = 0;
    piggybackingRequestQueue = (dispatch_queue_s *)self->_piggybackingRequestQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A56CC;
    block[3] = &unk_1001CA768;
    block[4] = self;
    id v10 = v4;
    uint32_t v11 = &v12;
    dispatch_sync(piggybackingRequestQueue, block);
    BOOL v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_acceptingControllerForTransactionId:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_1000A58C0;
  v17 = sub_1000A58D0;
  id v18 = 0LL;
  if (v4)
  {
    piggybackingRequestQueue = (dispatch_queue_s *)self->_piggybackingRequestQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A58D8;
    block[3] = &unk_1001C9158;
    uint64_t v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(piggybackingRequestQueue, block);

    BOOL v7 = (void *)v14[5];
  }

  else
  {
    BOOL v7 = 0LL;
  }

  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)_removeAcceptingControllerForTransaction:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    piggybackingRequestQueue = (dispatch_queue_s *)self->_piggybackingRequestQueue;
    block[1] = 3221225472LL;
    block[2] = sub_1000A5A1C;
    block[3] = &unk_1001C6538;
    block[4] = self;
    id v6 = v4;
    block[0] = _NSConcreteStackBlock;
    id v8 = v4;
    dispatch_sync(piggybackingRequestQueue, block);

    id v4 = v6;
  }
}

- (void)startRequestSessionWithController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_storeWeak((id *)&self->_requestingController, v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000A5ACC;
  v9[3] = &unk_1001C7640;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 initiatePiggybackingWithCompletion:v9];
}

- (id)serviceControllerForContext:(id)a3
{
  id v3 = a3;
  id v4 = -[AKPiggybackingRequestProvider initWithCircleContext:]( objc_alloc(&OBJC_CLASS___AKPiggybackingRequestProvider),  "initWithCircleContext:",  v3);

  id v5 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v4);
  return v5;
}

- (id)performCircleRequestWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "authkit/circle-request",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  uint64_t v10 = _AKLogSystem(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v92 = v8;
  v93 = self;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Starting circle request with context: %@",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKAppleIDPushHelperService sharedService](&OBJC_CLASS___AKAppleIDPushHelperService, "sharedService"));
  [v13 setEnableCriticalReliability:1];

  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472LL;
  v119[2] = sub_1000A65C8;
  v119[3] = &unk_1001C8950;
  id v91 = v7;
  id v120 = v91;
  v94 = objc_retainBlock(v119);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 transactionId]);
  LODWORD(v13) = v15 == 0LL;

  if ((_DWORD)v13)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7056LL));
    ((void (*)(void *, void, void *))v94[2])(v94, 0LL, v28);
    uint64_t v31 = 0LL;
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 pushToken]);
    BOOL v17 = v16 == 0LL;

    if (!v17) {
      goto LABEL_8;
    }
    uint64_t v19 = _AKLogSystem(v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Populating push token", (uint8_t *)&buf, 2u);
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDPushHelperService sharedService]( &OBJC_CLASS___AKAppleIDPushHelperService,  "sharedService"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 publicAPSTokenString]);
    [v6 setPushToken:v22];

    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 pushToken]);
    LODWORD(v21) = v23 == 0LL;

    if ((_DWORD)v21)
    {
      uint64_t v81 = _AKLogSystem(v24);
      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        sub_1001400F4();
      }

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7056LL));
      ((void (*)(void *, void, void *))v94[2])(v94, 0LL, v28);
      uint64_t v31 = 0LL;
    }

    else
    {
LABEL_8:
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 authContext]);
      unsigned int v26 = [v25 piggybackingForTrustedDevice];

      if (v26)
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
        [v27 setPiggybackingContext:1];
      }

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackController serviceControllerForContext:](self, "serviceControllerForContext:", v6));
      if ([v6 waitForReply])
      {
        [v6 waitForReplyTimeout];
        if (v29 <= 0.0) {
          -[AKPiggybackController _processingTimeOut](self, "_processingTimeOut");
        }
        else {
          [v6 waitForReplyTimeout];
        }
        uint64_t v32 = v30;
        uint64_t v33 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
        __int16 v34 = objc_alloc_init(&OBJC_CLASS___NSCondition);
        uint64_t v35 = objc_opt_new(&OBJC_CLASS___AKPiggybackReplyWaiter);
        -[AKPiggybackReplyWaiter setCondition:](v35, "setCondition:", v34);
        piggybackingRequestQueue = (dispatch_queue_s *)v93->_piggybackingRequestQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000A669C;
        block[3] = &unk_1001C6510;
        block[4] = v93;
        id v37 = v6;
        id v117 = v37;
        uint64_t v38 = v35;
        v118 = v38;
        dispatch_sync(piggybackingRequestQueue, block);
        uint64_t v40 = _AKLogSystem(v39);
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        v87 = v38;
        v89 = (void *)v33;
        v85 = v34;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Waiting for reply with timeout: %f",  (uint8_t *)&buf,  0xCu);
        }

        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v127 = 0x3032000000LL;
        v128 = sub_1000A58C0;
        v129 = sub_1000A58D0;
        id v130 = 0LL;
        uint64_t v31 = objc_opt_new(&OBJC_CLASS___NSBlockOperation);
        objc_initWeak(&location, v31);
        v42 = objc_alloc(&OBJC_CLASS___AKCAPiggybackReporter);
        id v43 = (void *)objc_claimAutoreleasedReturnValue([v37 payload]);
        os_signpost_id_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 transactionId]);
        v84 = -[AKCAPiggybackReporter initWithRequestID:](v42, "initWithRequestID:", v44);

        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v37 payload]);
        v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v45 circleStep]));
        os_signpost_id_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 stringValue]);

        uint64_t v49 = _AKSignpostLogSystem(v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        v51 = (char *)_AKSignpostCreate();
        v53 = v52;

        uint64_t v55 = _AKSignpostLogSystem(v54);
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        v57 = v56;
        if ((unint64_t)(v51 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
        {
          v58 = (char *)objc_claimAutoreleasedReturnValue([v37 payload]);
          *(_DWORD *)v122 = 138543362;
          v123 = v58;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v57,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v51,  "PiggyCircleRequest",  " Payload=%{public,signpost.telemetry:string1,name=Payload}@  enableTelemetry=YES ",  v122,  0xCu);
        }

        uint64_t v60 = _AKSignpostLogSystem(v59);
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue([v37 payload]);
          *(_DWORD *)v122 = 134218242;
          v123 = v51;
          __int16 v124 = 2114;
          id v125 = v62;
          _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggyCircleRequest  Payload=%{public,signpost.telemetry:string1,name=Payload}@  enableTelemetry=YES ",  v122,  0x16u);
        }

        v104[0] = _NSConcreteStackBlock;
        v104[1] = 3221225472LL;
        v104[2] = sub_1000A6700;
        v104[3] = &unk_1001CA7D0;
        id v63 = v37;
        id v105 = v63;
        objc_copyWeak(v114, &location);
        v64 = v85;
        v106 = v64;
        p___int128 buf = &buf;
        v88 = v87;
        v107 = v88;
        id v86 = v89;
        id v108 = v86;
        v109 = v93;
        v114[1] = v51;
        v114[2] = v53;
        v65 = v47;
        id v110 = v65;
        v66 = v94;
        id v112 = v66;
        v90 = v84;
        v111 = v90;
        -[NSBlockOperation addExecutionBlock:](v31, "addExecutionBlock:", v104);
        uint64_t v67 = _AKSignpostLogSystem(-[NSOperationQueue addOperation:](v93->_circleRequestProcessingQueue, "addOperation:", v31));
        v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
        os_signpost_id_t v69 = _AKSignpostCreate();
        uint64_t v71 = v70;

        uint64_t v73 = _AKSignpostLogSystem(v72);
        v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
        v75 = v74;
        if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
        {
          *(_DWORD *)v122 = 138543362;
          v123 = v65;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v75,  OS_SIGNPOST_INTERVAL_BEGIN,  v69,  "PiggyExecuteRequest",  " CircleStep=%{public,signpost.telemetry:string1,name=CircleStep}@  enableTelemetry=YES ",  v122,  0xCu);
        }

        uint64_t v77 = _AKSignpostLogSystem(v76);
        v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v122 = 134218242;
          v123 = (char *)v69;
          __int16 v124 = 2114;
          id v125 = v65;
          _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggyExecuteRequest  CircleStep=%{public,signpost.telemetry:string1,name=CircleStep}@  enableTelemetry=YES ",  v122,  0x16u);
        }

        v95[0] = _NSConcreteStackBlock;
        v95[1] = 3221225472LL;
        v95[2] = sub_1000A71F4;
        v95[3] = &unk_1001CA7F8;
        os_signpost_id_t v102 = v69;
        uint64_t v103 = v71;
        v79 = v65;
        v96 = v79;
        v101 = &buf;
        id v97 = v63;
        v98 = v93;
        v80 = v64;
        v99 = v80;
        v100 = v66;
        [v28 executeRequestWithCompletion:v95];

        objc_destroyWeak(v114);
        objc_destroyWeak(&location);
        _Block_object_dispose(&buf, 8);
      }

      else
      {
        [v28 executeRequestWithCompletion:&stru_1001CA7A8];
        ((void (*)(void *, void, void))v94[2])(v94, 0LL, 0LL);
        uint64_t v31 = 0LL;
      }
    }
  }

  os_activity_scope_leave(&state);
  return v31;
}

- (void)_processUIIfNeededForError:(id)a3 circleStep:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 1)
  {
    uint64_t v8 = _AKLogSystem(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1001401AC();
    }

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    id v13 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:AKCircleClientErrorCode]);
    if ((objc_opt_isKindOfClass(v13, v11) & 1) != 0) {
      id v14 = v13;
    }
    else {
      id v14 = 0LL;
    }

    id v15 = [v14 integerValue];
    if (v15 == (id)-27955LL) {
      -[AKPiggybackController _displaySwitchWiFiAlert](self, "_displaySwitchWiFiAlert");
    }
  }
}

- (double)_processingTimeOut
{
  return 120.0;
}

- (void).cxx_destruct
{
}

@end