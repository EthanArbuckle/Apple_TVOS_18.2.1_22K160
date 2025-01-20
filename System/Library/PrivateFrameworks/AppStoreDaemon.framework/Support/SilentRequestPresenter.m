@interface SilentRequestPresenter
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5;
@end

@implementation SilentRequestPresenter

- (void)presentAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_10027775C;
  v31 = sub_10027776C;
  id v32 = 0LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100278C48;
  v23[3] = &unk_1003EF6D8;
  id v8 = v6;
  id v24 = v8;
  id v9 = v7;
  id v25 = v9;
  v26 = &v27;
  v10 = objc_retainBlock(v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 options]);
  id v12 = [v11 authenticationType];

  if ((unint64_t)v12 > 1)
  {
    uint64_t v22 = ASDErrorWithUserInfoAndFormat(533LL, 0LL, @"Blocking non-silent authentication from silent presenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v22);
    ((void (*)(void *, void, void *))v10[2])(v10, 0LL, v21);
  }

  else
  {
    uint64_t v13 = ASDLogHandleForCategory(14LL);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 logKey]);
      *(_DWORD *)buf = 138543362;
      v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Presenting authentication request silently",  buf,  0xCu);
    }

    sub_100239924(v8);
    id v16 = objc_alloc(&OBJC_CLASS___AMSAuthenticateTask);
    id v17 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v19 = [v16 initWithRequest:v8 bag:v18];
    v20 = (void *)v28[5];
    v28[5] = (uint64_t)v19;

    [(id)v28[5] setDelegate:self];
    v21 = (void *)objc_claimAutoreleasedReturnValue([(id)v28[5] performAuthentication]);
    [v21 addFinishBlock:v10];
  }

  _Block_object_dispose(&v27, 8);
}

- (void)presentDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = ASDLogHandleForCategory(14LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 logKey]);
    int v12 = 138543362;
    uint64_t v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Dialogs cannot be presented silently, failing request",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v10 = ASDErrorWithUserInfoAndFormat(534LL, 0LL, @"Dialogs cannot be presented silently");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v6) {
    v6[2](v6, 0LL, v11);
  }
  if (v5) {
    sub_100321984(v5, 0LL, v11, &stru_1003F3490);
  }
}

- (void)presentEngagementRequest:(id)a3 withClientInfo:(id)a4 resultHandler:(id)a5
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a5;
  uint64_t v8 = ASDLogHandleForCategory(14LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
    int v13 = 138543362;
    v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Engagements cannot be presented silently, failing request",  (uint8_t *)&v13,  0xCu);
  }

  uint64_t v11 = ASDErrorWithUserInfoAndFormat(536LL, 0LL, @"Engagement cannot be presented silently");
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v7) {
    v7[2](v7, 0LL, v12);
  }
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

@end