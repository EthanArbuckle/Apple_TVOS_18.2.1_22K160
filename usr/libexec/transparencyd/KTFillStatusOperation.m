@interface KTFillStatusOperation
+ (id)memoizedKTSelfStatusResult:(id)a3;
- (BOOL)initialFill;
- (KTFillStatusOperation)initWithApplication:(id)a3 initialFill:(BOOL)a4 dependencies:(id)a5 intendedState:(id)a6 errorState:(id)a7;
- (KTOperationDependencies)deps;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (NSString)application;
- (void)fillBackgroundStatus;
- (void)fillOptInState;
- (void)fillSelfStatus;
- (void)fillSystemStatus;
- (void)groupStart;
- (void)setApplication:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setInitialFill:(BOOL)a3;
- (void)setNextState:(id)a3;
@end

@implementation KTFillStatusOperation

- (KTFillStatusOperation)initWithApplication:(id)a3 initialFill:(BOOL)a4 dependencies:(id)a5 intendedState:(id)a6 errorState:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___KTFillStatusOperation;
  v17 = -[KTGroupOperation init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 142), a5);
    objc_storeStrong((id *)(v18 + 150), a3);
    objc_storeStrong((id *)(v18 + 126), a6);
    objc_storeStrong((id *)(v18 + 134), a7);
    v18[120] = a4;
  }

  return (KTFillStatusOperation *)v18;
}

+ (id)memoizedKTSelfStatusResult:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 smDataStore]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getSettingsData:@"KTSelfStatusResult"]);

  if (v4)
  {
    id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___KTSelfStatusResult, v5),  v4,  0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (void)groupStart
{
  if (qword_1002E6480 != -1) {
    dispatch_once(&qword_1002E6480, &stru_1002788E0);
  }
  v3 = (os_log_s *)qword_1002E6488;
  if (os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "FillStatus: start", (uint8_t *)&v13, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stateMonitor]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 ktStatus]);
  id v7 = [v6 accountStatus];

  if (v7)
  {
    -[KTFillStatusOperation fillOptInState](self, "fillOptInState");
    -[KTFillStatusOperation fillSystemStatus](self, "fillSystemStatus");
    if (-[KTFillStatusOperation initialFill](self, "initialFill")) {
      -[KTFillStatusOperation fillSelfStatus](self, "fillSelfStatus");
    }
    [v5 setPendingChanges:0];
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 ktStatus]);
    if (v8) {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  0LL));
    }
    else {
      v9 = 0LL;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 smDataStore]);
    [v11 setSettingsData:@"KTSelfStatusResult" data:v9];

    if (qword_1002E6480 != -1) {
      dispatch_once(&qword_1002E6480, &stru_100278900);
    }
    v12 = (os_log_s *)qword_1002E6488;
    if (os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "FillStatus: filled: %@", (uint8_t *)&v13, 0xCu);
    }
  }

  else
  {
    -[KTFillStatusOperation setNextState:](self, "setNextState:", @"Initializing");
  }
}

- (void)fillBackgroundStatus
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stateMonitor]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 smDataStore]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getSettingsNumber:off_1002DE048]);

  if (v7)
  {
    if (qword_1002E6480 != -1) {
      dispatch_once(&qword_1002E6480, &stru_100278940);
    }
    v8 = (os_log_s *)qword_1002E6488;
    if (os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "FillStatus: last background verification result %{public}@",  (uint8_t *)&v11,  0xCu);
    }

    else {
      uint64_t v9 = 2LL;
    }
  }

  else
  {
    if (qword_1002E6480 != -1) {
      dispatch_once(&qword_1002E6480, &stru_100278920);
    }
    v10 = (os_log_s *)qword_1002E6488;
    if (os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "FillStatus: no stored background result, defaulting to OK",  (uint8_t *)&v11,  2u);
    }

    uint64_t v9 = 0LL;
  }

  [v4 setSystemStatus:v9];
}

- (void)fillSystemStatus
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stateMonitor]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ktStatus]);
  id v6 = [v5 systemStatus];

  if (v6 != (id)5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 publicKeyStore]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation application](self, "application"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationPublicKeyStore:v9]);

    if (v10)
    {
      if ([v10 ready])
      {
        int v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation application](self, "application"));
        unsigned int v12 = objc_msgSend( v4,  "treeStateUnstable:logBeginTime:",  v11,  objc_msgSend(v10, "patLogBeginningMs"));

        if (v12)
        {
          if (qword_1002E6480 != -1) {
            dispatch_once(&qword_1002E6480, &stru_1002789A0);
          }
          int v13 = (os_log_s *)qword_1002E6488;
          if (os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "FillStatus: system status is tree reset populating",  buf,  2u);
          }

          if ((_os_feature_enabled_impl("Transparency", "KTDisableTreeResetStatus") & 1) == 0)
          {
            v21 = v4;
            uint64_t v22 = 3LL;
            goto LABEL_31;
          }

          if (qword_1002E6480 != -1) {
            dispatch_once(&qword_1002E6480, &stru_1002789C0);
          }
          id v14 = (os_log_s *)qword_1002E6488;
          if (os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "FillStatus: overriding tree reset system status",  v24,  2u);
          }
        }

        if (_os_feature_enabled_impl("Transparency", "KTBackgroundVerificationUI"))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 ktStatus]);
          id v16 = [v15 optIn];

          if (v16)
          {
            if (qword_1002E6480 != -1) {
              dispatch_once(&qword_1002E6480, &stru_1002789E0);
            }
            v17 = (os_log_s *)qword_1002E6488;
            if (os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v23 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "FillStatus: reading background verification status",  v23,  2u);
            }

            -[KTFillStatusOperation fillBackgroundStatus](self, "fillBackgroundStatus");
            goto LABEL_32;
          }
        }

        v21 = v4;
        uint64_t v22 = 0LL;
LABEL_31:
        [v21 setSystemStatus:v22];
LABEL_32:

        goto LABEL_33;
      }

      if (qword_1002E6480 != -1) {
        dispatch_once(&qword_1002E6480, &stru_100278980);
      }
      v18 = (os_log_s *)qword_1002E6488;
      if (!os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        v21 = v4;
        uint64_t v22 = 4LL;
        goto LABEL_31;
      }

      *(_WORD *)v26 = 0;
      v19 = "FillStatus: key store not ready";
      objc_super v20 = v26;
    }

    else
    {
      if (qword_1002E6480 != -1) {
        dispatch_once(&qword_1002E6480, &stru_100278960);
      }
      v18 = (os_log_s *)qword_1002E6488;
      if (!os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      __int16 v27 = 0;
      v19 = "FillStatus: no key store";
      objc_super v20 = (uint8_t *)&v27;
    }

    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, v20, 2u);
    goto LABEL_30;
  }

- (void)fillSelfStatus
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stateMonitor]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountKeyService]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation application](self, "application"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountKeyService:v7]);

  id v18 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 publicPublicKey:&v18]);
  id v10 = v18;
  if (v9)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dataStore]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation application](self, "application"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100025FFC;
    v16[3] = &unk_100278AE8;
    id v17 = v4;
    [v12 performAndWaitForLatestSelfRequest:v13 accountKey:v9 block:v16];
  }

  else
  {
    if (qword_1002E6480 != -1) {
      dispatch_once(&qword_1002E6480, &stru_100278B08);
    }
    id v14 = (os_log_s *)qword_1002E6488;
    if (os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "FillStatus: unable to get account key for latest self status",  v15,  2u);
    }

    [v4 setSelfStatus:2];
  }
}

- (void)fillOptInState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stateMonitor]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudRecords]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation application](self, "application"));
    id v18 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 getAggregateOptInStateForApplication:v7 error:&v18]);
    id v9 = v18;

    if (v8)
    {
      id v10 = [v8 state];
      id v11 = [v8 everOptIn];
      unsigned int v12 = v4;
      uint64_t v13 = (uint64_t)v10;
LABEL_19:
      [v12 setOptInState:v13 everOptIn:v11];

      goto LABEL_20;
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    if ([v15 isEqual:@"com.apple.Transparency"])
    {
      id v16 = [v9 code];

      if (v16 == (id)9)
      {
        unsigned int v12 = v4;
        uint64_t v13 = 0LL;
LABEL_18:
        id v11 = 0LL;
        goto LABEL_19;
      }
    }

    else
    {
    }

    if (qword_1002E6480 != -1) {
      dispatch_once(&qword_1002E6480, &stru_100278B28);
    }
    id v17 = (os_log_s *)qword_1002E6488;
    if (os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "FillStatus: unable to get opt-in for status: %@",  buf,  0xCu);
    }

    unsigned int v12 = v4;
    uint64_t v13 = 2LL;
    goto LABEL_18;
  }

  if (qword_1002E6480 != -1) {
    dispatch_once(&qword_1002E6480, &stru_100278B48);
  }
  id v14 = (os_log_s *)qword_1002E6488;
  if (os_log_type_enabled((os_log_t)qword_1002E6488, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "FillStatus: No cloud records to fill status",  buf,  2u);
  }

  [v4 setOptInState:2 everOptIn:0];
LABEL_20:
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 126LL, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 134LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (BOOL)initialFill
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setInitialFill:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (void).cxx_destruct
{
}

@end