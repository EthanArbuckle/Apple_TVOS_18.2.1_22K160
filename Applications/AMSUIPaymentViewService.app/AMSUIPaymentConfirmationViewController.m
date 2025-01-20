@interface AMSUIPaymentConfirmationViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (UIViewController)contentController;
- (void)_dismissViewServiceWithResult:(id)a3;
- (void)_dismissWithPurchaseResult:(id)a3;
- (void)_menuButtonPressed;
- (void)setContentController:(id)a3;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation AMSUIPaymentConfirmationViewController

- (void)_dismissViewServiceWithResult:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AMSUIPaymentConfirmationViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  [v5 dismissWithResult:v4];
}

- (void)_dismissWithPurchaseResult:(id)a3
{
  uint64_t v5 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v5));
  -[AMSUIPaymentConfirmationViewController _dismissViewServiceWithResult:](self, "_dismissViewServiceWithResult:", v4);
}

- (void)_menuButtonPressed
{
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedPurchaseConfig](&OBJC_CLASS___AMSLogConfig, "sharedPurchaseConfig"));
  if (!v6) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = objc_opt_class(self);
    uint64_t v11 = v10;
    if (v9)
    {
      uint64_t v12 = AMSLogKey();
      uint64_t v3 = objc_claimAutoreleasedReturnValue(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v11,  v3));
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v10));
    }

    *(_DWORD *)buf = 138543618;
    v42 = v13;
    __int16 v43 = 2114;
    id v44 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ viewServiceBeginPresentationWithOptions called. options = %{public}@",  buf,  0x16u);
    if (v9)
    {

      v13 = (void *)v3;
    }
  }

  uint64_t v14 = objc_opt_self(&OBJC_CLASS___NSDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = objc_opt_self(&OBJC_CLASS___NSNumber);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = objc_opt_self(&OBJC_CLASS___NSString);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = objc_opt_self(&OBJC_CLASS___NSData);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v15, v17, v19, v21, 0LL));

  v23 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"AMSPaymentViewServicePresentationContextDataKey"]);
  id v40 = 0LL;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v22,  v23,  &v40));
  id v25 = v40;

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100003210;
  v39[3] = &unk_10000C660;
  v39[4] = self;
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[AMSUIPaymentViewServiceContentViewControllerProvider makeContentViewControllerWithContext:completion:]( &OBJC_CLASS___AMSUIPaymentViewServiceContentViewControllerProvider,  "makeContentViewControllerWithContext:completion:",  v24,  v39));
  -[AMSUIPaymentConfirmationViewController setContentController:](self, "setContentController:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[AMSUIPaymentConfirmationViewController contentController](self, "contentController"));
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[AMSUIPaymentConfirmationViewController contentController](self, "contentController"));
    [v28 setModalPresentationStyle:8];

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AMSUIPaymentConfirmationViewController contentController](self, "contentController"));
    [v29 setOverrideUserInterfaceStyle:2];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[AMSUIPaymentConfirmationViewController contentController](self, "contentController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 presentationController]);

    uint64_t v32 = objc_opt_class(&OBJC_CLASS____UIProgressiveBlurPresentationController);
    if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0) {
      id v33 = v31;
    }
    else {
      id v33 = 0LL;
    }

    [v33 setBlurStyle:4009];
    v34 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed");
    -[UITapGestureRecognizer setAllowedPressTypes:](v34, "setAllowedPressTypes:", &off_10000CB00);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[AMSUIPaymentConfirmationViewController contentController](self, "contentController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 view]);
    [v36 addGestureRecognizer:v34];

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[AMSUIPaymentConfirmationViewController contentController](self, "contentController"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10000321C;
    v38[3] = &unk_10000C688;
    v38[4] = self;
    -[AMSUIPaymentConfirmationViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v37,  1LL,  v38);
  }
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsConfig"));
  if (!v9) {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = AMSLogKey();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = objc_opt_class(self);
    uint64_t v14 = v13;
    if (v12)
    {
      uint64_t v15 = AMSLogKey();
      uint64_t v4 = objc_claimAutoreleasedReturnValue(v15);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v14,  v4));
    }

    else
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v13));
    }

    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v16;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ viewServiceEndPresentationWithOptions called. options = %{public}@",  buf,  0x16u);
    if (v12)
    {

      uint64_t v16 = (void *)v4;
    }
  }

  -[AMSUIPaymentConfirmationViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  v8);
}

+ (id)_exportedInterface
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsConfig"));
  if (!v3) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = objc_opt_class(a1);
    uint64_t v8 = v7;
    if (v6)
    {
      uint64_t v9 = AMSLogKey();
      a1 = (id)objc_claimAutoreleasedReturnValue(v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: [%@] ", v8, a1));
    }

    else
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v7));
    }

    *(_DWORD *)buf = 138543362;
    id v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ _exportedInterface called.",  buf,  0xCu);
    if (v6)
    {

      id v10 = a1;
    }
  }

  uint64_t v11 = objc_opt_self(&OBJC_CLASS___NSDictionary);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___NSNumber);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = objc_opt_self(&OBJC_CLASS___NSString);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = objc_opt_self(&OBJC_CLASS___NSData);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v12, v14, v16, v18, 0LL));

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  [v20 setClasses:v19 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v20 setClasses:v19 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];

  return v20;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (UIViewController)contentController
{
  return self->_contentController;
}

- (void)setContentController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end