@interface NIHomeDeviceConfiguration
+ (BOOL)supportsSecureCoding;
+ (NIHomeDeviceConfiguration)new;
- (BOOL)canUpdateToConfiguration:(id)a3;
- (BOOL)isAnchor;
- (BOOL)isEqual:(id)a3;
- (NIHomeDeviceConfiguration)init;
- (NIHomeDeviceConfiguration)initWithAllowedDevices:(unint64_t)a3 sessionKey:(id)a4 asAnchor:(BOOL)a5 regions:(id)a6;
- (NIHomeDeviceConfiguration)initWithCoder:(id)a3;
- (NIHomeDeviceConfiguration)initWithRegions:(id)a3;
- (NSArray)monitoredRegions;
- (NSData)sessionKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)antennaDiversityOverride;
- (int64_t)minimumPreferredUpdatedRate;
- (unint64_t)allowedDevices;
- (unint64_t)hash;
- (void)_updateRegionDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedDevices:(unint64_t)a3;
- (void)setAnchor:(BOOL)a3;
- (void)setAntennaDiversityOverride:(int64_t)a3;
- (void)setMinimumPreferredUpdatedRate:(int64_t)a3;
- (void)setMonitoredRegions:(id)a3;
- (void)setSessionKey:(id)a3;
@end

@implementation NIHomeDeviceConfiguration

- (NIHomeDeviceConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NIHomeDeviceConfiguration;
  v2 = -[NIConfiguration initInternal](&v6, "initInternal");
  v3 = v2;
  if (v2)
  {
    v2->_allowedDevices = 4LL;
    sessionKey = v2->_sessionKey;
    v2->_sessionKey = 0LL;

    v3->_anchor = 0;
    v3->_minimumPreferredUpdatedRate = 3LL;
    v3->_antennaDiversityOverride = 0LL;
    -[NIHomeDeviceConfiguration setMonitoredRegions:](v3, "setMonitoredRegions:", &__NSArray0__struct);
  }

  return v3;
}

+ (NIHomeDeviceConfiguration)new
{
  return objc_alloc_init(&OBJC_CLASS___NIHomeDeviceConfiguration);
}

- (NIHomeDeviceConfiguration)initWithRegions:(id)a3
{
  id v4 = a3;
  objc_super v6 = (NIHomeDeviceConfiguration *)objc_alloc_init((Class)objc_opt_class(self, v5));

  -[NIHomeDeviceConfiguration setMonitoredRegions:](v6, "setMonitoredRegions:", v4);
  return v6;
}

- (NIHomeDeviceConfiguration)initWithAllowedDevices:(unint64_t)a3 sessionKey:(id)a4 asAnchor:(BOOL)a5 regions:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v14 = (NIHomeDeviceConfiguration *)objc_alloc_init((Class)objc_opt_class(self, v13));

  if (v14)
  {
    v14->_allowedDevices = a3;
    objc_storeStrong((id *)&v14->_sessionKey, a4);
    v14->_anchor = a5;
    -[NIHomeDeviceConfiguration setMonitoredRegions:](v14, "setMonitoredRegions:", v12);
  }

  return v14;
}

- (void)setMonitoredRegions:(id)a3
{
}

- (NSArray)monitoredRegions
{
  return  -[NSArray initWithArray:copyItems:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithArray:copyItems:",  self->_monitoredRegions,  1LL);
}

- (void)_updateRegionDescription
{
  if (-[NSArray count](self->_monitoredRegions, "count"))
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    monitoredRegions = self->_monitoredRegions;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100265E00;
    v9[3] = &unk_1007B8EE8;
    uint64_t v5 = v3;
    v10 = v5;
    -[NSArray enumerateObjectsUsingBlock:](monitoredRegions, "enumerateObjectsUsingBlock:", v9);
    regionDescription = self->_regionDescription;
    self->_regionDescription = &v5->super;
    v8 = v5;
  }

  else
  {
    v7 = self->_regionDescription;
    self->_regionDescription = (NSString *)@"[none]";
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NIHomeDeviceConfiguration;
  uint64_t v5 = -[NIConfiguration copyWithZone:](&v9, "copyWithZone:");
  [v5 setAllowedDevices:self->_allowedDevices];
  [v5 setSessionKey:self->_sessionKey];
  [v5 setAnchor:self->_anchor];
  [v5 setAntennaDiversityOverride:self->_antennaDiversityOverride];
  [v5 setMinimumPreferredUpdatedRate:self->_minimumPreferredUpdatedRate];
  if (self->_monitoredRegions)
  {
    objc_super v6 = -[NSArray initWithArray:copyItems:]( +[NSArray allocWithZone:](&OBJC_CLASS___NSArray, "allocWithZone:", a3),  "initWithArray:copyItems:",  self->_monitoredRegions,  1LL);
    id v7 = v5[4];
    v5[4] = v6;
  }

  objc_storeStrong(v5 + 5, self->_regionDescription);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NIHomeDeviceConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  [v4 encodeInteger:self->_allowedDevices forKey:@"allowedDevices"];
  [v4 encodeObject:self->_sessionKey forKey:@"sessionKey"];
  [v4 encodeBool:self->_anchor forKey:@"anchor"];
  [v4 encodeInteger:self->_antennaDiversityOverride forKey:@"antennaDiversityOverride"];
  [v4 encodeObject:self->_monitoredRegions forKey:@"monitoredRegions"];
  [v4 encodeInteger:self->_minimumPreferredUpdatedRate forKey:@"minimumPreferredUpdatedRate"];
}

- (NIHomeDeviceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NIHomeDeviceConfiguration;
  objc_super v5 = -[NIConfiguration initWithCoder:](&v22, "initWithCoder:", v4);
  if (v5
    && (id v6 = [v4 decodeIntegerForKey:@"allowedDevices"],
        +[NIInternalUtils isIntValidRelationshipSpecifier:]( &OBJC_CLASS___NIInternalUtils,  "isIntValidRelationshipSpecifier:",  v6)))
  {
    id v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v7), @"sessionKey");
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    unsigned __int8 v10 = [v4 decodeBoolForKey:@"anchor"];
    id v11 = [v4 decodeIntegerForKey:@"antennaDiversityOverride"];
    if (+[NIInternalUtils isIntValidAntennaDiversityOverride:]( &OBJC_CLASS___NIInternalUtils,  "isIntValidAntennaDiversityOverride:",  v11))
    {
      v23[0] = objc_opt_class(&OBJC_CLASS___NSArray, v12);
      v23[1] = objc_opt_class(&OBJC_CLASS___NIRegionPredicate, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v15 forKey:@"monitoredRegions"]);

      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray, v17);
      if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0
        && (id v19 = [v4 decodeIntegerForKey:@"minimumPreferredUpdatedRate"],
            +[NIInternalUtils isIntValidNearbyObjectUpdateRate:]( &OBJC_CLASS___NIInternalUtils,  "isIntValidNearbyObjectUpdateRate:",  v19)))
      {
        v5->_allowedDevices = (unint64_t)v6;
        objc_storeStrong((id *)&v5->_sessionKey, v9);
        v5->_anchor = v10;
        v5->_antennaDiversityOverride = (int64_t)v11;
        objc_storeStrong((id *)&v5->_monitoredRegions, v16);
        -[NIHomeDeviceConfiguration _updateRegionDescription](v5, "_updateRegionDescription");
        v5->_minimumPreferredUpdatedRate = (int64_t)v19;
        v20 = v5;
      }

      else
      {
        v20 = 0LL;
      }
    }

    else
    {
      v20 = 0LL;
    }
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

- (BOOL)canUpdateToConfiguration:(id)a3
{
  id v4 = (NIHomeDeviceConfiguration *)a3;
  objc_super v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      char v14 = 1;
    }

    else
    {
      unint64_t v6 = -[NIHomeDeviceConfiguration allowedDevices](v4, "allowedDevices");
      unint64_t allowedDevices = self->_allowedDevices;
      unsigned int v8 = -[NIHomeDeviceConfiguration isAnchor](v5, "isAnchor");
      int anchor = self->_anchor;
      id v10 = -[NIHomeDeviceConfiguration antennaDiversityOverride](v5, "antennaDiversityOverride");
      int64_t antennaDiversityOverride = self->_antennaDiversityOverride;
      id v12 = -[NIHomeDeviceConfiguration minimumPreferredUpdatedRate](v5, "minimumPreferredUpdatedRate");
      int64_t v29 = antennaDiversityOverride;
      int64_t minimumPreferredUpdatedRate = self->_minimumPreferredUpdatedRate;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](v5, "sessionKey"));
      id v25 = v12;
      if (v13) {
        BOOL v27 = 0;
      }
      else {
        BOOL v27 = self->_sessionKey == 0LL;
      }
      id v28 = v10;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](v5, "sessionKey"));
      unsigned int v16 = v8;
      unsigned int v17 = [v15 isEqualToData:self->_sessionKey];
      unint64_t v18 = allowedDevices;
      unint64_t v19 = v6;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration monitoredRegions](v5, "monitoredRegions"));
      unsigned __int8 v21 = [v20 isEqualToArray:self->_monitoredRegions];

      objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration monitoredRegions](v5, "monitoredRegions"));
      if (v22) {
        BOOL v23 = 0;
      }
      else {
        BOOL v23 = self->_monitoredRegions == 0LL;
      }

      char v14 = 0;
      if (v19 == v18 && anchor == v16 && v28 == (id)v29 && (((v27 | v17) ^ 1) & 1) == 0)
      {
        if (v25 == (id)minimumPreferredUpdatedRate) {
          char v14 = v21 | v23;
        }
        else {
          char v14 = 0;
        }
      }
    }
  }

  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v7 = (NIHomeDeviceConfiguration *)v4;
    if (v7 == self)
    {
      BOOL v9 = 1;
    }

    else if (-[NIHomeDeviceConfiguration canUpdateToConfiguration:](self, "canUpdateToConfiguration:", v7))
    {
      id v8 = -[NIConfiguration enabledGestures](self, "enabledGestures");
      BOOL v9 = v8 == (id)-[NIConfiguration enabledGestures](v7, "enabledGestures");
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_allowedDevices ^ self->_anchor ^ (unint64_t)-[NSData hash](self->_sessionKey, "hash");
  int64_t antennaDiversityOverride = self->_antennaDiversityOverride;
  return v3 ^ antennaDiversityOverride ^ (unint64_t)-[NSArray hash](self->_monitoredRegions, "hash") ^ self->_minimumPreferredUpdatedRate;
}

- (id)description
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration descriptionInternal](self, "descriptionInternal"));
  BOOL v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  unint64_t v3 = +[NIInternalUtils NIRelationshipSpecifierToString:]( &OBJC_CLASS___NIInternalUtils,  "NIRelationshipSpecifierToString:",  self->_allowedDevices);
  if (self->_anchor) {
    uint64_t v4 = "Yes";
  }
  else {
    uint64_t v4 = "No";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<devices: [%s], ses-key: %@, anchor: %s, ant-div: %s, min-rate: %s, gestures: %d, regions: %@>",  v3,  self->_sessionKey,  v4,  +[NIInternalUtils AntennaDiversityOverrideToString:]( &OBJC_CLASS___NIInternalUtils,  "AntennaDiversityOverrideToString:",  self->_antennaDiversityOverride),  +[NIInternalUtils NINearbyObjectUpdateRateToString:]( &OBJC_CLASS___NIInternalUtils,  "NINearbyObjectUpdateRateToString:",  self->_minimumPreferredUpdatedRate),  -[NIConfiguration enabledGestures](self, "enabledGestures"),  self->_regionDescription);
}

- (unint64_t)allowedDevices
{
  return self->_allowedDevices;
}

- (void)setAllowedDevices:(unint64_t)a3
{
  self->_unint64_t allowedDevices = a3;
}

- (NSData)sessionKey
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSessionKey:(id)a3
{
}

- (BOOL)isAnchor
{
  return self->_anchor;
}

- (void)setAnchor:(BOOL)a3
{
  self->_int anchor = a3;
}

- (int64_t)minimumPreferredUpdatedRate
{
  return self->_minimumPreferredUpdatedRate;
}

- (void)setMinimumPreferredUpdatedRate:(int64_t)a3
{
  self->_int64_t minimumPreferredUpdatedRate = a3;
}

- (int64_t)antennaDiversityOverride
{
  return self->_antennaDiversityOverride;
}

- (void)setAntennaDiversityOverride:(int64_t)a3
{
  self->_int64_t antennaDiversityOverride = a3;
}

- (void).cxx_destruct
{
}

@end