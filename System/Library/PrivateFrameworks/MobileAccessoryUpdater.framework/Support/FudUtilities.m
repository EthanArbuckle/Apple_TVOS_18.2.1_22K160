@interface FudUtilities
+ (BOOL)isFirstLaunchSinceBoot;
+ (BOOL)logFudAggd:(id)a3 status:(id)a4 info:(id)a5 value:(int64_t)a6;
+ (BOOL)postNotification:(id)a3;
+ (BOOL)shouldDefaultModalClientBeEnabled;
+ (id)copyPluginAtURL:(id)a3 forFilter:(id)a4 delegate:(id)a5 info:(id *)a6 options:(id)a7 bundleVersion:(id *)a8;
+ (id)getLocalizedString:(id)a3 withBundle:(id)a4 defaultValue:(id)a5;
+ (id)getStringFromBundleLocalizationTable:(id)a3 withBundle:(id)a4 inLocalization:(id)a5 fromTable:(id)a6;
+ (id)getURLForServiceIdentifier:(id)a3;
@end

@implementation FudUtilities

+ (id)copyPluginAtURL:(id)a3 forFilter:(id)a4 delegate:(id)a5 info:(id *)a6 options:(id)a7 bundleVersion:(id *)a8
{
  if (a3)
  {
    v13 = +[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:");
    id v14 = [a7 mutableCopy];
    v15 = -[NSBundle bundleIdentifier](v13, "bundleIdentifier");
    FudLog(7LL, @"XPCService Name: %@");
    FudLog(7LL, @"Initializing plugin with deviceClass:%@ delegate:%@ options:%@");
    objc_msgSend(v14, "setObject:forKey:", v15, @"AUServiceName", a4, a5, a7);
    FudLog(7LL, @"Initializing XPCService:%@ with deviceClass:%@ delegate:%@ options:%@");
    v16 = -[AUServiceShim initWithDeviceClass:delegate:info:options:]( objc_alloc(&OBJC_CLASS___AUServiceShim),  "initWithDeviceClass:delegate:info:options:",  a4,  a5,  a6,  v14,  v15,  a4,  a5,  a7);
    if (!v16)
    {
      if (([0 conformsToProtocol:&OBJC_PROTOCOL___FudPlugin] & 1) == 0)
      {
        FudLog(3LL, @"Plugin doesn't implement correct protocol: \"%@\"");
        v16 = 0LL;
        goto LABEL_7;
      }

      v16 = (AUServiceShim *)[[0 alloc] initWithDeviceClass:a4 delegate:a5 info:a6 options:a7];
      if (!v16)
      {
        FudLog(3LL, @"Failed to create an instance of \"%@\"");
        goto LABEL_7;
      }
    }

    if (a8) {
      *a8 = -[NSDictionary objectForKey:]( -[NSBundle infoDictionary](v13, "infoDictionary"),  "objectForKey:",  kCFBundleVersionKey);
    }
  }

  else
  {
    v16 = 0LL;
    id v14 = 0LL;
  }

+ (id)getURLForServiceIdentifier:(id)a3
{
  v4 = +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/System/Library/PrivateFrameworks/MobileAccessoryUpdater.framework/XPCServices/");
  if (!v4) {
    return 0LL;
  }
  v5 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v4,  0LL,  1LL,  0LL);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (!v6)
  {
LABEL_10:
    FudLog(3LL, @"There is no bundle with identifier: %@");
    return 0LL;
  }

  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_4:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (-[NSString isEqualToString:]( -[NSBundle bundleIdentifier]( +[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v10),  "bundleIdentifier"),  "isEqualToString:",  a3))
    {
      break;
    }

    if (v7 == (id)++v9)
    {
      id v7 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v7) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  if (!v10) {
    goto LABEL_10;
  }
  return v10;
}

+ (BOOL)postNotification:(id)a3
{
  uint32_t v4 = notify_post((const char *)objc_msgSend(a3, "cStringUsingEncoding:", 4, a3));
  if (v4) {
    FudLog(3LL, @"Failed to send BSD notification, status=%u");
  }
  return v4 == 0;
}

+ (BOOL)shouldDefaultModalClientBeEnabled
{
  return 1;
}

+ (BOOL)logFudAggd:(id)a3 status:(id)a4 info:(id)a5 value:(int64_t)a6
{
  if (a5) {
    CFStringRef v7 = CFStringCreateWithFormat(0LL, 0LL, @"com.apple.MobileAccessoryUpdater.%@.%@.%@", a4, a3, a5);
  }
  else {
    CFStringRef v7 = CFStringCreateWithFormat(0LL, 0LL, @"com.apple.MobileAccessoryUpdater.%@.%@", a4, a3);
  }
  CFStringRef v8 = v7;
  if (v7)
  {
    ADClientAddValueForScalarKey(v7, a6);
    CFRelease(v8);
  }

  return 1;
}

+ (BOOL)isFirstLaunchSinceBoot
{
  if (qword_10008E370 != -1) {
    dispatch_once(&qword_10008E370, &stru_1000758A8);
  }
  return byte_10008E368;
}

+ (id)getStringFromBundleLocalizationTable:(id)a3 withBundle:(id)a4 inLocalization:(id)a5 fromTable:(id)a6
{
  id result = +[NSDictionary dictionaryWithContentsOfFile:]( NSDictionary,  "dictionaryWithContentsOfFile:",  [a4 pathForResource:a6 ofType:@"strings" inDirectory:0 forLocalization:a5]);
  if (result) {
    return [result objectForKey:a3];
  }
  return result;
}

+ (id)getLocalizedString:(id)a3 withBundle:(id)a4 defaultValue:(id)a5
{
  id v5 = [a4 localizedStringForKey:a3 value:a5 table:@"Localizable"];
  [v5 UTF8String];
  FudLog(7LL, @"\"%@\" => \"%s\"");
  return v5;
}

@end