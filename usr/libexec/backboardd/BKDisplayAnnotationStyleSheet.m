@interface BKDisplayAnnotationStyleSheet
- (BKDisplayAnnotationStyle)baseStyle;
- (BKDisplayAnnotationStyle)styleModifier;
- (BKDisplayAnnotationStyle)subnodeStyleModifier;
- (id)newLayerForContent:(id)a3 scale:(double)a4;
- (void)applyToLayer:(id)a3 forContent:(id)a4;
- (void)setBaseStyle:(id)a3;
- (void)setStyleModifier:(id)a3;
- (void)setSubnodeStyleModifier:(id)a3;
- (void)sizeLayer:(id)a3 toFitAtScale:(double)a4;
@end

@implementation BKDisplayAnnotationStyleSheet

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [self->_baseStyle applyToLayer:v8 forContent:v6];
  styleModifier = self->_styleModifier;
  if (styleModifier && self->_baseStyle != styleModifier) {
    [styleModifier applyToLayer:v8 forContent:v6];
  }
}

- (void)sizeLayer:(id)a3 toFitAtScale:(double)a4
{
  id v7 = a3;
  if ((objc_opt_respondsToSelector(self->_baseStyle, "sizeLayer:toFitAtScale:") & 1) != 0) {
    [self->_baseStyle sizeLayer:v7 toFitAtScale:a4];
  }
  styleModifier = self->_styleModifier;
  if (styleModifier
    && self->_baseStyle != styleModifier
    && (objc_opt_respondsToSelector(styleModifier, "sizeLayer:toFitAtScale:") & 1) != 0)
  {
    [self->_styleModifier sizeLayer:v7 toFitAtScale:a4];
  }
}

- (BKDisplayAnnotationStyle)subnodeStyleModifier
{
  subnodeStyleModifier = self->_subnodeStyleModifier;
  if (!subnodeStyleModifier) {
    subnodeStyleModifier = self->_styleModifier;
  }
  return subnodeStyleModifier;
}

- (id)newLayerForContent:(id)a3 scale:(double)a4
{
  id v5 = a3;
  BKDisplayAnnotationStringContent *v7 = [BKDisplayAnnotationStringContent class];
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v9 = [CATextLayer layer];
    v10 = (void *)[v5 string];
    [v9 setString:v10];
    v11 = [@"Text annotation: " stringByAppendingString:v10];
    [v9 setName:v11];

    [v9 setContentsScale:a4];
    [v9 setRasterizationScale:a4];
    [v9 setContentsFormat:kCAContentsFormatAutomatic];
  }

  else
  {
    uint64_t v12 = [BKDisplayAnnotationShapeContent class];
    if ((objc_opt_isKindOfClass(v5, v12) & 1) != 0)
    {
      v9 = [CAShapeLayer layer];
      [v9 setName:@"Shape annotation"];
    }

    else
    {
      v9 = [CALayer layer];
    }
  }

  return v9;
}

- (BKDisplayAnnotationStyle)baseStyle
{
  return self->_baseStyle;
}

- (void)setBaseStyle:(id)a3
{
}

- (BKDisplayAnnotationStyle)styleModifier
{
  return self->_styleModifier;
}

- (void)setStyleModifier:(id)a3
{
}

- (void)setSubnodeStyleModifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end