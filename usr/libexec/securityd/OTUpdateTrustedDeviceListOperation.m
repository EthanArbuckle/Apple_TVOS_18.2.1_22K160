@interface OTUpdateTrustedDeviceListOperation
- (BOOL)logForUpgrade;
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTUpdateTrustedDeviceListOperation)initWithDependencies:(id)a3 intendedState:(id)a4 listUpdatesState:(id)a5 errorState:(id)a6 retryFlag:(id)a7;
- (OctagonFlagString)retryFlag;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)stateIfListUpdates;
- (void)afterAuthKitFetch:(id)a3 userInitiatedRemovals:(id)a4 evictedRemovals:(id)a5 unknownReasonRemovals:(id)a6 trustedDeviceHash:(id)a7 deletedDeviceHash:(id)a8 trustedDevicesUpdateTimestamp:(id)a9 accountIsDemo:(BOOL)a10 version:(id)a11;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setLogForUpgrade:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setRetryFlag:(id)a3;
- (void)setStateIfListUpdates:(id)a3;
@end

@implementation OTUpdateTrustedDeviceListOperation

- (OTUpdateTrustedDeviceListOperation)initWithDependencies:(id)a3 intendedState:(id)a4 listUpdatesState:(id)a5 errorState:(id)a6 retryFlag:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___OTUpdateTrustedDeviceListOperation;
  v17 = -[CKKSGroupOperation init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 150), a3);
    objc_storeStrong((id *)(v18 + 142), a4);
    objc_storeStrong((id *)(v18 + 134), a6);
    objc_storeStrong((id *)(v18 + 158), a5);
    objc_storeStrong((id *)(v18 + 166), a7);
  }

  return (OTUpdateTrustedDeviceListOperation *)v18;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = sub_10001267C("octagon-authkit");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Attempting to update trusted device list",  buf,  2u);
  }

  v5 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeAccount]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 flowID]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceSessionID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  LOBYTE(v37) = [v13 permittedToSendMetrics];
  id v14 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v5,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v8,  v10,  v12,  kSecurityRTCEventNameUpdateTDL,  0LL,  v37,  kSecurityRTCEventCategoryAccountDataAccessRecovery);

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100071A74;
  v43[3] = &unk_100290FC8;
  objc_copyWeak(&v45, &location);
  v38 = v14;
  v44 = v38;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v43));
  -[OTUpdateTrustedDeviceListOperation setFinishedOp:](self, "setFinishedOp:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 activeAccount]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 altDSID]);

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v20 authKitAdapter]);
    id v42 = 0LL;
    unsigned __int8 v22 = [v21 accountIsDemoAccountByAltDSID:v19 error:&v42];
    id v23 = v42;

    if (v23)
    {
      v24 = sub_10001267C("SecError");
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v48 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "octagon-authkit: failed to fetch demo account flag: %@",  buf,  0xCu);
      }
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 authKitAdapter]);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 flowID]);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 deviceSessionID]);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100071DC0;
    v39[3] = &unk_100284410;
    objc_copyWeak(&v40, &location);
    unsigned __int8 v41 = v22;
    [v27 fetchCurrentDeviceListByAltDSID:v19 flowID:v29 deviceSessionID:v31 reply:v39];

    objc_destroyWeak(&v40);
  }

  else
  {
    v32 = sub_10001267C("authkit");
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 activeAccount]);
      *(_DWORD *)buf = 138412290;
      id v48 = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
    -[CKKSResultOperation setError:](self, "setError:", v36);

    id v23 = (id)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v23);
  }

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);
}

- (void)afterAuthKitFetch:(id)a3 userInitiatedRemovals:(id)a4 evictedRemovals:(id)a5 unknownReasonRemovals:(id)a6 trustedDeviceHash:(id)a7 deletedDeviceHash:(id)a8 trustedDevicesUpdateTimestamp:(id)a9 accountIsDemo:(BOOL)a10 version:(id)a11
{
  id v44 = a3;
  id v43 = a4;
  id v42 = a5;
  id v37 = a6;
  id v41 = a7;
  id v36 = a8;
  id v40 = a9;
  id v35 = a11;
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceInformationAdapter]);
  unsigned int v19 = [v18 isMachineIDOverridden];

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v20 cuttlefishXPCWrapper]);
  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v21 activeAccount]);
  unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 flowID]);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v39 deviceSessionID]);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  unsigned __int8 v25 = [v38 permittedToSendMetrics];
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTrustedDeviceListOperation deps](self, "deps"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 activeAccount]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 altDSID]);
  v32 = v21;
  uint64_t v29 = (v19 | a10) ^ 1;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000718A0;
  v45[3] = &unk_100284438;
  objc_copyWeak(&v47, location);
  id v30 = v35;
  id v46 = v30;
  LOBYTE(v31) = v25;
  [v34 setAllowedMachineIDsWithSpecificUser:v33 allowedMachineIDs:v44 userInitiatedRemovals:v43 evictedRemovals:v42 unknownReasonRemovals:v37 h onorIDMSListChanges:v29 version:v30 flowID:v23 deviceSessionID:v24 canSendMetrics:v31 altDSID:v28 trustedDeviceHash:v41 deletedDeviceHash:v36 truste dDevicesUpdateTimestamp:v40 reply:v45];

  objc_destroyWeak(&v47);
  objc_destroyWeak(location);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142LL, 1);
}

- (BOOL)logForUpgrade
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setLogForUpgrade:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (OctagonStateString)stateIfListUpdates
{
  return (OctagonStateString *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setStateIfListUpdates:(id)a3
{
}

- (OctagonFlagString)retryFlag
{
  return (OctagonFlagString *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setRetryFlag:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 174LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end