@interface SCATModernMenuGestureFreehandItem
+ (SCATModernMenuGestureFreehandItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 activateBehavior:(unint64_t)a6;
+ (SCATModernMenuGestureFreehandItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imagePrefixForTouchDependentGlyph:(id)a6 activateBehavior:(unint64_t)a7;
+ (SCATModernMenuGestureFreehandItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imagePrefixForTouchDependentGlyph:(id)a6 shouldRotate:(BOOL)a7 activateBehavior:(unint64_t)a8;
- (BOOL)handleActivateWithElement:(id)a3;
- (BOOL)isFocused;
- (BOOL)shouldRotate;
- (NSString)imagePrefixForTouchDependentGlyph;
- (unint64_t)preferredNumberOfTitleLines;
- (void)setFocused:(BOOL)a3;
- (void)setImagePrefixForTouchDependentGlyph:(id)a3;
- (void)setPreferredNumberOfTitleLines:(unint64_t)a3;
- (void)setShouldRotate:(BOOL)a3;
@end

@implementation SCATModernMenuGestureFreehandItem

+ (SCATModernMenuGestureFreehandItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 activateBehavior:(unint64_t)a6
{
  return (SCATModernMenuGestureFreehandItem *)_[a1 itemWithIdentifier:a3 delegate:a4 title:a5 imagePrefixForTouchDependentGlyph:0 activateBehavior:a6];
}

+ (SCATModernMenuGestureFreehandItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imagePrefixForTouchDependentGlyph:(id)a6 activateBehavior:(unint64_t)a7
{
  return (SCATModernMenuGestureFreehandItem *)[a1 itemWithIdentifier:a3 delegate:a4 title:a5 imagePrefixForTouchDependentGlyph:a6 shou ldRotate:0 activateBehavior:a7];
}

+ (SCATModernMenuGestureFreehandItem)itemWithIdentifier:(id)a3 delegate:(id)a4 title:(id)a5 imagePrefixForTouchDependentGlyph:(id)a6 shouldRotate:(BOOL)a7 activateBehavior:(unint64_t)a8
{
  BOOL v9 = a7;
  id v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 itemWithIdentifier:a3 delegate:a4 title:a5 imageName:0 activateBehavior:a8]);
  [v15 setImagePrefixForTouchDependentGlyph:v14];

  [v15 setShouldRotate:v9];
  [v15 setPreferredNumberOfTitleLines:1];
  return (SCATModernMenuGestureFreehandItem *)v15;
}

- (BOOL)handleActivateWithElement:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandItem;
  BOOL v5 = -[SCATModernMenuItem handleActivateWithElement:](&v13, "handleActivateWithElement:", v4);
  unsigned int v6 = -[SCATModernMenuItem isDisabled](self, "isDisabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  v8 = v7;
  if (v6)
  {
    [v7 beginScanningWithFocusContext:0];
  }

  else
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activeElementManager]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v4,  v10,  0LL,  0LL));
    [v8 beginScanningWithFocusContext:v11];
  }

  return v5;
}

- (void)setFocused:(BOOL)a3
{
  if (self->_focused != a3)
  {
    BOOL v3 = a3;
    self->_focused = a3;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem delegate](self, "delegate"));
    char v6 = objc_opt_respondsToSelector(v5, "menuItem:didBecomeFocused:");

    if ((v6 & 1) != 0)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuItem delegate](self, "delegate"));
      [v7 menuItem:self didBecomeFocused:v3];
    }
  }

- (NSString)imagePrefixForTouchDependentGlyph
{
  return self->_imagePrefixForTouchDependentGlyph;
}

- (void)setImagePrefixForTouchDependentGlyph:(id)a3
{
}

- (BOOL)shouldRotate
{
  return self->_shouldRotate;
}

- (void)setShouldRotate:(BOOL)a3
{
  self->_shouldRotate = a3;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (unint64_t)preferredNumberOfTitleLines
{
  return self->_preferredNumberOfTitleLines;
}

- (void)setPreferredNumberOfTitleLines:(unint64_t)a3
{
  self->_preferredNumberOfTitleLines = a3;
}

- (void).cxx_destruct
{
}

@end