@interface TVIdleScreenLocationMigration
+ (unint64_t)migrateWithContext:(id)a3 error:(id *)a4;
@end

@implementation TVIdleScreenLocationMigration

+ (unint64_t)migrateWithContext:(id)a3 error:(id *)a4
{
  if (+[CLLocationManager authorizationStatusForBundleIdentifier:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundleIdentifier:",  @"com.apple.TVIdleScreen",  a4) < 3) {
    return 2LL;
  }
  +[CLLocationManager setAuthorizationStatusByType:forBundleIdentifier:]( &OBJC_CLASS___CLLocationManager,  "setAuthorizationStatusByType:forBundleIdentifier:",  0LL,  @"com.apple.TVIdleScreen");
  if (+[CLLocationManager authorizationStatusForBundleIdentifier:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundleIdentifier:",  @"com.apple.TVIdleScreen")) {
    return 1LL;
  }
  else {
    return 3LL;
  }
}

@end