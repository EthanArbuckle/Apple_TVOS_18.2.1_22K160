@interface SRGuideDetailPhraseViewCell
+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4;
+ (id)_font;
- (NSString)text;
- (SRGuideDetailPhraseViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setText:(id)a3;
@end

@implementation SRGuideDetailPhraseViewCell

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _font]);
  v15[0] = xmmword_100082B60;
  v15[1] = unk_100082B70;
  v15[2] = xmmword_100082B80;
  uint64_t v16 = 0x4040000000000000LL;
  +[SiriUITextContainerView sizeThatFits:text:font:textContainerStyle:]( &OBJC_CLASS___SiriUITextContainerView,  "sizeThatFits:text:font:textContainerStyle:",  v7,  v8,  v15,  width,  height);
  double v10 = v9;
  double v12 = v11;

  if (v12 >= SiriUIPlatterStyle[26]) {
    double v13 = v12;
  }
  else {
    double v13 = SiriUIPlatterStyle[26];
  }
  double v14 = v10;
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (SRGuideDetailPhraseViewCell)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SRGuideDetailPhraseViewCell;
  v3 = -[SRGuideDetailPhraseViewCell initWithFrame:]( &v18,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = -[SiriUITextContainerView initWithText:visualEffect:]( objc_alloc(&OBJC_CLASS___SiriUITextContainerView),  "initWithText:visualEffect:",  0LL,  0LL);
    textContainerView = v3->_textContainerView;
    v3->_textContainerView = v4;

    -[SiriUITextContainerView setTextAlignment:]( v3->_textContainerView,  "setTextAlignment:",  SiriLanguageTextAlignmentLeft());
    v6 = v3->_textContainerView;
    *(void *)&double v8 = objc_opt_class(v3, v7).n128_u64[0];
    double v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_font", v8));
    -[SiriUITextContainerView setFont:](v6, "setFont:", v10);

    double v11 = v3->_textContainerView;
    v16[0] = xmmword_100082B60;
    v16[1] = unk_100082B70;
    v16[2] = xmmword_100082B80;
    uint64_t v17 = 0x4040000000000000LL;
    -[SiriUITextContainerView setTextContainerStyle:](v11, "setTextContainerStyle:", v16);
    double v12 = v3->_textContainerView;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_blendEffectColor](&OBJC_CLASS___UIColor, "siriui_blendEffectColor"));
    -[SiriUITextContainerView setTextColor:](v12, "setTextColor:", v13);

    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDetailPhraseViewCell contentView](v3, "contentView"));
    [v14 addSubview:v3->_textContainerView];

    -[SiriUITextContainerView siriui_setBlendEffectEnabled:]( v3->_textContainerView,  "siriui_setBlendEffectEnabled:",  1LL);
    -[SRGuideDetailPhraseViewCell setKeylineType:](v3, "setKeylineType:", 0LL);
  }

  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SRGuideDetailPhraseViewCell;
  -[SRGuideDetailPhraseViewCell layoutSubviews](&v5, "layoutSubviews");
  textContainerView = self->_textContainerView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDetailPhraseViewCell contentView](self, "contentView"));
  [v4 bounds];
  -[SiriUITextContainerView setFrame:](textContainerView, "setFrame:");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SRGuideDetailPhraseViewCell;
  -[SRGuideDetailPhraseViewCell prepareForReuse](&v3, "prepareForReuse");
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
  return +[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
}

- (void).cxx_destruct
{
}

@end