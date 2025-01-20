@interface UILabel
- (void)tvh_setDurationTextForSeconds:(id)a3;
- (void)tvh_setDurationTextForSecondsString:(id)a3;
- (void)tvh_setPositionalDurationTextForSecondsString:(id)a3;
- (void)tvh_setText:(id)a3 isExplicit:(BOOL)a4;
- (void)tvh_updateMarqueeWithFocus:(BOOL)a3;
@end

@implementation UILabel

- (void)tvh_setDurationTextForSecondsString:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[UILabel tvh_setDurationTextForSeconds:](self, "tvh_setDurationTextForSeconds:", v4);
}

- (void)tvh_setDurationTextForSeconds:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVHDurationValueTransformer"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 transformedValue:v4]);

  -[UILabel setText:](self, "setText:", v6);
}

- (void)tvh_setPositionalDurationTextForSecondsString:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVHPositionalDurationValueTransformer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transformedValue:v6]);

  -[UILabel setText:](self, "setText:", v5);
}

- (void)tvh_updateMarqueeWithFocus:(BOOL)a3
{
  if (!a3)
  {
    -[UILabel setMarqueeEnabled:](self, "setMarqueeEnabled:");
    -[UILabel setMarqueeRunning:](self, "setMarqueeRunning:", 0LL);
    goto LABEL_5;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self, "text"));
  id v5 = [v4 length];
  BOOL v6 = v5 != 0LL;

  -[UILabel setMarqueeEnabled:](self, "setMarqueeEnabled:", v6);
  -[UILabel setMarqueeRunning:](self, "setMarqueeRunning:", v6);
  if (!v5) {
LABEL_5:
  }
    -[UILabel setLineBreakMode:](self, "setLineBreakMode:", 4LL);
}

- (void)tvh_setText:(id)a3 isExplicit:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v9 = v6;
  if (v4) {
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString tvh_stringWithAppendedExplicitIndicator:]( &OBJC_CLASS___NSString,  "tvh_stringWithAppendedExplicitIndicator:",  v6));
  }
  else {
    id v7 = v6;
  }
  v8 = v7;
  -[UILabel setText:](self, "setText:", v7);
}

@end