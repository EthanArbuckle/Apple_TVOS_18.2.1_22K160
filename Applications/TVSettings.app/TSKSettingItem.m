@interface TSKSettingItem
+ (id)privacyItemWithIdentifier:(id)a3;
@end

@implementation TSKSettingItem

+ (id)privacyItemWithIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 flow]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedButtonTitle]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100030FF4;
  v9[3] = &unk_10018EC30;
  id v10 = v4;
  id v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v5,  0LL,  0LL,  0LL,  v9));
  [v7 setShouldPresentChildController:1];

  return v7;
}

@end