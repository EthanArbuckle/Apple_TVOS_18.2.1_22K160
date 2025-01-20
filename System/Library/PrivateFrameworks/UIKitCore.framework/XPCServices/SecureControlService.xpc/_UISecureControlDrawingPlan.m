@interface _UISecureControlDrawingPlan
- (CGSize)alignmentSize;
- (CGSize)intrinsicContentSize;
- (CGSize)minimumContentSize;
- (_UISecureControlDrawingPlan)initWithSlotStyle:(id)a3 arrangeVertically:(BOOL)a4 secureName:(unsigned int)a5 iconGlyph:(id)a6;
- (__CFString)contentSizeCategory;
- (double)displayScale;
- (id)glyphDrawingInColor:(CGColor *)a3;
- (id)textDrawingInColor:(CGColor *)a3;
- (void)dealloc;
@end

@implementation _UISecureControlDrawingPlan

- (_UISecureControlDrawingPlan)initWithSlotStyle:(id)a3 arrangeVertically:(BOOL)a4 secureName:(unsigned int)a5 iconGlyph:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS____UISecureControlDrawingPlan;
  v12 = -[_UISecureControlDrawingPlan init](&v49, "init");
  if (v12)
  {
    uint64_t v13 = kCTUIFontTextStyleShortBody;
    v12->_font = (__CTFont *)[v10 newFontForTextStyle:kCTUIFontTextStyleShortBody attributes:0];
    v12->_contentSizeCategory = (__CFString *)CFRetain([v10 fontContentSizeCategory]);
    v12->_displayScale = (double)[v10 displayScale];
    if ((_DWORD)v7)
    {
      v14 = (NSString *)objc_claimAutoreleasedReturnValue([v10 localization]);
      uint64_t v15 = UISLocalizedStringForSecureName(v7, v14);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
      localizedText = v12->_localizedText;
      v12->_localizedText = (NSString *)v16;
    }

    else
    {
      v14 = v12->_localizedText;
      v12->_localizedText = 0LL;
    }

    if ([v11 length])
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v10 assetGlyphWithName:v11 glyphSize:1 textStyle:v13]);
      assetGlyph = v12->_assetGlyph;
      v12->_assetGlyph = (CUINamedVectorGlyph *)v18;
    }

    else
    {
      assetGlyph = v12->_assetGlyph;
      v12->_assetGlyph = 0LL;
    }

    CGColorRef ConstantColor = CGColorGetConstantColor(kCGColorWhite);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_UISecureControlDrawingPlan glyphDrawingInColor:](v12, "glyphDrawingInColor:", ConstantColor));
    [v21 drawingSize];
    double v23 = v22;
    double v25 = v24;
    [v21 alignmentRect];
    double v27 = v26;
    double v29 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_UISecureControlDrawingPlan textDrawingInColor:](v12, "textDrawingInColor:", ConstantColor));
    [v30 drawingSize];
    double v32 = v31;
    double v34 = v33;
    [v30 alignmentRect];
    double v37 = v35;
    double v38 = v36;
    if (!v21 || v30)
    {
      if (v21 || !v30)
      {
        double v46 = v34;
        if (v21 && v30)
        {
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472LL;
          v47[2] = sub_100001D20;
          v47[3] = &unk_1000041C8;
          BOOL v48 = a4;
          v39 = objc_retainBlock(v47);
          double v23 = ((double (*)(double, double, double, double))v39[2])(v23, v25, v32, v34);
          double v25 = v40;
          double v27 = ((double (*)(void *, double, double, double, double))v39[2])(v39, v27, v29, v37, v38);
          double v34 = v41;
          double v29 = ((double (*)(void *, double, double, double, double))v39[2])(v39, v29, v29, v37, v38);
          double v38 = v42;
        }
      }

      else
      {
        double v29 = v35;
        double v27 = v35;
        double v25 = v34;
        double v34 = v36;
        double v23 = v32;
      }
    }

    else
    {
      double v38 = v29;
      double v34 = v29;
    }

    double v43 = 0.0;
    double v44 = fmin(1.0 / (double)[v10 displayScale], 1.0);
    v12->_alignmentSize.width = v27;
    v12->_alignmentSize.height = v34;
    v12->_intrinsicContentSize.width = fmax(v27 + 24.0 + v43, v23);
    v12->_intrinsicContentSize.height = fmax(v34 + 14.0, v25);
    v12->_minimumContentSize.width = fmax(v29 + 14.0, v23) - v44;
    v12->_minimumContentSize.height = fmax(v38 + 14.0, v25) - v44;
  }

  return v12;
}

- (void)dealloc
{
  font = self->_font;
  if (font) {
    CFRelease(font);
  }
  contentSizeCategory = self->_contentSizeCategory;
  if (contentSizeCategory) {
    CFRelease(contentSizeCategory);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____UISecureControlDrawingPlan;
  -[_UISecureControlDrawingPlan dealloc](&v5, "dealloc");
}

- (id)textDrawingInColor:(CGColor *)a3
{
  if (!a3)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"UISecureControlDrawingPlan.m", 115, @"Invalid parameter not satisfying: %@", @"color" object file lineNumber description];
  }

  if (self->_localizedText)
  {
    id v5 = objc_alloc(&OBJC_CLASS___UISTextLineDrawing);
    localizedText = self->_localizedText;
    font = self->_font;
    v12[0] = kCTFontAttributeName;
    v12[1] = kCTForegroundColorAttributeName;
    v13[0] = font;
    v13[1] = a3;
    id v8 = objc_msgSend( v5,  "initWithString:attributes:lineBreakMode:textAlignment:width:scale:",  localizedText,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2),  2,  0,  NAN,  self->_displayScale);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)glyphDrawingInColor:(CGColor *)a3
{
  if (!a3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, self, @"UISecureControlDrawingPlan.m", 131, @"Invalid parameter not satisfying: %@", @"color" object file lineNumber description];
  }

  if (self->_assetGlyph) {
    id v5 = [[UISVectorGlyphDrawing alloc] initWithVectorGlyph:self->_assetGlyph tintColor:a3];
  }
  else {
    id v5 = 0LL;
  }
  return v5;
}

- (CGSize)alignmentSize
{
  double width = self->_alignmentSize.width;
  double height = self->_alignmentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (__CFString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_intrinsicContentSize.width;
  double height = self->_intrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)minimumContentSize
{
  double width = self->_minimumContentSize.width;
  double height = self->_minimumContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end