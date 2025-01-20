@interface PDNotificationServiceGetSpecificUpdatesTask
+ (BOOL)supportsSecureCoding;
+ (id)getSpecificUpdatesTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 credentialType:(int64_t)a5 lastUpdatedTag:(id)a6 accountIdentifier:(id)a7 webServiceConfiguration:(id)a8;
- (BOOL)isValid;
- (BOOL)matchesTask:(id)a3;
- (BOOL)networkForcesDPANEndpoint;
- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4;
- (NSString)dpanIdentifier;
- (NSString)lastUpdatedTag;
- (PDNotificationServiceGetSpecificUpdatesTask)initWithCoder:(id)a3;
- (PDNotificationServiceGetSpecificUpdatesTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 credentialType:(int64_t)a5 lastUpdatedTag:(id)a6 accountIdentifier:(id)a7 webServiceConfiguration:(id)a8;
- (PKPaymentWebServiceConfiguration)webServiceConfiguration;
- (id)description;
- (id)endpointComponents;
- (id)panEndpoint;
- (id)panIdentifierName;
- (id)queryFields;
- (int64_t)credentialType;
- (int64_t)taskType;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentialType:(int64_t)a3;
- (void)setDPANIdentifier:(id)a3;
- (void)setLastUpdatedTag:(id)a3;
- (void)setWebServiceConfiguration:(id)a3;
@end

@implementation PDNotificationServiceGetSpecificUpdatesTask

+ (id)getSpecificUpdatesTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 credentialType:(int64_t)a5 lastUpdatedTag:(id)a6 accountIdentifier:(id)a7 webServiceConfiguration:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  id v19 = [objc_alloc((Class)a1) initWithNotificationService:v18 dpanIdentifier:v17 credentialType:a5 lastUpdatedTag:v16 accountIdentifier:v15 webServiceConfiguration:v14];

  return v19;
}

- (PDNotificationServiceGetSpecificUpdatesTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 credentialType:(int64_t)a5 lastUpdatedTag:(id)a6 accountIdentifier:(id)a7 webServiceConfiguration:(id)a8
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDNotificationServiceGetSpecificUpdatesTask;
  id v18 = -[PDNotificationServiceGetUpdatesTask initWithNotificationService:accountIdentifier:]( &v21,  "initWithNotificationService:accountIdentifier:",  a3,  a7);
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dpanIdentifier, a4);
    v19->_credentialType = a5;
    objc_storeStrong((id *)&v19->_lastUpdatedTag, a6);
    objc_storeStrong((id *)&v19->_webServiceConfiguration, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceGetSpecificUpdatesTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDNotificationServiceGetSpecificUpdatesTask;
  v6 = -[PDNotificationServiceGetUpdatesTask initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"dpanIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    dpanIdentifier = v6->_dpanIdentifier;
    v6->_dpanIdentifier = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"lastUpdatedTag");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    lastUpdatedTag = v6->_lastUpdatedTag;
    v6->_lastUpdatedTag = (NSString *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDNotificationServiceGetSpecificUpdatesTask;
  id v4 = a3;
  -[PDNotificationServiceGetUpdatesTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dpanIdentifier, @"dpanIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_lastUpdatedTag forKey:@"lastUpdatedTag"];
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceGetSpecificUpdatesTask dpanIdentifier](self, "dpanIdentifier"));
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

- (int64_t)taskType
{
  return 2LL;
}

- (id)queryFields
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[PDNotificationServiceGetSpecificUpdatesTask lastUpdatedTag](self, "lastUpdatedTag"));
  v3 = (void *)v2;
  if (v2)
  {
    BOOL v6 = @"tag";
    uint64_t v7 = v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (id)endpointComponents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PDNotificationServiceGetSpecificUpdatesTask dpanIdentifier](self, "dpanIdentifier"));
  BOOL v6 = (void *)v5;
  uint64_t v7 = 0LL;
  if (v4 && v5)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
    id v9 = [v8 serviceType];

    if (v9 == (id)1)
    {
      uint64_t v10 = @"dpan";
      id v11 = @"messages";
    }

    else if (v9)
    {
      id v11 = 0LL;
      uint64_t v10 = @"dpan";
    }

    else
    {
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceGetSpecificUpdatesTask panEndpoint](self, "panEndpoint"));
      id v11 = @"transactions";
    }

    v13[0] = @"devices";
    v13[1] = v4;
    v13[2] = v10;
    v13[3] = v6;
    v13[4] = v11;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 5LL));
  }

  return v7;
}

- (id)panEndpoint
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[PDNotificationServiceGetUpdatesTask accountIdentifier](self, "accountIdentifier"));
  id v4 = @"dpan";
  if (v3)
  {
    uint64_t v5 = (void *)v3;
    unsigned int v6 = -[PDNotificationServiceGetSpecificUpdatesTask networkForcesDPANEndpoint](self, "networkForcesDPANEndpoint");

    if (!v6) {
      return @"pan";
    }
  }

  return (id)v4;
}

- (BOOL)networkForcesDPANEndpoint
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[PKPaymentWebServiceConfiguration credentialTypesRequiringDPANNotifications]( self->_webServiceConfiguration,  "credentialTypesRequiringDPANNotifications"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString pk_stringWithInteger:]( &OBJC_CLASS___NSString,  "pk_stringWithInteger:",  self->_credentialType));
  unsigned int v5 = [v3 containsObject:v4];

  if (v5)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 debugDescription]);
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Using /dpan/ endpoint due to config.json override: %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  return 0;
}

- (id)panIdentifierName
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v4 = [v3 serviceType];

  unsigned int v5 = @"DPAN";
  if (!v4)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceGetUpdatesTask accountIdentifier](self, "accountIdentifier"));
    uint64_t v7 = @"PAN";
    if (!v6) {
      uint64_t v7 = @"DPAN";
    }
    unsigned int v5 = v7;
  }

  return v5;
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  if ([v3 serviceType]) {
    id v4 = @"Messages";
  }
  else {
    id v4 = @"Transactions";
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceIdentifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceGetSpecificUpdatesTask panIdentifierName](self, "panIdentifierName"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceGetSpecificUpdatesTask dpanIdentifier](self, "dpanIdentifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceURL]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 registrationURL]);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Get %@ Notifications Task (Device ID: %@, %@ ID: %@, Service URL: %@, Registration URL: %@)",  v4,  v6,  v7,  v8,  v10,  v12));

  return v13;
}

- (BOOL)matchesTask:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDNotificationServiceGetSpecificUpdatesTask;
  if (-[PDNotificationServiceConnectionTask matchesTask:](&v13, "matchesTask:", v4)
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceGetSpecificUpdatesTask, v5),
        (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dpanIdentifier]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceGetSpecificUpdatesTask dpanIdentifier](self, "dpanIdentifier"));
    if ([v9 isEqualToString:v7])
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceGetUpdatesTask accountIdentifier](self, "accountIdentifier"));
      char v11 = PKEqualObjects(v10, v8);
    }

    else
    {
      char v11 = 0;
    }
  }

  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  unsigned int v9 = [v8 isEqual:v7];

  if (v9)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceGetSpecificUpdatesTask dpanIdentifier](self, "dpanIdentifier"));
    unsigned __int8 v11 = [v10 isEqualToString:v6];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDPANIdentifier:(id)a3
{
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (void)setLastUpdatedTag:(id)a3
{
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (PKPaymentWebServiceConfiguration)webServiceConfiguration
{
  return self->_webServiceConfiguration;
}

- (void)setWebServiceConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end