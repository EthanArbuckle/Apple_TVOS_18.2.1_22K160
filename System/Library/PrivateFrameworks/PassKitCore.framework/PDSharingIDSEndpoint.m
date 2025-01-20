@interface PDSharingIDSEndpoint
- (NSDate)createdAt;
- (NSDate)updatedAt;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)idsCorrelationIdentifier;
- (NSString)transportIdentifier;
- (PDSharingIDSEndpoint)init;
- (PDSharingIDSEndpoint)initWithDeviceIdentifier:(id)a3;
- (PDSharingIDSEndpoint)initWithSessionIdentifier:(id)a3;
- (PDSharingIDSEndpoint)initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4;
- (id)_initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4;
- (unint64_t)channelType;
- (unint64_t)isDeviceOnSameIDSAccount;
- (unint64_t)provisioningType;
- (void)setChannelType:(unint64_t)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setIdsCorrelationIdentifier:(id)a3;
- (void)setIsDeviceOnSameIDSAccount:(unint64_t)a3;
- (void)setProvisioningType:(unint64_t)a3;
- (void)setTransportIdentifier:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation PDSharingIDSEndpoint

- (PDSharingIDSEndpoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDSharingIDSEndpoint;
  return -[PDSharingIDSEndpoint init](&v3, "init");
}

- (PDSharingIDSEndpoint)initWithDeviceIdentifier:(id)a3
{
  return (PDSharingIDSEndpoint *)-[PDSharingIDSEndpoint _initWithSessionIdentifier:deviceIdentifier:]( self,  "_initWithSessionIdentifier:deviceIdentifier:",  0LL,  a3);
}

- (PDSharingIDSEndpoint)initWithSessionIdentifier:(id)a3
{
  return (PDSharingIDSEndpoint *)-[PDSharingIDSEndpoint _initWithSessionIdentifier:deviceIdentifier:]( self,  "_initWithSessionIdentifier:deviceIdentifier:",  a3,  0LL);
}

- (PDSharingIDSEndpoint)initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4
{
  return (PDSharingIDSEndpoint *)-[PDSharingIDSEndpoint _initWithSessionIdentifier:deviceIdentifier:]( self,  "_initWithSessionIdentifier:deviceIdentifier:",  a3,  a4);
}

- (id)_initWithSessionIdentifier:(id)a3 deviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PDSharingIDSEndpoint;
  v8 = -[PDSharingIDSEndpoint init](&v17, "init");
  v9 = (int64x2_t *)v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_deviceIdentifier, a4);
    if (v6)
    {
      id v10 = v6;
      v11 = (NSUUID *)v9->i64[1];
      v9->i64[1] = (uint64_t)v10;
    }

    else
    {
      v11 = objc_alloc_init(&OBJC_CLASS___NSUUID);
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v11, "UUIDString"));
      v13 = (void *)v9->i64[1];
      v9->i64[1] = v12;
    }

    v9[1] = vdupq_n_s64(2uLL);
    v14 = objc_alloc_init(&OBJC_CLASS___NSDate);
    v15 = (void *)v9[2].i64[0];
    v9[2].i64[0] = (uint64_t)v14;
  }

  return v9;
}

- (void)setCreatedAt:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_createdAt, a3);
  updatedAt = self->_updatedAt;
  p_updatedAt = &self->_updatedAt;
  if (!updatedAt) {
    objc_storeStrong((id *)p_updatedAt, a3);
  }
}

- (void)setUpdatedAt:(id)a3
{
}

- (NSString)description
{
  objc_super v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 appendFormat:@"deviceIdentifier: '%@'; ", self->_deviceIdentifier];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingIDSEndpoint transportIdentifier](self, "transportIdentifier"));
  [v4 appendFormat:@"transportIdentifier: '%@'; ", v5];

  unint64_t provisioningType = self->_provisioningType;
  id v7 = @"unknown";
  v8 = @"stateful";
  if (provisioningType != 2) {
    v8 = @"unknown";
  }
  if (provisioningType == 1) {
    v9 = @"stateless";
  }
  else {
    v9 = v8;
  }
  [v4 appendFormat:@"provisioningType: '%@'; ", v9];
  unint64_t v10 = self->_channelType - 1;
  if (v10 <= 2) {
    id v7 = off_100652D18[v10];
  }
  [v4 appendFormat:@"channelType: '%@'; ", v7];
  [v4 appendFormat:@"idsCorrelationIdentifier: '%@'; ", self->_idsCorrelationIdentifier];
  [v4 appendFormat:@">"];
  id v11 = [v4 copy];

  return (NSString *)v11;
}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (void)setTransportIdentifier:(id)a3
{
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(unint64_t)a3
{
  self->_channelType = a3;
}

- (unint64_t)provisioningType
{
  return self->_provisioningType;
}

- (void)setProvisioningType:(unint64_t)a3
{
  self->_unint64_t provisioningType = a3;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (unint64_t)isDeviceOnSameIDSAccount
{
  return self->_isDeviceOnSameIDSAccount;
}

- (void)setIsDeviceOnSameIDSAccount:(unint64_t)a3
{
  self->_isDeviceOnSameIDSAccount = a3;
}

- (NSString)idsCorrelationIdentifier
{
  return self->_idsCorrelationIdentifier;
}

- (void)setIdsCorrelationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end