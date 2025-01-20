@interface PDSharingManagementCreateShareRequest
- (NSArray)sharedEntitlements;
- (NSData)fidoSignedChallenge;
- (NSData)shareData;
- (NSDictionary)encryptedShareData;
- (NSString)dpanIdentifier;
- (NSString)recipient;
- (NSString)verificationCode;
- (id)requestBody;
- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setDpanIdentifier:(id)a3;
- (void)setEncryptedShareData:(id)a3;
- (void)setFidoSignedChallenge:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setSharedEntitlements:(id)a3;
- (void)setVerificationCode:(id)a3;
@end

@implementation PDSharingManagementCreateShareRequest

- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v16[0] = @"sharing";
  v16[1] = @"share";
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingManagementCreateShareRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:]( self,  "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:",  v7,  v8,  0LL,  v6));

  [v9 setHTTPMethod:@"POST"];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingManagementCreateShareRequest requestBody](self, "requestBody"));
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_HTTPBodyWithDictionary:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v9 setHTTPBody:v13];

  id v14 = [v9 copy];
  return v14;
}

- (NSData)shareData
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_recipient,  @"recipient");
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray pk_arrayByApplyingBlock:]( self->_sharedEntitlements,  "pk_arrayByApplyingBlock:",  &stru_10065C980));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  @"sharedEntitlements");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_verificationCode,  @"verificationCode");
  uint64_t v7 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v3,  1LL,  &v7));

  return (NSData *)v5;
}

- (id)requestBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_dpanIdentifier,  @"dpanIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSData base64EncodedStringWithOptions:]( self->_fidoSignedChallenge,  "base64EncodedStringWithOptions:",  0LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  @"fidoSignedChallenge");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_encryptedShareData,  @"encryptedShareData");
  return v3;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
}

- (NSData)fidoSignedChallenge
{
  return self->_fidoSignedChallenge;
}

- (void)setFidoSignedChallenge:(id)a3
{
}

- (NSString)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
}

- (NSArray)sharedEntitlements
{
  return self->_sharedEntitlements;
}

- (void)setSharedEntitlements:(id)a3
{
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
}

- (NSDictionary)encryptedShareData
{
  return self->_encryptedShareData;
}

- (void)setEncryptedShareData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end