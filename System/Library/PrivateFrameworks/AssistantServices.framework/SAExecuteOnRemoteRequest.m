@interface SAExecuteOnRemoteRequest
- (id)ad_preferredMessagingOption;
- (id)ad_recipientDevicesType;
@end

@implementation SAExecuteOnRemoteRequest

- (id)ad_preferredMessagingOption
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SAExecuteOnRemoteRequest serializedCommand](self, "serializedCommand"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithPlistData:](&OBJC_CLASS___AceObject, "aceObjectWithPlistData:", v2));
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___SARecordLocationActivity);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = @"IDS";
      v7 = @"IDS";
    }

    else
    {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (id)ad_recipientDevicesType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SAExecuteOnRemoteRequest serializedCommand](self, "serializedCommand"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithPlistData:](&OBJC_CLASS___AceObject, "aceObjectWithPlistData:", v2));
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___SARecordLocationActivity);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = @"MobileDevices";
      v7 = @"MobileDevices";
    }

    else
    {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

@end