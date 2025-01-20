@interface NSPBAA_Anisette
+ (id)description;
+ (void)authenticationFailure;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6;
@end

@implementation NSPBAA_Anisette

+ (id)description
{
  return @"BAA_Anisette";
}

+ (void)authenticationFailure
{
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
    uint64_t v26 = nplog_obj(v12, v13, v14);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:c"
                                      "ompletionHandler:]";
      v28 = "%s called with null urlRequest";
      goto LABEL_13;
    }

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v15 = (void (**)(void, void, void, void, void))v12;
  if (!v9)
  {
    uint64_t v29 = nplog_obj(v12, v13, v14);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
      id v31 = "%s called with null urlRequest";
      goto LABEL_13;
    }

@end