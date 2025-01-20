@interface TCCDBundle
+ (TCCDBundle)bundleWithIdentifier:(id)a3;
+ (TCCDBundle)bundleWithURL:(id)a3;
- (BOOL)isASKCapable;
- (BOOL)isLSUIElement;
- (BOOL)isPathContainedWithin:(id)a3;
- (BOOL)isPathTheMainExecutable:(id)a3;
- (BOOL)isRunsIndependentlyOfCompanionApp;
- (BOOL)isWatchKitApp;
- (BOOL)isWatchOnly;
- (NSDictionary)infoDictionary;
- (NSDictionary)localizedInfoDictionary;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)bundleVersion;
- (NSString)executablePath;
- (NSString)extensionPointIdentifier;
- (NSURL)bundleURL;
- (NSURL)executableURL;
- (TCCDBundle)initWithIdentifier:(id)a3;
- (TCCDBundle)initWithURL:(id)a3;
- (id)description;
- (id)localizedUsageDescriptionForKey:(id)a3;
- (void)dealloc;
@end

@implementation TCCDBundle

- (TCCDBundle)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TCCDBundle;
  v5 = -[TCCDBundle init](&v11, "init");
  if (v5 && (uint64_t Unique = _CFBundleCreateUnique(kCFAllocatorDefault, v4), (v5->_cfBundle = (__CFBundle *)Unique) == 0LL))
  {
    id v8 = tcc_access_log();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001AF58((uint64_t)v4, v9);
    }

    v7 = 0LL;
  }

  else
  {
    v7 = v5;
  }

  return v7;
}

- (TCCDBundle)initWithIdentifier:(id)a3
{
  id v4 = a3;
  id v11 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v4,  0LL,  &v11));
  id v6 = v11;
  if (v6)
  {
    id v7 = tcc_access_log();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001AFC8();
    }
    v9 = 0LL;
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 URL]);
    self = -[TCCDBundle initWithURL:](self, "initWithURL:", v8);
    v9 = self;
  }

  return v9;
}

- (void)dealloc
{
  cfBundle = self->_cfBundle;
  if (cfBundle) {
    CFRelease(cfBundle);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TCCDBundle;
  -[TCCDBundle dealloc](&v4, "dealloc");
}

+ (TCCDBundle)bundleWithURL:(id)a3
{
  id v3 = a3;
  objc_super v4 = -[TCCDBundle initWithURL:](objc_alloc(&OBJC_CLASS___TCCDBundle), "initWithURL:", v3);

  return v4;
}

+ (TCCDBundle)bundleWithIdentifier:(id)a3
{
  id v3 = a3;
  objc_super v4 = -[TCCDBundle initWithIdentifier:](objc_alloc(&OBJC_CLASS___TCCDBundle), "initWithIdentifier:", v3);

  return v4;
}

- (NSString)bundleIdentifier
{
  return (NSString *)CFBundleGetIdentifier(self->_cfBundle);
}

- (NSString)bundlePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle bundleURL](self, "bundleURL"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  return (NSString *)v3;
}

- (NSURL)bundleURL
{
  return (NSURL *)CFBundleCopyBundleURL(self->_cfBundle);
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle bundleIdentifier](self, "bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle bundleVersion](self, "bundleVersion"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle bundlePath](self, "bundlePath"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: bundleID=%@, version=%@, path=%@>",  v3,  v4,  v5,  v6));

  return v7;
}

- (NSString)executablePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle executableURL](self, "executableURL"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  return (NSString *)v3;
}

- (NSURL)executableURL
{
  return (NSURL *)CFBundleCopyExecutableURL(self->_cfBundle);
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)CFBundleGetInfoDictionary(self->_cfBundle);
}

- (NSDictionary)localizedInfoDictionary
{
  return (NSDictionary *)CFBundleGetLocalInfoDictionary(self->_cfBundle);
}

- (NSString)bundleVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle infoDictionary](self, "infoDictionary"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"CFBundleVersion"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

- (NSString)extensionPointIdentifier
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle infoDictionary](self, "infoDictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"EXAppExtensionAttributes"]);

  if (v4)
  {
    id v6 = @"EXExtensionPointIdentifier";
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle infoDictionary](self, "infoDictionary"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"NSExtension"]);

    id v6 = @"NSExtensionPointIdentifier";
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) == 0)
  {
    id v13 = tcc_access_log();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001B030();
    }
    goto LABEL_12;
  }

  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v6]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
  {
    id v14 = tcc_access_log();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543874;
      v18 = self;
      __int16 v19 = 2112;
      v20 = v6;
      __int16 v21 = 2114;
      v22 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@: Info.plist is missing or has invalid value for %@ key: %{public}@",  (uint8_t *)&v17,  0x20u);
    }

LABEL_12:
    v12 = 0LL;
    goto LABEL_13;
  }

  v9 = v9;
  v12 = v9;
LABEL_13:

  return (NSString *)v12;
}

- (BOOL)isLSUIElement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle infoDictionary](self, "infoDictionary"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"LSUIElement"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)localizedUsageDescriptionForKey:(id)a3
{
  ValueForInfoDictionaryKey = (void *)CFBundleGetValueForInfoDictionaryKey(self->_cfBundle, (CFStringRef)a3);
  if (ValueForInfoDictionaryKey)
  {
    uint64_t v4 = ValueForInfoDictionaryKey;
    CFTypeID v5 = CFGetTypeID(ValueForInfoDictionaryKey);
    if (v5 == CFStringGetTypeID()) {
      ValueForInfoDictionaryKey = v4;
    }
    else {
      ValueForInfoDictionaryKey = 0LL;
    }
  }

  return ValueForInfoDictionaryKey;
}

- (BOOL)isWatchKitApp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle infoDictionary](self, "infoDictionary"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"WKApplication"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isWatchOnly
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle infoDictionary](self, "infoDictionary"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"WKWatchOnly"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isRunsIndependentlyOfCompanionApp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle infoDictionary](self, "infoDictionary"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"WKRunsIndependentlyOfCompanionApp"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isASKCapable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle infoDictionary](self, "infoDictionary"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"NSAccessorySetupKitSupports"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unsigned __int8 v6 = [v3 containsObject:@"Bluetooth"];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isPathTheMainExecutable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle executablePath](self, "executablePath"));
  id v12 = 0LL;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByResolvingRealPathWithError:&v12]);
  id v7 = v12;

  if (v6)
  {
    unsigned __int8 v8 = [v6 isEqualToString:v4];
  }

  else
  {
    id v9 = tcc_access_log();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10001B098(self, (uint64_t)v7, v10);
    }

    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isPathContainedWithin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle bundlePath](self, "bundlePath"));
  id v12 = 0LL;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByResolvingRealPathWithError:&v12]);
  id v7 = v12;

  if (v6)
  {
    unsigned __int8 v8 = [v4 hasPrefix:v6];
  }

  else
  {
    id v9 = tcc_access_log();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10001B120(self, (uint64_t)v7, v10);
    }

    unsigned __int8 v8 = 0;
  }

  return v8;
}

  ;
}

@end