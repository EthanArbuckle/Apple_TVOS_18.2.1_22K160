@interface DYGTMTLDeviceProfile
+ (BOOL)supportsSecureCoding;
- (DYGTMTLDeviceProfile)initWithCoder:(id)a3;
- (MTLDevice)device;
- (NSArray)supportedFeatureSets;
- (NSArray)supportedGPUFamilies;
- (NSDictionary)defaultSamplePositions;
- (NSString)name;
- (unint64_t)streamRef;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultSamplePositions:(id)a3;
- (void)setDevice:(id)a3;
- (void)setName:(id)a3;
- (void)setStreamRef:(unint64_t)a3;
- (void)setSupportedFeatureSets:(id)a3;
- (void)setSupportedGPUFamilies:(id)a3;
@end

@implementation DYGTMTLDeviceProfile

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYGTMTLDeviceProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___DYGTMTLDeviceProfile;
  v5 = -[DYGTMTLDeviceProfile init](&v23, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"name"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v5->_streamRef = (unint64_t)[v4 decodeInt64ForKey:@"streamRef"];
    id v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSNumber) forKey:@"supportedFeatureSets"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    supportedFeatureSets = v5->_supportedFeatureSets;
    v5->_supportedFeatureSets = (NSArray *)v10;

    id v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSNumber) forKey:@"supportedGPUFamilies"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    supportedGPUFamilies = v5->_supportedGPUFamilies;
    v5->_supportedGPUFamilies = (NSArray *)v13;

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
    v18 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v15,  v16,  v17,  objc_opt_class(&OBJC_CLASS___NSValue),  0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v19 forKey:@"defaultSamplePositions"]);
    defaultSamplePositions = v5->_defaultSamplePositions;
    v5->_defaultSamplePositions = (NSDictionary *)v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeInt64:self->_streamRef forKey:@"streamRef"];
  [v5 encodeObject:self->_supportedFeatureSets forKey:@"supportedFeatureSets"];
  [v5 encodeObject:self->_supportedGPUFamilies forKey:@"supportedGPUFamilies"];
  [v5 encodeObject:self->_defaultSamplePositions forKey:@"defaultSamplePositions"];
}

- (NSArray)supportedFeatureSets
{
  return self->_supportedFeatureSets;
}

- (void)setSupportedFeatureSets:(id)a3
{
}

- (NSArray)supportedGPUFamilies
{
  return self->_supportedGPUFamilies;
}

- (void)setSupportedGPUFamilies:(id)a3
{
}

- (NSDictionary)defaultSamplePositions
{
  return self->_defaultSamplePositions;
}

- (void)setDefaultSamplePositions:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  self->_device = (MTLDevice *)a3;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (void).cxx_destruct
{
}

@end