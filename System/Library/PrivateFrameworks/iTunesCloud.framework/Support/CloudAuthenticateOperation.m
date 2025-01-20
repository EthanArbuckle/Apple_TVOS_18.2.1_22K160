@interface CloudAuthenticateOperation
- (BOOL)allowNoisyAuthPrompt;
- (CloudAuthenticateOperation)initWithConfiguration:(id)a3 mergeToCloudLibraryPreference:(id)a4 allowNoisyAuthPrompt:(BOOL)a5 enableLibraryReason:(int64_t)a6 clientIdentity:(id)a7;
- (NSNumber)authenticateFailureCode;
- (NSNumber)mergeToCloudLibraryPreference;
- (int64_t)enableReason;
- (void)main;
- (void)setAllowNoisyAuthPrompt:(BOOL)a3;
- (void)setAuthenticateFailureCode:(id)a3;
- (void)setEnableReason:(int64_t)a3;
- (void)setMergeToCloudLibraryPreference:(id)a3;
@end

@implementation CloudAuthenticateOperation

- (CloudAuthenticateOperation)initWithConfiguration:(id)a3 mergeToCloudLibraryPreference:(id)a4 allowNoisyAuthPrompt:(BOOL)a5 enableLibraryReason:(int64_t)a6 clientIdentity:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CloudAuthenticateOperation;
  result = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v11,  "initWithConfiguration:clientIdentity:",  a3,  a7);
  if (result)
  {
    result->super._error = (NSError *)a4;
    LOBYTE(result->super._status) = a5;
    result->_mergeToCloudLibraryPreference = (NSNumber *)a6;
  }

  return result;
}

- (void)main
{
  id v74 = [[MSVXPCTransaction alloc] initWithName:@"CloudAuthenticateOperation"];
  [v74 beginTransaction];
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v3 setClientIdentity:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICDServer server](&OBJC_CLASS___ICDServer, "server"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 daemonOptionsForConfiguration:v6]);
  unsigned int v8 = [v7 prohibitLibraryUpload] ^ 1;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sagaCloudLibraryCUID]);

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sagaCloudLibraryTroveID]);

  v75 = v12;
  if ([v10 length]) {
    BOOL v13 = [v12 length] != 0;
  }
  else {
    BOOL v13 = 0;
  }
  int v14 = v8 & !v13;
  v15 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v85 = self;
    __int16 v86 = 1024;
    *(_DWORD *)v87 = v13;
    *(_WORD *)&v87[4] = 1024;
    *(_DWORD *)&v87[6] = v8;
    LOWORD(v88) = 1024;
    *(_DWORD *)((char *)&v88 + 2) = v8 & !v13;
    HIWORD(v88) = 1024;
    unsigned int v89 = -[CloudAuthenticateOperation enableReason](self, "enableReason");
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Starting authentication - Device registered with CUID and TroveID=%{BOOL}u, canPerformLibraryUpload=% {BOOL}u, requiresDeviceRegistration=%{BOOL}u, enableReason=%d",  buf,  0x24u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation userIdentity](self, "userIdentity"));
  id v83 = 0LL;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation userIdentityStore](self, "userIdentityStore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v76 getPropertiesForUserIdentity:v16 error:&v83]);
  id v18 = v83;
  if (v18)
  {
    v19 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "msv_description"));
      *(_DWORD *)buf = 138543874;
      v85 = self;
      __int16 v86 = 2114;
      *(void *)v87 = v16;
      *(_WORD *)&v87[8] = 2114;
      v88 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@ - Failed to load identity properties for %{public}@ error=%{public}@",  buf,  0x20u);
    }
  }

  uint64_t v21 = objc_claimAutoreleasedReturnValue([v17 DSID]);
  v22 = (void *)v21;
  if (!v21)
  {
    v32 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v85 = self;
      v33 = "%{public}@ - Not authenticating ... unable to get properties for specified account";
      v34 = v32;
      uint32_t v35 = 12;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
    }

- (NSNumber)mergeToCloudLibraryPreference
{
  return (NSNumber *)self->super._error;
}

- (void)setMergeToCloudLibraryPreference:(id)a3
{
  self->super._error = (NSError *)a3;
}

- (NSNumber)authenticateFailureCode
{
  return *(NSNumber **)&self->_allowNoisyAuthPrompt;
}

- (void)setAuthenticateFailureCode:(id)a3
{
}

- (BOOL)allowNoisyAuthPrompt
{
  return self->super._status;
}

- (void)setAllowNoisyAuthPrompt:(BOOL)a3
{
  LOBYTE(self->super._status) = a3;
}

- (int64_t)enableReason
{
  return (int64_t)self->_mergeToCloudLibraryPreference;
}

- (void)setEnableReason:(int64_t)a3
{
  self->_mergeToCloudLibraryPreference = (NSNumber *)a3;
}

- (void).cxx_destruct
{
}

@end