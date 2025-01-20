@interface ASCMediaPlatform
+ (BOOL)supportsSecureCoding;
- (ASCMediaPlatform)initWithCoder:(id)a3;
- (ASCMediaPlatform)initWithDeviceCornerRadiusFactor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)deviceCornerRadiusFactor;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCMediaPlatform

- (ASCMediaPlatform)initWithDeviceCornerRadiusFactor:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ASCMediaPlatform;
  v5 = -[ASCMediaPlatform init](&v9, "init");
  if (v5)
  {
    v6 = (NSNumber *)[v4 copy];
    deviceCornerRadiusFactor = v5->_deviceCornerRadiusFactor;
    v5->_deviceCornerRadiusFactor = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCMediaPlatform)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"deviceCornerRadiusFactor"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ASCMediaPlatform;
  v7 = -[ASCMediaPlatform init](&v11, "init");
  if (v7)
  {
    v8 = (NSNumber *)[v6 copy];
    deviceCornerRadiusFactor = v7->_deviceCornerRadiusFactor;
    v7->_deviceCornerRadiusFactor = v8;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASCMediaPlatform deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor"));
  [v4 encodeObject:v5 forKey:@"deviceCornerRadiusFactor"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMediaPlatform deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  unint64_t v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCMediaPlatform *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCMediaPlatform);
    v6 = v4;
    v7 = v6;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
        v8 = v7;
      }
      else {
        v8 = 0LL;
      }
    }

    else
    {
      v8 = 0LL;
    }

    v10 = v8;

    if (v10)
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMediaPlatform deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCMediaPlatform deviceCornerRadiusFactor](v10, "deviceCornerRadiusFactor"));
      v13 = (void *)v12;
      if (v11 && v12) {
        unsigned __int8 v9 = [v11 isEqual:v12];
      }
      else {
        unsigned __int8 v9 = v11 == (void *)v12;
      }
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCMediaPlatform deviceCornerRadiusFactor](self, "deviceCornerRadiusFactor"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"deviceCornerRadiusFactor");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v5;
}

- (NSNumber)deviceCornerRadiusFactor
{
  return self->_deviceCornerRadiusFactor;
}

- (void).cxx_destruct
{
}

@end