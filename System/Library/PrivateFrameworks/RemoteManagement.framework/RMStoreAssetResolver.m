@interface RMStoreAssetResolver
+ (BOOL)removedAsset:(id)a3 personaID:(id)a4 error:(id *)a5;
+ (id)newStoreAssetResolver:(id)a3;
+ (void)resolveAsset:(id)a3 unresolvedAsset:(id)a4 personaID:(id)a5 isDDM:(BOOL)a6 enrollmentType:(int64_t)a7 completionHandler:(id)a8;
+ (void)unassignAssets:(id)a3 personaID:(id)a4 completionHandler:(id)a5;
- (BOOL)_storeAssetData:(id)a3 asset:(id)a4 assetKey:(id)a5 enrollmentType:(int64_t)a6 error:(id *)a7;
- (BOOL)_validateAsset:(id)a3 reference:(id)a4 url:(id)a5 statusCode:(id)a6 headers:(id)a7 data:(id)a8 downloadURL:(id)a9 error:(id *)a10;
- (BOOL)isContentTypeMismatchedWithExpectedType:(id)a3 headers:(id)a4 statusCode:(int64_t)a5;
- (BOOL)isHashMismatchedWithExpectedHash:(id)a3 data:(id)a4 downloadURL:(id)a5 dataSize:(unint64_t)a6;
- (BOOL)isPayloadSizeMismatchedWithExpectedSize:(unint64_t)a3 actualSize:(unint64_t)a4 statusCode:(int64_t)a5;
- (RMManagedKeychainController)keychainController;
- (RMStoreAssetResolver)initWithManagedKeychainController:(id)a3;
- (__CFString)_getKeychainAccessibilityFromAsset:(id)a3 unresolvedAsset:(id)a4;
- (id)_dataURLForAsset:(id)a3 reference:(id)a4 queryParameters:(id)a5;
- (id)_getAssetAuthenticationFromAsset:(id)a3;
- (id)_getAssetReferenceFromAsset:(id)a3;
- (id)_getContentType:(id)a3;
- (id)_keychainItemForAsset:(id)a3 unresolvedAsset:(id)a4 assetKey:(id)a5 configurationKey:(id)a6 returnUserName:(id *)a7 error:(id *)a8;
- (id)getSHA256StringFromData:(id)a3;
- (id)getSHA256StringFromURL:(id)a3;
- (void)_assignKeychainItemForAsset:(id)a3 unresolvedAsset:(id)a4 assetKey:(id)a5 configurationKey:(id)a6 completionHandler:(id)a7;
- (void)_processResponseWithAsset:(id)a3 reference:(id)a4 unresolvedAsset:(id)a5 url:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9;
- (void)_resolveAsset:(id)a3 unresolvedAsset:(id)a4 isDDM:(BOOL)a5 completionHandler:(id)a6;
- (void)_resolveAsset:(id)a3 unresolvedAsset:(id)a4 reference:(id)a5 url:(id)a6 useDDM:(BOOL)a7 completionHandler:(id)a8;
- (void)_resolveKeychainAsset:(id)a3 unresolvedAsset:(id)a4 isDDM:(BOOL)a5 enrollmentType:(int64_t)a6 completionHandler:(id)a7;
- (void)setKeychainController:(id)a3;
@end

@implementation RMStoreAssetResolver

+ (void)resolveAsset:(id)a3 unresolvedAsset:(id)a4 personaID:(id)a5 isDDM:(BOOL)a6 enrollmentType:(int64_t)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  id v13 = a4;
  id v14 = a8;
  id v15 = a5;
  id v16 = a3;
  id v17 = +[RMManagedKeychainController newManagedKeychainControllerForScope:personaID:]( &OBJC_CLASS___RMManagedKeychainController,  "newManagedKeychainControllerForScope:personaID:",  +[RMStoreHelper storeScope](&OBJC_CLASS___RMStoreHelper, "storeScope"),  v15);

  id v18 = +[RMStoreAssetResolver newStoreAssetResolver:]( &OBJC_CLASS___RMStoreAssetResolver,  "newStoreAssetResolver:",  v17);
  [v17 lockBeforeModifyingKeychain];
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___RMStoreUnresolvedKeychainAsset);
  LOBYTE(v15) = objc_opt_isKindOfClass(v13, v19);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if ((v15 & 1) != 0)
  {
    if (v21) {
      sub_100064C2C();
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100061C4C;
    v27[3] = &unk_1000BA9A8;
    v22 = &v28;
    id v28 = v17;
    id v29 = v14;
    id v23 = v14;
    [v18 _resolveKeychainAsset:v16 unresolvedAsset:v13 isDDM:v10 enrollmentType:a7 completionHandler:v27];

    id v16 = v29;
  }

  else
  {
    if (v21) {
      sub_100064C58();
    }

    [v17 unlockAfterModifyingKeychain];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100061CB4;
    v25[3] = &unk_1000BA9D0;
    v22 = &v26;
    id v26 = v14;
    id v24 = v14;
    [v18 _resolveAsset:v16 unresolvedAsset:v13 isDDM:v10 completionHandler:v25];
  }
}

+ (void)unassignAssets:(id)a3 personaID:(id)a4 completionHandler:(id)a5
{
  v7 = (void (**)(id, void))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[RMManagedKeychainController newManagedKeychainControllerForScope:personaID:]( &OBJC_CLASS___RMManagedKeychainController,  "newManagedKeychainControllerForScope:personaID:",  +[RMStoreHelper storeScope](&OBJC_CLASS___RMStoreHelper, "storeScope"),  v8);

  [v10 lockBeforeModifyingKeychain];
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 key]);

  id v14 = 0LL;
  LODWORD(v9) = [v10 unassignAllAssetsFromConfigurationKey:v11 error:&v14];
  id v12 = v14;

  [v10 unlockAfterModifyingKeychain];
  if ((_DWORD)v9) {
    id v13 = v12;
  }
  else {
    id v13 = 0LL;
  }
  ((void (**)(id, id))v7)[2](v7, v13);
}

+ (BOOL)removedAsset:(id)a3 personaID:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[RMManagedKeychainController newManagedKeychainControllerForScope:personaID:]( &OBJC_CLASS___RMManagedKeychainController,  "newManagedKeychainControllerForScope:personaID:",  +[RMStoreHelper storeScope](&OBJC_CLASS___RMStoreHelper, "storeScope"),  v7);

  [v9 lockBeforeModifyingKeychain];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 key]);

  LOBYTE(a5) = [v9 removedKeychainItemsForAssetKey:v10 error:a5];
  [v9 unlockAfterModifyingKeychain];

  return (char)a5;
}

+ (id)newStoreAssetResolver:(id)a3
{
  id v3 = a3;
  v4 = -[RMStoreAssetResolver initWithManagedKeychainController:]( objc_alloc(&OBJC_CLASS___RMStoreAssetResolver),  "initWithManagedKeychainController:",  v3);

  return v4;
}

- (RMStoreAssetResolver)initWithManagedKeychainController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMStoreAssetResolver;
  v6 = -[RMStoreAssetResolver init](&v9, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keychainController, a3);
  }

  return v7;
}

- (void)_resolveAsset:(id)a3 unresolvedAsset:(id)a4 isDDM:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreAssetResolver _getAssetReferenceFromAsset:](self, "_getAssetReferenceFromAsset:", v10));
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 queryParameters]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreAssetResolver _dataURLForAsset:reference:queryParameters:]( self,  "_dataURLForAsset:reference:queryParameters:",  v10,  v13,  v14));

    if ((+[RMStoreUtility isValidURL:](&OBJC_CLASS___RMStoreUtility, "isValidURL:", v15) & 1) != 0)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreAssetResolver _getAssetAuthenticationFromAsset:]( self,  "_getAssetAuthenticationFromAsset:",  v10));
      id v17 = v16;
      id v18 = (id)v7;
      if (v16)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 payloadType]);
        id v18 = [v19 isEqualToString:@"MDM"];
      }

      if (!(_DWORD)v18 || v7)
      {
        -[RMStoreAssetResolver _resolveAsset:unresolvedAsset:reference:url:useDDM:completionHandler:]( self,  "_resolveAsset:unresolvedAsset:reference:url:useDDM:completionHandler:",  v10,  v11,  v13,  v15,  v18,  v12);
      }

      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetInvalidError:]( &OBJC_CLASS___RMErrorUtilities,  "createAssetInvalidError:",  @"Cannot use MDM as source of asset data"));
        BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100064CE4();
        }

        v12[2](v12, 0LL, v20);
      }
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetInvalidURLError:]( &OBJC_CLASS___RMErrorUtilities,  "createAssetInvalidURLError:",  v15));
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100064D1C();
      }

      v12[2](v12, 0LL, v17);
    }
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetInvalidError:]( &OBJC_CLASS___RMErrorUtilities,  "createAssetInvalidError:",  @"Asset has no Reference"));
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100064C84();
    }

    v12[2](v12, 0LL, v15);
  }
}

- (void)_resolveAsset:(id)a3 unresolvedAsset:(id)a4 reference:(id)a5 url:(id)a6 useDDM:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v45 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (![v14 resolveAs])
  {
    id v18 = objc_opt_new(&OBJC_CLASS___RMStoreDataFetcher);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 payloadContentType]);
    if (v23)
    {
      v62 = @"Accept";
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v15 payloadContentType]);
      id v25 = v14;
      id v26 = v18;
      id v27 = v15;
      id v28 = v17;
      id v29 = self;
      id v30 = v16;
      BOOL v31 = v9;
      v32 = (void *)v24;
      uint64_t v63 = v24;
      uint64_t v33 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));

      BOOL v9 = v31;
      uint64_t v19 = (RMStoreDataFetcher *)v33;
      id v16 = v30;
      self = v29;
      id v17 = v28;
      id v15 = v27;
      id v18 = v26;
      id v14 = v25;
    }

    else
    {
      uint64_t v19 = (RMStoreDataFetcher *)&__NSDictionary0__struct;
    }

    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_100062654;
    v54[3] = &unk_1000BA9F8;
    v54[4] = self;
    id v55 = v45;
    id v56 = v15;
    id v57 = v14;
    id v58 = v16;
    id v59 = v17;
    -[RMStoreDataFetcher fetchResponseDataAtURL:useDDM:additionalHeaders:completionHandler:]( v18,  "fetchResponseDataAtURL:useDDM:additionalHeaders:completionHandler:",  v58,  v9,  v19,  v54);

    goto LABEL_15;
  }

  if ([v14 resolveAs] == (id)1)
  {
    v43 = self;
    BOOL v44 = v9;
    id v18 = (RMStoreDataFetcher *)objc_claimAutoreleasedReturnValue([v14 downloadURL]);
    uint64_t v19 = (RMStoreDataFetcher *)objc_claimAutoreleasedReturnValue([v14 extensionToken]);
    if (!v19)
    {
      uint64_t v42 = -1LL;
LABEL_17:
      v35 = objc_opt_new(&OBJC_CLASS___RMStoreDataFetcher);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v15 payloadContentType]);
      if (v36)
      {
        v60 = @"Accept";
        v37 = v35;
        v38 = (void *)objc_claimAutoreleasedReturnValue([v15 payloadContentType]);
        v61 = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));

        v35 = v37;
      }

      else
      {
        v39 = &__NSDictionary0__struct;
      }

      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_10006268C;
      v46[3] = &unk_1000BAA48;
      v46[4] = v43;
      id v47 = v45;
      id v48 = v15;
      id v49 = v14;
      uint64_t v53 = v42;
      id v50 = v16;
      v51 = v18;
      id v52 = v17;
      v40 = v18;
      -[RMStoreDataFetcher downloadResponseDataAtURL:downloadURL:extensionToken:useDDM:additionalHeaders:completionHandler:]( v35,  "downloadResponseDataAtURL:downloadURL:extensionToken:useDDM:additionalHeaders:completionHandler:",  v50,  v40,  0LL,  v44,  v39,  v46);

      id v18 = v19;
      goto LABEL_21;
    }

    id v20 = +[RMSandbox consumeToken:](&OBJC_CLASS___RMSandbox, "consumeToken:", v19);
    BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
    v22 = v21;
    if (v20 != (id)-1LL)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100064E10();
      }
      uint64_t v42 = (uint64_t)v20;

      goto LABEL_17;
    }

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100064D7C((uint64_t)v18, v22);
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
    (*((void (**)(id, void, void *))v17 + 2))(v17, 0LL, v41);

LABEL_15:
    goto LABEL_21;
  }

  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    sub_100064E74(v14, v34);
  }

  id v18 = (RMStoreDataFetcher *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createInternalError]( &OBJC_CLASS___RMErrorUtilities,  "createInternalError"));
  (*((void (**)(id, void, RMStoreDataFetcher *))v17 + 2))(v17, 0LL, v18);
LABEL_21:
}

- (void)_resolveKeychainAsset:(id)a3 unresolvedAsset:(id)a4 isDDM:(BOOL)a5 enrollmentType:(int64_t)a6 completionHandler:(id)a7
{
  BOOL v21 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 assetKey]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 configurationKey]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreAssetResolver keychainController](self, "keychainController"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 key]);
  unsigned __int8 v18 = [v16 hasDataForAssetKey:v17];

  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if ((v18 & 1) != 0)
  {
    if (v20) {
      sub_100064F54();
    }

    -[RMStoreAssetResolver _assignKeychainItemForAsset:unresolvedAsset:assetKey:configurationKey:completionHandler:]( self,  "_assignKeychainItemForAsset:unresolvedAsset:assetKey:configurationKey:completionHandler:",  v11,  v12,  v14,  v15,  v13);
  }

  else
  {
    if (v20) {
      sub_100064F80();
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000629E0;
    v22[3] = &unk_1000BAA70;
    id v27 = v13;
    v22[4] = self;
    id v23 = v11;
    id v24 = v14;
    int64_t v28 = a6;
    id v25 = v12;
    id v26 = v15;
    -[RMStoreAssetResolver _resolveAsset:unresolvedAsset:isDDM:completionHandler:]( self,  "_resolveAsset:unresolvedAsset:isDDM:completionHandler:",  v23,  v25,  v21,  v22);
  }
}

- (BOOL)_storeAssetData:(id)a3 asset:(id)a4 assetKey:(id)a5 enrollmentType:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 declarationType]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAssetCredentialUserNameAndPasswordDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelAssetCredentialUserNameAndPasswordDeclaration,  "registeredIdentifier"));
  unsigned int v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    v126[0] = 0LL;
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelUserNameAndPasswordCredentialDeclaration loadData:serializationType:error:]( &OBJC_CLASS___RMModelUserNameAndPasswordCredentialDeclaration,  "loadData:serializationType:error:",  v12,  1LL,  v126));
    id v19 = v126[0];
    if (v19)
    {
      BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10006500C();
      }

      if (a7)
      {
        BOOL v21 = @"Could not deserialize password credential";
        goto LABEL_7;
      }

      goto LABEL_29;
    }

    id v23 = (id)objc_claimAutoreleasedReturnValue(-[RMStoreAssetResolver keychainController](self, "keychainController"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v18 payloadPassword]);
    v38 = a7;
    id v39 = v12;
    v40 = v14;
    v41 = (void *)objc_claimAutoreleasedReturnValue([v18 payloadUserName]);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v40 key]);
    unsigned __int8 v24 = [v23 storePassword:v37 userName:v41 assetKey:v42 error:v38];

    id v14 = v40;
    id v12 = v39;

    goto LABEL_46;
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v13 declarationType]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAssetCredentialCertificateDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelAssetCredentialCertificateDeclaration,  "registeredIdentifier"));
  unsigned int v27 = [v25 isEqualToString:v26];

  if (!v27)
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v13 declarationType]);
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAssetCredentialIdentityDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelAssetCredentialIdentityDeclaration,  "registeredIdentifier"));
    unsigned int v35 = [v33 isEqualToString:v34];

    if (v35)
    {
      id v125 = 0LL;
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelIdentityCredentialDeclaration loadData:serializationType:error:]( &OBJC_CLASS___RMModelIdentityCredentialDeclaration,  "loadData:serializationType:error:",  v12,  1LL,  &v125));
      id v19 = v125;
      if (v19)
      {
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_1000650EC();
        }

        if (a7)
        {
          BOOL v21 = @"Could not deserialize identity credential";
LABEL_7:
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetInvalidError:]( &OBJC_CLASS___RMErrorUtilities,  "createAssetInvalidError:",  v21));
          id v23 = v22;
          if (v22)
          {
            id v23 = v22;
            unsigned __int8 v24 = 0;
            *a7 = v23;
          }

          else
          {
            unsigned __int8 v24 = 0;
          }

          goto LABEL_46;
        }

- (void)_assignKeychainItemForAsset:(id)a3 unresolvedAsset:(id)a4 assetKey:(id)a5 configurationKey:(id)a6 completionHandler:(id)a7
{
  id v18 = 0LL;
  id v19 = 0LL;
  id v12 = (void (**)(id, id, void))a7;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreAssetResolver _keychainItemForAsset:unresolvedAsset:assetKey:configurationKey:returnUserName:error:]( self,  "_keychainItemForAsset:unresolvedAsset:assetKey:configurationKey:returnUserName:error:",  a3,  a4,  a5,  a6,  &v19,  &v18));
  id v14 = v19;
  id v15 = v18;
  if (v13)
  {
    id v16 = [[RMStoreResolvedAsset alloc] initWithKeychainReference:v13 userName:v14];
    v12[2](v12, v16, 0LL);

    id v12 = (void (**)(id, id, void))v16;
  }

  else
  {
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10006528C();
    }

    ((void (**)(id, id, id))v12)[2](v12, 0LL, v15);
  }
}

- (id)_keychainItemForAsset:(id)a3 unresolvedAsset:(id)a4 assetKey:(id)a5 configurationKey:(id)a6 returnUserName:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 declarationType]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAssetCredentialUserNameAndPasswordDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelAssetCredentialUserNameAndPasswordDeclaration,  "registeredIdentifier"));
  unsigned int v20 = [v18 isEqualToString:v19];

  if (v20)
  {
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreAssetResolver keychainController](self, "keychainController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v16 key]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v17 key]);
    unsigned __int8 v24 = -[RMStoreAssetResolver _getKeychainAccessibilityFromAsset:unresolvedAsset:]( self,  "_getKeychainAccessibilityFromAsset:unresolvedAsset:",  v14,  v15);
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v15 keychainGroup]);
    id v26 = a7;
    id v27 = v14;
    id v28 = v15;
    id v29 = v17;
    id v30 = v16;
    BOOL v31 = (void *)v25;
    unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue( [v21 assignPasswordForAssetKey:v22 toConfigurationKey:v23 access:v24 group:v25 returnUserName:v26 error:a8]);

    uint64_t v33 = v30;
    id v17 = v29;
    id v15 = v28;
    id v14 = v27;

    goto LABEL_11;
  }

  v34 = v16;
  unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v14 declarationType]);
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAssetCredentialCertificateDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelAssetCredentialCertificateDeclaration,  "registeredIdentifier"));
  unsigned int v37 = [v35 isEqualToString:v36];

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreAssetResolver keychainController](self, "keychainController"));
    id v39 = v34;
    v40 = (void *)objc_claimAutoreleasedReturnValue([v34 key]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v17 key]);
    uint64_t v42 = -[RMStoreAssetResolver _getKeychainAccessibilityFromAsset:unresolvedAsset:]( self,  "_getKeychainAccessibilityFromAsset:unresolvedAsset:",  v14,  v15);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v15 keychainGroup]);
    uint64_t v44 = objc_claimAutoreleasedReturnValue( [v38 assignCertificateForAssetKey:v40 toConfigurationKey:v41 access:v42 group:v43 error:a8]);
LABEL_10:
    unsigned __int8 v32 = (void *)v44;

    uint64_t v33 = v39;
    goto LABEL_11;
  }

  id v45 = (void *)objc_claimAutoreleasedReturnValue([v14 declarationType]);
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAssetCredentialIdentityDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelAssetCredentialIdentityDeclaration,  "registeredIdentifier"));
  id v58 = a8;
  unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v14 declarationType]);
  id v48 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAssetCredentialSCEPDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelAssetCredentialSCEPDeclaration,  "registeredIdentifier"));
  if ([v47 isEqualToString:v48])
  {

LABEL_8:
LABEL_9:
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreAssetResolver keychainController](self, "keychainController"));
    id v39 = v34;
    v40 = (void *)objc_claimAutoreleasedReturnValue([v34 key]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v17 key]);
    id v49 = -[RMStoreAssetResolver _getKeychainAccessibilityFromAsset:unresolvedAsset:]( self,  "_getKeychainAccessibilityFromAsset:unresolvedAsset:",  v14,  v15);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v15 keychainGroup]);
    uint64_t v44 = objc_claimAutoreleasedReturnValue([v38 assignIdentityForAssetKey:v40 configurationKey:v41 access:v49 group:v43 error:v58]);
    goto LABEL_10;
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue([v14 declarationType]);
  unsigned int v56 = v47;
  id v52 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAssetCredentialACMEDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelAssetCredentialACMEDeclaration,  "registeredIdentifier"));
  unsigned __int8 v57 = [v51 isEqualToString:v52];

  if ((v57 & 1) != 0) {
    goto LABEL_9;
  }
  uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
    sub_1000652EC(v14, v53);
  }

  uint64_t v33 = v34;
  if (v58)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetInvalidError:]( &OBJC_CLASS___RMErrorUtilities,  "createAssetInvalidError:",  @"Keychain asset type not recognized during assign"));
    id v55 = v54;
    if (v54) {
      *id v58 = v54;
    }
  }

  unsigned __int8 v32 = 0LL;
LABEL_11:

  return v32;
}

- (id)_getAssetReferenceFromAsset:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "payloadReference") & 1) != 0) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadReference]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)_getAssetAuthenticationFromAsset:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "payloadAuthentication") & 1) != 0) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadAuthentication]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (__CFString)_getKeychainAccessibilityFromAsset:(id)a3 unresolvedAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = RMModelAssetCredentialIdentityDeclaration_Accessible_default;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___RMModelAssetCredentialIdentityDeclaration);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0
    || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___RMModelAssetCredentialACMEDeclaration),
        (objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___RMModelAssetCredentialSCEPDeclaration),
        id v11 = v7,
        (objc_opt_isKindOfClass(v5, v10) & 1) != 0))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 payloadAccessible]);
  }

  if ([v11 isEqualToString:v7])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 keychainDefaultAccessibility]);
    if (v12)
    {
      id v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 keychainDefaultAccessibility]);
    }

    else
    {
      id v13 = (__CFString *)kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
    }
  }

  else
  {
    if ([v11 isEqualToString:RMModelAssetCredentialIdentityDeclaration_Accessible_afterFirstUnlock]) {
      id v14 = &kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
    }
    else {
      id v14 = &kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
    }
    id v13 = (__CFString *)*v14;
  }

  return v13;
}

- (id)_dataURLForAsset:(id)a3 reference:(id)a4 queryParameters:(id)a5
{
  id v6 = a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 payloadDataURL]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](&OBJC_CLASS___NSURLComponents, "componentsWithString:", v7));

  if ([v6 count])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100063F08;
    v13[3] = &unk_1000B9FC0;
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
    id v9 = v14;
    [v6 enumerateKeysAndObjectsUsingBlock:v13];
    id v10 = [v9 copy];
    [v8 setQueryItems:v10];
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 URL]);

  return v11;
}

- (void)_processResponseWithAsset:(id)a3 reference:(id)a4 unresolvedAsset:(id)a5 url:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (!v20)
  {
    uint64_t v25 = HTTPResponseKeyBody;
    id v26 = a9;
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v25]);
    unsigned int v47 = v17;
    id v28 = v18;
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v17 downloadURL]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:HTTPResponseKeyStatusCode]);
    id v45 = v19;
    BOOL v31 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:HTTPResponseKeyHeaders]);
    id v48 = (void *)v27;
    id v49 = 0LL;
    uint64_t v44 = v29;
    v46 = (void *)v29;
    id v18 = v28;
    unsigned int v32 = -[RMStoreAssetResolver _validateAsset:reference:url:statusCode:headers:data:downloadURL:error:]( self,  "_validateAsset:reference:url:statusCode:headers:data:downloadURL:error:",  v15,  v16,  v28,  v30,  v31,  v27,  v44,  &v49);
    id v33 = v49;

    if (!v32)
    {
      id v40 = [v33 code];
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
      BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
      if (v40 == (id)1000)
      {
        unsigned int v37 = v48;
        v38 = v46;
        id v20 = 0LL;
        if (v42) {
          sub_1000653EC();
        }
      }

      else
      {
        unsigned int v37 = v48;
        v38 = v46;
        id v20 = 0LL;
        if (v42) {
          sub_100065468();
        }
      }

      id v23 = v33;
      id v24 = 0LL;
      goto LABEL_20;
    }

    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      sub_10006536C(v47, v34);
    }

    id v35 = objc_alloc(&OBJC_CLASS___RMStoreResolvedAsset);
    v36 = v35;
    unsigned int v37 = v48;
    v38 = v46;
    id v20 = 0LL;
    if (v46)
    {
      id v39 = [v35 initWithFile:v46];
    }

    else
    {
      if (!v48)
      {
        v43 = objc_opt_new(&OBJC_CLASS___NSData);
        id v24 = [v36 initWithData:v43];

        unsigned int v37 = 0LL;
        goto LABEL_19;
      }

      id v39 = [v35 initWithData:v48];
    }

    id v24 = v39;
LABEL_19:
    id v23 = 0LL;
LABEL_20:

    id v17 = v47;
    id v19 = v45;
    goto LABEL_21;
  }

  id v21 = a9;
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_1000654E4();
  }

  id v23 = v20;
  id v24 = 0LL;
LABEL_21:
  (*((void (**)(id, id, id))a9 + 2))(a9, v24, v23);
}

- (BOOL)_validateAsset:(id)a3 reference:(id)a4 url:(id)a5 statusCode:(id)a6 headers:(id)a7 data:(id)a8 downloadURL:(id)a9 error:(id *)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_1000655DC(v16, v21);
  }

  id v51 = v20;
  id v52 = v16;
  if (v19)
  {
    id v22 = [v19 length];
  }

  else
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);
    id v53 = 0LL;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 attributesOfItemAtPath:v24 error:&v53]);
    id v26 = v53;

    if (!v25)
    {
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
      v34 = v51;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_100065560();
      }

      id v33 = v52;
      if (a10)
      {
        unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetSizeCannotBeVerifiedError]( &OBJC_CLASS___RMErrorUtilities,  "createAssetSizeCannotBeVerifiedError"));
        id v48 = v47;
        if (v47) {
          *a10 = v47;
        }
      }

      goto LABEL_31;
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:NSFileSize]);
    id v22 = [v27 unsignedIntegerValue];
  }

  uint64_t v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "payloadSize", a10));
  if (!v28
    || (uint64_t v29 = (void *)v28,
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v15 payloadSize]),
        unsigned int v31 = -[RMStoreAssetResolver isPayloadSizeMismatchedWithExpectedSize:actualSize:statusCode:]( self,  "isPayloadSizeMismatchedWithExpectedSize:actualSize:statusCode:",  [v30 unsignedIntegerValue],  v22,  objc_msgSend(v17, "integerValue")),  v30,  v29,  !v31))
  {
    uint64_t v35 = objc_claimAutoreleasedReturnValue([v15 payloadContentType]);
    if (v35)
    {
      v36 = (void *)v35;
      unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue([v15 payloadContentType]);
      unsigned int v38 = -[RMStoreAssetResolver isContentTypeMismatchedWithExpectedType:headers:statusCode:]( self,  "isContentTypeMismatchedWithExpectedType:headers:statusCode:",  v37,  v18,  [v17 integerValue]);

      if (v38)
      {
        id v33 = v52;
        if (!v50)
        {
          BOOL v45 = 0;
          v34 = v51;
          goto LABEL_38;
        }

        id v39 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetContentTypeCannotBeVerifiedError]( &OBJC_CLASS___RMErrorUtilities,  "createAssetContentTypeCannotBeVerifiedError"));
        id v26 = v39;
        if (v39)
        {
          id v26 = v39;
          *id v50 = v26;
        }

        v34 = v51;
        goto LABEL_31;
      }
    }

    uint64_t v40 = objc_claimAutoreleasedReturnValue([v15 payloadHashSHA256]);
    if (v40)
    {
      v41 = (void *)v40;
      BOOL v42 = (void *)objc_claimAutoreleasedReturnValue([v15 payloadHashSHA256]);
      v34 = v51;
      unsigned int v43 = -[RMStoreAssetResolver isHashMismatchedWithExpectedHash:data:downloadURL:dataSize:]( self,  "isHashMismatchedWithExpectedHash:data:downloadURL:dataSize:",  v42,  v19,  v51,  v22);

      if (v43)
      {
        if (v50)
        {
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetHashCannotBeVerifiedError]( &OBJC_CLASS___RMErrorUtilities,  "createAssetHashCannotBeVerifiedError"));
          id v26 = v44;
          if (v44)
          {
            id v26 = v44;
            *id v50 = v26;
          }

          id v33 = v52;
          goto LABEL_31;
        }

        BOOL v45 = 0;
      }

      else
      {
        BOOL v45 = 1;
      }

      id v33 = v52;
      goto LABEL_38;
    }

    BOOL v45 = 1;
LABEL_34:
    v34 = v51;
    id v33 = v52;
    goto LABEL_38;
  }

  if (!v50)
  {
    BOOL v45 = 0;
    goto LABEL_34;
  }

  unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAssetSizeCannotBeVerifiedError]( &OBJC_CLASS___RMErrorUtilities,  "createAssetSizeCannotBeVerifiedError"));
  id v26 = v32;
  v34 = v51;
  id v33 = v52;
  if (v32)
  {
    id v26 = v32;
    *id v50 = v26;
  }

- (BOOL)isPayloadSizeMismatchedWithExpectedSize:(unint64_t)a3 actualSize:(unint64_t)a4 statusCode:(int64_t)a5
{
  if (!a3 && a5 && a5 != 204)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000656D0();
    }
  }

  if (a4 != a3)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006565C();
    }
  }

  return a4 != a3;
}

- (BOOL)isContentTypeMismatchedWithExpectedType:(id)a3 headers:(id)a4 statusCode:(int64_t)a5
{
  if (!a5) {
    return 0;
  }
  id v7 = a3;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:@"Content-Type"]);
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (const __CFString *)v8;
  }
  else {
    id v10 = @"text/html";
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreAssetResolver _getContentType:](self, "_getContentType:", v10));

  unsigned __int8 v12 = [v11 isEqualToString:v7];
  if ((v12 & 1) == 0)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100065734();
    }
  }

  char v14 = v12 ^ 1;

  return v14;
}

- (BOOL)isHashMismatchedWithExpectedHash:(id)a3 data:(id)a4 downloadURL:(id)a5 dataSize:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6)
  {
    if (v11) {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[RMStoreAssetResolver getSHA256StringFromData:](self, "getSHA256StringFromData:", v11));
    }
    else {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[RMStoreAssetResolver getSHA256StringFromURL:](self, "getSHA256StringFromURL:", v12));
    }
    id v15 = (void *)v13;
    id v16 = [v10 caseInsensitiveCompare:v13];
    BOOL v14 = v16 != 0LL;
    if (v16)
    {
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100065794();
      }
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_getContentType:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rangeOfString:@";"];
  if (v5) {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v3 substringToIndex:v4]);
  }
  else {
    id v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (id)getSHA256StringFromData:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 length];
  uint64_t v5 = v4;
  else {
    size_t v6 = (size_t)v4;
  }
  id v7 = malloc(v6);
  CC_SHA256_Init(&c);
  if (v5)
  {
    for (unint64_t i = 0LL; i < (unint64_t)v5; i += v9)
    {
      else {
        size_t v9 = v6;
      }
      objc_msgSend(v3, "getBytes:range:", v7, i, v9);
      CC_SHA256_Update(&c, v7, v9);
    }
  }

  CC_SHA256_Final(md, &c);
  free(v7);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 64LL));
  for (uint64_t j = 0LL; j != 32; ++j)
    objc_msgSend(v10, "appendFormat:", @"%02X", md[j]);
  id v12 = [v10 copy];

  return v12;
}

- (id)getSHA256StringFromURL:(id)a3
{
  id v3 = a3;
  CC_SHA256_Init(&c);
  id v12 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingFromURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingFromURL:error:",  v3,  &v12));
  id v5 = v12;
  if (v4)
  {
    while (1)
    {
      size_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 readDataOfLength:0x10000]);
      if (![v6 length]) {
        break;
      }
      id v7 = v6;
      CC_SHA256_Update(&c, [v7 bytes], (CC_LONG)objc_msgSend(v7, "length"));
    }

    CC_SHA256_Final(md, &c);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 64LL));
    for (uint64_t i = 0LL; i != 32; ++i)
      objc_msgSend(v8, "appendFormat:", @"%02X", md[i]);
    id v10 = (__CFString *)[v8 copy];
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[RMLog storeAssetResolver](&OBJC_CLASS___RMLog, "storeAssetResolver"));
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_100065808((uint64_t)v3, (uint64_t)v5, (os_log_s *)v8);
    }
    id v10 = &stru_1000BB450;
  }

  return v10;
}

- (RMManagedKeychainController)keychainController
{
  return self->_keychainController;
}

- (void)setKeychainController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end