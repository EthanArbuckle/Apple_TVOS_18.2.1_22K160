@interface NEPrivateLTENetwork
+ (BOOL)supportsSecureCoding;
- (NEPrivateLTENetwork)initWithCoder:(id)a3;
- (NSString)mobileCountryCode;
- (NSString)mobileNetworkCode;
- (NSString)trackingAreaCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMobileCountryCode:(NSString *)mobileCountryCode;
- (void)setMobileNetworkCode:(NSString *)mobileNetworkCode;
- (void)setTrackingAreaCode:(NSString *)trackingAreaCode;
@end

@implementation NEPrivateLTENetwork

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[NEPrivateLTENetwork mobileCountryCode](self, "mobileCountryCode");
  v5 = -[NEPrivateLTENetwork mobileNetworkCode](self, "mobileNetworkCode");
  v6 = -[NEPrivateLTENetwork trackingAreaCode](self, "trackingAreaCode");
  if (v6)
  {
    v7 = -[NEPrivateLTENetwork trackingAreaCode](self, "trackingAreaCode");
    [v3 stringWithFormat:@"Mobile Country Code:[%@] Mobile Network Code:[%@] Tracking Area Code:[%@]", v4, v5, v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v3 stringWithFormat:@"Mobile Country Code:[%@] Mobile Network Code:[%@] Tracking Area Code:[%@]", v4, v5, &stru_18A0915E8];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NEPrivateLTENetwork)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEPrivateLTENetwork;
  v5 = -[NEPrivateLTENetwork init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLTEMCC"];
    mobileCountryCode = v5->_mobileCountryCode;
    v5->_mobileCountryCode = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLTEMNC"];
    mobileNetworkCode = v5->_mobileNetworkCode;
    v5->_mobileNetworkCode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PLTETAC"];
    trackingAreaCode = v5->_trackingAreaCode;
    v5->_trackingAreaCode = (NSString *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEPrivateLTENetwork mobileCountryCode](self, "mobileCountryCode");
  [v4 encodeObject:v5 forKey:@"PLTEMCC"];

  -[NEPrivateLTENetwork mobileNetworkCode](self, "mobileNetworkCode");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"PLTEMNC"];

  -[NEPrivateLTENetwork trackingAreaCode](self, "trackingAreaCode");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"PLTETAC"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEPrivateLTENetwork init]( +[NEPrivateLTENetwork allocWithZone:](&OBJC_CLASS___NEPrivateLTENetwork, "allocWithZone:", a3),  "init");
  v5 = -[NEPrivateLTENetwork mobileCountryCode](self, "mobileCountryCode");
  -[NEPrivateLTENetwork setMobileCountryCode:](v4, "setMobileCountryCode:", v5);

  -[NEPrivateLTENetwork mobileNetworkCode](self, "mobileNetworkCode");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPrivateLTENetwork setMobileNetworkCode:](v4, "setMobileNetworkCode:", v6);

  -[NEPrivateLTENetwork trackingAreaCode](self, "trackingAreaCode");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPrivateLTENetwork setTrackingAreaCode:](v4, "setTrackingAreaCode:", v7);

  return v4;
}

- (NSString)mobileCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setMobileCountryCode:(NSString *)mobileCountryCode
{
}

- (NSString)mobileNetworkCode
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setMobileNetworkCode:(NSString *)mobileNetworkCode
{
}

- (NSString)trackingAreaCode
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTrackingAreaCode:(NSString *)trackingAreaCode
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end