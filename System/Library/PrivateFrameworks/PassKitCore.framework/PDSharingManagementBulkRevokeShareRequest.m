@interface PDSharingManagementBulkRevokeShareRequest
- (BOOL)shouldCascade;
- (NSArray)shareIdentifiers;
- (NSString)dpanIdentifier;
- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setDpanIdentifier:(id)a3;
- (void)setShareIdentifiers:(id)a3;
- (void)setShouldCascade:(BOOL)a3;
@end

@implementation PDSharingManagementBulkRevokeShareRequest

- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v17[0] = @"sharing";
  v17[1] = @"manage";
  v17[2] = @"revoke";
  v17[3] = @"bulk";
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 4LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingManagementBulkRevokeShareRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:]( self,  "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:",  v7,  v8,  0LL,  v6));

  [v9 setHTTPMethod:@"POST"];
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  self->_dpanIdentifier,  @"dpanIdentifier");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  self->_shareIdentifiers,  @"shareIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_shouldCascade));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, @"shouldCascade");

  id v13 = objc_msgSend((id)objc_opt_class(self, v12), "_HTTPBodyWithDictionary:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v9 setHTTPBody:v14];

  id v15 = [v9 copy];
  return v15;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
}

- (NSArray)shareIdentifiers
{
  return self->_shareIdentifiers;
}

- (void)setShareIdentifiers:(id)a3
{
}

- (BOOL)shouldCascade
{
  return self->_shouldCascade;
}

- (void)setShouldCascade:(BOOL)a3
{
  self->_shouldCascade = a3;
}

- (void).cxx_destruct
{
}

@end