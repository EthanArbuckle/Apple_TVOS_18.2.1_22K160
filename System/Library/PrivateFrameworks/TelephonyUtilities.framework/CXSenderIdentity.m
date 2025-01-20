@interface CXSenderIdentity
- (TUSenderIdentity)tuSenderIdentity;
@end

@implementation CXSenderIdentity

- (TUSenderIdentity)tuSenderIdentity
{
  v15 = objc_alloc(&OBJC_CLASS___TUSenderIdentity);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CXSenderIdentity UUID](self, "UUID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CXSenderIdentity account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v18 UUID]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CXSenderIdentity account](self, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v17 isoCountryCode]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CXSenderIdentity account](self, "account"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v16 accountDescription]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXSenderIdentity account](self, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 shortLabel]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CXSenderIdentity account](self, "account"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceName]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CXSenderIdentity handle](self, "handle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 tuHandle]);
  v12 = -[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]( v15,  "initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:",  v14,  v3,  v4,  v5,  v7,  v9,  v11);

  return v12;
}

@end