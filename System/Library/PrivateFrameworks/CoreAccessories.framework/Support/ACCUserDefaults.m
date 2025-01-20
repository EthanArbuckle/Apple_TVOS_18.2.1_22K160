@interface ACCUserDefaults
+ (id)sharedDefaults;
+ (id)sharedDefaultsIapd;
+ (id)sharedDefaultsLogging;
- (ACCUserDefaults)init;
@end

@implementation ACCUserDefaults

- (ACCUserDefaults)init
{
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = NSStringFromSelector("sharedDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Use +[%@ %@] instead of -%@.",  v6,  v8,  v10);

  return 0LL;
}

+ (id)sharedDefaults
{
  if (sharedDefaults_once != -1) {
    dispatch_once(&sharedDefaults_once, &__block_literal_global_2);
  }
  return (id)sharedDefaults_sharedInstance;
}

void __33__ACCUserDefaults_sharedDefaults__block_invoke(id a1)
{
  v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.CoreAccessories");
  v2 = (void *)sharedDefaults_sharedInstance;
  sharedDefaults_sharedInstance = (uint64_t)v1;
}

+ (id)sharedDefaultsIapd
{
  if (sharedDefaultsIapd_once != -1) {
    dispatch_once(&sharedDefaultsIapd_once, &__block_literal_global_183);
  }
  return (id)sharedDefaultsIapd_sharedInstance;
}

void __37__ACCUserDefaults_sharedDefaultsIapd__block_invoke(id a1)
{
  v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.iapd");
  v2 = (void *)sharedDefaultsIapd_sharedInstance;
  sharedDefaultsIapd_sharedInstance = (uint64_t)v1;
}

+ (id)sharedDefaultsLogging
{
  if (sharedDefaultsLogging_once != -1) {
    dispatch_once(&sharedDefaultsLogging_once, &__block_literal_global_184);
  }
  return (id)sharedDefaultsLogging_sharedInstance;
}

void __40__ACCUserDefaults_sharedDefaultsLogging__block_invoke(id a1)
{
  v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.logging");
  v2 = (void *)sharedDefaultsLogging_sharedInstance;
  sharedDefaultsLogging_sharedInstance = (uint64_t)v1;
}

@end