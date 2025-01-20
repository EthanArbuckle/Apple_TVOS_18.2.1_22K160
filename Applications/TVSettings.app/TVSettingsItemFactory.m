@interface TVSettingsItemFactory
+ (BOOL)_specifierSupported:(id)a3;
+ (int64_t)_autocapitalizationTypeFromString:(id)a3;
+ (int64_t)_autocorrectionTypeFromString:(id)a3;
+ (int64_t)_keyboardTypeFromString:(id)a3;
- (NSBundle)bundle;
- (NSString)appIdentifier;
- (NSString)stringsTable;
- (TVSettingsContainerizedPreferencesFacade)preferencesFacade;
- (TVSettingsItemFactory)initWithBundle:(id)a3 appIdentifier:(id)a4 containerPath:(id)a5;
- (id)childPaneItemFromSpecifierDictionary:(id)a3;
- (id)groupFromSpecifierDictionary:(id)a3 withItems:(id)a4;
- (id)longTextItemFromSpecifierDictionary:(id)a3;
- (id)multiValueItemFromSpecifierDictionary:(id)a3;
- (id)privacyItemFromSpecifierDictionary:(id)a3;
- (id)radioGroupFromSpecifierDictionary:(id)a3;
- (id)sliderItemFromSpecifierDictionary:(id)a3;
- (id)textItemFromSpecifierDictionary:(id)a3;
- (id)titleItemFromSpecifierDictionary:(id)a3;
- (id)toggleItemFromSpecifierDictionary:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setBundle:(id)a3;
- (void)setPreferencesFacade:(id)a3;
- (void)setStringsTable:(id)a3;
@end

@implementation TVSettingsItemFactory

- (TVSettingsItemFactory)initWithBundle:(id)a3 appIdentifier:(id)a4 containerPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVSettingsItemFactory;
  v12 = -[TVSettingsItemFactory init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundle, a3);
    v14 = (NSString *)[v10 copy];
    appIdentifier = v13->_appIdentifier;
    v13->_appIdentifier = v14;

    v16 = -[TVSettingsContainerizedPreferencesFacade initWithDomain:containerPath:]( objc_alloc(&OBJC_CLASS___TVSettingsContainerizedPreferencesFacade),  "initWithDomain:containerPath:",  v10,  v11);
    preferencesFacade = v13->_preferencesFacade;
    v13->_preferencesFacade = v16;
  }

  return v13;
}

- (id)childPaneItemFromSpecifierDictionary:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class(self) _specifierSupported:v4])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Title"]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"File"]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory appIdentifier](self, "appIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory stringsTable](self, "stringsTable"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v5 value:&stru_100195DD8 table:v10]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsContainerizedPreferencesFacade containerPath](self->_preferencesFacade, "containerPath"));
    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100043260;
    v20[3] = &unk_100190480;
    id v13 = v11;
    id v21 = v13;
    id v14 = v7;
    id v22 = v14;
    id v15 = v8;
    id v23 = v15;
    id v16 = v12;
    id v24 = v16;
    id v17 = v6;
    id v25 = v17;
    objc_copyWeak(&v26, &location);
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v13,  0LL,  0LL,  0LL,  v20));
    objc_destroyWeak(&v26);

    objc_destroyWeak(&location);
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

- (id)groupFromSpecifierDictionary:(id)a3 withItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  else {
    v8 = 0LL;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"FooterText"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory stringsTable](self, "stringsTable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:v8 value:&stru_100195DD8 table:v11]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v12,  v7));

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory stringsTable](self, "stringsTable"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:v9 value:&stru_100195DD8 table:v15]);
  [v13 setLocalizedDescription:v16];

  [v13 setAutoHide:0];
  return v13;
}

- (id)multiValueItemFromSpecifierDictionary:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class(self) _specifierSupported:v4])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Title"]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Values"]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Key"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsContainerizedPreferencesFacade valueForPreferenceKey:]( self->_preferencesFacade,  "valueForPreferenceKey:"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory stringsTable](self, "stringsTable"));
    id v25 = (void *)v5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v5 value:&stru_100195DD8 table:v9]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v10,  0LL,  v7,  @"value",  v6));

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DisplaySortedByTitle"]);
    objc_msgSend(v11, "setSortsByTitle:", objc_msgSend(v12, "BOOLValue"));

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DefaultValue"]);
    [v11 setDefaultValue:v13];

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ShortTitles"]);
    id v15 = v14;
    if (v14)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100043774;
      v27[3] = &unk_1001904A8;
      v27[4] = self;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tvs_arrayByMappingObjectsUsingBlock:", v27));
      id v17 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  v6,  v16);
      [v11 setLocalizedValueFormatter:v17];
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Titles"]);
    objc_super v19 = v18;
    if (v18)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1000437F4;
      v26[3] = &unk_1001904A8;
      v26[4] = self;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tvs_arrayByMappingObjectsUsingBlock:", v26));
      id v21 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  v6,  v20);
      [v11 setDetailedLocalizedValueFormatter:v21];
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedValueFormatter]);

      if (!v22) {
        [v11 setLocalizedValueFormatter:v21];
      }
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)radioGroupFromSpecifierDictionary:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class(self) _specifierSupported:v4])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Title"]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Values"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Key"]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsContainerizedPreferencesFacade valueForPreferenceKey:]( self->_preferencesFacade,  "valueForPreferenceKey:",  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory stringsTable](self, "stringsTable"));
    id v24 = (void *)v5;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v5 value:&stru_100195DD8 table:v10]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKRadioSettingGroup radioGroupWithTitle:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKRadioSettingGroup,  "radioGroupWithTitle:representedObject:keyPath:availableValues:",  v11,  v8,  @"value",  v6));

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FooterText"]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory stringsTable](self, "stringsTable"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:v14 value:&stru_100195DD8 table:v15]);
    [v12 setLocalizedDescription:v16];

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DisplaySortedByTitle"]);
    objc_msgSend(v12, "setSortsByTitle:", objc_msgSend(v17, "BOOLValue"));

    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DefaultValue"]);
    [v12 setDefaultValue:v18];

    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Titles"]);
    v20 = v19;
    if (v19)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100043B2C;
      v25[3] = &unk_1001904A8;
      v25[4] = self;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvs_arrayByMappingObjectsUsingBlock:", v25));
      id v22 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  v6,  v21);
      [v12 setLocalizedValueFormatter:v22];
    }
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)sliderItemFromSpecifierDictionary:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class(self) _specifierSupported:v4];

  return 0LL;
}

- (id)textItemFromSpecifierDictionary:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class(self) _specifierSupported:v4])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Title"]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Key"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsContainerizedPreferencesFacade valueForPreferenceKey:]( self->_preferencesFacade,  "valueForPreferenceKey:",  v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory stringsTable](self, "stringsTable"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v5 value:&stru_100195DD8 table:v9]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v10,  0LL,  v7,  @"value"));

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DefaultValue"]);
    [v11 setDefaultValue:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"IsSecure"]);
    objc_msgSend(v11, "setSecure:", objc_msgSend(v13, "BOOLValue"));

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"KeyboardType"]);
    objc_msgSend(v11, "setKeyboardType:", objc_msgSend((id)objc_opt_class(self), "_keyboardTypeFromString:", v14));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AutocapitalizationType"]);
    objc_msgSend( v11,  "setAutocapitalizationType:",  objc_msgSend((id)objc_opt_class(self), "_autocapitalizationTypeFromString:", v15));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AutocorrectionType"]);
    objc_msgSend( v11,  "setAutocorrectionType:",  objc_msgSend((id)objc_opt_class(self), "_autocorrectionTypeFromString:", v16));
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)longTextItemFromSpecifierDictionary:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class(self) _specifierSupported:v4])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Title"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory stringsTable](self, "stringsTable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v6 value:&stru_100195DD8 table:v7]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BodyText"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory stringsTable](self, "stringsTable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v10 value:&stru_100195DD8 table:v11]);

    id v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    objc_super v19 = sub_100043FD0;
    v20 = &unk_1001904D0;
    id v21 = v8;
    id v22 = v12;
    id v13 = v12;
    id v14 = v8;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v14,  0LL,  0LL,  0LL,  &v17));
    objc_msgSend(v15, "setShouldPresentChildController:", 1, v17, v18, v19, v20);
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (id)toggleItemFromSpecifierDictionary:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class(self) _specifierSupported:v4])
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Title"]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Key"]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsContainerizedPreferencesFacade valueForPreferenceKey:]( self->_preferencesFacade,  "valueForPreferenceKey:",  v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory stringsTable](self, "stringsTable"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v30 value:&stru_100195DD8 table:v8]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v9,  0LL,  v6,  @"value",  0LL,  0LL));

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DefaultValue"]);
    [v10 setDefaultValue:v11];

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"TrueValue"]);
    id v13 = (void *)v12;
    id v14 = &__kCFBooleanTrue;
    if (v12) {
      id v14 = (void *)v12;
    }
    id v15 = v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FalseValue"]);
    id v17 = (void *)v16;
    uint64_t v18 = &__kCFBooleanFalse;
    if (v16) {
      uint64_t v18 = (void *)v16;
    }
    id v19 = v18;

    v33[0] = v15;
    v33[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
    v32[0] = v15;
    v32[1] = v19;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
    [v10 setAvailableValues:v21];

    uint64_t v22 = TSKLocString(@"SettingsON");
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v31[0] = v23;
    uint64_t v24 = TSKLocString(@"SettingsOFF");
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v31[1] = v25;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));

    v27 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
    v28 = -[TSKMappingFormatter initWithInputs:outputs:](v27, "initWithInputs:outputs:", v20, v26);
    [v10 setLocalizedValueFormatter:v28];
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)titleItemFromSpecifierDictionary:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class(self) _specifierSupported:v4])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Title"]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Key"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsContainerizedPreferencesFacade valueForPreferenceKey:]( self->_preferencesFacade,  "valueForPreferenceKey:",  v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory bundle](self, "bundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsItemFactory stringsTable](self, "stringsTable"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v5 value:&stru_100195DD8 table:v9]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v10,  0LL,  v7,  @"value"));

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DefaultValue"]);
    [v11 setDefaultValue:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Values"]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Titles"]);
    id v15 = v14;
    if (v13 && v14)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000444F8;
      v19[3] = &unk_1001904A8;
      v19[4] = self;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tvs_arrayByMappingObjectsUsingBlock:", v19));
      id v17 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  v13,  v16);
      [v11 setLocalizedValueFormatter:v17];
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)privacyItemFromSpecifierDictionary:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class(self) _specifierSupported:v4])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PrivacyBundleID"]);
    if (v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem privacyItemWithIdentifier:]( &OBJC_CLASS___TSKSettingItem,  "privacyItemWithIdentifier:",  v5));
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (BOOL)_specifierSupported:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tvs_arrayForKey:", @"SupportedUserInterfaceIdioms"));
  id v4 = v3;
  BOOL v5 = !v3 || [v3 containsObject:@"TV"];

  return v5;
}

+ (int64_t)_keyboardTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"EmailAddress"])
  {
    int64_t v4 = 7LL;
  }

  else if ([v3 isEqual:@"NumbersAndPunctuation"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqual:@"NumberPad"])
  {
    int64_t v4 = 4LL;
  }

  else if ([v3 isEqual:@"URL"])
  {
    int64_t v4 = 3LL;
  }

  else
  {
    int64_t v4 = 1LL;
  }

  return v4;
}

+ (int64_t)_autocorrectionTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"No"])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqual:@"Yes"])
  {
    int64_t v4 = 2LL;
  }

  else
  {
    int64_t v4 = 0LL;
  }

  return v4;
}

+ (int64_t)_autocapitalizationTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"Sentences"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqual:@"Words"])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqual:@"AllCharacters"])
  {
    int64_t v4 = 3LL;
  }

  else
  {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (NSString)stringsTable
{
  return self->_stringsTable;
}

- (void)setStringsTable:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (TVSettingsContainerizedPreferencesFacade)preferencesFacade
{
  return self->_preferencesFacade;
}

- (void)setPreferencesFacade:(id)a3
{
}

- (void).cxx_destruct
{
}

@end