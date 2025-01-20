@interface FADeleteFamilyOperation
- (FADeleteFamilyOperation)initWithNetworkService:(id)a3;
- (id)deleteFamily;
- (id)removeMemberCompletionHandler;
- (void)setRemoveMemberCompletionHandler:(id)a3;
@end

@implementation FADeleteFamilyOperation

- (FADeleteFamilyOperation)initWithNetworkService:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FADeleteFamilyOperation;
  return -[FANetworkClient initWithNetworkService:](&v4, "initWithNetworkService:", a3);
}

- (id)deleteFamily
{
  uint64_t v3 = _FALogSystem(self, a2);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "FADeleteFamilyOperation deleteFamily request",  v13,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLConfiguration urlConfiguration](&OBJC_CLASS___AAURLConfiguration, "urlConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 urlForEndpoint:@"deleteFamily"]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 standardPlistRequestWithUrl:v6 method:@"POST" plistBody:0]);
  v9 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v8 then]);
  uint64_t v10 = ((uint64_t (**)(void, Block_layout *))v9)[2](v9, &stru_100041208);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)removeMemberCompletionHandler
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRemoveMemberCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end