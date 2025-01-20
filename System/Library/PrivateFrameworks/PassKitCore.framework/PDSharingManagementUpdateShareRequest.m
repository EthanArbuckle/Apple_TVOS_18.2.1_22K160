@interface PDSharingManagementUpdateShareRequest
- (NSString)shareIdentifier;
- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setShareIdentifier:(id)a3;
@end

@implementation PDSharingManagementUpdateShareRequest

- (id)urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v16 = @"sharing";
  v17 = @"share";
  shareIdentifier = self->_shareIdentifier;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 3LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingManagementUpdateShareRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:]( self,  "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:",  v7,  v8,  0LL,  v6,  v16,  v17,  shareIdentifier));

  [v9 setHTTPMethod:@"PUT"];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingManagementCreateShareRequest requestBody](self, "requestBody"));
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_HTTPBodyWithDictionary:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v9 setHTTPBody:v13];

  id v14 = [v9 copy];
  return v14;
}

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end