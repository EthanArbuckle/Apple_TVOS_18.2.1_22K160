@interface InstallSoftwareDownloadOperation
- (BOOL)_downloadSecondaryAssets:(id *)a3;
- (id)_newSoftwarePropertiesWithDownload:(id)a3;
- (void)_monitorForTerminationOfBundleID:(id)a3;
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)run;
@end

@implementation InstallSoftwareDownloadOperation

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  v125 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaAsset]);
  v4 = objc_alloc_init(&OBJC_CLASS___FinishDownloadResponse);
  -[FinishDownloadResponse setDownloadIdentifier:](v4, "setDownloadIdentifier:", [v3 databaseID]);
  -[FinishDownloadResponse setMediaAssetIdentifier:](v4, "setMediaAssetIdentifier:", [v125 databaseID]);
  -[FinishDownloadResponse setResult:](v4, "setResult:", 4LL);
  id v5 = [v3 automaticType];
  v126 = (ApplicationHandle *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  v6 = (ApplicationHandle *)[v3 databaseID];
  id v7 = [v3 transactionID];
  v124 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]( objc_alloc(&OBJC_CLASS___DownloadHandle),  "initWithTransactionIdentifier:downloadIdentifier:",  v7,  v6);
  -[FinishDownloadResponse setDownloadHandle:](v4, "setDownloadHandle:");
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
  if ([v127 isMultiUser])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v9) = [v8 shouldLog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v137 = 138412802;
      v138 = (ApplicationHandle *)objc_opt_class(self);
      __int16 v139 = 2048;
      v140 = v6;
      __int16 v141 = 2112;
      v142 = v126;
      v11 = v138;
      v12 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Requesting termination of sync bubble for download: %lld bundleID: %@",  &v137,  32);

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
        free(v12);
        v112 = v13;
        SSFileLog(v8, @"%@");
      }
    }

    else
    {
    }

    dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
    v133[0] = _NSConcreteStackBlock;
    v133[1] = 3221225472LL;
    v133[2] = sub_10017E91C;
    v133[3] = &unk_10034ECE0;
    v133[4] = self;
    v136 = v6;
    v134 = v126;
    dispatch_semaphore_t v135 = v14;
    v15 = v14;
    [v127 waitForSyncBubbleToTerminateWithCompletionBlock:v133];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }

  objc_msgSend(v127, "cancelPlaceholderInstallationForDownloadIdentifier:", v6, v112);
  id v132 = 0LL;
  unsigned __int8 v16 = -[InstallSoftwareDownloadOperation _downloadSecondaryAssets:](self, "_downloadSecondaryAssets:", &v132);
  id v17 = v132;
  if ((v16 & 1) == 0)
  {
    -[FinishDownloadResponse setError:](v4, "setError:", v17);
    -[FinishDownloadResponse setResult:](v4, "setResult:", 0LL);
    goto LABEL_153;
  }

  char v131 = 0;
  v18 = (const void *)SBSApplicationTerminationAssertionCreateWithError(0LL, v126, 0LL, &v131);
  if (v131 == 1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v19) {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v20 = [v19 shouldLog];
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v20;
    }
    else {
      uint64_t v22 = v20 & 2;
    }
    if ((_DWORD)v22)
    {
      v23 = (ApplicationHandle *)objc_opt_class(self);
      int v137 = 138412802;
      v138 = v23;
      __int16 v139 = 2048;
      v140 = v6;
      __int16 v141 = 2112;
      v142 = v126;
      v24 = v18;
      v25 = v23;
      LODWORD(v115) = 32;
      v26 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%@: Application termination denied: %lld / %@",  &v137,  v115);

      v18 = v24;
      if (!v26)
      {
LABEL_27:

        uint64_t v27 = SSError(SSErrorDomain, 115LL, 0LL, 0LL);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        -[FinishDownloadResponse setError:](v4, "setError:", v28);

        -[FinishDownloadResponse setResult:](v4, "setResult:", 0LL);
        -[InstallSoftwareDownloadOperation _monitorForTerminationOfBundleID:]( self,  "_monitorForTerminationOfBundleID:",  v126);
        goto LABEL_151;
      }

      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
      free(v26);
      v113 = v21;
      SSFileLog(v19, @"%@");
    }

    goto LABEL_27;
  }

  if (v131 == 2 && v5 == (id)2)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v29) {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v30 = [v29 shouldLog];
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v32 = v30;
    }
    else {
      uint64_t v32 = v30 & 2;
    }
    if ((_DWORD)v32)
    {
      v33 = (ApplicationHandle *)objc_opt_class(self);
      int v137 = 138412802;
      v138 = v33;
      __int16 v139 = 2048;
      v140 = v6;
      __int16 v141 = 2112;
      v142 = v126;
      v34 = v18;
      v35 = v33;
      LODWORD(v115) = 32;
      v36 = (void *)_os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "%@: Could not find app for automatic update: %lld / %@",  &v137,  v115);

      v18 = v34;
      if (!v36)
      {
LABEL_42:

        -[FinishDownloadResponse setResult:](v4, "setResult:", 3LL);
        goto LABEL_151;
      }

      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v36,  4LL));
      free(v36);
      v113 = v31;
      SSFileLog(v29, @"%@");
    }

    goto LABEL_42;
  }

  id v123 = -[InstallSoftwareDownloadOperation _newSoftwarePropertiesWithDownload:]( self,  "_newSoftwarePropertiesWithDownload:",  v3);
  unsigned int v117 = [v3 isStoreDownload];
  if ((([v3 isTvTemplate] | v117 ^ 1) & 1) != 0
    || (v37 = (void *)objc_claimAutoreleasedReturnValue([v123 sinfData]),
        BOOL v38 = [v37 length] == 0,
        v37,
        !v38))
  {
    v116 = v18;
    if (v5 != (id)2) {
      goto LABEL_59;
    }
    v121 = -[ApplicationHandle initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:]( objc_alloc(&OBJC_CLASS___ApplicationHandle),  "initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:",  v7,  v6,  v126);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v39) {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v40 = [v39 shouldLog];
    else {
      unsigned int v41 = v40;
    }
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 OSLogObject]);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
      uint64_t v43 = v41;
    }
    else {
      uint64_t v43 = v41 & 2;
    }
    if ((_DWORD)v43)
    {
      v44 = (ApplicationHandle *)objc_opt_class(self);
      int v137 = 138412546;
      v138 = v44;
      __int16 v139 = 2112;
      v140 = v121;
      v45 = v44;
      LODWORD(v115) = 22;
      v46 = (void *)_os_log_send_and_compose_impl( v43,  0LL,  0LL,  0LL,  &_mh_execute_header,  v42,  1LL,  "%@: Installing placeholder for auto-update: %@",  &v137,  v115);

      v18 = v116;
      if (!v46)
      {
LABEL_58:

        [v127 installPlaceholderForApplicationHandle:v121];
LABEL_59:
        v129[0] = _NSConcreteStackBlock;
        v129[1] = 3221225472LL;
        v129[2] = sub_10017EAC0;
        v129[3] = &unk_10034AC30;
        dsema = dispatch_semaphore_create(0LL);
        v130 = dsema;
        [v127 waitForInstallOfDownloadIdentifier:v6 completionBlock:v129];
        dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
        [v127 beginExternalInstallationForDownloadIdentifier:v6];
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v47) {
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v48 = objc_msgSend(v47, "shouldLog", v113);
        unsigned int v49 = [v47 shouldLogToDisk];
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v47 OSLogObject]);
        v51 = v50;
        if (v49) {
          v48 |= 2u;
        }
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO)) {
          uint64_t v52 = v48;
        }
        else {
          uint64_t v52 = v48 & 2;
        }
        if ((_DWORD)v52)
        {
          v53 = (ApplicationHandle *)objc_opt_class(self);
          int v137 = 138412802;
          v138 = v53;
          __int16 v139 = 2048;
          v140 = v6;
          __int16 v141 = 2112;
          v142 = v126;
          v54 = v53;
          LODWORD(v115) = 32;
          v55 = (void *)_os_log_send_and_compose_impl( v52,  0LL,  0LL,  0LL,  &_mh_execute_header,  v51,  1LL,  "%@: Installing download: %lld / %@",  &v137,  v115);

          v18 = v116;
          if (!v55) {
            goto LABEL_70;
          }
          v51 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v55,  4LL));
          free(v55);
          v113 = v51;
          SSFileLog(v47, @"%@");
        }

LABEL_70:
        v56 = -[InstallSoftwareOperation initWithSoftwareProperties:]( objc_alloc(&OBJC_CLASS___InstallSoftwareOperation),  "initWithSoftwareProperties:",  v123);
        -[InstallSoftwareOperation setDelegate:](v56, "setDelegate:", self);
        id v128 = v17;
        unsigned int v122 = -[InstallSoftwareDownloadOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v56,  &v128);
        id v120 = v128;

        -[InstallSoftwareOperation setDelegate:](v56, "setDelegate:", 0LL);
        [v127 endExternalInstallationForDownloadIdentifier:v6];
        unsigned int v57 = v122;
        if (!v126) {
          unsigned int v57 = 0;
        }
        if (v57 != 1)
        {
LABEL_104:
          if ((v122 & 1) != 0)
          {
LABEL_149:

            id v17 = v120;
            goto LABEL_150;
          }

          v86 = (void *)objc_claimAutoreleasedReturnValue([v120 userInfo]);
          v87 = (void *)objc_claimAutoreleasedReturnValue([v86 objectForKey:@"Error"]);

          v88 = (void *)objc_claimAutoreleasedReturnValue([v125 assetType]);
          unsigned int v89 = [v88 isEqualToString:SSDownloadAssetTypeDeltaPackage];

          if (v89
            && (([v87 isEqualToString:@"PackagePatchFailed"] & 1) != 0
             || [v87 isEqualToString:@"ApplicationVerificationFailed"]))
          {
            -[FinishDownloadResponse setAssetBlockedReason:](v4, "setAssetBlockedReason:", 1LL, v113);
            uint64_t v90 = 1LL;
LABEL_148:
            -[FinishDownloadResponse setResult:](v4, "setResult:", v90, v114);
            -[FinishDownloadResponse setError:](v4, "setError:", v120);

            goto LABEL_149;
          }

          if (objc_msgSend(v87, "isEqualToString:", @"AppBlacklisted", v113))
          {
            v91 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
            if (!v91) {
              v91 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            LODWORD(v92) = [v91 shouldLog];
            v93 = (os_log_s *)objc_claimAutoreleasedReturnValue([v91 OSLogObject]);
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v92 = v92;
            }
            else {
              v92 &= 2u;
            }
            if ((_DWORD)v92)
            {
              v94 = (ApplicationHandle *)objc_opt_class(self);
              int v137 = 138412546;
              v138 = v94;
              __int16 v139 = 2112;
              v140 = v126;
              v95 = v94;
              LODWORD(v115) = 22;
              v96 = (void *)_os_log_send_and_compose_impl( v92,  0LL,  0LL,  0LL,  &_mh_execute_header,  v93,  0LL,  "%@: Fail permanently for blacklisted app: %@",  &v137,  v115);

              if (!v96)
              {
LABEL_121:

                uint64_t v90 = 3LL;
                goto LABEL_148;
              }

              v93 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v96,  4LL));
              free(v96);
              v114 = v93;
              SSFileLog(v91, @"%@");
            }

            goto LABEL_121;
          }

          if (![v87 isEqualToString:@"BundleiTunesMetadataVersionMismatch"])
          {
            uint64_t v90 = 0LL;
            goto LABEL_148;
          }

          v107 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v107) {
            v107 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v108 = [v107 shouldLog];
          v109 = (os_log_s *)objc_claimAutoreleasedReturnValue([v107 OSLogObject]);
          if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
            uint64_t v110 = v108;
          }
          else {
            uint64_t v110 = v108 & 2;
          }
          if ((_DWORD)v110)
          {
            int v137 = 134217984;
            v138 = v6;
            v111 = (void *)_os_log_send_and_compose_impl( v110,  0LL,  0LL,  0LL,  &_mh_execute_header,  v109,  16LL,  "[ApplicationWorkspace]: Fail permanently for bundle version mismatch: %lld",  &v137);

            if (!v111)
            {
LABEL_146:

              uint64_t v90 = 6LL;
              goto LABEL_148;
            }

            v109 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v111,  4LL));
            free(v111);
            v114 = v109;
            SSFileLog(v107, @"%@");
          }

          goto LABEL_146;
        }

        if (!v117
          || (v58 = (void *)objc_claimAutoreleasedReturnValue([v123 appReceiptData]),
              BOOL v59 = [v58 length] == 0,
              v58,
              !v59))
        {
LABEL_90:
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v113));
          if (!v72) {
            v72 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v73 = [v72 shouldLog];
          v74 = (os_log_s *)objc_claimAutoreleasedReturnValue([v72 OSLogObject]);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO)) {
            uint64_t v75 = v73;
          }
          else {
            uint64_t v75 = v73 & 2;
          }
          if ((_DWORD)v75)
          {
            v76 = (ApplicationHandle *)objc_opt_class(self);
            int v137 = 138412546;
            v138 = v76;
            __int16 v139 = 2112;
            v140 = v126;
            v77 = v18;
            v78 = v76;
            LODWORD(v115) = 22;
            v79 = (void *)_os_log_send_and_compose_impl( v75,  0LL,  0LL,  0LL,  &_mh_execute_header,  v74,  1LL,  "%@: Adding bundle ID to KVS: %@",  &v137,  v115);

            v18 = v77;
            if (!v79)
            {
LABEL_101:

              v118 = -[NSMutableSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithObjects:",  v126,  0LL);
              v80 = (void *)objc_claimAutoreleasedReturnValue(+[KeyValueStore defaultKeyValueStore](&OBJC_CLASS___KeyValueStore, "defaultKeyValueStore"));
              uint64_t v81 = kSSLockdownDomainITunesStore;
              uint64_t v82 = kSSLockdownKeyDownloadedApps;
              v83 = (void *)objc_claimAutoreleasedReturnValue( [v80 valueForDomain:kSSLockdownDomainITunesStore key:kSSLockdownKeyDownloadedApps]);
              uint64_t v84 = objc_opt_class(&OBJC_CLASS___NSArray);
              if ((objc_opt_isKindOfClass(v83, v84) & 1) != 0) {
                -[NSMutableSet addObjectsFromArray:](v118, "addObjectsFromArray:", v83);
              }
              v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v118, "allObjects"));
              [v80 setValue:v85 forDomain:v81 key:v82];

              goto LABEL_104;
            }

            v74 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v79,  4LL));
            free(v79);
            SSFileLog(v72, @"%@");
          }

          goto LABEL_101;
        }

        v60 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v60) {
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v61 = objc_msgSend(v60, "shouldLog", v113);
        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue([v60 OSLogObject]);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO)) {
          uint64_t v63 = v61;
        }
        else {
          uint64_t v63 = v61 & 2;
        }
        if ((_DWORD)v63)
        {
          v64 = (ApplicationHandle *)objc_opt_class(self);
          int v137 = 138412546;
          v138 = v64;
          __int16 v139 = 2112;
          v140 = v126;
          v65 = v18;
          v66 = v64;
          LODWORD(v115) = 22;
          v67 = (void *)_os_log_send_and_compose_impl( v63,  0LL,  0LL,  0LL,  &_mh_execute_header,  v62,  1LL,  "%@: Loading missing receipt for app: %@",  &v137,  v115);

          v18 = v65;
          if (!v67) {
            goto LABEL_86;
          }
          v62 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v67,  4LL));
          free(v67);
          v113 = v62;
          SSFileLog(v60, @"%@");
        }

LABEL_86:
        v68 = objc_alloc_init(&OBJC_CLASS___AppReceiptRefreshOperationOptions);
        -[AppReceiptRefreshOperationOptions setBundleIdentifier:](v68, "setBundleIdentifier:", v126);
        v69 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v126));
        v70 = v69;
        v71 = -[AppReceiptRefreshOperation initWithOptions:]( objc_alloc(&OBJC_CLASS___AppReceiptRefreshOperation),  "initWithOptions:",  v68);
        -[InstallSoftwareDownloadOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v71,  0LL);

        goto LABEL_90;
      }

      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v46,  4LL));
      free(v46);
      v113 = v42;
      SSFileLog(v39, @"%@");
    }

    goto LABEL_58;
  }

  v97 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v97) {
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v98 = [v97 shouldLog];
  v99 = (os_log_s *)objc_claimAutoreleasedReturnValue([v97 OSLogObject]);
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v100 = v98;
  }
  else {
    uint64_t v100 = v98 & 2;
  }
  if (!(_DWORD)v100) {
    goto LABEL_132;
  }
  v101 = (ApplicationHandle *)objc_opt_class(self);
  int v137 = 138412802;
  v138 = v101;
  __int16 v139 = 2048;
  v140 = v6;
  __int16 v141 = 2112;
  v142 = v126;
  v102 = v18;
  v103 = v101;
  LODWORD(v115) = 32;
  v104 = (void *)_os_log_send_and_compose_impl( v100,  0LL,  0LL,  0LL,  &_mh_execute_header,  v99,  0LL,  "%@: Missing sinf data for store download: %lld / %@",  &v137,  v115);

  v18 = v102;
  if (v104)
  {
    v99 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v104,  4LL));
    free(v104);
    v113 = v99;
    SSFileLog(v97, @"%@");
LABEL_132:
  }

  uint64_t v105 = SSError(SSErrorDomain, 10LL, 0LL, 0LL);
  v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
  -[FinishDownloadResponse setError:](v4, "setError:", v106);

  -[FinishDownloadResponse setResult:](v4, "setResult:", 3LL);
LABEL_150:

LABEL_151:
  if (v18)
  {
    SBSApplicationTerminationAssertionInvalidate(v18);
    CFRelease(v18);
  }

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  uint64_t v4 = OBJC_IVAR___ISOperation__progress;
  if (*(void *)&self->super.ISOperation_opaque[OBJC_IVAR___ISOperation__progress])
  {
    id v6 = objc_msgSend(a4, "copy", a3);
    id v7 = *(void **)&self->super.ISOperation_opaque[v4];
    *(void *)&self->super.ISOperation_opaque[v4] = v6;

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[InstallSoftwareDownloadOperation delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v8, "operation:updatedProgress:") & 1) != 0) {
      [v8 operation:self updatedProgress:*(void *)&self->super.ISOperation_opaque[v4]];
    }
  }

- (BOOL)_downloadSecondaryAssets:(id *)a3
{
  v16[0] = SSDownloadAssetTypeArtwork;
  v16[1] = SSDownloadAssetTypeNewsstandArtwork;
  v16[2] = SSDownloadAssetTypeTransitMapsData;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  unint64_t v6 = 0LL;
  id v7 = 0LL;
  do
  {
    id v8 = v7;
    while (1)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 secondaryAssetForType:v16[v6]]);
      if (v9) {
        break;
      }

      if (v6++ >= 2)
      {
        BOOL v12 = 1;
        goto LABEL_11;
      }
    }

    id v15 = v7;
    unsigned int v11 = -[FinishDownloadStepOperation downloadAsset:error:](self, "downloadAsset:error:", v9, &v15);
    id v7 = v15;

    if (v6 > 1) {
      break;
    }
    ++v6;
  }

  while (v11);
  if ((v11 & 1) != 0)
  {
    BOOL v12 = 1;
  }

  else if (*a3)
  {
    id v7 = v7;
    BOOL v12 = 0;
    *a3 = v7;
  }

  else
  {
    BOOL v12 = 0;
  }

- (void)_monitorForTerminationOfBundleID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___EventMonitorBlockEvent);
  -[EventMonitorEvent setPollInterval:](v5, "setPollInterval:", 30LL);
  -[EventMonitorEvent setShouldKeepDaemonAlive:](v5, "setShouldKeepDaemonAlive:", 1LL);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  id v7 = [v6 databaseID];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10017EE38;
  v14[3] = &unk_10034CA90;
  id v16 = v7;
  id v8 = v4;
  id v15 = v8;
  -[EventMonitorBlockEvent setEventBlock:](v5, "setEventBlock:", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10017F05C;
  v12[3] = &unk_10034AC08;
  id v13 = v8;
  id v9 = v8;
  -[EventMonitorBlockEvent setTestBlock:](v5, "setTestBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EventMonitor sharedEventMonitor](&OBJC_CLASS___EventMonitor, "sharedEventMonitor"));
  id v11 = [v10 monitorEvent:v5];
}

- (id)_newSoftwarePropertiesWithDownload:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SoftwareProperties);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  -[SoftwareProperties setBundleIdentifier:](v4, "setBundleIdentifier:", v5);

  -[SoftwareProperties setIsFromStore:](v4, "setIsFromStore:", [v3 isStoreDownload]);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleVersion]);
  -[SoftwareProperties setBundleVersion:](v4, "setBundleVersion:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 storeMetadata]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 appReceiptData]);
  -[SoftwareProperties setAppReceiptData:](v4, "setAppReceiptData:", v8);

  id v9 = objc_alloc(&OBJC_CLASS___DownloadDRM);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 sinfs]);
  id v11 = -[DownloadDRM initWithSinfArray:](v9, "initWithSinfArray:", v10);

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadDRM firstDataForSinfDataKey:](v11, "firstDataForSinfDataKey:", off_1003A24A8));
  -[SoftwareProperties setSinfData:](v4, "setSinfData:", v12);

  id v13 = [v3 newITunesMetadataDictionary];
  -[SoftwareProperties setITunesMetadata:](v4, "setITunesMetadata:", v13);
  dispatch_semaphore_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaAsset]);
  id v15 = v14;
  if (v14)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 localPath]);
    -[SoftwareProperties setPackagePath:](v4, "setPackagePath:", v16);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 secondaryAssetForType:SSDownloadAssetTypeArtwork]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localPath]);

  if (v18)
  {
    v19 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v18);
    -[SoftwareProperties setArtworkData:](v4, "setArtworkData:", v19);
  }

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v3 secondaryAssetForType:SSDownloadAssetTypeNewsstandArtwork]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localPath]);

  if (v21)
  {
    uint64_t v22 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v21);
    -[SoftwareProperties setNewsstandArtworkData:](v4, "setNewsstandArtworkData:", v22);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 secondaryAssetForType:SSDownloadAssetTypeTransitMapsData]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 localPath]);

  if (v24)
  {
    v25 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v24);
    -[SoftwareProperties setTransitMapData:](v4, "setTransitMapData:", v25);
  }

  if ([v3 isRestoreDownload])
  {
    v26 = &off_10036D998;
  }

  else
  {
    id v27 = [v3 automaticType];
    v28 = &off_10036D9E0;
    if (v27 == (id)2) {
      v28 = &off_10036D9C8;
    }
    if (v27 == (id)1) {
      v26 = &off_10036D9B0;
    }
    else {
      v26 = v28;
    }
  }

  -[SoftwareProperties setInstallType:](v4, "setInstallType:", v26);

  return v4;
}

@end