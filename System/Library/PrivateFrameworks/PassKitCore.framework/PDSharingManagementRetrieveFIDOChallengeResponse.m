@interface PDSharingManagementRetrieveFIDOChallengeResponse
- (NSString)fidoChallenge;
- (NSString)keyHash;
- (PDSharingManagementRetrieveFIDOChallengeResponse)initWithData:(id)a3;
@end

@implementation PDSharingManagementRetrieveFIDOChallengeResponse

- (PDSharingManagementRetrieveFIDOChallengeResponse)initWithData:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PDSharingManagementRetrieveFIDOChallengeResponse;
  v3 = -[PDSharingManagementRetrieveFIDOChallengeResponse initWithData:](&v22, "initWithData:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingManagementRetrieveFIDOChallengeResponse JSONObject](v3, "JSONObject"));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 PKStringForKey:@"fidoChallenge"]);
      fidoChallenge = v4->_fidoChallenge;
      v4->_fidoChallenge = (NSString *)v8;

      uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 PKStringForKey:@"keyHash"]);
      keyHash = v4->_keyHash;
      v4->_keyHash = (NSString *)v10;

      if (v4->_fidoChallenge)
      {
LABEL_9:

        return v4;
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class(v5, v14);
        v16 = NSStringFromClass(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v19 = (void *)objc_opt_class(v4, v18);
        *(_DWORD *)buf = 138543618;
        v24 = v17;
        __int16 v25 = 2112;
        v26 = v19;
        id v20 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Malformed response: expected dictionary and received %{public}@ inside %@",  buf,  0x16u);
      }
    }

    v4 = 0LL;
    goto LABEL_9;
  }

  return v4;
}

- (NSString)fidoChallenge
{
  return self->_fidoChallenge;
}

- (NSString)keyHash
{
  return self->_keyHash;
}

- (void).cxx_destruct
{
}

@end