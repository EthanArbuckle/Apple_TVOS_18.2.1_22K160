@interface TVSettingsSimpleResolutionViewController
- (id)loadSettingGroups;
@end

@implementation TVSettingsSimpleResolutionViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDisplayModeFacade sharedInstance]( &OBJC_CLASS___TVSettingsDisplayModeFacade,  "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionGroupsForCommonModes:]( self,  "resolutionGroupsForCommonModes:",  1LL));
  uint64_t v5 = TSKLocString(@"AVOtherResolutionTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (+[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR"))
  {
    uint64_t v7 = TSKLocString(@"AVOtherFormatsTitle");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);

    v6 = (void *)v8;
  }

  id v9 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v6,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsOtherResolutionViewController));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000C3F24;
  v16[3] = &unk_10018E608;
  id v17 = v3;
  id v11 = v3;
  [v10 setUpdateBlock:v16];
  v18 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayByAddingObject:v13]);
  return v14;
}

@end