@interface FARemoveFamilyMemberOperation
- (FARemoveFamilyMemberOperation)initWithNetworkService:(id)a3 dsidOfMemberToRemove:(id)a4;
- (NSNumber)dsidOfMemberToRemove;
- (id)removeMember;
- (id)removeMemberCompletionHandler;
- (void)setRemoveMemberCompletionHandler:(id)a3;
@end

@implementation FARemoveFamilyMemberOperation

- (FARemoveFamilyMemberOperation)initWithNetworkService:(id)a3 dsidOfMemberToRemove:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___FARemoveFamilyMemberOperation;
  v8 = -[FANetworkClient initWithNetworkService:](&v11, "initWithNetworkService:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_dsidOfMemberToRemove, a4);
  }

  return v9;
}

- (id)removeMember
{
  uint64_t v3 = _FALogSystem(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "FARemoveFamilyMemberOperation removeMember request",  buf,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber description](self->_dsidOfMemberToRemove, "description"));
  [v5 setObject:v6 forKeyedSubscript:@"member-dsid"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 standardPlistRequestWithEndpoint:@"removeFromFamily" method:@"POST" plistBody:v5]);
  v9 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v8 then]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100002D08;
  v13[3] = &unk_100040E38;
  v13[4] = self;
  uint64_t v10 = ((uint64_t (**)(void, void *))v9)[2](v9, v13);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (NSNumber)dsidOfMemberToRemove
{
  return (NSNumber *)objc_getProperty(self, a2, 16LL, 1);
}

- (id)removeMemberCompletionHandler
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRemoveMemberCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end