@interface PDSharingManagementCreateShareResponse
- (NSDictionary)shareVouchers;
- (NSString)shareIdentifier;
- (NSURL)displayInformationOpenGraphUrl;
- (PDSharingManagementCreateShareResponse)initWithData:(id)a3;
- (void)setDisplayInformationOpenGraphUrl:(id)a3;
@end

@implementation PDSharingManagementCreateShareResponse

- (PDSharingManagementCreateShareResponse)initWithData:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PDSharingManagementCreateShareResponse;
  v3 = -[PDSharingManagementCreateShareResponse initWithData:](&v24, "initWithData:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingManagementCreateShareResponse JSONObject](v3, "JSONObject"));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 PKDictionaryForKey:@"provisioningData"]);
      shareVouchers = v4->_shareVouchers;
      v4->_shareVouchers = (NSDictionary *)v8;

      uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 PKStringForKey:@"shareIdentifier"]);
      shareIdentifier = v4->_shareIdentifier;
      v4->_shareIdentifier = (NSString *)v10;

      uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 PKURLForKey:@"displayInformationUrl"]);
      displayInformationOpenGraphUrl = v4->_displayInformationOpenGraphUrl;
      v4->_displayInformationOpenGraphUrl = (NSURL *)v12;

      if (v4->_shareVouchers)
      {
LABEL_9:

        return v4;
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class(v5, v16);
        v18 = NSStringFromClass(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v21 = (void *)objc_opt_class(v4, v20);
        *(_DWORD *)buf = 138543618;
        v26 = v19;
        __int16 v27 = 2112;
        v28 = v21;
        id v22 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Malformed response: expected dictionary and received %{public}@ inside %@",  buf,  0x16u);
      }
    }

    v4 = 0LL;
    goto LABEL_9;
  }

  return v4;
}

- (NSDictionary)shareVouchers
{
  return self->_shareVouchers;
}

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (NSURL)displayInformationOpenGraphUrl
{
  return self->_displayInformationOpenGraphUrl;
}

- (void)setDisplayInformationOpenGraphUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end