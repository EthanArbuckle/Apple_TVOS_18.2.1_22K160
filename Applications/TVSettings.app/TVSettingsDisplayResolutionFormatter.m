@interface TVSettingsDisplayResolutionFormatter
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)stringForObjectValue:(id)a3;
@end

@implementation TVSettingsDisplayResolutionFormatter

- (id)stringForObjectValue:(id)a3
{
  return [a3 localizedDisplayString];
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDisplayResolutionFormatter stringForObjectValue:](self, "stringForObjectValue:", v6));
  v9 = -[NSMutableAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:attributes:",  v8,  v7);

  v20[0] = NSFontAttributeName;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
  v21[0] = v10;
  v20[1] = NSForegroundColorAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
  v21[1] = v11;
  v21[2] = NSTextEffectLetterpressStyle;
  v20[2] = NSTextEffectAttributeName;
  v20[3] = NSBaselineOffsetAttributeName;
  v20[4] = NSObliquenessAttributeName;
  v21[3] = &off_1001AF710;
  v21[4] = &off_1001AF720;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  5LL));

  if ([v6 isVirtual])
  {
    v13 = @"   VIRTUAL";
LABEL_5:
    v17 = -[NSMutableAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:attributes:",  v13,  v12);
    -[NSMutableAttributedString appendAttributedString:](v9, "appendAttributedString:", v17);

    goto LABEL_6;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 fallbackDisplayMode]);
  unsigned int v16 = [v6 isEqual:v15];

  if (v16)
  {
    v13 = @"   AUTO";
    goto LABEL_5;
  }

@end