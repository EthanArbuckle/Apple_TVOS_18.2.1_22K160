@interface ICDCloudServiceCapabilitiesRequestOperation
- (ICDCloudServiceCapabilitiesRequestOperation)initWithIdentity:(id)a3;
- (NSXPCConnection)originatingClientConnection;
- (id)completionHandler;
- (int64_t)privacyAcknowledgementPolicy;
- (void)_didCompleteAllCapabilitiesAsynchronousRequests;
- (void)_didCompletePrivacyPromptOperation:(id)a3 withStatus:(int64_t)a4 error:(id)a5;
- (void)_handlePrivacyAcknowledgementErrorWithMessage:(id)a3 underlyingError:(id)a4;
- (void)_performPrivacyPromptOperation;
- (void)_requestBagWithAsynchronousRequestsGroup:(id)a3;
- (void)_requestCapabilities;
- (void)_requestIdentityPropertiesWithAsynchronousRequestsGroup:(id)a3;
- (void)_requestSubscriptionStatusWithAsynchronousRequestsGroup:(id)a3;
- (void)_updateWithBag:(id)a3 error:(id)a4;
- (void)_updateWithIdentityProperties:(id)a3 error:(id)a4;
- (void)_updateWithSubscriptionStatusResponse:(id)a3 error:(id)a4;
- (void)cancel;
- (void)execute;
- (void)setCompletionHandler:(id)a3;
- (void)setOriginatingClientConnection:(id)a3;
- (void)setPrivacyAcknowledgementPolicy:(int64_t)a3;
@end

@implementation ICDCloudServiceCapabilitiesRequestOperation

- (ICDCloudServiceCapabilitiesRequestOperation)initWithIdentity:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ICDCloudServiceCapabilitiesRequestOperation;
  v6 = -[ICDCloudServiceCapabilitiesRequestOperation init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identity, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
    identityStore = v7->_identityStore;
    v7->_identityStore = (ICUserIdentityStore *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ICDCloudServiceCapabilitiesRequestOperation;
  -[ICDCloudServiceCapabilitiesRequestOperation cancel](&v6, "cancel");
  os_unfair_lock_lock(p_lock);
  v4 = self->_privacyPromptOperation;
  self->_wasCancelled = 1;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v8 = self;
      __int16 v9 = 2114;
      v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Cancelling %{public}@.",  buf,  0x16u);
    }

    -[ICDPrivacyPromptOperation cancel](v4, "cancel");
  }
}

- (void)execute
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  int64_t privacyAcknowledgementPolicy = self->_privacyAcknowledgementPolicy;
  BOOL wasCancelled = self->_wasCancelled;
  os_unfair_lock_unlock(p_lock);
  if (wasCancelled)
  {
    objc_super v6 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Operation was cancelled upon beginning execution. Aborting.",  (uint8_t *)&v11,  0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7004LL,  0LL));
    -[ICDCloudServiceCapabilitiesRequestOperation finishWithError:](self, "finishWithError:", v7);
  }

  else if (privacyAcknowledgementPolicy)
  {
    if (privacyAcknowledgementPolicy == 1)
    {
      -[ICDCloudServiceCapabilitiesRequestOperation _performPrivacyPromptOperation]( self,  "_performPrivacyPromptOperation");
    }

    else if (privacyAcknowledgementPolicy == 2)
    {
      uint64_t v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        v12 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Bypassing enforcement of privacy acknowledgement.",  (uint8_t *)&v11,  0xCu);
      }

      -[ICDCloudServiceCapabilitiesRequestOperation _requestCapabilities](self, "_requestCapabilities");
    }
  }

  else
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:]( &OBJC_CLASS___ICPrivacyInfo,  "sharedPrivacyInfoForUserIdentity:",  self->_identity));
    unsigned int v10 = [v9 privacyAcknowledgementRequiredForIdentifier:ICPrivacyIdentifierMusic];

    if (v10) {
      -[ICDCloudServiceCapabilitiesRequestOperation _handlePrivacyAcknowledgementErrorWithMessage:underlyingError:]( self,  "_handlePrivacyAcknowledgementErrorWithMessage:underlyingError:",  @"Privacy acknowledgement required, but presenting the privacy prompt is not allowed.",  0LL);
    }
    else {
      -[ICDCloudServiceCapabilitiesRequestOperation _requestCapabilities](self, "_requestCapabilities");
    }
  }

- (int64_t)privacyAcknowledgementPolicy
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  int64_t privacyAcknowledgementPolicy = self->_privacyAcknowledgementPolicy;
  os_unfair_lock_unlock(p_lock);
  return privacyAcknowledgementPolicy;
}

- (void)setPrivacyAcknowledgementPolicy:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_int64_t privacyAcknowledgementPolicy = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSXPCConnection)originatingClientConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = self->_originatingClientConnection;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOriginatingClientConnection:(id)a3
{
  v4 = (NSXPCConnection *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  originatingClientConnection = self->_originatingClientConnection;
  self->_originatingClientConnection = v4;

  os_unfair_lock_unlock(&self->_lock);
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

- (void)_performPrivacyPromptOperation
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v4 = objc_alloc(&OBJC_CLASS___ICDPrivacyPromptOperation);
  id v5 = -[ICDPrivacyPromptOperation initWithPrivacyIdentifier:]( v4,  "initWithPrivacyIdentifier:",  ICPrivacyIdentifierMusic);
  objc_initWeak(&location, v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10010BBAC;
  v9[3] = &unk_1001A6A80;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  -[ICDPrivacyPromptOperation setCompletionHandler:](v5, "setCompletionHandler:", v9);
  os_unfair_lock_lock(p_lock);
  if (self->_wasCancelled)
  {
    os_unfair_lock_unlock(p_lock);
    id v6 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Operation was cancelled right before enqueuing privacy prompt operation: %{public}@. Aborting.",  buf,  0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7004LL,  0LL));
    -[ICDCloudServiceCapabilitiesRequestOperation finishWithError:](self, "finishWithError:", v7);
  }

  else
  {
    objc_storeStrong((id *)&self->_privacyPromptOperation, v5);
    os_unfair_lock_unlock(p_lock);
    uint64_t v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Performing %{public}@.",  buf,  0x16u);
    }

    -[ICDCloudServiceCapabilitiesRequestOperation enqueueChildOperation:](self, "enqueueChildOperation:", v5);
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_didCompletePrivacyPromptOperation:(id)a3 withStatus:(int64_t)a4 error:(id)a5
{
  v12 = (ICDPrivacyPromptOperation *)a3;
  id v8 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_privacyPromptOperation == v12)
  {
    self->_privacyPromptOperation = 0LL;
  }

  os_unfair_lock_unlock(&self->_lock);
  switch(a4)
  {
    case 0LL:
    case 2LL:
      -[ICDCloudServiceCapabilitiesRequestOperation _requestCapabilities](self, "_requestCapabilities");
      break;
    case 1LL:
      __int16 v9 = @"Privacy acknowledgement required, but user did not accept latest privacy policy.";
      id v10 = self;
      id v11 = 0LL;
      goto LABEL_7;
    case 3LL:
      __int16 v9 = @"Encountered error while performing privacy prompt operation.";
      id v10 = self;
      id v11 = v8;
LABEL_7:
      -[ICDCloudServiceCapabilitiesRequestOperation _handlePrivacyAcknowledgementErrorWithMessage:underlyingError:]( v10,  "_handlePrivacyAcknowledgementErrorWithMessage:underlyingError:",  v9,  v11);
      break;
    default:
      break;
  }
}

- (void)_handlePrivacyAcknowledgementErrorWithMessage:(id)a3 underlyingError:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __int16 v9 = (void (**)(id, void, void *))objc_retainBlock(self->_completionHandler);
  os_unfair_lock_unlock(p_lock);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:underlyingError:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:underlyingError:debugDescription:",  ICErrorDomain,  -7007LL,  v7,  @"%@",  v8));

  id v11 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msv_description"));
    *(_DWORD *)buf = 138543618;
    __int16 v14 = self;
    __int16 v15 = 2114;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
  }

  if (v9) {
    v9[2](v9, 0LL, v10);
  }
  -[ICDCloudServiceCapabilitiesRequestOperation finishWithError:](self, "finishWithError:", v10);
}

- (void)_requestBagWithAsynchronousRequestsGroup:(id)a3
{
  id v4 = (dispatch_group_s *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_identity;
  id v6 = self->_identityStore;
  os_unfair_lock_unlock(&self->_lock);
  dispatch_group_enter(v4);
  id v7 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10010B998;
  v16[3] = &unk_1001A6AA8;
  id v8 = v6;
  v17 = v8;
  __int16 v9 = v5;
  v18 = v9;
  id v10 = -[ICStoreRequestContext initWithBlock:](v7, "initWithBlock:", v16);
  id v11 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Requesting bag using %{public}@.",  buf,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10010BA1C;
  v14[3] = &unk_1001A7180;
  v14[4] = self;
  __int16 v15 = v4;
  v13 = v4;
  [v12 getBagForRequestContext:v10 withCompletionHandler:v14];
}

- (void)_updateWithBag:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v7 = (NSError *)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (v7)
  {
    if (self->_error) {
      error = self->_error;
    }
    else {
      error = v7;
    }
    objc_storeStrong((id *)&self->_error, error);

    os_unfair_lock_unlock(&self->_lock);
    -[ICDCloudServiceCapabilitiesRequestOperation _didCompleteAllCapabilitiesAsynchronousRequests]( self,  "_didCompleteAllCapabilitiesAsynchronousRequests");
  }

  else
  {
    objc_storeStrong((id *)&self->_bag, a3);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_requestIdentityPropertiesWithAsynchronousRequestsGroup:(id)a3
{
  id v4 = (dispatch_group_s *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_identity;
  id v6 = self->_identityStore;
  os_unfair_lock_unlock(&self->_lock);
  dispatch_group_enter(v4);
  id v7 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    identity = self->_identity;
    *(_DWORD *)buf = 138543618;
    v13 = self;
    __int16 v14 = 2114;
    __int16 v15 = identity;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Requesting properties for %{public}@.",  buf,  0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010B860;
  v10[3] = &unk_1001A6AD0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  -[ICUserIdentityStore getPropertiesForUserIdentity:completionHandler:]( v6,  "getPropertiesForUserIdentity:completionHandler:",  v5,  v10);
}

- (void)_updateWithIdentityProperties:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v7 = (NSError *)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (v7)
  {
    if (self->_error) {
      error = self->_error;
    }
    else {
      error = v7;
    }
    objc_storeStrong((id *)&self->_error, error);

    os_unfair_lock_unlock(&self->_lock);
    -[ICDCloudServiceCapabilitiesRequestOperation _didCompleteAllCapabilitiesAsynchronousRequests]( self,  "_didCompleteAllCapabilitiesAsynchronousRequests");
  }

  else
  {
    objc_storeStrong((id *)&self->_identityProperties, a3);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_requestSubscriptionStatusWithAsynchronousRequestsGroup:(id)a3
{
  id v4 = (dispatch_group_s *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_identity;
  id v6 = self->_identityStore;
  int64_t privacyAcknowledgementPolicy = self->_privacyAcknowledgementPolicy;
  os_unfair_lock_unlock(&self->_lock);
  dispatch_group_enter(v4);
  id v8 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10010B698;
  v20[3] = &unk_1001A6AA8;
  id v9 = v6;
  __int16 v21 = v9;
  id v10 = v5;
  v22 = v10;
  id v11 = -[ICStoreRequestContext initWithBlock:](v8, "initWithBlock:", v20);
  id v12 = [[ICMusicSubscriptionStatusRequest alloc] initWithStoreRequestContext:v11];
  [v12 setAllowsFallbackToExpiredStatus:1];
  [v12 setAllowsFallbackToStatusNeedingReload:1];
  [v12 setCarrierBundleProvisioningStyle:1];
  [v12 setShouldBypassEnforcementOfPrivacyAcknowledgement:privacyAcknowledgementPolicy == 2];
  v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = self;
    __int16 v25 = 2114;
    id v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Requesting subscription status using %{public}@.",  buf,  0x16u);
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10010B71C;
  v17[3] = &unk_1001A6AF8;
  v17[4] = self;
  id v18 = v12;
  v19 = v4;
  __int16 v15 = v4;
  id v16 = v12;
  [v14 performSubscriptionStatusRequest:v16 withCompletionHandler:v17];
}

- (void)_updateWithSubscriptionStatusResponse:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v7 = (NSError *)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (v7)
  {
    if (self->_error) {
      error = self->_error;
    }
    else {
      error = v7;
    }
    objc_storeStrong((id *)&self->_error, error);

    os_unfair_lock_unlock(&self->_lock);
    -[ICDCloudServiceCapabilitiesRequestOperation _didCompleteAllCapabilitiesAsynchronousRequests]( self,  "_didCompleteAllCapabilitiesAsynchronousRequests");
  }

  else
  {
    objc_storeStrong((id *)&self->_subscriptionStatusResponse, a3);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_requestCapabilities
{
  v3 = dispatch_group_create();
  -[ICDCloudServiceCapabilitiesRequestOperation _requestBagWithAsynchronousRequestsGroup:]( self,  "_requestBagWithAsynchronousRequestsGroup:",  v3);
  -[ICDCloudServiceCapabilitiesRequestOperation _requestIdentityPropertiesWithAsynchronousRequestsGroup:]( self,  "_requestIdentityPropertiesWithAsynchronousRequestsGroup:",  v3);
  -[ICDCloudServiceCapabilitiesRequestOperation _requestSubscriptionStatusWithAsynchronousRequestsGroup:]( self,  "_requestSubscriptionStatusWithAsynchronousRequestsGroup:",  v3);
  qos_class_t v4 = qos_class_self();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v4, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010B690;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_group_notify(v3, v6, block);
}

- (void)_didCompleteAllCapabilitiesAsynchronousRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  qos_class_t v4 = self->_bag;
  id v5 = self->_identityProperties;
  id v6 = self->_subscriptionStatusResponse;
  id v7 = self->_error;
  id v8 = (void (**)(id, void, NSError *))objc_retainBlock(self->_completionHandler);
  if (self->_hasInvokedCompletionHandler)
  {
    os_unfair_lock_unlock(p_lock);
    id v9 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      v17 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Request is already finished. Skipping running completion logic a second time.",  (uint8_t *)&v16,  0xCu);
    }
  }

  else
  {
    self->_hasInvokedCompletionHandler = 1;
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      id v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138543618;
        v17 = self;
        __int16 v18 = 2114;
        v19 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@: Did complete request with error: %{public}@.",  (uint8_t *)&v16,  0x16u);
      }

      uint64_t v11 = 0LL;
    }

    else
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ICMusicSubscriptionStatusResponse subscriptionStatus](v6, "subscriptionStatus"));
      uint64_t v11 = -[os_log_s hasCapability:](v10, "hasCapability:", 1LL);
      if (((-[os_log_s hasCapability:](v10, "hasCapability:", 512LL) & 1) != 0
         || -[os_log_s hasCapability:](v10, "hasCapability:", 256LL))
        && -[ICUserIdentityProperties isActiveLocker](v5, "isActiveLocker"))
      {
        v11 |= 0x100uLL;
      }

      if ((-[os_log_s hasCapability:](v10, "hasCapability:", 1LL) & 1) == 0
        && (-[ICUserIdentityProperties isManagedAppleID](v5, "isManagedAppleID") & 1) == 0)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICURLBag dictionaryForBagKey:](v4, "dictionaryForBagKey:", ICURLBagKeyMusicSubscription));

        if (v12) {
          v11 |= 2uLL;
        }
      }

      v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t Description = ICCloudServiceCapabilitiesGetDescription(v11);
        __int16 v15 = (NSError *)objc_claimAutoreleasedReturnValue(Description);
        int v16 = 138543618;
        v17 = self;
        __int16 v18 = 2114;
        v19 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Did complete request; capabilities: %{public}@.",
          (uint8_t *)&v16,
          0x16u);
      }
    }

    if (v8) {
      v8[2](v8, v11, v7);
    }
    -[ICDCloudServiceCapabilitiesRequestOperation finishWithError:](self, "finishWithError:", v7);
  }
}

- (void).cxx_destruct
{
}

@end