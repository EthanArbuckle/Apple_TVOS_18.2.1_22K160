@interface AXTVUtils
+ (NSFormatter)audioBalanceFormatter;
+ (id)BOOLeanOnOffFormatter;
+ (id)_attributedStringWithString:(id)a3 attributes:(id)a4;
+ (id)_attributedStringWithString:(id)a3 font:(id)a4 color:(id)a5 kerning:(id)a6;
+ (id)_attributesWithFont:(id)a3 color:(id)a4 kerning:(id)a5;
+ (id)_defaultAttributedStringForString:(id)a3 withFont:(id)a4;
+ (id)_defaultAttributesForFont:(id)a3;
+ (id)captionColorFormatter;
+ (id)captionColors;
+ (id)collectionCountValueFormatter;
+ (id)colorNameForHue:(double)a3 saturation:(double)a4;
+ (id)colorNameForHueFormatter;
+ (id)everythingToNilValueFormatter;
+ (id)hoverTextFontNameFormatter;
+ (id)hoverTextFontSizeFormatter;
+ (id)hoverTextTaggedColorFormatter;
+ (id)percentageFormtter;
+ (id)percentageZeroToOneHundredFormtter;
+ (id)sharedInstance;
+ (id)shortStyleDurationFormatter;
+ (id)simpleIntegerFormatter;
+ (id)switchControlScanAfterTapLocationValueFormatter;
+ (id)switchControlScanningStyleValueFormatter;
+ (id)switchControlSwitchDefaultVariantValueFormatter;
+ (id)switchControlSwitchLongPressVariantValueFormatter;
+ (id)switchControlSwitchValueFormatter;
+ (id)switchControlTapBehaviorValueFormatter;
+ (int64_t)_extractColorType:(id)a3 r:(double *)a4 g:(double *)a5 b:(double *)a6 w:(double *)a7 a:(double *)a8;
- (AXDispatchTimer)speechUpdateTimer;
- (AXUIClient)speechUpdateClient;
- (void)_syncPronunciationsWithICloud;
- (void)addPronunciationToSettings:(id)a3 syncWithIcloud:(BOOL)a4;
- (void)removePronunciationFromSettings:(id)a3 syncWithIcloud:(BOOL)a4;
- (void)savePronunciationToSettingsIfNeeded:(id)a3 syncWithIcloud:(BOOL)a4;
- (void)setSpeechUpdateClient:(id)a3;
- (void)setSpeechUpdateTimer:(id)a3;
@end

@implementation AXTVUtils

+ (id)sharedInstance
{
  if (qword_805D8 != -1) {
    dispatch_once(&qword_805D8, &stru_663C0);
  }
  return (id)qword_805D0;
}

- (AXUIClient)speechUpdateClient
{
  speechUpdateClient = self->_speechUpdateClient;
  if (!speechUpdateClient)
  {
    v4 = objc_alloc(&OBJC_CLASS___AXUIClient);
    v5 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AXSpeechAssetUpdaterClient-%@",  v6));
    v8 = -[AXUIClient initWithIdentifier:serviceBundleName:]( v4,  "initWithIdentifier:serviceBundleName:",  v7,  @"AXSpeechAssetUpdater");
    v9 = self->_speechUpdateClient;
    self->_speechUpdateClient = v8;

    speechUpdateClient = self->_speechUpdateClient;
  }

  return speechUpdateClient;
}

- (void)_syncPronunciationsWithICloud
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[AXTVUtils speechUpdateClient](self, "speechUpdateClient"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
  [v3 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:1 targetAccessQueue:v2 completion:0];
}

- (void)addPronunciationToSettings:(id)a3 syncWithIcloud:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v11 customPronunciationSubstitutions]);
    v8 = v7;
    if (v7) {
      id v9 = [v7 mutableCopy];
    }
    else {
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    }
    v10 = v9;
    [v9 addObject:v6];

    [v11 setCustomPronunciationSubstitutions:v10];
    if (v4) {
      -[AXTVUtils _syncPronunciationsWithICloud](self, "_syncPronunciationsWithICloud");
    }
  }

- (void)savePronunciationToSettingsIfNeeded:(id)a3 syncWithIcloud:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v14 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 originalString]);
    if (![v7 length])
    {
LABEL_10:

      id v6 = v14;
      goto LABEL_11;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue([v14 replacementString]);
    id v9 = [v8 length];

    id v6 = v14;
    if (v9)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v7 customPronunciationSubstitutions]);
      id v11 = [v10 indexOfObject:v14];
      if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        -[AXTVUtils addPronunciationToSettings:syncWithIcloud:]( self,  "addPronunciationToSettings:syncWithIcloud:",  v14,  v4);
      }

      else
      {
        id v12 = v11;
        id v13 = [v10 mutableCopy];
        [v13 replaceObjectAtIndex:v12 withObject:v14];
        [v7 setCustomPronunciationSubstitutions:v13];
        if (v4) {
          -[AXTVUtils _syncPronunciationsWithICloud](self, "_syncPronunciationsWithICloud");
        }
      }

      goto LABEL_10;
    }
  }

- (void)removePronunciationFromSettings:(id)a3 syncWithIcloud:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v9 customPronunciationSubstitutions]);
    id v8 = [v7 mutableCopy];

    [v8 removeObject:v6];
    [v9 setCustomPronunciationSubstitutions:v8];
    if (v4) {
      -[AXTVUtils _syncPronunciationsWithICloud](self, "_syncPronunciationsWithICloud");
    }
  }

+ (NSFormatter)audioBalanceFormatter
{
  if (qword_805E8 != -1) {
    dispatch_once(&qword_805E8, &stru_663E0);
  }
  return (NSFormatter *)(id)qword_805E0;
}

+ (id)shortStyleDurationFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66420];
}

+ (id)simpleIntegerFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66440];
}

+ (id)BOOLeanOnOffFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66460];
}

+ (id)collectionCountValueFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66480];
}

+ (id)switchControlScanningStyleValueFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_664A0];
}

+ (id)switchControlTapBehaviorValueFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_664C0];
}

+ (id)switchControlScanAfterTapLocationValueFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_664E0];
}

+ (id)everythingToNilValueFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66500];
}

+ (id)percentageFormtter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66520];
}

+ (id)percentageZeroToOneHundredFormtter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66540];
}

+ (id)colorNameForHueFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66560];
}

+ (id)switchControlSwitchValueFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_665A0];
}

+ (id)switchControlSwitchDefaultVariantValueFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_665C0];
}

+ (id)switchControlSwitchLongPressVariantValueFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_665E0];
}

+ (id)colorNameForHue:(double)a3 saturation:(double)a4
{
  v10 = @"AXColorRed";
  if (a3 >= 25.0)
  {
    if (a3 >= 50.0)
    {
      if (a3 >= 80.0)
      {
        if (a3 >= 130.0)
        {
          if (a3 >= 185.0)
          {
            if (a3 >= 236.0)
            {
              if (a3 >= 265.0)
              {
                if (a3 >= 300.0)
                {
                  if (a3 < 330.0) {
                    v10 = @"AXColorViolet";
                  }
                }

                else
                {
                  v10 = @"AXColorIndigo";
                }
              }

              else
              {
                v10 = @"AXColorPurple";
              }
            }

            else
            {
              v10 = @"AXColorBlue";
            }
          }

          else
          {
            v10 = @"AXColorTurquoise";
          }
        }

        else
        {
          v10 = @"AXColorGreen";
        }
      }

      else
      {
        v10 = @"AXColorYellow";
      }
    }

    else
    {
      v10 = @"AXColorOrange";
    }
  }

  id v11 = AXTVLocString(v10, (uint64_t)a2, v4, v5, v6, v7, v8, v9, vars0);
  return (id)objc_claimAutoreleasedReturnValue(v11);
}

+ (int64_t)_extractColorType:(id)a3 r:(double *)a4 g:(double *)a5 b:(double *)a6 w:(double *)a7 a:(double *)a8
{
  id v13 = a3;
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v16 = 0LL;
  if (([v13 getRed:&v20 green:&v19 blue:&v18 alpha:&v16] & 1) == 0)
  {
    int64_t v14 = [v13 getWhite:&v17 alpha:&v16];
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  int64_t v14 = 2LL;
  if (a4) {
LABEL_5:
  }
    *(void *)a4 = v20;
LABEL_6:
  if (a5) {
    *(void *)a5 = v19;
  }
  if (a6) {
    *(void *)a6 = v18;
  }
  if (a7) {
    *(void *)a7 = v17;
  }
  if (a8) {
    *(void *)a8 = v16;
  }

  return v14;
}

+ (id)captionColorFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66620];
}

+ (id)captionColors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  1.0,  1.0,  1.0,  1.0));
  v12[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cyanColor](&OBJC_CLASS___UIColor, "cyanColor"));
  v12[1] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](&OBJC_CLASS___UIColor, "blueColor"));
  v12[2] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](&OBJC_CLASS___UIColor, "greenColor"));
  v12[3] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](&OBJC_CLASS___UIColor, "yellowColor"));
  v12[4] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor magentaColor](&OBJC_CLASS___UIColor, "magentaColor"));
  v12[5] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](&OBJC_CLASS___UIColor, "redColor"));
  v12[6] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  1.0));
  v12[7] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 8LL));

  return v10;
}

+ (id)hoverTextFontSizeFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66668];
}

+ (id)hoverTextFontNameFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66688];
}

+ (id)hoverTextTaggedColorFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_666C8];
}

+ (id)_attributesWithFont:(id)a3 color:(id)a4 kerning:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v11 = v10;
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
  uint64_t v4 = (NSAttributedString *)a3;
  if (a3)
  {
    id v5 = a4;
    uint64_t v6 = v4;
    uint64_t v4 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v6,  v5);
  }

  return v4;
}

+ (id)_attributedStringWithString:(id)a3 font:(id)a4 color:(id)a5 kerning:(id)a6
{
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _attributesWithFont:a4 color:a5 kerning:a6]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _attributedStringWithString:v10 attributes:v11]);

  return v12;
}

+ (id)_defaultAttributesForFont:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager bodyFont](&OBJC_CLASS___TVThemeManager, "bodyFont"));
  unsigned int v6 = [v4 isEqual:v5];

  if (v6) {
    id v7 = &off_702E8;
  }
  else {
    id v7 = &off_702D8;
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

- (void)setSpeechUpdateClient:(id)a3
{
}

- (AXDispatchTimer)speechUpdateTimer
{
  return self->_speechUpdateTimer;
}

- (void)setSpeechUpdateTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end