@interface UAMockActivityAdvertisement
+ (BOOL)supportsSecureCoding;
- (NSData)advertisementPayload;
- (NSDictionary)options;
- (SFPeerDevice)device;
- (UAMockActivityAdvertisement)init;
- (UAMockActivityAdvertisement)initWithCoder:(id)a3;
- (id)description;
- (int64_t)advertisementVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertisementPayload:(id)a3;
- (void)setAdvertisementVersion:(int64_t)a3;
- (void)setDevice:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation UAMockActivityAdvertisement

- (UAMockActivityAdvertisement)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UAMockActivityAdvertisement;
  return -[UAMockActivityAdvertisement init](&v3, "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[UAMockActivityAdvertisement advertisementVersion](self, "advertisementVersion"),  @"version");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertisement advertisementPayload](self, "advertisementPayload"));
  [v4 encodeObject:v5 forKey:@"payload"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertisement options](self, "options"));
  [v4 encodeObject:v6 forKey:@"options"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertisement device](self, "device"));
  [v4 encodeObject:v7 forKey:@"device"];
}

- (UAMockActivityAdvertisement)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___UAMockActivityAdvertisement;
  v5 = -[UAMockActivityAdvertisement init](&v16, "init");
  if (v5)
  {
    v5->_advertisementVersion = (int)[v4 decodeInt32ForKey:@"version"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"payload"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    advertisementPayload = v5->_advertisementPayload;
    v5->_advertisementPayload = (NSData *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"options"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    options = v5->_options;
    v5->_options = (NSDictionary *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(SFPeerDevice) forKey:@"device"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    device = v5->_device;
    v5->_device = (SFPeerDevice *)v13;
  }

  return v5;
}

- (id)description
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertisement advertisementPayload](self, "advertisementPayload"));
  id v6 = sub_1000034D8(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertisement options](self, "options"));
  if (v8)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertisement options](self, "options"));
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);
    id v9 = sub_10005BF18(v3);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    uint64_t v10 = &stru_1000BE738;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UAMockActivityAdvertisement device](self, "device"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MockAdvertisement($%@/%@ from %@)",  v7,  v10,  v11));

  if (v8)
  {
  }

  return v12;
}

- (int64_t)advertisementVersion
{
  return self->_advertisementVersion;
}

- (void)setAdvertisementVersion:(int64_t)a3
{
  self->_advertisementVersion = a3;
}

- (NSData)advertisementPayload
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAdvertisementPayload:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setOptions:(id)a3
{
}

- (SFPeerDevice)device
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end