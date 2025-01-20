@interface EscrowRequestPerformEscrowEnrollOperation
+ (void)cdpUploadPrerecord:(id)a3 secretType:(unint64_t)a4 reply:(id)a5;
- (BOOL)checkFatalError:(id)a3;
- (BOOL)enforceRateLimiting;
- (CKKSLockStateTracker)lockStateTracker;
- (EscrowRequestPerformEscrowEnrollOperation)initWithIntendedState:(id)a3 errorState:(id)a4 enforceRateLimiting:(BOOL)a5 lockStateTracker:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (unint64_t)numberOfRecordsUploaded;
- (void)groupStart;
- (void)setEnforceRateLimiting:(BOOL)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setNextState:(id)a3;
- (void)setNumberOfRecordsUploaded:(unint64_t)a3;
@end

@implementation EscrowRequestPerformEscrowEnrollOperation

- (EscrowRequestPerformEscrowEnrollOperation)initWithIntendedState:(id)a3 errorState:(id)a4 enforceRateLimiting:(BOOL)a5 lockStateTracker:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___EscrowRequestPerformEscrowEnrollOperation;
  v14 = -[CKKSGroupOperation init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 142), a3);
    objc_storeStrong((id *)(v15 + 134), a4);
    v15[128] = a5;
    objc_storeStrong((id *)(v15 + 158), a6);
  }

  return (EscrowRequestPerformEscrowEnrollOperation *)v15;
}

- (BOOL)checkFatalError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_14;
  }
  if ([v3 code] == (id)24)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    uint64_t v6 = kSecureBackupErrorDomain;
    unsigned __int8 v7 = [v5 isEqualToString:kSecureBackupErrorDomain];

    if ((v7 & 1) != 0) {
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v6 = kSecureBackupErrorDomain;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if ([v8 isEqualToString:v6])
  {
    id v9 = [v4 code];

    if (v9 == (id)17) {
      goto LABEL_12;
    }
  }

  else
  {
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if (![v10 isEqualToString:CDPStateErrorDomain])
  {

    goto LABEL_14;
  }

  id v11 = [v4 code];

  if (v11 != (id)-5309LL)
  {
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }

- (void)groupStart
{
  id v3 = sub_10001267C("escrowrequest");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Attempting to escrow any pending prerecords",  buf,  2u);
  }

  id v53 = 0LL;
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[SecEscrowPendingRecord loadAllFromKeychain:]( &OBJC_CLASS___SecEscrowPendingRecord,  "loadAllFromKeychain:",  &v53));
  id v5 = v53;
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  if (([v7 isEqualToString:NSOSStatusErrorDomain] & 1) == 0)
  {

    goto LABEL_25;
  }

  BOOL v8 = [v6 code] == (id)-25300;

  if (!v8)
  {
LABEL_25:
    v19 = sub_10001267C("escrowrequest");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "failed to fetch records from keychain: %@",  buf,  0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestPerformEscrowEnrollOperation lockStateTracker](self, "lockStateTracker"));
    unsigned int v22 = [v21 isLockedError:v6];

    if (v22)
    {
      v23 = sub_10001267C("escrowrequest");
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Will retry after unlock", buf, 2u);
      }

      -[EscrowRequestPerformEscrowEnrollOperation setNextState:](self, "setNextState:", @"wait_for_unlock");
    }

    else
    {
      -[EscrowRequestPerformEscrowEnrollOperation setNextState:](self, "setNextState:", @"nothing_to_do");
    }

    goto LABEL_45;
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

- (unint64_t)numberOfRecordsUploaded
{
  return *(unint64_t *)((char *)&self->super._queue + 6);
}

- (void)setNumberOfRecordsUploaded:(unint64_t)a3
{
  *(OS_dispatch_queue **)((char *)&self->super._queue + 6) = (OS_dispatch_queue *)a3;
}

- (BOOL)enforceRateLimiting
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setEnforceRateLimiting:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)cdpUploadPrerecord:(id)a3 secretType:(unint64_t)a4 reply:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = objc_alloc(&OBJC_CLASS___CDPStateController);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CDPContext contextForPrimaryAccount](&OBJC_CLASS___CDPContext, "contextForPrimaryAccount"));
  id v11 = [v9 initWithContext:v10];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10009BD08;
  v14[3] = &unk_1002852A0;
  id v15 = v7;
  id v13 = v7;
  [v11 attemptToEscrowPreRecord:@"unknown-local-passcode" preRecordUUID:v12 secretType:a4 completion:v14];
}

@end