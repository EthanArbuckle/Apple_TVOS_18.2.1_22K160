@interface MSDServiceResolutionHelper
+ (id)createMSResolutionInfoObject:(id)a3 homeUserID:(id)a4 sharedUserID:(id)a5;
@end

@implementation MSDServiceResolutionHelper

+ (id)createMSResolutionInfoObject:(id)a3 homeUserID:(id)a4 sharedUserID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForBundleID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForBundleID:",  a3));
  v10 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[MSDAppSelectionAssistant appServiceInfoForUser:usingPublicInfo:]( &OBJC_CLASS___MSDAppSelectionAssistant,  "appServiceInfoForUser:usingPublicInfo:",  v10,  v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIDS]);
  id v13 = [v12 copy];
  [v11 setAlternateBundleIDS:v13];

  id v14 = [[MSUserAccountInfo alloc] initWithHomeUserID:v8 sharedUserID:v7];
  id v15 = [[MSServiceResolutionInfo alloc] initWithServiceAppInfo:v11 userAccountInfo:v14];

  return v15;
}

@end