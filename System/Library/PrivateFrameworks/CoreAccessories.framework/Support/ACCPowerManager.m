@interface ACCPowerManager
- (ACCPowerManager)init;
- (BOOL)connectionPowerModeChangedForFeaturePowerModeUpdate:(int)a3 withObject:(BOOL)a4;
- (BOOL)getCurrentConnectionIsHighPowerMode;
- (NSMutableArray)featurePowerMode;
- (void)dealloc;
@end

@implementation ACCPowerManager

- (ACCPowerManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACCPowerManager;
  v2 = -[ACCPowerManager init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    featurePowerMode = v2->_featurePowerMode;
    v2->_featurePowerMode = (NSMutableArray *)v3;

    v5 = v2->_featurePowerMode;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    -[NSMutableArray addObject:](v5, "addObject:", v6);

    v7 = v2->_featurePowerMode;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    -[NSMutableArray addObject:](v7, "addObject:", v8);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ACCPowerManager;
  -[ACCPowerManager dealloc](&v3, "dealloc");
}

- (BOOL)connectionPowerModeChangedForFeaturePowerModeUpdate:(int)a3 withObject:(BOOL)a4
{
  if (a3 > 1)
  {
    LOBYTE(v8) = 0;
  }

  else
  {
    BOOL v4 = a4;
    uint64_t v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_featurePowerMode, "objectAtIndex:", a3));
    BOOL v8 = [v7 BOOLValue] ^ v4;

    featurePowerMode = self->_featurePowerMode;
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    -[NSMutableArray setObject:atIndexedSubscript:](featurePowerMode, "setObject:atIndexedSubscript:", v10, v6);
  }

  return v8;
}

- (BOOL)getCurrentConnectionIsHighPowerMode
{
  uint64_t v3 = 0LL;
  char v4 = 1;
  do
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPowerManager featurePowerMode](self, "featurePowerMode"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v3]);
    unsigned int v7 = [v6 BOOLValue];

    if ((v4 & 1) == 0) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1LL;
  }

  while (!v7);
  return v7;
}

- (NSMutableArray)featurePowerMode
{
  return self->_featurePowerMode;
}

- (void).cxx_destruct
{
}

@end