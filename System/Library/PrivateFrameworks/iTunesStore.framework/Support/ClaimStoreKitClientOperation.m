@interface ClaimStoreKitClientOperation
- (ClaimStoreKitClientOperation)initWithClientIdentity:(id)a3;
- (NSData)clientAuditTokenData;
- (StoreKitClientIdentity)clientIdentity;
- (void)run;
- (void)setClientAuditTokenData:(id)a3;
@end

@implementation ClaimStoreKitClientOperation

- (ClaimStoreKitClientOperation)initWithClientIdentity:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ClaimStoreKitClientOperation;
  v5 = -[ClaimStoreKitClientOperation init](&v9, "init");
  if (v5)
  {
    v6 = (StoreKitClientIdentity *)[v4 copy];
    clientIdentity = v5->_clientIdentity;
    v5->_clientIdentity = v6;
  }

  return v5;
}

- (NSData)clientAuditTokenData
{
  v3 = self->_clientAuditTokenData;
  -[ClaimStoreKitClientOperation unlock](self, "unlock");
  return v3;
}

- (StoreKitClientIdentity)clientIdentity
{
  id v3 = -[StoreKitClientIdentity copy](self->_clientIdentity, "copy");
  -[ClaimStoreKitClientOperation unlock](self, "unlock");
  return (StoreKitClientIdentity *)v3;
}

- (void)setClientAuditTokenData:(id)a3
{
  v5 = (NSData *)a3;
  -[ClaimStoreKitClientOperation lock](self, "lock");
  if (self->_clientAuditTokenData != v5) {
    objc_storeStrong((id *)&self->_clientAuditTokenData, a3);
  }
  -[ClaimStoreKitClientOperation unlock](self, "unlock");
}

- (void)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitClientIdentity storeIdentifier](self->_clientIdentity, "storeIdentifier"));
  if (!v3)
  {
    if (-[StoreKitClientIdentity isSandboxed](self->_clientIdentity, "isSandboxed")) {
      goto LABEL_4;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitClientIdentity bundleIdentifier](self->_clientIdentity, "bundleIdentifier"));
    BOOL v5 = v6 != 0LL;
    if (!v6)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  116LL,  0LL));
LABEL_37:

      goto LABEL_5;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 applicationType]);
    unsigned int v9 = [v8 isEqualToString:LSSystemApplicationType];

    if (!v9)
    {
LABEL_36:

      id v4 = 0LL;
      goto LABEL_37;
    }

    v10 = objc_alloc(&OBJC_CLASS___NSNumber);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 applicationDSID]);
    v36 = -[NSNumber initWithLongLong:](v10, "initWithLongLong:", [v11 longLongValue]);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 itemID]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v7 externalVersionIdentifier]);
    v35 = v7;
    if (!v12 || !v37) {
      goto LABEL_19;
    }
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue(-[StoreKitClientIdentity accountIdentifier](self->_clientIdentity, "accountIdentifier"));
    if (v13 == v36)
    {
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitClientIdentity accountIdentifier](self->_clientIdentity, "accountIdentifier"));
      v15 = v14;
      if (!v14 || !v36)
      {

LABEL_19:
        v7 = v35;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v18) {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v19 = [v18 shouldLog];
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
          uint64_t v21 = v19;
        }
        else {
          uint64_t v21 = v19 & 2;
        }
        if ((_DWORD)v21)
        {
          *(_DWORD *)v41 = 138412546;
          *(void *)&v41[4] = objc_opt_class(self);
          *(_WORD *)&v41[12] = 2112;
          *(void *)&v41[14] = v6;
          id v22 = *(id *)&v41[4];
          v23 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  1LL,  "%@: Attemping claim before in-app activity: %@",  v41,  22);

          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
            free(v23);
            v34 = v24;
            SSFileLog(v18, @"%@");
          }
        }

        else
        {
        }

        *(void *)v41 = 0LL;
        *(void *)&v41[8] = v41;
        *(void *)&v41[16] = 0x3032000000LL;
        v42 = sub_100146FA0;
        v43 = sub_100146FB0;
        id v44 = 0LL;
        dispatch_semaphore_t v25 = dispatch_semaphore_create(0LL);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[ClaimStoreKitClientOperation clientAuditTokenData](self, "clientAuditTokenData"));
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_100146FB8;
        v38[3] = &unk_10034FAC8;
        v40 = v41;
        v27 = v25;
        v39 = v27;
        +[AppStoreUtility checkFirstPartyClaimsWithAuditTokenData:completionBlock:]( &OBJC_CLASS___AppStoreUtility,  "checkFirstPartyClaimsWithAuditTokenData:completionBlock:",  v26,  v38);

        dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
        if ([*(id *)(*(void *)&v41[8] + 40) count])
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&v41[8] + 40) firstObject]);
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v28));
          if (v29)
          {
            -[ClaimStoreKitClientOperation lock](self, "lock");
            clientIdentity = self->_clientIdentity;
            v31 = (void *)objc_claimAutoreleasedReturnValue([v29 itemID]);
            -[StoreKitClientIdentity setStoreIdentifier:](clientIdentity, "setStoreIdentifier:", v31);

            v32 = self->_clientIdentity;
            v33 = (void *)objc_claimAutoreleasedReturnValue([v29 externalVersionIdentifier]);
            -[StoreKitClientIdentity setStoreVersion:](v32, "setStoreVersion:", v33);

            -[ClaimStoreKitClientOperation unlock](self, "unlock");
          }

          v7 = v35;
        }

        _Block_object_dispose(v41, 8);
        goto LABEL_35;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitClientIdentity accountIdentifier](self->_clientIdentity, "accountIdentifier"));
      unsigned int v17 = [v16 isEqualToNumber:v36];

      if (!v17) {
        goto LABEL_19;
      }
    }

    -[ClaimStoreKitClientOperation lock](self, "lock");
    -[StoreKitClientIdentity setStoreIdentifier:](self->_clientIdentity, "setStoreIdentifier:", v12);
    -[StoreKitClientIdentity setStoreVersion:](self->_clientIdentity, "setStoreVersion:", v37);
    -[ClaimStoreKitClientOperation unlock](self, "unlock");
    v7 = v35;
LABEL_35:

    goto LABEL_36;
  }

LABEL_4:
  id v4 = 0LL;
  BOOL v5 = 1LL;
LABEL_5:
  -[ClaimStoreKitClientOperation setError:](self, "setError:", v4, v34);
  -[ClaimStoreKitClientOperation setSuccess:](self, "setSuccess:", v5);
}

- (void).cxx_destruct
{
}

@end