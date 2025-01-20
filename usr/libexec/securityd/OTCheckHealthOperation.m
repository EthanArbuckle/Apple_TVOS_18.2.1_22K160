@interface OTCheckHealthOperation
- (BOOL)checkIfPasscodeIsSetForDevice;
- (BOOL)repair;
- (BOOL)reportRateLimitingError;
- (BOOL)requiresEscrowCheck;
- (BOOL)skipRateLimitingCheck;
- (NSOperation)finishOp;
- (OTCheckHealthOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 skipRateLimitedCheck:(BOOL)a7 reportRateLimitingError:(BOOL)a8 repair:(BOOL)a9;
- (OTDeviceInformation)deviceInfo;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (TrustedPeersHelperHealthCheckResult)results;
- (void)groupStart;
- (void)handleRepairSuggestions:(id)a3;
- (void)setDeps:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setRequiresEscrowCheck:(BOOL)a3;
- (void)setResults:(id)a3;
@end

@implementation OTCheckHealthOperation

- (OTCheckHealthOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 skipRateLimitedCheck:(BOOL)a7 reportRateLimitingError:(BOOL)a8 repair:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___OTCheckHealthOperation;
  v18 = -[CKKSGroupOperation init](&v22, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 166), a3);
    objc_storeStrong((id *)(v19 + 134), a4);
    objc_storeStrong((id *)(v19 + 142), a5);
    v20 = *(void **)(v19 + 158);
    *(void *)(v19 + 158) = 0LL;

    v19[128] = a7;
    v19[129] = a8;
    v19[130] = a9;
  }

  return (OTCheckHealthOperation *)v19;
}

- (BOOL)checkIfPasscodeIsSetForDevice
{
  __int16 v14 = -21846;
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[2] = v2;
  v13[3] = v2;
  v13[0] = v2;
  v13[1] = v2;
  int v3 = sub_100006200(-3, (uint64_t)v13);
  if (v3)
  {
    BOOL v4 = v3;
    v5 = sub_10001267C("SecError");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      BOOL v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "octagon-health: aks_get_device_state failed with: %d",  (uint8_t *)&v11,  8u);
    }

    BOOL v7 = 0;
  }

  else
  {
    BOOL v7 = DWORD1(v13[0]) != 3;
  }

  v8 = sub_10001267C("octagon-health");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    BOOL v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "checkIfPasscodeIsSetForDevice is %{BOOL}d",  (uint8_t *)&v11,  8u);
  }

  return v7;
}

- (void)groupStart
{
  int v3 = sub_10001267C("octagon-health");
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning cuttlefish health checkup", buf, 2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTCheckHealthOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  unsigned __int8 v7 = -[OTCheckHealthOperation skipRateLimitingCheck](self, "skipRateLimitingCheck");
  v8 = sub_10001267C("octagon-health");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) != 0)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NOT running rate limiting checks!", buf, 2u);
    }

    goto LABEL_6;
  }

  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "running rate limiting checks!", buf, 2u);
  }

  -[CKKSResultOperation setError:](self, "setError:", 0LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stateHolder]);
  id v63 = 0LL;
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 lastHealthCheckupDate:&v63]);
  id v21 = v63;

  objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 lockStateTracker]);
  LODWORD(v20) = [v23 isLockedError:v21];

  v24 = sub_10001267C("octagon-health");
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (!(_DWORD)v20)
  {
    if (v26)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "last health check timestamp: %@", buf, 0xCu);
    }

    v28 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    else {
      uint64_t v30 = -72LL;
    }
    -[NSDateComponents setHour:](v28, "setHour:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v59 = (void *)objc_claimAutoreleasedReturnValue([v32 dateByAddingComponents:v28 toDate:v31 options:0]);

    if (v9 && -[os_log_s compare:](v9, "compare:", v59) != (id)-1LL)
    {
      v33 = sub_10001267C("octagon-health");
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Last update is within 3 days (%@); rate-limiting this operation",
          buf,
          0xCu);
      }

      id v35 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Rate-limited the OTCheckHealthOperation:%@",  v9));
      NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
      id v65 = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"securityd",  -67671LL,  v36));

      v38 = sub_10001267C("octagon-health");
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v37;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "rate limited! %@", buf, 0xCu);
      }

      if (-[OTCheckHealthOperation reportRateLimitingError](self, "reportRateLimitingError"))
      {
        -[CKKSResultOperation setError:](self, "setError:", v37);
      }

      else
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation intendedState](self, "intendedState"));
        -[OTCheckHealthOperation setNextState:](self, "setNextState:", v53);
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v54);

      goto LABEL_42;
    }

    v40 = sub_10001267C("octagon-health");
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v9;
      __int16 v67 = 2112;
      v68 = v59;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Not rate-limiting: last updated %@ vs %@",  buf,  0x16u);
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
    uint64_t v43 = objc_claimAutoreleasedReturnValue([v42 stateHolder]);
    id v62 = 0LL;
    unsigned __int8 v44 = [(id)v43 persistLastHealthCheck:v31 error:&v62];
    id v35 = v62;

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v45 lockStateTracker]);
    LOBYTE(v43) = [v46 isLockedError:v35];

    if ((v43 & 1) != 0)
    {
      v47 = sub_10001267C("octagon-health");
      v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
      if (!os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_DEFAULT))
      {
LABEL_41:

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation finishOp](self, "finishOp"));
        -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v37);
LABEL_42:

        return;
      }

      *(_WORD *)buf = 0;
      v49 = "device is locked, not performing cuttlefish check";
      v50 = (os_log_s *)v48;
      uint32_t v51 = 2;
    }

    else
    {
      if (v35) {
        unsigned __int8 v52 = 0;
      }
      else {
        unsigned __int8 v52 = v44;
      }
      if ((v52 & 1) != 0)
      {

LABEL_6:
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
        v56 = (void *)objc_claimAutoreleasedReturnValue([v58 cuttlefishXPCWrapper]);
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v57 activeAccount]);
        BOOL v12 = -[OTCheckHealthOperation checkIfPasscodeIsSetForDevice](self, "checkIfPasscodeIsSetForDevice");
        BOOL v13 = -[OTCheckHealthOperation repair](self, "repair");
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 flowID]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceSessionID]);
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472LL;
        v60[2] = sub_10003D5B0;
        v60[3] = &unk_100283E88;
        objc_copyWeak(&v61, (id *)buf);
        [v56 requestHealthCheckWithSpecificUser:v11 requiresEscrowCheck:v12 repair:v13 knownFederations:v14 flowID:v16 deviceSessionID:v18 reply:v60];

        objc_destroyWeak(&v61);
        objc_destroyWeak((id *)buf);
        return;
      }

      v55 = sub_10001267C("SecError");
      v48 = (void *)objc_claimAutoreleasedReturnValue(v55);
      if (!os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v35;
      v49 = "octagon-health: failed to persist last health check value:%@";
      v50 = (os_log_s *)v48;
      uint32_t v51 = 12;
    }

    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
    goto LABEL_41;
  }

  if (v26)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "device is locked, not performing cuttlefish check",  buf,  2u);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v27);
}

- (void)handleRepairSuggestions:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation results](self, "results"));
  unsigned int v5 = [v4 resetOctagon];

  if (v5)
  {
    v6 = sub_10001267C("octagon-health");
    unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Resetting Octagon as per Cuttlefish request",  buf,  2u);
    }

    v8 = @"HealthCheckReset";
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation results](self, "results"));
    unsigned int v10 = [v9 leaveTrust];

    if (!v10)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation intendedState](self, "intendedState"));
      -[OTCheckHealthOperation setNextState:](self, "setNextState:", v13);

      goto LABEL_11;
    }

    int v11 = sub_10001267C("octagon-health");
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Leaving clique as per Cuttlefish request",  v15,  2u);
    }

    v8 = @"HealthCheckLeaveClique";
  }

  -[OTCheckHealthOperation setNextState:](self, "setNextState:", v8);
LABEL_11:
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v14);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134LL, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setDeviceInfo:(id)a3
{
}

- (BOOL)skipRateLimitingCheck
{
  return (uint64_t)self->super._startOperation & 1;
}

- (BOOL)reportRateLimitingError
{
  return BYTE1(self->super._startOperation) & 1;
}

- (BOOL)repair
{
  return BYTE2(self->super._startOperation) & 1;
}

- (TrustedPeersHelperHealthCheckResult)results
{
  return (TrustedPeersHelperHealthCheckResult *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setResults:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 174LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (BOOL)requiresEscrowCheck
{
  return BYTE3(self->super._startOperation) & 1;
}

- (void)setRequiresEscrowCheck:(BOOL)a3
{
  BYTE3(self->super._startOperation) = a3;
}

- (void).cxx_destruct
{
}

@end