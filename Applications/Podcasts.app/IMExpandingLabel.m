@interface IMExpandingLabel
- (id)_font;
- (unint64_t)maximumNumberOfLinesThatFitHeight:(double)a3;
- (void)setFont:(id)a3;
- (void)setMoreButtonFont:(id)a3;
@end

@implementation IMExpandingLabel

- (void)setFont:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel textAttributes](self, "textAttributes"));
  id v5 = [v4 mutableCopy];

  if (!v5) {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  [v5 setObject:v7 forKeyedSubscript:NSFontAttributeName];
  -[IMExpandingLabel setTextAttributes:](self, "setTextAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel text](self, "text"));
  -[IMExpandingLabel setText:](self, "setText:", 0LL);
  -[IMExpandingLabel setText:](self, "setText:", v6);
}

- (void)setMoreButtonFont:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel moreButton](self, "moreButton"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 titleLabel]);
  [v5 setFont:v4];

  [v7 sizeToFit];
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MTTouchInsetsButton);
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
  {
    objc_msgSend(v7, "setTouchInsets:", -8.0, -8.0, -8.0, -8.0);
    [v7 frame];
    CGRect v9 = CGRectInset(v8, 0.0, 6.0);
    objc_msgSend(v7, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width + 10.0, v9.size.height);
  }
}

- (unint64_t)maximumNumberOfLinesThatFitHeight:(double)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel _font](self, "_font"));
  [v4 lineHeight];
  unint64_t v6 = (unint64_t)(a3 / v5);

  return v6;
}

- (id)_font
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMExpandingLabel textAttributes](self, "textAttributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:NSFontAttributeName]);

  return v3;
}

@end