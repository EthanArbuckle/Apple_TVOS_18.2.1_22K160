@interface MSDFMHSession
- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5;
@end

@implementation MSDFMHSession

- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v10 = (MSDSessionFMHTrustEvaluate *)objc_claimAutoreleasedReturnValue([v8 info]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionFMHTrustEvaluate fmhURLOverride](v10, "fmhURLOverride"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 protectionSpace]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 host]);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionFMHTrustEvaluate fmhURLOverride](v10, "fmhURLOverride"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 host]);
      unsigned int v16 = [v13 isEqualToString:v15];

      if (v16) {
        goto LABEL_6;
      }
    }
  }

  v10 = objc_alloc_init(&OBJC_CLASS___MSDSessionFMHTrustEvaluate);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v7 protectionSpace]);
  unsigned int v18 = -[MSDSessionFMHTrustEvaluate trustServer:isRedirect:]( v10,  "trustServer:isRedirect:",  [v17 serverTrust],  objc_msgSend(v8, "redirected"));

  if (v18)
  {
LABEL_6:
    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 protectionSpace]);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialForTrust:]( NSURLCredential,  "credentialForTrust:",  [v19 serverTrust]));

    v9[2](v9, 0LL, v20);
    goto LABEL_10;
  }

  id v21 = sub_10003A95C();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10009288C(v8, v22);
  }

  v9[2](v9, 2LL, 0LL);
LABEL_10:
}

@end