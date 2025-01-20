@interface EscrowRequestInformCloudServicesOperation
+ (id)triggerCloudServicesPasscodeRequest:(id)a3 serializedReason:(id)a4 error:(id *)a5;
- (CKKSLockStateTracker)lockStateTracker;
- (EscrowRequestInformCloudServicesOperation)initWithIntendedState:(id)a3 errorState:(id)a4 lockStateTracker:(id)a5;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)main;
- (void)setLockStateTracker:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation EscrowRequestInformCloudServicesOperation

- (EscrowRequestInformCloudServicesOperation)initWithIntendedState:(id)a3 errorState:(id)a4 lockStateTracker:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___EscrowRequestInformCloudServicesOperation;
  v12 = -[CKKSResultOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->super._successDependencies, a3);
    objc_storeStrong((id *)&v13->super._descriptionUnderlyingError, a4);
    objc_storeStrong((id *)&v13->super._timeoutQueue, a5);
  }

  return v13;
}

- (void)main
{
  v3 = sub_10001267C("escrowrequest");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Telling CloudServices about any pending requests",  buf,  2u);
  }

  id v53 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SecEscrowPendingRecord loadAllFromKeychain:]( &OBJC_CLASS___SecEscrowPendingRecord,  "loadAllFromKeychain:",  &v53));
  id v6 = v53;
  id v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v8 isEqualToString:NSOSStatusErrorDomain])
    {
      id v9 = [v7 code];

      if (v9 == (id)-25300LL) {
        goto LABEL_6;
      }
    }

    else
    {
    }

    v32 = sub_10001267C("escrowrequest");
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "failed to fetch records from keychain: %@",  buf,  0xCu);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestInformCloudServicesOperation lockStateTracker](self, "lockStateTracker"));
    unsigned int v35 = [v34 isLockedError:v7];

    if (v35)
    {
      v36 = sub_10001267C("escrowrequest");
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Trying again after unlock", buf, 2u);
      }

      v38 = &off_100291588;
    }

    else
    {
      v38 = &off_100291590;
    }

    -[EscrowRequestInformCloudServicesOperation setNextState:](self, "setNextState:", *v38);
    -[CKKSResultOperation setError:](self, "setError:", v7);
    goto LABEL_50;
  }

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88LL, 1);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)triggerCloudServicesPasscodeRequest:(id)a3 serializedReason:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[SecureBackup alloc] initWithUserActivityLabel:@"passcodeRequest"];
  id v10 = [[SecureBackupEscrowReason alloc] initWithData:v7];

  id v22 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 beginHSA2PasscodeRequest:1 uuid:v8 reason:v10 error:&v22]);

  id v12 = v22;
  uint64_t v13 = v12;
  if (v11) {
    BOOL v14 = v12 == 0LL;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 cert]);

    if (v18)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v11 cert]);
      goto LABEL_15;
    }

    v19 = sub_10001267C("SecError");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "escrowrequest: sbd failed to cache a certificate",  buf,  2u);
    }

LABEL_14:
    v17 = 0LL;
    goto LABEL_15;
  }

  objc_super v15 = sub_10001267C("SecError");
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "escrowrequest: unable to begin passcode request: %@",  buf,  0xCu);
  }

  if (!a5) {
    goto LABEL_14;
  }
  v17 = 0LL;
  *a5 = v13;
LABEL_15:

  return v17;
}

@end