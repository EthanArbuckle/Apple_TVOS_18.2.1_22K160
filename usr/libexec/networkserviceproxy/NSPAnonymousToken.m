@interface NSPAnonymousToken
+ (id)description;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6;
@end

@implementation NSPAnonymousToken

+ (id)description
{
  return @"AnonToken";
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
    uint64_t v22 = nplog_obj(v12, v13, v14);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "%s called with null urlRequest",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_18;
  }

  if (!v10)
  {
    uint64_t v24 = nplog_obj(v12, v13, v14);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "%s called with null tokenFetchURLSession",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_18;
  }

  if (!v11)
  {
    uint64_t v25 = nplog_obj(v12, v13, v14);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "%s called with null tokenActivationQuery",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_18;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 authInfo]);

  if (!v16)
  {
    uint64_t v26 = nplog_obj(v17, v18, v19);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_FAULT,  "%s called with null tokenActivationQuery.authInfo",  (uint8_t *)&buf,  0xCu);
    }

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6
{
}

@end