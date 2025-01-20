@interface SRCompactTextRequestSiriSuggestionsButton
- (SRCompactTextRequestSiriSuggestionsButton)initWithFrame:(CGRect)a3;
- (SRCompactTextRequestSiriSuggestionsButtonDelegate)delegate;
- (void)_buttonTapped:(id)a3;
- (void)_setUpIcons;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation SRCompactTextRequestSiriSuggestionsButton

- (SRCompactTextRequestSiriSuggestionsButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SRCompactTextRequestSiriSuggestionsButton;
  v3 = -[SRCompactTextRequestSiriSuggestionsButton initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SRCompactTextRequestSiriSuggestionsButton _setUpIcons](v3, "_setUpIcons");
    -[SRCompactTextRequestSiriSuggestionsButton setSelected:](v4, "setSelected:", 1LL);
    v4->_suggestionsEnabled = 1;
    -[SRCompactTextRequestSiriSuggestionsButton addTarget:action:forControlEvents:]( v4,  "addTarget:action:forControlEvents:",  v4,  "_buttonTapped:",  64LL);
  }

  return v4;
}

- (void)_setUpIcons
{
  v3 = objc_alloc(&OBJC_CLASS___BSUICAPackageView);
  *(void *)&double v5 = objc_opt_class(self, v4).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v6, v5));
  v8 = -[BSUICAPackageView initWithPackageName:inBundle:]( v3,  "initWithPackageName:inBundle:",  @"SuggestionsGlyph",  v7);
  iconsView = self->_iconsView;
  self->_iconsView = v8;

  v10 = self->_iconsView;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[BSUICAPackageView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  -[BSUICAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( self->_iconsView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[BSUICAPackageView setHidden:](self->_iconsView, "setHidden:", 0LL);
  -[BSUICAPackageView setUserInteractionEnabled:](self->_iconsView, "setUserInteractionEnabled:", 0LL);
  -[BSUICAPackageView setExclusiveTouch:](self->_iconsView, "setExclusiveTouch:", 0LL);
  -[SRCompactTextRequestSiriSuggestionsButton addSubview:](self, "addSubview:", self->_iconsView);
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SRCompactTextRequestSiriSuggestionsButton;
  -[SRCompactTextRequestSiriSuggestionsButton layoutSubviews](&v6, "layoutSubviews");
  iconsView = self->_iconsView;
  -[SRCompactTextRequestSiriSuggestionsButton bounds](self, "bounds");
  double v5 = v4;
  -[SRCompactTextRequestSiriSuggestionsButton bounds](self, "bounds");
  -[BSUICAPackageView setFrame:](iconsView, "setFrame:", 0.0, 0.0, v5);
}

- (void)_buttonTapped:(id)a3
{
  BOOL suggestionsEnabled = self->_suggestionsEnabled;
  self->_BOOL suggestionsEnabled = !suggestionsEnabled;
  if (suggestionsEnabled) {
    double v5 = @"State 1";
  }
  else {
    double v5 = @"State 2";
  }
  -[BSUICAPackageView setState:animated:transitionSpeed:completion:]( self->_iconsView,  "setState:animated:transitionSpeed:completion:",  v5,  1LL,  0LL,  1.0);
  -[SRCompactTextRequestSiriSuggestionsButton setSelected:](self, "setSelected:", self->_suggestionsEnabled);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRCompactTextRequestSiriSuggestionsButton delegate](self, "delegate"));
  [v6 textRequestSuggestionsButton:self didEnableSuggestions:self->_suggestionsEnabled];
}

- (SRCompactTextRequestSiriSuggestionsButtonDelegate)delegate
{
  return (SRCompactTextRequestSiriSuggestionsButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end