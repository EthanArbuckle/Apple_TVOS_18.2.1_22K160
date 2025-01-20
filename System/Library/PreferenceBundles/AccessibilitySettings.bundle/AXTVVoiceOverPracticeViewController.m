@interface AXTVVoiceOverPracticeViewController
- (AXTVVoiceOverPracticeViewController)initWithStyle:(int64_t)a3;
- (BOOL)isVoiceOverPracticeEnabled;
- (NSString)accessibilityVoiceOverPracticeDescription;
- (NSString)accessibilityVoiceOverPracticeTitle;
- (id)_attributedStringForGenericMessage:(id)a3;
- (id)_attributedStringForVOTPracticeTitle:(id)a3 description:(id)a4;
- (id)loadSettingGroups;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)voiceOverPracticeTextDidChangeNotificationObserverToken;
- (void)_handleStartVoiceOverButtonSelected:(id)a3;
- (void)dealloc;
- (void)setAccessibilityVoiceOverPracticeDescription:(id)a3;
- (void)setAccessibilityVoiceOverPracticeTitle:(id)a3;
- (void)setVoiceOverPracticeEnabled:(BOOL)a3;
- (void)setVoiceOverPracticeTextDidChangeNotificationObserverToken:(id)a3;
@end

@implementation AXTVVoiceOverPracticeViewController

- (AXTVVoiceOverPracticeViewController)initWithStyle:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AXTVVoiceOverPracticeViewController;
  v3 = -[AXTVVoiceOverPracticeViewController initWithStyle:](&v15, "initWithStyle:", a3);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    uint64_t v6 = TSKAccessibilityVoiceOverPracticeTextDidChangeNotification;
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    v11 = sub_16828;
    v12 = &unk_65A68;
    objc_copyWeak(&v13, &location);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 addObserverForName:v6 object:0 queue:v5 usingBlock:&v9]);

    -[AXTVVoiceOverPracticeViewController setVoiceOverPracticeTextDidChangeNotificationObserverToken:]( v3,  "setVoiceOverPracticeTextDidChangeNotificationObserverToken:",  v7,  v9,  v10,  v11,  v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVVoiceOverPracticeViewController voiceOverPracticeTextDidChangeNotificationObserverToken]( self,  "voiceOverPracticeTextDidChangeNotificationObserverToken"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVVoiceOverPracticeViewController voiceOverPracticeTextDidChangeNotificationObserverToken]( self,  "voiceOverPracticeTextDidChangeNotificationObserverToken"));
    [v4 removeObserver:v5];

    -[AXTVVoiceOverPracticeViewController setVoiceOverPracticeTextDidChangeNotificationObserverToken:]( self,  "setVoiceOverPracticeTextDidChangeNotificationObserverToken:",  0LL);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXTVVoiceOverPracticeViewController;
  -[AXTVVoiceOverPracticeViewController dealloc](&v6, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = [[TSKSettingGroup alloc] initWithTitle:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_16BB4;
  v22[3] = &unk_65BA8;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  [v4 setUpdateBlock:v22];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v13 = AXTVLocString(@"AXVoiceOverStartPracticeTitle", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v14,  0LL,  0LL,  0LL,  self,  "_handleStartVoiceOverButtonSelected:"));

  [v15 setEnabledInStoreDemoMode:1];
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_16CCC;
  v20 = &unk_65798;
  objc_copyWeak(&v21, &location);
  [v15 setUpdateBlock:&v17];
  objc_msgSend(v5, "addObject:", v15, v17, v18, v19, v20);
  [v4 setSettingItems:v5];
  [v3 addObject:v4];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AXTVVoiceOverPracticeViewController;
  id v5 = -[AXTVVoiceOverPracticeViewController tableView:cellForRowAtIndexPath:]( &v9,  "tableView:cellForRowAtIndexPath:",  a3,  a4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (-[AXTVVoiceOverPracticeViewController isVoiceOverPracticeEnabled](self, "isVoiceOverPracticeEnabled"))
  {
    unint64_t v7 = (unint64_t)[v6 accessibilityTraits];
    [v6 setAccessibilityTraits:UIAccessibilityTraitGesturePracticeRegion | v7];
  }

  return v6;
}

- (void)_handleStartVoiceOverButtonSelected:(id)a3
{
  if (!-[AXTVVoiceOverPracticeViewController isVoiceOverPracticeEnabled](self, "isVoiceOverPracticeEnabled", a3))
  {
    -[AXTVVoiceOverPracticeViewController setVoiceOverPracticeEnabled:](self, "setVoiceOverPracticeEnabled:", 1LL);
    -[AXTVVoiceOverPracticeViewController reloadSettings](self, "reloadSettings");
  }

- (id)_attributedStringForGenericMessage:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
  -[NSMutableParagraphStyle setAlignment:](v4, "setAlignment:", 4LL);
  v9[0] = NSFontAttributeName;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager bodyFont](&OBJC_CLASS___TVThemeManager, "bodyFont"));
  v9[1] = NSParagraphStyleAttributeName;
  v10[0] = v5;
  v10[1] = v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));

  unint64_t v7 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v3,  v6);
  return v7;
}

- (id)_attributedStringForVOTPracticeTitle:(id)a3 description:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
  id v8 = [v5 length];
  id v9 = [v6 length];
  id v10 = v9;
  if (v8)
  {
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
    -[NSMutableParagraphStyle setAlignment:](v11, "setAlignment:", 1LL);
    NSAttributedStringKey v12 = NSFontAttributeName;
    v25[0] = NSFontAttributeName;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager subtitle1Font](&OBJC_CLASS___TVThemeManager, "subtitle1Font"));
    NSAttributedStringKey v14 = NSParagraphStyleAttributeName;
    v25[1] = NSParagraphStyleAttributeName;
    v26[0] = v13;
    v26[1] = v11;
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));

    v16 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v5,  v15);
    -[NSMutableAttributedString appendAttributedString:](v7, "appendAttributedString:", v16);

    if (v10)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableAttributedString mutableString](v7, "mutableString"));
      [v17 appendFormat:@"\n"];

LABEL_6:
      uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
      -[NSMutableParagraphStyle setAlignment:](v18, "setAlignment:", 1LL);
      v23[0] = v12;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager bodyFont](&OBJC_CLASS___TVThemeManager, "bodyFont"));
      v23[1] = v14;
      v24[0] = v19;
      v24[1] = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));

      id v21 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v6,  v20);
      -[NSMutableAttributedString appendAttributedString:](v7, "appendAttributedString:", v21);
    }
  }

  else if (v9)
  {
    NSAttributedStringKey v12 = NSFontAttributeName;
    NSAttributedStringKey v14 = NSParagraphStyleAttributeName;
    goto LABEL_6;
  }

  return v7;
}

- (BOOL)isVoiceOverPracticeEnabled
{
  return self->_voiceOverPracticeEnabled;
}

- (void)setVoiceOverPracticeEnabled:(BOOL)a3
{
  self->_voiceOverPracticeEnabled = a3;
}

- (id)voiceOverPracticeTextDidChangeNotificationObserverToken
{
  return self->_voiceOverPracticeTextDidChangeNotificationObserverToken;
}

- (void)setVoiceOverPracticeTextDidChangeNotificationObserverToken:(id)a3
{
}

- (NSString)accessibilityVoiceOverPracticeTitle
{
  return self->_accessibilityVoiceOverPracticeTitle;
}

- (void)setAccessibilityVoiceOverPracticeTitle:(id)a3
{
}

- (NSString)accessibilityVoiceOverPracticeDescription
{
  return self->_accessibilityVoiceOverPracticeDescription;
}

- (void)setAccessibilityVoiceOverPracticeDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end