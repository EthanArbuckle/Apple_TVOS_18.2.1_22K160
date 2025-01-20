@interface AKPiggybackAcceptingController
+ (BOOL)isInCircle;
- (AKConfiguration)configuration;
- (AKPiggybackAcceptingController)initWithPiggybackReporter:(id)a3;
- (BOOL)isDone;
- (KCJoiningAcceptSession)acceptSession;
- (id)_acceptSessionForPayload:(id)a3 error:(id *)a4;
- (id)_authKitAccountForPayload:(id)a3;
- (id)_generateSecret;
- (id)accountCode;
- (id)replyContextWithPayload:(id)a3;
- (id)secret;
- (int)verificationFailed:(id *)a3;
- (void)_checkForProximityIfNeededWithCircleStep:(unint64_t)a3 completion:(id)a4;
- (void)_checkForProximityWithCompletion:(id)a3;
- (void)_finishProcessingPushPayload:(id)a3 withReplyContext:(id)a4 completion:(id)a5;
- (void)_processProximityDetection:(BOOL)a3 withReplyContext:(id)a4 forPushPayload:(id)a5;
- (void)_startProximityControllerIfNeededWithPushPayload:(id)a3;
- (void)_startProximityControllerWithPresenceSID:(id)a3;
- (void)_stopProximityController;
- (void)processPushPayload:(id)a3 completion:(id)a4;
- (void)setAcceptSession:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation AKPiggybackAcceptingController

- (AKPiggybackAcceptingController)initWithPiggybackReporter:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AKPiggybackAcceptingController;
  v6 = -[AKPiggybackAcceptingController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_piggybackReporter, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
    configuration = v7->_configuration;
    v7->_configuration = (AKConfiguration *)v8;
  }

  return v7;
}

- (void)processPushPayload:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, void *))a4;
  objc_storeStrong((id *)&self->_lastPayload, a3);
  if ([v7 clientErrorCode])
  {
    if ([v7 clientErrorCode] == (id)-9004) {
      uint64_t v9 = -7003LL;
    }
    else {
      uint64_t v9 = -7001LL;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v9));
    v8[2](v8, 0LL, v12);
  }

  else
  {
    id v10 = [v7 circleStep];
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringValue]);

    self->_verificationFailed = 0;
    self->_verificationAttempts = 0LL;
    objc_storeStrong((id *)&self->_initiatingPayload, a3);
    if (self->_acceptSession)
    {
      uint64_t v14 = _AKLogSystem(v13);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Will tear down an existing piggybacking session",  buf,  2u);
      }
    }

    uint64_t v16 = _AKLogSystem(v13);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Starting a piggybacking session", buf, 2u);
    }

    uint64_t v18 = _AKSignpostLogSystem();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    os_signpost_id_t v20 = _AKSignpostCreate();
    uint64_t v22 = v21;

    uint64_t v23 = _AKSignpostLogSystem();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    v25 = v24;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 138543362;
      os_signpost_id_t v47 = (os_signpost_id_t)v12;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  v20,  "PiggyAcceptSessionForAcceptController",  " CircleStep=%{public,signpost.telemetry:string1,name=CircleStep}@  enableTelemetry=YES ",  buf,  0xCu);
    }

    uint64_t v26 = _AKSignpostLogSystem();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      os_signpost_id_t v47 = v20;
      __int16 v48 = 2114;
      double v49 = *(double *)&v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggyAcceptSessionForAcceptController  CircleStep=%{public,signpost.telemetry:string1,name=CircleS tep}@  enableTelemetry=YES ",  buf,  0x16u);
    }

    id v45 = 0LL;
    v28 = (KCJoiningAcceptSession *)objc_claimAutoreleasedReturnValue( -[AKPiggybackAcceptingController _acceptSessionForPayload:error:]( self,  "_acceptSessionForPayload:error:",  v7,  &v45));
    id v29 = v45;
    acceptSession = self->_acceptSession;
    self->_acceptSession = v28;

    unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v20, v22);
    uint64_t v32 = _AKSignpostLogSystem();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    v34 = v33;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      unsigned int v35 = [v29 code];
      *(_DWORD *)buf = 138543618;
      os_signpost_id_t v47 = (os_signpost_id_t)v12;
      __int16 v48 = 1026;
      LODWORD(v49) = v35;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v34,  OS_SIGNPOST_INTERVAL_END,  v20,  "PiggyAcceptSessionForAcceptController",  " CircleStep=%{public,signpost.telemetry:string2,name=CircleStep}@  Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x12u);
    }

    uint64_t v36 = _AKSignpostLogSystem();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v38 = [v29 code];
      *(_DWORD *)buf = 134218754;
      os_signpost_id_t v47 = v20;
      __int16 v48 = 2048;
      double v49 = (double)Nanoseconds / 1000000000.0;
      __int16 v50 = 2114;
      v51 = v12;
      __int16 v52 = 1026;
      unsigned int v53 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs:PiggyAcceptSessionForAcceptController  CircleStep=%{public,signpost.telemetry:string2,name=Circle Step}@  Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x26u);
    }

    if (v29)
    {
      uint64_t v40 = _AKLogSystem(v39);
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_10012C9F4();
      }

      v8[2](v8, 0LL, v29);
    }

    else
    {
LABEL_27:
      -[AKPiggybackAcceptingController _startProximityControllerIfNeededWithPushPayload:]( self,  "_startProximityControllerIfNeededWithPushPayload:",  v7);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_100011B94;
      v42[3] = &unk_1001C6878;
      v42[4] = self;
      id v43 = v7;
      v44 = v8;
      -[AKPiggybackAcceptingController _checkForProximityIfNeededWithCircleStep:completion:]( self,  "_checkForProximityIfNeededWithCircleStep:completion:",  v10,  v42);
    }
  }
}

- (void)_processProximityDetection:(BOOL)a3 withReplyContext:(id)a4 forPushPayload:(id)a5
{
  BOOL v6 = a3;
  uint64_t v8 = (AKPiggybackAcceptingController *)a4;
  id v9 = a5;
  uint64_t v10 = _AKLogSystem(v9);
  objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    if (v6) {
      v65 = @"YES";
    }
    else {
      v65 = @"NO";
    }
    *(_DWORD *)buf = 138413058;
    v72 = self;
    __int16 v73 = 2112;
    double v74 = *(double *)&v65;
    __int16 v75 = 2112;
    v76 = v8;
    __int16 v77 = 2112;
    id v78 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%@: Processing physical proximity detection (%@) with replyContext (%@) for pushPayload (%@)",  buf,  0x2Au);
  }

  v69 = v8;

  id v12 = [v9 presenceFallbackApproved];
  int v13 = AKConfigApplyOverride( -[AKConfiguration piggybackingIDMSPresenceOverride](self->_configuration, "piggybackingIDMSPresenceOverride"),  v12);
  v66 = self;
  uint64_t v14 = AKConfigApplyOverride( -[AKConfiguration piggybackingLocalPresenceOverride]( self->_configuration,  "piggybackingLocalPresenceOverride"),  v6);
  v68 = v9;
  id v15 = [v9 presenceMode];
  if ((_DWORD)v12) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  if (v6) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idmsPresence=%@, foundDevice=%@",  v16,  v17));
  if (v13) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  if ((_DWORD)v14) {
    os_signpost_id_t v20 = @"YES";
  }
  else {
    os_signpost_id_t v20 = @"NO";
  }
  v70 = (AKPiggybackAcceptingController *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"idmsPresence=%@, foundDevice=%@",  v19,  v20));
  uint64_t v21 = _AKSignpostLogSystem();
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  os_signpost_id_t v23 = _AKSignpostCreate();
  uint64_t v25 = v24;

  uint64_t v26 = _AKSignpostLogSystem();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  v28 = v27;
  unint64_t v29 = v23 - 1;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v72) = (_DWORD)v15;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v28,  OS_SIGNPOST_INTERVAL_BEGIN,  v23,  "PiggybackingProcessPressenceForAcceptController",  " PresenceMode=%{public,signpost.telemetry:number1,name=PresenceMode}d  enableTelemetry=YES ",  buf,  8u);
  }

  uint64_t v30 = _AKSignpostLogSystem();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v72 = (AKPiggybackAcceptingController *)v23;
    __int16 v73 = 1026;
    LODWORD(v74) = (_DWORD)v15;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggybackingProcessPressenceForAcceptController  PresenceMode=%{public,signpost.telemetry:number1,na me=PresenceMode}d  enableTelemetry=YES ",  buf,  0x12u);
  }

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v23, v25);
  uint64_t v33 = _AKSignpostLogSystem();
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  unsigned int v35 = v34;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_DWORD *)buf = 138543362;
    v72 = (AKPiggybackAcceptingController *)v18;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_EVENT,  v23,  "PiggybackingProcessPressenceForAcceptControllerResults",  " Results=%{public,signpost.telemetry:string1,name=Results}@ ",  buf,  0xCu);
  }

  uint64_t v36 = _AKSignpostLogSystem();
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v72 = (AKPiggybackAcceptingController *)v23;
    __int16 v73 = 2048;
    double v74 = (double)Nanoseconds / 1000000000.0;
    __int16 v75 = 2114;
    v76 = (AKPiggybackAcceptingController *)v18;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "EVENT [%lld] %fs:PiggybackingProcessPressenceForAcceptControllerResults  Results=%{public,signpost.telemetry:strin g1,name=Results}@ ",  buf,  0x20u);
  }

  uint64_t v38 = v13 | v14;

  unint64_t v39 = _AKSignpostGetNanoseconds(v23, v25);
  uint64_t v40 = _AKSignpostLogSystem();
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  v42 = v41;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_DWORD *)buf = 138543362;
    v72 = v70;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v42,  OS_SIGNPOST_EVENT,  v23,  "PiggybackingProcessPressenceForAcceptControllerResultsOverrides",  " Results=%{public,signpost.telemetry:string2,name=Results}@ ",  buf,  0xCu);
  }

  v67 = (void *)v18;

  uint64_t v43 = _AKSignpostLogSystem();
  v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v72 = (AKPiggybackAcceptingController *)v23;
    __int16 v73 = 2048;
    double v74 = (double)v39 / 1000000000.0;
    __int16 v75 = 2114;
    v76 = v70;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "EVENT [%lld] %fs:PiggybackingProcessPressenceForAcceptControllerResultsOverrides  Results=%{public,signpost.teleme try:string2,name=Results}@ ",  buf,  0x20u);
  }

  id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v38));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackAcceptingController payload](v69, "payload"));
  [v46 setPresenceCheckPassed:v45];

  os_signpost_id_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14));
  __int16 v48 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackAcceptingController payload](v69, "payload"));
  [v48 setLocalPresenceFound:v47];

  else {
    char v49 = v38;
  }
  if ((v49 & 1) == 0)
  {
    unint64_t v50 = _AKSignpostGetNanoseconds(v23, v25);
    uint64_t v51 = _AKSignpostLogSystem();
    __int16 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    unsigned int v53 = v52;
    if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v53,  OS_SIGNPOST_EVENT,  v23,  "ReportedEnforceModeFailure",  "",  buf,  2u);
    }

    uint64_t v54 = _AKSignpostLogSystem();
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v72 = (AKPiggybackAcceptingController *)v23;
      __int16 v73 = 2048;
      double v74 = (double)v50 / 1000000000.0;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "EVENT [%lld] %fs:ReportedEnforceModeFailure ",  buf,  0x16u);
    }

    uint64_t v57 = _AKLogSystem(v56);
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_10012CA54();
    }

    v66->_proximityFailed = 1;
  }

  unint64_t v59 = _AKSignpostGetNanoseconds(v23, v25);
  uint64_t v60 = _AKSignpostLogSystem();
  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  v62 = v61;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v72) = v38;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v62,  OS_SIGNPOST_INTERVAL_END,  v23,  "PiggybackingProcessPressenceForAcceptController",  " CheckPassed=%{public,signpost.telemetry:number2,name=CheckPassed}d ",  buf,  8u);
  }

  uint64_t v63 = _AKSignpostLogSystem();
  v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v72 = (AKPiggybackAcceptingController *)v23;
    __int16 v73 = 2048;
    double v74 = (double)v59 / 1000000000.0;
    __int16 v75 = 1026;
    LODWORD(v76) = v38;
    _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs:PiggybackingProcessPressenceForAcceptController  CheckPassed=%{public,signpost.telemetry:number2,na me=CheckPassed}d ",  buf,  0x1Cu);
  }
}

- (void)_finishProcessingPushPayload:(id)a3 withReplyContext:(id)a4 completion:(id)a5
{
  id v59 = a3;
  id v8 = a4;
  id v56 = a5;
  uint64_t v9 = _AKLogSystem(v56);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10012CC24((uint64_t)self, v59, v10);
  }

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v59 circleStep]));
  v58 = (void *)objc_claimAutoreleasedReturnValue([v11 stringValue]);

  uint64_t v12 = _AKSignpostLogSystem();
  int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  os_signpost_id_t v14 = _AKSignpostCreate();
  uint64_t v16 = v15;

  uint64_t v17 = _AKSignpostLogSystem();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 138543362;
    os_signpost_id_t v65 = (os_signpost_id_t)v58;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  v14,  "PiggyClientInfoForAcceptController",  " CircleStep=%{public,signpost.telemetry:string1,name=CircleStep}@  enableTelemetry=YES ",  buf,  0xCu);
  }

  uint64_t v20 = _AKSignpostLogSystem();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    os_signpost_id_t v65 = v14;
    __int16 v66 = 2114;
    double v67 = *(double *)&v58;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggyClientInfoForAcceptController  CircleStep=%{public,signpost.telemetry:string1,name=CircleStep}@ enableTelemetry=YES ",  buf,  0x16u);
  }

  acceptSession = self->_acceptSession;
  os_signpost_id_t v23 = (void *)objc_claimAutoreleasedReturnValue([v59 clientInfo]);
  id v63 = 0LL;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[KCJoiningAcceptSession processMessage:error:](acceptSession, "processMessage:error:", v23, &v63));
  id v25 = v63;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);
  [v26 setClientInfo:v24];

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v14, v16);
  uint64_t v28 = _AKSignpostLogSystem();
  unint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  uint64_t v30 = v29;
  if (v14 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v29))
  {
    unsigned int v31 = objc_msgSend(v25, "code", v56);
    *(_DWORD *)buf = 138543618;
    os_signpost_id_t v65 = (os_signpost_id_t)v58;
    __int16 v66 = 1026;
    LODWORD(v67) = v31;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_END,  v14,  "PiggyClientInfoForAcceptController",  " CircleStep=%{public,signpost.telemetry:string2,name=CircleStep}@  Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x12u);
  }

  uint64_t v32 = _AKSignpostLogSystem();
  uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v34 = [v25 code];
    *(_DWORD *)buf = 134218754;
    os_signpost_id_t v65 = v14;
    __int16 v66 = 2048;
    double v67 = (double)Nanoseconds / 1000000000.0;
    __int16 v68 = 2114;
    v69 = v58;
    __int16 v70 = 1026;
    unsigned int v71 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs:PiggyClientInfoForAcceptController  CircleStep=%{public,signpost.telemetry:string2,name=CircleStep} @  Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x26u);
  }

  uint64_t v36 = _AKLogSystem(v35);
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    sub_10012CB74((uint64_t *)&self->_acceptSession, v8, v37);
  }

  if (self->_verificationFailed)
  {
    self->_verificationFailed = 0;
    unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);
    [v39 setClientErrorCode:-9003];
  }

  else if (self->_proximityFailed)
  {
    uint64_t v40 = _AKLogSystem(v38);
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_10012CB14();
    }

    [v8 setWaitForReply:0];
    v42 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);
    [v42 setClientErrorCode:-9005];

    -[AKPiggybackAcceptingController _releaseAssertion](self, "_releaseAssertion");
  }

  else
  {
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 clientInfo]);
    BOOL v45 = v44 == 0LL;

    if (v45)
    {
      uint64_t v47 = _AKLogSystem(v46);
      __int16 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_10012CAB4();
      }

      [v8 setWaitForReply:0];
      char v49 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);
      [v49 setClientErrorCode:-9001];

      -[AKPiggybackAcceptingController _releaseAssertion](self, "_releaseAssertion");
    }
  }

  BOOL v50 = -[AKPiggybackAcceptingController isDone](self, "isDone", v56);
  if (v50)
  {
    uint64_t v51 = _AKLogSystem(v50);
    __int16 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Approver is reporting as done...", buf, 2u);
    }

    [v8 setWaitForReply:0];
    -[AKCAPiggybackReporter didFinishAccepting](self->_piggybackReporter, "didFinishAccepting");
  }

  objc_initWeak((id *)buf, self);
  unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue(+[AKPiggybackController sharedController](&OBJC_CLASS___AKPiggybackController, "sharedController"));
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_1000128F8;
  v60[3] = &unk_1001C68A0;
  objc_copyWeak(&v62, (id *)buf);
  id v54 = v57;
  id v61 = v54;
  id v55 = [v53 performCircleRequestWithContext:v8 completion:v60];

  objc_destroyWeak(&v62);
  objc_destroyWeak((id *)buf);
}

- (id)_acceptSessionForPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackAcceptingController _authKitAccountForPayload:](self, "_authKitAccountForPayload:", v6));
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10012CCC4(v7, v9);
  }

  uint64_t v10 = (objc_class *)sub_10002590C(0LL);
  if (v10) {
    uint64_t v10 = (objc_class *)sub_100025A28();
  }
  objc_super v11 = (KCJoiningAcceptAccountCircleDelegate *)objc_alloc_init(v10);
  circleDelegate = self->_circleDelegate;
  self->_circleDelegate = v11;

  if (sub_10002590C(0LL)) {
    id v13 = sub_100025C38();
  }
  else {
    id v13 = 0LL;
  }
  os_signpost_id_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 clientInfo]);
  uint64_t v15 = self->_circleDelegate;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 accountPropertyForKey:@"DSID"]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "sessionWithInitialMessage:secretDelegate:circleDelegate:dsid:error:",  v14,  self,  v15,  objc_msgSend(v16, "unsignedLongLongValue"),  a4));

  return v17;
}

- (id)replyContextWithPayload:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___AKCircleRequestContext);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 replyPayload]);
  -[AKCircleRequestContext setPayload:](v5, "setPayload:", v6);

  -[AKCircleRequestContext setWaitForReplyTimeout:](v5, "setWaitForReplyTimeout:", 1200.0);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKAppleIDPushHelperService sharedService](&OBJC_CLASS___AKAppleIDPushHelperService, "sharedService"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 publicAPSTokenString]);
  -[AKCircleRequestContext setPushToken:](v5, "setPushToken:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackAcceptingController _authKitAccountForPayload:](self, "_authKitAccountForPayload:", v4));
  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 hearbeatTokenForAccount:v9]);
    -[AKCircleRequestContext setHeartbeatTokenValue:](v5, "setHeartbeatTokenValue:", v11);
  }

  return v5;
}

- (id)_authKitAccountForPayload:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 altDSID]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 authKitAccountWithAltDSID:v5 error:0]);
  return v6;
}

+ (BOOL)isInCircle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v3 = [v2 isInCircle];

  return v3;
}

- (BOOL)isDone
{
  return -[KCJoiningAcceptSession isDone](self->_acceptSession, "isDone");
}

- (id)secret
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackAcceptingController _generateSecret](self, "_generateSecret"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAppleIDPushHelperService sharedService](&OBJC_CLASS___AKAppleIDPushHelperService, "sharedService"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v3 longLongValue]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestPayload responseMessage](self->_initiatingPayload, "responseMessage"));
  [v4 showPigCode:v5 withIncomingMessage:v6];

  return v3;
}

- (int)verificationFailed:(id *)a3
{
  self->_verificationFailed = 1;
  uint64_t v4 = _AKLogSystem(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_verificationAttempts));
    int v11 = 138412290;
    uint64_t v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Failed to verify requesting secret, attempts: %@",  (uint8_t *)&v11,  0xCu);
  }

  int64_t verificationAttempts = self->_verificationAttempts;
  BOOL v8 = verificationAttempts <= 1;
  if (verificationAttempts <= 1) {
    int64_t v9 = verificationAttempts + 1;
  }
  else {
    int64_t v9 = 0LL;
  }
  self->_int64_t verificationAttempts = v9;
  if (v8) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)accountCode
{
  uint64_t v5 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCodeGenerator generateLoginCode:]( &OBJC_CLASS___AKAppleIDCodeGenerator,  "generateLoginCode:",  &v5));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringValue]);

  return v3;
}

- (id)_generateSecret
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%06u",  arc4random_uniform(0xF423Fu));
}

- (void)_startProximityControllerIfNeededWithPushPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 circleStep];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 presenceSID]);
  id v7 = [v4 supportsPresence];
  int v8 = (int)v7;
  uint64_t v9 = _AKLogSystem(v7);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  int v11 = v10;
  if (v5 != (id)1 || !v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v13 = @"NO";
      int v15 = 138413058;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      if (v8) {
        id v13 = @"YES";
      }
      uint64_t v18 = v13;
      __int16 v19 = 2048;
      id v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%@: Determined proximity scanner should not be started (wantsPresence: %@, circleStep: %lu, presenceSID: %@)",  (uint8_t *)&v15,  0x2Au);
    }

    goto LABEL_13;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: Determined proximity scanner should be started",  (uint8_t *)&v15,  0xCu);
  }

  if (!v6)
  {
    uint64_t v14 = _AKLogSystem(v12);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10012CD5C();
    }
LABEL_13:

    goto LABEL_14;
  }

  -[AKPiggybackAcceptingController _startProximityControllerWithPresenceSID:]( self,  "_startProximityControllerWithPresenceSID:",  v6);
LABEL_14:
}

- (void)_startProximityControllerWithPresenceSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKSignpostLogSystem();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = _AKSignpostCreate();
  uint64_t v9 = v8;

  uint64_t v10 = _AKSignpostLogSystem();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "PiggybackingDetectPresenceForAcceptController",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v13 = _AKSignpostLogSystem();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = (AKPiggybackAcceptingController *)v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggybackingDetectPresenceForAcceptController  enableTelemetry=YES ",  buf,  0xCu);
  }

  v37[0] = 0LL;
  v37[1] = v37;
  v37[2] = 0x2020000000LL;
  char v38 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100013418;
  v36[3] = &unk_1001C68C8;
  v36[4] = v37;
  v36[5] = v7;
  v36[6] = v9;
  int v15 = objc_retainBlock(v36);
  objc_initWeak(&location, self);
  uint64_t v16 = -[AKProximityPiggybackEngine initWithPresenceSID:]( objc_alloc(&OBJC_CLASS___AKProximityPiggybackAcceptingEngine),  "initWithPresenceSID:",  v4);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100013594;
  v32[3] = &unk_1001C68F0;
  __int16 v17 = v15;
  id v33 = v17;
  objc_copyWeak(&v34, &location);
  -[AKProximityPiggybackAcceptingEngine setMatchHandler:](v16, "setMatchHandler:", v32);
  uint64_t v18 = -[AKFuture initWithMaxWait:description:]( objc_alloc(&OBJC_CLASS___AKFuture),  "initWithMaxWait:description:",  @"proximityDetected",  5.0);
  proximityDetected = self->_proximityDetected;
  self->_proximityDetected = v18;

  id v20 = -[AKProximityController initWithEngine:]( objc_alloc(&OBJC_CLASS___AKProximityController),  "initWithEngine:",  v16);
  proximityController = self->_proximityController;
  self->_proximityController = v20;

  uint64_t v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472LL;
  uint64_t v28 = sub_1000136A0;
  unint64_t v29 = &unk_1001C68F0;
  uint64_t v22 = v17;
  id v30 = v22;
  objc_copyWeak(&v31, &location);
  uint64_t v23 = _AKLogSystem(-[AKProximityController setInvalidationHandler:](self->_proximityController, "setInvalidationHandler:", &v26));
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = self->_proximityController;
    *(_DWORD *)buf = 138413058;
    uint64_t v40 = self;
    __int16 v41 = 2112;
    v42 = v25;
    __int16 v43 = 2160;
    uint64_t v44 = 1752392040LL;
    __int16 v45 = 2112;
    id v46 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@: Setting up proximity controller (%@) with presenceSID (%{mask.hash}@)",  buf,  0x2Au);
  }

  -[AKProximityController activate](self->_proximityController, "activate", v26, v27, v28, v29);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

  _Block_object_dispose(v37, 8);
}

- (void)_stopProximityController
{
}

- (void)_checkForProximityIfNeededWithCircleStep:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  proximityController = self->_proximityController;
  uint64_t v8 = _AKLogSystem(v6);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (a3 == 3 && proximityController)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Determined checking for proximity is needed",  buf,  0xCu);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100013934;
    v12[3] = &unk_1001C6918;
    id v13 = v6;
    -[AKPiggybackAcceptingController _checkForProximityWithCompletion:](self, "_checkForProximityWithCompletion:", v12);
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v11 = self->_proximityController;
      *(_DWORD *)buf = 138412802;
      int v15 = self;
      __int16 v16 = 2048;
      unint64_t v17 = a3;
      __int16 v18 = 2112;
      __int16 v19 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%@: Determined checking for proximity is not needed for circleStep (%lu) with controller (%@)",  buf,  0x20u);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)_checkForProximityWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKSignpostLogSystem();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = _AKSignpostCreate();
  uint64_t v9 = v8;

  uint64_t v10 = _AKSignpostLogSystem();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "PiggybackingCheckPresenceForAcceptController",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v13 = _AKSignpostLogSystem();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v23 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggybackingCheckPresenceForAcceptController  enableTelemetry=YES ",  buf,  0xCu);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  __int16 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100013AE4;
  v18[3] = &unk_1001C6940;
  os_signpost_id_t v20 = v7;
  uint64_t v21 = v9;
  v18[4] = self;
  id v19 = v4;
  id v17 = v4;
  dispatch_async(v16, v18);
}

- (KCJoiningAcceptSession)acceptSession
{
  return self->_acceptSession;
}

- (void)setAcceptSession:(id)a3
{
}

- (AKConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end