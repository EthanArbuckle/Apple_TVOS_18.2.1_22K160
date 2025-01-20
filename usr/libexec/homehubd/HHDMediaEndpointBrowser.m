@interface HHDMediaEndpointBrowser
- (HHDMediaEndpointBrowser)initWithQueue:(id)a3;
- (void)_resetSession;
- (void)dealloc;
- (void)findRemoteControlEndpointMatchingIdentifier:(id)a3 completion:(id)a4;
@end

@implementation HHDMediaEndpointBrowser

- (HHDMediaEndpointBrowser)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___HHDMediaEndpointBrowser;
  v6 = -[HHDMediaEndpointBrowser init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)findRemoteControlEndpointMatchingIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[HHDMediaEndpointBrowser _resetSession](self, "_resetSession");
  id v24 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  self->_reconSession = (void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures(v8, 8LL);
  id v9 = sub_100007568();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v21 = &stru_100024E50;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@Starting search for endpoint with identifier %{public}@",  buf,  0x16u);
  }

  v11 = self->_queue;
  reconSession = self->_reconSession;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000075A8;
  v16[3] = &unk_100024898;
  v17 = v11;
  id v18 = v6;
  id v19 = v7;
  v13 = v11;
  id v14 = v6;
  id v15 = v7;
  MRAVReconnaissanceSessionBeginSearch(reconSession, v16, 5.0);
}

- (void)_resetSession
{
  reconSession = self->_reconSession;
  if (reconSession)
  {
    CFRelease(reconSession);
    self->_reconSession = 0LL;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HHDMediaEndpointBrowser;
  -[HHDMediaEndpointBrowser dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
}

@end