@interface MTLabelStackView
+ (double)distanceBetweenLabelFrames;
+ (double)distanceBetweenLabelFramesWithTitleFont:(id)a3 subtitleFont:(id)a4 multilineTitle:(BOOL)a5;
+ (double)maxHeight;
+ (double)maxHeightForTitleNumberOfLines:(unint64_t)a3 subtitleNumberOfLines:(unint64_t)a4;
+ (id)defaultSubtitleFont;
+ (id)defaultSubtitleTextStyle;
+ (id)defaultTitleFont;
+ (id)defaultTitleTextStyle;
+ (unint64_t)defaultSubtitleNumberOfLines;
+ (unint64_t)defaultTitleNumberOfLines;
- (BOOL)isEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTLabelStackView)initWithFrame:(CGRect)a3;
- (MTLabelStackViewDelegate)delegate;
- (NSString)subtitle;
- (NSString)subtitleTextStyle;
- (NSString)title;
- (NSString)titleTextStyle;
- (UIColor)subtitleTextColor;
- (UIColor)titleTextColor;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)distanceBetweenLabelFrames;
- (double)heightForWidth:(double)a3;
- (double)subtitleHeightForWidth:(double)a3;
- (double)subtitleMaxWidth;
- (double)titleHeightForWidth:(double)a3;
- (id)sizeCacheKeyForLabel:(id)a3 width:(double)a4;
- (unint64_t)subtitleNumberOfLines;
- (unint64_t)titleNumberOfLines;
- (void)_heightWillChange;
- (void)_notifyDelegateIfHeightChanged;
- (void)_updateSubtitleFont;
- (void)_updateTitleFont;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleMaxWidth:(double)a3;
- (void)setSubtitleNumberOfLines:(unint64_t)a3;
- (void)setSubtitleTextColor:(id)a3;
- (void)setSubtitleTextStyle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleNumberOfLines:(unint64_t)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setTitleTextStyle:(id)a3;
- (void)updateFonts;
@end

@implementation MTLabelStackView

+ (double)maxHeight
{
  id v3 = [(id)objc_opt_class(a1) defaultTitleNumberOfLines];
  id v4 = [(id)objc_opt_class(a1) defaultSubtitleNumberOfLines];
  _[a1 maxHeightForTitleNumberOfLines:v3 subtitleNumberOfLines:v4];
  return result;
}

+ (double)maxHeightForTitleNumberOfLines:(unint64_t)a3 subtitleNumberOfLines:(unint64_t)a4
{
  id v7 = [(id)objc_opt_class(a1) defaultTitleFont];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [(id)objc_opt_class(a1) defaultSubtitleFont];
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v8 lineHeight];
  double v12 = v11 * (double)a3 + 0.0;
  [a1 distanceBetweenLabelFramesWithTitleFont:v8 subtitleFont:v10 multilineTitle:a3 != 1];
  double v14 = v12 + v13;
  [v10 lineHeight];
  double v16 = v14 + v15 * (double)a4;

  return v16;
}

+ (double)distanceBetweenLabelFrames
{
  id v3 = [(id)objc_opt_class(a1) defaultTitleFont];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [(id)objc_opt_class(a1) defaultSubtitleFont];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend( a1,  "distanceBetweenLabelFramesWithTitleFont:subtitleFont:multilineTitle:",  v4,  v6,  objc_msgSend((id)objc_opt_class(a1), "defaultTitleNumberOfLines") != (id)1);
  double v8 = v7;

  return v8;
}

+ (double)distanceBetweenLabelFramesWithTitleFont:(id)a3 subtitleFont:(id)a4 multilineTitle:(BOOL)a5
{
  if (a5) {
    double v6 = 19.0;
  }
  else {
    double v6 = 16.0;
  }
  id v7 = a4;
  id v8 = a3;
  [v7 _scaledValueForValue:v6];
  double v10 = v9;
  objc_msgSend(v8, "mt_offsetFromLastBaselineToBottom");
  double v12 = v11;

  double v13 = v10 - v12;
  objc_msgSend(v7, "mt_offsetFromFirstBaselineToTop");
  double v15 = v14;

  return v13 - v15;
}

+ (id)defaultTitleTextStyle
{
  return UIFontTextStyleBody;
}

+ (id)defaultSubtitleTextStyle
{
  return UIFontTextStyleSubheadline;
}

+ (id)defaultTitleFont
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 defaultTitleTextStyle]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", v2));

  return v3;
}

+ (id)defaultSubtitleFont
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 defaultSubtitleTextStyle]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", v2));

  return v3;
}

+ (unint64_t)defaultTitleNumberOfLines
{
  return 1LL;
}

+ (unint64_t)defaultSubtitleNumberOfLines
{
  return 1LL;
}

- (MTLabelStackView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTLabelStackView;
  id v3 = -[MTLabelStackView initWithFrame:]( &v9,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___NSCache);
    textSizeCache = v3->_textSizeCache;
    v3->_textSizeCache = v4;

    v3->_subtitleMaxWidth = 1.79769313e308;
    v3->_enabled = 1;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](v3, "titleLabel"));
    -[MTLabelStackView addSubview:](v3, "addSubview:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](v3, "subtitleLabel"));
    -[MTLabelStackView addSubview:](v3, "addSubview:", v7);

    -[MTLabelStackView _updateTitleFont](v3, "_updateTitleFont");
    -[MTLabelStackView _updateSubtitleFont](v3, "_updateSubtitleFont");
  }

  return v3;
}

- (void)updateFonts
{
}

- (void)setSubtitleMaxWidth:(double)a3
{
  if (self->_subtitleMaxWidth != a3)
  {
    self->_subtitleMaxWidth = a3;
    -[MTLabelStackView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enabled = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
  [v5 setEnabled:v3];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
  [v6 setEnabled:v3];
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MTLabelStackView;
  -[MTLabelStackView layoutSubviews](&v17, "layoutSubviews");
  -[MTLabelStackView bounds](self, "bounds");
  double v4 = v3;
  -[MTLabelStackView titleHeightForWidth:](self, "titleHeightForWidth:", v3);
  double v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  -[MTLabelStackView distanceBetweenLabelFrames](self, "distanceBetweenLabelFrames");
  double v9 = v8;
  -[MTLabelStackView subtitleMaxWidth](self, "subtitleMaxWidth");
  if (v4 >= v10) {
    double v11 = v10;
  }
  else {
    double v11 = v4;
  }
  -[MTLabelStackView subtitleHeightForWidth:](self, "subtitleHeightForWidth:", v11);
  double v13 = v12;
  double v14 = 0.0;
  if (-[MTLabelStackView mt_isRTL](self, "mt_isRTL"))
  {
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = v4;
    v18.size.height = v6;
    double v14 = CGRectGetMaxX(v18) - v11;
  }

  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v4;
  v19.size.height = v6;
  double v15 = v9 + CGRectGetMaxY(v19);
  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v16, "setFrame:", v14, v15, v11, v13);

  -[MTLabelStackView _notifyDelegateIfHeightChanged](self, "_notifyDelegateIfHeightChanged");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[MTLabelStackView heightForWidth:](self, "heightForWidth:", a3.width, a3.height);
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (double)heightForWidth:(double)a3
{
  double v6 = v5;
  -[MTLabelStackView distanceBetweenLabelFrames](self, "distanceBetweenLabelFrames");
  double v8 = v7;
  -[MTLabelStackView subtitleMaxWidth](self, "subtitleMaxWidth");
  if (v9 > a3) {
    double v9 = a3;
  }
  -[MTLabelStackView subtitleHeightForWidth:](self, "subtitleHeightForWidth:", v9);
  return v6 + v8 + v10;
}

- (double)distanceBetweenLabelFrames
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView title](self, "title"));
  if ([v3 length])
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitle](self, "subtitle"));
    id v5 = [v4 length];

    if (!v5) {
      return 0.0;
    }
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
    double v3 = (void *)objc_claimAutoreleasedReturnValue([v6 font]);

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 font]);

    objc_msgSend( (id)objc_opt_class(self),  "distanceBetweenLabelFramesWithTitleFont:subtitleFont:multilineTitle:",  v3,  v8,  (id)-[MTLabelStackView titleNumberOfLines](self, "titleNumberOfLines") != (id)1);
    double v10 = v9;
  }

  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)titleHeightForWidth:(double)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView sizeCacheKeyForLabel:width:](self, "sizeCacheKeyForLabel:width:", @"title"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_textSizeCache, "objectForKey:", v5));
  if (!v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
    objc_msgSend(v7, "sizeThatFits:", a3, 1.79769313e308);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));

    -[NSCache setObject:forKey:](self->_textSizeCache, "setObject:forKey:", v6, v5);
  }

  [v6 floatValue];
  double v10 = v9;

  return v10;
}

- (double)subtitleHeightForWidth:(double)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView sizeCacheKeyForLabel:width:](self, "sizeCacheKeyForLabel:width:", @"subtitle"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_textSizeCache, "objectForKey:", v5));
  if (!v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v7, "sizeThatFits:", a3, 1.79769313e308);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));

    -[NSCache setObject:forKey:](self->_textSizeCache, "setObject:forKey:", v6, v5);
  }

  [v6 floatValue];
  double v10 = v9;

  return v10;
}

- (id)sizeCacheKeyForLabel:(id)a3 width:(double)a4
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%f", a3, *(void *)&a4);
}

- (void)_updateTitleFont
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleTextStyle](self, "titleTextStyle"));
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", v3));

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
  [v4 setFont:v5];

  -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
}

- (void)_updateSubtitleFont
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleTextStyle](self, "subtitleTextStyle"));
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", v3));

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
  [v4 setFont:v5];

  -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
}

- (void)_heightWillChange
{
  self->_heightWillChange = 1;
  -[MTLabelStackView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_notifyDelegateIfHeightChanged
{
  if (self->_heightWillChange)
  {
    self->_heightWillChange = 0;
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTLabelStackView delegate](self, "delegate"));
    [v3 labelStackViewDidChangeHeight:self];
  }

- (void)setTitle:(id)a3
{
  id v10 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTLabelStackView title](self, "title"));
  id v5 = v10;
  if (v4 == v10) {
    goto LABEL_4;
  }
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView title](self, "title"));
  unsigned __int8 v7 = [v6 isEqualToString:v10];

  if ((v7 & 1) == 0)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
    [v8 setText:v10];

    -[MTLabelStackView bounds](self, "bounds");
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTLabelStackView sizeCacheKeyForLabel:width:]( self,  "sizeCacheKeyForLabel:width:",  @"title",  v9));
    -[NSCache removeObjectForKey:](self->_textSizeCache, "removeObjectForKey:", v5);
    -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
LABEL_4:
  }
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  id v10 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitle](self, "subtitle"));
  id v5 = v10;
  if (v4 == v10) {
    goto LABEL_4;
  }
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitle](self, "subtitle"));
  unsigned __int8 v7 = [v6 isEqualToString:v10];

  if ((v7 & 1) == 0)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
    [v8 setText:v10];

    -[MTLabelStackView bounds](self, "bounds");
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTLabelStackView sizeCacheKeyForLabel:width:]( self,  "sizeCacheKeyForLabel:width:",  @"subtitle",  v9));
    -[NSCache removeObjectForKey:](self->_textSizeCache, "removeObjectForKey:", v5);
    -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
LABEL_4:
  }
}

- (NSString)subtitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (NSString)titleTextStyle
{
  titleTextStyle = self->_titleTextStyle;
  if (titleTextStyle) {
    return titleTextStyle;
  }
  id v4 = [(id)objc_opt_class(self) defaultTitleTextStyle];
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)setTitleTextStyle:(id)a3
{
  id v5 = (NSString *)a3;
  titleTextStyle = self->_titleTextStyle;
  if (titleTextStyle != v5)
  {
    double v8 = v5;
    unsigned __int8 v7 = -[NSString isEqualToString:](titleTextStyle, "isEqualToString:", v5);
    id v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_titleTextStyle, a3);
      -[MTLabelStackView _updateTitleFont](self, "_updateTitleFont");
      id v5 = v8;
    }
  }
}

- (NSString)subtitleTextStyle
{
  subtitleTextStyle = self->_subtitleTextStyle;
  if (subtitleTextStyle) {
    return subtitleTextStyle;
  }
  id v4 = [(id)objc_opt_class(self) defaultSubtitleTextStyle];
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)setSubtitleTextStyle:(id)a3
{
  id v5 = (NSString *)a3;
  subtitleTextStyle = self->_subtitleTextStyle;
  if (subtitleTextStyle != v5)
  {
    double v8 = v5;
    unsigned __int8 v7 = -[NSString isEqualToString:](subtitleTextStyle, "isEqualToString:", v5);
    id v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_subtitleTextStyle, a3);
      -[MTLabelStackView _updateSubtitleFont](self, "_updateSubtitleFont");
      id v5 = v8;
    }
  }
}

- (UIColor)titleTextColor
{
  titleTextColor = self->_titleTextColor;
  if (titleTextColor) {
    return titleTextColor;
  }
  else {
    return (UIColor *)(id)objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](&OBJC_CLASS___UIColor, "cellTextColor"));
  }
}

- (void)setTitleTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  titleTextColor = self->_titleTextColor;
  if (titleTextColor != v5)
  {
    id v10 = v5;
    unsigned __int8 v7 = -[UIColor isEqual:](titleTextColor, "isEqual:", v5);
    id v5 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_titleTextColor, a3);
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleTextColor](self, "titleTextColor"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
      [v9 setTextColor:v8];

      id v5 = v10;
    }
  }
}

- (UIColor)subtitleTextColor
{
  subtitleTextColor = self->_subtitleTextColor;
  if (subtitleTextColor) {
    return subtitleTextColor;
  }
  else {
    return (UIColor *)(id)objc_claimAutoreleasedReturnValue( +[UIColor cellSecondaryTextColor]( &OBJC_CLASS___UIColor,  "cellSecondaryTextColor"));
  }
}

- (void)setSubtitleTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  subtitleTextColor = self->_subtitleTextColor;
  if (subtitleTextColor != v5)
  {
    id v10 = v5;
    unsigned __int8 v7 = -[UIColor isEqual:](subtitleTextColor, "isEqual:", v5);
    id v5 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_subtitleTextColor, a3);
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleTextColor](self, "subtitleTextColor"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
      [v9 setTextColor:v8];

      id v5 = v10;
    }
  }
}

- (unint64_t)titleNumberOfLines
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
  id v3 = [v2 numberOfLines];

  return (unint64_t)v3;
}

- (void)setTitleNumberOfLines:(unint64_t)a3
{
  if (-[MTLabelStackView titleNumberOfLines](self, "titleNumberOfLines") != a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleLabel](self, "titleLabel"));
    [v5 setNumberOfLines:a3];

    -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
  }

- (unint64_t)subtitleNumberOfLines
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
  id v3 = [v2 numberOfLines];

  return (unint64_t)v3;
}

- (void)setSubtitleNumberOfLines:(unint64_t)a3
{
  if (-[MTLabelStackView subtitleNumberOfLines](self, "subtitleNumberOfLines") != a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleLabel](self, "subtitleLabel"));
    [v5 setNumberOfLines:a3];

    -[MTLabelStackView _heightWillChange](self, "_heightWillChange");
  }

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    id v5 = self->_titleLabel;
    self->_titleLabel = v4;

    -[UILabel setNumberOfLines:]( self->_titleLabel,  "setNumberOfLines:",  [(id)objc_opt_class(self) defaultTitleNumberOfLines]);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleTextColor](self, "titleTextColor"));
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView titleTextStyle](self, "titleTextStyle"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", v7));
    -[UILabel setFont:](self->_titleLabel, "setFont:", v8);

    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UILabel)subtitleLabel
{
  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    id v5 = self->_subtitleLabel;
    self->_subtitleLabel = v4;

    -[UILabel setNumberOfLines:]( self->_subtitleLabel,  "setNumberOfLines:",  [(id)objc_opt_class(self) defaultSubtitleNumberOfLines]);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleTextColor](self, "subtitleTextColor"));
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v6);

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLabelStackView subtitleTextStyle](self, "subtitleTextStyle"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", v7));
    -[UILabel setFont:](self->_subtitleLabel, "setFont:", v8);

    subtitleLabel = self->_subtitleLabel;
  }

  return subtitleLabel;
}

- (MTLabelStackViewDelegate)delegate
{
  return (MTLabelStackViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (double)subtitleMaxWidth
{
  return self->_subtitleMaxWidth;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end