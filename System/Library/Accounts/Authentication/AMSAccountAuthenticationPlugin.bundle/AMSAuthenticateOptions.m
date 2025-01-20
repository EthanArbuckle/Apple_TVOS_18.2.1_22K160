@interface AMSAuthenticateOptions
- (ACAccountStore)ams_accountStore;
- (AMSAuthenticateOptions)initWithLegacyOptionsDictionary:(id)a3;
@end

@implementation AMSAuthenticateOptions

- (ACAccountStore)ams_accountStore
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSAuthenticateOptions clientInfo](self, "clientInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountMediaType]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  v3));

  return (ACAccountStore *)v4;
}

- (AMSAuthenticateOptions)initWithLegacyOptionsDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[AMSAuthenticateOptions initWithOptionsDictionary:](self, "initWithOptionsDictionary:", v4);
  if (!v5) {
    goto LABEL_88;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitPreventSecondaryAccountPETLookup"]);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitPreventSecondaryAccountPETLookup"]);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
      id v9 = v7;
    }
    else {
      id v9 = 0LL;
    }

    -[AMSAuthenticateOptions setAllowSecondaryCredentialSource:]( v5,  "setAllowSecondaryCredentialSource:",  [v9 BOOLValue] ^ 1);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSVerifyCredentialsAccountScope"]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSVerifyCredentialsAccountScope"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v13 = (objc_opt_isKindOfClass(v11, v12) & 1) != 0 ? v11 : 0LL;

    v14 = (char *)[v13 integerValue];
    if (v14 == (_BYTE *)&dword_0 + 1)
    {
      uint64_t v15 = AMSAccountMediaTypeAppStoreSandbox;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AMSAuthenticateOptions clientInfo](v5, "clientInfo"));
      [v16 setAccountMediaType:v15];
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitSuppressServerDialogs"]);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitSuppressServerDialogs"]);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
      id v20 = v18;
    }
    else {
      id v20 = 0LL;
    }

    -[AMSAuthenticateOptions setAllowServerDialogs:]( v5,  "setAllowServerDialogs:",  [v20 BOOLValue] ^ 1);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitAllowPasswordReuse"]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitAllowSilentAuth"]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitPreventPrompt"]);
  if (([v21 BOOLValue] & 1) != 0 || objc_msgSend(v22, "BOOLValue"))
  {
    uint64_t v24 = [v23 BOOLValue];
  }

  else
  {
    uint64_t v24 = 1LL;
  }

  -[AMSAuthenticateOptions setAuthenticationType:](v5, "setAuthenticationType:", v24);
LABEL_22:
  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitCanSetActiveAccountKey"]);

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitCanSetActiveAccountKey"]);
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0) {
      id v28 = v26;
    }
    else {
      id v28 = 0LL;
    }

    -[AMSAuthenticateOptions setCanMakeAccountActive:](v5, "setCanMakeAccountActive:", [v28 BOOLValue]);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitCreateAccountQueryParamsKey"]);

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitCreateAccountQueryParamsKey"]);
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0) {
      id v32 = v30;
    }
    else {
      id v32 = 0LL;
    }

    -[AMSAuthenticateOptions setCreateAccountQueryParams:](v5, "setCreateAccountQueryParams:", v32);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitOKButtonLabel"]);

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitOKButtonLabel"]);
    uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0) {
      id v36 = v34;
    }
    else {
      id v36 = 0LL;
    }

    -[AMSAuthenticateOptions setDefaultButtonString:](v5, "setDefaultButtonString:", v36);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"]);

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"]);
    uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0) {
      id v40 = v38;
    }
    else {
      id v40 = 0LL;
    }

    if (v40)
    {
      -[AMSAuthenticateOptions setLogKey:](v5, "setLogKey:", v40);
    }

    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[AMSAuthenticateOptions logKey](v5, "logKey"));
      -[AMSAuthenticateOptions setLogKey:](v5, "setLogKey:", v41);
    }
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitHTTPHeadersKey"]);

  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitHTTPHeadersKey"]);
    uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v43, v44) & 1) != 0) {
      id v45 = v43;
    }
    else {
      id v45 = 0LL;
    }

    -[AMSAuthenticateOptions setHTTPHeaders:](v5, "setHTTPHeaders:", v45);
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitPromptTitle"]);

  if (v46)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitPromptTitle"]);
    uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v47, v48) & 1) != 0) {
      id v49 = v47;
    }
    else {
      id v49 = 0LL;
    }

    -[AMSAuthenticateOptions setPromptTitle:](v5, "setPromptTitle:", v49);
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitProxiedAppBundleIDKey"]);

  if (v50)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitProxiedAppBundleIDKey"]);
    uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v51, v52) & 1) != 0) {
      id v53 = v51;
    }
    else {
      id v53 = 0LL;
    }

    -[AMSAuthenticateOptions setProxyAppBundleID:](v5, "setProxyAppBundleID:", v53);
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitProxiedAppNameKey"]);

  if (v54)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitProxiedAppNameKey"]);
    uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v55, v56) & 1) != 0) {
      id v57 = v55;
    }
    else {
      id v57 = 0LL;
    }

    -[AMSAuthenticateOptions setProxyAppName:](v5, "setProxyAppName:", v57);
  }

  v58 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitReasonKey"]);

  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitReasonKey"]);
    uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v59, v60) & 1) != 0) {
      id v61 = v59;
    }
    else {
      id v61 = 0LL;
    }

    -[AMSAuthenticateOptions setReason:](v5, "setReason:", v61);
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitUserAgentKey"]);

  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitUserAgentKey"]);
    uint64_t v64 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v63, v64) & 1) != 0) {
      id v65 = v63;
    }
    else {
      id v65 = 0LL;
    }

    -[AMSAuthenticateOptions setUserAgent:](v5, "setUserAgent:", v65);
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitUserAgentSuffixesKey"]);

  if (v66)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreAuthKitUserAgentSuffixesKey"]);
    uint64_t v68 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v67, v68) & 1) != 0) {
      id v69 = v67;
    }
    else {
      id v69 = 0LL;
    }

    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "ams_nonEmptyComponentsJoinedByString:", @" "));
    -[AMSAuthenticateOptions setUserAgentSuffix:](v5, "setUserAgentSuffix:", v70);
  }

  v71 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreIgnoreAccountConversionKey"]);

  if (v71)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreIgnoreAccountConversionKey"]);
    if ((objc_opt_respondsToSelector(v72, "BOOLValue") & 1) != 0)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SSAccountStoreIgnoreAccountConversionKey"]);
      -[AMSAuthenticateOptions setIgnoreAccountConversion:]( v5,  "setIgnoreAccountConversion:",  [v73 BOOLValue]);
    }

    else
    {
      -[AMSAuthenticateOptions setIgnoreAccountConversion:](v5, "setIgnoreAccountConversion:", 0LL);
    }
  }

LABEL_88:
  return v5;
}

@end