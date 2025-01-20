@interface KTCheckIDSRegistrationOperation
+ (BOOL)checkPCSKTSignature:(id)a3 data:(id)a4 signature:(id)a5;
- (BOOL)hasRecentlyDoneHSA2Upsell;
- (KTCheckIDSRegistrationInterface)idsRegistrationInterface;
- (KTCheckIDSRegistrationOperation)initWithDependencies:(id)a3 application:(id)a4 pcs:(id)a5 idsRegistrationInterface:(id)a6;
- (KTOperationDependencies)deps;
- (KTPCSOperationDependency)pcsOperation;
- (NSOperation)finishedOp;
- (NSString)application;
- (int64_t)checkIDSResult;
- (void)groupStart;
- (void)setApplication:(id)a3;
- (void)setCheckIDSError:(int64_t)a3;
- (void)setCheckIDSResult:(int64_t)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIdsRegistrationInterface:(id)a3;
- (void)setPcsOperation:(id)a3;
@end

@implementation KTCheckIDSRegistrationOperation

- (KTCheckIDSRegistrationOperation)initWithDependencies:(id)a3 application:(id)a4 pcs:(id)a5 idsRegistrationInterface:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___KTCheckIDSRegistrationOperation;
  v14 = -[KTGroupOperation init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    -[KTCheckIDSRegistrationOperation setDeps:](v14, "setDeps:", v10);
    -[KTCheckIDSRegistrationOperation setApplication:](v15, "setApplication:", v11);
    -[KTCheckIDSRegistrationOperation setPcsOperation:](v15, "setPcsOperation:", v12);
    -[KTCheckIDSRegistrationOperation setIdsRegistrationInterface:](v15, "setIdsRegistrationInterface:", v13);
    -[KTCheckIDSRegistrationOperation setCheckIDSResult:](v15, "setCheckIDSResult:", 0LL);
    v16 = v15;
  }

  return v15;
}

+ (BOOL)checkPCSKTSignature:(id)a3 data:(id)a4 signature:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = PCSPublicIdentityCreateWithPublicKeyInfo(a3, 0LL);
  if (v9)
  {
    id v10 = (const void *)v9;
    char v11 = PCSValidateSignature(v9, v8, v7, 0LL);
    CFRelease(v10);
  }

  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)hasRecentlyDoneHSA2Upsell
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dateByAddingTimeInterval:-600.0]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTCheckIDSRegistrationOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 idsAccountTracker]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 timeOfLastUpsell]);
  BOOL v8 = [v7 compare:v4] == (id)1;

  return v8;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTCheckIDSRegistrationOperation pcsOperation](self, "pcsOperation"));
  id v16 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getCurrentKTPCSIdentity:off_1002E5928 error:&v16]);
  id v5 = v16;

  if (v4)
  {
    v6 = (void *)PCSIdentityCopyPublicKeyInfo([v4 identity]);
    id v7 = objc_alloc_init(&OBJC_CLASS___NSOperation);
    -[KTCheckIDSRegistrationOperation setFinishedOp:](self, "setFinishedOp:", v7);

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTCheckIDSRegistrationOperation finishedOp](self, "finishedOp"));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v8);

    id location = 0LL;
    objc_initWeak(&location, self);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTCheckIDSRegistrationOperation deps](self, "deps"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 idsOperations]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10017A06C;
    v12[3] = &unk_100285CF0;
    objc_copyWeak(&v14, &location);
    id v11 = v6;
    id v13 = v11;
    [v10 fetchKTRegistrationStatus:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  else
  {
    -[KTCheckIDSRegistrationOperation setCheckIDSError:](self, "setCheckIDSError:", 7LL);
  }
}

- (void)setCheckIDSError:(int64_t)a3
{
  BOOL v8 = @"checkIDSError";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  uint64_t v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:userinfo:description:",  kTransparencyErrorServer,  -365LL,  0LL,  v6,  @"CheckIDS failed"));
  -[KTResultOperation setError:](self, "setError:", v7);
}

- (int64_t)checkIDSResult
{
  return (int64_t)self->super._startOperation;
}

- (void)setCheckIDSResult:(int64_t)a3
{
  self->super._startOperation = (NSBlockOperation *)a3;
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (KTCheckIDSRegistrationInterface)idsRegistrationInterface
{
  return (KTCheckIDSRegistrationInterface *)objc_loadWeakRetained((id *)&self->super._internalSuccesses);
}

- (void)setIdsRegistrationInterface:(id)a3
{
}

- (KTPCSOperationDependency)pcsOperation
{
  return (KTPCSOperationDependency *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setPcsOperation:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
}

@end