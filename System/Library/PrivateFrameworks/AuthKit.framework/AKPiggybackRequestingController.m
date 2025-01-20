@interface AKPiggybackRequestingController
- (AKAppleIDAuthenticationContext)initiatingContext;
- (AKAuthenticationServerResponse)initialAuthResponse;
- (AKPiggybackRequestingController)initWithServerResponse:(id)a3 andDelegate:(id)a4 piggybackReporter:(id)a5;
- (AKPiggybackRequestingControllerDelegate)delegate;
- (AKProximityController)proximityController;
- (BOOL)_shouldContinueProcessing:(id *)a3;
- (BOOL)isDone;
- (BOOL)processAccountCode:(id)a3 error:(id *)a4;
- (BOOL)unitTestContext;
- (KCJoiningRequestSecretSession)requestSession;
- (NSDictionary)authResults;
- (NSError)escapeHatchError;
- (NSError)escapeHatchTrigger;
- (NSNumber)capturedCode;
- (NSString)initiatingPassword;
- (double)initialHandshakeTimeout;
- (id)_capturedCodeString;
- (id)contextWithIncomingPayload:(id)a3;
- (id)idmsData;
- (id)secret;
- (id)verificationFailed:(BOOL)a3;
- (void)_cacheSecondFactor:(id)a3 codeCaptureError:(id)a4;
- (void)_clearCaptureState;
- (void)_clearSessionState;
- (void)_deliverPushPayload:(id)a3 attachDuplexSession:(BOOL)a4 completion:(id)a5;
- (void)_deliverPushPayload:(id)a3 completion:(id)a4;
- (void)_handleVerificationError:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)_initiatePiggybackingWithCleanSession:(BOOL)a3 withCompletion:(id)a4;
- (void)_processCachedUserInputWithContext:(id)a3 completion:(id)a4;
- (void)_processCodeEntryErrorWithContext:(id)a3 completion:(id)a4;
- (void)_processHandshakeWithContext:(id)a3 handshakeReply:(id)a4 andHandshakeError:(id)a5 withCompletion:(id)a6;
- (void)_promptForSecretWithContext:(id)a3 completion:(id)a4;
- (void)_sendDeviceCancelledReplyWithContext:(id)a3;
- (void)_startProximityControllerIfNeededWithPushPayload:(id)a3;
- (void)_startProximityControllerWithPresenceSID:(id)a3;
- (void)_stopProximityController;
- (void)_stopProximityControllerIfNeededWithPushPayload:(id)a3;
- (void)initiatePiggybackingWithCompletion:(id)a3;
- (void)processPushPayload:(id)a3 completion:(id)a4;
- (void)replyWithContext:(id)a3 withCompletion:(id)a4;
- (void)setAuthResults:(id)a3;
- (void)setCapturedCode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEscapeHatchError:(id)a3;
- (void)setEscapeHatchTrigger:(id)a3;
- (void)setInitialHandshakeTimeout:(double)a3;
- (void)setInitiatingContext:(id)a3;
- (void)setInitiatingPassword:(id)a3;
- (void)setProximityController:(id)a3;
- (void)setRequestSession:(id)a3;
- (void)setUnitTestContext:(BOOL)a3;
@end

@implementation AKPiggybackRequestingController

- (AKPiggybackRequestingController)initWithServerResponse:(id)a3 andDelegate:(id)a4 piggybackReporter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AKPiggybackRequestingController;
  v12 = -[AKPiggybackRequestingController init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v13->_initialAuthResponse, a3);
    objc_storeStrong((id *)&v13->_piggybackReporter, a5);
    v13->_initialHandshakeTimeout = 600.0;
    v13->_unitTestContext = 0;
    v13->_retryCount = 0LL;
  }

  return v13;
}

- (void)initiatePiggybackingWithCompletion:(id)a3
{
}

- (void)_initiatePiggybackingWithCleanSession:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = _AKSignpostLogSystem(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  os_signpost_id_t v9 = _AKSignpostCreate();
  uint64_t v11 = v10;

  uint64_t v13 = _AKSignpostLogSystem(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  objc_super v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v4;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "PiggybackingRequestingInitiateSession",  " CleanSession=%{public,signpost.telemetry:number1,name=CleanSession}d  enableTelemetry=YES ",  buf,  8u);
  }

  uint64_t v17 = _AKSignpostLogSystem(v16);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggybackingRequestingInitiateSession  CleanSession=%{public,signpost.telemetry:number1,name=CleanSe ssion}d  enableTelemetry=YES ",  buf,  0x12u);
  }

  if (!v6) {
    sub_1001353C8();
  }
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472LL;
  v98[2] = sub_1000542C8;
  v98[3] = &unk_1001C8A18;
  os_signpost_id_t v100 = v9;
  uint64_t v101 = v11;
  id v70 = v6;
  id v99 = v70;
  v71 = objc_retainBlock(v98);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController initialAuthResponse](self, "initialAuthResponse"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 transactionId]);
  v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%lu",  v20,  self->_retryCount));

  uint64_t v22 = _AKLogSystem(v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v72;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Initiating a piggybacking flow for transaction id: %@",  buf,  0xCu);
  }

  if (v4) {
    id v24 = -[AKPiggybackRequestingController _clearSessionState](self, "_clearSessionState");
  }
  uint64_t v25 = _AKSignpostLogSystem(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  os_signpost_id_t v27 = _AKSignpostCreate();
  uint64_t v29 = v28;

  uint64_t v31 = _AKSignpostLogSystem(v30);
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  v33 = v32;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_INTERVAL_BEGIN,  v27,  "PiggyInitialMessageData",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v35 = _AKSignpostLogSystem(v34);
  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggyInitialMessageData  enableTelemetry=YES ",  buf,  0xCu);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController requestSession](self, "requestSession"));
  id v97 = 0LL;
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 initialMessage:&v97]);
  id v39 = v97;

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v27, v29);
  uint64_t v41 = _AKSignpostLogSystem(Nanoseconds);
  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  v43 = v42;
  if (v27 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v42))
  {
    unsigned int v44 = [v39 code];
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v44;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v43,  OS_SIGNPOST_INTERVAL_END,  v27,  "PiggyInitialMessageData",  " Error=%{public,signpost.telemetry:number1,name=Error}d ",  buf,  8u);
  }

  uint64_t v46 = _AKSignpostLogSystem(v45);
  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v48 = [v39 code];
    *(_DWORD *)buf = 134218496;
    *(void *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (double)Nanoseconds / 1000000000.0;
    *(_WORD *)&buf[22] = 1026;
    LODWORD(v103) = v48;
    _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs:PiggyInitialMessageData  Error=%{public,signpost.telemetry:number1,name=Error}d ",  buf,  0x1Cu);
  }

  if (v38)
  {
    v49 = objc_opt_new(&OBJC_CLASS___AKCircleRequestPayload);
    -[AKCircleRequestPayload setClientInfo:](v49, "setClientInfo:", v38);
    -[AKCircleRequestPayload setTransactionId:](v49, "setTransactionId:", v72);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController initialAuthResponse](self, "initialAuthResponse"));
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 altDSID]);
    -[AKCircleRequestPayload setAltDSID:](v49, "setAltDSID:", v51);

    v52 = (void *)objc_claimAutoreleasedReturnValue( -[AKPiggybackRequestingController contextWithIncomingPayload:]( self,  "contextWithIncomingPayload:",  v49));
    v53 = objc_alloc_init(&OBJC_CLASS___NSCondition);
    v95[0] = 0LL;
    v95[1] = v95;
    v95[2] = 0x2020000000LL;
    char v96 = 0;
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v103 = sub_10005446C;
    v104 = sub_10005447C;
    id v105 = 0LL;
    v93[0] = 0LL;
    v93[1] = v93;
    v93[2] = 0x3032000000LL;
    v93[3] = sub_10005446C;
    v93[4] = sub_10005447C;
    id v94 = 0LL;
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_100054484;
    v90[3] = &unk_1001C6510;
    v90[4] = self;
    id v54 = v52;
    id v91 = v54;
    v55 = v53;
    v92 = v55;
    v56 = objc_retainBlock(v90);
    v57 = v56;
    if (self->_unitTestContext)
    {
      dispatch_time_t v58 = dispatch_time(0LL, 1000000000LL);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
      v60 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100054578;
      block[3] = &unk_1001C78D0;
      id v89 = v57;
      dispatch_after(v58, v60, block);
    }

    else
    {
      ((void (*)(void *))v56[2])(v56);
    }

    objc_msgSend(v54, "set_notifyOfTimeout:", 0);
    [v54 setWaitForReplyTimeout:self->_initialHandshakeTimeout];
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[AKPiggybackController sharedController](&OBJC_CLASS___AKPiggybackController, "sharedController"));
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472LL;
    v83[2] = sub_100054584;
    v83[3] = &unk_1001C8A40;
    v83[4] = self;
    v62 = v55;
    v84 = v62;
    v85 = v95;
    v86 = buf;
    v87 = v93;
    v63 = (void *)objc_claimAutoreleasedReturnValue([v61 performCircleRequestWithContext:v54 completion:v83]);

    dispatch_queue_global_t v64 = dispatch_get_global_queue(17LL, 0LL);
    v65 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v64);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472LL;
    v73[2] = sub_1000547E4;
    v73[3] = &unk_1001C8A68;
    v74 = v62;
    v75 = self;
    v80 = v95;
    id v77 = v54;
    id v78 = v57;
    id v76 = v63;
    v81 = buf;
    v82 = v93;
    v79 = v71;
    id v66 = v54;
    id v67 = v63;
    id v68 = v57;
    v69 = v62;
    dispatch_async(v65, v73);

    _Block_object_dispose(v93, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v95, 8);
  }

  else
  {
    ((void (*)(void *, void, id))v71[2])(v71, 0LL, v39);
  }
}

- (void)_processHandshakeWithContext:(id)a3 handshakeReply:(id)a4 andHandshakeError:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, NSDictionary *, NSError *))a6;
  uint64_t v14 = _AKLogSystem(v13);
  objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Starting to process handshake results",  buf,  2u);
  }

  if (self->_authResults)
  {
    uint64_t v17 = _AKLogSystem(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      v13[2](v13, self->_authResults, self->_escapeHatchError);
      goto LABEL_8;
    }

    *(_WORD *)buf = 0;
    v19 = "We got results, finish the flow";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    goto LABEL_7;
  }

  if (self->_escapeHatchError)
  {
    uint64_t v20 = _AKLogSystem(v16);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "User elected to escape before handshake completed",  buf,  2u);
    }

    id v22 = -[NSError ak_isUserTryAgainError](self->_escapeHatchError, "ak_isUserTryAgainError");
    if ((_DWORD)v22)
    {
      ++self->_retryCount;
      -[AKPiggybackRequestingController _initiatePiggybackingWithCleanSession:withCompletion:]( self,  "_initiatePiggybackingWithCleanSession:withCompletion:",  1LL,  v13);
      goto LABEL_8;
    }

    uint64_t v29 = _AKLogSystem(v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v19 = "We did not capture a code, completing with escape results";
    goto LABEL_6;
  }

  uint64_t v23 = _AKLogSystem(v16);
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v25)
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v12;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Handshake failed with error: %@", buf, 0xCu);
    }

    uint64_t v26 = AKAppleIDAuthenticationErrorDomain;
    NSErrorUserInfoKey v38 = NSUnderlyingErrorKey;
    id v39 = v12;
    os_signpost_id_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  -7063LL,  v27));

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100054E70;
    v34[3] = &unk_1001C6E88;
    v34[4] = self;
    id v35 = v10;
    id v36 = v12;
    v37 = v13;
    -[AKPiggybackRequestingController _handleVerificationError:withContext:completion:]( self,  "_handleVerificationError:withContext:completion:",  v28,  v35,  v34);
  }

  else
  {
    if (v25)
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Code collected, starting to wait for: %@",  buf,  0xCu);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100054E84;
    v30[3] = &unk_1001C8A90;
    v30[4] = self;
    id v31 = v10;
    id v32 = v11;
    v33 = v13;
    -[AKPiggybackRequestingController processPushPayload:completion:](self, "processPushPayload:completion:", v32, v30);
  }

- (void)_clearSessionState
{
  uint64_t v3 = _AKLogSystem(self);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing requesting controller state", v7, 2u);
  }

  requestSession = self->_requestSession;
  self->_requestSession = 0LL;

  escapeHatchError = self->_escapeHatchError;
  self->_escapeHatchError = 0LL;

  -[AKPiggybackRequestingController _clearCaptureState](self, "_clearCaptureState");
}

- (void)processPushPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKSignpostLogSystem(v7);
  os_signpost_id_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = _AKSignpostCreate();
  uint64_t v12 = v11;

  uint64_t v14 = _AKSignpostLogSystem(v13);
  objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = v15;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v43) = [v6 circleStep];
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "PiggybackingRequestingProcessPushPayload",  " CircleStep=%{public,signpost.telemetry:number1,name=CircleStep}d  enableTelemetry=YES ",  buf,  8u);
  }

  uint64_t v18 = _AKSignpostLogSystem(v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v20 = [v6 circleStep];
    *(_DWORD *)buf = 134218240;
    os_signpost_id_t v43 = v10;
    __int16 v44 = 1026;
    unsigned int v45 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggybackingRequestingProcessPushPayload  CircleStep=%{public,signpost.telemetry:number1,name=Circle Step}d  enableTelemetry=YES ",  buf,  0x12u);
  }

  if (!v7) {
    sub_1001353F0();
  }
  uint64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue([v6 serverInfo]);
  latestIDMSData = self->_latestIDMSData;
  self->_latestIDMSData = v21;

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 replyPayload]);
  id v24 = (AKCircleRequestContext *)objc_claimAutoreleasedReturnValue( -[AKPiggybackRequestingController contextWithIncomingPayload:]( self,  "contextWithIncomingPayload:",  v23));
  currentReplyContext = self->_currentReplyContext;
  self->_currentReplyContext = v24;

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100055348;
  v38[3] = &unk_1001C8AB8;
  os_signpost_id_t v40 = v10;
  uint64_t v41 = v12;
  id v26 = v7;
  id v39 = v26;
  os_signpost_id_t v27 = objc_retainBlock(v38);
  -[AKPiggybackRequestingController _startProximityControllerIfNeededWithPushPayload:]( self,  "_startProximityControllerIfNeededWithPushPayload:",  v6);
  -[AKPiggybackRequestingController _stopProximityControllerIfNeededWithPushPayload:]( self,  "_stopProximityControllerIfNeededWithPushPayload:",  v6);
  if ([v6 clientErrorCode])
  {
    if ([v6 clientErrorCode] == (id)-9005)
    {
      uint64_t v28 = _AKLogSystem(-9005LL);
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100135418();
      }

      -[AKPiggybackRequestingController _deliverPushPayload:attachDuplexSession:completion:]( self,  "_deliverPushPayload:attachDuplexSession:completion:",  v6,  0LL,  v27);
    }

    else
    {
      if ([v6 clientErrorCode] == (id)-9003) {
        uint64_t v30 = -7036LL;
      }
      else {
        uint64_t v30 = -7001LL;
      }
      id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v30));
      id v32 = self->_currentReplyContext;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_1000554D8;
      v34[3] = &unk_1001C6E88;
      v34[4] = self;
      id v35 = v31;
      id v36 = v6;
      v37 = v27;
      id v33 = v31;
      -[AKPiggybackRequestingController _handleVerificationError:withContext:completion:]( self,  "_handleVerificationError:withContext:completion:",  v33,  v32,  v34);
    }
  }

  else
  {
    -[AKPiggybackRequestingController _deliverPushPayload:completion:](self, "_deliverPushPayload:completion:", v6, v27);
  }
}

- (void)_deliverPushPayload:(id)a3 completion:(id)a4
{
}

- (void)_deliverPushPayload:(id)a3 attachDuplexSession:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, BOOL, void *))a5;
  uint64_t v9 = _AKLogSystem(v8);
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting to process request message", buf, 2u);
  }

  uint64_t v12 = _AKLogSystem(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1001355B0(self, v7);
  }

  uint64_t v15 = _AKSignpostLogSystem(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  os_signpost_id_t v17 = _AKSignpostCreate();
  uint64_t v19 = v18;

  uint64_t v21 = _AKSignpostLogSystem(v20);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = v22;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "PiggyClientInfoForRequestController",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v25 = _AKSignpostLogSystem(v24);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v85 = (AKPiggybackRequestingController *)v17;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggyClientInfoForRequestController  enableTelemetry=YES ",  buf,  0xCu);
  }

  os_signpost_id_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController requestSession](self, "requestSession"));
  v79 = v7;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v7 clientInfo]);
  id v81 = 0LL;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v27 processMessage:v28 error:&v81]);
  id v30 = v81;
  p_currentReplyContext = &self->_currentReplyContext;
  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_currentReplyContext, "payload"));
  [v32 setClientInfo:v29];

  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v17, v19);
  uint64_t v34 = _AKSignpostLogSystem(Nanoseconds);
  id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  id v36 = v35;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    unsigned int v37 = [v30 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v85) = v37;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_INTERVAL_END,  v17,  "PiggyClientInfoForRequestController",  " Error=%{public,signpost.telemetry:number1,name=Error}d ",  buf,  8u);
  }

  uint64_t v39 = _AKSignpostLogSystem(v38);
  os_signpost_id_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v41 = [v30 code];
    *(_DWORD *)buf = 134218496;
    v85 = (AKPiggybackRequestingController *)v17;
    __int16 v86 = 2048;
    double v87 = (double)Nanoseconds / 1000000000.0;
    __int16 v88 = 1026;
    unsigned int v89 = v41;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs:PiggyClientInfoForRequestController  Error=%{public,signpost.telemetry:number1,name=Error}d ",  buf,  0x1Cu);
  }

  uint64_t v43 = _AKLogSystem(v42);
  __int16 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
    sub_10013550C(self, (id *)&self->_currentReplyContext);
  }

  BOOL v45 = -[AKPiggybackRequestingController isDone](self, "isDone");
  if (v45)
  {
    uint64_t v46 = _AKLogSystem(v45);
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Requesting session indicated that we are DONE",  buf,  2u);
    }

    id v80 = 0LL;
    BOOL v48 = -[AKPiggybackRequestingController _shouldContinueProcessing:](self, "_shouldContinueProcessing:", &v80);
    id v49 = v80;
    v50 = v49;
    if (!v48)
    {
      +[AKCAAuthEventReporter reportAuthEventOfType:success:error:]( &OBJC_CLASS___AKCAAuthEventReporter,  "reportAuthEventOfType:success:error:",  AKAuthEventType_SECOND_FACTOR_PIGGYBACK_FAILURE,  0LL,  v49);
LABEL_39:
      v8[2](v8, v48, v50);

      goto LABEL_40;
    }

    if (a4)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[KCJoiningRequestSecretSession session](self->_requestSession, "session"));
      requestSession = self->_requestSession;
      self->_requestSession = 0LL;

      if (v51)
      {
        uint64_t v54 = _AKLogSystem(v53);
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Passing duplex session", buf, 2u);
        }

        v82[0] = AKAuthenticationDuplexSessionKey;
        v82[1] = AKAuthenticationCircleContinuationContextKey;
        currentReplyContext = self->_currentReplyContext;
        v83[0] = v51;
        v83[1] = currentReplyContext;
        v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v83,  v82,  2LL));
        id v58 = -[NSDictionary mutableCopy](self->_authResults, "mutableCopy");
        [v58 addEntriesFromDictionary:v57];
        v59 = (NSDictionary *)[v58 copy];
        authResults = self->_authResults;
        self->_authResults = v59;

        latestIDMSData = self->_latestIDMSData;
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_currentReplyContext, "payload"));
        [v62 setServerInfo:latestIDMSData];

        uint64_t v63 = 1LL;
LABEL_38:

        +[AKCAAuthEventReporter reportAuthEventOfType:success:error:]( &OBJC_CLASS___AKCAAuthEventReporter,  "reportAuthEventOfType:success:error:",  AKAuthEventType_SECOND_FACTOR_PIGGYBACK_TRANSITION,  v63,  v50);
        goto LABEL_39;
      }
    }

    else
    {
      uint64_t v74 = _AKLogSystem(v49);
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v85 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "%@: Will not attach duplex session to authentication results",  buf,  0xCu);
      }

      id v76 = self->_requestSession;
      self->_requestSession = 0LL;
    }

    uint64_t v77 = _AKLogSystem(v53);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR)) {
      sub_10013547C();
    }
    uint64_t v63 = 0LL;
    v51 = 0LL;
    goto LABEL_38;
  }

  dispatch_queue_global_t v64 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](*p_currentReplyContext, "payload"));
  v65 = (void *)objc_claimAutoreleasedReturnValue([v64 clientInfo]);

  if (v65)
  {
    -[AKPiggybackRequestingController replyWithContext:withCompletion:]( self,  "replyWithContext:withCompletion:",  self->_currentReplyContext,  v8);
  }

  else
  {
    uint64_t v67 = _AKLogSystem(v66);
    id v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      sub_1001354A8();
    }

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](*p_currentReplyContext, "payload"));
    [v69 setClientErrorCode:-9001];

    -[AKCircleRequestContext setWaitForReply:](*p_currentReplyContext, "setWaitForReply:", 0LL);
    id v70 = (void *)objc_claimAutoreleasedReturnValue(+[AKPiggybackController sharedController](&OBJC_CLASS___AKPiggybackController, "sharedController"));
    id v71 = [v70 performCircleRequestWithContext:*p_currentReplyContext completion:0];

    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "ac_secureCodingError"));
    v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:underlyingError:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:underlyingError:",  -7001LL,  v72));
    v8[2](v8, 0LL, v73);
  }

- (void)_sendDeviceCancelledReplyWithContext:(id)a3
{
  id v8 = a3;
  -[AKCAPiggybackReporter didCancelRequesting](self->_piggybackReporter, "didCancelRequesting");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);
  [v4 setClientErrorCode:-9004];

  v5 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);
  [v5 setClientInfo:0];

  [v8 setWaitForReply:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKPiggybackController sharedController](&OBJC_CLASS___AKPiggybackController, "sharedController"));
  id v7 = [v6 performCircleRequestWithContext:v8 completion:0];
}

- (void)replyWithContext:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKSignpostLogSystem(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = _AKSignpostCreate();
  uint64_t v12 = v11;

  uint64_t v14 = _AKSignpostLogSystem(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = v15;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "PiggybackingRequestingReplyWithContext",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v18 = _AKSignpostLogSystem(v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggybackingRequestingReplyWithContext  enableTelemetry=YES ",  buf,  0xCu);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100056020;
  v27[3] = &unk_1001C8AB8;
  os_signpost_id_t v29 = v10;
  uint64_t v30 = v12;
  id v28 = v7;
  id v20 = v7;
  uint64_t v21 = objc_retainBlock(v27);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AKPiggybackController sharedController](&OBJC_CLASS___AKPiggybackController, "sharedController"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000561B4;
  v25[3] = &unk_1001C8AE0;
  v25[4] = self;
  id v26 = v21;
  uint64_t v23 = v21;
  id v24 = [v22 performCircleRequestWithContext:v6 completion:v25];
}

- (id)contextWithIncomingPayload:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___AKCircleRequestContext);
  -[AKCircleRequestContext setPayload:](v5, "setPayload:", v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationServerResponse masterToken](self->_initialAuthResponse, "masterToken"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
  -[AKCircleRequestContext setIdentityTokenValue:](v5, "setIdentityTokenValue:", v7);

  -[AKCircleRequestContext setAuthContext:](v5, "setAuthContext:", self->_initiatingContext);
  return v5;
}

- (id)idmsData
{
  return self->_latestIDMSData;
}

- (BOOL)_shouldContinueProcessing:(id *)a3
{
  uint64_t v5 = _AKLogSystem(self);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100135644();
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_10005446C;
  uint64_t v23 = sub_10005447C;
  id v24 = 0LL;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000564B8;
  v16[3] = &unk_1001C8B08;
  v16[4] = self;
  uint64_t v18 = &v19;
  uint64_t v9 = v7;
  uint64_t v17 = v9;
  [WeakRetained piggyback:self shouldContinueWithCompletion:v16];

  id v10 = (id)dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    id v10 = (id)v20[5];
    if (v10)
    {
      id v10 = v10;
      *a3 = v10;
    }
  }

  uint64_t v11 = _AKLogSystem(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = self->_authResults != 0LL;
    *(_DWORD *)buf = 67109120;
    BOOL v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Should continue: %d", buf, 8u);
  }

  BOOL v14 = self->_authResults != 0LL;
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (BOOL)isDone
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController requestSession](self, "requestSession"));
  unsigned __int8 v3 = [v2 isDone];

  return v3;
}

- (KCJoiningRequestSecretSession)requestSession
{
  uint64_t v3 = _AKLogSystem(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100135670(self, v4);
  }

  requestSession = self->_requestSession;
  if (!requestSession)
  {
    if (sub_10002590C(0LL)) {
      id v6 = sub_100025D40();
    }
    else {
      id v6 = 0LL;
    }
    dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController initialAuthResponse](self, "initialAuthResponse"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dsid]);
    uint64_t v9 = (KCJoiningRequestSecretSession *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "sessionWithSecretDelegate:dsid:error:",  self,  objc_msgSend(v8, "unsignedLongLongValue"),  0));
    id v10 = self->_requestSession;
    self->_requestSession = v9;

    requestSession = self->_requestSession;
  }

  return requestSession;
}

- (id)secret
{
  uint64_t v3 = _AKLogSystem(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    capturedCode = self->_capturedCode;
    escapeHatchError = self->_escapeHatchError;
    int v8 = 138412546;
    uint64_t v9 = capturedCode;
    __int16 v10 = 2112;
    uint64_t v11 = escapeHatchError;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Using a previously cached code or error: %@ - %@",  (uint8_t *)&v8,  0x16u);
  }

  return (id)objc_claimAutoreleasedReturnValue( -[AKPiggybackRequestingController _capturedCodeString]( self,  "_capturedCodeString"));
}

- (id)verificationFailed:(BOOL)a3
{
  return -[AKPiggybackRequestingController secret](self, "secret", a3);
}

- (BOOL)processAccountCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _AKLogSystem(v6);
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100135704();
  }

  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  os_signpost_id_t v27 = sub_10005446C;
  id v28 = sub_10005447C;
  id v29 = 0LL;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 longLongValue]));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000569E8;
  v20[3] = &unk_1001C8B30;
  id v22 = &v30;
  uint64_t v23 = &v24;
  uint64_t v12 = v9;
  uint64_t v21 = v12;
  [WeakRetained piggyback:self validateSecurityCode:v11 completion:v20];

  uint64_t v13 = dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v14 = _AKLogSystem(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = *((unsigned __int8 *)v31 + 24);
    uint64_t v17 = v25[5];
    *(_DWORD *)buf = 67109378;
    int v34 = v16;
    __int16 v35 = 2112;
    uint64_t v36 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Code validated with result: %d - %@",  buf,  0x12u);
  }

  if (a4) {
    *a4 = (id) v25[5];
  }
  BOOL v18 = *((_BYTE *)v31 + 24) != 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

- (void)_handleVerificationError:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100056B78;
  v14[3] = &unk_1001C8B58;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [WeakRetained piggyback:self handleVerificationWithError:v10 completion:v14];
}

- (void)_promptForSecretWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKSignpostLogSystem(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = _AKSignpostCreate();
  uint64_t v12 = v11;

  uint64_t v14 = _AKSignpostLogSystem(v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = v15;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "PiggyCodeCollect",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v18 = _AKSignpostLogSystem(v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v32 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PiggyCodeCollect  enableTelemetry=YES ",  buf,  0xCu);
  }

  uint64_t v21 = _AKLogSystem(v20);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Prompting user for piggybacking code", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100056DAC;
  v26[3] = &unk_1001C8B80;
  os_signpost_id_t v29 = v10;
  uint64_t v30 = v12;
  v26[4] = self;
  id v27 = v6;
  id v28 = v7;
  id v24 = v7;
  id v25 = v6;
  [WeakRetained piggyback:self promptForRandomCodeWithCompletion:v26];
}

- (void)_processCachedUserInputWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = -[AKAppleIDAuthenticationContext piggybackingForTrustedDevice]( self->_initiatingContext,  "piggybackingForTrustedDevice");
  if ((_DWORD)v8 && self->_escapeHatchTrigger)
  {
    uint64_t v9 = _AKLogSystem(v8);
    os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      escapeHatchTrigger = self->_escapeHatchTrigger;
      *(_DWORD *)buf = 138412290;
      id v16 = escapeHatchTrigger;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received error %@, sending cancelled reply...",  buf,  0xCu);
    }

    -[AKPiggybackRequestingController _sendDeviceCancelledReplyWithContext:]( self,  "_sendDeviceCancelledReplyWithContext:",  v6);
    objc_storeStrong((id *)&self->_escapeHatchError, self->_escapeHatchTrigger);
    v7[2](v7);
  }

  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000570E8;
    v12[3] = &unk_1001C7FE0;
    v12[4] = self;
    id v13 = v6;
    uint64_t v14 = v7;
    -[AKPiggybackRequestingController _processCodeEntryErrorWithContext:completion:]( self,  "_processCodeEntryErrorWithContext:completion:",  v13,  v12);
  }
}

- (void)_processCodeEntryErrorWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, NSError *))a4;
  escapeHatchTrigger = self->_escapeHatchTrigger;
  if (escapeHatchTrigger)
  {
    if (-[NSError ak_isUserCancelError](escapeHatchTrigger, "ak_isUserCancelError"))
    {
      -[AKPiggybackRequestingController _sendDeviceCancelledReplyWithContext:]( self,  "_sendDeviceCancelledReplyWithContext:",  v6);
      v7[2](v7, 0LL, self->_escapeHatchTrigger);
    }

    else
    {
      if (-[NSError code](self->_escapeHatchTrigger, "code") == -7035)
      {
        uint64_t v9 = _AKLogSystem(-7035LL);
        os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1001357CC((id *)&self->_escapeHatchTrigger, v10);
        }

        -[AKPiggybackRequestingController _sendDeviceCancelledReplyWithContext:]( self,  "_sendDeviceCancelledReplyWithContext:",  v6);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v12 = self->_escapeHatchTrigger;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100057374;
      v13[3] = &unk_1001C7640;
      v13[4] = self;
      uint64_t v14 = v7;
      [WeakRetained piggyback:self handleEscapeHatchError:v12 completion:v13];
    }
  }

  else
  {
    v7[2](v7, 0LL, 0LL);
  }
}

- (id)_capturedCodeString
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%06lu",  -[NSNumber unsignedIntegerValue](self->_capturedCode, "unsignedIntegerValue"));
}

- (void)_cacheSecondFactor:(id)a3 codeCaptureError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[AKPiggybackRequestingController _clearCaptureState](self, "_clearCaptureState");
  if (v6)
  {
    id v8 = (NSNumber *)v6;
    capturedCode = self->_capturedCode;
    self->_capturedCode = v8;
  }

  else
  {
    if (v7) {
      os_signpost_id_t v10 = (NSError *)v7;
    }
    else {
      os_signpost_id_t v10 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7035LL));
    }
    capturedCode = self->_escapeHatchTrigger;
    self->_escapeHatchTrigger = v10;
  }

  uint64_t v12 = _AKLogSystem(v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = self->_capturedCode;
    escapeHatchTrigger = self->_escapeHatchTrigger;
    int v16 = 138412546;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    uint64_t v19 = escapeHatchTrigger;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Captured code: %@ - %@",  (uint8_t *)&v16,  0x16u);
  }
}

- (void)_clearCaptureState
{
  capturedCode = self->_capturedCode;
  self->_capturedCode = 0LL;

  escapeHatchTrigger = self->_escapeHatchTrigger;
  self->_escapeHatchTrigger = 0LL;
}

- (void)_startProximityControllerIfNeededWithPushPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 circleStep];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 presenceSID]);
  BOOL v7 = -[AKAuthenticationServerResponse allowPiggybackingPresence]( self->_initialAuthResponse,  "allowPiggybackingPresence");
  BOOL v8 = v7;
  uint64_t v9 = _AKLogSystem(v7);
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v5 || !v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v13 = @"NO";
      int v15 = 138413058;
      int v16 = self;
      __int16 v17 = 2112;
      if (v8) {
        id v13 = @"YES";
      }
      __int16 v18 = v13;
      __int16 v19 = 2048;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%@: Determined proximity advertiser should not be started (wantsPresence: %@, circleStep: %lu, presenceSID: %@)",  (uint8_t *)&v15,  0x2Au);
    }

    goto LABEL_13;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    int v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: Determined proximity advertiser should be started",  (uint8_t *)&v15,  0xCu);
  }

  if (!v6)
  {
    uint64_t v14 = _AKLogSystem(v12);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100135858();
    }
LABEL_13:

    goto LABEL_14;
  }

  -[AKPiggybackRequestingController _startProximityControllerWithPresenceSID:]( self,  "_startProximityControllerWithPresenceSID:",  v6);
LABEL_14:
}

- (void)_stopProximityControllerIfNeededWithPushPayload:(id)a3
{
  uint64_t v4 = (uint64_t)[a3 circleStep];
  uint64_t v5 = v4;
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 4
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController proximityController](self, "proximityController")),
        v6,
        v6))
  {
    uint64_t v7 = _AKLogSystem(v4);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      uint64_t v12 = self;
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Determined proximity advertiser should be stopped (circleStep: %lu)",  (uint8_t *)&v11,  0x16u);
    }

    -[AKPiggybackRequestingController _stopProximityController](self, "_stopProximityController");
  }

  else
  {
    uint64_t v9 = _AKLogSystem(v4);
    os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1001358D4(self, v5, v10);
    }
  }

- (void)_startProximityControllerWithPresenceSID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[AKProximityPiggybackEngine initWithPresenceSID:]( objc_alloc(&OBJC_CLASS___AKProximityPiggybackRequestingEngine),  "initWithPresenceSID:",  v4);
  id v6 = -[AKProximityController initWithEngine:](objc_alloc(&OBJC_CLASS___AKProximityController), "initWithEngine:", v5);
  -[AKPiggybackRequestingController setProximityController:](self, "setProximityController:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController proximityController](self, "proximityController"));
  [v7 setInvalidationHandler:&stru_1001C8BA0];

  uint64_t v9 = _AKLogSystem(v8);
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController proximityController](self, "proximityController"));
    int v13 = 138413058;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    int v16 = v11;
    __int16 v17 = 2160;
    uint64_t v18 = 1752392040LL;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Setting up proximity controller (%@) with presenceSID (%{mask.hash}@)",  (uint8_t *)&v13,  0x2Au);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController proximityController](self, "proximityController"));
  [v12 activate];
}

- (void)_stopProximityController
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController proximityController](self, "proximityController"));

  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AKPiggybackRequestingController: Invalidating proximity controller.",  v9,  2u);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKPiggybackRequestingController proximityController](self, "proximityController"));
    [v8 invalidate];

    -[AKPiggybackRequestingController setProximityController:](self, "setProximityController:", 0LL);
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001359BC();
    }
  }

- (AKPiggybackRequestingControllerDelegate)delegate
{
  return (AKPiggybackRequestingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (AKAppleIDAuthenticationContext)initiatingContext
{
  return self->_initiatingContext;
}

- (void)setInitiatingContext:(id)a3
{
}

- (NSString)initiatingPassword
{
  return self->_initiatingPassword;
}

- (void)setInitiatingPassword:(id)a3
{
}

- (AKAuthenticationServerResponse)initialAuthResponse
{
  return self->_initialAuthResponse;
}

- (void)setRequestSession:(id)a3
{
}

- (NSNumber)capturedCode
{
  return self->_capturedCode;
}

- (void)setCapturedCode:(id)a3
{
}

- (NSError)escapeHatchTrigger
{
  return self->_escapeHatchTrigger;
}

- (void)setEscapeHatchTrigger:(id)a3
{
}

- (NSError)escapeHatchError
{
  return self->_escapeHatchError;
}

- (void)setEscapeHatchError:(id)a3
{
}

- (NSDictionary)authResults
{
  return self->_authResults;
}

- (void)setAuthResults:(id)a3
{
}

- (BOOL)unitTestContext
{
  return self->_unitTestContext;
}

- (void)setUnitTestContext:(BOOL)a3
{
  self->_unitTestContext = a3;
}

- (double)initialHandshakeTimeout
{
  return self->_initialHandshakeTimeout;
}

- (void)setInitialHandshakeTimeout:(double)a3
{
  self->_initialHandshakeTimeout = a3;
}

- (AKProximityController)proximityController
{
  return self->_proximityController;
}

- (void)setProximityController:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end