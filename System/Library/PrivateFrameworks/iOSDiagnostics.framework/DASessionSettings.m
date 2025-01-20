@interface DASessionSettings
+ (id)acceptableValueClasses;
+ (id)sessionSettingsWithDictionary:(id)a3;
- (BOOL)displayDeviceIdentifier;
- (BOOL)fullscreenPromptsEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSessionSettings:(id)a3;
- (DASessionSettings)init;
- (DASessionSettings)initWithDictionary:(id)a3;
- (NSString)deviceIdentifier;
- (id)description;
- (id)dictionary;
- (unint64_t)allowCellularSizeThreshold;
- (void)setAllowCellularSizeThreshold:(unint64_t)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDisplayDeviceIdentifier:(BOOL)a3;
- (void)setFullscreenPromptsEnabled:(BOOL)a3;
@end

@implementation DASessionSettings

+ (id)sessionSettingsWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (DASessionSettings)init
{
  return -[DASessionSettings initWithDictionary:](self, "initWithDictionary:", 0LL);
}

- (DASessionSettings)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___DASessionSettings;
  id v5 = -[DASessionSettings init](&v28, "init");
  v6 = v5;
  if (!v5) {
    goto LABEL_22;
  }
  p_deviceIdentifier = (void **)&v5->_deviceIdentifier;
  deviceIdentifier = v5->_deviceIdentifier;
  v5->_displayDeviceIdentifier = 0;
  v5->_deviceIdentifier = (NSString *)&stru_100018AE8;

  v6->_fullscreenPromptsEnabled = 1;
  v6->_allowCellularSizeThreshold = 0x100000LL;
  if (!v4) {
    goto LABEL_22;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"displayDeviceIdentifier"]);
  if (v10)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v9);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
      v6->_displayDeviceIdentifier = [v10 BOOLValue];
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"deviceIdentifier"]);
  if (!v13) {
    goto LABEL_11;
  }
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v12);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
  {
    objc_storeStrong((id *)&v6->_deviceIdentifier, v13);
    goto LABEL_12;
  }

  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v15);
  if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 stringValue]);
    v18 = *p_deviceIdentifier;
    *p_deviceIdentifier = (void *)v17;
  }

  else
  {
LABEL_11:
    v6->_displayDeviceIdentifier = 0;
  }

- (id)dictionary
{
  v9[0] = @"displayDeviceIdentifier";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DASessionSettings displayDeviceIdentifier](self, "displayDeviceIdentifier")));
  v10[0] = v3;
  v9[1] = @"deviceIdentifier";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DASessionSettings deviceIdentifier](self, "deviceIdentifier"));
  v10[1] = v4;
  v9[2] = @"fullscreenPromptsEnabled";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DASessionSettings fullscreenPromptsEnabled](self, "fullscreenPromptsEnabled")));
  v10[2] = v5;
  v9[3] = @"allowCellularSizeThreshold";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[DASessionSettings allowCellularSizeThreshold](self, "allowCellularSizeThreshold")));
  v10[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));

  return v7;
}

+ (id)acceptableValueClasses
{
  if (qword_100022578 != -1) {
    dispatch_once(&qword_100022578, &stru_1000185E0);
  }
  return (id)qword_100022570;
}

- (BOOL)isEqualToSessionSettings:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DASessionSettings deviceIdentifier](self, "deviceIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
  unsigned int v7 = [v5 isEqual:v6];

  if (v7
    && (unsigned int v8 = -[DASessionSettings displayDeviceIdentifier](self, "displayDeviceIdentifier"),
        v8 == [v4 displayDeviceIdentifier])
    && (unsigned int v9 = -[DASessionSettings fullscreenPromptsEnabled](self, "fullscreenPromptsEnabled"),
        v9 == [v4 fullscreenPromptsEnabled]))
  {
    id v12 = -[DASessionSettings allowCellularSizeThreshold](self, "allowCellularSizeThreshold");
    BOOL v10 = v12 == [v4 allowCellularSizeThreshold];
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DASessionSettings *)a3;
  unsigned __int8 v5 = self == v4;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___DASessionSettings);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    unsigned __int8 v5 = -[DASessionSettings isEqualToSessionSettings:](self, "isEqualToSessionSettings:", v4);
  }

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = -[DASessionSettings displayDeviceIdentifier](self, "displayDeviceIdentifier");
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[DASessionSettings deviceIdentifier](self, "deviceIdentifier"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; displayDeviceIdentifier: %d; deviceIdentifier: %@; fullscreenPromptsEnabled: %d; allowCellularSizeThreshold: %lu>",
                   v5,
                   self,
                   v6,
                   v7,
                   -[DASessionSettings fullscreenPromptsEnabled](self, "fullscreenPromptsEnabled"),
                   -[DASessionSettings allowCellularSizeThreshold](self, "allowCellularSizeThreshold")));

  return v8;
}

- (BOOL)displayDeviceIdentifier
{
  return self->_displayDeviceIdentifier;
}

- (void)setDisplayDeviceIdentifier:(BOOL)a3
{
  self->_displayDeviceIdentifier = a3;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (BOOL)fullscreenPromptsEnabled
{
  return self->_fullscreenPromptsEnabled;
}

- (void)setFullscreenPromptsEnabled:(BOOL)a3
{
  self->_fullscreenPromptsEnabled = a3;
}

- (unint64_t)allowCellularSizeThreshold
{
  return self->_allowCellularSizeThreshold;
}

- (void)setAllowCellularSizeThreshold:(unint64_t)a3
{
  self->_allowCellularSizeThreshold = a3;
}

- (void).cxx_destruct
{
}

@end