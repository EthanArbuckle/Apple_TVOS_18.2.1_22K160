@interface AppExtensionSupport
+ (id)supportedAppExtensionTypes;
+ (id)supportedProxyExtensionForBundleIdentifier:(id)a3;
@end

@implementation AppExtensionSupport

+ (id)supportedAppExtensionTypes
{
  v3 = @"com.apple.message-payload-provider";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

+ (id)supportedProxyExtensionForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000E1BA4;
  v16 = sub_1000E1BB4;
  id v17 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 supportedAppExtensionTypes]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E1BBC;
  v9[3] = &unk_10034E128;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

@end