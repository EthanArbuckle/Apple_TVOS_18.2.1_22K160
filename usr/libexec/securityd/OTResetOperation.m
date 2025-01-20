@interface OTResetOperation
- (BOOL)isGuitarfish;
- (BOOL)notifyIdMS;
- (CuttlefishXPCWrapper)cuttlefishXPCWrapper;
- (NSOperation)finishedOp;
- (NSString)containerName;
- (NSString)contextID;
- (NSString)idmsCuttlefishPassword;
- (NSString)idmsTargetContext;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)init:(id)a3 contextID:(id)a4 reason:(int64_t)a5 idmsTargetContext:(id)a6 idmsCuttlefishPassword:(id)a7 notifyIdMS:(BOOL)a8 isGuitarfish:(BOOL)a9 accountType:(int64_t)a10 intendedState:(id)a11 dependencies:(id)a12 errorState:(id)a13 cuttlefishXPCWrapper:(id)a14;
- (int64_t)accountType;
- (int64_t)resetReason;
- (void)groupStart;
- (void)setAccountType:(int64_t)a3;
- (void)setContainerName:(id)a3;
- (void)setContextID:(id)a3;
- (void)setCuttlefishXPCWrapper:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIdmsCuttlefishPassword:(id)a3;
- (void)setIdmsTargetContext:(id)a3;
- (void)setIsGuitarfish:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setNotifyIdMS:(BOOL)a3;
- (void)setResetReason:(int64_t)a3;
@end

@implementation OTResetOperation

- (id)init:(id)a3 contextID:(id)a4 reason:(int64_t)a5 idmsTargetContext:(id)a6 idmsCuttlefishPassword:(id)a7 notifyIdMS:(BOOL)a8 isGuitarfish:(BOOL)a9 accountType:(int64_t)a10 intendedState:(id)a11 dependencies:(id)a12 errorState:(id)a13 cuttlefishXPCWrapper:(id)a14
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a6;
  id v28 = a7;
  id v27 = a11;
  id v26 = a12;
  id v25 = a13;
  id v19 = a14;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___OTResetOperation;
  v20 = -[CKKSGroupOperation init](&v32, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)(v20 + 134), a11);
    objc_storeStrong((id *)(v21 + 142), a13);
    objc_storeStrong((id *)(v21 + 182), a3);
    objc_storeStrong((id *)(v21 + 190), a4);
    objc_storeStrong((id *)(v21 + 198), a14);
    *(void *)(v21 + 150) = a5;
    objc_storeStrong((id *)(v21 + 158), a6);
    objc_storeStrong((id *)(v21 + 166), a7);
    v21[128] = a8;
    objc_storeStrong((id *)(v21 + 206), a12);
    v21[129] = a9;
    *(void *)(v21 + 174) = a10;
  }

  return v21;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon-authkit");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to reset octagon", buf, 2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTResetOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);

  if (v33)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation deps](self, "deps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 authKitAdapter]);
    id v36 = 0LL;
    unsigned __int8 v30 = [v10 accountIsDemoAccountByAltDSID:v33 error:&v36];
    id v32 = v36;

    if (v32)
    {
      v13 = sub_10001267C("SecError");
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "octagon-authkit: failed to fetch demo account flag: %@",  buf,  0xCu);
      }
    }

    unsigned int IsInternalRelease = SecIsInternalRelease(v11, v12);
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation deps](self, "deps"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activeAccount]);
    int64_t v17 = -[OTResetOperation resetReason](self, "resetReason");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation idmsTargetContext](self, "idmsTargetContext"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation idmsCuttlefishPassword](self, "idmsCuttlefishPassword"));
    BOOL v20 = -[OTResetOperation notifyIdMS](self, "notifyIdMS");
    unsigned __int8 v21 = -[OTResetOperation isGuitarfish](self, "isGuitarfish");
    int64_t v22 = -[OTResetOperation accountType](self, "accountType");
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100187D74;
    v34[3] = &unk_1002915E0;
    objc_copyWeak(&v35, (id *)buf);
    BYTE1(v28) = v21;
    LOBYTE(v28) = v30;
    objc_msgSend( v31,  "resetWithSpecificUser:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount: isGuitarfish:accountType:reply:",  v16,  v17,  v18,  v19,  v20,  IsInternalRelease,  v28,  v22,  v34);

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    v23 = sub_10001267C("authkit");
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation deps](self, "deps"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 activeAccount]);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
    -[CKKSResultOperation setError:](self, "setError:", v27);

    id v32 = (id)objc_claimAutoreleasedReturnValue(-[OTResetOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v32);
  }
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

- (int64_t)resetReason
{
  return *(int64_t *)((char *)&self->super._queue + 6);
}

- (void)setResetReason:(int64_t)a3
{
  *(OS_dispatch_queue **)((char *)&self->super._queue + 6) = (OS_dispatch_queue *)a3;
}

- (NSString)idmsTargetContext
{
  return (NSString *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setIdmsTargetContext:(id)a3
{
}

- (NSString)idmsCuttlefishPassword
{
  return (NSString *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setIdmsCuttlefishPassword:(id)a3
{
}

- (BOOL)notifyIdMS
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setNotifyIdMS:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (BOOL)isGuitarfish
{
  return BYTE1(self->super._startOperation) & 1;
}

- (void)setIsGuitarfish:(BOOL)a3
{
  BYTE1(self->super._startOperation) = a3;
}

- (int64_t)accountType
{
  return *(int64_t *)((char *)&self->_intendedState + 6);
}

- (void)setAccountType:(int64_t)a3
{
  *(OctagonStateString **)((char *)&self->_intendedState + 6) = (OctagonStateString *)a3;
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 182LL, 1);
}

- (void)setContainerName:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 190LL, 1);
}

- (void)setContextID:(id)a3
{
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 198LL, 1);
}

- (void)setCuttlefishXPCWrapper:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 206LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 214LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end