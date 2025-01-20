@interface PDSharingLocalOnDeviceEndpoint
- (BOOL)isSource;
- (NSDate)createdAt;
- (NSDate)updatedAt;
- (NSString)description;
- (NSString)destinationTransportIdentifier;
- (NSString)sourceTransportIdentifier;
- (NSString)transportIdentifier;
- (PDSharingLocalOnDeviceEndpoint)init;
- (PDSharingLocalOnDeviceEndpoint)initWithSourceTransportIdentifier:(id)a3 destinationTransportIdentifier:(id)a4 isSource:(BOOL)a5;
- (id)createContraEndpoint;
- (unint64_t)channelType;
- (unint64_t)provisioningType;
- (void)setChannelType:(unint64_t)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDestinationTransportIdentifier:(id)a3;
- (void)setProvisioningType:(unint64_t)a3;
- (void)setSourceTransportIdentifier:(id)a3;
- (void)setTransportIdentifier:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation PDSharingLocalOnDeviceEndpoint

- (PDSharingLocalOnDeviceEndpoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDSharingLocalOnDeviceEndpoint;
  return -[PDSharingLocalOnDeviceEndpoint init](&v3, "init");
}

- (PDSharingLocalOnDeviceEndpoint)initWithSourceTransportIdentifier:(id)a3 destinationTransportIdentifier:(id)a4 isSource:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PDSharingLocalOnDeviceEndpoint;
  v11 = -[PDSharingLocalOnDeviceEndpoint init](&v17, "init");
  v12 = v11;
  if (v11)
  {
    if (v5) {
      v13 = v9;
    }
    else {
      v13 = v10;
    }
    objc_storeStrong((id *)&v11->_transportIdentifier, v13);
    *(_OWORD *)&v12->_channelType = xmmword_1004D7830;
    v14 = objc_alloc_init(&OBJC_CLASS___NSDate);
    createdAt = v12->_createdAt;
    v12->_createdAt = v14;

    objc_storeStrong((id *)&v12->_sourceTransportIdentifier, a3);
    objc_storeStrong((id *)&v12->_destinationTransportIdentifier, a4);
  }

  return v12;
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
  [v4 appendFormat:@"sourceTransportIdentifier: '%@'; ", self->_sourceTransportIdentifier];
  objc_msgSend( v4,  "appendFormat:",  @"destinationTransportIdentifier: '%@'; ",
    self->_destinationTransportIdentifier);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingLocalOnDeviceEndpoint transportIdentifier](self, "transportIdentifier"));
  [v4 appendFormat:@"transportIdentifier: '%@'; ", v5];

  unint64_t provisioningType = self->_provisioningType;
  id v7 = @"unknown";
  v8 = @"stateful";
  if (provisioningType != 2) {
    v8 = @"unknown";
  }
  if (provisioningType == 1) {
    id v9 = @"stateless";
  }
  else {
    id v9 = v8;
  }
  [v4 appendFormat:@"provisioningType: '%@'; ", v9];
  unint64_t v10 = self->_channelType - 1;
  if (v10 <= 2) {
    id v7 = *(&off_100659440 + v10);
  }
  [v4 appendFormat:@"channelType: '%@'; ", v7];
  [v4 appendFormat:@">"];
  id v11 = [v4 copy];

  return (NSString *)v11;
}

- (BOOL)isSource
{
  return PKEqualObjects(self->_transportIdentifier, self->_sourceTransportIdentifier);
}

- (id)createContraEndpoint
{
  return -[PDSharingLocalOnDeviceEndpoint initWithSourceTransportIdentifier:destinationTransportIdentifier:isSource:]( objc_alloc(&OBJC_CLASS___PDSharingLocalOnDeviceEndpoint),  "initWithSourceTransportIdentifier:destinationTransportIdentifier:isSource:",  self->_sourceTransportIdentifier,  self->_destinationTransportIdentifier,  -[PDSharingLocalOnDeviceEndpoint isSource](self, "isSource") ^ 1);
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

- (NSString)sourceTransportIdentifier
{
  return self->_sourceTransportIdentifier;
}

- (void)setSourceTransportIdentifier:(id)a3
{
}

- (NSString)destinationTransportIdentifier
{
  return self->_destinationTransportIdentifier;
}

- (void)setDestinationTransportIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end