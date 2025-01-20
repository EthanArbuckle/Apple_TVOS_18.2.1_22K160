@interface BookAssetDaemonUtility
+ (void)checkAutomaticDownloads;
+ (void)sendBookDownloads:(id)a3 withReason:(id)a4;
+ (void)sendBookStoreDownloads:(id)a3 withReason:(id)a4;
+ (void)sendRestoreDownloads:(id)a3 withReason:(id)a4;
@end

@implementation BookAssetDaemonUtility

+ (void)sendBookDownloads:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 count]) {
    goto LABEL_28;
  }
  id v25 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v26 = v5;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (!v9) {
    goto LABEL_25;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v29;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
      id v14 = objc_msgSend(v13, "copyStoreDownloadMetadata", v23);
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v13 downloadPolicy]);
        if (v15) {
          [v14 setDownloadPolicy:v15];
        }
        [v7 addObject:v14];
      }

      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v15) {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v16 = [v15 shouldLog];
        else {
          unsigned int v17 = v16;
        }
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v19 = v17;
        }
        else {
          uint64_t v19 = v17 & 2;
        }
        if ((_DWORD)v19)
        {
          v20 = (void *)objc_opt_class(a1);
          int v32 = 138543362;
          v33 = v20;
          id v21 = v20;
          LODWORD(v24) = 12;
          v22 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[%{public}@]: Could not retrieve the storeDownload parameters",  &v32,  v24);

          if (!v22) {
            goto LABEL_23;
          }
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
          free(v22);
          v23 = v18;
          SSFileLog(v15, @"%@");
        }
      }

+ (void)sendBookStoreDownloads:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  id v6 = (void *)ISWeakLinkedClassForString(@"BLDownloadQueue", 34LL);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v40 = [v7 shouldLog];
    else {
      unsigned int v41 = v40;
    }
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v43 = v41;
    }
    else {
      uint64_t v43 = v41 & 2;
    }
    if ((_DWORD)v43)
    {
      int v70 = 138543362;
      id v71 = (id)objc_opt_class(a1);
      id v44 = v71;
      v45 = (void *)_os_log_send_and_compose_impl( v43,  0LL,  0LL,  0LL,  &_mh_execute_header,  v42,  0LL,  "[%{public}@]: Error importing the base class from BookLibrary",  &v70,  12);

      if (!v45) {
        goto LABEL_89;
      }
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v45,  4LL));
      free(v45);
      SSFileLog(v7, @"%@");
    }

    goto LABEL_89;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedInstance]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  id v9 = (void *)v8;
  if (v7)
  {
    v57 = v5;
    if (!v8) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      unsigned int v11 = v10;
    }
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v11 & 2;
    }
    if ((_DWORD)v13)
    {
      int v70 = 138543362;
      id v71 = (id)objc_opt_class(a1);
      id v14 = v71;
      v15 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[%{public}@]: Attempting to send book downloads over to bookassetd",  &v70,  12);

      if (!v15)
      {
LABEL_15:

        __int128 v67 = 0u;
        __int128 v68 = 0u;
        __int128 v66 = 0u;
        __int128 v65 = 0u;
        id v16 = v57;
        id v17 = [v16 countByEnumeratingWithState:&v65 objects:v69 count:16];
        if (!v17) {
          goto LABEL_62;
        }
        id v18 = v17;
        uint64_t v61 = *(void *)v66;
        id v60 = v16;
        v58 = v7;
        id v59 = a1;
        while (1)
        {
          uint64_t v19 = 0LL;
          do
          {
            if (*(void *)v66 != v61) {
              objc_enumerationMutation(v16);
            }
            v20 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)v19);
            if (v20)
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v65 + 1) + 8 * (void)v19) redownloadActionParameters]);
              id v22 = [v21 copy];

              v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 downloadPermalink]);
              if (v23
                || (v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( objc_msgSend( v20,  "valueForFirstAvailableKey:",  @"download_permalink",  0))) != 0)
              {
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v23, v55));
              }

              else
              {
                uint64_t v24 = 0LL;
              }

              if (([v20 isRedownloadDownload] & 1) != 0 || v24)
              {
                if (v22)
                {
                  v63[0] = _NSConcreteStackBlock;
                  v63[1] = 3221225472LL;
                  v63[2] = sub_10014DA60;
                  v63[3] = &unk_10034FB60;
                  v63[4] = a1;
                  [v7 addDownloadWithPurchaseParameters:v22 completion:v63];
                }

                else if (v24)
                {
                  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v20 title]);
                  id v32 = [v31 copy];

                  v62[0] = _NSConcreteStackBlock;
                  v62[1] = 3221225472LL;
                  v62[2] = sub_10014DC14;
                  v62[3] = &unk_10034FB60;
                  v62[4] = a1;
                  [v7 addDownloadWithPermlink:v24 title:v32 completion:v62];

                  id v16 = v60;
                }
              }

              else
              {
                id v25 = (void *)objc_claimAutoreleasedReturnValue([v20 dictionary]);
                id v26 = [v25 copy];

                if (v26)
                {
                  v64[0] = _NSConcreteStackBlock;
                  v64[1] = 3221225472LL;
                  v64[2] = sub_10014D8AC;
                  v64[3] = &unk_10034FB60;
                  v64[4] = a1;
                  [v7 addDownloadWithMetadata:v26 completion:v64];
                  goto LABEL_54;
                }

                v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
                if (!v33) {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
                }
                LODWORD(v34) = [v33 shouldLog];
                v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 OSLogObject]);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
                  uint64_t v34 = v34;
                }
                else {
                  v34 &= 2u;
                }
                if ((_DWORD)v34)
                {
                  v36 = (void *)objc_opt_class(v59);
                  int v70 = 138543362;
                  id v71 = v36;
                  id v37 = v36;
                  LODWORD(v56) = 12;
                  v38 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  0LL,  "[%{public}@]: Could not retrieve the dictionary from storeDownload object",  &v70,  v56);

                  id v16 = v60;
                  if (v38)
                  {
                    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
                    free(v38);
                    v55 = v35;
                    SSFileLog(v33, @"%@");
                    goto LABEL_52;
                  }
                }

                else
                {
LABEL_52:
                }

                v7 = v58;
                a1 = v59;
LABEL_54:
              }

              goto LABEL_56;
            }

            id v22 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
            if (!v22) {
              id v22 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            LODWORD(v27) = objc_msgSend(v22, "shouldLog", v55);
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v27 = v27;
            }
            else {
              v27 &= 2u;
            }
            if (!(_DWORD)v27) {
              goto LABEL_56;
            }
            __int128 v28 = (void *)objc_opt_class(a1);
            int v70 = 138543362;
            id v71 = v28;
            id v29 = v28;
            LODWORD(v56) = 12;
            __int128 v30 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "[%{public}@]: Could not retrieve the storeDownload parameters",  &v70,  v56);

            if (v30)
            {
              v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
              free(v30);
              v55 = v23;
              SSFileLog(v22, @"%@");
              id v16 = v60;
LABEL_56:

              goto LABEL_57;
            }

            id v16 = v60;
LABEL_57:

            uint64_t v19 = (char *)v19 + 1;
          }

          while (v18 != v19);
          id v39 = [v16 countByEnumeratingWithState:&v65 objects:v69 count:16];
          id v18 = v39;
          if (!v39)
          {
LABEL_62:
            id v5 = v57;
            goto LABEL_88;
          }
        }
      }

      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
      free(v15);
      v55 = v12;
      SSFileLog(v9, @"%@");
    }

    goto LABEL_15;
  }

  v46 = (void *)v8;
  id v47 = v5;
  if (!v8) {
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v48 = [v46 shouldLog];
  else {
    unsigned int v49 = v48;
  }
  v50 = v46;
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue([v46 OSLogObject]);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v52 = v49;
  }
  else {
    uint64_t v52 = v49 & 2;
  }
  if ((_DWORD)v52)
  {
    int v70 = 138543362;
    id v71 = (id)objc_opt_class(a1);
    id v53 = v71;
    v54 = (void *)_os_log_send_and_compose_impl( v52,  0LL,  0LL,  0LL,  &_mh_execute_header,  v51,  0LL,  "[%{public}@]: Error creating a shared instance of the BookLibrary download queue",  &v70,  12);

    if (!v54) {
      goto LABEL_87;
    }
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v54,  4LL));
    free(v54);
    SSFileLog(v50, @"%@");
  }

LABEL_87:
  id v5 = v47;
  id v16 = v50;
LABEL_88:

LABEL_89:
}

+ (void)sendRestoreDownloads:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  id v6 = (void *)ISWeakLinkedClassForString(@"BLDownloadQueue", 34LL);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v39 = [v7 shouldLog];
    else {
      unsigned int v40 = v39;
    }
    unsigned int v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v42 = v40;
    }
    else {
      uint64_t v42 = v40 & 2;
    }
    if ((_DWORD)v42)
    {
      int v64 = 138543362;
      id v65 = (id)objc_opt_class(a1);
      id v43 = v65;
      id v44 = (void *)_os_log_send_and_compose_impl( v42,  0LL,  0LL,  0LL,  &_mh_execute_header,  v41,  0LL,  "[%{public}@]: Error importing the base class from BookLibrary",  &v64,  12);

      if (!v44) {
        goto LABEL_77;
      }
      unsigned int v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v44,  4LL));
      free(v44);
      SSFileLog(v7, @"%@");
    }

    goto LABEL_77;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedInstance]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  id v9 = (id)v8;
  if (v7)
  {
    if (!v8) {
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      unsigned int v11 = v10;
    }
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v11 & 2;
    }
    if ((_DWORD)v13)
    {
      int v64 = 138543362;
      id v65 = (id)objc_opt_class(a1);
      id v14 = v5;
      id v15 = v65;
      id v16 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[%{public}@]: Attempting to send book restore downloads over to bookassetd",  &v64,  12);

      id v5 = v14;
      if (!v16)
      {
LABEL_15:

        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        id v9 = v5;
        id v17 = [v9 countByEnumeratingWithState:&v59 objects:v63 count:16];
        if (!v17) {
          goto LABEL_76;
        }
        id v18 = v17;
        id v55 = v5;
        uint64_t v19 = *(void *)v60;
        id v57 = a1;
        while (1)
        {
          v20 = 0LL;
          id v56 = v18;
          do
          {
            if (*(void *)v60 != v19) {
              objc_enumerationMutation(v9);
            }
            id v21 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)v20);
            if (v21)
            {
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dictionary]);
              id v23 = [v22 copy];

              if (v23)
              {
                v58[0] = _NSConcreteStackBlock;
                v58[1] = 3221225472LL;
                v58[2] = sub_10014E534;
                v58[3] = &unk_10034FB60;
                v58[4] = a1;
                [v7 addRestoreDownloadWithMetadata:v23 completion:v58];
                goto LABEL_48;
              }

              uint64_t v30 = v19;
              id v31 = v9;
              id v32 = v7;
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
              if (!v33) {
                v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
              }
              LODWORD(v34) = objc_msgSend(v33, "shouldLog", v53);
              v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 OSLogObject]);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
                uint64_t v34 = v34;
              }
              else {
                v34 &= 2u;
              }
              if ((_DWORD)v34)
              {
                v36 = (void *)objc_opt_class(a1);
                int v64 = 138543362;
                id v65 = v36;
                id v37 = v36;
                LODWORD(v54) = 12;
                v38 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  0LL,  "[%{public}@]: Could not retrieve the dictionary from storeDownload object",  &v64,  v54);

                a1 = v57;
                if (v38)
                {
                  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
                  free(v38);
                  id v53 = v35;
                  SSFileLog(v33, @"%@");
                  goto LABEL_45;
                }
              }

              else
              {
LABEL_45:
              }

              v7 = v32;
              id v9 = v31;
              uint64_t v19 = v30;
              id v18 = v56;
              goto LABEL_48;
            }

            id v23 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
            if (!v23) {
              id v23 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            unsigned int v24 = objc_msgSend(v23, "shouldLog", v53);
            else {
              LODWORD(v25) = v24;
            }
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v25 = v25;
            }
            else {
              v25 &= 2u;
            }
            if (!(_DWORD)v25) {
              goto LABEL_34;
            }
            uint64_t v27 = (void *)objc_opt_class(a1);
            int v64 = 138543362;
            id v65 = v27;
            id v28 = v27;
            LODWORD(v54) = 12;
            id v29 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[%{public}@]: Could not retrieve the storeDownload parameters",  &v64,  v54);

            if (v29)
            {
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
              free(v29);
              id v53 = v26;
              SSFileLog(v23, @"%@");
              a1 = v57;
LABEL_34:

              goto LABEL_48;
            }

            a1 = v57;
LABEL_48:

            v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v18 = [v9 countByEnumeratingWithState:&v59 objects:v63 count:16];
          if (!v18)
          {
            id v5 = v55;
            goto LABEL_76;
          }
        }
      }

      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
      free(v16);
      id v53 = v12;
      SSFileLog(v9, @"%@");
    }

    goto LABEL_15;
  }

  if (!v8) {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v45 = [v9 shouldLog];
  else {
    unsigned int v46 = v45;
  }
  id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v48 = v46;
  }
  else {
    uint64_t v48 = v46 & 2;
  }
  if ((_DWORD)v48)
  {
    id v49 = v5;
    int v64 = 138543362;
    id v65 = (id)objc_opt_class(a1);
    id v50 = v65;
    v51 = (void *)_os_log_send_and_compose_impl( v48,  0LL,  0LL,  0LL,  &_mh_execute_header,  v47,  0LL,  "[%{public}@]: Error creating a shared instance of the BookLibrary download queue",  &v64,  12);

    if (v51)
    {
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v51,  4LL));
      free(v51);
      SSFileLog(v9, @"%@");
    }

    id v5 = v49;
  }

  else
  {
  }

+ (void)checkAutomaticDownloads
{
  v3 = (void *)ISWeakLinkedClassForString(@"BLDownloadQueue", 34LL);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v4) {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v12 = [v4 shouldLog];
    else {
      LODWORD(v13) = v12;
    }
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      int v22 = 138543362;
      id v23 = (id)objc_opt_class(a1);
      id v14 = v23;
      id v15 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[%{public}@]: Error importing the base class from BookLibrary",  &v22,  12);

      if (!v15) {
        goto LABEL_40;
      }
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
      free(v15);
      SSFileLog(v4, @"%@");
    }

    goto LABEL_39;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sharedInstance]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  id v6 = (os_log_s *)v5;
  if (!v4)
  {
    if (!v5) {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v16 = -[os_log_s shouldLog](v6, "shouldLog");
    else {
      LODWORD(v17) = v16;
    }
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v6, "OSLogObject"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if (!(_DWORD)v17) {
      goto LABEL_38;
    }
    int v22 = 138543362;
    id v23 = (id)objc_opt_class(a1);
    id v19 = v23;
    v20 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[%{public}@]: Error creating a shared instance of the BookLibrary download queue",  &v22,  12);

    if (v20)
    {
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      SSFileLog(v6, @"%@");
LABEL_38:
    }

@end