@interface SagaCloudAddOperation
- (BOOL)isPersistent;
- (BOOL)updateRequired;
- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3;
- (unsigned)currentDatabaseRevision;
- (void)main;
@end

@implementation SagaCloudAddOperation

- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3
{
  return 0LL;
}

- (unsigned)currentDatabaseRevision
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  unsigned int v3 = [v2 sagaOnDiskDatabaseRevision];

  if (v3 <= 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  context = objc_autoreleasePoolPush();
  v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", objc_opt_class(self, v3));
  v38 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v5 = [[MSVXPCTransaction alloc] initWithName:v38];
  [v5 beginTransaction];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v6 setClientIdentity:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[SagaCloudAddOperation cloudAddRequestWithDatabaseID:]( self,  "cloudAddRequestWithDatabaseID:",  [v8 databaseID]));
  v10 = v9;
  if (v9)
  {
    [v9 setVerificationInteractionLevel:2];
    v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class(self, v12);
      id v14 = v13;
      v16 = (objc_class *)objc_opt_class(v10, v15);
      v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if ([v10 method]) {
        v19 = @"POST";
      }
      else {
        v19 = @"GET";
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 action]);
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2048;
      v53 = (uint64_t (*)(uint64_t, uint64_t))v10;
      *(_WORD *)v54 = 2114;
      *(void *)&v54[2] = v19;
      *(_WORD *)&v54[10] = 2114;
      *(void *)&v54[12] = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Sending cloud-add request <%{public}@: %p method=%{public}@ action=%{public}@>",  buf,  0x34u);
    }

    -[SagaCloudAddOperation logCloudAddRequestDescription](self, "logCloudAddRequestDescription");
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v53 = sub_1000E1DA4;
    *(void *)v54 = sub_1000E1DB4;
    *(void *)&v54[8] = 0LL;
    uint64_t v46 = 0LL;
    v47 = &v46;
    uint64_t v48 = 0x3032000000LL;
    v49 = sub_1000E1DA4;
    v50 = sub_1000E1DB4;
    id v51 = 0LL;
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1000E1DBC;
    v40[3] = &unk_1001A5BF0;
    id v41 = v10;
    v42 = self;
    v44 = buf;
    v45 = &v46;
    v22 = v21;
    v43 = v22;
    [v8 sendRequest:v41 withResponseHandler:v40];
    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v23 = (uint64_t)[*(id *)(*(void *)&buf[8] + 40) responseCode];
    if (v23 > 399)
    {
      if (v23 == 404 || v23 == 400)
      {
        uint64_t v24 = 3LL;
        goto LABEL_18;
      }
    }

    else
    {
      uint64_t v24 = 1LL;
      if (v23 == 200 || v23 == 204)
      {
LABEL_18:
        -[CloudLibraryOperation setStatus:](self, "setStatus:", v24);
        v26 = (void *)v47[5];
        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 domain]);
          if (![v27 isEqualToString:ICCloudClientErrorDomain])
          {
LABEL_25:

            goto LABEL_26;
          }

          BOOL v28 = [(id)v47[5] code] == (id)2019;

          if (v28)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue([(id)v47[5] userInfo]);
            v27 = (void *)objc_claimAutoreleasedReturnValue( [v29 objectForKey:@"CloudLibraryConnectionRequestForbiddenAdditonalErrorCodeKey"]);

            if ([v27 integerValue] == (id)954)
            {
              -[CloudLibraryOperation setStatus:](self, "setStatus:", 3LL);
              v30 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v39 = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "cloud-add permamently failed -- item limit exceeded",  v39,  2u);
              }
            }

            goto LABEL_25;
          }
        }

- (BOOL)updateRequired
{
  return self->super._status;
}

@end