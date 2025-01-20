@interface PDSharingManagementRetrieveFIDOChallengeRequest
- (NSString)dpanIdentifier;
- (PKFidoProfile)fidoProfile;
- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setDpanIdentifier:(id)a3;
- (void)setFidoProfile:(id)a3;
@end

@implementation PDSharingManagementRetrieveFIDOChallengeRequest

- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v21[0] = @"sharing";
  v21[1] = @"fidoChallenge";
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingManagementRetrieveFIDOChallengeRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:]( self,  "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:",  v7,  v8,  0LL,  v6));

  [v9 setHTTPMethod:@"POST"];
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  self->_dpanIdentifier,  @"dpanIdentifier");
  v19[0] = @"relyingPartyIdentifier";
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKFidoProfile relyingPartyIdentifier](self->_fidoProfile, "relyingPartyIdentifier"));
  v19[1] = @"accountHash";
  v20[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKFidoProfile accountHash](self->_fidoProfile, "accountHash"));
  v20[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, @"fidoProfile");

  id v15 = objc_msgSend((id)objc_opt_class(self, v14), "_HTTPBodyWithDictionary:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v9 setHTTPBody:v16];

  id v17 = [v9 copy];
  return v17;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
}

- (PKFidoProfile)fidoProfile
{
  return self->_fidoProfile;
}

- (void)setFidoProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end