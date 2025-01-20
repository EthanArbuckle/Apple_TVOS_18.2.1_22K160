@interface NSAttributedString
+ (id)tvh_highDefinitionAttributedStringWithFont:(id)a3;
+ (id)tvh_highDefinitionAttributedStringWithFont:(id)a3 focus:(BOOL)a4;
+ (id)tvh_highDefinitionAttributedStringWithTextStyle:(id)a3;
+ (id)tvh_highDefinitionAttributedStringWithTextStyle:(id)a3 focus:(BOOL)a4;
@end

@implementation NSAttributedString

+ (id)tvh_highDefinitionAttributedStringWithTextStyle:(id)a3
{
  return objc_msgSend(a1, "tvh_highDefinitionAttributedStringWithTextStyle:focus:", a3, 0);
}

+ (id)tvh_highDefinitionAttributedStringWithTextStyle:(id)a3 focus:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:weight:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:weight:",  a3,  UIFontWeightHeavy));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tvh_highDefinitionAttributedStringWithFont:focus:", v6, v4));

  return v7;
}

+ (id)tvh_highDefinitionAttributedStringWithFont:(id)a3
{
  return objc_msgSend(a1, "tvh_highDefinitionAttributedStringWithFont:focus:", a3, 0);
}

+ (id)tvh_highDefinitionAttributedStringWithFont:(id)a3 focus:(BOOL)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  if (!a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v6,  v7));

    v6 = (void *)v8;
  }

  id v9 = v6;
  id v10 = objc_alloc_init((Class)&OBJC_CLASS___NSTextEncapsulation);
  [v10 setColor:v9];
  [v10 setStyle:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"HD_BADGE_TEXT" value:0 table:0]);

  v13 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  v17[0] = NSFontAttributeName;
  v17[1] = NSForegroundColorAttributeName;
  v18[0] = v5;
  v18[1] = v9;
  v17[2] = NSTextEncapsulationAttributeName;
  v18[2] = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));

  v15 = -[NSAttributedString initWithString:attributes:](v13, "initWithString:attributes:", v12, v14);
  return v15;
}

@end