@interface SaveInstallAttributionParamsOperation
- (SaveInstallAttributionParamsOperation)initWithRequest:(id)a3;
- (void)run;
@end

@implementation SaveInstallAttributionParamsOperation

- (SaveInstallAttributionParamsOperation)initWithRequest:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___SaveInstallAttributionParamsOperation;
  v5 = -[SaveInstallAttributionParamsOperation init](&v27, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___InstallAttributionParams);
    params = v5->_params;
    v5->_params = v6;

    v8 = v5->_params;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 appAdamId]);
    -[InstallAttributionParams setAppAdamId:](v8, "setAppAdamId:", v9);

    v10 = v5->_params;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 adNetworkId]);
    -[InstallAttributionParams setAdNetworkId:](v10, "setAdNetworkId:", v11);

    v12 = v5->_params;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 campaignId]);
    -[InstallAttributionParams setCampaignId:](v12, "setCampaignId:", v13);

    v14 = v5->_params;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 impressionId]);
    -[InstallAttributionParams setImpressionId:](v14, "setImpressionId:", v15);

    v16 = v5->_params;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 timestamp]);
    -[InstallAttributionParams setTimestamp:](v16, "setTimestamp:", v17);

    v18 = v5->_params;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 attributionSignature]);
    -[InstallAttributionParams setAttributionSignature:](v18, "setAttributionSignature:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v20 timeIntervalSince1970];
    uint64_t v22 = (uint64_t)(v21 * 1000.0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v22));
    -[InstallAttributionParams setLocalTimestamp:](v5->_params, "setLocalTimestamp:", v23);
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 originatingBundleId]);
    originatingBundleId = v5->_originatingBundleId;
    v5->_originatingBundleId = (NSString *)v24;

    v5->_overrideCampaignLimit = [v4 overrideCampaignLimit];
  }

  return v5;
}

- (void)run
{
  if (!self->_originatingBundleId) {
    goto LABEL_70;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleURL]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Info.plist"]);

  v7 = &ACSLocateCachingServer_ptr;
  v8 = -[NSDictionary initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithContentsOfFile:", v6);
  v9 = v8;
  if (!v8)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v42) {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v43 = [v42 shouldLog];
    else {
      LODWORD(v44) = v43;
    }
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 OSLogObject]);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      uint64_t v44 = v44;
    }
    else {
      v44 &= 2u;
    }
    if ((_DWORD)v44)
    {
      v46 = (void *)objc_opt_class(self);
      originatingBundleId = self->_originatingBundleId;
      int v85 = 138543618;
      v86 = v46;
      __int16 v87 = 2112;
      v88 = originatingBundleId;
      id v48 = v46;
      v49 = (void *)_os_log_send_and_compose_impl( v44,  0LL,  0LL,  0LL,  &_mh_execute_header,  v45,  16LL,  "[%{public}@]: Did not find Info.plist for app: %@",  &v85,  22);

      if (!v49)
      {
LABEL_50:

        -[SaveInstallAttributionParamsOperation setSuccess:](self, "setSuccess:", 0LL);
        uint64_t v50 = SSError(SSErrorDomain, 118LL, @"Could not find Info.plist", 0LL);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v50);
        -[SaveInstallAttributionParamsOperation setError:](self, "setError:", v10);
        int v63 = 1;
        goto LABEL_69;
      }

      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v49,  4LL));
      free(v49);
      SSFileLog(v42, @"%@");
    }

    goto LABEL_50;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", @"SKAdNetworkItems"));
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v51) {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v52 = [v51 shouldLog];
    else {
      LODWORD(v53) = v52;
    }
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v51 OSLogObject]);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      uint64_t v53 = v53;
    }
    else {
      v53 &= 2u;
    }
    if ((_DWORD)v53)
    {
      v55 = (void *)objc_opt_class(self);
      v56 = self->_originatingBundleId;
      int v85 = 138543618;
      v86 = v55;
      __int16 v87 = 2112;
      v88 = v56;
      id v57 = v55;
      v58 = (void *)_os_log_send_and_compose_impl( v53,  0LL,  0LL,  0LL,  &_mh_execute_header,  v54,  16LL,  "[%{public}@]: Did not find Info.plist for app: %@",  &v85,  22);

      if (!v58)
      {
LABEL_63:

        -[SaveInstallAttributionParamsOperation setSuccess:](self, "setSuccess:", 0LL);
        uint64_t v59 = SSErrorDomain;
        v60 = @"Could not find Ad Network data in Info.plist";
        uint64_t v61 = 118LL;
        v62 = 0LL;
        goto LABEL_67;
      }

      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v58,  4LL));
      free(v58);
      SSFileLog(v51, @"%@");
    }

    goto LABEL_63;
  }

  v76 = v9;
  v77 = v6;
  v78 = v3;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  v75 = v10;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v81 objects:v91 count:16];
  if (!v13) {
    goto LABEL_27;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v82;
  do
  {
    for (i = 0LL; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v82 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)i);
      uint64_t v18 = objc_opt_class(v7[360]);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
      {
        uint64_t v22 = v7;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v23) {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v24 = objc_msgSend(v23, "shouldLog", v73);
        else {
          unsigned int v25 = v24;
        }
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          uint64_t v27 = v25;
        }
        else {
          uint64_t v27 = v25 & 2;
        }
        if ((_DWORD)v27)
        {
          v28 = (void *)objc_opt_class(self);
          v29 = self->_originatingBundleId;
          int v85 = 138543618;
          v86 = v28;
          __int16 v87 = 2112;
          v88 = v29;
          id v30 = v28;
          LODWORD(v74) = 22;
          v31 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  16LL,  "[%{public}@]: Found non-dictionary SKAdNetworkItem in Info.plist for app: %@",  &v85,  v74);

          if (v31)
          {
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
            free(v31);
            v73 = v26;
            SSFileLog(v23, @"%@");
            goto LABEL_23;
          }
        }

        else
        {
LABEL_23:
        }

        v7 = v22;
        continue;
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"SKAdNetworkIdentifier"]);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[InstallAttributionParams adNetworkId](self->_params, "adNetworkId"));
      unsigned __int8 v21 = [v19 isEqualToString:v20];

      if ((v21 & 1) != 0)
      {
        int v63 = 0;
        v6 = v77;
        v3 = v78;
        v10 = v75;
        v9 = v76;
        goto LABEL_68;
      }
    }

    id v14 = [v12 countByEnumeratingWithState:&v81 objects:v91 count:16];
  }

  while (v14);
LABEL_27:

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v32) {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v33 = objc_msgSend(v32, "shouldLog", v73);
  else {
    LODWORD(v34) = v33;
  }
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 OSLogObject]);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    uint64_t v34 = v34;
  }
  else {
    v34 &= 2u;
  }
  if ((_DWORD)v34)
  {
    v36 = (void *)objc_opt_class(self);
    v37 = self->_originatingBundleId;
    params = self->_params;
    id v39 = v36;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[InstallAttributionParams adNetworkId](params, "adNetworkId"));
    int v85 = 138543874;
    v86 = v36;
    __int16 v87 = 2112;
    v88 = v37;
    __int16 v89 = 2112;
    v90 = v40;
    LODWORD(v74) = 32;
    v41 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  16LL,  "[%{public}@]: App: %@ did not have ad network: %@ in Info.plist",  &v85,  v74);

    v6 = v77;
    v3 = v78;
    v10 = v75;
    v9 = v76;
    if (v41)
    {
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v41,  4LL));
      free(v41);
      SSFileLog(v32, @"%@");
      goto LABEL_65;
    }
  }

  else
  {
    v6 = v77;
    v3 = v78;
    v10 = v75;
    v9 = v76;
LABEL_65:
  }

  -[SaveInstallAttributionParamsOperation setSuccess:](self, "setSuccess:", 0LL);
  uint64_t v59 = SSErrorDomain;
  v60 = @"Ad network not allowed";
  v62 = @"The ad network specified was not found in the app's list of allowed networks";
  uint64_t v61 = 137LL;
LABEL_67:
  uint64_t v64 = SSError(v59, v61, v60, v62);
  id v12 = (id)objc_claimAutoreleasedReturnValue(v64);
  -[SaveInstallAttributionParamsOperation setError:](self, "setError:", v12);
  int v63 = 1;
LABEL_68:

LABEL_69:
  if (!v63)
  {
LABEL_70:
    dispatch_semaphore_t v65 = dispatch_semaphore_create(0LL);
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[PurchaseActionsManager sharedInstance](&OBJC_CLASS___PurchaseActionsManager, "sharedInstance"));
    v67 = self->_params;
    BOOL overrideCampaignLimit = self->_overrideCampaignLimit;
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472LL;
    v79[2] = sub_1001467D4;
    v79[3] = &unk_10034F678;
    v79[4] = self;
    v69 = v65;
    v80 = v69;
    [v66 insertInstallAttributionParams:v67 overrideCampaignLimit:overrideCampaignLimit completionHandler:v79];

    dispatch_time_t v70 = dispatch_time(0LL, 30000000000LL);
    if (dispatch_semaphore_wait(v69, v70))
    {
      -[SaveInstallAttributionParamsOperation setSuccess:](self, "setSuccess:", 0LL);
      uint64_t v71 = SSError(SSErrorDomain, 149LL, @"Timed out waiting for database", 0LL);
      v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
      -[SaveInstallAttributionParamsOperation setError:](self, "setError:", v72);
    }
  }

- (void).cxx_destruct
{
}

@end