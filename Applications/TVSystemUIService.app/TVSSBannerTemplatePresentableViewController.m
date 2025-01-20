@interface TVSSBannerTemplatePresentableViewController
- (BNTemplateContentProvidingSpecifying)templateContentProvidingSpecification;
- (BOOL)hasPrimaryAction;
- (BOOL)isTemplateContent;
- (TVSPBannerConfiguration)bannerConfiguration;
- (TVSPMarqueeable)marqueable;
- (TVSSBannerTemplate)bannerTemplate;
- (TVSSBannerTemplatePresentableViewController)initWithSpecification:(id)a3 serviceDomain:(id)a4 readyCompletion:(id)a5;
- (id)bannerContentView;
- (id)pillContentView;
- (id)timeoutDismissCompletionHandler;
- (void)dismissDueTimeoutWhenReadyWithCompletionHandler:(id)a3;
- (void)marqueeableDidChangeMarqueeState:(id)a3;
- (void)marqueeableDidEndMarquee:(id)a3;
- (void)setBannerConfiguration:(id)a3;
- (void)setBannerTemplate:(id)a3;
- (void)setTimeoutDismissCompletionHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSSBannerTemplatePresentableViewController

- (TVSSBannerTemplatePresentableViewController)initWithSpecification:(id)a3 serviceDomain:(id)a4 readyCompletion:(id)a5
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  unsigned __int8 v10 = 0;
  if ((objc_opt_respondsToSelector(location[0], "providesTemplateContent") & 1) != 0) {
    unsigned __int8 v10 = [location[0] providesTemplateContent];
  }
  char v14 = v10 & 1;
  if ((v10 & 1) == 0)
  {
    id v13 = BannerTemplateViewControllerLog();
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      sub_10000D28C((uint64_t)v19, (uint64_t)location[0]);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  v12,  "Presentable specification doesn't specify a presentable that provides template content. {specification=%@}",  v19,  0xCu);
    }

    objc_storeStrong(&v13, 0LL);
  }

  v5 = v18;
  v18 = 0LL;
  v11.receiver = v5;
  v11.super_class = (Class)&OBJC_CLASS___TVSSBannerTemplatePresentableViewController;
  v18 = -[TVSSBannerTemplatePresentableViewController initWithSpecification:serviceDomain:readyCompletion:]( &v11,  "initWithSpecification:serviceDomain:readyCompletion:",  location[0],  v16,  v15);
  objc_storeStrong((id *)&v18, v18);
  if (v18) {
    objc_storeStrong((id *)&v18->_templateContentProvidingSpecification, location[0]);
  }
  v7 = v18;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  return v7;
}

- (void)viewDidLoad
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSSBannerTemplatePresentableViewController;
  -[TVSSBannerTemplatePresentableViewController viewDidLoad](&v3, "viewDidLoad");
  id v2 = -[TVSSBannerTemplatePresentableViewController view](v5, "view");
  [v2 setClipsToBounds:0];

  if (sub_1000FB774(v5)) {
    sub_1000FB830((id *)v5);
  }
  else {
    sub_1000FBC6C((id *)v5);
  }
}

- (TVSSBannerTemplate)bannerTemplate
{
  id v13 = self;
  v12[1] = (id)a2;
  if (!self->_bannerTemplate)
  {
    v12[0] = sub_1000FC400((id *)v13);
    id v11 = 0LL;
    id v10 = 0LL;
    id v9 = 0LL;
    id v8 = 0LL;
    sub_1000FC5B4((id *)v13, &v9, &v8);
    objc_storeStrong(&v11, v9);
    objc_storeStrong(&v10, v8);
    id v7 = sub_1000FCC84((id *)v13);
    v6 = sub_1000FCFB8((id *)v13);
    id v2 = objc_alloc(&OBJC_CLASS___TVSSBannerTemplate);
    objc_super v3 = -[TVSSBannerTemplate _initWithTitle:subtitle:footer:leadingView:trailingView:]( v2,  "_initWithTitle:subtitle:footer:leadingView:trailingView:",  v12[0],  v11,  v10,  v7,  v6);
    bannerTemplate = v13->_bannerTemplate;
    v13->_bannerTemplate = v3;

    objc_storeStrong((id *)&v6, 0LL);
    objc_storeStrong(&v7, 0LL);
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v11, 0LL);
    objc_storeStrong(v12, 0LL);
  }

  return v13->_bannerTemplate;
}

- (TVSPBannerConfiguration)bannerConfiguration
{
  v33 = self;
  v32[1] = (id)a2;
  if (!self->_bannerConfiguration)
  {
    v21 = -[TVSSBannerPresentableViewController presentableUserInfo](v33, "presentableUserInfo");
    id v20 =  -[NSDictionary objectForKeyedSubscript:]( v21,  "objectForKeyedSubscript:",  TVSPBannerPresentableKeyConfiguration);
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSData);
    id v22 = sub_1000FD4A0(v20, v2);

    v31[1] = v22;
    v32[0] = v22;
    if (v22)
    {
      v31[0] = 0LL;
      uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSPBannerConfiguration);
      id v29 = v31[0];
      v19 = (TVSPBannerConfiguration *) +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v3,  v32[0],  &v29);
      objc_storeStrong(v31, v29);
      v30 = v19;
      if (!v19)
      {
        id v28 = BannerTemplateViewControllerLog();
        char v27 = 16;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
        {
          log = (os_log_s *)v28;
          os_log_type_t type = v27;
          id v18 = (id)BNEffectivePresentableDescription(v33);
          id v14 = v18;
          id v26 = v14;
          v17 = -[TVSSBannerPresentableViewController presentableUserInfo](v33, "presentableUserInfo");
          sub_100061C1C((uint64_t)v35, (uint64_t)v14, (uint64_t)v17, (uint64_t)v31[0]);
          _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "Failed to unarchive banner configuration. {presentable=%{public}@, userInfo=%@, error=%{public}@}",  v35,  0x20u);

          objc_storeStrong(&v26, 0LL);
        }

        objc_storeStrong(&v28, 0LL);
        SEL v4 = objc_alloc_init(&OBJC_CLASS___TVSPBannerConfiguration);
        v5 = v30;
        v30 = v4;
      }

      objc_storeStrong((id *)&v33->_bannerConfiguration, v30);
      objc_storeStrong((id *)&v30, 0LL);
      objc_storeStrong(v31, 0LL);
    }

    else
    {
      id v25 = BannerTemplateViewControllerLog();
      char v24 = 2;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
      {
        id v10 = (os_log_s *)v25;
        os_log_type_t v11 = v24;
        id v13 = (id)BNEffectivePresentableDescription(v33);
        id v9 = v13;
        id v23 = v9;
        os_log_type_t v12 = -[TVSSBannerPresentableViewController presentableUserInfo](v33, "presentableUserInfo");
        sub_100061BC8((uint64_t)v34, (uint64_t)v9, (uint64_t)v12);
        _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  v11,  "No banner configuration, using default. {presentable=%{public}@, userInfo=%@}",  v34,  0x16u);

        objc_storeStrong(&v23, 0LL);
      }

      objc_storeStrong(&v25, 0LL);
      v6 = objc_alloc_init(&OBJC_CLASS___TVSPBannerConfiguration);
      bannerConfiguration = v33->_bannerConfiguration;
      v33->_bannerConfiguration = v6;
    }

    objc_storeStrong(v32, 0LL);
  }

  return v33->_bannerConfiguration;
}

- (BOOL)isTemplateContent
{
  return 1;
}

- (id)bannerContentView
{
  id v2 = -[TVSSBannerTemplatePresentableViewController view](self, "view", a2);
  return self->_bannerContentView;
}

- (id)pillContentView
{
  id v2 = -[TVSSBannerTemplatePresentableViewController view](self, "view", a2);
  return self->_pillContentView;
}

- (BOOL)hasPrimaryAction
{
  id location[2] = self;
  location[1] = (id)a2;
  id v4 = sub_1000FD854((id *)self);
  location[0] = [v4 secondaryTemplateItemProvider];

  if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___BNTemplateViewProviding])
  {
    id v2 = [location[0] templateItemButtonConfiguration];
    BOOL v6 = v2 != 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)dismissDueTimeoutWhenReadyWithCompletionHandler:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSPMarqueeable marqueeState](v5->_marqueable, "marqueeState");
  if ((unint64_t)v3 <= 3) {
    __asm { BR              X8 }
  }

  objc_storeStrong(location, 0LL);
}

- (void)marqueeableDidChangeMarqueeState:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_timeoutDismissCompletionHandler && [location[0] marqueeState] == (id)1) {
    sub_1000FD640((uint64_t)v4);
  }
  objc_storeStrong(location, 0LL);
}

- (void)marqueeableDidEndMarquee:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  sub_1000FD640((uint64_t)v4);
  objc_storeStrong(location, 0LL);
}

- (void)setBannerTemplate:(id)a3
{
}

- (void)setBannerConfiguration:(id)a3
{
}

- (BNTemplateContentProvidingSpecifying)templateContentProvidingSpecification
{
  return self->_templateContentProvidingSpecification;
}

- (TVSPMarqueeable)marqueable
{
  return self->_marqueable;
}

- (id)timeoutDismissCompletionHandler
{
  return self->_timeoutDismissCompletionHandler;
}

- (void)setTimeoutDismissCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end