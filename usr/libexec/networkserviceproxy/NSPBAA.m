@interface NSPBAA
+ (id)description;
+ (void)authenticationFailure;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6;
@end

@implementation NSPBAA

+ (id)description
{
  return @"BAA";
}

+ (void)authenticationFailure
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSPDeviceIdentityCertificate sharedDeviceIdentity]( &OBJC_CLASS___NSPDeviceIdentityCertificate,  "sharedDeviceIdentity"));
  [v2 deviceIdentityAuthenticationFailed];
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
    uint64_t v18 = nplog_obj(v12, v13, v14);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:]";
      v20 = "%s called with null urlRequest";
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
    uint64_t v16 = nplog_obj(v12, v13, v14);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
      uint64_t v18 = "%s called with null urlRequest";
      goto LABEL_13;
    }

@end