@interface _XPCInternalRequestToken
- (AMSProcessInfo)processInfo;
- (ASDSupportedDialogHandlers)supportedDialogHandlers;
- (BOOL)isInternal;
- (void)deliverAlertPresentationRequest:(id)a3 resultHandler:(id)a4;
- (void)deliverAuthenticateRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverDialogRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverEngagementRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverViewPresentationRequest:(id)a3 resultHandler:(id)a4;
@end

@implementation _XPCInternalRequestToken

- (BOOL)isInternal
{
  return 1;
}

- (void)deliverAlertPresentationRequest:(id)a3 resultHandler:(id)a4
{
  uint64_t v5 = ASDErrorDomain;
  id v6 = a4;
  uint64_t v7 = ASDErrorWithDescription(v5, 512LL, @"Unsupported request");
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v8);
}

- (void)deliverAuthenticateRequest:(id)a3 withResultHandler:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v16 options]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 proxyAppBundleID]);
  if (v8) {
    goto LABEL_5;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 proxyAppName]);
  if (v8) {
    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_XPCInternalRequestToken processInfo](self, "processInfo"));

  if (v9)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_XPCInternalRequestToken processInfo](self, "processInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    sub_1002399F8(v16, v10);

LABEL_5:
  }

  id v11 = objc_alloc(&OBJC_CLASS___AMSAuthenticateTask);
  id v12 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v11 initWithRequest:v16 bag:v13];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 performAuthentication]);
  [v15 addFinishBlock:v6];
}

- (void)deliverDialogRequest:(id)a3 withResultHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = -[AMSSystemAlertDialogTask initWithRequest:]( objc_alloc(&OBJC_CLASS___AMSSystemAlertDialogTask),  "initWithRequest:",  v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSSystemAlertDialogTask present](v8, "present"));
  [v7 addFinishBlock:v5];
}

- (void)deliverEngagementRequest:(id)a3 withResultHandler:(id)a4
{
  uint64_t v5 = ASDErrorDomain;
  id v6 = a4;
  uint64_t v7 = ASDErrorWithDescription(v5, 512LL, @"Unsupported request");
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v8);
}

- (void)deliverViewPresentationRequest:(id)a3 resultHandler:(id)a4
{
  uint64_t v5 = ASDErrorDomain;
  id v6 = a4;
  uint64_t v7 = ASDErrorWithDescription(v5, 512LL, @"Unsupported request");
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v8);
}

- (AMSProcessInfo)processInfo
{
  return (AMSProcessInfo *)sub_1001F4ADC((uint64_t)&OBJC_CLASS___AMSProcessInfo);
}

- (ASDSupportedDialogHandlers)supportedDialogHandlers
{
  return (ASDSupportedDialogHandlers *) -[ASDSupportedDialogHandlers initForInternalClient]( objc_alloc(&OBJC_CLASS___ASDSupportedDialogHandlers),  "initForInternalClient");
}

@end