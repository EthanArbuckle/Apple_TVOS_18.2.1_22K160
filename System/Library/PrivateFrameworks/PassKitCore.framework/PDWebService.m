@interface PDWebService
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)deviceIdentifier;
- (NSString)passTypeIdentifier;
- (NSString)pushToken;
- (NSString)teamIdentifier;
- (NSURL)serviceURL;
- (PDWebService)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)generateNewDeviceIdentifier;
- (void)setDeviceIdentifier:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setServiceURL:(id)a3;
- (void)setTeamIdentifier:(id)a3;
@end

@implementation PDWebService

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    passTypeIdentifier = self->_passTypeIdentifier;
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
    if ((unint64_t)passTypeIdentifier | v8
      && !-[NSString isEqual:](passTypeIdentifier, "isEqual:", v8))
    {
      unsigned __int8 v17 = 0;
    }

    else
    {
      teamIdentifier = self->_teamIdentifier;
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
      if ((unint64_t)teamIdentifier | v10
        && !-[NSString isEqual:](teamIdentifier, "isEqual:", v10))
      {
        unsigned __int8 v17 = 0;
      }

      else
      {
        serviceURL = self->_serviceURL;
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 serviceURL]);
        if ((unint64_t)serviceURL | v12 && !-[NSURL isEqual:](serviceURL, "isEqual:", v12))
        {
          unsigned __int8 v17 = 0;
        }

        else
        {
          pushToken = self->_pushToken;
          uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 pushToken]);
          if ((unint64_t)pushToken | v14 && !-[NSString isEqual:](pushToken, "isEqual:", v14))
          {
            unsigned __int8 v17 = 0;
          }

          else
          {
            deviceIdentifier = self->_deviceIdentifier;
            uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
            else {
              unsigned __int8 v17 = 1;
            }
          }
        }
      }
    }
  }

  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebService passTypeIdentifier](self, "passTypeIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebService serviceURL](self, "serviceURL"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebService pushToken](self, "pushToken"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebService deviceIdentifier](self, "deviceIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<PassTypeID: %@> <URL: %@> <Push token: %@> <Device identifier: %@>",  v3,  v4,  v5,  v6));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDWebService)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PDWebService;
  uint64_t v6 = -[PDWebService init](&v27, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"passTypeIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    passTypeIdentifier = v6->_passTypeIdentifier;
    v6->_passTypeIdentifier = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"teamIdentifier");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    teamIdentifier = v6->_teamIdentifier;
    v6->_teamIdentifier = (NSString *)v12;

    id v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL, v14), @"serviceURL");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    serviceURL = v6->_serviceURL;
    v6->_serviceURL = (NSURL *)v16;

    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v18),  @"pushToken");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    pushToken = v6->_pushToken;
    v6->_pushToken = (NSString *)v20;

    id v23 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v22),  @"deviceIdentifier");
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSString *)v24;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  passTypeIdentifier = self->_passTypeIdentifier;
  id v5 = a3;
  [v5 encodeObject:passTypeIdentifier forKey:@"passTypeIdentifier"];
  [v5 encodeObject:self->_teamIdentifier forKey:@"teamIdentifier"];
  [v5 encodeObject:self->_serviceURL forKey:@"serviceURL"];
  [v5 encodeObject:self->_pushToken forKey:@"pushToken"];
  [v5 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
}

- (void)generateNewDeviceIdentifier
{
  uint64_t v3 = PDGenerateRandomDeviceIdentifier(self);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[PDWebService setDeviceIdentifier:](self, "setDeviceIdentifier:", v4);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
}

- (NSURL)serviceURL
{
  return self->_serviceURL;
}

- (void)setServiceURL:(id)a3
{
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end