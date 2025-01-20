@interface NIRegionPredicate
+ (BOOL)_isExecuteRegion:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)coarseEstimation;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresUserIntent;
- (NIRegionPredicate)initWithCoder:(id)a3;
- (NIRegionPredicate)initWithName:(id)a3 devicePresencePreset:(int64_t)a4;
- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4;
- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5;
- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6;
- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6 devicePresencePreset:(int64_t)a7;
- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7;
- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7 coarseEstimation:(BOOL)a8 devicePresencePreset:(int64_t)a9;
- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7 devicePresencePreset:(int64_t)a8;
- (NSString)name;
- (float)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (id)shortDescription;
- (int64_t)devicePresencePreset;
- (int64_t)preferredUpdateRate;
- (int64_t)regionSizeCategory;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCoarseEstimation:(BOOL)a3;
- (void)setDevicePresencePreset:(int64_t)a3;
- (void)setPreferredUpdateRate:(int64_t)a3;
- (void)setRegionSizeCategory:(int64_t)a3;
- (void)setRequiresUserIntent:(BOOL)a3;
@end

@implementation NIRegionPredicate

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5
{
  id v10 = a3;
  if (!v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"NIRegionPredicate.mm", 22, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }

  if (a4 <= 0.0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2 object:self file:@"NIRegionPredicate.mm" lineNumber:23 description:@"radius must be larger than 0"];
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NIRegionPredicate;
  v11 = -[NIRegionPredicate init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_radius = a4;
    v12->_regionSizeCategory = 0LL;
    v12->_preferredUpdateRate = a5;
    *(_WORD *)&v12->_requiresUserIntent = 0;
    v12->_devicePresencePreset = 0LL;
  }

  return v12;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4
{
  id v6 = a3;
  id v8 = objc_alloc((Class)objc_opt_class(self, v7));
  *(float *)&double v9 = a4;
  id v10 = (NIRegionPredicate *)[v8 initWithName:v6 radius:0 preferredUpdateRate:v9];

  return v10;
}

- (NIRegionPredicate)initWithName:(id)a3 devicePresencePreset:(int64_t)a4
{
  id v8 = a3;
  if (v8)
  {
    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"NIRegionPredicate.mm", 42, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v13 handleFailureInMethod:a2 object:self file:@"NIRegionPredicate.mm" lineNumber:43 description:@"device presence preset cannot be unspecified"];

LABEL_3:
  id v9 = objc_alloc((Class)objc_opt_class(self, v7));
  +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:]( &OBJC_CLASS___NIDevicePresenceConfiguration,  "_radiusFromDevicePresencePreset:",  a4);
  id v10 = (NIRegionPredicate *)objc_msgSend(v9, "initWithName:radius:", v8);

  if (v10) {
    v10->_devicePresencePreset = a4;
  }

  return v10;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v11 = objc_alloc(&OBJC_CLASS___NIRegionPredicate);
  *(float *)&double v12 = a4;
  v13 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:]( v11,  "initWithName:radius:preferredUpdateRate:",  v10,  a5,  v12);
  -[NIRegionPredicate setRequiresUserIntent:](v13, "setRequiresUserIntent:", v6);

  return v13;
}

- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  v13 = objc_alloc(&OBJC_CLASS___NIRegionPredicate);
  *(float *)&double v14 = a5;
  v15 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:requiresUserIntent:]( v13,  "initWithName:radius:preferredUpdateRate:requiresUserIntent:",  v12,  a6,  v7,  v14);
  -[NIRegionPredicate setRegionSizeCategory:](v15, "setRegionSizeCategory:", a4);

  return v15;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6 devicePresencePreset:(int64_t)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  v13 = objc_alloc(&OBJC_CLASS___NIRegionPredicate);
  *(float *)&double v14 = a4;
  v15 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:requiresUserIntent:]( v13,  "initWithName:radius:preferredUpdateRate:requiresUserIntent:",  v12,  a5,  v8,  v14);
  -[NIRegionPredicate setDevicePresencePreset:](v15, "setDevicePresencePreset:", a7);

  return v15;
}

- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7 devicePresencePreset:(int64_t)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  v15 = objc_alloc(&OBJC_CLASS___NIRegionPredicate);
  *(float *)&double v16 = a5;
  v17 = -[NIRegionPredicate initWithName:regionSizeCategory:radius:preferredUpdateRate:requiresUserIntent:coarseEstimation:devicePresencePreset:]( v15,  "initWithName:regionSizeCategory:radius:preferredUpdateRate:requiresUserIntent:coarseEstimation:devicePresencePreset:",  v14,  a4,  a6,  v9,  0LL,  a8,  v16);

  return v17;
}

- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7 coarseEstimation:(BOOL)a8 devicePresencePreset:(int64_t)a9
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v16 = a3;
  v17 = objc_alloc(&OBJC_CLASS___NIRegionPredicate);
  *(float *)&double v18 = a5;
  v19 = -[NIRegionPredicate initWithName:radius:preferredUpdateRate:requiresUserIntent:devicePresencePreset:]( v17,  "initWithName:radius:preferredUpdateRate:requiresUserIntent:devicePresencePreset:",  v16,  a6,  v11,  a9,  v18);
  -[NIRegionPredicate setRegionSizeCategory:](v19, "setRegionSizeCategory:", a4);
  -[NIRegionPredicate setCoarseEstimation:](v19, "setCoarseEstimation:", v10);

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)devicePresencePreset
{
  return self->_devicePresencePreset;
}

- (void)setDevicePresencePreset:(int64_t)a3
{
  self->_devicePresencePreset = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  *(float *)&double v5 = self->_radius;
  return [v4 initWithName:self->_name regionSizeCategory:self->_regionSizeCategory radius:self->_preferredUpdateRate preferredUpdateRate:self->_requiresUserIntent requiresUserIntent:self->_coarseEstimation coarseEstimation:self->_devicePresencePreset devicePresencePreset:v5];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeInteger:self->_regionSizeCategory forKey:@"regionSizeCategory"];
  *(float *)&double v4 = self->_radius;
  [v5 encodeFloat:@"radius" forKey:v4];
  [v5 encodeInteger:self->_preferredUpdateRate forKey:@"preferredUpdateRate"];
  [v5 encodeBool:self->_requiresUserIntent forKey:@"requiresUserIntent"];
  [v5 encodeInteger:self->_devicePresencePreset forKey:@"devicePresencePreset"];
  [v5 encodeBool:self->_coarseEstimation forKey:@"coarseEstimation"];
}

- (NIRegionPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"name");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v4 decodeIntegerForKey:@"regionSizeCategory"];
  [v4 decodeFloatForKey:@"radius"];
  float v10 = v9;
  id v11 = [v4 decodeIntegerForKey:@"preferredUpdateRate"];
  id v12 = [v4 decodeIntegerForKey:@"devicePresencePreset"];
  if (v7 && ((int64_t v13 = (int64_t)v12, v10 >= 0.0) || v12))
  {
    unsigned __int8 v15 = [v4 decodeBoolForKey:@"requiresUserIntent"];
    unsigned __int8 v16 = [v4 decodeBoolForKey:@"coarseEstimation"];
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___NIRegionPredicate;
    v17 = -[NIRegionPredicate init](&v20, "init");
    double v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_name, v7);
      v18->_radius = v10;
      v18->_regionSizeCategory = (int64_t)v8;
      v18->_preferredUpdateRate = (int64_t)v11;
      v18->_requiresUserIntent = v15;
      v18->_devicePresencePreset = v13;
      v18->_coarseEstimation = v16;
    }

    self = v18;
    id v14 = self;
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    BOOL v7 = (NIRegionPredicate *)v4;
    id v8 = v7;
    if (v7 == self)
    {
      BOOL v11 = 1;
    }

    else
    {
      float v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIRegionPredicate name](v7, "name"));
      BOOL v11 = [v9 isEqualToString:self->_name]
         && -[NIRegionPredicate regionSizeCategory](v8, "regionSizeCategory") == self->_regionSizeCategory
         && (-[NIRegionPredicate radius](v8, "radius"), v10 == self->_radius)
         && -[NIRegionPredicate preferredUpdateRate](v8, "preferredUpdateRate") == self->_preferredUpdateRate
         && self->_requiresUserIntent == -[NIRegionPredicate requiresUserIntent](v8, "requiresUserIntent")
         && self->_coarseEstimation == -[NIRegionPredicate coarseEstimation](v8, "coarseEstimation");
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_regionSizeCategory ^ self->_preferredUpdateRate ^ -[NSString hash](self->_name, "hash") ^ self->_requiresUserIntent ^ self->_devicePresencePreset ^ self->_coarseEstimation ^ (int)self->_radius;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIRegionPredicate descriptionInternal](self, "descriptionInternal"));
  float v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  name = self->_name;
  int64_t regionSizeCategory = self->_regionSizeCategory;
  if (regionSizeCategory)
  {
    if (regionSizeCategory != 10) {
      sub_10039FFAC();
    }
    uint64_t v5 = @"Large";
  }

  else
  {
    uint64_t v5 = @"Default";
  }

  float radius = self->_radius;
  BOOL v7 = +[NIInternalUtils NINearbyObjectUpdateRateToString:]( &OBJC_CLASS___NIInternalUtils,  "NINearbyObjectUpdateRateToString:",  self->_preferredUpdateRate);
  unint64_t devicePresencePreset = self->_devicePresencePreset;
  if (devicePresencePreset >= 7) {
    sub_10039FFD4();
  }
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"name: %@, cat: %@, radius: %0.2f m, rate: %s, intent: %d,  coarse: %d, presencePreset: %s",  name,  v5,  radius,  v7,  self->_requiresUserIntent,  self->_coarseEstimation,  off_1007B7BC0[devicePresencePreset]));
}

- (id)shortDescription
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %0.2fm %s C:%d,I:%d,P:%d CE: %d",  self->_name,  self->_radius,  +[NIInternalUtils NINearbyObjectUpdateRateToShortString:]( &OBJC_CLASS___NIInternalUtils,  "NINearbyObjectUpdateRateToShortString:",  self->_preferredUpdateRate),  self->_regionSizeCategory,  self->_requiresUserIntent,  self->_devicePresencePreset,  self->_coarseEstimation);
}

+ (BOOL)_isExecuteRegion:(id)a3
{
  return [a3 devicePresencePreset] == (id)6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (int64_t)regionSizeCategory
{
  return self->_regionSizeCategory;
}

- (void)setRegionSizeCategory:(int64_t)a3
{
  self->_int64_t regionSizeCategory = a3;
}

- (float)radius
{
  return self->_radius;
}

- (int64_t)preferredUpdateRate
{
  return self->_preferredUpdateRate;
}

- (void)setPreferredUpdateRate:(int64_t)a3
{
  self->_preferredUpdateRate = a3;
}

- (BOOL)requiresUserIntent
{
  return self->_requiresUserIntent;
}

- (void)setRequiresUserIntent:(BOOL)a3
{
  self->_requiresUserIntent = a3;
}

- (BOOL)coarseEstimation
{
  return self->_coarseEstimation;
}

- (void)setCoarseEstimation:(BOOL)a3
{
  self->_coarseEstimation = a3;
}

- (void).cxx_destruct
{
}

@end