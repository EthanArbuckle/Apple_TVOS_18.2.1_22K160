@interface MRDUIController
- (MRDUIController)initWithClientObject:(id)a3;
- (MRDUIController)initWithDelegate:(id)a3;
- (MRDUIControllerConnection)connection;
- (id)delegate;
- (id)server;
- (void)bannerDismissed;
- (void)bannerWithIdentifier:(id)a3 postedEvent:(id)a4;
- (void)dealloc;
- (void)dismissAllBanners;
- (void)dismissBannerWithIdentifier:(id)a3;
- (void)invalidate;
- (void)postBannerRequest:(id)a3;
@end

@implementation MRDUIController

- (MRDUIController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = -[MRDUIController initWithClientObject:](self, "initWithClientObject:", 0LL);
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_delegate, v4);
  }

  return v6;
}

- (MRDUIController)initWithClientObject:(id)a3
{
  id v4 = (MRDUIController *)a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MRDUIController;
  v6 = -[MRDUIController init](&v16, "init");
  if (v6)
  {
    uint64_t v7 = _MRLogForCategory(11LL, v5);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRUIController][D] <%p> Initializing direct controller.",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, v6);
    v9 = objc_alloc(&OBJC_CLASS___MRDUIControllerConnection);
    if (v4) {
      v10 = v4;
    }
    else {
      v10 = v6;
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100142C38;
    v14[3] = &unk_10039A668;
    objc_copyWeak(&v15, (id *)buf);
    v11 = -[MRDUIControllerConnection initWithClientObject:invalidationHandler:]( v9,  "initWithClientObject:invalidationHandler:",  v10,  v14);
    connection = v6->_connection;
    v6->_connection = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(11LL, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] <%p> Dealloc.", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDUIController;
  -[MRDUIController dealloc](&v5, "dealloc");
}

- (id)server
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIController connection](self, "connection"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 server]);

  return v3;
}

- (void)postBannerRequest:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(11LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRUIController][D] <%p> IPC postBannerWithConfiguration",  buf,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIController server](self, "server"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100142E68;
  v9[3] = &unk_100399508;
  v9[4] = self;
  [v8 connectForBannerPresentation:v4 reply:v9];
}

- (void)dismissBannerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(11LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRUIController][D] <%p> IPC dismissBannerWithIdentifier:%@",  buf,  0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIController server](self, "server"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100142FE4;
  v9[3] = &unk_100399508;
  v9[4] = self;
  [v8 revokeBannerWithIdentifier:v4 withReply:v9];
}

- (void)dismissAllBanners
{
  uint64_t v3 = _MRLogForCategory(11LL, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRUIController][D] <%p> IPC dismissAllBanners",  buf,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIController server](self, "server"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10014313C;
  v6[3] = &unk_100399508;
  v6[4] = self;
  [v5 revokeAllBannersWithReply:v6];
}

- (void)bannerWithIdentifier:(id)a3 postedEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(11LL, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218498;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRUIController][D] <%p> [MRDRRC] IPC Back bannerWithIdentifier: %@ postedEvent: %@",  (uint8_t *)&v12,  0x20u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIController delegate](self, "delegate"));
  objc_msgSend(v11, "bannerWithIdentifier:postedEvent:", v6, objc_msgSend(v7, "unsignedIntValue"));
}

- (void)invalidate
{
  uint64_t v3 = _MRLogForCategory(11LL, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRUIController][D] <%p> [MRDRRC] IPC invalidated",  (uint8_t *)&v6,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDUIController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "invalidated") & 1) != 0) {
    [v5 invalidated];
  }
}

- (void)bannerDismissed
{
  uint64_t v2 = _MRLogForCategory(11LL, a2);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] Banner dismissed", v4, 2u);
  }
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (MRDUIControllerConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end