@interface PPSMetricMonitorConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultConfiguration;
+ (id)instrumentsConfiguration;
- (BOOL)emitSignposts;
- (BOOL)includeBackBoardUsage;
- (BOOL)updateDelegate;
- (PPSMetricMonitorConfiguration)initWithCoder:(id)a3;
- (PPSMetricMonitorConfiguration)initWithMode:(int64_t)a3 updateInterval:(double)a4 updateDelegate:(BOOL)a5;
- (double)updateInterval;
- (id)description;
- (int64_t)mode;
- (void)encodeWithCoder:(id)a3;
- (void)setEmitSignposts:(BOOL)a3;
- (void)setIncludeBackBoardUsage:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setUpdateDelegate:(BOOL)a3;
- (void)setUpdateInterval:(double)a3;
@end

@implementation PPSMetricMonitorConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultConfiguration
{
  return (id)[objc_alloc((Class)a1) initWithMode:0 updateInterval:1 updateDelegate:0.2];
}

+ (id)instrumentsConfiguration
{
  return (id)[(id)objc_opt_class() defaultConfiguration];
}

- (PPSMetricMonitorConfiguration)initWithMode:(int64_t)a3 updateInterval:(double)a4 updateDelegate:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PPSMetricMonitorConfiguration;
  result = -[PPSMetricMonitorConfiguration init](&v9, sel_init);
  if (result)
  {
    result->_mode = a3;
    result->_updateInterval = a4;
    result->_updateDelegate = a5;
    *(_WORD *)&result->_includeBackBoardUsage = 256;
  }

  return result;
}

- (PPSMetricMonitorConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PPSMetricMonitorConfiguration;
  v5 = -[PPSMetricMonitorConfiguration init](&v12, sel_init);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mode = (int)[v6 intValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateInterval"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 doubleValue];
    v5->_updateInterval = v8;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateDelegate"];
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_updateDelegate = [v9 BOOLValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"includeBackBoardUsage"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includeBackBoardUsage = [v10 BOOLValue];

    v5->_emitSignposts = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x189607968];
  id v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[PPSMetricMonitorConfiguration mode](self, "mode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"mode"];

  v7 = (void *)MEMORY[0x189607968];
  -[PPSMetricMonitorConfiguration updateInterval](self, "updateInterval");
  objc_msgSend(v7, "numberWithDouble:");
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v8 forKey:@"updateInterval"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[PPSMetricMonitorConfiguration updateDelegate](self, "updateDelegate"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v9 forKey:@"updateDelegate"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[PPSMetricMonitorConfiguration includeBackBoardUsage](self, "includeBackBoardUsage"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v10 forKey:@"includeBackBoardUsage"];
}

- (id)description
{
  v3 = (void *)NSString;
  int64_t v4 = -[PPSMetricMonitorConfiguration mode](self, "mode");
  -[PPSMetricMonitorConfiguration updateInterval](self, "updateInterval");
  return (id)[v3 stringWithFormat:@"PPSMetricMonitorConfig(mode: %ld updateInterval: %f updateDelegate: %d includeBackBoardUsage: %d)"],  v4,  v5,  -[PPSMetricMonitorConfiguration updateDelegate](self, "updateDelegate"),  -[PPSMetricMonitorConfiguration includeBackBoardUsage](self, "includeBackBoardUsage"));
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (BOOL)updateDelegate
{
  return self->_updateDelegate;
}

- (void)setUpdateDelegate:(BOOL)a3
{
  self->_updateDelegate = a3;
}

- (BOOL)includeBackBoardUsage
{
  return self->_includeBackBoardUsage;
}

- (void)setIncludeBackBoardUsage:(BOOL)a3
{
  self->_includeBackBoardUsage = a3;
}

- (BOOL)emitSignposts
{
  return self->_emitSignposts;
}

- (void)setEmitSignposts:(BOOL)a3
{
  self->_emitSignposts = a3;
}

@end