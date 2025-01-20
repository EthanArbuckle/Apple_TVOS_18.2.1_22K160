@interface AXTVCaptionFontViewController
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation AXTVCaptionFontViewController

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___AXTVCaptionFontViewController;
  id v7 = -[AXTVCaptionFontViewController tableView:cellForRowAtIndexPath:]( &v21,  "tableView:cellForRowAtIndexPath:",  a3,  v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (![v6 section])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionFontViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 text]);

    if ([v10 isEqual:MACaptionAppearanceMonoSystemFontIdentifier])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 font]);
      [v14 pointSize];
      uint64_t v15 = objc_claimAutoreleasedReturnValue(+[UIFont monospacedSystemFontOfSize:weight:](&OBJC_CLASS___UIFont, "monospacedSystemFontOfSize:weight:"));
    }

    else if ([v10 isEqual:MACaptionAppearanceSystemFontIdentifier])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 font]);
      [v14 pointSize];
      uint64_t v15 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:"));
    }

    else
    {
      unsigned int v16 = [v10 isEqual:MACaptionAppearanceMediumSystemFontIdentifier];
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 font]);
      [v14 pointSize];
      if (v16) {
        uint64_t v15 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](&OBJC_CLASS___UIFont, "systemFontOfSize:weight:"));
      }
      else {
        uint64_t v15 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](&OBJC_CLASS___UIFont, "fontWithName:size:", v10));
      }
    }

    v17 = (void *)v15;

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVUtils _defaultAttributedStringForString:withFont:]( &OBJC_CLASS___AXTVUtils,  "_defaultAttributedStringForString:withFont:",  v12,  v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
    [v19 setAttributedText:v18];
  }

  return v8;
}

@end