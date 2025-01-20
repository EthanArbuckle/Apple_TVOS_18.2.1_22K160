LABEL_15:
  v18 = sub_100010B50("SecError");
  v16 = (supd *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 67109120;
    v21 = [v4 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "xpc: Client (pid: %d) doesn't have entitlement",  (uint8_t *)&v20,  8u);
  }

  v17 = 0;
LABEL_18:

  return v17;
}

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

        objc_autoreleasePoolPop(context);
        goto LABEL_16;
      }

      if ([v11 disableUploads])
      {
        v14 = sub_100010B50("upload");
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = objc_claimAutoreleasedReturnValue([v11 internalTopicName]);
          v17 = v8;
          v18 = (void *)v16;
          *(_DWORD *)buf = 138412290;
          v95 = v16;
          v19 = v15;
          v20 = "Aborting upload task for %@ because uploads are disabled";
          goto LABEL_14;
        }

        goto LABEL_15;
      }

      v23 = a3;
      v24 = v7;
      v25 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v88 = v9;
      v75 = (void *)v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v11,  "createChunkedLoggingJSON:forUpload:participatingClients:force:error:",  0,  1));
      v27 = v88;

      v72 = v26;
      if (v26) {
        v28 = v27 == 0LL;
      }
      else {
        v28 = 0;
      }
      v29 = v28;
      v81 = v8;
      v71 = v29;
      if (!v28)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue([v27 domain]);
        if ([v49 isEqualToString:@"com.apple.security.supd"])
        {
          v51 = [v27 code];

          v28 = v51 == (id)2;
          v7 = v70;
          a3 = v23;
          if (!v28)
          {
LABEL_59:
            v56 = sub_100010B50("SecError");
            v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              v57 = (void *)objc_claimAutoreleasedReturnValue([v11 internalTopicName]);
              *(_DWORD *)buf = 138412546;
              v95 = (uint64_t)v57;
              v96 = 2112;
              v97 = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "upload: failed to create chunked log events for logging topic %@: %@",  buf,  0x16u);
            }

            goto LABEL_73;
          }

          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v11 updateUploadDateForClients:v75 date:v49 clearData:1];
        }

        else
        {
          v7 = v24;
          a3 = v23;
        }

        goto LABEL_59;
      }

      if ([v11 isSampledUpload])
      {
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        obj = v26;
        v30 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
        if (v30)
        {
          v31 = v30;
          v32 = 0LL;
          v33 = *(void *)v85;
          v74 = *(void *)v85;
LABEL_29:
          v34 = 0LL;
          while (1)
          {
            if (*(void *)v85 != v33) {
              objc_enumerationMutation(obj);
            }
            v35 = *(void *)(*((void *)&v84 + 1) + 8 * v34);
            v36 = objc_autoreleasePoolPush();
            v83 = v32;
            v37 = (void *)objc_claimAutoreleasedReturnValue( +[supd serializeLoggingEvent:error:]( &OBJC_CLASS___supd,  "serializeLoggingEvent:error:",  v35,  &v83));
            v9 = v83;

            if (!v37 || v9 != 0LL) {
              break;
            }
            reporter = v79->_reporter;
            v40 = (void *)objc_claimAutoreleasedReturnValue([v11 internalTopicName]);
            LOBYTE(reporter) = -[SFAnalyticsReporter saveReport:fileName:](reporter, "saveReport:fileName:", v37, v40);

            if ((reporter & 1) == 0)
            {
              v41 = sub_100010B50("SecError");
              v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "upload: failed to write analytics data to log",  buf,  2u);
              }
            }

            v82 = 0LL;
            v43 = [v11 postJSON:v37 toEndpoint:v13 postSession:v81 error:&v82];
            v32 = v82;
            if (v43)
            {
              v44 = sub_100010B50("upload");
              v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                v46 = (void *)objc_claimAutoreleasedReturnValue([v11 internalTopicName]);
                *(_DWORD *)buf = 138412290;
                v95 = (uint64_t)v46;
                _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Successfully posted JSON for %@",  buf,  0xCu);

                v33 = v74;
              }

              v73 = 1;
            }

            else
            {
              v47 = sub_100010B50("SecError");
              v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue([v11 internalTopicName]);
                *(_DWORD *)buf = 138412546;
                v95 = (uint64_t)v48;
                v96 = 2112;
                v97 = v32;
                _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "upload: Failed to post JSON for %@: %@",  buf,  0x16u);

                v33 = v74;
              }
            }

            objc_autoreleasePoolPop(v36);
            if (v31 == (id)++v34)
            {
              v31 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
              if (v31) {
                goto LABEL_29;
              }
              goto LABEL_65;
            }
          }

          v58 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
          v59 = [v58 isEqualToString:@"com.apple.security.supd"];
          v60 = v59;
          if (v59)
          {
            v61 = [v9 code];

            v7 = v70;
            if (v61 == (id)2)
            {
              v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              [v11 updateUploadDateForClients:v75 date:v58 clearData:1];
              goto LABEL_67;
            }

            v60 = 0;
          }

          else
          {
            v7 = v70;
LABEL_67:
          }

          v62 = sub_100010B50("SecError");
          v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue([v11 internalTopicName]);
            *(_DWORD *)buf = 138412546;
            v95 = (uint64_t)v64;
            v96 = 2112;
            v97 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "upload: failed to serialized chunked log events for logging topic %@: %@",  buf,  0x16u);
          }

          objc_autoreleasePoolPop(v36);
          v4 = v69;
          a3 = v68;
          if ((v60 & 1) != 0) {
            goto LABEL_74;
          }
        }

        else
        {
          v32 = 0LL;
LABEL_65:

          v9 = v32;
          v4 = v69;
          a3 = v68;
          v7 = v70;
        }

        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v11 updateUploadDateForClients:v75 date:v55 clearData:1];
        v27 = v9;
        goto LABEL_73;
      }

      v7 = v24;
      v52 = sub_100010B50("upload");
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      a3 = v23;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue([v11 internalTopicName]);
        *(_DWORD *)buf = 138412290;
        v95 = (uint64_t)v54;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "skipping unsampled upload for %@ and clearing data",  buf,  0xCu);
      }

      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v11 updateUploadDateForClients:v75 date:v55 clearData:1];
      v27 = 0LL;
LABEL_73:

      v9 = v27;
LABEL_74:

      objc_autoreleasePoolPop(context);
      v65 = v71 ^ 1;
      if (!a3) {
        v65 = 1;
      }
      if ((v65 & 1) != 0)
      {
        v8 = v81;
      }

      else
      {
        v8 = v81;
        if (v9)
        {
          v9 = v9;
          *a3 = v9;
        }
      }

uint64_t start()
{
  v0 = sub_100010B50("lifecycle");
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "supd lives!", v11, 2u);
  }

  +[NSError _setFileNameLocalizationEnabled:](&OBJC_CLASS___NSError, "_setFileNameLocalizationEnabled:", 0LL);
  v2 = objc_alloc_init(&OBJC_CLASS___ServiceDelegate);
  v3 = -[supd initWithConnection:](objc_alloc(&OBJC_CLASS___supd), "initWithConnection:", 0LL);
  v4 = (void *)qword_10001DB60;
  qword_10001DB60 = (uint64_t)v3;

  v5 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.securityuploadd");
  -[NSXPCListener setDelegate:](v5, "setDelegate:", v2);
  dispatch_time_t v6 = dispatch_time(0LL, 5000000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_after(v6, v8, &stru_100018618);

  -[NSXPCListener resume](v5, "resume");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v9 run];

  return 0LL;
}

void sub_100005294(id a1)
{
  v1 = sub_100010B50("lifecycle");
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "will exit when clean", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_1000053BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_100010B50("OSAWriteLogForSubmission");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Writing log data to report: %@",  (uint8_t *)&v7,  0xCu);
  }

  [v3 writeData:*(void *)(a1 + 40)];
}

void sub_100005880(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) store]);
  id v11 = 0LL;
  unsigned __int8 v3 = [v2 openWithError:&v11];
  id v4 = v11;

  if ((v3 & 1) != 0)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) store]);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) store]);
    [v7 close];
  }

  else
  {
    if (!v4 || [v4 code] != (id)23)
    {
      uint64_t v8 = sub_100010B50("SecError");
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "SFAnalytics: could not open db at init, will try again later. Error: %@",  buf,  0xCu);
      }
    }

    uint64_t v10 = *(void *)(a1 + 40);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) store]);
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v7);
  }
}

LABEL_18:
    goto LABEL_19;
  }

  v18 = -[SFAnalyticsClient initWithStorePath:name:requireDeviceAnalytics:requireiCloudAnalytics:]( objc_alloc(&OBJC_CLASS___SFAnalyticsClient),  "initWithStorePath:name:requireDeviceAnalytics:requireiCloudAnalytics:",  v13,  v9,  v7,  v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsClient storePath](v18, "storePath"));

  if (v9 && v19)
  {
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v18,  v9));
    v21 = (void *)qword_10001DB70;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsClient storePath](v18, "storePath"));
    [v21 setObject:v20 forKeyedSubscript:v22];

    goto LABEL_9;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SFAnalyticsClient storePath](v18, "storePath"));

  if (v24)
  {
    if (v9) {
      goto LABEL_14;
    }
LABEL_23:
    v29 = sub_100010B50("SecError");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "SFAnalyticsClient: name is unexpectedly nil! Not adding to namedSharedClientsByStorePath",  buf,  2u);
    }

LABEL_9:
    if (!v18) {
      goto LABEL_15;
    }
    goto LABEL_19;
  }

  v27 = sub_100010B50("SecError");
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "SFAnalyticsClient: sharedClient.storePath is unexpectedly nil! Not adding to namedSharedClientsByStorePath",  buf,  2u);
  }

  if (!v9) {
    goto LABEL_23;
  }
LABEL_14:
  if (!v18)
  {
LABEL_15:
    v25 = sub_100010B50("SecError");
    v17 = (SFAnalyticsClient *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "SFAnalyticsClient: sharedClient is unexpectedly nil!",  buf,  2u);
    }

    v18 = 0LL;
    goto LABEL_18;
  }

LABEL_19:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001DB68);
  return v18;
}

  return v8;
}

void sub_100005D70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100005DB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005DC0(uint64_t a1)
{
}

void sub_100005DC8(uint64_t a1, int a2, id obj, _BYTE *a4)
{
  *a4 = 1;
}

void sub_100006A28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_7:
  return v8 ^ 1;
}

LABEL_17:
  return v8;
}

  v18 = sub_100010B50("upload");
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    internalTopicName = self->_internalTopicName;
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = internalTopicName;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Splunk upload challenge for %@", buf, 0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 protectionSpace]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 authenticationMethod]);
  v23 = [v22 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (!v23)
  {
    v10[2](v10, 1LL, 0LL);
    goto LABEL_32;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v9 protectionSpace]);
  v25 = (__SecTrust *)[v24 serverTrust];

  v26 = SecTrustEvaluateWithError(v25, 0LL);
  v27 = self->_allowInsecureSplunkCert || v26;
  if (v27 != 1)
  {
LABEL_31:
    v10[2](v10, 2LL, 0LL);
    goto LABEL_32;
  }

  if (self->_allowInsecureSplunkCert)
  {
    v28 = sub_100010B50("upload");
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = self->_internalTopicName;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Force Accepting Splunk Credential for %@",  buf,  0xCu);
    }
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](&OBJC_CLASS___NSURLCredential, "credentialForTrust:", v25));
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0LL, v31);

LABEL_32:
}

void sub_100007F7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

LABEL_10:
  return (unint64_t)v9;
}

void sub_10000998C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_26:
  return v20;
}

void sub_100009F70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id location, char a27)
{
}

void sub_10000A480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void sub_10000A75C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (!v7 || v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a4);
LABEL_16:
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
      {
        v26 = sub_100010B50("upload");
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v28 = *(void *)(*(void *)(a1 + 32) + 40LL);
          uint64_t v29 = *(void *)(a1 + 48);
          uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
          *(_DWORD *)buf = 138412802;
          unint64_t v55 = v28;
          __int16 v56 = 2112;
          uint64_t v57 = v29;
          __int16 v58 = 2112;
          uint64_t v59 = v30;
          v31 = "Unable to fetch splunk endpoint at URL for %@: %@ -- error: %@";
          v32 = v27;
          uint32_t v33 = 32;
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
        }
      }

      else
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)) {
          goto LABEL_22;
        }
        v34 = sub_100010B50("upload");
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v35 = *(void *)(*(void *)(a1 + 32) + 40LL);
          *(_DWORD *)buf = 138412290;
          unint64_t v55 = v35;
          v31 = "Malformed iTunes config payload for %@!";
          v32 = v27;
          uint32_t v33 = 12;
          goto LABEL_19;
        }
      }

LABEL_22:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      goto LABEL_23;
    }

    id v11 = v7;
    v12 = objc_autoreleasePoolPush();
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id obj = *(id *)(v13 + 40);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v11,  0LL,  &obj));
    objc_storeStrong((id *)(v13 + 40), obj);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0 || *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
    {
LABEL_14:
      objc_autoreleasePoolPop(v12);

      goto LABEL_16;
    }

    if (*(_BYTE *)(*(void *)(a1 + 32) + 9LL))
    {
LABEL_7:
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"metricsBase"]);
      v17 = (void *)WeakRetained[11];
      WeakRetained[11] = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"metricsUrl"]);
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
      {
        v52 = v18;
        uint64_t v20 = objc_claimAutoreleasedReturnValue([v18 stringByAppendingFormat:@"/2/%@", WeakRetained[3]]);
        v21 = sub_100010B50("upload");
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 40LL);
          *(_DWORD *)buf = 138412546;
          unint64_t v55 = v20;
          __int16 v56 = 2112;
          uint64_t v57 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "got metrics endpoint %@ for %@",  buf,  0x16u);
        }

        v51 = (void *)v20;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v20));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 scheme]);
        unsigned int v50 = [v25 isEqualToString:@"https"];

        if (v50) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v24);
        }

        v18 = v52;
      }

      goto LABEL_14;
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForKey:@"sendDisabled"]);
    *(_BYTE *)(*(void *)(a1 + 32) + 10) = [v36 BOOLValue];

    if (!*(_BYTE *)(*(void *)(a1 + 32) + 10LL))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForKey:@"postFrequency"]);
      unint64_t v41 = (unint64_t)[v40 unsignedIntegerValue];

      if (v41 >= 0x3E8)
      {
        unint64_t v42 = v41 / 0x3E8;
        if (os_variant_has_internal_diagnostics("com.apple.security")
          && *(void *)(*(void *)(a1 + 32) + 72LL) < v42)
        {
          v43 = sub_100010B50("getURL");
          v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v45 = *(void *)(*(void *)(a1 + 32) + 72LL);
            *(_DWORD *)buf = 134218240;
            unint64_t v55 = v42;
            __int16 v56 = 2048;
            uint64_t v57 = v45;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Overriding server-sent post frequency because device is internal (%lu -> %lu)",  buf,  0x16u);
          }
        }

        else
        {
          WeakRetained[9] = v42;
        }
      }

      uint64_t v46 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"blacklistedEvents"]);
      v47 = (void *)WeakRetained[13];
      WeakRetained[13] = v46;

      uint64_t v48 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"blacklistedFields"]);
      v49 = (void *)WeakRetained[12];
      WeakRetained[12] = v48;

      goto LABEL_7;
    }

    v37 = sub_100010B50("SecError");
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v39 = *(void *)(*(void *)(a1 + 32) + 40LL);
      *(_DWORD *)buf = 138412290;
      unint64_t v55 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "not returning a splunk URL because uploads are disabled for %@",  buf,  0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    objc_autoreleasePoolPop(v12);
  }

LABEL_23:
}

void sub_10000ACE8(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000AD34(id a1)
{
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_100005DB0;
  v32 = sub_100005DC0;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100005DB0;
  v26 = sub_100005DC0;
  id v27 = 0LL;
  id v1 = sub_10000B0F8();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (v2)
  {
    unsigned __int8 v3 = sub_100010B50("_getiCloudConfigurationInfoWithError");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Fetching configuration info",  (uint8_t *)&buf,  2u);
    }

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
    uint64_t v6 = (void *)objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationController);
    v40 = @"com.apple.idms.config.privacy.icloud.data";
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    unint64_t v35 = sub_10000B160;
    v36 = &unk_100018970;
    v38 = &v22;
    unint64_t v39 = &v28;
    id v8 = v5;
    v37 = v8;
    [v6 configurationInfoWithIdentifiers:v7 forAltDSID:v2 completion:&buf];

    dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
    dispatch_semaphore_wait(v8, v9);
  }

  else
  {
    uint64_t v10 = sub_100010B50("SecError");
    id v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "_getiCloudConfigurationInfoWithError: Failed to fetch primary account info.",  (uint8_t *)&buf,  2u);
    }
  }

  id v11 = (void *)v23[5];
  if (v11) {
    id v12 = v11;
  }
  id v13 = (id)v29[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  id v14 = v11;
  if (v13) {
    BOOL v15 = v11 == 0LL;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"com.apple.idms.config.privacy.icloud.data"]);
    if (v16)
    {
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0
        || (uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v16, v18) & 1) != 0))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v16 integerValue]));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
        byte_10001DBA0 = [v19 isEqualToNumber:v20] ^ 1;
      }
    }

LABEL_20:
    goto LABEL_21;
  }

  if (v11)
  {
    v21 = sub_100010B50("SecError");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "_isiCloudAnalyticsEnabled: %@",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_20;
  }

LABEL_21:
}

void sub_10000B0C8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

id sub_10000B0F8()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "aa_primaryAppleAccount"));
  v2 = v1;
  if (v1) {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "aa_altDSID"));
  }
  else {
    unsigned __int8 v3 = 0LL;
  }

  return v3;
}

void sub_10000B160(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_100010B50("SecError");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_getiCloudConfigurationInfoWithError: Error fetching configurationInfo: %@",  (uint8_t *)&v20,  0xCu);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v10 = v6;
LABEL_9:
    id v14 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
    goto LABEL_10;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0)
  {
    id v12 = sub_100010B50("_getiCloudConfigurationInfoWithError");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "fetched configurationInfo %@",  (uint8_t *)&v20,  0xCu);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v10 = v5;
    id v5 = v10;
    goto LABEL_9;
  }

  BOOL v15 = sub_100010B50("SecError");
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543362;
    id v21 = (id)objc_opt_class(v5);
    id v17 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "_getiCloudConfigurationInfoWithError: configurationInfo dict was not a dict, it was a %{public}@",  (uint8_t *)&v20,  0xCu);
  }

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = 0LL;

  id v14 = v5;
  id v5 = 0LL;
LABEL_10:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000B36C(id a1)
{
  byte_10001DB90 = DiagnosticLogSubmissionEnabled(a1);
}

void sub_10000B388(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uploadDate]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uploadDate]);
    [v5 timeIntervalSince1970];
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6 * 1000.0));
  }

  if (!*(_BYTE *)(a1 + 136))
  {
    if (qword_10001DB98 != -1) {
      dispatch_once(&qword_10001DB98, &stru_100018928);
    }
    if (!byte_10001DB90)
    {
      id v33 = sub_100010B50("getLoggingJSON");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
      *(_DWORD *)v37 = 138412290;
      *(void *)&v37[4] = v34;
      unint64_t v35 = "Client '%@' requires device analytics yet user did not opt in.";
    }

    else
    {
LABEL_12:
      if (qword_10001DBA8 != -1) {
        dispatch_once(&qword_10001DBA8, &stru_100018948);
      }
      if (byte_10001DBA0) {
        goto LABEL_13;
      }
      v36 = sub_100010B50("getLoggingJSON");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
      *(_DWORD *)v37 = 138412290;
      *(void *)&v37[4] = v34;
      unint64_t v35 = "Client '%@' requires iCloud analytics yet user did not opt in.";
    }

    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v35, v37, 0xCu);

    goto LABEL_39;
  }

LABEL_13:
  if (!*(_BYTE *)(a1 + 137))
  {
LABEL_27:
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 40),  "healthSummaryWithName:store:uuid:timestamp:lastUploadTime:",  *(void *)(a1 + 32),  v3,  *(void *)(a1 + 56),  *(void *)(a1 + 64),  v4,  *(_OWORD *)v37,  *(void *)&v37[16]));
    id v8 = v25;
    if (v25)
    {
      uint64_t v26 = *(void *)(a1 + 72);
      if (v26) {
        -[os_log_s setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v26, @"ckdeviceID");
      }
      uint64_t v27 = *(void *)(a1 + 80);
      if (v27) {
        -[os_log_s setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v27, @"altDSID");
      }
      if (*(void *)(a1 + 88)) {
        -[os_log_s addEntriesFromDictionary:](v8, "addEntriesFromDictionary:");
      }
      if (*(void *)(a1 + 96)) {
        -[os_log_s setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"isAppleUser");
      }
      [*(id *)(a1 + 104) addObject:v8];
    }

    uint64_t v28 = *(void **)(a1 + 112);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v3 rockwells]);
    [v28 addObject:v29];

    uint64_t v30 = *(void **)(a1 + 120);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v3 hardFailures]);
    [v30 addObject:v31];

    v32 = *(void **)(a1 + 128);
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 softFailures]);
    [v32 addObject:v15];
    goto LABEL_38;
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 uploadDate]);
  id v8 = (os_log_s *)v7;
  int v9 = *(unsigned __int8 *)(a1 + 136);
  if (*(_BYTE *)(a1 + 136) || !v7)
  {
LABEL_20:
    uint64_t v18 = sub_100010B50("json");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v20)
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
        uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 40LL);
        *(_DWORD *)v37 = 138412546;
        *(void *)&v37[4] = v21;
        *(_WORD *)&v37[12] = 2112;
        *(void *)&v37[14] = v22;
        uint64_t v23 = "client '%@' for topic '%@' force-included";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v23, v37, 0x16u);
      }
    }

    else if (v20)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
      uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 40LL);
      *(_DWORD *)v37 = 138412546;
      *(void *)&v37[4] = v21;
      *(_WORD *)&v37[12] = 2112;
      *(void *)&v37[14] = v24;
      uint64_t v23 = "including client '%@' for topic '%@' for upload";
      goto LABEL_25;
    }

    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 32)];
    goto LABEL_27;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v10 timeIntervalSinceDate:v8];
  double v12 = v11;
  double v13 = (double)*(unint64_t *)(*(void *)(a1 + 40) + 72LL);

  if (v12 >= v13)
  {
    int v9 = *(unsigned __int8 *)(a1 + 136);
    goto LABEL_20;
  }

  id v14 = sub_100010B50("json");
  BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 40LL);
    *(_DWORD *)v37 = 138412802;
    *(void *)&v37[4] = v16;
    *(_WORD *)&v37[12] = 2112;
    *(void *)&v37[14] = v17;
    *(_WORD *)&v37[22] = 2112;
    v38 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "ignoring client '%@' for %@ because last upload too recent: %@",  v37,  0x20u);
  }

LABEL_38:
LABEL_39:
}

void sub_10000B864(id a1)
{
  v4[0] = SFAnalyticsTopicKeySync;
  v4[1] = SFAnalyticsTopicCloudServices;
  v4[2] = SFAnalyticsTopicTransparency;
  v4[3] = SFAnalyticsTopicSWTransparency;
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 4LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  id v3 = (void *)qword_10001DB80;
  qword_10001DB80 = v2;
}

void sub_10000B930(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100010B50("postprocess");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
    int v11 = 138412546;
    double v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting upload date (%@) for client: %@",  (uint8_t *)&v11,  0x16u);
  }

  [v3 setUploadDate:*(void *)(a1 + 32)];
  if (*(_BYTE *)(a1 + 48))
  {
    id v8 = sub_100010B50("postprocess");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
      int v11 = 138412290;
      double v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Clearing collected data for client: %@",  (uint8_t *)&v11,  0xCu);
    }

    [v3 clearAllData];
  }
}

void sub_10000BA9C(uint64_t a1, void *a2, void *a3)
{
  id v30 = a2;
  uint64_t v5 = SFAnalyticsColumnSuccessCount;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);
  id v8 = [v7 integerValue];

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:SFAnalyticsColumnHardFailureCount]);
  unint64_t v10 = (unint64_t)[v9 integerValue];

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:SFAnalyticsColumnSoftFailureCount]);
  unint64_t v12 = (unint64_t)[v11 integerValue];

  if (![*(id *)(a1 + 32) terseMetrics])
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
    uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-success", v30));
    [v24 setObject:v23 forKeyedSubscript:v25];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
    uint64_t v27 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-hardfail",  v30));
    [v27 setObject:v26 forKeyedSubscript:v28];

    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
    id v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v22 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-softfail", v30);
    goto LABEL_12;
  }

  if (v10 | v12) {
    BOOL v13 = v8 == 0LL;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
    BOOL v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-s", v30));
    [v15 setObject:v14 forKeyedSubscript:v16];
  }

  if (v10)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
    uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-h", v30));
    [v18 setObject:v17 forKeyedSubscript:v19];
  }

  if (v12)
  {
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
    id v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v22 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-f", v30);
LABEL_12:
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v22);
    [v21 setObject:v20 forKeyedSubscript:v29];
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) += v8;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) += v10;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) += v12;
}

void sub_10000BDE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sampleStatisticsForSamples:a3 withName:a2]);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addEntriesFromDictionary:v4];
}

void sub_10000BE38(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 56) <= a3)
  {
    *a4 = 1;
  }

  else
  {
    id v8 = objc_autoreleasePoolPush();
    if ([*(id *)(a1 + 32) prepareEventForUpload:v7 linkedUUID:*(void *)(a1 + 40)])
    {
      if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v7))
      {
        [*(id *)(a1 + 48) addObject:v7];
      }

      else
      {
        int v9 = sub_100010B50("SecError");
        unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v18 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "supd: Replacing event with errorEvent because invalid JSON: %@",  buf,  0xCu);
        }

        uint64_t v11 = SFAnalyticsEventType;
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:SFAnalyticsEventType]);
        v15[0] = v11;
        v15[1] = SFAnalyticsEventErrorDestription;
        v16[0] = SFAnalyticsEventTypeErrorEvent;
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"JSON:%@",  v12));
        v16[1] = v13;
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

        [*(id *)(a1 + 48) addObject:v14];
      }
    }

    objc_autoreleasePoolPop(v8);
  }
}

void sub_10000C004(uint64_t a1, void *a2)
{
  id v3 = a2;
}

void sub_10000C050(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v7]);

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

void sub_10000C0C4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) == 0)
    {
      id v18 = (objc_class *)objc_opt_class(v6);
      uint64_t v19 = sub_100010B50("SecError");
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 40LL);
      id v21 = NSStringFromClass(v18);
      BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      int v25 = 138412546;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = v13;
      BOOL v15 = "Received the wrong kind of response for %@: %@";
      uint64_t v16 = v9;
      uint32_t v17 = 22;
      goto LABEL_13;
    }

    int v9 = (os_log_s *)v6;
    if ((uint64_t)-[os_log_s statusCode](v9, "statusCode") < 200
      || (uint64_t)-[os_log_s statusCode](v9, "statusCode") > 299)
    {
      uint64_t v22 = sub_100010B50("upload");
      BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(os_log_s **)(a1 + 40);
        uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 40LL);
        int v25 = 138412802;
        uint64_t v26 = v24;
        __int16 v27 = 2112;
        uint64_t v28 = v23;
        __int16 v29 = 1024;
        unsigned int v30 = -[os_log_s statusCode](v9, "statusCode");
        BOOL v15 = "Splunk upload for %@ unexpected status to URL: %@ -- status: %d";
        uint64_t v16 = v13;
        uint32_t v17 = 28;
        goto LABEL_13;
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
      unint64_t v12 = sub_100010B50("upload");
      BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 40LL);
        int v25 = 138412290;
        uint64_t v26 = v14;
        BOOL v15 = "Splunk upload success for %@";
        uint64_t v16 = v13;
        uint32_t v17 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v25, v17);
      }
    }

    goto LABEL_15;
  }

  id v8 = sub_100010B50("SecError");
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40LL);
    int v25 = 138412546;
    uint64_t v26 = v10;
    __int16 v27 = 2112;
    uint64_t v28 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Error in uploading the events to splunk for %@: %@",  (uint8_t *)&v25,  0x16u);
  }

LABEL_33:
}

LABEL_16:
      uint64_t v10 = (char *)v10 + 1;
    }

    while (v10 != v78);
    v66 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v89,  v98,  16LL);
    v78 = v66;
  }

  while (v66);
LABEL_83:

  return v73 & 1;
}

void sub_10000DAF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}
}

void sub_10000EB8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uploadDate]);

  [v7 setObject:v4 forKeyedSubscript:@"uploadDate"];
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  [v5 setObject:v7 forKeyedSubscript:v6];
}

void sub_10000EC2C(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1[4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1[5] name]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Client: %@\n", v5));
  [v4 appendString:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 allEvents]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = a1[4];
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( [a1[6] sysdiagnoseStringForEventRecord:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)]);
        [v12 appendFormat:@"%@\n", v13];

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  if (![v7 count]) {
    [a1[4] appendString:@"No data to report for this client\n"];
  }
}

void sub_10000EDC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    id v5 = &stru_100019AA8;
  }
  else {
    id v5 = @", ";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@ : %@",  v5,  a2,  a3));
  [v4 appendString:v6];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
}

void sub_10000EE58(uint64_t a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000EED8;
  handler[3] = &unk_100018840;
  id v2 = *(id *)(a1 + 32);
  xpc_activity_register("com.apple.securityuploadd.triggerupload", XPC_ACTIVITY_CHECK_IN, handler);
}

void sub_10000EED8(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  id v4 = sub_100010B50("supd");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    xpc_activity_state_t v7 = state;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "hit xpc activity trigger, state: %ld",  (uint8_t *)&v6,  0xCu);
  }

  if (state == 2) {
    [*(id *)(a1 + 32) performRegularlyScheduledUpload];
  }
}

void sub_10000F3B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000FDAC(id a1, const char *a2)
{
}

void sub_10000FDB4(id a1, const char *a2)
{
}

void sub_10000FDBC(id a1, const char *a2)
{
}

void sub_10000FDC4(id a1, const char *a2)
{
}

void sub_10000FDCC(id a1, const char *a2)
{
}

void sub_10000FDD4(id a1, const char *a2)
{
}

void sub_10000FDDC(id a1, const char *a2)
{
}

void sub_10000FDE4(id a1, const char *a2)
{
}

void sub_10000FDEC(id a1, const char *a2)
{
}

void sub_10000FDF4(id a1, const char *a2)
{
}

void sub_10000FDFC(id a1, const char *a2)
{
}

void sub_10000FE04(id a1, const char *a2)
{
}

void sub_10000FE0C(id a1, const char *a2)
{
}

void sub_10000FE14(id a1, const char *a2)
{
  int v3 = mkpath_np(a2, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      id v5 = sub_100010B50("SecError");
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315394;
        id v12 = a2;
        __int16 v13 = 2080;
        __int128 v14 = strerror(v4);
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "could not create path: %s (%s)",  (uint8_t *)&v11,  0x16u);
      }
    }
  }

  if (chmod(a2, 0x1FFu))
  {
    xpc_activity_state_t v7 = sub_100010B50("SecError");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = __error();
      uint64_t v10 = strerror(*v9);
      int v11 = 136315394;
      id v12 = a2;
      __int16 v13 = 2080;
      __int128 v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "failed to change permissions of %s: %s",  (uint8_t *)&v11,  0x16u);
    }
  }

uint64_t sub_10000FF74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000FF84(uint64_t a1)
{
}

void sub_10000FF8C(uint64_t a1, char *a2)
{
  if (chmod(a2, 0x1A4u))
  {
    int v4 = *__error();
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    id v5 = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"failed to change permissions of %s: %s",  a2,  strerror(v4));
    int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v18 = v6;
    xpc_activity_state_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v4,  v7));
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (v4 != 2)
    {
      int v11 = sub_100010B50("SecError");
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315394;
        __int128 v14 = a2;
        __int16 v15 = 2080;
        __int128 v16 = strerror(v4);
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "failed to change permissions of %s: %s",  buf,  0x16u);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    }
  }

BOOL sub_10001013C(id a1, NSURL *a2, NSError *a3)
{
  int v4 = a2;
  id v5 = a3;
  int v6 = -[NSURL fileSystemRepresentation](v4, "fileSystemRepresentation");
  xpc_activity_state_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedFailureReason](v5, "localizedFailureReason"));

  id v8 = v7;
  uint64_t v9 = (const char *)[v8 UTF8String];

  uint64_t v10 = sub_100010B50("SecError");
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = "unknown error";
    if (v9) {
      id v12 = v9;
    }
    int v14 = 136315394;
    __int16 v15 = v6;
    __int16 v16 = 2080;
    NSErrorUserInfoKey v17 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "unable to fix permissions for %s: %s",  (uint8_t *)&v14,  0x16u);
  }

  return 1;
}

void sub_100010258(uint64_t a1, char *a2)
{
  if (chown(a2, 0x11Au, 0x11Au))
  {
    int v4 = *__error();
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    id v5 = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"failed to change owner of %s: %s",  a2,  strerror(v4));
    int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v18 = v6;
    xpc_activity_state_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v4,  v7));
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (v4 != 2)
    {
      int v11 = sub_100010B50("SecError");
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315394;
        int v14 = a2;
        __int16 v15 = 2080;
        __int16 v16 = strerror(v4);
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "failed to change owner of %s: %s",  buf,  0x16u);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    }
  }

void sub_1000107C4(id a1)
{
  if (getuid() == 282 || !getuid() && gTrustd) {
    byte_10001DBB0 = 1;
  }
}

void sub_100010804(id a1)
{
  id v1 = sub_100010C4C(@"private/var/protected/", (uint64_t)@"trustd");
  sub_100010D34(v1, (uint64_t)&stru_100018C60);
}

void sub_100010830(id a1, const char *a2)
{
  int v3 = mkpath_np(a2, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      id v5 = sub_100010B50("SecError");
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        uint64_t v9 = a2;
        __int16 v10 = 2080;
        int v11 = strerror(v4);
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "could not create path: %s (%s)",  (uint8_t *)&v8,  0x16u);
      }
    }
  }

  if (qword_10001DBB8 != -1) {
    dispatch_once(&qword_10001DBB8, &stru_100018C00);
  }
  if (byte_10001DBB0 == 1)
  {
    uid_t v7 = getuid();
    chown(a2, v7, v7);
    chmod(a2, 0x1EDu);
  }

const void *sub_100010968(const __CFString *a1)
{
  if (a1) {
    id v1 = a1;
  }
  else {
    id v1 = @"logging";
  }
  os_unfair_lock_lock_with_options(&unk_10001DBC8, 0x10000LL);
  Mutable = (const __CFDictionary *)qword_10001DBD0;
  if (!qword_10001DBD0)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, &kCFCopyStringDictionaryKeyCallBacks, 0LL);
    qword_10001DBD0 = (uint64_t)Mutable;
  }

  Value = CFDictionaryGetValue(Mutable, v1);
  if (!Value)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000LL;
    v7[2] = sub_100010B14;
    v7[3] = &unk_100018C80;
    v7[4] = v1;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 0x40000000LL;
    v8[2] = sub_100010C40;
    v8[3] = &unk_100018CD0;
    v8[4] = v7;
    CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
    if (CStringPtr)
    {
      strlen(CStringPtr);
      sub_100010C40((uint64_t)v8);
    }

    else
    {
      CFIndex usedBufLen = 0LL;
      CFIndex Length = CFStringGetLength(v1);
      v11.location = 0LL;
      v11.length = Length;
      CFStringGetBytes(v1, v11, 0x8000100u, 0, 0, 0LL, 0LL, &usedBufLen);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 0x40000000LL;
      v9[2] = sub_100010BCC;
      v9[3] = &unk_100018CA8;
      v9[6] = 0LL;
      v9[7] = Length;
      v9[8] = usedBufLen;
      v9[4] = v8;
      v9[5] = v1;
      sub_100010E20(usedBufLen + 1, (uint64_t)v9);
    }

    Value = CFDictionaryGetValue((CFDictionaryRef)qword_10001DBD0, v1);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001DBC8);
  return Value;
}

void sub_100010B14(uint64_t a1, const char *a2)
{
  id v2 = (__CFDictionary *)qword_10001DBD0;
  int v3 = *(const void **)(a1 + 32);
  os_log_t v4 = os_log_create("com.apple.securityd", a2);
  CFDictionaryAddValue(v2, v3, v4);
}

const void *sub_100010B50(const char *a1)
{
  if (!a1) {
    return sub_100010968(0LL);
  }
  id v2 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x600u);
  int v3 = sub_100010968(v2);
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

uint64_t sub_100010BCC(uint64_t result, int a2, UInt8 *buffer)
{
  if (buffer)
  {
    uint64_t v4 = result;
    id v5 = *(const __CFString **)(result + 40);
    CFRange v8 = *(CFRange *)(v4 + 48);
    CFIndex v6 = *(void *)(v4 + 64);
    CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16LL))();
  }

  return result;
}

uint64_t sub_100010C40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

CFURLRef sub_100010C4C(const __CFString *a1, uint64_t a2)
{
  uint64_t v4 = CFURLCreateWithFileSystemPath(0LL, @"/", kCFURLPOSIXPathStyle, 1u);
  if (a2)
  {
    id v5 = kCFAllocatorDefault;
    Copy = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@/%@", a1, a2);
  }

  else
  {
    if (!a1) {
      goto LABEL_10;
    }
    id v5 = kCFAllocatorDefault;
    Copy = CFStringCreateCopy(kCFAllocatorDefault, a1);
  }

  uid_t v7 = Copy;
  if (v4 && Copy)
  {
    CFURLRef v8 = CFURLCreateCopyAppendingPathComponent(v5, v4, Copy, a2 == 0);
    CFRelease(v7);
LABEL_11:
    CFRelease(v4);
    return v8;
  }

  if (Copy) {
    CFRelease(Copy);
  }
LABEL_10:
  CFURLRef v8 = 0LL;
  if (v4) {
    goto LABEL_11;
  }
  return v8;
}

void sub_100010D34(const __CFURL *a1, uint64_t a2)
{
  if (a1)
  {
    memset(__b, 170, sizeof(__b));
    CFURLGetFileSystemRepresentation(a1, 0, __b, 1024LL);
    (*(void (**)(uint64_t, UInt8 *))(a2 + 16))(a2, __b);
    CFRelease(a1);
  }

void sub_100010DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010C4C(@"Library/Keychains", a1);
  sub_100010D34(v4, a2);
}

void sub_100010E20(size_t __size, uint64_t a2)
{
  if (__size)
  {
    if (__size > 0x800)
    {
      uint64_t v4 = malloc(__size);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, __size, v4);
      if (v4) {
        free(v4);
      }
    }

    else
    {
      __chkstk_darwin();
      memset((char *)&v5 - ((__size + 15) & 0xFFFFFFFFFFFFFFF0LL), 170, __size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))( a2,  __size,  (char *)&v5 - ((__size + 15) & 0xFFFFFFFFFFFFFFF0LL));
    }
  }

  else
  {
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0LL, 0LL);
  }

id objc_msgSend_copyEvents_failures_forUpload_participatingClients_force_linkedUUID_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyEvents:failures:forUpload:participatingClients:force:linkedUUID:error:");
}

id objc_msgSend_getSharedClientNamed_orCreateWithStorePath_requireDeviceAnalytics_requireiCloudAnalytics_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:");
}

id objc_msgSend_initFromExistingClient_name_requireDeviceAnalytics_requireiCloudAnalytics_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFromExistingClient:name:requireDeviceAnalytics:requireiCloudAnalytics:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}