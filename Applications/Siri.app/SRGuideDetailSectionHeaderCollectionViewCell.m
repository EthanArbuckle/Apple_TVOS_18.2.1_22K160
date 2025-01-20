@interface SRGuideDetailSectionHeaderCollectionViewCell
+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4;
+ (double)_leadingHorizontalOffsetWithLayoutMargins:(UIEdgeInsets)a3;
+ (double)_trailingHorizontalOffsetWithLayoutMargins:(UIEdgeInsets)a3;
+ (id)_font;
- (NSString)text;
- (SRGuideDetailSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setText:(id)a3;
@end

@implementation SRGuideDetailSectionHeaderCollectionViewCell

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _font]);
  v22[0] = xmmword_1000D7790;
  v22[1] = unk_1000D77A0;
  v22[2] = xmmword_1000D77B0;
  uint64_t v23 = qword_1000D77C0;
  +[SiriUITextContainerView sizeThatFits:text:font:textContainerStyle:]( &OBJC_CLASS___SiriUITextContainerView,  "sizeThatFits:text:font:textContainerStyle:",  v7,  v8,  v22,  width,  height);
  double v10 = v9;
  double v12 = v11;

  double v13 = SiriUIPlatterStyle[31];
  double v14 = SiriUIPlatterStyle[32];
  double v15 = SiriUIPlatterStyle[33];
  double v16 = SiriUIPlatterStyle[34];
  objc_msgSend(a1, "_leadingHorizontalOffsetWithLayoutMargins:", v13, v14, v15, v16);
  double v18 = v10 - v17;
  objc_msgSend(a1, "_trailingHorizontalOffsetWithLayoutMargins:", v13, v14, v15, v16);
  double v20 = v18 - v19;
  double v21 = SiriUIPlatterStyle[26];
  if (v12 >= v21) {
    double v21 = v12;
  }
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (SRGuideDetailSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SRGuideDetailSectionHeaderCollectionViewCell;
  v3 = -[SRGuideDetailSectionHeaderCollectionViewCell initWithFrame:]( &v19,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    __int128 v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    unk_1000D77A8 = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(__int128 *)((char *)&xmmword_1000D77B0 + 8) = v4;
    v5 = -[SiriUITextContainerView initWithText:]( objc_alloc(&OBJC_CLASS___SiriUITextContainerView),  "initWithText:",  0LL);
    textContainerView = v3->_textContainerView;
    v3->_textContainerView = v5;

    -[SiriUITextContainerView setTextAlignment:]( v3->_textContainerView,  "setTextAlignment:",  SiriLanguageTextAlignmentLeft());
    id v7 = v3->_textContainerView;
    id v9 = objc_msgSend((id)objc_opt_class(v3, v8), "_font");
    double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SiriUITextContainerView setFont:](v7, "setFont:", v10);

    double v11 = v3->_textContainerView;
    v17[0] = xmmword_1000D7790;
    v17[1] = unk_1000D77A0;
    v17[2] = xmmword_1000D77B0;
    uint64_t v18 = qword_1000D77C0;
    -[SiriUITextContainerView setTextContainerStyle:](v11, "setTextContainerStyle:", v17);
    double v12 = v3->_textContainerView;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightTextColor](&OBJC_CLASS___UIColor, "siriui_lightTextColor"));
    -[SiriUITextContainerView setTextColor:](v12, "setTextColor:", v13);

    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDetailSectionHeaderCollectionViewCell contentView](v3, "contentView"));
    [v14 addSubview:v3->_textContainerView];

    -[SRGuideDetailSectionHeaderCollectionViewCell setKeylineType:](v3, "setKeylineType:", 3LL);
    double v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightKeylineColor](&OBJC_CLASS___UIColor, "siriui_lightKeylineColor"));
    -[SRGuideDetailSectionHeaderCollectionViewCell setKeylineCustomBackgroundColor:]( v3,  "setKeylineCustomBackgroundColor:",  v15);
  }

  return v3;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SRGuideDetailSectionHeaderCollectionViewCell;
  -[SRGuideDetailSectionHeaderCollectionViewCell layoutSubviews](&v17, "layoutSubviews");
  objc_opt_class(self, v3);
  double v4 = SiriUIPlatterStyle[31];
  double v5 = SiriUIPlatterStyle[32];
  double v6 = SiriUIPlatterStyle[33];
  double v7 = SiriUIPlatterStyle[34];
  objc_msgSend(v8, "_leadingHorizontalOffsetWithLayoutMargins:", v4, v5, v6, v7);
  double v10 = v9;
  objc_opt_class(self, v11);
  objc_msgSend(v12, "_trailingHorizontalOffsetWithLayoutMargins:", v4, v5, v6, v7);
  double v14 = v13;
  textContainerView = self->_textContainerView;
  -[SRGuideDetailSectionHeaderCollectionViewCell bounds](self, "bounds");
  CGFloat v16 = CGRectGetWidth(v18) - v10 - v14;
  -[SRGuideDetailSectionHeaderCollectionViewCell bounds](self, "bounds");
  -[SiriUITextContainerView setFrame:](textContainerView, "setFrame:", v10, 0.0, v16, CGRectGetHeight(v19));
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SRGuideDetailSectionHeaderCollectionViewCell;
  -[SRGuideDetailSectionHeaderCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[SiriUITextContainerView setText:](self->_textContainerView, "setText:", 0LL);
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return (NSString *)-[SiriUITextContainerView text](self->_textContainerView, "text");
}

+ (id)_font
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle3));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fontDescriptor]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fontDescriptorWithSymbolicTraits:2]);

  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v4, 0.0));
  return v5;
}

+ (double)_leadingHorizontalOffsetWithLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double left = a3.left;
  else {
    return right;
  }
}

+ (double)_trailingHorizontalOffsetWithLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double left = a3.left;
  else {
    return left;
  }
}

- (void).cxx_destruct
{
}

@end