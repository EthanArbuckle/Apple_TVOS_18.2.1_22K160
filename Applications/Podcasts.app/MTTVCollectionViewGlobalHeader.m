@interface MTTVCollectionViewGlobalHeader
+ (CGSize)estimatedSize:(CGSize)a3;
+ (CGSize)estimatedSize:(CGSize)result firstSectionHasHeader:(BOOL)a4;
+ (id)titleFont;
- (void)layoutSubviews;
@end

@implementation MTTVCollectionViewGlobalHeader

+ (id)titleFont
{
  return +[UIFont mt_preferredFontForTextStyle:addingSymbolicTraits:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:addingSymbolicTraits:",  UIFontTextStyleTitle2,  2LL);
}

+ (CGSize)estimatedSize:(CGSize)a3
{
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)estimatedSize:(CGSize)result firstSectionHasHeader:(BOOL)a4
{
  double v4 = 190.0;
  if (a4) {
    double v4 = 136.0;
  }
  result.height = v4;
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MTTVCollectionViewGlobalHeader;
  -[MTTVCollectionViewSectionHeader layoutSubviews](&v15, "layoutSubviews");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVCollectionViewSectionHeader titleView](self, "titleView"));
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  -[MTTVCollectionViewGlobalHeader bounds](self, "bounds");
  double v9 = IMRoundToPixel((v8 - v5) * 0.5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVCollectionViewSectionHeader headerLabel](self, "headerLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 font]);
  objc_msgSend(v11, "mt_offsetFromFirstBaselineToTop");
  double v13 = 128.0 - v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVCollectionViewSectionHeader titleView](self, "titleView"));
  objc_msgSend(v14, "setFrame:", v9, v13, v5, v7);
}

@end