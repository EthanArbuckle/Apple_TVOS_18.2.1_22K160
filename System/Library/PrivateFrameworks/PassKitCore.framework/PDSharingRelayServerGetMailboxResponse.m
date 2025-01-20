@interface PDSharingRelayServerGetMailboxResponse
- (PDSharingMailboxPayload)payload;
- (PDSharingRelayServerGetMailboxResponse)initWithData:(id)a3;
- (PKSharingMessageDisplayInformation)displayInfo;
- (void)setDisplayInfo:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation PDSharingRelayServerGetMailboxResponse

- (PDSharingRelayServerGetMailboxResponse)initWithData:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___PDSharingRelayServerGetMailboxResponse;
  v3 = -[PDSharingRelayServerGetMailboxResponse initWithData:](&v29, "initWithData:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingRelayServerGetMailboxResponse JSONObject](v3, "JSONObject"));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      v8 = objc_alloc(&OBJC_CLASS___PDSharingMailboxPayload);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 PKDictionaryForKey:@"payload"]);
      v10 = -[PDSharingMailboxPayload initWithDictionary:](v8, "initWithDictionary:", v9);
      payload = v4->_payload;
      v4->_payload = v10;

      v12 = (PDSharingRelayServerGetMailboxResponse *)objc_claimAutoreleasedReturnValue( [v5 PKDictionaryForKey:@"displayInformation"]);
      v13 = v12;
      if (!v12)
      {
LABEL_13:

        return v4;
      }

      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerGetMailboxResponse PKStringForKey:]( v12,  "PKStringForKey:",  @"title"));
      v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerGetMailboxResponse PKStringForKey:]( v13,  "PKStringForKey:",  @"description"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[PDSharingRelayServerGetMailboxResponse PKURLForKey:](v13, "PKURLForKey:", @"imageURL"));
      v17 = (void *)v16;
      if (v14 && v15 && v16)
      {
        v18 = -[PKSharingMessageDisplayInformation initWithTitle:subtitle:imageURL:]( objc_alloc(&OBJC_CLASS___PKSharingMessageDisplayInformation),  "initWithTitle:subtitle:imageURL:",  v14,  v15,  v16);
        displayInfo = v4->_displayInfo;
        v4->_displayInfo = v18;
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (objc_class *)objc_opt_class(v5, v21);
        v23 = NSStringFromClass(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v26 = (void *)objc_opt_class(v4, v25);
        *(_DWORD *)buf = 138543618;
        v31 = v24;
        __int16 v32 = 2112;
        v33 = v26;
        id v27 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Malformed response: expected dictionary and received %{public}@ inside %@",  buf,  0x16u);
      }

      v13 = v4;
      v4 = 0LL;
    }

    goto LABEL_13;
  }

  return v4;
}

- (PDSharingMailboxPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (PKSharingMessageDisplayInformation)displayInfo
{
  return self->_displayInfo;
}

- (void)setDisplayInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end