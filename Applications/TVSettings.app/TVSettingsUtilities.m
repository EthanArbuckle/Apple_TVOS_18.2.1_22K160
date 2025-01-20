@interface TVSettingsUtilities
+ (id)_attributedStringForAlertDetailMessage:(id)a3;
+ (id)_attributedStringWithString:(id)a3 attributes:(id)a4;
+ (id)_attributedStringWithString:(id)a3 font:(id)a4 color:(id)a5 kerning:(id)a6;
+ (id)_attributesWithFont:(id)a3 color:(id)a4 kerning:(id)a5;
+ (id)_defaultAttributedStringForString:(id)a3 withFont:(id)a4;
+ (id)_defaultAttributesForFont:(id)a3;
+ (id)capitalizeFirstPartOfCountry:(id)a3;
+ (id)continuityCameraImage;
+ (id)deviceManagementBundlePath;
+ (id)imageForSignalStrength:(float)a3;
+ (id)languageImage;
+ (id)localeNameFormatterWithIdentifiers:(id)a3;
+ (id)screenSaverStyleFormatter;
+ (int)pidForApplication:(id)a3;
@end

@implementation TVSettingsUtilities

+ (id)imageForSignalStrength:(float)a3
{
  unint64_t v3 = llroundf(a3) - 1;
  if (v3 > 4) {
    v4 = @"AirportBars0";
  }
  else {
    v4 = *(&off_100190B20 + v3);
  }
  return +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v4);
}

+ (id)languageImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:weight:scale:",  2LL,  -1LL,  512.0));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"globe",  v2));

  return v3;
}

+ (id)continuityCameraImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:weight:scale:",  2LL,  -1LL,  400.0));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage _systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:withConfiguration:",  @"rectangle.inset.filled.and.camera",  v2));

  return v3;
}

+ (id)localeNameFormatterWithIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](&OBJC_CLASS___NSLocale, "_deviceLanguage"));
  uint64_t v43 = objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v4));

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale componentsFromLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "componentsFromLocaleIdentifier:",  v11));
        [v5 setObject:v12 forKey:v11];
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSLocaleLanguageCode]);
        [v48 addObject:v13];
      }

      id v8 = [v6 countByEnumeratingWithState:&v55 objects:v60 count:16];
    }

    while (v8);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v6;
  v14 = (void *)v43;
  id v47 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v47)
  {
    uint64_t v44 = *(void *)v52;
    v45 = v5;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v52 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v16]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:NSLocaleLanguageCode]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:NSLocaleCountryCode]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v14 displayNameForKey:NSLocaleLanguageCode value:v18]);
        v21 = (void *)objc_claimAutoreleasedReturnValue([a1 capitalizeFirstPartOfCountry:v20]);

        v22 = (void *)objc_claimAutoreleasedReturnValue([v14 displayNameForKey:NSLocaleCountryCode value:v19]);
        if ([v18 isEqualToString:@"zh"])
        {
          if ([v19 isEqualToString:@"HK"])
          {
            uint64_t v23 = objc_claimAutoreleasedReturnValue([v14 displayNameForKey:NSLocaleLanguageCode value:@"yue"]);
          }

          else
          {
            uint64_t v25 = TSKLocString(@"MandarinSpokenDialectName");
            uint64_t v23 = objc_claimAutoreleasedReturnValue(v25);
          }

          v24 = (void *)v23;
        }

        else
        {
          v24 = 0LL;
        }

        if ((unint64_t)[v48 countForObject:v18] >= 2)
        {
          if ([v19 isEqualToString:@"HK"])
          {
            uint64_t v26 = TSKLocString(@"HongKongShortCountryName");
            uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);

            v22 = (void *)v27;
          }

          if (v24)
          {
            uint64_t v28 = TSKLocString(@"LanguageWithRegionAndDialectFormat");
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            v30 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v29, v21, v24, v22);
            goto LABEL_28;
          }

          uint64_t v34 = TSKLocString(@"LanguageWithRegionFormat");
          v24 = (void *)objc_claimAutoreleasedReturnValue(v34);
          id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v24, v21, v22));
LABEL_30:

          if (!v33) {
            goto LABEL_32;
          }
LABEL_31:
          [v42 setValue:v33 forKey:v16];
          goto LABEL_32;
        }

        if ([v18 isEqualToString:@"pt"])
        {
          id v31 = v22;

          v24 = v31;
        }

        if (v24)
        {
          uint64_t v32 = TSKLocString(@"LanguageWithRegionFormat");
          v29 = (void *)objc_claimAutoreleasedReturnValue(v32);
          v30 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v29, v21, v24, v40);
LABEL_28:
          id v33 = (id)objc_claimAutoreleasedReturnValue(v30);

          v14 = (void *)v43;
          goto LABEL_30;
        }

        id v33 = v21;
        if (v33) {
          goto LABEL_31;
        }
LABEL_32:

        v15 = (char *)v15 + 1;
        v5 = v45;
      }

      while (v47 != v15);
      id v35 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
      id v47 = v35;
    }

    while (v35);
  }

  id v36 = objc_alloc(&OBJC_CLASS___TVSBlockFormatter);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100055B74;
  v49[3] = &unk_100190B00;
  id v50 = v42;
  id v37 = v42;
  id v38 = [v36 initWithFormattingBlock:v49];

  return v38;
}

+ (id)capitalizeFirstPartOfCountry:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"("));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByCharactersInSet:v4]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 capitalizedString]);

    id v8 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", v7);
    if ((unint64_t)[v5 count] >= 2)
    {
      unint64_t v9 = 1LL;
      do
      {
        -[__CFString appendString:](v8, "appendString:", @"(");
        v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v9]);
        -[__CFString appendString:](v8, "appendString:", v10);

        ++v9;
      }

      while (v9 < (unint64_t)[v5 count]);
    }
  }

  else
  {
    id v8 = &stru_100195DD8;
  }

  return v8;
}

+ (id)_attributesWithFont:(id)a3 color:(id)a4 kerning:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v11 = v10;
  if (v7) {
    [v10 setObject:v7 forKey:NSFontAttributeName];
  }
  if (v8) {
    [v11 setObject:v8 forKey:NSForegroundColorAttributeName];
  }
  if (v9) {
    [v11 setObject:v9 forKey:NSKernAttributeName];
  }

  return v11;
}

+ (id)_attributedStringWithString:(id)a3 attributes:(id)a4
{
  v4 = (NSAttributedString *)a3;
  if (a3)
  {
    id v5 = a4;
    id v6 = v4;
    v4 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v6,  v5);
  }

  return v4;
}

+ (id)_attributedStringWithString:(id)a3 font:(id)a4 color:(id)a5 kerning:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _attributesWithFont:a4 color:a5 kerning:a6]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _attributedStringWithString:v10 attributes:v11]);

  return v12;
}

+ (id)_attributedStringForAlertDetailMessage:(id)a3
{
  id v3 = a3;
  if ((_os_feature_enabled_impl("PineBoard", "Newport") & 1) != 0) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  }
  id v5 = (void *)v4;
  v11[0] = v4;
  v10[0] = NSForegroundColorAttributeName;
  v10[1] = NSFontAttributeName;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1));
  v11[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  id v8 = -[NSMutableAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:attributes:",  v3,  v7);
  return v8;
}

+ (id)_defaultAttributesForFont:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  unsigned int v6 = [v4 isEqual:v5];

  if (v6) {
    id v7 = &off_1001AF6C0;
  }
  else {
    id v7 = &off_1001AF6B0;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _attributesWithFont:v4 color:0 kerning:v7]);

  return v8;
}

+ (id)_defaultAttributedStringForString:(id)a3 withFont:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _defaultAttributesForFont:a4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _attributedStringWithString:v6 attributes:v7]);

  return v8;
}

+ (id)screenSaverStyleFormatter
{
  v31[0] = TVScreenSaverStyleRandom;
  v31[1] = TVScreenSaverStyleCascade;
  v31[2] = TVScreenSaverStyleFlipUp;
  v31[3] = TVScreenSaverStyleFloating;
  v31[4] = TVScreenSaverStyleOrigami;
  v31[5] = TVScreenSaverStyleReflections;
  v31[6] = TVScreenSaverStyleShiftingTiles;
  v31[7] = TVScreenSaverStyleShrinkingTiles;
  v31[8] = TVScreenSaverStyleSlidingPanels;
  v31[9] = TVScreenSaverStyleSnapshots;
  v31[10] = TVScreenSaverStyleKenBurns;
  v31[11] = TVScreenSaverStyleClassic;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 12LL));
  uint64_t v2 = TSKLocString(@"SettingsScreenSaverThemeRandom");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v30[0] = v28;
  uint64_t v3 = TSKLocString(@"SettingsScreenSaverThemeCoverCascade");
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v30[1] = v27;
  uint64_t v4 = TSKLocString(@"SettingsScreenSaverThemeFlipup");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v30[2] = v26;
  uint64_t v5 = TSKLocString(@"SettingsScreenSaverThemeFloating");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v30[3] = v6;
  uint64_t v7 = TSKLocString(@"SettingsScreenSaverThemeOrigami");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v30[4] = v8;
  uint64_t v9 = TSKLocString(@"SettingsScreenSaverThemeReflections");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v30[5] = v10;
  uint64_t v11 = TSKLocString(@"SettingsScreenSaverThemeShiftingTiles");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v30[6] = v12;
  uint64_t v13 = TSKLocString(@"SettingsScreenSaverThemeHyperGrid");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v30[7] = v14;
  uint64_t v15 = TSKLocString(@"SettingsScreenSaverThemeSlidingPanels");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v30[8] = v16;
  uint64_t v17 = TSKLocString(@"SettingsScreenSaverThemeSnapshots");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v30[9] = v18;
  uint64_t v19 = TSKLocString(@"SettingsScreenSaverThemeKenBurns");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v30[10] = v20;
  uint64_t v21 = TSKLocString(@"SettingsScreenSaverThemeClassic");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v30[11] = v22;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 12LL));

  v24 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  v29,  v23);
  return v24;
}

+ (id)deviceManagementBundlePath
{
  return objc_msgSend( (id)GSSystemRootDirectory(a1, a2),  "stringByAppendingPathComponent:",  @"System/Library/PreferenceBundles/ManagedConfigurationUI-TV.bundle");
}

+ (int)pidForApplication:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v3));
    id v11 = 0LL;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForPredicate:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForPredicate:error:",  v4,  &v11));
    id v6 = v11;

    if (v5)
    {
      int v7 = [v5 pid];
LABEL_12:

      goto LABEL_13;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v8 isEqual:RBSRequestErrorDomain])
    {
      id v9 = [v6 code];

      if (v9 == (id)3)
      {
LABEL_11:
        int v7 = -1;
        goto LABEL_12;
      }
    }

    else
    {
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F7D8C((uint64_t)v3, (uint64_t)v6);
    }
    goto LABEL_11;
  }

  int v7 = -1;
LABEL_13:

  return v7;
}

@end