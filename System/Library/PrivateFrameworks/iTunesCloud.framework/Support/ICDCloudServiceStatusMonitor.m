@interface ICDCloudServiceStatusMonitor
+ (BOOL)_isClientAllowedToRequestCapabilitiesForConnection:(id)a3;
+ (BOOL)_isClientAllowedToRequestRestrictedInformationForConnection:(id)a3;
+ (BOOL)_shouldBypassEnforcementOfPrivacyAcknowledgementForClientConnection:(id)a3 forIncomingCloudServiceCapabilitiesRequest:(BOOL)a4;
+ (id)_clientInfoForDeveloperTokenRequestWithRequestingApplicationBundleIdentifier:(id)a3;
+ (id)_clientInfoForUserTokenRequestWithRequestingApplicationBundleIdentifier:(id)a3;
+ (id)_requestingBundleIdentifierForOriginatingClientConnection:(id)a3 clientInfo:(id)a4 error:(id *)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDCloudServiceStatusMonitor)init;
- (void)_beginObservingCloudServiceStatus;
- (void)_endObservingCloudServiceStatus;
- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3;
- (void)_handleClientConnectionInterrupted:(id)a3;
- (void)_handleClientConnectionInvalidated:(id)a3;
- (void)_handleClientConnectionSevered:(id)a3;
- (void)_handleUpdatedBag:(id)a3;
- (void)_handleUpdatedSubscriptionStatus:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_handleUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification:(id)a3;
- (void)_notifyObserversForActiveUserIdentityChanged;
- (void)_refreshCapabilitiesWithPrivacyAcknowledgementPolicy:(int64_t)a3;
- (void)_refreshCloudServiceStatus;
- (void)_refreshStorefrontCountryCode;
- (void)_refreshStorefrontIdentifier;
- (void)_updateWithBag:(id)a3 error:(id)a4;
- (void)_updateWithCapabilities:(unint64_t)a3 error:(id)a4 privacyAcknowledgementPolicy:(int64_t)a5 capabilitiesRequestOperation:(id)a6;
- (void)_updateWithStorefrontIdentifier:(id)a3 error:(id)a4;
- (void)beginObservingCloudServiceStatusWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)endObservingCloudServiceStatusWithToken:(id)a3 completionHandler:(id)a4;
- (void)requestCapabilitiesWithPrivacyPromptPolicy:(int64_t)a3 completionHandler:(id)a4;
- (void)requestDeveloperTokenWithOptions:(unint64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5;
- (void)requestMusicKitTokensWithOptions:(unint64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5;
- (void)requestStorefrontCountryCodeWithCompletionHandler:(id)a3;
- (void)requestStorefrontIdentifierWithCompletionHandler:(id)a3;
- (void)requestUserTokenForDeveloperToken:(id)a3 options:(unint64_t)a4 clientInfo:(id)a5 completionHandler:(id)a6;
@end

@implementation ICDCloudServiceStatusMonitor

- (ICDCloudServiceStatusMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ICDCloudServiceStatusMonitor;
  v2 = -[ICDCloudServiceStatusMonitor init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    activeObservationTokenToClientConnectionMapping = v2->_activeObservationTokenToClientConnectionMapping;
    v2->_activeObservationTokenToClientConnectionMapping = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[ICDCloudServiceStatusMonitor _endObservingCloudServiceStatus](self, "_endObservingCloudServiceStatus");
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ICDCloudServiceStatusMonitor;
  -[ICDCloudServiceStatusMonitor dealloc](&v4, "dealloc");
}

- (void)beginObservingCloudServiceStatusWithCompletionHandler:(id)a3
{
  p_lock = &self->_lock;
  v5 = (void (**)(id, void *))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary setObject:forKey:]( self->_activeObservationTokenToClientConnectionMapping,  "setObject:forKey:",  v7,  v6);
  id v8 = -[NSMutableDictionary count](self->_activeObservationTokenToClientConnectionMapping, "count");
  v9 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    v11 = self;
    __int16 v12 = 2114;
    v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Registered new cloud service status observer with token: %{public}@.",  (uint8_t *)&v10,  0x16u);
  }

  if (v8 == (id)1)
  {
    -[ICDCloudServiceStatusMonitor _beginObservingCloudServiceStatus](self, "_beginObservingCloudServiceStatus");
    os_unfair_lock_unlock(p_lock);
    -[ICDCloudServiceStatusMonitor _refreshCloudServiceStatus](self, "_refreshCloudServiceStatus");
  }

  else
  {
    os_unfair_lock_unlock(p_lock);
  }

  v5[2](v5, v6);
}

- (void)endObservingCloudServiceStatusWithToken:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_activeObservationTokenToClientConnectionMapping,  "objectForKey:",  v6));

  if (v8)
  {
    -[NSMutableDictionary removeObjectForKey:]( self->_activeObservationTokenToClientConnectionMapping,  "removeObjectForKey:",  v6);
    id v9 = -[NSMutableDictionary count](self->_activeObservationTokenToClientConnectionMapping, "count");
    int v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Removed cloud service status observer with token: %{public}@.",  (uint8_t *)&v12,  0x16u);
    }

    if (!v9) {
      -[ICDCloudServiceStatusMonitor _endObservingCloudServiceStatus](self, "_endObservingCloudServiceStatus");
    }
  }

  else
  {
    v11 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Tried to remove unknown cloud service status observer with token: %{public}@. Ignoring.",  (uint8_t *)&v12,  0x16u);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  v7[2](v7);
}

- (void)requestCapabilitiesWithPrivacyPromptPolicy:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, Class, void))a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (objc_msgSend( (id)objc_opt_class(self, v9),  "_isClientAllowedToRequestCapabilitiesForConnection:",  v8))
  {
    uint64_t v11 = a3 == 1;
    unsigned int v12 = objc_msgSend( (id)objc_opt_class(self, v10),  "_shouldBypassEnforcementOfPrivacyAcknowledgementForClientConnection:forIncomingCloudServiceCap abilitiesRequest:",  v8,  1);
    if (v12) {
      uint64_t v11 = 2LL;
    }
    os_unfair_lock_lock(&self->_lock);
    if (v12)
    {
      if (self->_hasValidPrivilegedCapabilities)
      {
        uint64_t v13 = 6LL;
LABEL_12:
        Class v17 = (&self->super.isa)[v13];
        os_unfair_lock_unlock(p_lock);
        v6[2](v6, v17, 0LL);
        goto LABEL_16;
      }
    }

    else if (self->_hasValidCapabilities)
    {
      uint64_t v13 = 3LL;
      goto LABEL_12;
    }

    v18 = objc_alloc_init(&OBJC_CLASS___ICDCloudServiceCapabilitiesRequestContext);
    -[ICDCloudServiceCapabilitiesRequestContext setCompletionHandler:](v18, "setCompletionHandler:", v6);
    -[ICDCloudServiceCapabilitiesRequestContext setPrivacyAcknowledgementPolicy:]( v18,  "setPrivacyAcknowledgementPolicy:",  v11);
    capabilitiesRequestContexts = self->_capabilitiesRequestContexts;
    if (!capabilitiesRequestContexts)
    {
      v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v21 = self->_capabilitiesRequestContexts;
      self->_capabilitiesRequestContexts = v20;

      capabilitiesRequestContexts = self->_capabilitiesRequestContexts;
    }

    -[NSMutableArray addObject:](capabilitiesRequestContexts, "addObject:", v18);

    os_unfair_lock_unlock(&self->_lock);
    -[ICDCloudServiceStatusMonitor _refreshCapabilitiesWithPrivacyAcknowledgementPolicy:]( self,  "_refreshCapabilitiesWithPrivacyAcknowledgementPolicy:",  v11);
  }

  else
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  ICErrorDomain,  -7009LL,  @"Client is not allowed to request cloud service capabilities."));
    id v15 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "msv_description"));
      int v22 = 138543874;
      v23 = self;
      __int16 v24 = 2114;
      v25 = v16;
      __int16 v26 = 2114;
      v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@: %{public}@ originatingClientConnection = %{public}@.",  (uint8_t *)&v22,  0x20u);
    }

    ((void (**)(id, Class, void *))v6)[2](v6, 0LL, v14);
  }

- (void)requestStorefrontCountryCodeWithCompletionHandler:(id)a3
{
  objc_super v4 = (void (**)(id, NSString *, void))a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (objc_msgSend( (id)objc_opt_class(self, v6),  "_isClientAllowedToRequestRestrictedInformationForConnection:",  v5))
  {
    os_unfair_lock_lock(&self->_lock);
    v7 = self->_storefrontCountryCode;
    if (v7)
    {
      os_unfair_lock_unlock(&self->_lock);
      v4[2](v4, v7, 0LL);
    }

    else
    {
      storefrontCountryCodeRequestCompletionHandlers = self->_storefrontCountryCodeRequestCompletionHandlers;
      if (!storefrontCountryCodeRequestCompletionHandlers)
      {
        unsigned int v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        uint64_t v13 = self->_storefrontCountryCodeRequestCompletionHandlers;
        self->_storefrontCountryCodeRequestCompletionHandlers = v12;

        storefrontCountryCodeRequestCompletionHandlers = self->_storefrontCountryCodeRequestCompletionHandlers;
      }

      __int16 v14 = objc_retainBlock(v4);
      -[NSMutableArray addObject:](storefrontCountryCodeRequestCompletionHandlers, "addObject:", v14);

      os_unfair_lock_unlock(&self->_lock);
      -[ICDCloudServiceStatusMonitor _refreshStorefrontCountryCode](self, "_refreshStorefrontCountryCode");
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  ICErrorDomain,  -7009LL,  @"Client is not allowed to request storefront country code."));
    uint64_t v9 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "msv_description"));
      int v15 = 138543874;
      v16 = self;
      __int16 v17 = 2114;
      v18 = v10;
      __int16 v19 = 2114;
      v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: %{public}@ originatingClientConnection = %{public}@.",  (uint8_t *)&v15,  0x20u);
    }

    ((void (**)(id, NSString *, void *))v4)[2](v4, 0LL, v8);
  }
}

- (void)requestStorefrontIdentifierWithCompletionHandler:(id)a3
{
  objc_super v4 = (void (**)(id, NSString *, void))a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (objc_msgSend( (id)objc_opt_class(self, v6),  "_isClientAllowedToRequestRestrictedInformationForConnection:",  v5))
  {
    os_unfair_lock_lock(&self->_lock);
    v7 = self->_storefrontIdentifier;
    if (v7)
    {
      os_unfair_lock_unlock(&self->_lock);
      v4[2](v4, v7, 0LL);
    }

    else
    {
      storefrontIdentifierRequestCompletionHandlers = self->_storefrontIdentifierRequestCompletionHandlers;
      if (!storefrontIdentifierRequestCompletionHandlers)
      {
        unsigned int v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        uint64_t v13 = self->_storefrontIdentifierRequestCompletionHandlers;
        self->_storefrontIdentifierRequestCompletionHandlers = v12;

        storefrontIdentifierRequestCompletionHandlers = self->_storefrontIdentifierRequestCompletionHandlers;
      }

      __int16 v14 = objc_retainBlock(v4);
      -[NSMutableArray addObject:](storefrontIdentifierRequestCompletionHandlers, "addObject:", v14);

      os_unfair_lock_unlock(&self->_lock);
      -[ICDCloudServiceStatusMonitor _refreshStorefrontIdentifier](self, "_refreshStorefrontIdentifier");
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  ICErrorDomain,  -7009LL,  @"Client is not allowed to request storefront identifier."));
    uint64_t v9 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "msv_description"));
      int v15 = 138543874;
      v16 = self;
      __int16 v17 = 2114;
      v18 = v10;
      __int16 v19 = 2114;
      v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: %{public}@ originatingClientConnection = %{public}@.",  (uint8_t *)&v15,  0x20u);
    }

    ((void (**)(id, NSString *, void *))v4)[2](v4, 0LL, v8);
  }
}

- (void)requestDeveloperTokenWithOptions:(unint64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5
{
  char v6 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (objc_msgSend( (id)objc_opt_class(self, v12),  "_isClientAllowedToRequestRestrictedInformationForConnection:",  v11))
  {
    id v26 = 0LL;
    id v14 = objc_msgSend( (id)objc_opt_class(self, v13),  "_requestingBundleIdentifierForOriginatingClientConnection:clientInfo:error:",  v11,  v9,  &v26);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    uint64_t v17 = (uint64_t)v26;
    if (v15 | v17)
    {
      if (v15)
      {
        id v18 = objc_msgSend( (id)objc_opt_class(self, v16),  "_clientInfoForDeveloperTokenRequestWithRequestingApplicationBundleIdentifier:",  v15);
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        id v20 = [[ICDeveloperTokenFetchRequest alloc] initWithClientInfo:v19 options:v6 & 1];
        [v20 setClientType:1];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100037110;
        v24[3] = &unk_1001A24E8;
        id v25 = v10;
        [v20 performRequestWithResponseHandler:v24];

LABEL_10:
        goto LABEL_11;
      }
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v23 handleFailureInMethod:a2 object:self file:@"ICDCloudServiceStatusMonitor.m" lineNumber:275 description:@"Both requestingApplicationBundleIdentifier and error are nil. This is unexpected."];
    }

    (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0LL, v17);
    goto LABEL_10;
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  ICErrorDomain,  -7009LL,  @"Client is not allowed to request developer token."));
  v21 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17, "msv_description"));
    *(_DWORD *)buf = 138543874;
    v28 = self;
    __int16 v29 = 2114;
    v30 = v22;
    __int16 v31 = 2114;
    v32 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@: %{public}@ originatingClientConnection = %{public}@.",  buf,  0x20u);
  }

  (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0LL, v17);
LABEL_11:
}

- (void)requestUserTokenForDeveloperToken:(id)a3 options:(unint64_t)a4 clientInfo:(id)a5 completionHandler:(id)a6
{
  char v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (objc_msgSend( (id)objc_opt_class(self, v15),  "_isClientAllowedToRequestRestrictedInformationForConnection:",  v14))
  {
    id v29 = 0LL;
    id v17 = objc_msgSend( (id)objc_opt_class(self, v16),  "_requestingBundleIdentifierForOriginatingClientConnection:clientInfo:error:",  v14,  v12,  &v29);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    uint64_t v20 = (uint64_t)v29;
    if (v18 | v20)
    {
      if (v18)
      {
        id v21 = objc_msgSend( (id)objc_opt_class(self, v19),  "_clientInfoForUserTokenRequestWithRequestingApplicationBundleIdentifier:",  v18);
        int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        id v23 = [[ICMusicUserTokenFetchRequest alloc] initWithDeveloperToken:v11 clientInfo:v22 options:v8 & 1];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_100037104;
        v27[3] = &unk_1001A24E8;
        id v28 = v13;
        [v23 performRequestWithResponseHandler:v27];

LABEL_10:
        goto LABEL_11;
      }
    }

    else
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v26 handleFailureInMethod:a2 object:self file:@"ICDCloudServiceStatusMonitor.m" lineNumber:306 description:@"Both requestingApplicationBundleIdentifier and error are nil. This is unexpected."];
    }

    (*((void (**)(id, void, uint64_t))v13 + 2))(v13, 0LL, v20);
    goto LABEL_10;
  }

  uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  ICErrorDomain,  -7009LL,  @"Client is not allowed to request user token."));
  __int16 v24 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20, "msv_description"));
    *(_DWORD *)buf = 138543874;
    __int16 v31 = self;
    __int16 v32 = 2114;
    v33 = v25;
    __int16 v34 = 2114;
    v35 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@: %{public}@ originatingClientConnection = %{public}@.",  buf,  0x20u);
  }

  (*((void (**)(id, void, uint64_t))v13 + 2))(v13, 0LL, v20);
LABEL_11:
}

- (void)requestMusicKitTokensWithOptions:(unint64_t)a3 clientInfo:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (objc_msgSend( (id)objc_opt_class(self, v12),  "_isClientAllowedToRequestRestrictedInformationForConnection:",  v11))
  {
    id v28 = 0LL;
    id v14 = objc_msgSend( (id)objc_opt_class(self, v13),  "_requestingBundleIdentifierForOriginatingClientConnection:clientInfo:error:",  v11,  v9,  &v28);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    uint64_t v17 = (uint64_t)v28;
    if (v15 | v17)
    {
      if (v15)
      {
        id v18 = objc_msgSend( (id)objc_opt_class(self, v16),  "_clientInfoForDeveloperTokenRequestWithRequestingApplicationBundleIdentifier:",  v15);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        id v20 = [[ICDeveloperTokenFetchRequest alloc] initWithClientInfo:v19 options:a3 & 1];
        [v20 setClientType:1];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100036ED4;
        v24[3] = &unk_1001A2538;
        id v26 = v10;
        void v24[4] = self;
        id v25 = (id)v15;
        unint64_t v27 = a3;
        [v20 performRequestWithResponseHandler:v24];

LABEL_10:
        goto LABEL_11;
      }
    }

    else
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v23 handleFailureInMethod:a2 object:self file:@"ICDCloudServiceStatusMonitor.m" lineNumber:336 description:@"Both requestingApplicationBundleIdentifier and error are nil. This is unexpected."];
    }

    (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0LL, v17);
    goto LABEL_10;
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  ICErrorDomain,  -7009LL,  @"Client is not allowed to request MusicKit tokens."));
  id v21 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17, "msv_description"));
    *(_DWORD *)buf = 138543874;
    v30 = self;
    __int16 v31 = 2114;
    __int16 v32 = v22;
    __int16 v33 = 2114;
    __int16 v34 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@: %{public}@ originatingClientConnection = %{public}@.",  buf,  0x20u);
  }

  (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0LL, v17);
LABEL_11:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  unsigned int v8 = objc_msgSend(v7, "icd_isConnectionAllowedForService:", 4);
  if (v8)
  {
    [v7 setExportedObject:self];
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudServiceStatusRemoteMonitoring serviceInterface]( &OBJC_CLASS___ICCloudServiceStatusRemoteMonitoring,  "serviceInterface"));
    [v7 setExportedInterface:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudServiceStatusRemoteMonitoring clientInterface]( &OBJC_CLASS___ICCloudServiceStatusRemoteMonitoring,  "clientInterface"));
    [v7 setRemoteObjectInterface:v10];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100036E2C;
    v19[3] = &unk_1001A2560;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, &from);
    [v7 setInterruptionHandler:v19];
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    uint64_t v15 = sub_100036E80;
    uint64_t v16 = &unk_1001A2560;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    [v7 setInvalidationHandler:&v13];
    objc_msgSend(v7, "resume", v13, v14, v15, v16);
    id v11 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = self;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Accepted new client connection: %{public}@.",  buf,  0x16u);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)_handleClientConnectionInterrupted:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Client connection was interrupted: %{public}@.",  (uint8_t *)&v6,  0x16u);
  }

  -[ICDCloudServiceStatusMonitor _handleClientConnectionSevered:](self, "_handleClientConnectionSevered:", v4);
}

- (void)_handleClientConnectionInvalidated:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Client connection was invalidated: %{public}@.",  (uint8_t *)&v6,  0x16u);
  }

  -[ICDCloudServiceStatusMonitor _handleClientConnectionSevered:](self, "_handleClientConnectionSevered:", v4);
}

- (void)_handleClientConnectionSevered:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  cancellableCapabilitiesRequestOperations = self->_cancellableCapabilitiesRequestOperations;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100036DBC;
  v20[3] = &unk_1001A2588;
  id v6 = v4;
  id v21 = v6;
  int v22 = buf;
  -[NSMutableArray enumerateObjectsUsingBlock:]( cancellableCapabilitiesRequestOperations,  "enumerateObjectsUsingBlock:",  v20);
  if (*(void *)(*(void *)&buf[8] + 24LL) == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cancellableCapabilitiesRequestOperations, "objectAtIndex:"));
    -[NSMutableArray removeObjectAtIndex:]( self->_cancellableCapabilitiesRequestOperations,  "removeObjectAtIndex:",  *(void *)(*(void *)&buf[8] + 24LL));
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int16 v8 = self->_activeObservationTokenToClientConnectionMapping;
  id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v23,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_activeObservationTokenToClientConnectionMapping,  "objectForKey:",  v12,  (void)v16));
        if ([v13 isEqual:v6])
        {
          id v9 = v12;

          goto LABEL_14;
        }
      }

      id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v23,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    int v7 = 138543618;
    __int16 v8 = self;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Handling %{public}@.",  (uint8_t *)&v7,  0x16u);
  }

  -[ICDCloudServiceStatusMonitor _notifyObserversForActiveUserIdentityChanged]( self,  "_notifyObserversForActiveUserIdentityChanged");
  -[ICDCloudServiceStatusMonitor _refreshCapabilitiesWithPrivacyAcknowledgementPolicy:]( self,  "_refreshCapabilitiesWithPrivacyAcknowledgementPolicy:",  0LL);
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    int v7 = 138543618;
    __int16 v8 = self;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Handling %{public}@.",  (uint8_t *)&v7,  0x16u);
  }

  -[ICDCloudServiceStatusMonitor _refreshStorefrontIdentifier](self, "_refreshStorefrontIdentifier");
}

- (void)_handleUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    int v16 = 138543618;
    __int128 v17 = self;
    __int16 v18 = 2114;
    __int128 v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Handling %{public}@.",  (uint8_t *)&v16,  0x16u);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localStoreAccountProperties]);

  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 propertyListRepresentation]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 lastKnownLocalStoreAccountProperties]);
  if (v9 == v11)
  {
  }

  else
  {
    uint64_t v12 = v11;
    unsigned __int8 v13 = [v9 isEqual:v11];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 propertyListRepresentation]);
      [v14 setLastKnownLocalStoreAccountProperties:v15];

      -[ICDCloudServiceStatusMonitor _refreshStorefrontIdentifier](self, "_refreshStorefrontIdentifier");
    }
  }
}

- (void)_handleUpdatedBag:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    int v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Bag was updated: %{public}@.",  (uint8_t *)&v6,  0x16u);
  }

  -[ICDCloudServiceStatusMonitor _updateWithBag:error:](self, "_updateWithBag:error:", v4, 0LL);
  -[ICDCloudServiceStatusMonitor _refreshCapabilitiesWithPrivacyAcknowledgementPolicy:]( self,  "_refreshCapabilitiesWithPrivacyAcknowledgementPolicy:",  0LL);
}

- (void)_handleUpdatedSubscriptionStatus:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    int v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Subscription status was updated: %{public}@.",  (uint8_t *)&v6,  0x16u);
  }

  -[ICDCloudServiceStatusMonitor _refreshCapabilitiesWithPrivacyAcknowledgementPolicy:]( self,  "_refreshCapabilitiesWithPrivacyAcknowledgementPolicy:",  0LL);
}

- (void)_beginObservingCloudServiceStatus
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Beginning to observe cloud service status.",  buf,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  [v4 addObserver:self selector:"_handleActiveUserIdentityDidChangeNotification:" name:ICActiveUserIdentityDidChangeNotification object:v5];

  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  [v4 addObserver:self selector:"_handleUserIdentityStoreDidChangeNotification:" name:ICUserIdentityStoreDidChangeNotification object:v6];

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  [v4 addObserver:self selector:"_handleUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification:" name:ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification object:v7];

  objc_initWeak((id *)buf, self);
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagMonitor sharedBagMonitor](&OBJC_CLASS___ICURLBagMonitor, "sharedBagMonitor"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100036D2C;
  v17[3] = &unk_1001A25D0;
  objc_copyWeak(&v18, (id *)buf);
  id v9 = (NSCopying *)objc_claimAutoreleasedReturnValue([v8 beginObservingBagWithHandler:v17]);
  bagObservationToken = self->_bagObservationToken;
  self->_bagObservationToken = v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity autoupdatingActiveAccount](&OBJC_CLASS___ICUserIdentity, "autoupdatingActiveAccount"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusMonitor sharedMonitorForIdentity:]( &OBJC_CLASS___ICMusicSubscriptionStatusMonitor,  "sharedMonitorForIdentity:",  v11));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100036D74;
  v15[3] = &unk_1001A25F8;
  objc_copyWeak(&v16, (id *)buf);
  unsigned __int8 v13 = (NSCopying *)objc_claimAutoreleasedReturnValue([v12 beginObservingSubscriptionStatusWithHandler:v15]);
  subscriptionStatusObservationToken = self->_subscriptionStatusObservationToken;
  self->_subscriptionStatusObservationToken = v13;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)_endObservingCloudServiceStatus
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = ICActiveUserIdentityDidChangeNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  [v3 removeObserver:self name:v4 object:v5];

  uint64_t v6 = ICUserIdentityStoreDidChangeNotification;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  [v3 removeObserver:self name:v6 object:v7];

  uint64_t v8 = ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  [v3 removeObserver:self name:v8 object:v9];

  if (self->_bagObservationToken)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagMonitor sharedBagMonitor](&OBJC_CLASS___ICURLBagMonitor, "sharedBagMonitor"));
    [v10 endObservingBagWithToken:self->_bagObservationToken];

    bagObservationToken = self->_bagObservationToken;
    self->_bagObservationToken = 0LL;
  }

  if (self->_subscriptionStatusObservationToken)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentity autoupdatingActiveAccount]( &OBJC_CLASS___ICUserIdentity,  "autoupdatingActiveAccount"));
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusMonitor sharedMonitorForIdentity:]( &OBJC_CLASS___ICMusicSubscriptionStatusMonitor,  "sharedMonitorForIdentity:",  v12));

    [v13 endObservingSubscriptionStatusWithToken:self->_subscriptionStatusObservationToken];
    subscriptionStatusObservationToken = self->_subscriptionStatusObservationToken;
    self->_subscriptionStatusObservationToken = 0LL;
  }

  self->_capabilities = 0LL;
  self->_hasValidCapabilities = 0;
  self->_privilegedCapabilities = 0LL;
  self->_hasValidPrivilegedCapabilities = 0;
  storefrontCountryCode = self->_storefrontCountryCode;
  self->_storefrontCountryCode = 0LL;

  storefrontIdentifier = self->_storefrontIdentifier;
  self->_storefrontIdentifier = 0LL;

  __int128 v17 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    __int128 v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Stopped observing cloud service status.",  (uint8_t *)&v18,  0xCu);
  }
}

- (void)_notifyObserversForActiveUserIdentityChanged
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  uint64_t v4 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Notifying observers of active account changed.",  buf,  0xCu);
  }

  os_unfair_lock_lock(p_lock);
  id v5 = -[NSMutableDictionary copy](self->_activeObservationTokenToClientConnectionMapping, "copy");
  os_unfair_lock_unlock(p_lock);
  id v6 = [v5 count];
  int v7 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = "s";
    *(_DWORD *)buf = 138543874;
    id v11 = self;
    if (v6 == (id)1) {
      uint64_t v8 = "";
    }
    __int16 v12 = 2048;
    id v13 = v6;
    __int16 v14 = 2080;
    uint64_t v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Active account did change. About to notify %llu observer%s.",  buf,  0x20u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100036B28;
  v9[3] = &unk_1001A2620;
  v9[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
}

- (void)_refreshCloudServiceStatus
{
}

- (void)_refreshCapabilitiesWithPrivacyAcknowledgementPolicy:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v6 = objc_alloc(&OBJC_CLASS___ICDCloudServiceCapabilitiesRequestOperation);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  uint64_t v8 = -[ICDCloudServiceCapabilitiesRequestOperation initWithIdentity:](v6, "initWithIdentity:", v7);

  -[ICDCloudServiceCapabilitiesRequestOperation setPrivacyAcknowledgementPolicy:]( v8,  "setPrivacyAcknowledgementPolicy:",  a3);
  if (a3 == 1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    -[ICDCloudServiceCapabilitiesRequestOperation setOriginatingClientConnection:]( v8,  "setOriginatingClientConnection:",  v9);
    os_unfair_lock_lock(p_lock);
    cancellableCapabilitiesRequestOperations = self->_cancellableCapabilitiesRequestOperations;
    if (!cancellableCapabilitiesRequestOperations)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int16 v12 = self->_cancellableCapabilitiesRequestOperations;
      self->_cancellableCapabilitiesRequestOperations = v11;

      cancellableCapabilitiesRequestOperations = self->_cancellableCapabilitiesRequestOperations;
    }

    -[NSMutableArray addObject:](cancellableCapabilitiesRequestOperations, "addObject:", v8);
    os_unfair_lock_unlock(p_lock);
  }

  objc_initWeak(&location, v8);
  __int16 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_100036AC0;
  __int128 v17 = &unk_1001A2648;
  objc_copyWeak(v19, &location);
  int v18 = self;
  v19[1] = (id)a3;
  -[ICDCloudServiceCapabilitiesRequestOperation setCompletionHandler:](v8, "setCompletionHandler:", &v14);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSOperationQueue ic_sharedRequestOperationQueueWithQualityOfService:]( &OBJC_CLASS___NSOperationQueue,  "ic_sharedRequestOperationQueueWithQualityOfService:",  25LL,  v14,  v15,  v16,  v17));
  [v13 addOperation:v8];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

- (void)_refreshStorefrontCountryCode
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  uint64_t v4 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Refreshing storefront country code.",  buf,  0xCu);
  }

  os_unfair_lock_lock(p_lock);
  if (self->_bagObservationToken)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagMonitor sharedBagMonitor](&OBJC_CLASS___ICURLBagMonitor, "sharedBagMonitor"));
    id v6 = (ICStoreRequestContext *)objc_claimAutoreleasedReturnValue([v5 bag]);

    if (v6)
    {
      os_unfair_lock_unlock(p_lock);
      -[ICDCloudServiceStatusMonitor _updateWithBag:error:](self, "_updateWithBag:error:", v6, 0LL);
      goto LABEL_12;
    }

    int v7 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v14 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: No bag was present on the bag monitor.",  buf,  0xCu);
    }
  }

  os_unfair_lock_unlock(p_lock);
  uint64_t v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Requesting bag directly.",  buf,  0xCu);
  }

  id v9 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  id v6 = -[ICStoreRequestContext initWithIdentity:](v9, "initWithIdentity:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000369CC;
  v12[3] = &unk_1001A48A8;
  v12[4] = self;
  [v11 getBagForRequestContext:v6 withCompletionHandler:v12];

LABEL_12:
}

- (void)_refreshStorefrontIdentifier
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Refreshing storefront identifier.",  buf,  0xCu);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000367C0;
  v6[3] = &unk_1001A4948;
  v6[4] = self;
  [v4 getPropertiesForUserIdentity:v5 completionHandler:v6];
}

- (void)_updateWithBag:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v40 = v8;
  id v41 = v7;
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "msv_errorByRemovingUnsafeUserInfo"));
  }

  else
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 stringForBagKey:ICURLBagKeyCountryCode]);
    if (v13)
    {
      __int16 v12 = (NSString *)v13;
LABEL_7:
      uint64_t v10 = 0LL;
      int v11 = 1;
      goto LABEL_8;
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7201LL,  0LL));
  }

  uint64_t v10 = (void *)v9;
  if (!v9)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v38 handleFailureInMethod:a2, self, @"ICDCloudServiceStatusMonitor.m", 761, @"%@: Either storefrontCountryCode or finalError are expected to be non-nil at this point.", self object file lineNumber description];

    __int16 v12 = 0LL;
    goto LABEL_7;
  }

  int v11 = 0;
  __int16 v12 = 0LL;
LABEL_8:
  os_unfair_lock_lock(&self->_lock);
  id v14 = -[NSMutableArray copy](self->_storefrontCountryCodeRequestCompletionHandlers, "copy");
  storefrontCountryCodeRequestCompletionHandlers = self->_storefrontCountryCodeRequestCompletionHandlers;
  self->_storefrontCountryCodeRequestCompletionHandlers = 0LL;

  id v16 = -[NSMutableDictionary count](self->_activeObservationTokenToClientConnectionMapping, "count");
  id v17 = 0LL;
  char v18 = 0;
  id v39 = v16;
  if (v11 && v16)
  {
    __int128 v19 = self->_storefrontCountryCode;
    if (v19 == v12)
    {
    }

    else
    {
      id v20 = v19;
      unsigned __int8 v21 = -[NSString isEqual:](v19, "isEqual:", v12);

      if ((v21 & 1) == 0)
      {
        int v22 = (NSString *)-[NSString copy](v12, "copy");
        storefrontCountryCode = self->_storefrontCountryCode;
        self->_storefrontCountryCode = v22;

        id v17 = -[NSMutableDictionary copy](self->_activeObservationTokenToClientConnectionMapping, "copy");
        char v18 = 1;
        goto LABEL_15;
      }
    }

    char v18 = 0;
    id v17 = 0LL;
  }

- (void)_updateWithCapabilities:(unint64_t)a3 error:(id)a4 privacyAcknowledgementPolicy:(int64_t)a5 capabilitiesRequestOperation:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
  else {
    BOOL v13 = 0;
  }

  v59 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v14 = -[NSMutableDictionary count](self->_activeObservationTokenToClientConnectionMapping, "count");
  id v15 = v14;
  char v16 = 0;
  BOOL v17 = a5 != 2 && v13;
  if (a5 != 2 && v14)
  {
    if (self->_capabilities == a3)
    {
      char v16 = 0;
      if (!v10) {
        self->_hasValidCapabilities = 1;
      }
    }

    else
    {
      self->_capabilities = a3;
      self->_hasValidCapabilities = v10 == 0LL;
      activeObservationTokenToClientConnectionMapping = self->_activeObservationTokenToClientConnectionMapping;
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472LL;
      v71[2] = sub_1000361B0;
      v71[3] = &unk_1001A2670;
      v71[4] = self;
      v72 = v59;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( activeObservationTokenToClientConnectionMapping,  "enumerateKeysAndObjectsUsingBlock:",  v71);

      char v16 = 1;
    }

    BOOL v17 = v13;
  }

  id v53 = v15;
  os_unfair_lock_t lock = &self->_lock;
  if (v17 || !v15)
  {
    char v52 = v16;
  }

  else if (self->_privilegedCapabilities == a3)
  {
    char v52 = v16;
    if (!v10) {
      self->_hasValidPrivilegedCapabilities = 1;
    }
  }

  else
  {
    self->_privilegedCapabilities = a3;
    self->_hasValidPrivilegedCapabilities = v10 == 0LL;
    __int128 v19 = self->_activeObservationTokenToClientConnectionMapping;
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_100036218;
    v69[3] = &unk_1001A2670;
    v69[4] = self;
    v70 = v59;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v19, "enumerateKeysAndObjectsUsingBlock:", v69);

    char v52 = 1;
  }

  v57 = v11;
  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  v58 = self;
  id location = (id *)&self->_capabilitiesRequestContexts;
  unsigned __int8 v21 = self->_capabilitiesRequestContexts;
  id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v65,  v82,  16LL);
  v55 = v10;
  if (!v22)
  {
    id v25 = 0LL;
    goto LABEL_41;
  }

  id v23 = v22;
  BOOL v24 = v13;
  id v25 = 0LL;
  uint64_t v26 = *(void *)v66;
  do
  {
    for (i = 0LL; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v66 != v26) {
        objc_enumerationMutation(v21);
      }
      id v28 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
      id v29 = [v28 privacyAcknowledgementPolicy];
      if (a5 == 2)
      {
        if (v29 == (id)2) {
          goto LABEL_33;
        }
      }

      else if (a5 == 1 || !a5 && (v29 ? (BOOL v30 = v24) : (BOOL v30 = 0), !v30))
      {
LABEL_33:
        __int16 v31 = v20;
        goto LABEL_37;
      }

      __int16 v31 = v25;
      if (!v25)
      {
        __int16 v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        id v25 = v31;
      }

- (void)_updateWithStorefrontIdentifier:(id)a3 error:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (!(v7 | v8))
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v33 handleFailureInMethod:a2, self, @"ICDCloudServiceStatusMonitor.m", 946, @"%@: Either storefrontIdentifier or error are expected to be non-nil at this point.", self object file lineNumber description];
  }

  os_unfair_lock_lock(&self->_lock);
  id v9 = -[NSMutableArray copy](self->_storefrontIdentifierRequestCompletionHandlers, "copy");
  storefrontIdentifierRequestCompletionHandlers = self->_storefrontIdentifierRequestCompletionHandlers;
  self->_storefrontIdentifierRequestCompletionHandlers = 0LL;

  id v11 = -[NSMutableDictionary count](self->_activeObservationTokenToClientConnectionMapping, "count");
  id v12 = v11;
  id v13 = 0LL;
  char v14 = 0;
  if (!v8 && v11)
  {
    id v15 = self->_storefrontIdentifier;
    if (v15 == (NSString *)v7)
    {
    }

    else
    {
      char v16 = v15;
      unsigned __int8 v17 = -[NSString isEqual:](v15, "isEqual:", v7);

      if ((v17 & 1) == 0)
      {
        char v18 = (NSString *)[(id)v7 copy];
        storefrontIdentifier = self->_storefrontIdentifier;
        self->_storefrontIdentifier = v18;

        id v13 = -[NSMutableDictionary copy](self->_activeObservationTokenToClientConnectionMapping, "copy");
        char v14 = 1;
        goto LABEL_10;
      }
    }

    char v14 = 0;
    id v13 = 0LL;
  }

- (void).cxx_destruct
{
}

+ (BOOL)_isClientAllowedToRequestCapabilitiesForConnection:(id)a3
{
  return _objc_msgSend(a3, "icd_isConnectionAllowedForService:validationReason:", 4, 1);
}

+ (BOOL)_isClientAllowedToRequestRestrictedInformationForConnection:(id)a3
{
  return _objc_msgSend(a3, "icd_isConnectionAllowedForService:validationReason:", 3, 1);
}

+ (BOOL)_shouldBypassEnforcementOfPrivacyAcknowledgementForClientConnection:(id)a3 forIncomingCloudServiceCapabilitiesRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.itunesstored.privacy-acknowledged"]);
  if ((objc_opt_respondsToSelector(v6, "BOOLValue") & 1) != 0)
  {
    unsigned int v7 = [v6 BOOLValue];
    if (v7 && v4)
    {
      unint64_t v8 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543618;
        id v11 = a1;
        __int16 v12 = 2114;
        id v13 = @"com.apple.itunesstored.privacy-acknowledged";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Client has %{public}@ entitlement. No need to enforce privacy acknowledgement for cloud service ca pabilities request.",  (uint8_t *)&v10,  0x16u);
      }

      LOBYTE(v7) = 1;
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (id)_clientInfoForDeveloperTokenRequestWithRequestingApplicationBundleIdentifier:(id)a3
{
  return +[ICClientInfo clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:bundleIdentifier:]( &OBJC_CLASS___ICClientInfo,  "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:bundleIdentifier:",  a3,  @"1",  a3);
}

+ (id)_clientInfoForUserTokenRequestWithRequestingApplicationBundleIdentifier:(id)a3
{
  return +[ICClientInfo _clientInfoForCloudDaemonOriginatedMusicKitRequestWithRequestingBundleIdentifier:]( &OBJC_CLASS___ICClientInfo,  "_clientInfoForCloudDaemonOriginatedMusicKitRequestWithRequestingBundleIdentifier:",  a3);
}

+ (id)_requestingBundleIdentifierForOriginatingClientConnection:(id)a3 clientInfo:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    [v8 auditToken];
  }

  else
  {
    __int128 v52 = 0u;
    __int128 v53 = 0u;
  }

  *(_OWORD *)buf = v52;
  *(_OWORD *)&buf[16] = v53;
  uint64_t v10 = MSVBundleIDForAuditToken(buf);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (!v11)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    if (v11)
    {
      __int16 v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&_BYTE buf[24] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Failed to retrieve bundle identifier of the requesting application from the audit_token_t; instead"
          ", using bundle identifier from %{public}@, i.e. %{public}@.",
          buf,
          0x20u);
      }
    }
  }

  id v51 = 0LL;
  *(_OWORD *)buf = v52;
  *(_OWORD *)&buf[16] = v53;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordForAuditToken:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordForAuditToken:error:",  buf,  &v51));
  id v15 = v51;
  if (v15)
  {
    char v16 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "msv_description"));
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to retrieve bundle extension record with error: %{public}@.",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___LSApplicationExtensionRecord, v14);
    if ((objc_opt_isKindOfClass(v13, v18) & 1) == 0) {
      goto LABEL_24;
    }
    char v16 = v13;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s containingBundleRecord](v16, "containingBundleRecord"));
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord, v20);
    uint64_t v49 = v19;
    id v50 = a1;
    if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0)
    {
      id v22 = v19;
    }

    else
    {
      uint64_t v23 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        os_log_t v25 = (objc_class *)objc_opt_class(v16, v24);
        uint64_t v26 = NSStringFromClass(v25);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        uint32_t v29 = (objc_class *)objc_opt_class(v49, v28);
        id v30 = NSStringFromClass(v29);
        uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v50;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&_BYTE buf[24] = v27;
        __int16 v55 = 2114;
        v56 = v49;
        __int16 v57 = 2114;
        uint64_t v58 = v31;
        id v32 = (void *)v31;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}@: Requesting application extension %{public}@ (%{public}@) has a containing bundle which is not an a pplication: %{public}@ (%{public}@).",  buf,  0x34u);
      }

      id v22 = 0LL;
    }

    id v33 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
    if (v33)
    {
      id v34 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v36 = (objc_class *)objc_opt_class(v16, v35);
        __int128 v37 = NSStringFromClass(v36);
        v48 = (void *)objc_claimAutoreleasedReturnValue(v37);
        __int128 v39 = (objc_class *)objc_opt_class(v22, v38);
        v40 = NSStringFromClass(v39);
        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(v40);
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = v50;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&_BYTE buf[24] = v48;
        __int16 v55 = 2114;
        v56 = v33;
        __int16 v57 = 2114;
        uint64_t v58 = (uint64_t)v22;
        __int16 v59 = 2114;
        v60 = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Client is an application extension: %{public}@ (%{public}@). Using bundle identifier %{public}@ from containing application: %{public}@ (%{public}@).",  buf,  0x3Eu);
      }

      id v41 = v33;
      id v11 = v41;
    }

    a1 = v50;
  }

LABEL_24:
  if (v11)
  {
    __int16 v42 = 0LL;
    if (a5) {
LABEL_26:
    }
      *a5 = v42;
  }

  else
  {
    __int16 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  ICErrorDomain,  -7009LL,  @"Failed to retrieve bundle identifier of the requesting application. The requesting application is likely missing the %@ entitlement.",  @"application-identifier"));
    id v45 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      __int16 v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "msv_description"));
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v46;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&_BYTE buf[24] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "%{public}@: %{public}@ originatingClientConnection = %{public}@.",  buf,  0x20u);
    }

    if (a5) {
      goto LABEL_26;
    }
  }

  id v43 = v11;

  return v43;
}

@end