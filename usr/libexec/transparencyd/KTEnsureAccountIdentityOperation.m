@interface KTEnsureAccountIdentityOperation
- (BOOL)identityCreated;
- (KTEnsureAccountIdentityOperation)initWithDependencies:(id)a3 pcsOperation:(id)a4;
- (KTOperationDependencies)deps;
- (KTPCSOperationDependency)pcsOperation;
- (NSOperation)finishedOp;
- (NSString)identity;
- (OS_os_transaction)transaction;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setIdentityCreated:(BOOL)a3;
- (void)setPcsOperation:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation KTEnsureAccountIdentityOperation

- (KTEnsureAccountIdentityOperation)initWithDependencies:(id)a3 pcsOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___KTEnsureAccountIdentityOperation;
  v9 = -[KTGroupOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 134), a4);
    objc_storeStrong((id *)(v10 + 142), a3);
    v10[120] = 0;
  }

  return (KTEnsureAccountIdentityOperation *)v10;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation pcsOperation](self, "pcsOperation"));
  id v26 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getCurrentKTPCSIdentity:off_1002E5928 error:&v26]);
  id v5 = v26;

  if (v4)
  {
    -[KTEnsureAccountIdentityOperation setIdentity:]( self,  "setIdentity:",  PCSIdentityGetPublicKey([v4 identity]));
    goto LABEL_20;
  }

  if ([v5 code] == (id)-25300)
  {
    if (qword_1002E6520 != -1) {
      dispatch_once(&qword_1002E6520, &stru_10027ADA0);
    }
    v6 = (os_log_s *)qword_1002E6528;
    if (os_log_type_enabled((os_log_t)qword_1002E6528, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "There is no identity, ok to continue creating one",  buf,  2u);
    }

    goto LABEL_10;
  }

  if ([v5 code] == (id)27)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    unsigned __int8 v8 = [v7 isEqual:kPCSErrorDomain];

    if ((v8 & 1) != 0)
    {
LABEL_10:
      v9 = (void *)os_transaction_create("ManateeIdentityCreate-KTAccountKey");
      -[KTEnsureAccountIdentityOperation setTransaction:](self, "setTransaction:", v9);

      v10 = objc_alloc_init(&OBJC_CLASS___NSOperation);
      -[KTEnsureAccountIdentityOperation setFinishedOp:](self, "setFinishedOp:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation finishedOp](self, "finishedOp"));
      -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v11);

      id v12 = (id)objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation pcsOperation](self, "pcsOperation"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10004D834;
      v25[3] = &unk_10027AE48;
      v25[4] = self;
      [v12 createManateeIdentity:0 service:off_1002E5928 complete:v25];
LABEL_11:

      goto LABEL_20;
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lockStateTracker]);
  unsigned int v15 = [v14 isLockedError:v5];

  if (v15)
  {
    -[KTResultOperation setError:](self, "setError:", v5);
    goto LABEL_20;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation deps](self, "deps"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 reachabilityTracker]);
  unsigned int v19 = objc_msgSend((id)objc_opt_class(v17, v18), "isNetworkError:", v5);

  if (v19)
  {
    -[KTResultOperation setError:](self, "setError:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 networkTimeout]);
    [v21 networkWithFeedback:1];

    goto LABEL_20;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:errorLevel:underlyingError:description:",  kTransparencyErrorInterface,  -350LL,  4LL,  v5,  @"Identity creation failed"));
  -[KTResultOperation setError:](self, "setError:", v22);

  if (qword_1002E6520 != -1) {
    dispatch_once(&qword_1002E6520, &stru_10027ADC0);
  }
  v23 = (void *)qword_1002E6528;
  if (os_log_type_enabled((os_log_t)qword_1002E6528, OS_LOG_TYPE_ERROR))
  {
    id v12 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
    *(_DWORD *)buf = 138412290;
    v28 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "createManateeIdentity no identity returned: %@",  buf,  0xCu);

    goto LABEL_11;
  }

- (BOOL)identityCreated
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setIdentityCreated:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (NSString)identity
{
  return (NSString *)objc_getProperty(self, a2, 126LL, 1);
}

- (void)setIdentity:(id)a3
{
}

- (KTPCSOperationDependency)pcsOperation
{
  return (KTPCSOperationDependency *)objc_getProperty(self, a2, 134LL, 1);
}

- (void)setPcsOperation:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end