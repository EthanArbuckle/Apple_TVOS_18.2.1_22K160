@interface SUCoreUpdateParam
+ (BOOL)supportsSecureCoding;
+ (id)targetPhaseName:(int64_t)a3;
+ (id)targetRollbackPhaseName:(int64_t)a3;
- (NSError)error;
- (SUCorePolicy)policy;
- (SUCoreProgress)applyProgress;
- (SUCoreProgress)downloadProgress;
- (SUCoreProgress)prepareProgress;
- (SUCoreRollback)rollback;
- (SUCoreUpdateParam)init;
- (SUCoreUpdateParam)initWithApplyProgress:(id)a3;
- (SUCoreUpdateParam)initWithCoder:(id)a3;
- (SUCoreUpdateParam)initWithDownloadProgress:(id)a3;
- (SUCoreUpdateParam)initWithError:(id)a3;
- (SUCoreUpdateParam)initWithPrepareProgress:(id)a3;
- (SUCoreUpdateParam)initWithRollback:(id)a3 withError:(id)a4;
- (SUCoreUpdateParam)initWithRollback:(id)a3 withPolicy:(id)a4;
- (id)copy;
- (id)description;
- (id)initTargetPhase:(int64_t)a3 policy:(id)a4 downloadProgress:(id)a5 prepareProgress:(id)a6 applyProgress:(id)a7 rollback:(id)a8 resultCode:(int64_t)a9 error:(id)a10;
- (id)initTargetPhase:(int64_t)a3 withPolicy:(id)a4;
- (id)summary;
- (int64_t)resultCode;
- (int64_t)targetPhase;
- (void)encodeWithCoder:(id)a3;
- (void)setApplyProgress:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setError:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setPrepareProgress:(id)a3;
- (void)setResultCode:(int64_t)a3;
- (void)setRollback:(id)a3;
- (void)setTargetPhase:(int64_t)a3;
@end

@implementation SUCoreUpdateParam

- (SUCoreUpdateParam)init
{
  return (SUCoreUpdateParam *)-[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:]( self,  "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initTargetPhase:(int64_t)a3 withPolicy:(id)a4
{
  return -[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:]( self,  "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:",  a3,  a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUCoreUpdateParam)initWithDownloadProgress:(id)a3
{
  return (SUCoreUpdateParam *)-[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:]( self,  "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:",  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUCoreUpdateParam)initWithPrepareProgress:(id)a3
{
  return (SUCoreUpdateParam *)-[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:]( self,  "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:",  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL);
}

- (SUCoreUpdateParam)initWithApplyProgress:(id)a3
{
  return (SUCoreUpdateParam *)-[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:]( self,  "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:",  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL,  0LL);
}

- (SUCoreUpdateParam)initWithError:(id)a3
{
  id v4 = a3;
  v5 = -[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:]( self,  "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:",  0,  0,  0,  0,  0,  0,  [v4 code],  v4);

  return v5;
}

- (SUCoreUpdateParam)initWithRollback:(id)a3 withPolicy:(id)a4
{
  return (SUCoreUpdateParam *)-[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:]( self,  "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:",  11LL,  a4,  0LL,  0LL,  0LL,  a3,  0LL,  0LL);
}

- (SUCoreUpdateParam)initWithRollback:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:]( self,  "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:",  11,  0,  0,  0,  0,  v7,  [v6 code],  v6);

  return v8;
}

- (id)initTargetPhase:(int64_t)a3 policy:(id)a4 downloadProgress:(id)a5 prepareProgress:(id)a6 applyProgress:(id)a7 rollback:(id)a8 resultCode:(int64_t)a9 error:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___SUCoreUpdateParam;
  v19 = -[SUCoreUpdateParam init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_targetPhase = a3;
    objc_storeStrong((id *)&v19->_policy, a4);
    objc_storeStrong((id *)&v20->_downloadProgress, a5);
    objc_storeStrong((id *)&v20->_prepareProgress, a6);
    objc_storeStrong((id *)&v20->_applyProgress, a7);
    objc_storeStrong((id *)&v20->_rollback, a8);
    v20->_resultCode = a9;
    objc_storeStrong((id *)&v20->_error, a10);
  }

  return v20;
}

- (SUCoreUpdateParam)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SUCoreUpdateParam;
  v5 = -[SUCoreUpdateParam init](&v21, sel_init);
  if (v5)
  {
    v5->_targetPhase = [v4 decodeInt64ForKey:@"TargetPhase"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Policy"];
    policy = v5->_policy;
    v5->_policy = (SUCorePolicy *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DownloadProgress"];
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (SUCoreProgress *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrepareProgress"];
    prepareProgress = v5->_prepareProgress;
    v5->_prepareProgress = (SUCoreProgress *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ApplyProgress"];
    applyProgress = v5->_applyProgress;
    v5->_applyProgress = (SUCoreProgress *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Rollback"];
    rollback = v5->_rollback;
    v5->_rollback = (SUCoreRollback *)v14;

    v5->_resultCode = [v4 decodeInt64ForKey:@"ResultCode"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ErrorString"];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612760] sharedCore];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 buildError:v5->_resultCode underlying:0 description:v16];
    error = v5->_error;
    v5->_error = (NSError *)v18;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreUpdateParam targetPhase](self, "targetPhase"), @"TargetPhase");
  v5 = -[SUCoreUpdateParam policy](self, "policy");
  [v4 encodeObject:v5 forKey:@"Policy"];

  -[SUCoreUpdateParam downloadProgress](self, "downloadProgress");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"DownloadProgress"];

  -[SUCoreUpdateParam prepareProgress](self, "prepareProgress");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"PrepareProgress"];

  -[SUCoreUpdateParam applyProgress](self, "applyProgress");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"ApplyProgress"];
  v9 = -[SUCoreUpdateParam rollback](self, "rollback");
  [v4 encodeObject:v9 forKey:@"Rollback"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreUpdateParam resultCode](self, "resultCode"), @"ResultCode");
  id v10 = objc_alloc(NSString);
  v11 = -[SUCoreUpdateParam error](self, "error");
  id v12 = (id)[v10 initWithFormat:@"%@", v11];

  [v4 encodeObject:v12 forKey:@"ErrorString"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateParam);
  -[SUCoreUpdateParam setTargetPhase:](v3, "setTargetPhase:", -[SUCoreUpdateParam targetPhase](self, "targetPhase"));
  -[SUCoreUpdateParam policy](self, "policy");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam setPolicy:](v3, "setPolicy:", v4);
  v5 = -[SUCoreUpdateParam downloadProgress](self, "downloadProgress");
  -[SUCoreUpdateParam setDownloadProgress:](v3, "setDownloadProgress:", v5);

  -[SUCoreUpdateParam prepareProgress](self, "prepareProgress");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam setPrepareProgress:](v3, "setPrepareProgress:", v6);

  -[SUCoreUpdateParam applyProgress](self, "applyProgress");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam setApplyProgress:](v3, "setApplyProgress:", v7);

  -[SUCoreUpdateParam rollback](self, "rollback");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam setRollback:](v3, "setRollback:", v8);

  -[SUCoreUpdateParam setResultCode:](v3, "setResultCode:", -[SUCoreUpdateParam resultCode](self, "resultCode"));
  v9 = -[SUCoreUpdateParam error](self, "error");
  -[SUCoreUpdateParam setError:](v3, "setError:", v9);

  return v3;
}

- (id)description
{
  id v15 = objc_alloc(NSString);
  +[SUCoreUpdateParam targetPhaseName:]( &OBJC_CLASS___SUCoreUpdateParam,  "targetPhaseName:",  -[SUCoreUpdateParam targetPhase](self, "targetPhase"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam policy](self, "policy");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 summary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam downloadProgress](self, "downloadProgress");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 summary];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateParam prepareProgress](self, "prepareProgress");
  [v5 summary];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateParam applyProgress](self, "applyProgress");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 summary];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUCoreUpdateParam rollback](self, "rollback");
  [v9 summary];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v11 = -[SUCoreUpdateParam resultCode](self, "resultCode");
  -[SUCoreUpdateParam error](self, "error");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = (id)[v15 initWithFormat:@"\n[>>>\n        targetPhase: %@\n             policy: %@\n   downloadProgress: %@\n    prepareProgress: %@\n      applyProgress: %@\n           rollback: %@\n         resultCode: %ld\n              error: %@\n<<<]", v14, v3, v4, v6, v8, v10, v11, v12];

  return v16;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = objc_alloc(NSString);
    int64_t v5 = -[SUCoreUpdateParam resultCode](self, "resultCode");
    -[SUCoreUpdateParam error](self, "error");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 description];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (void *)[v4 initWithFormat:@"resultCode:%ld,errorDesc:%@", v5, v7];
  }

  else
  {
    if (-[SUCoreUpdateParam targetPhase](self, "targetPhase"))
    {
      id v9 = objc_alloc(NSString);
      +[SUCoreUpdateParam targetPhaseName:]( &OBJC_CLASS___SUCoreUpdateParam,  "targetPhaseName:",  -[SUCoreUpdateParam targetPhase](self, "targetPhase"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = (void *)[v9 initWithFormat:@"target:%@", v10];
    }

    else
    {
      -[SUCoreUpdateParam downloadProgress](self, "downloadProgress");
      int64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        id v12 = objc_alloc(NSString);
        -[SUCoreUpdateParam downloadProgress](self, "downloadProgress");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 summary];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v12 initWithFormat:@"downloadProg:%@", v13];
      }

      else
      {
        -[SUCoreUpdateParam prepareProgress](self, "prepareProgress");
        id v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          id v16 = objc_alloc(NSString);
          -[SUCoreUpdateParam prepareProgress](self, "prepareProgress");
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 summary];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = [v16 initWithFormat:@"prepareProg:%@", v13];
        }

        else
        {
          -[SUCoreUpdateParam applyProgress](self, "applyProgress");
          id v17 = (void *)objc_claimAutoreleasedReturnValue();

          id v18 = objc_alloc(NSString);
          if (!v17)
          {
            uint64_t v8 = (void *)objc_msgSend( v18,  "initWithFormat:",  @"resultCode:%ld",  -[SUCoreUpdateParam resultCode](self, "resultCode"));
            return v8;
          }

          -[SUCoreUpdateParam applyProgress](self, "applyProgress");
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 summary];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = [v18 initWithFormat:@"applyProg:%@", v13];
        }
      }

      uint64_t v8 = (void *)v14;
    }
  }

  return v8;
}

+ (id)targetPhaseName:(int64_t)a3
{
  else {
    return kSUCoreUpdateTargetPhaseName[a3];
  }
}

+ (id)targetRollbackPhaseName:(int64_t)a3
{
  else {
    return kSUCoreRollbackTargetPhaseName[a3];
  }
}

- (int64_t)targetPhase
{
  return self->_targetPhase;
}

- (void)setTargetPhase:(int64_t)a3
{
  self->_targetPhase = a3;
}

- (SUCorePolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (SUCoreProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(id)a3
{
}

- (SUCoreProgress)prepareProgress
{
  return self->_prepareProgress;
}

- (void)setPrepareProgress:(id)a3
{
}

- (SUCoreProgress)applyProgress
{
  return self->_applyProgress;
}

- (void)setApplyProgress:(id)a3
{
}

- (SUCoreRollback)rollback
{
  return self->_rollback;
}

- (void)setRollback:(id)a3
{
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (void)setResultCode:(int64_t)a3
{
  self->_resultCode = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end