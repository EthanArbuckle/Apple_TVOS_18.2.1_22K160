@interface SAAppsCheckRestriction
- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SAAppsCheckRestriction

- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void, void *))a4;
  v8 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppsCheckRestriction launchId](self, "launchId"));
  if (!v9)
  {
    v14 = 0LL;
    if (!v7) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  id v10 = [off_1005735A8() serviceWithDefaultShellEndpoint];
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v11)
  {
    uint64_t v16 = 0LL;
    if ([v11 canOpenApplication:v9 reason:&v16])
    {
      v13 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);

      v8 = v13;
    }

    v14 = 0LL;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
  }

  if (v7)
  {
LABEL_10:
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 createResponseWithReplyCommand:v8]);
    v7[2](v7, v15, 0LL, v14);
  }

@end