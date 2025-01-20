@interface FAICSSPresetsProvider
- (FAICSSPresetsProvider)initWithNetworkService:(id)a3 storeFrontProvider:(id)a4;
- (FAStoreFrontProvider)storeFrontProvider;
- (id)availablePresets;
- (void)currentConfigurationForDSID:(id)a3 completion:(id)a4;
- (void)setStoreFrontProvider:(id)a3;
@end

@implementation FAICSSPresetsProvider

- (FAICSSPresetsProvider)initWithNetworkService:(id)a3 storeFrontProvider:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___FAICSSPresetsProvider;
  v8 = -[FANetworkClient initWithNetworkService:](&v11, "initWithNetworkService:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_storeFrontProvider, a4);
  }

  return v9;
}

- (id)availablePresets
{
  uint64_t v3 = _FALogSystem(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching available presets from icss.", buf, 2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___FASettingPresetsCache);
  *(void *)buf = 0LL;
  v25 = buf;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_10000B288;
  v28 = sub_10000B298;
  id v29 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FAICSSPresetsProvider storeFrontProvider](self, "storeFrontProvider"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchCurrentStoreFront]);
  v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v7 then]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000B2A0;
  v23[3] = &unk_100041330;
  v23[4] = self;
  uint64_t v9 = ((uint64_t (**)(void, void *))v8)[2](v8, v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_super v11 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v10 then]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000B37C;
  v22[3] = &unk_1000417C0;
  v22[4] = self;
  v22[5] = buf;
  uint64_t v12 = ((uint64_t (**)(void, void *))v11)[2](v11, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v13 then]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000B3F4;
  v19[3] = &unk_100041808;
  v15 = v5;
  v20 = v15;
  v21 = buf;
  uint64_t v16 = ((uint64_t (**)(void, void *))v14)[2](v14, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  _Block_object_dispose(buf, 8);
  return v17;
}

- (void)currentConfigurationForDSID:(id)a3 completion:(id)a4
{
  id v4 = a4;
  uint64_t v7 = _FALogSystem(v4, v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Fetching current preset is no avalaible",  v9,  2u);
  }

  (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
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