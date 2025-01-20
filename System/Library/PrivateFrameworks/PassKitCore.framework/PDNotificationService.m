@interface PDNotificationService
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNotificationService:(id)a3;
- (NSDate)lastUpdatedDate;
- (NSDate)lastUpdatedTagDate;
- (NSString)appLaunchToken;
- (NSString)authenticationToken;
- (NSString)deviceIdentifier;
- (NSString)lastUpdatedTag;
- (NSString)pushToken;
- (NSString)pushTopic;
- (NSURL)registrationURL;
- (NSURL)serviceURL;
- (PDNotificationService)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)serviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setAppLaunchToken:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setLastUpdatedTag:(id)a3;
- (void)setLastUpdatedTagDate:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setPushTopic:(id)a3;
- (void)setRegistrationURL:(id)a3;
- (void)setServiceType:(unint64_t)a3;
- (void)setServiceURL:(id)a3;
@end

@implementation PDNotificationService

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && (id v7 = -[PDNotificationService serviceType](self, "serviceType"), v7 == [v4 serviceType]))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationService serviceURL](self, "serviceURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceURL]);
    if (PKEqualObjects(v8, v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationService registrationURL](self, "registrationURL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 registrationURL]);
      if (PKEqualObjects(v10, v11))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationService pushTopic](self, "pushTopic"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v4 pushTopic]);
        if (PKEqualObjects(v12, v13))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationService pushToken](self, "pushToken"));
          v15 = (void *)objc_claimAutoreleasedReturnValue([v4 pushToken]);
          if (PKEqualObjects(v14, v15))
          {
            v33 = v14;
            uint64_t v16 = objc_claimAutoreleasedReturnValue(-[PDNotificationService authenticationToken](self, "authenticationToken"));
            v34 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationToken]);
            v35 = (void *)v16;
            if (PKEqualObjects(v16, v34))
            {
              uint64_t v17 = objc_claimAutoreleasedReturnValue(-[PDNotificationService appLaunchToken](self, "appLaunchToken"));
              v31 = (void *)objc_claimAutoreleasedReturnValue([v4 appLaunchToken]);
              v32 = (void *)v17;
              if (PKEqualObjects(v17, v31))
              {
                uint64_t v18 = objc_claimAutoreleasedReturnValue(-[PDNotificationService deviceIdentifier](self, "deviceIdentifier"));
                v29 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
                v30 = (void *)v18;
                if (PKEqualObjects(v18, v29))
                {
                  uint64_t v19 = objc_claimAutoreleasedReturnValue(-[PDNotificationService lastUpdatedDate](self, "lastUpdatedDate"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdatedDate]);
                  v28 = (void *)v19;
                  if (PKEqualObjects(v19, v27))
                  {
                    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[PDNotificationService lastUpdatedTag](self, "lastUpdatedTag"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdatedTag]);
                    v26 = (void *)v20;
                    if (PKEqualObjects(v20, v25))
                    {
                      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationService lastUpdatedTagDate](self, "lastUpdatedTagDate"));
                      v24 = (void *)objc_claimAutoreleasedReturnValue([v4 lastUpdatedTagDate]);
                      char v22 = PKEqualObjects(v21, v24);
                    }

                    else
                    {
                      char v22 = 0;
                    }

                    v14 = v33;
                  }

                  else
                  {
                    char v22 = 0;
                    v14 = v33;
                  }
                }

                else
                {
                  char v22 = 0;
                  v14 = v33;
                }
              }

              else
              {
                char v22 = 0;
                v14 = v33;
              }
            }

            else
            {
              char v22 = 0;
              v14 = v33;
            }
          }

          else
          {
            char v22 = 0;
          }
        }

        else
        {
          char v22 = 0;
        }
      }

      else
      {
        char v22 = 0;
      }
    }

    else
    {
      char v22 = 0;
    }
  }

  else
  {
    char v22 = 0;
  }

  return v22;
}

- (BOOL)matchesNotificationService:(id)a3
{
  id v4 = a3;
  id v5 = -[PDNotificationService serviceType](self, "serviceType");
  if (v5 == [v4 serviceType])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationService serviceURL](self, "serviceURL"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceURL]);
    if (PKEqualObjects(v6, v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationService registrationURL](self, "registrationURL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 registrationURL]);
      if (PKEqualObjects(v8, v9))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationService pushTopic](self, "pushTopic"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v4 pushTopic]);
        char v12 = PKEqualObjects(v10, v11);
      }

      else
      {
        char v12 = 0;
      }
    }

    else
    {
      char v12 = 0;
    }
  }

  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  unint64_t v3 = -[PDNotificationService serviceType](self, "serviceType");
  id v4 = @"Message";
  if (!v3) {
    id v4 = @"Transaction";
  }
  id v5 = v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationService serviceURL](self, "serviceURL"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationService registrationURL](self, "registrationURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Service Type: %@, Service URL: %@, Registration URL: %@",  v5,  v6,  v7));

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationService)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___PDNotificationService;
  id v5 = -[PDNotificationService init](&v47, "init");
  if (v5)
  {
    v5->_serviceType = (unint64_t)[v4 decodeIntegerForKey:@"serviceType"];
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL, v6), @"serviceURL");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    serviceURL = v5->_serviceURL;
    v5->_serviceURL = (NSURL *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSURL, v10),  @"registrationURL");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    registrationURL = v5->_registrationURL;
    v5->_registrationURL = (NSURL *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v14),  @"pushTopic");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    pushTopic = v5->_pushTopic;
    v5->_pushTopic = (NSString *)v16;

    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v18),  @"pushToken");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v20;

    id v23 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v22),  @"authenticationToken");
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    authenticationToken = v5->_authenticationToken;
    v5->_authenticationToken = (NSString *)v24;

    id v27 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v26),  @"appLaunchToken");
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    appLaunchToken = v5->_appLaunchToken;
    v5->_appLaunchToken = (NSString *)v28;

    id v31 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v30),  @"deviceIdentifier");
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v32;

    id v35 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v34),  @"lastUpdatedDate");
    uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v36;

    id v39 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v38),  @"lastUpdatedTag");
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);
    lastUpdatedTag = v5->_lastUpdatedTag;
    v5->_lastUpdatedTag = (NSString *)v40;

    id v43 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v42),  @"lastUpdatedTagDate");
    uint64_t v44 = objc_claimAutoreleasedReturnValue(v43);
    lastUpdatedTagDate = v5->_lastUpdatedTagDate;
    v5->_lastUpdatedTagDate = (NSDate *)v44;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t serviceType = self->_serviceType;
  id v5 = a3;
  [v5 encodeInteger:serviceType forKey:@"serviceType"];
  [v5 encodeObject:self->_serviceURL forKey:@"serviceURL"];
  [v5 encodeObject:self->_registrationURL forKey:@"registrationURL"];
  [v5 encodeObject:self->_pushTopic forKey:@"pushTopic"];
  [v5 encodeObject:self->_pushToken forKey:@"pushToken"];
  [v5 encodeObject:self->_authenticationToken forKey:@"authenticationToken"];
  [v5 encodeObject:self->_appLaunchToken forKey:@"appLaunchToken"];
  [v5 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v5 encodeObject:self->_lastUpdatedDate forKey:@"lastUpdatedDate"];
  [v5 encodeObject:self->_lastUpdatedTag forKey:@"lastUpdatedTag"];
  [v5 encodeObject:self->_lastUpdatedTagDate forKey:@"lastUpdatedTagDate"];
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unint64_t)a3
{
  self->_unint64_t serviceType = a3;
}

- (NSURL)serviceURL
{
  return self->_serviceURL;
}

- (void)setServiceURL:(id)a3
{
}

- (NSURL)registrationURL
{
  return self->_registrationURL;
}

- (void)setRegistrationURL:(id)a3
{
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (NSString)appLaunchToken
{
  return self->_appLaunchToken;
}

- (void)setAppLaunchToken:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (void)setLastUpdatedTag:(id)a3
{
}

- (NSDate)lastUpdatedTagDate
{
  return self->_lastUpdatedTagDate;
}

- (void)setLastUpdatedTagDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end