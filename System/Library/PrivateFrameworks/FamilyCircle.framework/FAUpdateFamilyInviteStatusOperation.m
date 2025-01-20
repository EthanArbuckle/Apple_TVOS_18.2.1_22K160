@interface FAUpdateFamilyInviteStatusOperation
- (FAUpdateFamilyInviteStatusOperation)initWithNetworkService:(id)a3 inviteCode:(id)a4 inviteStatus:(int64_t)a5 responseFormat:(int64_t)a6 additionalRequestParameters:(id)a7;
- (NSDictionary)additionalRequestParameters;
- (NSString)inviteCode;
- (id)_userActionWithInviteStatus:(int64_t)a3;
- (id)updateInviteStatus;
- (int64_t)inviteStatus;
- (int64_t)responseFormat;
@end

@implementation FAUpdateFamilyInviteStatusOperation

- (FAUpdateFamilyInviteStatusOperation)initWithNetworkService:(id)a3 inviteCode:(id)a4 inviteStatus:(int64_t)a5 responseFormat:(int64_t)a6 additionalRequestParameters:(id)a7
{
  id v13 = a4;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___FAUpdateFamilyInviteStatusOperation;
  v15 = -[FANetworkClient initWithNetworkService:](&v18, "initWithNetworkService:", a3);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_inviteCode, a4);
    v16->_inviteStatus = a5;
    objc_storeStrong((id *)&v16->_additionalRequestParameters, a7);
    v16->_responseFormat = a6;
  }

  return v16;
}

- (id)_userActionWithInviteStatus:(int64_t)a3
{
  v3 = @"decline";
  if (a3 != 2) {
    v3 = 0LL;
  }
  if (a3 == 1) {
    return @"accept";
  }
  else {
    return (id)v3;
  }
}

- (id)updateInviteStatus
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FAUpdateFamilyInviteStatusOperation inviteCode](self, "inviteCode"));
  [v4 setObject:v5 forKeyedSubscript:@"inviteUrl"];

  v6 = objc_alloc(&OBJC_CLASS___NSURLComponents);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FAUpdateFamilyInviteStatusOperation inviteCode](self, "inviteCode"));
  v8 = -[NSURLComponents initWithString:](v6, "initWithString:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents fa_queryItemsDictionary](v8, "fa_queryItemsDictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"inviteCode"]);
  [v4 setObject:v10 forKeyedSubscript:@"inviteCode"];

  [v3 setObject:v4 forKeyedSubscript:@"requestParameters"];
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[FAUpdateFamilyInviteStatusOperation _userActionWithInviteStatus:]( self,  "_userActionWithInviteStatus:",  -[FAUpdateFamilyInviteStatusOperation inviteStatus](self, "inviteStatus")));
  [v3 setObject:v11 forKeyedSubscript:@"userAction"];

  [v3 addEntriesFromDictionary:self->_additionalRequestParameters];
  id v12 = objc_alloc_init(&OBJC_CLASS___FAURLConfiguration);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 URLForEndpoint:FAURLEndpointPendingInviteActionFromMessagesV1]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 then]);
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  v25 = sub_100005948;
  v26 = &unk_100041190;
  v27 = self;
  id v28 = v3;
  v15 = (uint64_t (*)(void *, void ***))v14[2];
  id v16 = v3;
  uint64_t v17 = v15(v14, &v23);
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "then", v23, v24, v25, v26, v27));
  uint64_t v20 = ((uint64_t (**)(void, Block_layout *))v19)[2](v19, &stru_1000411D0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  return v21;
}

- (NSString)inviteCode
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (int64_t)inviteStatus
{
  return self->_inviteStatus;
}

- (NSDictionary)additionalRequestParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (int64_t)responseFormat
{
  return self->_responseFormat;
}

- (void).cxx_destruct
{
}

@end