@interface NSPAnisette
+ (id)description;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6;
@end

@implementation NSPAnisette

+ (id)description
{
  return @"Anisette";
}

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v15 = (void (**)(void, void, void, void, void))v12;
  if (!v9)
  {
    uint64_t v25 = nplog_obj(v12, v13, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v15[2](v15, 2LL, 0LL, 0LL, 0LL);
      goto LABEL_6;
    }

    *(_DWORD *)buf = 136315138;
    v32 = "+[NSPAnisette sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:]";
    v27 = "%s called with null urlRequest";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_FAULT, v27, buf, 0xCu);
    goto LABEL_10;
  }

  if (!v11)
  {
    uint64_t v28 = nplog_obj(v12, v13, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v32 = "+[NSPAnisette sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:]";
    v27 = "%s called with null tokenActivationQuery";
    goto LABEL_12;
  }

  objc_msgSend(v9, "ak_addClientInfoHeader");
  objc_msgSend(v9, "ak_addDeviceUDIDHeader");
  [v11 setAuthType:2];
  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 data]);
  [v9 setHTTPBody:v16];

  ++dword_100117250;
  uint64_t v20 = nplog_obj(v17, v18, v19);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (char *)objc_claimAutoreleasedReturnValue([v9 URL]);
    *(_DWORD *)buf = 138412290;
    v32 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sending request for %@", buf, 0xCu);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLSession sharedURLSession](&OBJC_CLASS___AKURLSession, "sharedURLSession"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000A7924;
  v29[3] = &unk_1000FAEA8;
  v30 = v15;
  id v24 = [v23 beginDataTaskWithRequest:v9 completionHandler:v29];

LABEL_6:
}

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v16 = (void (**)(void, void, void, void, void))v13;
  if (!v10)
  {
    uint64_t v26 = nplog_obj(v13, v14, v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v16[2](v16, 2LL, 0LL, 0LL, 0LL);
      goto LABEL_6;
    }

    *(_DWORD *)buf = 136315138;
    v33 = "+[NSPAnisette sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
    uint64_t v28 = "%s called with null urlRequest";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
    goto LABEL_10;
  }

  if (!v12)
  {
    uint64_t v29 = nplog_obj(v13, v14, v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v33 = "+[NSPAnisette sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
    uint64_t v28 = "%s called with null messageBody";
    goto LABEL_12;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  [v10 addValue:v17 forHTTPHeaderField:@"Client-Auth-Type"];

  objc_msgSend(v10, "ak_addClientInfoHeader");
  objc_msgSend(v10, "ak_addDeviceUDIDHeader");
  id v18 = [v10 setHTTPBody:v12];
  ++dword_100117250;
  uint64_t v21 = nplog_obj(v18, v19, v20);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (char *)objc_claimAutoreleasedReturnValue([v10 URL]);
    *(_DWORD *)buf = 138412290;
    v33 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending request for %@", buf, 0xCu);
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLSession sharedURLSession](&OBJC_CLASS___AKURLSession, "sharedURLSession"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000A7BC8;
  v30[3] = &unk_1000FAEA8;
  v31 = v16;
  id v25 = [v24 beginDataTaskWithRequest:v10 completionHandler:v30];

LABEL_6:
}

@end