@interface IDSPhoneNumberValidationStateMachine
- (BOOL)_canDeliverSMSNow;
- (BOOL)_deviceCanRegisterPresently;
- (BOOL)_isAwaitingUserSelectionDuringSetup;
- (BOOL)_isPhoneNumberIdentificationSupported;
- (BOOL)_isUserSubscriptionSelectionStillPending;
- (BOOL)_userHasDisabledSMSRegistration;
- (BOOL)_validSIMStateForRegistration;
- (BOOL)commCenterDead;
- (BOOL)didReceiveSIMSetupCompleteNotification;
- (BOOL)hasAcceptedSMSRequest;
- (BOOL)isSMSWarningUp;
- (BOOL)needsToCheckPhoneNumberState;
- (IDSCTPNR)CTPNR;
- (IDSPersistentMap)dailyMetricData;
- (IDSPhoneNumberValidationModeArbiter)arbiter;
- (IDSPhoneNumberValidationStateMachine)initWithCTPNR:(id)a3 preflightStackStore:(id)a4;
- (IDSPhoneNumberValidationStateMachine)initWithCTPNR:(id)a3 preflightStackStore:(id)a4 HTTPDelivery:(id)a5 pushHandler:(id)a6 lockdownManager:(id)a7 systemMonitor:(id)a8 arbiter:(id)a9 systemAccountAdapter:(id)a10 dailyMetricData:(id)a11;
- (IDSPhoneNumberValidationStateMachineLockdownManager)lockdownManager;
- (IDSPhoneNumberValidationStateMachineMessageDelivery)httpMessageDelivery;
- (IDSPreflightStack)currentPreflightStack;
- (IDSPreflightStackStore)preflighStackStore;
- (IDSPushHandler)pushHandler;
- (IDSSystemAccountAdapter)systemAccountAdapter;
- (IMSystemMonitor)systemMonitor;
- (IMTimer)lastSendSMSTimer;
- (NSDate)nextSendSMSDate;
- (NSDate)phoneNumberValidationStartDate;
- (NSDate)smsSendDate;
- (NSMutableArray)handlers;
- (NSMutableArray)registrations;
- (NSString)description;
- (id)_getHighestPriorityMechanism;
- (id)identifyPhoneNumberForRequestor:(id)a3 queue:(id)a4;
- (id)inFlightHeartbeatBlock;
- (id)inFlightSMSTimeoutBlock;
- (int64_t)_errorCodeForRegistrationError:(int64_t)a3;
- (int64_t)_registrationControlStatus;
- (int64_t)reason;
- (int64_t)status;
- (unsigned)loadNumberOfPreflightAttempts;
- (unsigned)loadNumberOfSuccessfulValidationSends;
- (unsigned)numberOfAttemptsWithoutSuccessfulSend;
- (unsigned)numberOfPreflights;
- (unsigned)numberOfSuccessfulSends;
- (void)PNRReadyStateChanged:(BOOL)a3;
- (void)PNRRequestSentWithRequestData:(id)a3;
- (void)PNRResponseReceivedWithResponseData:(id)a3;
- (void)_SIMSetupDidComplete;
- (void)_cancelScheduledHeartbeat;
- (void)_cancelScheduledSMSTimeout;
- (void)_clearSMSDeliveryTimeout;
- (void)_deviceIDChangedNotification:(id)a3;
- (void)_failPromisesWithError:(int64_t)a3;
- (void)_fulfillPromisesWithPhoneNumber:(id)a3 token:(id)a4;
- (void)_issueAsyncCoreTelephonyPhoneNumberValidationRequestWithPushToken:(id)a3 mechanism:(id)a4;
- (void)_keychainMigrationComplete:(id)a3;
- (void)_lastSendSMSTimerFiredOnMain;
- (void)_lockdownStateChanged:(id)a3;
- (void)_notifyFailureWithError:(int64_t)a3;
- (void)_notifySuccess:(id)a3;
- (void)_performHighestPriorityPreflightVerification;
- (void)_popHighestPriorityPreflightVerification;
- (void)_registerForDeviceCenterNotifications;
- (void)_registerForLockdownNotifications;
- (void)_requestUserConsentForPhoneNumberValidationWithCompletion:(id)a3;
- (void)_scheduleHeartbeat:(double)a3;
- (void)_scheduleSMSTimeout:(double)a3;
- (void)_sendPreflightVerificationIfNeeded;
- (void)_sendPreflightVerificationWithIMSI:(id)a3 PLMN:(id)a4;
- (void)_sendSMSVerificationWithMechanism:(id)a3;
- (void)_setSMSDeliveryTimeout:(double)a3;
- (void)_smsDeliveryClear;
- (void)_tryToSendSMSIdentification;
- (void)addListener:(id)a3;
- (void)addPhoneNumberValidationRequestor:(id)a3;
- (void)dealloc;
- (void)handleIncomingSMSForResponse:(id)a3;
- (void)handleRegistrationSMSDeliveryFailed;
- (void)handleRegistrationSMSDeliveryFailedWithShouldBypassRetry:(BOOL)a3;
- (void)handleRegistrationSMSSuccessfullyDeliveredWithTelephonyTimeout:(id)a3;
- (void)heartbeat;
- (void)invalidate;
- (void)persistNumberOfPreflightAttempts:(unsigned int)a3;
- (void)persistNumberOfSuccessfulValidationSends:(unsigned int)a3;
- (void)removeListener:(id)a3;
- (void)removePhoneNumberValidationRequestor:(id)a3;
- (void)resetSMSCounter;
- (void)setArbiter:(id)a3;
- (void)setCTPNR:(id)a3;
- (void)setCommCenterDead:(BOOL)a3;
- (void)setCurrentPreflightStack:(id)a3;
- (void)setDailyMetricData:(id)a3;
- (void)setDidReceiveSIMSetupCompleteNotification:(BOOL)a3;
- (void)setHandlers:(id)a3;
- (void)setHasAcceptedSMSRequest:(BOOL)a3;
- (void)setHttpMessageDelivery:(id)a3;
- (void)setInFlightHeartbeatBlock:(id)a3;
- (void)setInFlightSMSTimeoutBlock:(id)a3;
- (void)setIsSMSWarningUp:(BOOL)a3;
- (void)setLastSendSMSTimer:(id)a3;
- (void)setLockdownManager:(id)a3;
- (void)setNeedsToCheckPhoneNumberState:(BOOL)a3;
- (void)setNextSendSMSDate:(id)a3;
- (void)setNumberOfAttemptsWithoutSuccessfulSend:(unsigned int)a3;
- (void)setNumberOfPreflights:(unsigned int)a3;
- (void)setNumberOfSuccessfulSends:(unsigned int)a3;
- (void)setPhoneNumberValidationStartDate:(id)a3;
- (void)setPreflighStackStore:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setReason:(int64_t)a3;
- (void)setRegistrations:(id)a3;
- (void)setSmsSendDate:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setSystemAccountAdapter:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)systemDidFinishMigration;
- (void)systemDidStopBackup;
- (void)systemRestoreStateDidChange;
- (void)timedOutWaitingForSMS;
@end

@implementation IDSPhoneNumberValidationStateMachine

- (BOOL)_isPhoneNumberIdentificationSupported
{
  unsigned __int8 v2 = -[IDSCTPNR isPNRSupported](self->_CTPNR, "isPNRSupported");
  if ((v2 & 1) == 0)
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Registration is not supported on this device",  v5,  2u);
    }
  }

  return v2;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  unint64_t status = self->_status;
  if (status > 3) {
    v5 = @"Unknown";
  }
  else {
    v5 = *(&off_1008FF098 + status);
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p state: %@, lastSendDate: %@, numberOfPreflights: %u, numberOfAttemptsWithoutSuccessfulSend: %u, numberOfSuccessfulSends: %u>",  v3,  self,  v5,  self->_smsSendDate,  self->_numberOfPreflights,  self->_numberOfAttemptsWithoutSuccessfulSend,  self->_numberOfSuccessfulSends);
}

- (void)_scheduleHeartbeat:(double)a3
{
  if (a3 > 0.0 && self->_status)
  {
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v13 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Scheduling heartbeat in %f seconds",  buf,  0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10025CCE0;
    block[3] = &unk_1008F6010;
    block[4] = self;
    dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0LL, block);
    -[IDSPhoneNumberValidationStateMachine setInFlightHeartbeatBlock:](self, "setInFlightHeartbeatBlock:", v6);
    dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
    uint64_t v9 = im_primary_queue(v7, v8);
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_after(v7, v10, v6);
  }

- (void)_cancelScheduledHeartbeat
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine inFlightHeartbeatBlock](self, "inFlightHeartbeatBlock"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine inFlightHeartbeatBlock](self, "inFlightHeartbeatBlock"));
    dispatch_block_cancel(v4);

    -[IDSPhoneNumberValidationStateMachine setInFlightHeartbeatBlock:](self, "setInFlightHeartbeatBlock:", 0LL);
  }

- (void)_scheduleSMSTimeout:(double)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_10025CE5C;
  double v13 = &unk_1008F8A78;
  objc_copyWeak(&v14, &location);
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0LL, &v10);
  -[IDSPhoneNumberValidationStateMachine setInFlightSMSTimeoutBlock:]( self,  "setInFlightSMSTimeoutBlock:",  v5,  v10,  v11,  v12,  v13);
  dispatch_time_t v6 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  uint64_t v8 = im_primary_queue(v6, v7);
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_after(v6, v9, v5);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_cancelScheduledSMSTimeout
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine inFlightSMSTimeoutBlock](self, "inFlightSMSTimeoutBlock"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine inFlightSMSTimeoutBlock](self, "inFlightSMSTimeoutBlock"));
    dispatch_block_cancel(v4);

    -[IDSPhoneNumberValidationStateMachine setInFlightSMSTimeoutBlock:](self, "setInFlightSMSTimeoutBlock:", 0LL);
  }

- (IDSPhoneNumberValidationStateMachine)initWithCTPNR:(id)a3 preflightStackStore:(id)a4 HTTPDelivery:(id)a5 pushHandler:(id)a6 lockdownManager:(id)a7 systemMonitor:(id)a8 arbiter:(id)a9 systemAccountAdapter:(id)a10 dailyMetricData:(id)a11
{
  id v17 = a3;
  id v45 = a4;
  id v44 = a5;
  id v43 = a6;
  id v42 = a7;
  id v41 = a8;
  id v40 = a9;
  id v39 = a10;
  id v38 = a11;
  if (!v17)
  {
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_1006A4C18((uint64_t)self, v18);
    }

    id v17 = 0LL;
  }

  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___IDSPhoneNumberValidationStateMachine;
  v19 = -[IDSPhoneNumberValidationStateMachine init](&v46, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_systemMonitor, a8);
    -[IMSystemMonitor addListener:](v20->_systemMonitor, "addListener:", v20);
    objc_storeStrong((id *)&v20->_pushHandler, a6);
    objc_storeStrong((id *)&v20->_CTPNR, a3);
    id v21 = v17;
    [v17 setPNRDelegate:v20];
    objc_storeStrong((id *)&v20->_httpMessageDelivery, a5);
    objc_storeStrong((id *)&v20->_lockdownManager, a7);
    objc_storeStrong((id *)&v20->_arbiter, a9);
    objc_storeStrong((id *)&v20->_systemAccountAdapter, a10);
    objc_storeStrong((id *)&v20->_preflighStackStore, a4);
    v20->_reason = 0LL;
    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    requestors = v20->_requestors;
    v20->_requestors = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    promises = v20->_promises;
    v20->_promises = v24;

    v20->_unsigned int numberOfSuccessfulSends = -[IDSPhoneNumberValidationStateMachine loadNumberOfSuccessfulValidationSends]( v20,  "loadNumberOfSuccessfulValidationSends");
    v20->_numberOfPreflights = -[IDSPhoneNumberValidationStateMachine loadNumberOfPreflightAttempts]( v20,  "loadNumberOfPreflightAttempts");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int numberOfSuccessfulSends = v20->_numberOfSuccessfulSends;
      *(_DWORD *)buf = 67109120;
      LODWORD(v48) = numberOfSuccessfulSends;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Phone Number Validation registration agent has sent %d SMSs",  buf,  8u);
    }

    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine lockdownManager](v20, "lockdownManager"));
      *(_DWORD *)buf = 138412290;
      v48 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Lockdown state: %@", buf, 0xCu);
    }

    v20->_unint64_t status = 0LL;
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "1. Setting SMS status to: IDSSMSIdentificationStatusIdle",  buf,  2u);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v31 addObserver:v20 selector:"_keychainMigrationComplete:" name:@"__kIDSRegistrationKeyManagerKeychainMigrationComplete" object:0];

    -[IDSPhoneNumberValidationStateMachine _registerForDeviceCenterNotifications]( v20,  "_registerForDeviceCenterNotifications");
    -[IDSPhoneNumberValidationStateMachine _registerForLockdownNotifications](v20, "_registerForLockdownNotifications");
    if (qword_1009C07B0
      || ((v32 = (void **)IMWeakLinkSymbol("BYSetupAssistantDidCompleteSIMSetupNotification", @"SetupAssistant")) == 0LL
        ? (v33 = 0LL)
        : (v33 = *v32),
          objc_storeStrong((id *)&qword_1009C07B0, v33),
          qword_1009C07B0))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver( DarwinNotifyCenter,  v20,  (CFNotificationCallback)sub_10025D314,  (CFStringRef)qword_1009C07B0,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    }

    uint64_t v35 = IDSSetPhoneNumberChangeNotificationEnabled(1LL);
    IDSFetchPhoneNumber(v35);
    objc_storeStrong((id *)&v20->_dailyMetricData, a11);
    id v17 = v21;
  }

  return v20;
}

- (IDSPhoneNumberValidationStateMachine)initWithCTPNR:(id)a3 preflightStackStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  id v22 = objc_alloc_init((Class)+[FTMessageDelivery HTTPMessageDeliveryClass]( &OBJC_CLASS___FTMessageDelivery,  "HTTPMessageDeliveryClass"));
  [v22 setLogToRegistration:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationRequestTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationRequestTracker,  "sharedInstance"));
  [v22 addRequestObserver:v7];

  v20 = objc_alloc_init(&OBJC_CLASS___IDSPhoneNumberValidationModeArbiter);
  uint64_t v8 = objc_alloc(&OBJC_CLASS___IDSSystemAccountAdapter);
  uint64_t v10 = im_primary_queue(v8, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = -[IDSSystemAccountAdapter initWithQueue:](v8, "initWithQueue:", v11);

  double v13 = objc_alloc(&OBJC_CLASS___IDSPersistentMap);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"com.apple.identityservices.dailyPNRData.%lu",  [v6 slotID]));
  v28[0] = objc_opt_class(&OBJC_CLASS___NSString, v14);
  v28[1] = objc_opt_class(&OBJC_CLASS___NSNumber, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));
  v18 = -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:migrationBlock:]( v13,  "initWithIdentifier:versionNumber:decodableClasses:migrationBlock:",  v21,  0LL,  v17,  0LL);
  v27 = -[IDSPhoneNumberValidationStateMachine initWithCTPNR:preflightStackStore:HTTPDelivery:pushHandler:lockdownManager:systemMonitor:arbiter:systemAccountAdapter:dailyMetricData:]( self,  "initWithCTPNR:preflightStackStore:HTTPDelivery:pushHandler:lockdownManager:systemMonitor:arbiter:systemAccount Adapter:dailyMetricData:",  v6,  v5,  v22,  v25,  v24,  v23,  v20,  v12,  v18);

  return v27;
}

- (void)invalidate
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Phone Number Validation agent dealloc", v6, 2u);
  }

  -[IDSPhoneNumberValidationStateMachine _clearSMSDeliveryTimeout](self, "_clearSMSDeliveryTimeout");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:0 object:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSPhoneNumberValidationStateMachine;
  -[IDSPhoneNumberValidationStateMachine dealloc](&v3, "dealloc");
}

- (void)_registerForDeviceCenterNotifications
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_deviceIDChangedNotification:" name:FaceTimeDeviceRegistrationStateChangedNotification object:0];
}

- (IDSPreflightStack)currentPreflightStack
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine preflighStackStore](self, "preflighStackStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCTPNR uniqueIdentifier](self->_CTPNR, "uniqueIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 preflightStackForIdentifier:v4]);

  return (IDSPreflightStack *)v5;
}

- (void)setCurrentPreflightStack:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine preflighStackStore](self, "preflighStackStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCTPNR uniqueIdentifier](self->_CTPNR, "uniqueIdentifier"));
  [v6 setPreflightStack:v4 forIdentifier:v5];
}

- (int64_t)_registrationControlStatus
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDRegistrationControl sharedInstance](&OBJC_CLASS___IDSDRegistrationControl, "sharedInstance"));
  id v3 = [v2 registrationStateForRegistrationType:0 error:0];

  return (int64_t)v3;
}

- (BOOL)_userHasDisabledSMSRegistration
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  if ([v3 faceTimeBlocked]
    && [v3 callingBlocked]
    && [v3 iMessageBlocked])
  {
    unsigned int v4 = [v3 multiwayBlocked];
  }

  else
  {
    unsigned int v4 = 0;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSSystemAccountAdapter iCloudSystemAccountWithError:]( self->_systemAccountAdapter,  "iCloudSystemAccountWithError:",  0LL));

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v4 || v5)
  {
    if (v7)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Registration Control Checking On the state of Phone Number registration disablement",  v12,  2u);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    unsigned int v10 = [v9 isGreenTea];

    if (v10) {
      BOOL v8 = (id)-[IDSPhoneNumberValidationStateMachine _registrationControlStatus](self, "_registrationControlStatus") == (id)1;
    }
    else {
      BOOL v8 = 0;
    }
  }

  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "A configuration profile disables SMS for iMessage and FaceTime -- denying",  buf,  2u);
    }

    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)_isUserSubscriptionSelectionStillPending
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  unsigned int v4 = [v3 dualSIMCapabilityEnabled];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 selectedPhoneNumberRegistrationSubscriptionLabels]);
  id v7 = [v6 count];

  if (v4) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v9 = v8 && !self->_didReceiveSIMSetupCompleteNotification;
  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @"NO";
    if (v4) {
      v12 = @"YES";
    }
    else {
      v12 = @"NO";
    }
    BOOL didReceiveSIMSetupCompleteNotification = self->_didReceiveSIMSetupCompleteNotification;
    if (v7) {
      uint64_t v14 = @"YES";
    }
    else {
      uint64_t v14 = @"NO";
    }
    int v16 = 138412802;
    id v17 = v12;
    __int16 v18 = 2112;
    v19 = v14;
    if (didReceiveSIMSetupCompleteNotification) {
      uint64_t v11 = @"YES";
    }
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Determined whether user subscription selection is still pending { isDualSIM: %@, hasSelectedPhoneNumber: %@, didRe ceiveSIMSetupCompleteNotification: %@ }",  (uint8_t *)&v16,  0x20u);
  }

  return v9;
}

- (BOOL)_isAwaitingUserSelectionDuringSetup
{
  BOOL v3 = +[IDSRegistrationController isBuddyShowing](&OBJC_CLASS___IDSRegistrationController, "isBuddyShowing");
  if (v3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    unsigned int v5 = [v4 isGreenTea];

    unsigned int v6 = -[IDSPhoneNumberValidationStateMachine _isUserSubscriptionSelectionStillPending]( self,  "_isUserSubscriptionSelectionStillPending");
    else {
      char v8 = 0;
    }
    if ((v8 & 1) != 0 || v6)
    {
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v10 = @"NO";
        if (v5) {
          uint64_t v11 = @"YES";
        }
        else {
          uint64_t v11 = @"NO";
        }
        else {
          v12 = @"NO";
        }
        int v14 = 138412802;
        uint64_t v15 = v11;
        __int16 v16 = 2112;
        id v17 = v12;
        if (v6) {
          unsigned int v10 = @"YES";
        }
        __int16 v18 = 2112;
        v19 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Currently awaiting selection { doesDeviceNeedExplicitPhoneAuthConsent: %@, isRegistrationControlStateSet: %@, needToWaitForSubscriptionSelection: %@ }",  (uint8_t *)&v14,  0x20u);
      }

      LOBYTE(v3) = 1;
    }

    else
    {
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (void)_notifyFailureWithError:(int64_t)a3
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_super v46 = _os_activity_create( (void *)&_mh_execute_header,  "SMS registration center notify failure",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v46, &state);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPhoneNumberValidationStateMachine _getHighestPriorityMechanism]( self,  "_getHighestPriorityMechanism"));
  int64_t v5 = -[IDSPhoneNumberValidationStateMachine _errorCodeForRegistrationError:]( self,  "_errorCodeForRegistrationError:",  a3);
  if (v5 == -3000 && v35 && [v35 type] == (id)1)
  {
    id v6 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v42;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v11, "validator:handleABCEvent:") & 1) != 0) {
            [v11 validator:self handleABCEvent:203];
          }
        }

        id v8 = [v7 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }

      while (v8);
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
  [v12 notePNRError:v5];

  -[NSMutableArray removeAllObjects](self->_requestors, "removeAllObjects");
  self->_unint64_t status = 0LL;
  self->_hasAcceptedSMSRequest = 0;
  double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "2. Setting SMS status to: IDSSMSIdentificationStatusIdle",  buf,  2u);
  }

  -[IDSPhoneNumberValidationStateMachine _cancelScheduledHeartbeat](self, "_cancelScheduledHeartbeat");
  -[IDSPhoneNumberValidationStateMachine _failPromisesWithError:](self, "_failPromisesWithError:", a3);
  id v14 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v37;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)j);
        if ((objc_opt_respondsToSelector(v19, "validator:failedIdentificationWithRegistrationError:") & 1) != 0) {
          [v19 validator:self failedIdentificationWithRegistrationError:a3];
        }
      }

      id v16 = [v15 countByEnumeratingWithState:&v36 objects:v47 count:16];
    }

    while (v16);
  }

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v20 timeIntervalSinceDate:self->_phoneNumberValidationStartDate];
  double v22 = v21;

  uint64_t v23 = sub_10019EF00(a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22));
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_numberOfSuccessfulSends));
  FTAWDLogRegistrationPhoneNumberValidationFinished(0LL, v23, v24, v25);

  id v26 = objc_alloc(&OBJC_CLASS___IDSRegistrationPhoneNumberValidationFinishedMetric);
  uint64_t v27 = sub_10019EF00(a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22));
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_numberOfSuccessfulSends));
  id v30 = [v26 initWithGuid:0 registrationError:v27 validationDuration:v28 numberOfSMSSent:v29];

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v31 logMetric:v30];

  phoneNumberValidationStartDate = self->_phoneNumberValidationStartDate;
  self->_phoneNumberValidationStartDate = 0LL;

  -[IDSPersistentMap setObject:forKey:]( self->_dailyMetricData,  "setObject:forKey:",  &__kCFBooleanFalse,  IDSPNRRegStatusMetricPNRdKey);
  dailyMetricData = self->_dailyMetricData;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5));
  -[IDSPersistentMap setObject:forKey:](dailyMetricData, "setObject:forKey:", v34, IDSPNRRegStatusMetricPNRErrorCodeKey);

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v46);
}

- (void)_notifySuccess:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v45 = _os_activity_create( (void *)&_mh_execute_header,  "SMS registration center notify success",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v45, &state);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneNumber]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneBookNumber]);
  v34 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 signature]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _FTStringFromBaseData]);

  if (-[NSMutableArray count](self->_requestors, "count"))
  {
    -[NSMutableArray removeAllObjects](self->_requestors, "removeAllObjects");
    self->_unint64_t status = 0LL;
    self->_hasAcceptedSMSRequest = 0;
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "3. Setting SMS status to: IDSSMSIdentificationStatusIdle",  buf,  2u);
    }

    -[IDSPhoneNumberValidationStateMachine _cancelScheduledHeartbeat](self, "_cancelScheduledHeartbeat");
    -[IDSPhoneNumberValidationStateMachine _fulfillPromisesWithPhoneNumber:token:]( self,  "_fulfillPromisesWithPhoneNumber:token:",  v5,  v8);
    id v10 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v15, "validator:identifiedPhoneNumber:token:phoneBookNumber:") & 1) != 0) {
            [v15 validator:self identifiedPhoneNumber:v5 token:v8 phoneBookNumber:v6];
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v35 objects:v46 count:16];
      }

      while (v12);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v16 timeIntervalSinceDate:self->_phoneNumberValidationStartDate];
    double v18 = v17;

    uint64_t v19 = sub_10019EF00(-1LL);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
    double v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_numberOfSuccessfulSends));
    FTAWDLogRegistrationPhoneNumberValidationFinished(0LL, v19, v20, v21);

    id v22 = objc_alloc(&OBJC_CLASS___IDSRegistrationPhoneNumberValidationFinishedMetric);
    uint64_t v23 = sub_10019EF00(-1LL);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_numberOfSuccessfulSends));
    id v26 = [v22 initWithGuid:0 registrationError:v23 validationDuration:v24 numberOfSMSSent:v25];

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v27 logMetric:v26];

    phoneNumberValidationStartDate = self->_phoneNumberValidationStartDate;
    self->_phoneNumberValidationStartDate = 0LL;

    -[IDSPersistentMap setObject:forKey:]( self->_dailyMetricData,  "setObject:forKey:",  &__kCFBooleanTrue,  IDSPNRRegStatusMetricPNRdKey);
  }

  else
  {
    id v29 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v26 = v29;
    id v30 = [v26 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v41;
      do
      {
        for (j = 0LL; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v41 != v31) {
            objc_enumerationMutation(v26);
          }
          v33 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)j);
          if ((objc_opt_respondsToSelector(v33, "validator:identifiedPhoneNumber:token:phoneBookNumber:") & 1) != 0) {
            [v33 validator:self identifiedPhoneNumber:v5 token:v8 phoneBookNumber:v6];
          }
        }

        id v30 = [v26 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }

      while (v30);
    }
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v45);
}

- (void)_fulfillPromisesWithPhoneNumber:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[IDSPhoneNumberIdentification initWithPhoneNumber:phoneToken:]( objc_alloc(&OBJC_CLASS___IDSPhoneNumberIdentification),  "initWithPhoneNumber:phoneToken:",  v6,  v7);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v9 = self->_promises;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v13), "fulfillWithValue:", v8, (void)v14);
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v11);
  }

  -[NSMutableArray removeAllObjects](self->_promises, "removeAllObjects");
}

- (void)_failPromisesWithError:(int64_t)a3
{
  id v4 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"IDSPhoneNumberValidationErrorDomain",  -[IDSPhoneNumberValidationStateMachine _errorCodeForRegistrationError:]( self,  "_errorCodeForRegistrationError:",  a3),  0LL);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  int64_t v5 = self->_promises;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "failWithError:", v4, (void)v10);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_promises, "removeAllObjects");
}

- (int64_t)_errorCodeForRegistrationError:(int64_t)a3
{
  if (a3 > 34)
  {
    if (a3 != 35)
    {
      if (a3 == 36) {
        return -5000LL;
      }
      return -1000LL;
    }

    return -4000LL;
  }

  if (!a3) {
    return -6000LL;
  }
  if (a3 == 2) {
    return -4000LL;
  }
  return -1000LL;
}

- (BOOL)_deviceCanRegisterPresently
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine lockdownManager](self, "lockdownManager"));
  unsigned __int8 v4 = [v3 isActivated];

  if ((v4 & 1) != 0)
  {
    if (-[IDSPhoneNumberValidationStateMachine _validSIMStateForRegistration](self, "_validSIMStateForRegistration")
      && !IDSDebuggingShouldFakeBadSIM())
    {
      return 1;
    }

    int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "SIM is not ready to proceed with registration",  (uint8_t *)&v8,  2u);
    }
  }

  else
  {
    int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine lockdownManager](self, "lockdownManager"));
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Device is currently locked down, we're not able to proceed (State: %@)",  (uint8_t *)&v8,  0xCu);
    }
  }

  return 0;
}

- (BOOL)_validSIMStateForRegistration
{
  BOOL v3 = +[IDSRegistrationController systemSupportsPhoneNumberRegistration]( &OBJC_CLASS___IDSRegistrationController,  "systemSupportsPhoneNumberRegistration");
  if (v3)
  {
    if ((-[IDSCTPNR isSIMReady](self->_CTPNR, "isSIMReady") & 1) != 0)
    {
      LOBYTE(v3) = 1;
    }

    else
    {
      unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  " SIM State says cannot register, registration State",  v6,  2u);
      }

      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (void)_lockdownStateChanged:(id)a3
{
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Lockdown changed", buf, 2u);
  }

  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine lockdownManager](self, "lockdownManager"));
  unsigned int v6 = [v5 isActivated];

  if (v6)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "     ==> We're activated, let's go, waiting...",  v8,  2u);
    }

    -[IDSPhoneNumberValidationStateMachine _scheduleHeartbeat:](self, "_scheduleHeartbeat:", 5.0);
  }

- (void)_registerForLockdownNotifications
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    unsigned int v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Registering %@ for lockdown changes",  (uint8_t *)&v5,  0xCu);
  }

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_lockdownStateChanged:" name:IMLockdownDeviceActivatedChangedNotification object:0];
}

- (void)_deviceIDChangedNotification:(id)a3
{
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device ID Changed", buf, 2u);
  }

  if (-[IDSPhoneNumberValidationStateMachine _validSIMStateForRegistration](self, "_validSIMStateForRegistration"))
  {
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "     ==> We're in a good SIM State, checking heartbeat, waiting...",  v6,  2u);
    }

    -[IDSPhoneNumberValidationStateMachine _scheduleHeartbeat:](self, "_scheduleHeartbeat:", 5.0);
  }

- (void)PNRReadyStateChanged:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10025EF94;
  v3[3] = &unk_1008F6418;
  BOOL v4 = a3;
  v3[4] = self;
  im_dispatch_after_primary_queue(v3, 1.0);
}

- (void)PNRRequestSentWithRequestData:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 success];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 timeout]);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      int v8 = @"YES";
    }
    else {
      int v8 = @"NO";
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 token]);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v8;
    __int16 v20 = 2112;
    double v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CT phone number registration request sent { success: %@, timeout: %@, pushTokenHexEncoding: %@ }",  buf,  0x20u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  id inited = objc_initWeak((id *)buf, self);
  uint64_t v12 = im_primary_queue(inited, v11);
  __int128 v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10025F244;
  block[3] = &unk_1008FF058;
  objc_copyWeak(&v17, (id *)buf);
  char v18 = v5;
  id v16 = v6;
  id v14 = v6;
  dispatch_async(v13, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)PNRResponseReceivedWithResponseData:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CT phone number registration response received { data: %@ }",  buf,  0xCu);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  id inited = objc_initWeak((id *)buf, self);
  uint64_t v8 = im_primary_queue(inited, v7);
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10025F490;
  v11[3] = &unk_1008F93E0;
  objc_copyWeak(&v13, (id *)buf);
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)systemDidFinishMigration
{
  int v3 = IMGetCachedDomainBoolForKey(@"com.apple.conference", @"restoredFromBackup");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = @"NO";
    if (v3) {
      unsigned int v5 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Checking to see if we restored from backup: %@",  (uint8_t *)&v7,  0xCu);
  }

  if (v3)
  {
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "     ==> Restored from backup, and we need to re-register here, waiting...",  (uint8_t *)&v7,  2u);
    }

    -[IDSPhoneNumberValidationStateMachine _scheduleHeartbeat:](self, "_scheduleHeartbeat:", 20.0);
  }

- (void)systemDidStopBackup
{
  if (!+[IDSRegistrationController isBuddyBlockingRegistration]( &OBJC_CLASS___IDSRegistrationController,  "isBuddyBlockingRegistration"))
  {
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "     ==> System backup complete, waiting...",  v4,  2u);
    }

    -[IDSPhoneNumberValidationStateMachine _scheduleHeartbeat:](self, "_scheduleHeartbeat:", 5.0);
  }

- (void)systemRestoreStateDidChange
{
  if (!+[IDSRegistrationController isBuddyBlockingRegistration]( &OBJC_CLASS___IDSRegistrationController,  "isBuddyBlockingRegistration"))
  {
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "     ==> System restore state changed, waiting...",  v4,  2u);
    }

    -[IDSPhoneNumberValidationStateMachine _scheduleHeartbeat:](self, "_scheduleHeartbeat:", 5.0);
  }

- (void)_SIMSetupDidComplete
{
  self->_BOOL didReceiveSIMSetupCompleteNotification = 1;
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "     ==> SIM setup did complete -- kicking heartbeat",  v4,  2u);
  }

  -[IDSPhoneNumberValidationStateMachine _scheduleHeartbeat:](self, "_scheduleHeartbeat:", 1.0);
}

- (void)_keychainMigrationComplete:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance",  a3));
  unsigned __int8 v5 = [v4 requiresKeychainMigration];

  if ((v5 & 1) == 0)
  {
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "     ==> Keychain migration complete, waiting...",  v7,  2u);
    }

    -[IDSPhoneNumberValidationStateMachine _scheduleHeartbeat:](self, "_scheduleHeartbeat:", 20.0);
  }

- (void)_clearSMSDeliveryTimeout
{
  lastSendSMSTimer = self->_lastSendSMSTimer;
  self->_lastSendSMSTimer = 0LL;
}

- (void)_smsDeliveryClear
{
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Phone Number Validation Request Delivery clear timer fired",  buf,  2u);
  }

  -[IDSPhoneNumberValidationStateMachine _clearSMSDeliveryTimeout](self, "_clearSMSDeliveryTimeout");
  if (self->_status)
  {
    if (-[IDSPhoneNumberValidationStateMachine _validSIMStateForRegistration](self, "_validSIMStateForRegistration"))
    {
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v6 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "     ==> We're in a good SIM State, checking heartbeat, waiting...",  v6,  2u);
      }

      -[IDSPhoneNumberValidationStateMachine _scheduleHeartbeat:](self, "_scheduleHeartbeat:", 5.0);
    }
  }

  else
  {
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "We're idle, bailing", v7, 2u);
    }
  }

- (BOOL)_canDeliverSMSNow
{
  return self->_lastSendSMSTimer == 0LL;
}

- (void)_setSMSDeliveryTimeout:(double)a3
{
  if (!self->_lastSendSMSTimer)
  {
    -[IDSPhoneNumberValidationStateMachine _clearSMSDeliveryTimeout](self, "_clearSMSDeliveryTimeout");
    if (qword_1009C07C0 != -1) {
      dispatch_once(&qword_1009C07C0, &stru_1008FF078);
    }
    if (byte_1009C07B8)
    {
      a3 = (double)IMGetDomainIntForKey(@"com.apple.registration", @"smsTimeout");
      unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218498;
        double v13 = a3;
        __int16 v14 = 2112;
        __int128 v15 = @"com.apple.registration";
        __int16 v16 = 2112;
        id v17 = @"overrideSMSTimeout";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Overriding Phone Number Validation Request timeout for registration with: %f   remove %@: %@    to stop this",  (uint8_t *)&v12,  0x20u);
      }
    }

    unsigned int v6 = objc_alloc(&OBJC_CLASS___IMTimer);
    uint64_t v8 = im_primary_queue(v6, v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = -[IMTimer initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:]( v6,  "initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:",  @"com.apple.identityservices.sms-delivery-hbi",  1LL,  self,  "_smsDeliveryClear",  0LL,  v9,  a3);
    lastSendSMSTimer = self->_lastSendSMSTimer;
    self->_lastSendSMSTimer = v10;
  }

- (void)_lastSendSMSTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10025FD58;
  block[3] = &unk_1008F6010;
  void block[4] = self;
  dispatch_sync(v4, block);
}

- (void)_sendSMSVerificationWithMechanism:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Attempting to send SMS verification { mechanism: %@ }",  (uint8_t *)&v17,  0xCu);
  }

  if (-[IDSPhoneNumberValidationStateMachine _canDeliverSMSNow](self, "_canDeliverSMSNow"))
  {
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
    if (v6)
    {
      self->_unint64_t status = 2LL;
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "6. Setting SMS status to: IDSSMSIdentificationStatusWaitingSMSIdentityVerificationDelivery",  (uint8_t *)&v17,  2u);
      }

      -[IDSPhoneNumberValidationStateMachine _issueAsyncCoreTelephonyPhoneNumberValidationRequestWithPushToken:mechanism:]( self,  "_issueAsyncCoreTelephonyPhoneNumberValidationRequestWithPushToken:mechanism:",  v6,  v4);
      id v8 = objc_msgSend( [IDSPNRMetric alloc],  "initWithPNRReason:mechanism:",  -[IDSPhoneNumberValidationStateMachine reason](self, "reason"),  objc_msgSend(v4, "type"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
      [v9 logMetric:v8];

      dailyMetricData = self->_dailyMetricData;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSCTPNRValidationMechanism mechanismStringForMechanism:]( IDSCTPNRValidationMechanism,  "mechanismStringForMechanism:",  [v4 type]));
      -[IDSPersistentMap setObject:forKey:]( dailyMetricData,  "setObject:forKey:",  v11,  IDSPNRRegStatusMetricPNRMechanismKey);

      int v12 = self->_dailyMetricData;
      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentServerTime sharedInstance](&OBJC_CLASS___IDSCurrentServerTime, "sharedInstance"));
      [v13 currentServerTimeInterval];
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      -[IDSPersistentMap setObject:forKey:](v12, "setObject:forKey:", v14, IDSPNRRegStatusMetricPNRTimestampKey);
    }

    else
    {
      self->_unint64_t status = 1LL;
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "4. Setting SMS status to: IDSSMSIdentificationStatusWaitingToBeginSMSIdentityVerification",  (uint8_t *)&v17,  2u);
      }

      __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "     ==> We have no push token, bailing, waiting...",  (uint8_t *)&v17,  2u);
      }

      -[IDSPhoneNumberValidationStateMachine _scheduleHeartbeat:](self, "_scheduleHeartbeat:", 20.0);
    }
  }

  else
  {
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Still waiting on timeout to clear for next Phone Number Validation request to be delivered, waiting",  (uint8_t *)&v17,  2u);
    }
  }
}

- (void)_issueAsyncCoreTelephonyPhoneNumberValidationRequestWithPushToken:(id)a3 mechanism:(id)a4
{
  CTPNR = self->_CTPNR;
  uint64_t numberOfSuccessfulSends = self->_numberOfSuccessfulSends;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100260138;
  v8[3] = &unk_1008FA510;
  v8[4] = self;
  if ((-[IDSCTPNR issuePNRForMechanism:pushToken:attemptCount:completion:]( CTPNR,  "issuePNRForMechanism:pushToken:attemptCount:completion:",  a4,  a3,  numberOfSuccessfulSends,  v8) & 1) == 0)
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1006A4C98(v7);
    }

    -[IDSPhoneNumberValidationStateMachine handleRegistrationSMSDeliveryFailed]( self,  "handleRegistrationSMSDeliveryFailed");
  }

- (void)_sendPreflightVerificationIfNeeded
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCTPNR PNRInfo](self->_CTPNR, "PNRInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 IMSI]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 PLMN]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine currentPreflightStack](self, "currentPreflightStack"));
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine currentPreflightStack](self, "currentPreflightStack"));
    if ([v8 containsMechanisms])
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine currentPreflightStack](self, "currentPreflightStack"));
      unsigned __int8 v10 = [v9 matchesIMSI:v4 PLMN:v5];

      if ((v10 & 1) != 0)
      {
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine currentPreflightStack](self, "currentPreflightStack"));
          int v24 = 138412290;
          v25[0] = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "We're currently iterating over Preflight mechanisms -- continuing { currentPreflightStack: %@ }",  (uint8_t *)&v24,  0xCu);
        }

        -[IDSPhoneNumberValidationStateMachine _performHighestPriorityPreflightVerification]( self,  "_performHighestPriorityPreflightVerification");
        goto LABEL_15;
      }
    }

    else
    {
    }
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine arbiter](self, "arbiter"));
  id v14 = [v13 maxAllowableNumberOfPreflightRequests];

  if (self->_numberOfPreflights >= v14)
  {
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_1006A4CD4((uint64_t)v14, v17, v18, v19, v20, v21, v22, v23);
    }

    -[IDSPhoneNumberValidationStateMachine _notifyFailureWithError:](self, "_notifyFailureWithError:", 3LL);
    -[IDSPhoneNumberValidationStateMachine resetSMSCounter](self, "resetSMSCounter");
  }

  else
  {
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int numberOfPreflights = self->_numberOfPreflights;
      int v24 = 67109376;
      LODWORD(v25[0]) = numberOfPreflights;
      WORD2(v25[0]) = 1024;
      *(_DWORD *)((char *)v25 + 6) = (_DWORD)v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Haven't completed max number of Preflights yet { preflights: %d, maxPreflights: %d }",  (uint8_t *)&v24,  0xEu);
    }

    -[IDSPhoneNumberValidationStateMachine _sendPreflightVerificationWithIMSI:PLMN:]( self,  "_sendPreflightVerificationWithIMSI:PLMN:",  v4,  v5);
  }

- (id)_getHighestPriorityMechanism
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine currentPreflightStack](self, "currentPreflightStack"));
  unsigned int v4 = [v3 containsMechanisms];

  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine currentPreflightStack](self, "currentPreflightStack"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 topMechanism]);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (void)_popHighestPriorityPreflightVerification
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine currentPreflightStack](self, "currentPreflightStack"));
  unsigned int v4 = [v3 containsMechanisms];

  if (v4)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine currentPreflightStack](self, "currentPreflightStack"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v6 preflightStackByPoppingMechanism]);
    -[IDSPhoneNumberValidationStateMachine setCurrentPreflightStack:](self, "setCurrentPreflightStack:", v5);
  }

- (void)_performHighestPriorityPreflightVerification
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine _getHighestPriorityMechanism](self, "_getHighestPriorityMechanism"));
  -[IDSPhoneNumberValidationStateMachine _sendSMSVerificationWithMechanism:]( self,  "_sendSMSVerificationWithMechanism:",  v3);
}

- (void)_sendPreflightVerificationWithIMSI:(id)a3 PLMN:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending Preflight message", buf, 2u);
  }

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___IDSPreflightMessage);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_numberOfPreflights));
  -[IDSPreflightMessage setPhoneNumberValidationRetryCount:](v9, "setPhoneNumberValidationRetryCount:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
  -[IDSPreflightMessage setPushToken:](v9, "setPushToken:", v11);

  IDSAssignPushIdentityToMessage(v9);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 model]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 productOSVersion]);

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 productBuildVersion]);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 deviceName]);

  -[IDSPreflightMessage setHardwareVersion:](v9, "setHardwareVersion:", v13);
  -[IDSPreflightMessage setOsVersion:](v9, "setOsVersion:", v15);
  -[IDSPreflightMessage setSoftwareVersion:](v9, "setSoftwareVersion:", v17);
  -[IDSPreflightMessage setDeviceName:](v9, "setDeviceName:", v19);
  -[IDSPreflightMessage setTimeout:](v9, "setTimeout:", 36000.0);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[IDSPhoneNumberValidationStateMachine reason](self, "reason")));
  -[IDSPreflightMessage setPnrReason:](v9, "setPnrReason:", v20);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine arbiter](self, "arbiter"));
  id v22 = [v21 validationMode];

  if (v22 == (id)3)
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine arbiter](self, "arbiter"));
    int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 preflightTestDataOverride]);

    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Setting test data on preflight message { testData: %@ }",  buf,  0xCu);
    }

    -[IDSPreflightMessage setTestData:](v9, "setTestData:", v24);
  }

  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v6;
    __int16 v35 = 2112;
    id v36 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Setting IMSI and PLMN on preflight message { IMSI: %@, PLMN: %@ }",  buf,  0x16u);
  }

  if (v6) {
    -[IDSPreflightMessage setIMSI:](v9, "setIMSI:", v6);
  }
  if (v7) {
    -[IDSPreflightMessage setPLMN:](v9, "setPLMN:", v7);
  }
  sub_1001BFCFC();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100260BEC;
  v30[3] = &unk_1008FBBF0;
  v30[4] = self;
  id v31 = v6;
  id v32 = v7;
  id v27 = v7;
  id v28 = v6;
  -[IDSPreflightMessage setCompletionBlock:](v9, "setCompletionBlock:", v30);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine httpMessageDelivery](self, "httpMessageDelivery"));
  [v29 sendMessage:v9];

  ++self->_numberOfPreflights;
  -[IDSPhoneNumberValidationStateMachine persistNumberOfPreflightAttempts:](self, "persistNumberOfPreflightAttempts:");
}

- (void)_tryToSendSMSIdentification
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t status = self->_status;
    *(_DWORD *)buf = 67109120;
    int v43 = status;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "_tryToSendSMSIdentification   state: %d",  buf,  8u);
  }

  if (!self->_status)
  {
    self->_int64_t status = 1LL;
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "7. Setting SMS status to: IDSSMSIdentificationStatusWaitingToBeginSMSIdentityVerification",  buf,  2u);
    }
  }

  if (!-[IDSPhoneNumberValidationStateMachine _isPhoneNumberIdentificationSupported]( self,  "_isPhoneNumberIdentificationSupported")) {
    return;
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Checking if user has disabled SMS Registration",  buf,  2u);
  }

  if (-[IDSPhoneNumberValidationStateMachine _userHasDisabledSMSRegistration](self, "_userHasDisabledSMSRegistration"))
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Phone Number Validation has been disabled by the user",  buf,  2u);
    }

    -[IDSPhoneNumberValidationStateMachine _notifyFailureWithError:](self, "_notifyFailureWithError:", 35LL);
    return;
  }

  if (-[IDSPhoneNumberValidationStateMachine _isAwaitingUserSelectionDuringSetup]( self,  "_isAwaitingUserSelectionDuringSetup"))
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Required user selection has not yet been set and system setup is in progress -- deferring SMS identification",  buf,  2u);
    }

    double v9 = 20.0;
LABEL_18:
    -[IDSPhoneNumberValidationStateMachine _scheduleHeartbeat:](self, "_scheduleHeartbeat:", v9);
    return;
  }

  if (self->_status != 1)
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    int v24 = "     ==> We're not in the right state to being Phone Number Validation request identification, waiting...";
LABEL_51:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
    goto LABEL_52;
  }

  if (!-[IDSPhoneNumberValidationStateMachine _deviceCanRegisterPresently](self, "_deviceCanRegisterPresently"))
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    int v24 = "     ==> Device can't register now, waiting...";
    goto LABEL_51;
  }

  if (!-[IDSPhoneNumberValidationStateMachine _validSIMStateForRegistration](self, "_validSIMStateForRegistration"))
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    int v24 = "     ==> SIM is not ready to register, waiting...";
    goto LABEL_51;
  }

  if (self->_hasAcceptedSMSRequest
    || (-[IDSCTPNR userOptInRequired](self->_CTPNR, "userOptInRequired") & 1) == 0
    && !IDSDebuggingShouldFakeSMSCharge())
  {
    if (-[IDSPhoneNumberValidationStateMachine _canDeliverSMSNow](self, "_canDeliverSMSNow"))
    {
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine arbiter](self, "arbiter"));
      unsigned int v11 = [v10 isValidationModeLegacy];

      if (v11)
      {
        int v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine arbiter](self, "arbiter"));
        id v13 = [v12 maxAllowableNumberOfSuccessfullySentVerifications];

        if (self->_numberOfSuccessfulSends >= v13)
        {
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
            sub_1006A4D38((uint64_t)v13, v33, v34, v35, v36, v37, v38, v39);
          }

          -[IDSPhoneNumberValidationStateMachine _notifyFailureWithError:](self, "_notifyFailureWithError:", 3LL);
          -[IDSPhoneNumberValidationStateMachine resetSMSCounter](self, "resetSMSCounter");
          return;
        }

        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int numberOfSuccessfulSends = self->_numberOfSuccessfulSends;
          *(_DWORD *)buf = 67109376;
          int v43 = numberOfSuccessfulSends;
          __int16 v44 = 1024;
          int v45 = (int)v13;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Haven't sent max number of SMS yet { sends: %d, maxSMSSends: %d }",  buf,  0xEu);
        }
      }

      if (!self->_phoneNumberValidationStartDate)
      {
        __int16 v16 = objc_alloc_init(&OBJC_CLASS___NSDate);
        phoneNumberValidationStartDate = self->_phoneNumberValidationStartDate;
        self->_phoneNumberValidationStartDate = v16;
      }

      self->_int64_t status = 2LL;
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "8. Setting SMS status to: IDSSMSIdentificationStatusWaitingSMSIdentityVerificationDelivery",  buf,  2u);
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Trying to send phone number validation request { preflights: %d, sends: %d, attemptsWithoutSend: %d }",  self->_numberOfPreflights,  self->_numberOfSuccessfulSends,  self->_numberOfAttemptsWithoutSuccessfulSend));
      sub_10012E874(0, @"Registration attempt", v19, 0LL);

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine arbiter](self, "arbiter"));
      unsigned int v21 = [v20 isValidationModeLegacy];

      if (v21)
      {
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Preflight disabled; sending legacy phone number verification",
            buf,
            2u);
        }

        -[IDSPhoneNumberValidationStateMachine _sendSMSVerificationWithMechanism:]( self,  "_sendSMSVerificationWithMechanism:",  0LL);
      }

      else
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine arbiter](self, "arbiter"));
        unsigned int v28 = [v27 isValidationModeShortCircuitingPreflight];

        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Preflight short-circuiting; sending phone number verification with overrides",
              buf,
              2u);
          }

          id v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine arbiter](self, "arbiter"));
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 preflightShortCircuitMechanismOverride]);
          -[IDSPhoneNumberValidationStateMachine _sendSMSVerificationWithMechanism:]( self,  "_sendSMSVerificationWithMechanism:",  v32);
        }

        else
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Beginning preflight", buf, 2u);
          }

          -[IDSPhoneNumberValidationStateMachine _sendPreflightVerificationIfNeeded]( self,  "_sendPreflightVerificationIfNeeded");
        }
      }

      return;
    }

    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v24 = "     ==> Can't send Phone Number Validation requests right now, need to wait for timeout, waiting...";
      goto LABEL_51;
    }

- (void)_requestUserConsentForPhoneNumberValidationWithCompletion:(id)a3
{
  requestors = self->_requestors;
  id v5 = a3;
  if (-[NSMutableArray count](requestors, "count"))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_requestors, "firstObject"));
    [v7 requestUserConsentToValidatePhoneNumberForCTPNR:self->_CTPNR completion:v5];
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "No requestors are present for delegation of SMS permission",  buf,  2u);
    }

    (*((void (**)(id, void))v5 + 2))(v5, 0LL);
  }

- (void)handleRegistrationSMSDeliveryFailed
{
}

- (void)handleRegistrationSMSDeliveryFailedWithShouldBypassRetry:(BOOL)a3
{
  BOOL v3 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v26 = _os_activity_create( (void *)&_mh_execute_header,  "SMS registration handle SMS delivery failed",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v26, &state);
  -[IDSPhoneNumberValidationStateMachine _cancelScheduledSMSTimeout](self, "_cancelScheduledSMSTimeout");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int numberOfAttemptsWithoutSuccessfulSend = self->_numberOfAttemptsWithoutSuccessfulSend;
    unsigned int numberOfPreflights = self->_numberOfPreflights;
    unsigned int numberOfSuccessfulSends = self->_numberOfSuccessfulSends;
    *(_DWORD *)buf = 67109632;
    unsigned int v28 = numberOfPreflights;
    __int16 v29 = 1024;
    unsigned int v30 = numberOfSuccessfulSends;
    __int16 v31 = 1024;
    LODWORD(v32) = numberOfAttemptsWithoutSuccessfulSend;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Registration request failed delivery { preflights: %d, sends: %d, attemptsWithoutSend: %d }",  buf,  0x14u);
  }

  if (-[NSMutableArray count](self->_requestors, "count"))
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine arbiter](self, "arbiter"));
    unsigned int v10 = [v9 maxAllowableNumberOfValidationAttemptsWhileNoneHaveSentSuccessfully];

    if (self->_numberOfAttemptsWithoutSuccessfulSend < v10 && !v3)
    {
      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = self->_numberOfAttemptsWithoutSuccessfulSend;
        *(_DWORD *)buf = 67109376;
        unsigned int v28 = v12;
        __int16 v29 = 1024;
        unsigned int v30 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Retrying this validation { attemptsWithoutSuccessfulSend: %d, maxRetries: %d }",  buf,  0xEu);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed sending registration Phone Number Validation request #%d, trying again",  self->_numberOfSuccessfulSends));
      sub_10012E874(0, @"Failed Sending Phone Number Validation", v13, 1073LL);

      ++self->_numberOfAttemptsWithoutSuccessfulSend;
      self->_int64_t status = 1LL;
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "9. Setting SMS status to: IDSSMSIdentificationStatusWaitingToBeginSMSIdentityVerification",  buf,  2u);
      }

      int64_t v15 = 1LL;
      goto LABEL_25;
    }

    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = self->_numberOfAttemptsWithoutSuccessfulSend;
      uint64_t v19 = @"NO";
      *(_DWORD *)buf = 67109634;
      if (v3) {
        uint64_t v19 = @"YES";
      }
      unsigned int v28 = v18;
      __int16 v29 = 1024;
      unsigned int v30 = v10;
      __int16 v31 = 2112;
      id v32 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Not retrying this validation { attemptsWithoutSuccessfulSend: %d, maxRetries: %d, shouldBypassRetry: %@ }",  buf,  0x18u);
    }

    self->_unsigned int numberOfAttemptsWithoutSuccessfulSend = 0;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine arbiter](self, "arbiter"));
    unsigned __int8 v21 = [v20 isValidationModeLegacy];

    if ((v21 & 1) == 0)
    {
      -[IDSPhoneNumberValidationStateMachine _popHighestPriorityPreflightVerification]( self,  "_popHighestPriorityPreflightVerification");
      self->_int64_t status = 1LL;
      int64_t v15 = 2LL;
LABEL_25:
      self->_reason = v15;
      -[IDSPhoneNumberValidationStateMachine _scheduleHeartbeat:](self, "_scheduleHeartbeat:", 20.0);
      goto LABEL_26;
    }

    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Max retries consumed -- failing phone number validation",  buf,  2u);
    }

    self->_int64_t status = 0LL;
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "10. Setting SMS status to: IDSSMSIdentificationStatusIdle",  buf,  2u);
    }

    int v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed sending registration Phone Number Validation request #%d, giving up",  self->_numberOfSuccessfulSends));
    sub_10012E874(0, @"Failed Phone Number Validation", v24, 1073LL);

    -[IDSPhoneNumberValidationStateMachine _notifyFailureWithError:](self, "_notifyFailureWithError:", 4LL);
  }

  else
  {
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No requestors -- we must have been cancelled",  buf,  2u);
    }

    -[IDSPhoneNumberValidationStateMachine _notifyFailureWithError:](self, "_notifyFailureWithError:", 0LL);
  }

- (void)handleRegistrationSMSSuccessfullyDeliveredWithTelephonyTimeout:(id)a3
{
  id v4 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v18 = _os_activity_create( (void *)&_mh_execute_header,  "SMS registration center handle SMS successfully delivered",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v18, &state);
  -[IDSPhoneNumberValidationStateMachine _cancelScheduledSMSTimeout](self, "_cancelScheduledSMSTimeout");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Registration request successfully delivered",  buf,  2u);
  }

  if (-[NSMutableArray count](self->_requestors, "count"))
  {
    ++self->_numberOfSuccessfulSends;
    -[IDSPhoneNumberValidationStateMachine persistNumberOfSuccessfulValidationSends:]( self,  "persistNumberOfSuccessfulValidationSends:");
    self->_unsigned int numberOfAttemptsWithoutSuccessfulSend = 0;
    -[IDSPhoneNumberValidationStateMachine _popHighestPriorityPreflightVerification]( self,  "_popHighestPriorityPreflightVerification");
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Succeeded sending registration Phone Number Validation request #%d",  self->_numberOfSuccessfulSends));
    sub_10012E874(0, @"Phone Number Validation Sending", v6, 1004LL);

    self->_int64_t status = 3LL;
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "11. Setting SMS status to: IDSSMSIdentificationStatusWaitingSMSIdentityVerificationResponse",  buf,  2u);
    }

    [v4 doubleValue];
    if (v8 <= 5.0)
    {
      double v11 = 1800.0;
    }

    else
    {
      double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v20 = *(double *)&v4;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Using telephony-provided timeout { telephonyTimeout: %@ }",  buf,  0xCu);
      }

      [v4 doubleValue];
      double v11 = v10;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationStateMachine arbiter](self, "arbiter"));
    [v13 minimumIntervalBetweenValidationAttempts];
    double v15 = v14;

    if (v11 <= v15) {
      double v11 = v15;
    }
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      double v20 = v11;
      __int16 v21 = 2048;
      double v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 0x409C200000000000LL;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Setting timeout for Phone Number Validation Request { timeoutInSeconds: %f, minimumReasonableTimeout: %f, defaul tTimeout: %f, telephonyTimeout: %@ }",  buf,  0x2Au);
    }

    -[IDSPhoneNumberValidationStateMachine _scheduleSMSTimeout:](self, "_scheduleSMSTimeout:", v11);
  }

  else
  {
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No requestors -- we must have been cancelled",  buf,  2u);
    }

    -[IDSPhoneNumberValidationStateMachine _notifyFailureWithError:](self, "_notifyFailureWithError:", 0LL);
    -[IDSPhoneNumberValidationStateMachine resetSMSCounter](self, "resetSMSCounter");
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v18);
}

- (void)handleIncomingSMSForResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneNumber]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 signature]);
  __int128 v42 = _os_activity_create( (void *)&_mh_execute_header,  "SMS registration center handle incoming SMS",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v42, &state);
  -[IDSPhoneNumberValidationStateMachine _cancelScheduledSMSTimeout](self, "_cancelScheduledSMSTimeout");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received registration request response SMS",  buf,  2u);
  }

  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = (objc_class *)objc_opt_class(v5, v9);
    double v11 = NSStringFromClass(v10);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412546;
    __int16 v44 = v5;
    __int16 v45 = 2112;
    objc_super v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Phone number: %@     Class: %@", buf, 0x16u);
  }

  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (objc_class *)objc_opt_class(v6, v14);
    __int16 v16 = NSStringFromClass(v15);
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138412546;
    __int16 v44 = v6;
    __int16 v45 = 2112;
    objc_super v46 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Signature: %@        Class: %@", buf, 0x16u);
  }

  sub_10012E874(0, @"Registration SMS", @"Received registration SMS", 1007LL);
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v18 timeIntervalSinceDate:self->_smsSendDate];
  double v20 = v19;

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
  FTAWDLogRegistrationPhoneNumberReceivedSMS(0LL, v21);

  id v22 = objc_alloc(&OBJC_CLASS___IDSRegistrationPhoneNumberReceivedSMSMetric);
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
  id v24 = [v22 initWithGuid:0 smsRoundTripDuration:v23];

  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v25 logMetric:v24];

  smsSendDate = self->_smsSendDate;
  self->_smsSendDate = 0LL;

  if ((id)-[IDSPhoneNumberValidationStateMachine status](self, "status") == (id)3)
  {
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v27);
    if ((objc_opt_isKindOfClass(v5, v28) & 1) != 0)
    {
      uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSData, v29);
      if ((objc_opt_isKindOfClass(v6, v30) & 1) != 0)
      {
        self->_int64_t status = 0LL;
        __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "12. Setting SMS status to: IDSSMSIdentificationStatusIdle",  buf,  2u);
        }

        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_100262718;
        v33[3] = &unk_1008F5F80;
        v33[4] = self;
        id v34 = v4;
        im_dispatch_after_primary_queue(v33, 0.0);
      }

      else
      {
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = sub_100262634;
        v35[3] = &unk_1008F5F80;
        id v36 = v6;
        uint64_t v37 = self;
        im_dispatch_after_primary_queue(v35, 0.0);
      }
    }

    else
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100262550;
      v38[3] = &unk_1008F5F80;
      id v39 = v5;
      __int128 v40 = self;
      im_dispatch_after_primary_queue(v38, 0.0);
    }
  }

  else
  {
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Discarding registration request response, because we are not in the correct state to accept it",  buf,  2u);
    }
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v42);
}

- (void)resetSMSCounter
{
  if (self->_numberOfSuccessfulSends)
  {
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int numberOfSuccessfulSends = self->_numberOfSuccessfulSends;
      int v7 = 67109120;
      unsigned int v8 = numberOfSuccessfulSends;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Resetting Phone Number Validation Attempt counter from %d to 0",  (uint8_t *)&v7,  8u);
    }

    self->_unsigned int numberOfSuccessfulSends = 0;
  }

  if (self->_numberOfPreflights)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int numberOfPreflights = self->_numberOfPreflights;
      int v7 = 67109120;
      unsigned int v8 = numberOfPreflights;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Resetting Phone Number Preflight attempts to 0 { _numberOfPreflights : %d }",  (uint8_t *)&v7,  8u);
    }

    self->_unsigned int numberOfPreflights = 0;
  }

  -[IDSPhoneNumberValidationStateMachine setCurrentPreflightStack:](self, "setCurrentPreflightStack:", 0LL);
  -[IDSPhoneNumberValidationStateMachine persistNumberOfSuccessfulValidationSends:]( self,  "persistNumberOfSuccessfulValidationSends:",  0LL);
  -[IDSPhoneNumberValidationStateMachine persistNumberOfPreflightAttempts:]( self,  "persistNumberOfPreflightAttempts:",  0LL);
}

- (void)timedOutWaitingForSMS
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  double v20 = _os_activity_create( (void *)&_mh_execute_header,  "SMS registration center timed out waiting for SMS",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v20, &state);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for Phone Number Validation response",  buf,  2u);
  }

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending another", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPhoneNumberValidationStateMachine _getHighestPriorityMechanism]( self,  "_getHighestPriorityMechanism"));
  id v6 = v5;
  if (v5 && [v5 type] == (id)1)
  {
    id v7 = -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          unsigned int v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v12, "validator:handleABCEvent:") & 1) != 0) {
            [v12 validator:self handleABCEvent:204];
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v21 count:16];
      }

      while (v9);
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Timed out waiting for Phone Number Validation request #%d",  self->_numberOfSuccessfulSends));
  sub_10012E874(0, @"Phone Number Validation Timeout", v13, 1073LL);

  -[IDSPhoneNumberValidationStateMachine handleRegistrationSMSDeliveryFailed]( self,  "handleRegistrationSMSDeliveryFailed");
  os_activity_scope_leave(&state);
  cut_arc_os_release(&v20);
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray nonRetainingArray](&OBJC_CLASS___NSMutableArray, "nonRetainingArray"));
      id v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }

    -[NSMutableArray addObject:](handlers, "addObject:", v7);
  }
}

- (void)removeListener:(id)a3
{
}

- (void)addPhoneNumberValidationRequestor:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    requestors = self->_requestors;
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = requestors;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Adding phone number valiation requestor { requestor: %@, requestors: %@ }",  (uint8_t *)&v7,  0x16u);
  }

  if (-[NSMutableArray count](self->_requestors, "count")) {
    -[IDSPhoneNumberValidationStateMachine _tryToSendSMSIdentification](self, "_tryToSendSMSIdentification");
  }
}

- (id)identifyPhoneNumberForRequestor:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[CUTPromiseSeal initWithQueue:](objc_alloc(&OBJC_CLASS___CUTPromiseSeal), "initWithQueue:", v6);

  -[NSMutableArray addObject:](self->_promises, "addObject:", v8);
  -[IDSPhoneNumberValidationStateMachine addPhoneNumberValidationRequestor:]( self,  "addPhoneNumberValidationRequestor:",  v7);

  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUTPromiseSeal promise](v8, "promise"));
  return v9;
}

- (void)removePhoneNumberValidationRequestor:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    requestors = self->_requestors;
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    double v11 = requestors;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Removing phone number valiation requestor { requestor: %@, requestors: %@ }",  (uint8_t *)&v8,  0x16u);
  }

  if (!-[NSMutableArray count](self->_requestors, "count"))
  {
    self->_int64_t status = 0LL;
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "13. Setting SMS status to: IDSSMSIdentificationStatusIdle",  (uint8_t *)&v8,  2u);
    }
  }
}

- (void)heartbeat
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Heartbeat", (uint8_t *)v14, 2u);
  }

  -[IDSPhoneNumberValidationStateMachine _cancelScheduledHeartbeat](self, "_cancelScheduledHeartbeat");
  if (_IMWillLog(@"Registration", v4))
  {
    switch(self->_status)
    {
      case 0LL:
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14[0]) = 0;
          id v6 = "    State: Idle";
          goto LABEL_15;
        }

        break;
      case 1LL:
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14[0]) = 0;
          id v6 = "    State: Waiting to begin Phone Number Validation request identity verification";
          goto LABEL_15;
        }

        break;
      case 2LL:
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14[0]) = 0;
          id v6 = "    State: Waiting for Phone Number Validation request identity delivery";
          goto LABEL_15;
        }

        break;
      case 3LL:
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14[0]) = 0;
          id v6 = "    State: Waiting for Phone Number Validation request identity response";
LABEL_15:
          int v8 = v5;
          uint32_t v9 = 2;
          goto LABEL_16;
        }

        break;
      default:
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int64_t status = self->_status;
          v14[0] = 67109120;
          v14[1] = status;
          id v6 = "    State: Unknown: %d";
          int v8 = v5;
          uint32_t v9 = 8;
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)v14, v9);
        }

        break;
    }
  }

  int64_t v10 = self->_status;
  if (v10 == 3)
  {
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      unsigned int v12 = "     ==> Waiting for identity response, waiting...";
      goto LABEL_37;
    }

- (unsigned)loadNumberOfSuccessfulValidationSends
{
  return IMGetCachedDomainIntForKey(@"com.apple.conference", @"TotalSMSAttempts");
}

- (void)persistNumberOfSuccessfulValidationSends:(unsigned int)a3
{
}

- (unsigned)loadNumberOfPreflightAttempts
{
  return IMGetCachedDomainIntForKey(@"com.apple.conference", @"TotalPreflightAttempts");
}

- (void)persistNumberOfPreflightAttempts:(unsigned int)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_int64_t status = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (IDSPhoneNumberValidationStateMachineMessageDelivery)httpMessageDelivery
{
  return self->_httpMessageDelivery;
}

- (void)setHttpMessageDelivery:(id)a3
{
}

- (IDSPhoneNumberValidationStateMachineLockdownManager)lockdownManager
{
  return self->_lockdownManager;
}

- (void)setLockdownManager:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (IDSPhoneNumberValidationModeArbiter)arbiter
{
  return self->_arbiter;
}

- (void)setArbiter:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IDSSystemAccountAdapter)systemAccountAdapter
{
  return self->_systemAccountAdapter;
}

- (void)setSystemAccountAdapter:(id)a3
{
}

- (IDSPreflightStackStore)preflighStackStore
{
  return self->_preflighStackStore;
}

- (void)setPreflighStackStore:(id)a3
{
}

- (id)inFlightHeartbeatBlock
{
  return self->_inFlightHeartbeatBlock;
}

- (void)setInFlightHeartbeatBlock:(id)a3
{
}

- (id)inFlightSMSTimeoutBlock
{
  return self->_inFlightSMSTimeoutBlock;
}

- (void)setInFlightSMSTimeoutBlock:(id)a3
{
}

- (IDSCTPNR)CTPNR
{
  return self->_CTPNR;
}

- (void)setCTPNR:(id)a3
{
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableArray)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (unsigned)numberOfSuccessfulSends
{
  return self->_numberOfSuccessfulSends;
}

- (void)setNumberOfSuccessfulSends:(unsigned int)a3
{
  self->_unsigned int numberOfSuccessfulSends = a3;
}

- (unsigned)numberOfAttemptsWithoutSuccessfulSend
{
  return self->_numberOfAttemptsWithoutSuccessfulSend;
}

- (void)setNumberOfAttemptsWithoutSuccessfulSend:(unsigned int)a3
{
  self->_unsigned int numberOfAttemptsWithoutSuccessfulSend = a3;
}

- (unsigned)numberOfPreflights
{
  return self->_numberOfPreflights;
}

- (void)setNumberOfPreflights:(unsigned int)a3
{
  self->_unsigned int numberOfPreflights = a3;
}

- (BOOL)isSMSWarningUp
{
  return self->_isSMSWarningUp;
}

- (void)setIsSMSWarningUp:(BOOL)a3
{
  self->_isSMSWarningUp = a3;
}

- (BOOL)hasAcceptedSMSRequest
{
  return self->_hasAcceptedSMSRequest;
}

- (void)setHasAcceptedSMSRequest:(BOOL)a3
{
  self->_hasAcceptedSMSRequest = a3;
}

- (BOOL)commCenterDead
{
  return self->_commCenterDead;
}

- (void)setCommCenterDead:(BOOL)a3
{
  self->_commCenterDead = a3;
}

- (BOOL)needsToCheckPhoneNumberState
{
  return self->_needsToCheckPhoneNumberState;
}

- (void)setNeedsToCheckPhoneNumberState:(BOOL)a3
{
  self->_needsToCheckPhoneNumberState = a3;
}

- (BOOL)didReceiveSIMSetupCompleteNotification
{
  return self->_didReceiveSIMSetupCompleteNotification;
}

- (void)setDidReceiveSIMSetupCompleteNotification:(BOOL)a3
{
  self->_BOOL didReceiveSIMSetupCompleteNotification = a3;
}

- (NSDate)nextSendSMSDate
{
  return self->_nextSendSMSDate;
}

- (void)setNextSendSMSDate:(id)a3
{
}

- (NSDate)phoneNumberValidationStartDate
{
  return self->_phoneNumberValidationStartDate;
}

- (void)setPhoneNumberValidationStartDate:(id)a3
{
}

- (NSDate)smsSendDate
{
  return self->_smsSendDate;
}

- (void)setSmsSendDate:(id)a3
{
}

- (IMTimer)lastSendSMSTimer
{
  return self->_lastSendSMSTimer;
}

- (void)setLastSendSMSTimer:(id)a3
{
}

- (IDSPersistentMap)dailyMetricData
{
  return self->_dailyMetricData;
}

- (void)setDailyMetricData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end