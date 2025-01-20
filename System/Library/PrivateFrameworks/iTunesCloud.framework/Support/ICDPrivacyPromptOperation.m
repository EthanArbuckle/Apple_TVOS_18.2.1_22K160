@interface ICDPrivacyPromptOperation
- (ICDPrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3;
- (ICDPrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3 identity:(id)a4;
- (id)completionHandler;
- (void)_didCompleteWithPrivacyPromptStatus:(int64_t)a3 error:(id)a4;
- (void)cancel;
- (void)execute;
- (void)setCompletionHandler:(id)a3;
@end

@implementation ICDPrivacyPromptOperation

- (ICDPrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  v6 = -[ICDPrivacyPromptOperation initWithPrivacyIdentifier:identity:]( self,  "initWithPrivacyIdentifier:identity:",  v4,  v5);

  return v6;
}

- (ICDPrivacyPromptOperation)initWithPrivacyIdentifier:(id)a3 identity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ICDPrivacyPromptOperation;
  v9 = -[ICDPrivacyPromptOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_privacyIdentifier, a3);
    objc_storeStrong((id *)&v10->_userIdentity, a4);
  }

  return v10;
}

- (id)completionHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = objc_retainBlock(self->_completionHandler);
  os_unfair_lock_unlock(p_lock);
  id v5 = objc_retainBlock(v4);

  return v5;
}

- (void)setCompletionHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v6 = [v5 copy];

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ICDPrivacyPromptOperation;
  -[ICDPrivacyPromptOperation cancel](&v3, "cancel");
}

- (void)execute
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = self->_privacyIdentifier;
  BOOL wasCancelled = self->_wasCancelled;
  os_unfair_lock_unlock(p_lock);
  if (wasCancelled)
  {
    id v6 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Operation was cancelled upon beginning execution. Aborting.",  (uint8_t *)&v10,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7004LL,  0LL));
    -[ICDPrivacyPromptOperation finishWithError:](self, "finishWithError:", v7);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:]( &OBJC_CLASS___ICPrivacyInfo,  "sharedPrivacyInfoForUserIdentity:",  self->_userIdentity));
    int v9 = [v8 privacyAcknowledgementRequiredForIdentifier:v4];

    if ((v9 & 1) == 0)
    {
      -[ICDPrivacyPromptOperation _didCompleteWithPrivacyPromptStatus:error:]( self,  "_didCompleteWithPrivacyPromptStatus:error:",  0LL,  0LL);
      goto LABEL_8;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  ICErrorDomain,  -7002LL,  @"Prompting the user to acknowledge the latest privacy policy is not supported on the current platform."));
    -[ICDPrivacyPromptOperation _didCompleteWithPrivacyPromptStatus:error:]( self,  "_didCompleteWithPrivacyPromptStatus:error:",  3LL,  v7);
  }

LABEL_8:
}

- (void)_didCompleteWithPrivacyPromptStatus:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = (void (**)(id, int64_t, id))objc_retainBlock(self->_completionHandler);
  if (self->_hasInvokedCompletionHandler)
  {
    os_unfair_lock_unlock(&self->_lock);
    id v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 138543362;
      *(void *)&v14[4] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Request is already finished. Skipping running completion logic a second time.",  v14,  0xCu);
    }

    goto LABEL_20;
  }

  self->_hasInvokedCompletionHandler = 1;
  os_unfair_lock_unlock(&self->_lock);
  if ((unint64_t)a3 < 4)
  {
    int v9 = off_1001A5E60[a3];
    if (v6) {
      goto LABEL_7;
    }
LABEL_11:
    int v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 138543618;
      *(void *)&v14[4] = self;
      *(_WORD *)&v14[12] = 2114;
      *(void *)&v14[14] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Did complete privacy prompt with status: %{public}@.",  v14,  0x16u);
    }

    goto LABEL_17;
  }

  int v9 = 0LL;
  if (!v6) {
    goto LABEL_11;
  }
LABEL_7:
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 debugDescription]);
  v11 = os_log_create("com.apple.amp.itunescloudd", "Default");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)v14 = 138543618;
      *(void *)&v14[4] = self;
      *(_WORD *)&v14[12] = 2114;
      *(void *)&v14[14] = v10;
      v13 = "%{public}@: %{public}@.";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v13, v14, 0x16u);
    }
  }

  else if (v12)
  {
    *(_DWORD *)v14 = 138543618;
    *(void *)&v14[4] = self;
    *(_WORD *)&v14[12] = 2114;
    *(void *)&v14[14] = v6;
    v13 = "%{public}@: Encountered error: %{public}@.";
    goto LABEL_15;
  }

LABEL_17:
  if (v7) {
    v7[2](v7, a3, v6);
  }
  -[ICDPrivacyPromptOperation finishWithError:](self, "finishWithError:", v6, *(_OWORD *)v14, *(void *)&v14[16]);
LABEL_20:
}

- (void).cxx_destruct
{
}

@end