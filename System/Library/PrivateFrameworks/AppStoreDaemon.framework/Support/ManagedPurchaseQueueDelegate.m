@interface ManagedPurchaseQueueDelegate
- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
@end

@implementation ManagedPurchaseQueueDelegate

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a6;
  id v11 = sub_1002C61AC((uint64_t)&OBJC_CLASS___Daemon);

  id v12 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 BOOLForKey:@"disable-vpp-interactive-authentication"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueWithError:0]);

  if (v15 && [v15 BOOLValue])
  {
    uint64_t v16 = ASDLogHandleForCategory(41LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v9 logUUID]);
      *(_DWORD *)buf = 138412290;
      v28 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] Interactive authentication requested but has been disabled in the bag",  buf,  0xCu);
    }

    uint64_t v19 = ASDErrorWithUserInfoAndFormat(512LL, 0LL, @"Interactive authentication has been disabled");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v10[2](v10, 0LL, v20);
  }

  else
  {
    uint64_t v21 = ASDLogHandleForCategory(41LL);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v9 logUUID]);
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[%@] Attempting interactive authentication for volume purchase",  buf,  0xCu);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100240984;
    v24[3] = &unk_1003EBD80;
    id v25 = v9;
    v26 = v10;
    sub_100278198((uint64_t)&OBJC_CLASS___InteractiveRequestPresenter, v8, v24);

    v20 = v25;
  }
}

@end