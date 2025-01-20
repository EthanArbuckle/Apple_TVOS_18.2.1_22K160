@interface NIBluetoothSample
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NIBluetoothSample)initWithBluetoothSample:(id)a3;
- (NIBluetoothSample)initWithCoder:(id)a3;
- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7;
- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7 partIdentifier:(id)a8 name:(id)a9 presenceConfigData:(id)a10;
- (NSData)presenceConfigData;
- (NSString)identifier;
- (NSString)model;
- (NSString)name;
- (NSString)partIdentifier;
- (double)machContinuousTimeSeconds;
- (double)rssi;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int)channel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setPresenceConfigData:(id)a3;
@end

@implementation NIBluetoothSample

- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7
{
  return -[NIBluetoothSample initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:partIdentifier:name:presenceConfigData:]( self,  "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:partIdentifier:name:presenceConfigData:",  a4,  a5,  *(void *)&a6,  &stru_1007C41E0,  0LL,  0LL,  a3,  a7);
}

- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7 partIdentifier:(id)a8 name:(id)a9 presenceConfigData:(id)a10
{
  id v26 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (self)
  {
    self->_rssi = a3;
    objc_storeStrong((id *)&self->_identifier, a4);
    if (v19) {
      v23 = (__CFString *)v19;
    }
    else {
      v23 = @"NONE";
    }
    model = self->_model;
    self->_model = &v23->isa;

    self->_channel = a6;
    self->_machContinuousTimeSeconds = a7;
    objc_storeStrong((id *)&self->_partIdentifier, a8);
    objc_storeStrong((id *)&self->_name, a9);
    objc_storeStrong((id *)&self->_presenceConfigData, a10);
  }

  return self;
}

- (NIBluetoothSample)initWithBluetoothSample:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v20 handleFailureInMethod:a2, self, @"NIBluetoothSample.mm", 53, @"Invalid parameter not satisfying: %@", @"sample" object file lineNumber description];
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NIBluetoothSample;
  v6 = -[NIBluetoothSample init](&v21, "init");
  if (v6)
  {
    [v5 rssi];
    v6->_rssi = v7;
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 identifier]);
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 model]);
    model = v6->_model;
    v6->_model = (NSString *)v10;

    v6->_channel = [v5 channel];
    [v5 machContinuousTimeSeconds];
    v6->_machContinuousTimeSeconds = v12;
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 partIdentifier]);
    partIdentifier = v6->_partIdentifier;
    v6->_partIdentifier = (NSString *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v5 name]);
    name = v6->_name;
    v6->_name = (NSString *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v5 presenceConfigData]);
    presenceConfigData = v6->_presenceConfigData;
    v6->_presenceConfigData = (NSData *)v17;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _[v4 initWithBluetoothSample:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"rssi" forKey:self->_rssi];
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  [v4 encodeObject:self->_model forKey:@"model"];
  [v4 encodeInt:self->_channel forKey:@"channel"];
  [v4 encodeDouble:@"machContinuousTimeSeconds" forKey:self->_machContinuousTimeSeconds];
  [v4 encodeObject:self->_partIdentifier forKey:@"partIdentifier"];
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeObject:self->_presenceConfigData forKey:@"presenceConfigData"];
}

- (NIBluetoothSample)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"identifier");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v8), @"model");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v7
    && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v10),
        (objc_opt_isKindOfClass(v7, v12) & (v11 != 0LL)) == 1)
    && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13), (objc_opt_isKindOfClass(v11, v14) & 1) != 0))
  {
    [v4 decodeDoubleForKey:@"rssi"];
    double v16 = v15;
    unsigned int v17 = [v4 decodeIntForKey:@"channel"];
    [v4 decodeDoubleForKey:@"machContinuousTimeSeconds"];
    double v19 = v18;
    id v21 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v20),  @"partIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (v23)
    {
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v22);
      if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
      {

        v23 = 0LL;
      }
    }

    id v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v22), @"name");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (v27)
    {
      uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v26);
      if ((objc_opt_isKindOfClass(v27, v28) & 1) == 0)
      {

        v27 = 0LL;
      }
    }

    id v29 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v26),  @"presenceConfigData");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v35.receiver = self;
    v35.super_class = (Class)&OBJC_CLASS___NIBluetoothSample;
    v31 = -[NIBluetoothSample init](&v35, "init");
    v32 = v31;
    if (v31)
    {
      v31->_rssi = v16;
      objc_storeStrong((id *)&v31->_identifier, v7);
      objc_storeStrong((id *)&v32->_model, v11);
      v32->_channel = v17;
      v32->_machContinuousTimeSeconds = v19;
      objc_storeStrong((id *)&v32->_partIdentifier, v23);
      objc_storeStrong((id *)&v32->_name, v27);
      objc_storeStrong((id *)&v32->_presenceConfigData, v30);
    }

    self = v32;

    v33 = self;
  }

  else
  {
    v33 = 0LL;
  }

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    double v7 = (NIBluetoothSample *)v4;
    uint64_t v8 = v7;
    if (v7 == self)
    {
      char v39 = 1;
LABEL_32:

      goto LABEL_33;
    }

    identifier = self->_identifier;
    if (!identifier)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample identifier](v7, "identifier"));

      if (!v10)
      {
        unsigned __int8 v12 = 1;
LABEL_7:
        model = self->_model;
        if (!model)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample model](v8, "model"));

          if (!v14)
          {
            unsigned __int8 v16 = 1;
LABEL_11:
            double rssi = self->_rssi;
            -[NIBluetoothSample rssi](v8, "rssi");
            double v19 = v18;
            int channel = self->_channel;
            unsigned int v41 = -[NIBluetoothSample channel](v8, "channel");
            double machContinuousTimeSeconds = self->_machContinuousTimeSeconds;
            -[NIBluetoothSample machContinuousTimeSeconds](v8, "machContinuousTimeSeconds");
            double v23 = v22;
            partIdentifier = self->_partIdentifier;
            if (!partIdentifier)
            {
              id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample partIdentifier](v8, "partIdentifier"));

              if (!v25)
              {
                unsigned __int8 v27 = 1;
LABEL_15:
                name = self->_name;
                if (!name)
                {
                  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample name](v8, "name"));

                  if (!v29)
                  {
                    unsigned __int8 v31 = v12;
                    char v33 = 0;
LABEL_19:
                    presenceConfigData = self->_presenceConfigData;
                    if (!presenceConfigData)
                    {
                      objc_super v35 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample presenceConfigData](v8, "presenceConfigData"));

                      if (!v35)
                      {
                        unsigned __int8 v37 = 1;
                        goto LABEL_23;
                      }

                      presenceConfigData = self->_presenceConfigData;
                    }

                    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample presenceConfigData](v8, "presenceConfigData"));
                    unsigned __int8 v37 = -[NSData isEqualToData:](presenceConfigData, "isEqualToData:", v36);

LABEL_23:
                    char v38 = v31 & v16 ^ 1;
                    if (rssi != v19) {
                      char v38 = 1;
                    }
                    if (channel != v41) {
                      char v38 = 1;
                    }
                    if (machContinuousTimeSeconds != v23) {
                      char v38 = 1;
                    }
                    char v39 = v27 & ~(v38 | v33) & v37;
                    goto LABEL_32;
                  }

                  name = self->_name;
                }

                v30 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample name](v8, "name"));
                unsigned __int8 v31 = v12;
                unsigned __int8 v32 = -[NSString isEqualToString:](name, "isEqualToString:", v30);

                char v33 = v32 ^ 1;
                goto LABEL_19;
              }

              partIdentifier = self->_partIdentifier;
            }

            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample partIdentifier](v8, "partIdentifier"));
            unsigned __int8 v27 = -[NSString isEqualToString:](partIdentifier, "isEqualToString:", v26);

            goto LABEL_15;
          }

          model = self->_model;
        }

        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample model](v8, "model"));
        unsigned __int8 v16 = -[NSString isEqualToString:](model, "isEqualToString:", v15);

        goto LABEL_11;
      }

      identifier = self->_identifier;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample identifier](v8, "identifier"));
    unsigned __int8 v12 = -[NSString isEqualToString:](identifier, "isEqualToString:", v11);

    goto LABEL_7;
  }

  char v39 = 0;
LABEL_33:

  return v39;
}

- (unint64_t)hash
{
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_rssi));
  unint64_t v3 = (unint64_t)[v14 hash];
  NSUInteger v4 = -[NSString hash](self->_identifier, "hash");
  NSUInteger v5 = -[NSString hash](self->_model, "hash");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_channel));
  unint64_t v7 = (unint64_t)[v6 hash];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_machContinuousTimeSeconds));
  unint64_t v9 = (unint64_t)[v8 hash];
  NSUInteger v10 = -[NSString hash](self->_name, "hash");
  NSUInteger v11 = -[NSString hash](self->_partIdentifier, "hash");
  unint64_t v12 = v4 ^ v3 ^ v5 ^ v7 ^ v9 ^ v10 ^ v11 ^ (unint64_t)-[NSData hash](self->_presenceConfigData, "hash");

  return v12;
}

- (id)description
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  NSUInteger v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: ", v7);

  -[NSMutableString appendFormat:](v8, "appendFormat:", @"Identifier: %@", self->_identifier);
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", RSSI: %.2f", *(void *)&self->_rssi);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", Mach Continuous Time Seconds: %f",  *(void *)&self->_machContinuousTimeSeconds);
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", Channel: %d", self->_channel);
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", Model: %@", self->_model);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIBluetoothSample descriptionInternal](self, "descriptionInternal"));
  -[NSMutableString appendString:](v8, "appendString:", v9);

  -[NSMutableString appendString:](v8, "appendString:", @">");
  return v8;
}

- (id)descriptionInternal
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", partIdentifier: %@",  self->_partIdentifier);
}

- (double)rssi
{
  return self->_rssi;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (int)channel
{
  return self->_channel;
}

- (double)machContinuousTimeSeconds
{
  return self->_machContinuousTimeSeconds;
}

- (NSString)partIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSData)presenceConfigData
{
  return self->_presenceConfigData;
}

- (void)setPresenceConfigData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end