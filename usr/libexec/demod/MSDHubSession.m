@interface MSDHubSession
- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5;
@end

@implementation MSDHubSession

- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 info]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 endpoint]);

  unsigned int v12 = [v11 isEqualToString:@"/Register"];
  v13 = off_1000F8598;
  if (!v12) {
    v13 = off_1000F85A0;
  }
  id v14 = objc_alloc_init(*v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 protectionSpace]);
  unsigned int v16 = objc_msgSend( v14,  "trustServer:isRedirect:",  objc_msgSend(v15, "serverTrust"),  objc_msgSend(v8, "redirected"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 protectionSpace]);
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialForTrust:]( NSURLCredential,  "credentialForTrust:",  [v17 serverTrust]));

    v9[2](v9, 0LL, v18);
  }

  else
  {
    id v19 = sub_10003A95C();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10009288C(v8, v20);
    }

    v9[2](v9, 2LL, 0LL);
  }
}

@end