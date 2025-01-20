@interface UIFont
+ (double)mt_scaledConstantForTextStyle:(id)a3 defaultConstant:(double)a4;
+ (id)buttonFont;
+ (id)cellDetailFont;
+ (id)cellTitleFont;
+ (id)headerDetailFont;
+ (id)headerTitleFont;
+ (id)mt_fontDescriptorForTextStyle:(id)a3 contentSizeCategoryName:(id)a4;
+ (id)mt_fontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 contentSizeCategoryName:(id)a5;
+ (id)mt_fontForTextStyle:(id)a3 contentSizeCategoryName:(id)a4;
+ (id)mt_preferredFontForTextStyle:(id)a3;
+ (id)mt_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4;
+ (id)sectionFooterFont;
- (double)im_distanceFromCapHeightToAscent;
- (double)im_distanceFromLastBaselineToBottom;
- (double)mt_leftMargin;
- (double)mt_offsetFromCapHeightToAscent;
- (double)mt_offsetFromLastBaselineToBottom;
@end

@implementation UIFont

+ (id)buttonFont
{
  return +[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 15.0);
}

+ (id)cellTitleFont
{
  return +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleBody);
}

+ (id)cellDetailFont
{
  return objc_msgSend(a1, "mt_preferredFontForTextStyle:addingSymbolicTraits:", UIFontTextStyleCaption1, 0);
}

+ (id)headerTitleFont
{
  return +[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 17.0);
}

+ (id)headerDetailFont
{
  return +[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 12.0);
}

+ (id)sectionFooterFont
{
  return +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2);
}

+ (id)mt_preferredFontForTextStyle:(id)a3
{
  return objc_msgSend(a1, "mt_preferredFontForTextStyle:addingSymbolicTraits:", a3, 0);
}

+ (id)mt_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:]( &OBJC_CLASS___UIFontDescriptor,  "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:",  a3,  *(void *)&a4,  1LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v4, 0.0));

  return v5;
}

+ (id)mt_fontForTextStyle:(id)a3 contentSizeCategoryName:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mt_fontDescriptorForTextStyle:contentSizeCategoryName:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v4, 0.0));

  return v5;
}

+ (id)mt_fontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 contentSizeCategoryName:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mt_fontDescriptorForTextStyle:contentSizeCategoryName:", a3, a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fontDescriptorWithSymbolicTraits:v5]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v7, 0.0));
  return v8;
}

+ (id)mt_fontDescriptorForTextStyle:(id)a3 contentSizeCategoryName:(id)a4
{
  return (id)CTFontDescriptorCreateWithTextStyle(a3, a4, 0LL);
}

+ (double)mt_scaledConstantForTextStyle:(id)a3 defaultConstant:(double)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", a3));
  [v5 _scaledValueForValue:a4];
  double v7 = v6;

  return v7;
}

- (double)mt_offsetFromCapHeightToAscent
{
  double v4 = v3;
  -[UIFont capHeight](self, "capHeight");
  return v4 - v5;
}

- (double)mt_offsetFromLastBaselineToBottom
{
  return -v2;
}

- (double)mt_leftMargin
{
  double v3 = 0.0;
  CTFontGetLanguageAwareOutsets(self, &v3, 0LL, 0LL, 0LL);
  return v3;
}

- (double)im_distanceFromCapHeightToAscent
{
  double v4 = v3;
  -[UIFont capHeight](self, "capHeight");
  return v4 - v5;
}

- (double)im_distanceFromLastBaselineToBottom
{
  return -v2;
}

@end