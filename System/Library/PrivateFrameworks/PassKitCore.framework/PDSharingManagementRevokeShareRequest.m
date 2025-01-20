@interface PDSharingManagementRevokeShareRequest
- (BOOL)shouldCascade;
- (NSString)dpanIdentifier;
- (NSString)shareIdentifier;
- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setDpanIdentifier:(id)a3;
- (void)setShareIdentifier:(id)a3;
- (void)setShouldCascade:(BOOL)a3;
@end

@implementation PDSharingManagementRevokeShareRequest

- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v17 = @"sharing";
  v18 = @"share";
  shareIdentifier = self->_shareIdentifier;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 3LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingManagementRevokeShareRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:]( self,  "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:",  v7,  v8,  0LL,  v6,  v17,  v18,  shareIdentifier));

  [v9 setHTTPMethod:@"DELETE"];
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  self->_dpanIdentifier,  @"dpanIdentifier");
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

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
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