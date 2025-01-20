@interface HHDMediaEndpoint
- (HHDMediaEndpoint)initWithMRAVEndpoint:(id)a3 targetIdentifier:(id)a4;
- (void)setVolume:(float)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation HHDMediaEndpoint

- (HHDMediaEndpoint)initWithMRAVEndpoint:(id)a3 targetIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___HHDMediaEndpoint;
  v9 = -[HHDMediaEndpoint init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpoint, a3);
    objc_storeStrong((id *)&v10->_targetId, a4);
  }

  return v10;
}

- (void)setVolume:(float)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = self->_targetId;
  id v10 = a4;
  id v11 = sub_10000D86C();
  objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v21 = &stru_100024E50;
    __int16 v22 = 2048;
    double v23 = a3;
    __int16 v24 = 2114;
    v25 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@Setting volume to %.2f for %{public}@",  buf,  0x20u);
  }

  endpoint = self->_endpoint;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000D8AC;
  v17[3] = &unk_100024A80;
  v18 = v9;
  id v19 = v8;
  id v14 = v8;
  v15 = v9;
  *(float *)&double v16 = a3;
  -[MRAVEndpoint setOutputDeviceVolume:outputDevice:queue:completion:]( endpoint,  "setOutputDeviceVolume:outputDevice:queue:completion:",  v15,  v10,  v17,  v16);
}

- (void).cxx_destruct
{
}

@end