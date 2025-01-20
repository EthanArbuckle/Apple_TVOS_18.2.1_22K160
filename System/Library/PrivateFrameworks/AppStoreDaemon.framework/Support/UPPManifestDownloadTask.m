@interface UPPManifestDownloadTask
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation UPPManifestDownloadTask

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  v9 = (void (**)(id, void, void *))a6;
  uint64_t v10 = ASDLogHandleForCategory(41LL);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v12, 90LL, 1);
    }
    else {
      id Property = 0LL;
    }
    *(_DWORD *)buf = 138412290;
    id v42 = Property;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%@] Received authentication challenge",  buf,  0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 protectionSpace]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 authenticationMethod]);
  if ([v15 isEqualToString:NSURLAuthenticationMethodClientCertificate])
  {
    uint64_t v16 = ASDLogHandleForCategory(41LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v19 = objc_getProperty(self, v18, 90LL, 1);
      }
      else {
        id v19 = 0LL;
      }
      *(_DWORD *)buf = 138412290;
      id v42 = v19;
      v20 = "[%@] Using client certificate for authentication challenge";
      goto LABEL_19;
    }

    goto LABEL_20;
  }

  if ([v15 isEqualToString:NSURLAuthenticationMethodServerTrust])
  {
    uint64_t v21 = ASDLogHandleForCategory(41LL);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v24 = objc_getProperty(self, v23, 90LL, 1);
      }
      else {
        id v24 = 0LL;
      }
      *(_DWORD *)buf = 138412290;
      id v42 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[%@] Using server trust for authentication challenge",  buf,  0xCu);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialForTrust:]( NSURLCredential,  "credentialForTrust:",  [v14 serverTrust]));
    v9[2](v9, 0LL, v25);
  }

  else
  {
    int v26 = BYTE2(self->_manifestURL);
    uint64_t v27 = ASDLogHandleForCategory(41LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    BOOL v28 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        id v30 = objc_getProperty(self, v29, 90LL, 1);
        *(_DWORD *)buf = 138412290;
        id v42 = v30;
        v20 = "[%@] Using default handling for authentication challenge";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
      }

- (void)mainWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = *(NSError **)((char *)&self->super.super._error + 2);
  if (!v5)
  {
    uint64_t v8 = ASDLogHandleForCategory(41LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id Property = objc_getProperty(self, v10, 90LL, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_clientID + 2) processInfo]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
      *(_DWORD *)v63 = 138412546;
      *(void *)&v63[4] = Property;
      *(_WORD *)&v63[12] = 2114;
      *(void *)&v63[14] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@] No URL provided for request from client: %{public}@",  v63,  0x16u);
    }

    uint64_t v14 = ASDErrorDomain;
    v15 = @"Invalid Manifest URL";
    uint64_t v16 = @"No URL provided for request from client";
    goto LABEL_16;
  }

  id v6 = v5;
  BOOL v7 = sub_1002FA674((uint64_t)&OBJC_CLASS___AppDefaultsManager);
  if (!os_variant_has_internal_content("com.apple.appstored") || !v7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 scheme]);
    id v18 = [v17 caseInsensitiveCompare:@"https"];

    uint64_t v19 = objc_claimAutoreleasedReturnValue([v6 port]);
    v20 = (void *)v19;
    uint64_t v21 = &off_10040C1D8;
    if (!v18) {
      uint64_t v21 = &off_10040C1C0;
    }
    if (v19) {
      uint64_t v21 = (_UNKNOWN **)v19;
    }
    v22 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 host]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NWHostEndpoint endpointWithHostname:port:]( &OBJC_CLASS___NWHostEndpoint,  "endpointWithHostname:port:",  v23,  v24));
    int v26 = -[NWPathEvaluator initWithEndpoint:parameters:]( objc_alloc(&OBJC_CLASS___NWPathEvaluator),  "initWithEndpoint:parameters:",  v25,  0LL);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NWPathEvaluator path](v26, "path"));
    LODWORD(v24) = [v27 isLocal];

    if (!(_DWORD)v24) {
      goto LABEL_17;
    }
    uint64_t v28 = ASDLogHandleForCategory(41LL);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v61 = objc_getProperty(self, v30, 90LL, 1);
      uint64_t v62 = *(uint64_t *)((char *)&self->super.super._error + 2);
      *(_DWORD *)v63 = 138412546;
      *(void *)&v63[4] = v61;
      *(_WORD *)&v63[12] = 2114;
      *(void *)&v63[14] = v62;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "[%@] The manifest URL isn't external: %{public}@",  v63,  0x16u);
    }

    uint64_t v14 = ASDErrorDomain;
    v15 = @"Invalid manifest URL";
    uint64_t v16 = @"The manifest URL isn't external";
LABEL_16:
    uint64_t v31 = 850LL;
    goto LABEL_26;
  }

LABEL_17:
  id v32 = *(id *)((char *)&self->super.super._error + 2);
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 scheme]);
  id v34 = [v33 caseInsensitiveCompare:@"https"];

  if (!v34)
  {

    goto LABEL_28;
  }

  if ((os_variant_has_internal_content("com.apple.appstored") & 1) != 0)
  {
    BOOL v35 = sub_1002FA6A8((uint64_t)&OBJC_CLASS___AppDefaultsManager);

    if (v35) {
      goto LABEL_28;
    }
  }

  else
  {
  }

  uint64_t v36 = ASDLogHandleForCategory(41LL);
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    id v59 = objc_getProperty(self, v38, 90LL, 1);
    uint64_t v60 = *(uint64_t *)((char *)&self->super.super._error + 2);
    *(_DWORD *)v63 = 138412546;
    *(void *)&v63[4] = v59;
    *(_WORD *)&v63[12] = 2114;
    *(void *)&v63[14] = v60;
    _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "[%@] Cannot load non-https manifest URL: %{public}@",  v63,  0x16u);
  }

  uint64_t v14 = ASDErrorDomain;
  v15 = @"Invalid manifest URL";
  uint64_t v16 = @"Cannot load non-https manifest URL";
  uint64_t v31 = 852LL;
LABEL_26:
  uint64_t v39 = ASDErrorWithTitleAndMessage(v14, v31, v15, v16);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  if (v40)
  {
    sub_1001C0AF8((uint64_t)self, v40);
    v4[2](v4, v40);

    goto LABEL_34;
  }

- (void).cxx_destruct
{
}

@end