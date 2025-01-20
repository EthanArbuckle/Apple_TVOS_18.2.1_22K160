@interface SUCoreMAIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)measurement;
- (NSString)measurementAlgorithm;
- (NSString)productBuildVersion;
- (NSString)productVersion;
- (NSString)releaseType;
- (SUCoreMAIdentifier)initWithCoder:(id)a3;
- (SUCoreMAIdentifier)initWithProductVersion:(id)a3 productBuildVersion:(id)a4 releaseType:(id)a5 measurement:(id)a6 measurementAlgorithm:(id)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMeasurement:(id)a3;
- (void)setMeasurementAlgorithm:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setReleaseType:(id)a3;
@end

@implementation SUCoreMAIdentifier

- (SUCoreMAIdentifier)initWithProductVersion:(id)a3 productBuildVersion:(id)a4 releaseType:(id)a5 measurement:(id)a6 measurementAlgorithm:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SUCoreMAIdentifier;
  v17 = -[SUCoreMAIdentifier init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_productVersion, a3);
    objc_storeStrong((id *)&v18->_productBuildVersion, a4);
    objc_storeStrong((id *)&v18->_releaseType, a5);
    objc_storeStrong((id *)&v18->_measurement, a6);
    objc_storeStrong((id *)&v18->_measurementAlgorithm, a7);
  }

  return v18;
}

- (SUCoreMAIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SUCoreMAIdentifier;
  v5 = -[SUCoreMAIdentifier init](&v17, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductVersion"];
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductBuildVersion"];
    productBuildVersion = v5->_productBuildVersion;
    v5->_productBuildVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseType"];
    releaseType = v5->_releaseType;
    v5->_releaseType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Measurement"];
    measurement = v5->_measurement;
    v5->_measurement = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MeasurementAlgorithm"];
    measurementAlgorithm = v5->_measurementAlgorithm;
    v5->_measurementAlgorithm = (NSString *)v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[SUCoreMAIdentifier productVersion](self, "productVersion");
  [v4 encodeObject:v5 forKey:@"ProductVersion"];

  -[SUCoreMAIdentifier productBuildVersion](self, "productBuildVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"ProductBuildVersion"];
  v7 = -[SUCoreMAIdentifier releaseType](self, "releaseType");
  [v4 encodeObject:v7 forKey:@"ReleaseType"];

  -[SUCoreMAIdentifier measurement](self, "measurement");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"Measurement"];

  -[SUCoreMAIdentifier measurementAlgorithm](self, "measurementAlgorithm");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"MeasurementAlgorithm"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCoreMAIdentifier *)a3;
  if (v4 == self)
  {
    BOOL v17 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SUCoreMAIdentifier productVersion](self, "productVersion");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SUCoreMAIdentifier productVersion](v5, "productVersion");
      if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v6, v7))
      {
        -[SUCoreMAIdentifier productBuildVersion](self, "productBuildVersion");
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreMAIdentifier productBuildVersion](v5, "productBuildVersion");
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v8, v9))
        {
          -[SUCoreMAIdentifier releaseType](self, "releaseType");
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCoreMAIdentifier releaseType](v5, "releaseType");
          objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v10))
          {
            id v20 = v10;
            uint64_t v11 = -[SUCoreMAIdentifier measurement](self, "measurement");
            uint64_t v12 = -[SUCoreMAIdentifier measurement](v5, "measurement");
            v19 = (void *)v11;
            uint64_t v13 = v11;
            uint64_t v14 = (void *)v12;
            if (+[SUCore dataIsEqual:to:](&OBJC_CLASS___SUCore, "dataIsEqual:to:", v13, v12))
            {
              -[SUCoreMAIdentifier measurementAlgorithm](self, "measurementAlgorithm");
              id v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUCoreMAIdentifier measurementAlgorithm](v5, "measurementAlgorithm");
              id v16 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v17 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v15, v16);
            }

            else
            {
              BOOL v17 = 0;
            }

            uint64_t v10 = v20;
          }

          else
          {
            BOOL v17 = 0;
          }
        }

        else
        {
          BOOL v17 = 0;
        }
      }

      else
      {
        BOOL v17 = 0;
      }
    }

    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (id)description
{
  v3 = (void *)NSString;
  -[SUCoreMAIdentifier productVersion](self, "productVersion");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreMAIdentifier productBuildVersion](self, "productBuildVersion");
  -[SUCoreMAIdentifier releaseType](self, "releaseType");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUCoreMAIdentifier measurement](self, "measurement");
  -[SUCoreMAIdentifier measurementAlgorithm](self, "measurementAlgorithm");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"\n[>>>\n        productVersion: %@\n   productBuildVersion: %@\n           releaseType: %@\n           measurement: %@\n  measurementAlgorithm: %@\n<<<]", v4, v5, v6, v7, v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (NSData)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
}

- (NSString)measurementAlgorithm
{
  return self->_measurementAlgorithm;
}

- (void)setMeasurementAlgorithm:(id)a3
{
}

- (void).cxx_destruct
{
}

@end