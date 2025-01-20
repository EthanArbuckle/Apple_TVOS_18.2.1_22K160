@interface ZOTConfiguration
+ (id)configurationManager;
- (BOOL)didStartForFirstTime;
- (BOOL)perApplicationZoomLevelEnabled;
- (BOOL)zoomedForKey:(id)a3;
- (CGPoint)zoomLocationForKey:(id)a3 currentLocation:(CGPoint)a4;
- (ZOTConfiguration)init;
- (double)zoomLevelForKey:(id)a3 currentLevel:(double)a4;
- (id)valueForKey:(id)a3;
- (void)_synchronizePrefs;
- (void)dealloc;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setZoomLevel:(double)a3 location:(CGPoint)a4 zoomed:(BOOL)a5 forKey:(id)a6;
@end

@implementation ZOTConfiguration

+ (id)configurationManager
{
  v2 = (void *)_ZOTConfiguration;
  if (!_ZOTConfiguration)
  {
    id v3 = [objc_allocWithZone((Class)ZOTConfiguration) init];
    v4 = (void *)_ZOTConfiguration;
    _ZOTConfiguration = (uint64_t)v3;

    v2 = (void *)_ZOTConfiguration;
  }

  return v2;
}

- (ZOTConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ZOTConfiguration;
  v2 = -[ZOTConfiguration init](&v9, "init");
  if (v2)
  {
    id v3 = -[SCRCThreadKey initWithObject:](objc_alloc(&OBJC_CLASS___SCRCThreadKey), "initWithObject:", v2);
    threadKey = v2->_threadKey;
    v2->_threadKey = v3;

    v5 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_synchronizePrefs" threadKey:v2->_threadKey];
    syncTimer = v2->_syncTimer;
    v2->_syncTimer = v5;

    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ZOTConfiguration;
  -[ZOTConfiguration dealloc](&v3, "dealloc");
}

- (BOOL)didStartForFirstTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", @"Zoomed"));
  BOOL v3 = v2 == 0LL;

  return v3;
}

- (id)valueForKey:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", @"ZoomLevel"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v4 zoomScale];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  }

  else
  {
    v5 = (void *)CFPreferencesCopyAppValue(v3, @"com.apple.ZoomTouch");
  }

  return v5;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  key = (__CFString *)a4;
  id v6 = a3;
  if (-[__CFString isEqualToString:](key, "isEqualToString:", @"ZoomLevel"))
  {
    [v6 floatValue];
    float v8 = v7;

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v9 setZoomScale:v8];
  }

  else
  {
    CFPreferencesSetAppValue(key, v6, @"com.apple.ZoomTouch");

    -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_syncTimer, "dispatchAfterDelay:", 1.0);
  }
}

- (void)_synchronizePrefs
{
}

- (void)setZoomLevel:(double)a3 location:(CGPoint)a4 zoomed:(BOOL)a5 forKey:(id)a6
{
  BOOL v6 = a5;
  double y = a4.y;
  double x = a4.x;
  id v22 = a6;
  *(float *)&double v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v11));
  *(float *)&double v13 = x;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v13));
  *(float *)&double v15 = y;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  if (v22 && -[ZOTConfiguration perApplicationZoomLevelEnabled](self, "perApplicationZoomLevelEnabled"))
  {
    double v18 = AXZoomMinimumZoomLevel + 0.000001;
    if (AXZoomMinimumZoomLevel + 0.000001 <= a3)
    {
      id v19 = objc_msgSend( objc_allocWithZone(NSDictionary),  "initWithObjectsAndKeys:",  v12,  @"ZoomLevel",  v14,  @"ZoomLocationX",  v16,  @"ZoomLocationY",  v17,  @"Zoomed",  0);
    }

    else if (v6)
    {
      id v19 = 0LL;
    }

    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", v22, v18));
      id v19 = [v20 mutableCopyWithZone:0];

      [v19 setObject:v17 forKey:@"Zoomed"];
    }

    -[ZOTConfiguration setValue:forKey:](self, "setValue:forKey:", v19, v22, v18);
  }

  double v21 = AXZoomMinimumZoomLevel + 0.000001;
  if (AXZoomMinimumZoomLevel + 0.000001 <= a3)
  {
    -[ZOTConfiguration setValue:forKey:](self, "setValue:forKey:", v12, @"ZoomLevel", v21);
    -[ZOTConfiguration setValue:forKey:](self, "setValue:forKey:", v14, @"ZoomLocationX");
    -[ZOTConfiguration setValue:forKey:](self, "setValue:forKey:", v16, @"ZoomLocationY");
  }

  else if (v6)
  {
    goto LABEL_14;
  }

  -[ZOTConfiguration setValue:forKey:](self, "setValue:forKey:", v17, @"Zoomed", v21);
LABEL_14:
}

- (double)zoomLevelForKey:(id)a3 currentLevel:(double)a4
{
  id v6 = a3;
  unsigned __int8 v7 = -[ZOTConfiguration perApplicationZoomLevelEnabled](self, "perApplicationZoomLevelEnabled");
  if (v6 && (v7 & 1) != 0)
  {
    float v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", v6));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ZoomLevel"]);

    if (v9
      || (objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", @"ZoomLevel"))) != 0LL)
    {
      [v9 floatValue];
      a4 = v10;
    }

    else
    {
      a4 = AXZoomDefaultZoomLevel;
    }
  }

  else
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", @"ZoomLevel"));
    if (v11)
    {
      v12 = v11;
      [v11 floatValue];
      a4 = v13;
    }
  }

  if (a4 < AXZoomMinimumZoomLevel + 0.000001) {
    a4 = AXZoomDefaultZoomLevel;
  }

  return a4;
}

- (CGPoint)zoomLocationForKey:(id)a3 currentLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  unsigned __int8 v8 = -[ZOTConfiguration perApplicationZoomLevelEnabled](self, "perApplicationZoomLevelEnabled");
  if (v7 && (v8 & 1) != 0)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", v7));
    float v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"ZoomLocationX"]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 objectForKey:@"ZoomLocationY"]);
    v12 = (void *)v11;
    if (!v10 || !v11)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", @"ZoomLocationX"));

      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", @"ZoomLocationY"));
      float v10 = (void *)v13;
      v12 = (void *)v14;
    }

    if (v10 && v12)
    {
      [v10 floatValue];
      double x = v15;
      [v12 floatValue];
      double y = v16;
    }

    else
    {
      double x = CGPointZero.x;
      double y = CGPointZero.y;
    }
  }

  else
  {
    float v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", @"ZoomLocationX"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", @"ZoomLocationY"));
    v12 = (void *)v17;
    if (v10 && v17)
    {
      [v10 floatValue];
      double x = v18;
      [v12 floatValue];
      double y = v19;
    }
  }

  double v20 = x;
  double v21 = y;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (BOOL)zoomedForKey:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[ZOTConfiguration perApplicationZoomLevelEnabled](self, "perApplicationZoomLevelEnabled");
  if (v4 && (v5 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", v4));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Zoomed"]);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", @"Zoomed"));
    if (!v7) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    }
  }

  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (BOOL)perApplicationZoomLevelEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ZOTConfiguration valueForKey:](self, "valueForKey:", @"ZoomPerApp"));
  BOOL v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end