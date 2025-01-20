@interface FACachedPresetsProvider
- (FACachedPresetsProvider)initWithNetworkService:(id)a3 cache:(id)a4 storeFrontProvider:(id)a5;
- (FANetworkService)networkService;
- (FASettingPresetsCache)cache;
- (FAStoreFrontProvider)storeFrontProvider;
- (id)availablePresets;
- (void)currentConfigurationForDSID:(id)a3 completion:(id)a4;
- (void)setCache:(id)a3;
- (void)setNetworkService:(id)a3;
- (void)setStoreFrontProvider:(id)a3;
@end

@implementation FACachedPresetsProvider

- (FACachedPresetsProvider)initWithNetworkService:(id)a3 cache:(id)a4 storeFrontProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___FACachedPresetsProvider;
  v12 = -[FACachedPresetsProvider init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_networkService, a3);
    objc_storeStrong((id *)&v13->_cache, a4);
    objc_storeStrong((id *)&v13->_storeFrontProvider, a5);
  }

  return v13;
}

- (id)availablePresets
{
  uint64_t v3 = _FALogSystem(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Fetching available presets from cache.",  buf,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FACachedPresetsProvider storeFrontProvider](self, "storeFrontProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchCurrentStoreFront]);
  v7 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v6 then]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100006FD0;
  v18[3] = &unk_100041330;
  v18[4] = self;
  uint64_t v8 = ((uint64_t (**)(void, void *))v7)[2](v7, v18);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v9 then]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000070AC;
  v17[3] = &unk_100041358;
  v17[4] = self;
  uint64_t v11 = ((uint64_t (**)(void, void *))v10)[2](v10, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v12 then]);
  uint64_t v14 = ((uint64_t (**)(void, Block_layout *))v13)[2](v13, &stru_100041398);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

- (void)currentConfigurationForDSID:(id)a3 completion:(id)a4
{
  id v4 = a4;
  uint64_t v5 = _FALogSystem();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Fetching current preset from FACachedPresetsProvider is not available",  v7,  2u);
  }

  (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
}

- (FANetworkService)networkService
{
  return self->_networkService;
}

- (void)setNetworkService:(id)a3
{
}

- (FASettingPresetsCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (FAStoreFrontProvider)storeFrontProvider
{
  return self->_storeFrontProvider;
}

- (void)setStoreFrontProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end