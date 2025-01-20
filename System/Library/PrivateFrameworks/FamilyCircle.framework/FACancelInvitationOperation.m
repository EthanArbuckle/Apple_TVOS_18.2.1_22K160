@interface FACancelInvitationOperation
- (FACancelInvitationOperation)initWithNetworkService:(id)a3 email:(id)a4 familyID:(id)a5;
- (NSString)email;
- (NSString)familyID;
- (id)cancelInvitation;
- (id)cancelInvitationCompletionHandler;
- (void)setCancelInvitationCompletionHandler:(id)a3;
@end

@implementation FACancelInvitationOperation

- (FACancelInvitationOperation)initWithNetworkService:(id)a3 email:(id)a4 familyID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___FACancelInvitationOperation;
  v11 = -[FANetworkClient initWithNetworkService:](&v14, "initWithNetworkService:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_email, a4);
    objc_storeStrong((id *)&v12->_familyID, a5);
  }

  return v12;
}

- (id)cancelInvitation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FACancelInvitationOperation email](self, "email"));
  [v3 setObject:v4 forKeyedSubscript:@"email"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FACancelInvitationOperation familyID](self, "familyID"));
  [v3 setObject:v5 forKeyedSubscript:@"familyId"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 standardRequestWithEndpoint:FAURLEndpointCancelInvitation method:@"POST" plistBody:v3 requestFormat:2 responseFormat:2]);
  v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v7 then]);
  uint64_t v9 = ((uint64_t (**)(void, Block_layout *))v8)[2](v8, &stru_100041A38);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (NSString)email
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)familyID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (id)cancelInvitationCompletionHandler
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCancelInvitationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end