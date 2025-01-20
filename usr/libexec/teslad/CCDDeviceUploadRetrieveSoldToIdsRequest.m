@interface CCDDeviceUploadRetrieveSoldToIdsRequest
- (DEPDeviceUploadOrganization)organization;
- (id)endpointPath;
- (id)httpMethod;
- (id)requestBody;
- (int64_t)requestType;
- (void)setOrganization:(id)a3;
@end

@implementation CCDDeviceUploadRetrieveSoldToIdsRequest

- (int64_t)requestType
{
  return 2LL;
}

- (id)httpMethod
{
  return @"POST";
}

- (id)endpointPath
{
  return @"/device/upload/getorgsoldtoid";
}

- (id)requestBody
{
  v6 = @"searchString";
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRetrieveSoldToIdsRequest organization](self, "organization"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 orgId]);
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));

  return v4;
}

- (DEPDeviceUploadOrganization)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
}

- (void).cxx_destruct
{
}

@end