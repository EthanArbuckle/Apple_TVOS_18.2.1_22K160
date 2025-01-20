@interface TVSettingsAppleConnectSettingsViewController
- (id)loadSettingGroups;
- (void)_checkAppleConnectCredentials;
- (void)_clearAppleConnectIDAndPassword:(id)a3;
@end

@implementation TVSettingsAppleConnectSettingsViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
  v4 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = TSKLocString(@"OSUpdateMenuItemUseAppleConnect");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v7,  0LL,  v3,  @"isEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v5, "addObject:", v8);
  uint64_t v9 = TSKLocString(@"OSUpdateMenuItemAppleConnectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v10,  0LL,  v3,  @"accountID"));

  [v11 setAutocorrectionType:1];
  [v11 setAutocapitalizationType:0];
  [v11 setKeyboardType:3];
  [v11 setUpdateBlock:&stru_100192E40];
  [v11 setTarget:self];
  [v11 setPlayButtonAction:"_clearAppleConnectIDAndPassword:"];
  uint64_t v12 = TSKLocString(@"OSUpdateTextClearValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v11 setLocalizedDescription:v13];

  -[NSMutableArray addObject:](v5, "addObject:", v11);
  uint64_t v14 = TSKLocString(@"OSUpdateMenuItemAppleConnectPassword");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v15,  0LL,  v3,  @"password"));

  [v16 setKeyboardType:2];
  [v16 setAutocorrectionType:1];
  [v16 setAutocapitalizationType:0];
  [v16 setSecure:1];
  [v16 setUpdateBlock:&stru_100192E60];
  [v16 setTarget:self];
  [v16 setPlayButtonAction:"_clearAppleConnectIDAndPassword:"];
  uint64_t v17 = TSKLocString(@"OSUpdateTextClearValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v16 setLocalizedDescription:v18];

  -[NSMutableArray addObject:](v5, "addObject:", v16);
  uint64_t v19 = TSKLocString(@"OSUpdateMenuItemCheckLogin");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = TSKLocString(@"OSUpdateCheckLoginDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v20,  v22,  0LL,  0LL,  self,  "_checkAppleConnectCredentials"));

  -[NSMutableArray addObject:](v5, "addObject:", v23);
  -[TSKSettingGroup setSettingItems:](v4, "setSettingItems:", v5);
  v26 = v4;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));

  return v24;
}

- (void)_clearAppleConnectIDAndPassword:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance", a3));
  if ([v3 isEnabled])
  {
    [v3 setAccountID:0];
    [v3 setPassword:0];
  }
}

- (void)_checkAppleConnectCredentials
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
  id v16 = 0LL;
  [v3 validateWithError:&v16];
  id v4 = v16;

  if (v4)
  {
    uint64_t v5 = TSKLocString(@"OSUpdateVerifyCredentialsBad");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v4));
  }

  else
  {
    uint64_t v8 = TSKLocString(@"OSUpdateVerifyCredentialsOK");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  uint64_t v9 = TSKLocString(@"OSUpdateVerifyCredentialsTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v10,  v7,  1LL));

  uint64_t v12 = TSKLocString(@"SettingsOK");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  1LL,  &stru_100192E80));

  [v11 addAction:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppleConnectSettingsViewController navigationController](self, "navigationController"));
  [v15 presentViewController:v11 animated:1 completion:0];
}

@end