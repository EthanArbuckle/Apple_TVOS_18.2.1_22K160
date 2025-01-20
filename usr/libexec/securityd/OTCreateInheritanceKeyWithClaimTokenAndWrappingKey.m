@interface OTCreateInheritanceKeyWithClaimTokenAndWrappingKey
- (NSData)claimTokenData;
- (NSData)wrappingKeyData;
- (NSOperation)finishOp;
- (NSUUID)uuid;
- (OTCreateInheritanceKeyWithClaimTokenAndWrappingKey)initWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 dependencies:(id)a6;
- (OTInheritanceKey)ik;
- (OTInheritanceKey)oldIK;
- (OTOperationDependencies)deps;
- (void)groupStart;
- (void)proceedWithKeys:(id)a3 salt:(id)a4;
- (void)setClaimTokenData:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setIk:(id)a3;
- (void)setOldIK:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWrappingKeyData:(id)a3;
@end

@implementation OTCreateInheritanceKeyWithClaimTokenAndWrappingKey

- (OTCreateInheritanceKeyWithClaimTokenAndWrappingKey)initWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 dependencies:(id)a6
{
  v10 = (NSUUID *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___OTCreateInheritanceKeyWithClaimTokenAndWrappingKey;
  v14 = -[CKKSGroupOperation init](&v17, "init");
  if (v14)
  {
    v15 = v10;
    if (!v10) {
      v15 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    }
    objc_storeStrong((id *)&v14->_claimTokenData, v15);
    if (!v10) {

    }
    objc_storeStrong((id *)&v14->super._startOperation, a4);
    objc_storeStrong((id *)&v14->super._finishOperation, a5);
    objc_storeStrong((id *)&v14->super._internalSuccesses, a6);
  }

  return v14;
}

- (void)groupStart
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = objc_alloc(&OBJC_CLASS___OTFetchCKKSKeysOperation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey deps](self, "deps"));
  v7 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:]( v5,  "initWithDependencies:refetchNeeded:",  v6,  0LL);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_1000950C8;
  id v13 = &unk_100291A60;
  objc_copyWeak(&v16, &location);
  v8 = v7;
  v14 = v8;
  v15 = &stru_100294B48;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"setting-recovery-tlks",  &v10));
  objc_msgSend(v9, "addDependency:", v8, v10, v11, v12, v13);
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = objc_alloc(&OBJC_CLASS___OTInheritanceKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey uuid](self, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey claimTokenData](self, "claimTokenData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey wrappingKeyData](self, "wrappingKeyData"));
  id v28 = 0LL;
  uint64_t v11 = -[OTInheritanceKey initWithUUID:claimTokenData:wrappingKeyData:error:]( v7,  "initWithUUID:claimTokenData:wrappingKeyData:error:",  v8,  v9,  v10,  &v28);
  id v12 = v28;
  -[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey setIk:](self, "setIk:", v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey ik](self, "ik"));
  BOOL v14 = v13 == 0LL;

  if (v14)
  {
    v23 = sub_10001267C("SecError");
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "octagon: failed to create inheritance key (w/claimtoken+wrappingkey): %@",  buf,  0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v12);
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v17);
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey ik](self, "ik"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 recoveryKeyData]);
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v16 base64EncodedStringWithOptions:0]);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 cuttlefishXPCWrapper]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 activeAccount]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey uuid](self, "uuid"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100094E90;
    v26[3] = &unk_100284948;
    objc_copyWeak(&v27, &location);
    [v19 createCustodianRecoveryKeyWithSpecificUser:v21 recoveryKey:v17 salt:v6 ckksKeys:v25 uuid:v22 kind:2 reply:v26];

    objc_destroyWeak(&v27);
  }

  objc_destroyWeak(&location);
}

- (NSData)claimTokenData
{
  return (NSData *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setClaimTokenData:(id)a3
{
}

- (NSData)wrappingKeyData
{
  return (NSData *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setWrappingKeyData:(id)a3
{
}

- (OTInheritanceKey)ik
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setIk:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (OTInheritanceKey)oldIK
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setOldIK:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setFinishOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end