@interface ASCDefaults
+ (ASCDefaults)daemonDefaults;
- (ASCDefaults)initWithBundleID:(id)a3;
- (BOOL)disableShutdownTimer;
- (BOOL)enableWebInspector;
- (BOOL)forceRightToLeftLayout;
- (BOOL)forceStandaloneWatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)preferInternalJS;
- (NSCache)cachedValues;
- (NSNumber)overlaysLoadTimeout;
- (NSNumber)overlaysRateLimitRequestsPerSecond;
- (NSNumber)overlaysRateLimitTimeWindow;
- (NSString)bundleID;
- (NSString)debugPackageURL;
- (NSString)jsVersion;
- (NSString)storefrontLocaleID;
- (NSUserDefaults)userDefaults;
- (id)description;
- (id)objectForKey:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCachedValues:(id)a3;
- (void)setDebugPackageURL:(id)a3;
- (void)setDisableShutdownTimer:(BOOL)a3;
- (void)setEnableWebInspector:(BOOL)a3;
- (void)setForceRightToLeftLayout:(BOOL)a3;
- (void)setForceStandaloneWatch:(BOOL)a3;
- (void)setJsVersion:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setOverlaysLoadTimeout:(id)a3;
- (void)setOverlaysRateLimitRequestsPerSecond:(id)a3;
- (void)setOverlaysRateLimitTimeWindow:(id)a3;
- (void)setPreferInternalJS:(BOOL)a3;
- (void)setStorefrontLocaleID:(id)a3;
@end

@implementation ASCDefaults

+ (ASCDefaults)daemonDefaults
{
  if (qword_1001407D0 != -1) {
    dispatch_once(&qword_1001407D0, &stru_10011F048);
  }
  return (ASCDefaults *)(id)qword_1001407D8;
}

- (ASCDefaults)initWithBundleID:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ASCDefaults;
  v5 = -[ASCDefaults init](&v14, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSCache);
    cachedValues = v5->_cachedValues;
    v5->_cachedValues = v8;

    v10 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  v5->_bundleID);
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = v10;

    for (uint64_t i = 0LL; i != 88; i += 8LL)
      -[NSUserDefaults addObserver:forKeyPath:options:context:]( v5->_userDefaults,  "addObserver:forKeyPath:options:context:",  v5,  *(__CFString **)((char *)&off_10011EFF0 + i),  1LL,  off_10013BA50);
  }

  return v5;
}

- (void)dealloc
{
  for (uint64_t i = 0LL; i != 88; i += 8LL)
    -[NSUserDefaults removeObserver:forKeyPath:context:]( self->_userDefaults,  "removeObserver:forKeyPath:context:",  self,  *(__CFString **)((char *)&off_10011EFF0 + i),  off_10013BA50);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ASCDefaults;
  -[ASCDefaults dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_10013BA50 == a6)
  {
    id v11 = a3;
    id v14 = (id)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
    v12 = -[ASCCacheValue initWithValue:](objc_alloc(&OBJC_CLASS___ASCCacheValue), "initWithValue:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDefaults cachedValues](self, "cachedValues"));
    [v13 setObject:v12 forKey:v11];
  }

  else
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___ASCDefaults;
    id v10 = a3;
    -[ASCDefaults observeValueForKeyPath:ofObject:change:context:]( &v15,  "observeValueForKeyPath:ofObject:change:context:",  v10,  a4,  a5,  a6);
  }

- (void)setObject:(id)a3 forKey:(id)a4
{
  v6 = (__CFString *)a4;
  id v7 = a3;
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ASCDefaults bundleID](self, "bundleID"));
  CFPreferencesSetAppValue(v6, v7, v8);
}

- (id)objectForKey:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDefaults cachedValues](self, "cachedValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
  }

  else
  {
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ASCDefaults bundleID](self, "bundleID"));
    id v7 = (void *)CFPreferencesCopyAppValue(v4, v8);

    v9 = -[ASCCacheValue initWithValue:](objc_alloc(&OBJC_CLASS___ASCCacheValue), "initWithValue:", v7);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDefaults cachedValues](self, "cachedValues"));
    [v10 setObject:v9 forKey:v4];
  }

  return v7;
}

- (NSString)storefrontLocaleID
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDefaults objectForKey:](self, "objectForKey:", @"ASCLocaleID"));
  v5 = v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      objc_super v4 = v5;
    }
    else {
      objc_super v4 = 0LL;
    }
  }

  v6 = v4;

  return v6;
}

- (void)setStorefrontLocaleID:(id)a3
{
}

- (BOOL)forceRightToLeftLayout
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ASCDefaults objectForKey:](self, "objectForKey:", @"ASCForceRightToLeftLayout"));
  v5 = (void *)v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      v6 = v5;
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  id v7 = v6;
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (void)setForceRightToLeftLayout:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", v4, @"ASCForceRightToLeftLayout");
}

- (BOOL)disableShutdownTimer
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ASCDefaults objectForKey:](self, "objectForKey:", @"ASCDisableShutdownTimer"));
  v5 = (void *)v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      v6 = v5;
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  id v7 = v6;
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (void)setDisableShutdownTimer:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", v4, @"ASCDisableShutdownTimer");
}

- (NSNumber)overlaysRateLimitRequestsPerSecond
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[ASCDefaults objectForKey:]( self,  "objectForKey:",  @"ASCPreferenceKeyOverlaysRateLimitRequestsPerSecond"));
  v5 = v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      id v4 = v5;
    }
    else {
      id v4 = 0LL;
    }
  }

  v6 = v4;

  return v6;
}

- (void)setOverlaysRateLimitRequestsPerSecond:(id)a3
{
}

- (NSNumber)overlaysRateLimitTimeWindow
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[ASCDefaults objectForKey:]( self,  "objectForKey:",  @"ASCPreferenceKeyOverlaysRateLimitTimeWindow"));
  v5 = v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      id v4 = v5;
    }
    else {
      id v4 = 0LL;
    }
  }

  v6 = v4;

  return v6;
}

- (void)setOverlaysRateLimitTimeWindow:(id)a3
{
}

- (NSNumber)overlaysLoadTimeout
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDefaults objectForKey:](self, "objectForKey:", @"ASCPreferenceKeyOverlaysLoadTimeout"));
  v5 = v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      id v4 = v5;
    }
    else {
      id v4 = 0LL;
    }
  }

  v6 = v4;

  return v6;
}

- (void)setOverlaysLoadTimeout:(id)a3
{
}

- (BOOL)enableWebInspector
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ASCDefaults objectForKey:](self, "objectForKey:", @"ASCEnableWebInspector"));
  v5 = (void *)v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      v6 = v5;
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  id v7 = v6;
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (void)setEnableWebInspector:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", v4, @"ASCEnableWebInspector");
}

- (BOOL)forceStandaloneWatch
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ASCDefaults objectForKey:](self, "objectForKey:", @"ASCForceStandaloneWatch"));
  v5 = (void *)v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      v6 = v5;
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  id v7 = v6;
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (void)setForceStandaloneWatch:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", v4, @"ASCForceStandaloneWatch");
}

- (NSString)debugPackageURL
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDefaults objectForKey:](self, "objectForKey:", @"ASCDebugJavaScriptPackageURL"));
  v5 = v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      id v4 = v5;
    }
    else {
      id v4 = 0LL;
    }
  }

  v6 = v4;

  return v6;
}

- (void)setDebugPackageURL:(id)a3
{
}

- (BOOL)preferInternalJS
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ASCDefaults objectForKey:](self, "objectForKey:", @"ASCPreferInternalJS"));
  v5 = (void *)v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      v6 = v5;
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  id v7 = v6;
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (void)setPreferInternalJS:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[ASCDefaults setObject:forKey:](self, "setObject:forKey:", v4, @"ASCPreferInternalJS");
}

- (NSString)jsVersion
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDefaults objectForKey:](self, "objectForKey:", @"ASCJavaScriptVersion"));
  v5 = v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      id v4 = v5;
    }
    else {
      id v4 = 0LL;
    }
  }

  v6 = v4;

  return v6;
}

- (void)setJsVersion:(id)a3
{
}

- (unint64_t)hash
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDefaults bundleID](self, "bundleID"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  unint64_t v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCDefaults);
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      unsigned __int8 v8 = v7;
    }
    else {
      unsigned __int8 v8 = 0LL;
    }
  }

  else
  {
    unsigned __int8 v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDefaults bundleID](self, "bundleID"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 bundleID]);
    v12 = (void *)v11;
    if (v10 && v11) {
      unsigned __int8 v13 = [v10 isEqual:v11];
    }
    else {
      unsigned __int8 v13 = v10 == (void *)v11;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)description
{
  uint64_t v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDefaults bundleID](self, "bundleID"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"bundleID");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSCache)cachedValues
{
  return self->_cachedValues;
}

- (void)setCachedValues:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
}

@end