@interface NISpatialBrowsingConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)new;
+ (id)responderConfigurationWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResponder;
- (NISpatialBrowsingConfiguration)init;
- (NISpatialBrowsingConfiguration)initWithCoder:(id)a3;
- (NSString)deviceIdentifier;
- (double)maxNearbyObjectAge;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)updatesPolicy;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setMaxNearbyObjectAge:(double)a3;
- (void)setResponder:(BOOL)a3;
- (void)setUpdatesPolicy:(int64_t)a3;
@end

@implementation NISpatialBrowsingConfiguration

+ (id)responderConfigurationWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2 object:a1 file:@"NISpatialBrowsingConfiguration.mm" lineNumber:24 description:@"deviceIdentifier cannot be nil."];
  }

  v6 = objc_alloc_init(&OBJC_CLASS___NISpatialBrowsingConfiguration);
  -[NISpatialBrowsingConfiguration setResponder:](v6, "setResponder:", 1LL);
  -[NISpatialBrowsingConfiguration setDeviceIdentifier:](v6, "setDeviceIdentifier:", v5);

  return v6;
}

- (NISpatialBrowsingConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NISpatialBrowsingConfiguration;
  v2 = -[NIConfiguration initInternal](&v6, "initInternal");
  v3 = v2;
  if (v2)
  {
    v2->_responder = 0;
    v2->_updatesPolicy = 1LL;
    deviceIdentifier = v2->_deviceIdentifier;
    v2->_deviceIdentifier = 0LL;

    v3->_maxNearbyObjectAge = 10.0;
  }

  return v3;
}

+ (id)new
{
  return objc_alloc_init(&OBJC_CLASS___NISpatialBrowsingConfiguration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NISpatialBrowsingConfiguration;
  id v4 = -[NIConfiguration copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 setResponder:self->_responder];
  [v4 setDeviceIdentifier:self->_deviceIdentifier];
  [v4 setUpdatesPolicy:self->_updatesPolicy];
  [v4 setMaxNearbyObjectAge:self->_maxNearbyObjectAge];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NISpatialBrowsingConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  [v4 encodeBool:self->_responder forKey:@"responder"];
  [v4 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v4 encodeInteger:self->_updatesPolicy forKey:@"updatesPolicy"];
  [v4 encodeDouble:@"maxNearbyObjectAge" forKey:self->_maxNearbyObjectAge];
}

- (NISpatialBrowsingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NISpatialBrowsingConfiguration;
  objc_super v5 = -[NIConfiguration initWithCoder:](&v16, "initWithCoder:", v4);
  if (v5 && (id v7 = [v4 decodeIntegerForKey:@"updatesPolicy"], (unint64_t)v7 < 2))
  {
    id v8 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v6),  @"deviceIdentifier");
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    unsigned __int8 v10 = [v4 decodeBoolForKey:@"responder"];
    [v4 decodeDoubleForKey:@"maxNearbyObjectAge"];
    double v12 = v11;
    v5->_responder = v10;
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v9;

    v5->_updatesPolicy = (int64_t)v7;
    v5->_maxNearbyObjectAge = v12;
    v14 = v5;
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = (NISpatialBrowsingConfiguration *)v4;
    id v8 = v7;
    if (v7 == self)
    {
      char v15 = 1;
    }

    else
    {
      unsigned int v9 = -[NISpatialBrowsingConfiguration isResponder](v7, "isResponder");
      int responder = self->_responder;
      id v11 = -[NISpatialBrowsingConfiguration updatesPolicy](v8, "updatesPolicy");
      int64_t updatesPolicy = self->_updatesPolicy;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NISpatialBrowsingConfiguration deviceIdentifier](v8, "deviceIdentifier"));
      if (v13) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = self->_deviceIdentifier == 0LL;
      }

      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[NISpatialBrowsingConfiguration deviceIdentifier](v8, "deviceIdentifier"));
      unsigned __int8 v17 = [v16 isEqualToString:self->_deviceIdentifier];

      -[NISpatialBrowsingConfiguration maxNearbyObjectAge](v8, "maxNearbyObjectAge");
      char v15 = 0;
      if (responder == v9 && v11 == (id)updatesPolicy)
      {
        if (v18 == self->_maxNearbyObjectAge) {
          char v15 = v14 | v17;
        }
        else {
          char v15 = 0;
        }
      }
    }
  }

  else
  {
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_deviceIdentifier, "hash");
  BOOL responder = self->_responder;
  int64_t updatesPolicy = self->_updatesPolicy;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_maxNearbyObjectAge));
  unint64_t v7 = v3 ^ responder ^ updatesPolicy ^ (unint64_t)[v6 hash];

  return v7;
}

- (id)description
{
  NSUInteger v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NISpatialBrowsingConfiguration descriptionInternal](self, "descriptionInternal"));
  unsigned int v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  if (self->_responder) {
    v2 = @"Yes";
  }
  else {
    v2 = @"No";
  }
  if (self->_updatesPolicy == 1) {
    NSUInteger v3 = @"SignificantChanges";
  }
  else {
    NSUInteger v3 = @"Stream";
  }
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<maxNearbyObjectAge: %0.2fsec, isResponder: %@, deviceIdentifier: %@, updatesPolicy: %@>",  *(void *)&self->_maxNearbyObjectAge,  v2,  self->_deviceIdentifier,  v3));
}

- (int64_t)updatesPolicy
{
  return self->_updatesPolicy;
}

- (void)setUpdatesPolicy:(int64_t)a3
{
  self->_int64_t updatesPolicy = a3;
}

- (BOOL)isResponder
{
  return self->_responder;
}

- (void)setResponder:(BOOL)a3
{
  self->_BOOL responder = a3;
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (double)maxNearbyObjectAge
{
  return self->_maxNearbyObjectAge;
}

- (void)setMaxNearbyObjectAge:(double)a3
{
  self->_maxNearbyObjectAge = a3;
}

- (void).cxx_destruct
{
}

@end