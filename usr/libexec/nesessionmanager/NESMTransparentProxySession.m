@interface NESMTransparentProxySession
- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)setConfigurationWithCompletionHandler:(id)a3;
@end

@implementation NESMTransparentProxySession

- (void)setConfigurationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10007CAF4;
  v18[3] = &unk_1000BE7C8;
  objc_copyWeak(&v22, &location);
  id v6 = v4;
  id v21 = v6;
  id v7 = v5;
  id v19 = v7;
  v20 = self;
  v8 = objc_retainBlock(v18);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NETransparentProxyNetworkSettings);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v7, v9);
  char v12 = isKindOfClass;
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v15 = ne_log_obj(isKindOfClass, v11);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%@: Plugin configuration is not a NETransparentProxyNetworkSettings object",  buf,  0xCu);
    }

    v14 = v6;
    goto LABEL_7;
  }

  unsigned int v13 = [v7 isFullyTransparent];
  v14 = v8;
  if (v13)
  {
LABEL_7:
    ((void (*)(void *, void))v14[2])(v14, v12 & 1);
    goto LABEL_8;
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NESMTransparentProxySession;
  -[NESMFlowDivertSession setConfigurationWithCompletionHandler:](&v17, "setConfigurationWithCompletionHandler:", v8);
LABEL_8:

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 primaryPhysicalInterface]);
  char v12 = (void *)objc_claimAutoreleasedReturnValue([v11 interfaceName]);
  sub_100016D18(v9, v12);

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  [v13 handlePlugin:v9 didStartWithPID:v5 error:v8];
}

@end