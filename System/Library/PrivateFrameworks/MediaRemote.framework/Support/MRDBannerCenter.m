@interface MRDBannerCenter
- (MRBannerDelegate)delegate;
- (MRBannerRequestRepresentable)activeRequest;
- (MRBannerUIControllable)bannerControllable;
- (MRDBannerCenter)init;
- (MRDBannerCenter)initWithDelegate:(id)a3;
- (void)bannerWithIdentifier:(id)a3 postedEvent:(unint64_t)a4;
- (void)dismissAllBannerRequests;
- (void)dismissBannerWithIdentifier:(id)a3;
- (void)invalidated;
- (void)postBannerRequest:(id)a3;
- (void)setActiveRequest:(id)a3;
- (void)setBannerControllable:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MRDBannerCenter

- (MRDBannerCenter)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRDBannerCenter;
  v5 = -[MRDBannerCenter init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[MRDUIControllerProvider bannerUIControllerWithDelegate:]( &OBJC_CLASS___MRDUIControllerProvider,  "bannerUIControllerWithDelegate:",  v5));
    -[MRDBannerCenter setBannerControllable:](v5, "setBannerControllable:", v6);

    -[MRDBannerCenter setDelegate:](v5, "setDelegate:", v4);
  }

  return v5;
}

- (MRDBannerCenter)init
{
  return -[MRDBannerCenter initWithDelegate:](self, "initWithDelegate:", 0LL);
}

- (MRBannerRequestRepresentable)activeRequest
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeRequest;
  objc_sync_exit(v2);

  return v3;
}

- (void)setActiveRequest:(id)a3
{
  id v4 = (MRBannerRequestRepresentable *)a3;
  obj = self;
  objc_sync_enter(obj);
  activeRequest = obj->_activeRequest;
  obj->_activeRequest = v4;

  objc_sync_exit(obj);
}

- (void)postBannerRequest:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(13LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
    int v14 = 134218242;
    v15 = self;
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].BC <%p> postBannerRequest: %@",  (uint8_t *)&v14,  0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDBannerCenter activeRequest](self, "activeRequest"));
  if (v9)
  {
    uint64_t v11 = _MRLogForCategory(13LL, v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDBannerCenter activeRequest](self, "activeRequest"));
      int v14 = 134218242;
      v15 = self;
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].BC <%p> already presenting %@, bailing out",  (uint8_t *)&v14,  0x16u);
    }
  }

  else
  {
    -[MRDBannerCenter setActiveRequest:](self, "setActiveRequest:", v4);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MRDBannerCenter bannerControllable](self, "bannerControllable"));
    -[os_log_s postBannerRequest:](v12, "postBannerRequest:", v4);
  }
}

- (void)dismissBannerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(13LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].BC <%p> dismissBannerWithIdentifier: %@",  (uint8_t *)&v9,  0x16u);
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDBannerCenter bannerControllable](self, "bannerControllable"));
  [v8 dismissBannerWithIdentifier:v4];
}

- (void)dismissAllBannerRequests
{
  uint64_t v3 = _MRLogForCategory(13LL, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].BC <%p> dismissAllBannerRequests",  (uint8_t *)&v6,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDBannerCenter bannerControllable](self, "bannerControllable"));
  [v5 dismissAllBanners];
}

- (void)bannerWithIdentifier:(id)a3 postedEvent:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v8 = _MRLogForCategory(13LL, v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218498;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].BC <%p> bannerWithIdentifier: %@ postedEvent: %lu",  (uint8_t *)&v11,  0x20u);
  }

  if (!a4) {
    -[MRDBannerCenter setActiveRequest:](self, "setActiveRequest:", 0LL);
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDBannerCenter delegate](self, "delegate"));
  [v10 bannerWithRequestIdentifier:v6 didReceiveEvent:a4];
}

- (void)invalidated
{
}

- (MRBannerDelegate)delegate
{
  return (MRBannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MRBannerUIControllable)bannerControllable
{
  return self->_bannerControllable;
}

- (void)setBannerControllable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end