@interface MRTextRenderer
- ($0AC6E346AE4835514AAA8AC86D8F4844)rangeOfGlyphsForWordsInRange:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)rangeOfGlyphsOnLine:(int64_t)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)rangeOfStringForGlyphIndex:(int64_t)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)rangeOfWordsOnLine:(int64_t)a3;
- (BOOL)centerVertically;
- (BOOL)renderAtDefinedSize;
- (BOOL)truncate;
- (CGContext)_retainedContextFromAttributedString:(id)a3 withSize:(CGSize)a4;
- (CGContext)retainedContext;
- (CGContext)retainedContextOfGlyphAtIndex:(int64_t)a3;
- (CGContext)retainedContextOfWordsInRange:(id)a3;
- (CGPoint)originOfGlyphAtIndex:(int64_t)a3;
- (CGPoint)originOfWordAtIndex:(int64_t)a3;
- (CGRect)_textClipRectForString:(id)a3;
- (CGRect)_tightFrameOfLineAtIndex:(int64_t)a3 inString:(id)a4 withSize:(CGSize)a5;
- (CGRect)frameOfLineWithGlyphAtIndex:(int64_t)a3 range:(_NSRange *)a4;
- (CGRect)imageRect;
- (CGRect)tightFrameOfAllLines;
- (CGRect)tightFrameOfLineAtIndex:(int64_t)a3;
- (CGSize)_shadowSizeOffsetForString:(id)a3;
- (CGSize)_sizeOfString:(id)a3;
- (CGSize)_sizeToRendererAt;
- (CGSize)definedSize;
- (CGSize)inset;
- (CGSize)resolution;
- (CGSize)shadowOffset;
- (CGSize)sizeOfContext;
- (CGSize)sizeOfText;
- (MRTextRenderer)init;
- (MRTextRenderer)initWithText:(id)a3 resolution:(CGSize)a4;
- (NSAttributedString)placeholderText;
- (NSAttributedString)text;
- (double)_scale;
- (double)_strikethroughThinkness:(int64_t)a3 baselineOffset:(double)a4 lineRect:(CGRect)a5;
- (double)columnMargin;
- (double)extraFooter;
- (double)lineSpacingFactor;
- (double)scale;
- (id)_invertRect:(CGRect)a3 inRect:(CGRect)a4;
- (id)_truncateTextToFitInSize:(CGSize)a3 fromCenter:(BOOL)a4 outSize:(CGSize *)a5;
- (id)truncatedText;
- (int64_t)_glyphIndexForStringIndex:(int64_t)a3 inString:(id)a4 forSize:(CGSize)a5;
- (int64_t)_numberOfLinesInString:(id)a3;
- (int64_t)columnCount;
- (int64_t)countOfGlyphs;
- (int64_t)countOfWords;
- (int64_t)glyphIndexForStringIndex:(int64_t)a3;
- (int64_t)maxNumberOfLines;
- (int64_t)numberOfLines;
- (int64_t)numberOfLinesForTruncatedText;
- (void)_drawInContext:(CGContext *)a3 withAttributedString:(id)a4 withSize:(CGSize)a5 andScale:(double)a6;
- (void)cacheText;
- (void)cleanup;
- (void)clearCache;
- (void)dealloc;
- (void)setCenterVertically:(BOOL)a3;
- (void)setColumnCount:(int64_t)a3;
- (void)setColumnMargin:(double)a3;
- (void)setDefinedSize:(CGSize)a3;
- (void)setExtraFooter:(double)a3;
- (void)setImageRect:(CGRect)a3;
- (void)setInset:(CGSize)a3;
- (void)setLineSpacingFactor:(double)a3;
- (void)setMaxNumberOfLines:(int64_t)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setRenderAtDefinedSize:(BOOL)a3;
- (void)setResolution:(CGSize)a3;
- (void)setScale:(double)a3;
- (void)setText:(id)a3;
- (void)setTruncate:(BOOL)a3;
- (void)squeezeWidthForLineCount:(int64_t)a3;
- (void)trimWhitespace;
- (void)updateLineSpacing;
@end

@implementation MRTextRenderer

- (MRTextRenderer)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRTextRenderer;
  result = -[MRTextRenderer init](&v5, "init");
  if (result)
  {
    CGSize v3 = CGSizeZero;
    result->_definedSize = CGSizeZero;
    result->_inset = v3;
    CGSize size = CGRectZero.size;
    result->_imageRect.origin = CGRectZero.origin;
    result->_text = 0LL;
    result->_truncate = 1;
    result->_maxNumberOfLines = 10000000LL;
    result->_lineSpacingFactor = 1.0;
    result->_scale = 1.0;
    result->_columnCount = 0LL;
    result->_imageRect.CGSize size = size;
    *(_OWORD *)&result->_columnMargin = xmmword_1FC350;
    result->_centerVertically = 0;
  }

  return result;
}

- (MRTextRenderer)initWithText:(id)a3 resolution:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v7 = -[MRTextRenderer init](self, "init");
  if (v7)
  {
    if (a3) {
      v8 = (NSAttributedString *)a3;
    }
    else {
      v8 = 0LL;
    }
    v7->_text = v8;
    v7->_resolution.CGFloat width = width;
    v7->_resolution.CGFloat height = height;
    v7->_placeholderText = 0LL;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRTextRenderer;
  -[MRTextRenderer dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  text = self->_text;
  if (text)
  {

    self->_text = 0LL;
  }

  placeholderText = self->_placeholderText;
  if (placeholderText)
  {

    self->_placeholderText = 0LL;
  }

- (NSAttributedString)text
{
  p_text = &self->_text;
  text = self->_text;
  if (!text || !-[NSAttributedString length](text, "length")) {
    p_text = &self->_placeholderText;
  }
  return *p_text;
}

- (void)setPlaceholderText:(id)a3
{
  placeholderText = self->_placeholderText;
  if (placeholderText)
  {

    self->_placeholderText = 0LL;
  }

  if (a3)
  {
    v6 = -[NSMutableAttributedString initWithAttributedString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithAttributedString:",  a3);
    -[NSMutableAttributedString replaceCharactersInRange:withString:]( v6,  "replaceCharactersInRange:withString:",  0LL,  -[NSMutableAttributedString length](v6, "length"),  @"                                      ");
    self->_placeholderText = &v6->super;
  }

- (void)setText:(id)a3
{
  text = self->_text;
  if (text != a3)
  {
    if (text) {

    }
    cachedText = self->_cachedText;
    if (cachedText)
    {

      self->_cachedText = 0LL;
    }

    if (a3)
    {
      v7 = (NSAttributedString *)a3;
      self->_text = v7;
      if (v7)
      {
        v8 = -[NSAttributedString length](v7, "length");
        if (v8) {
          v8 = -[MRTextRenderer glyphIndexForStringIndex:](self, "glyphIndexForStringIndex:", v8 - 1);
        }
        self->_lastGlyphIndex = (int64_t)v8;
      }
    }

    else
    {
      self->_text = 0LL;
    }

    -[MRTextRenderer updateLineSpacing](self, "updateLineSpacing");
  }

- (void)setResolution:(CGSize)a3
{
  CGFloat height = a3.height;
  self->_resolution = (CGSize)vcvtq_f64_f32(vrndp_f32(vcvt_f32_f64((float64x2_t)a3)));
}

- (void)cacheText
{
  self->_originalCacheSize = CGSizeZero;
  -[MRTextRenderer _sizeToRendererAt](self, "_sizeToRendererAt");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  self->_cachedSize.CGFloat width = v3;
  self->_cachedSize.CGFloat height = v5;
  self->_cachedText = (NSAttributedString *) -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  &self->_cachedSize);
  self->_originalCacheSize.CGFloat width = v4;
  self->_originalCacheSize.CGFloat height = v6;
}

- (void)clearCache
{
  self->_cachedText = 0LL;
  CGSize v3 = CGSizeZero;
  self->_originalCacheSize = CGSizeZero;
  self->_cachedSize = v3;
}

- (CGContext)retainedContext
{
  result = -[MRTextRenderer text](self, "text");
  if (result)
  {
    -[MRTextRenderer _sizeToRendererAt](self, "_sizeToRendererAt");
    double v5 = v4;
    double v7 = v6;
    v8 = -[MRTextRenderer text](self, "text");
    double v13 = v5;
    double v14 = v7;
    if (self->_truncate)
    {
      v9 = -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  &v13,  v5,  v7);
      double v10 = v13;
      double v11 = v14;
    }

    else
    {
      v9 = v8;
      double v11 = v7;
      double v10 = v5;
    }

    if (self->_renderAtDefinedSize)
    {
      double v11 = v7;
      double v10 = v5;
    }

    double extraFooter = self->_extraFooter;
    if (extraFooter <= 0.0) {
      double extraFooter = -0.0;
    }
    return -[MRTextRenderer _retainedContextFromAttributedString:withSize:]( self,  "_retainedContextFromAttributedString:withSize:",  v9,  v10,  v11 + extraFooter,  *(void *)&v13,  *(void *)&v14);
  }

  return result;
}

- (CGSize)sizeOfText
{
  double v7 = v3;
  double v8 = v4;
  if (self->_truncate)
  {
    -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  &v7);
    double v3 = v7;
    double v4 = v8;
  }

  double v5 = v3 + self->_inset.width * 2.0;
  double v6 = v4 + self->_inset.height * 2.0;
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)sizeOfContext
{
  double v5 = v3;
  double v6 = v4;
  double v12 = v3;
  double v13 = v4;
  if (self->_truncate)
  {
    -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  &v12,  v3,  v4);
    double v8 = v12;
    double v7 = v13;
  }

  else
  {
    double v7 = v4;
    double v8 = v5;
  }

  if (self->_renderAtDefinedSize)
  {
    double v8 = v5;
    double v9 = v6;
  }

  else
  {
    double v9 = v7;
  }

  double v10 = v8 + self->_inset.width * 2.0;
  double v11 = v9 + self->_inset.height * 2.0;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (CGSize)_sizeToRendererAt
{
  double width = self->_originalCacheSize.width;
  double height = self->_originalCacheSize.height;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    if (self->_renderAtDefinedSize)
    {
      double width = self->_definedSize.width;
      double height = self->_definedSize.height;
    }

    else
    {
      -[MRTextRenderer _sizeOfString:](self, "_sizeOfString:", -[MRTextRenderer text](self, "text"));
    }
  }

  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)tightFrameOfAllLines
{
  uint64_t v3 = -[MRTextRenderer numberOfLines](self, "numberOfLines");
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if (v3 < 1)
  {
    CGFloat v11 = CGRectZero.origin.x;
    CGFloat v13 = CGRectZero.origin.y;
    CGFloat v15 = CGRectZero.size.width;
    CGFloat v17 = CGRectZero.size.height;
  }

  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = 0LL;
    CGFloat v22 = CGRectZero.size.height;
    CGFloat v23 = CGRectZero.size.width;
    CGFloat v24 = CGRectZero.origin.y;
    CGFloat v25 = CGRectZero.origin.x;
    do
    {
      -[MRTextRenderer tightFrameOfLineAtIndex:]( self,  "tightFrameOfLineAtIndex:",  v9,  *(void *)&v22,  *(void *)&v23,  *(void *)&v24,  *(void *)&v25);
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      v30.origin.CGFloat y = v24;
      v30.origin.CGFloat x = v25;
      v30.size.CGFloat height = v22;
      v30.size.CGFloat width = v23;
      if (!CGRectEqualToRect(v26, v30))
      {
        v27.origin.CGFloat x = v11;
        v27.origin.CGFloat y = v13;
        v27.size.CGFloat width = v15;
        v27.size.CGFloat height = v17;
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        CGRect v28 = CGRectUnion(v27, v31);
        CGFloat v11 = v28.origin.x;
        CGFloat v13 = v28.origin.y;
        CGFloat v15 = v28.size.width;
        CGFloat v17 = v28.size.height;
      }

      ++v9;
      CGFloat height = v17;
      CGFloat width = v15;
      CGFloat y = v13;
      CGFloat x = v11;
    }

    while (v8 != v9);
  }

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (double)_scale
{
  return self->_scale;
}

- (CGRect)tightFrameOfLineAtIndex:(int64_t)a3
{
  double v6 = v5;
  double v8 = v7;
  double v18 = v5;
  double v19 = v7;
  uint64_t v9 = -[MRTextRenderer text](self, "text");
  if (self->_truncate) {
    uint64_t v9 = -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  &v18,  v6,  v8);
  }
  double v10 = v18;
  double v11 = v19;
  if (self->_renderAtDefinedSize)
  {
    double v11 = v8;
    double v10 = v6;
  }

  float v12 = v10;
  float v13 = v11;
  -[MRTextRenderer _tightFrameOfLineAtIndex:inString:withSize:]( self,  "_tightFrameOfLineAtIndex:inString:withSize:",  a3,  v9,  ceilf(v12),  ceilf(v13));
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)_tightFrameOfLineAtIndex:(int64_t)a3 inString:(id)a4 withSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v11 = CGBitmapContextCreate( 0LL,  (unint64_t)width,  (unint64_t)height,  8uLL,  vcvtd_n_s64_f64(width, 2uLL),  DeviceRGB,  0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  +[MRRenderer textScaleForResolution:]( &OBJC_CLASS___MRRenderer,  "textScaleForResolution:",  self->_resolution.width,  self->_resolution.height);
  double v13 = v12;
  Mutable = CGPathCreateMutable();
  float v15 = width / v13;
  v39.size.double width = ceilf(v15);
  v39.size.double height = 30000.0;
  v39.origin.double x = 0.0;
  v39.origin.double y = 0.0;
  CGPathAddRect(Mutable, 0LL, v39);
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double v18 = CGRectZero.size.width;
  double v19 = CGRectZero.size.height;
  double v20 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)a4);
  if (v20)
  {
    double v21 = v20;
    v37.location = 0LL;
    v37.length = 0LL;
    Frame = CTFramesetterCreateFrame(v20, v37, Mutable, 0LL);
    if (Frame)
    {
      CGFloat v23 = Frame;
      Lines = CTFrameGetLines(Frame);
      if (CFArrayGetCount(Lines) > a3)
      {
        ValueAtIndedouble x = (const __CTLine *)CFArrayGetValueAtIndex(Lines, a3);
        v38.location = a3;
        v38.length = 1LL;
        CTFrameGetLineOrigins(v23, v38, &v36);
        CGRect ImageBounds = CTLineGetImageBounds(ValueAtIndex, v11);
        double x = ImageBounds.origin.x;
        double v18 = ImageBounds.size.width;
        double v19 = ImageBounds.size.height;
        if (self->_renderAtDefinedSize)
        {
          float v26 = height / v13;
          double y = v36.y + -30000.0 + ceilf(v26);
        }

        else
        {
          float v27 = height / v13;
          double y = ImageBounds.origin.y + v36.y + -30000.0 + ceilf(v27);
        }
      }

      CFRelease(v23);
    }

    CFRelease(v21);
  }

  CFRelease(Mutable);
  if (v11) {
    CFRelease(v11);
  }
  float v28 = v13 * x;
  double v29 = ceilf(v28);
  float v30 = v13 * y;
  double v31 = ceilf(v30);
  float v32 = v13 * v18;
  double v33 = ceilf(v32);
  float v34 = v13 * v19;
  double v35 = ceilf(v34);
  result.size.double height = v35;
  result.size.double width = v33;
  result.origin.double y = v31;
  result.origin.double x = v29;
  return result;
}

- (CGContext)_retainedContextFromAttributedString:(id)a3 withSize:(CGSize)a4
{
  float v6 = a4.width + self->_inset.width * 2.0;
  double v7 = ceilf(v6);
  float v8 = a4.height + self->_inset.height * 2.0;
  -[MRTextRenderer _scale](self, "_scale");
  double v10 = v9;
  double v11 = +[MRUtilities newColorSpaceForDevice](&OBJC_CLASS___MRUtilities, "newColorSpaceForDevice");
  double v12 = CGBitmapContextCreate( 0LL,  vcvtps_u32_f32(v6),  vcvtps_u32_f32(v8),  8uLL,  vcvtd_n_s64_f64(v7, 2uLL),  v11,  0x2002u);
  CGContextSetShouldSmoothFonts(v12, 0);
  -[MRTextRenderer _drawInContext:withAttributedString:withSize:andScale:]( self,  "_drawInContext:withAttributedString:withSize:andScale:",  v12,  a3,  v7,  ceilf(v8),  v10);
  CGColorSpaceRelease(v11);
  return v12;
}

- (double)_strikethroughThinkness:(int64_t)a3 baselineOffset:(double)a4 lineRect:(CGRect)a5
{
  if ((a3 & 7) == 0) {
    return 1.0;
  }
  double height = a4 * 5.3636991;
  if (height > a5.size.height) {
    double height = a5.size.height;
  }
  double result = height * 0.0440277313 * (double)(a3 & 7);
  double v7 = ceil(result);
  if (result > 0.35) {
    return v7;
  }
  return result;
}

- (void)_drawInContext:(CGContext *)a3 withAttributedString:(id)a4 withSize:(CGSize)a5 andScale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  if (![a4 length]) {
    return;
  }
  double v10 = -2.0;
  unint64_t columnCount = self->_columnCount;
  if (columnCount)
  {
    float v12 = (height + self->_inset.height * -2.0) / a6;
    double v13 = (double)(uint64_t)vcvtps_s32_f32(v12);
  }

  else
  {
    double v13 = 30000.0;
  }

  double rect = v13;
  double v14 = self->_inset.width;
  if (columnCount <= 1) {
    unint64_t columnCount = 1LL;
  }
  uint64_t v109 = columnCount;
  Attribute = (void *)CFAttributedStringGetAttribute((CFAttributedStringRef)a4, 0LL, @"shadow", 0LL);
  double v16 = Attribute;
  double v17 = CGSizeZero.width;
  double v18 = CGSizeZero.height;
  double v19 = 0.0;
  if (!self->_columnCount)
  {
    double v118 = v14;
    double v21 = self->_inset.width;
    double v20 = self->_inset.height;
    if (v21 == 0.0 && v20 == 0.0)
    {
      double v22 = 0.0;
      double v23 = 0.0;
      double v24 = width;
      CGFloat v25 = height;
      if (Attribute)
      {
LABEL_11:
        double v26 = v24;
        objc_msgSend(objc_msgSend(Attribute, "objectForKey:", @"offset"), "CGSizeValue");
        CGFloat v117 = v27;
        double v18 = v28;
        objc_msgSend(objc_msgSend(v16, "objectForKey:", @"blurRadius"), "floatValue");
        double v24 = v26;
        double v19 = v29;
LABEL_26:
        v133.origin.double x = CGRectZero.origin.x;
        v133.origin.CGFloat y = CGRectZero.origin.y;
        v133.size.double width = CGRectZero.size.width;
        v133.size.double height = CGRectZero.size.height;
        double v32 = v22;
        double v33 = v23;
        CGFloat v34 = v25;
        CGFloat v35 = v24;
        if (!CGRectEqualToRect(*(CGRect *)(&v24 - 2), v133))
        {
          v131.origin.double x = v22;
          v131.origin.CGFloat y = v23;
          v131.size.double width = v35;
          v131.size.double height = v25;
          CGContextClipToRect(a3, v131);
        }

        double v17 = v117;
        double v14 = v118;
        double v10 = -2.0;
        goto LABEL_29;
      }
    }

    else
    {
      if (v21 >= 0.0) {
        double v22 = self->_inset.width;
      }
      else {
        double v22 = 0.0;
      }
      if (v20 >= 0.0) {
        double v23 = self->_inset.height;
      }
      else {
        double v23 = 0.0;
      }
      double v30 = width - v21 * 2.0;
      if (width >= v30) {
        double v24 = v30;
      }
      else {
        double v24 = width;
      }
      double v31 = height - v20 * 2.0;
      if (height >= v31) {
        CGFloat v25 = v31;
      }
      else {
        CGFloat v25 = height;
      }
      if (Attribute) {
        goto LABEL_11;
      }
    }

    CGFloat v117 = CGSizeZero.width;
    goto LABEL_26;
  }

- (CGRect)_textClipRectForString:(id)a3
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  -[MRTextRenderer _sizeOfString:](self, "_sizeOfString:");
  double v30 = v10;
  double v31 = v9;
  uint64_t v11 = -[MRTextRenderer _numberOfLinesInString:](self, "_numberOfLinesInString:", a3);
  if (v11 >= 1)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0LL;
    CGFloat v26 = height;
    CGFloat v27 = width;
    CGFloat v28 = y;
    CGFloat v29 = CGRectZero.origin.x;
    while (1)
    {
      -[MRTextRenderer _tightFrameOfLineAtIndex:inString:withSize:]( self,  "_tightFrameOfLineAtIndex:inString:withSize:",  v13,  a3,  v31,  v30,  *(void *)&v26,  *(void *)&v27,  *(void *)&v28,  *(void *)&v29);
      if (v15 < 0.0) {
        break;
      }
      CGFloat v18 = v14;
      CGFloat v19 = v15;
      CGFloat v20 = v16;
      CGFloat v21 = v17;
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      v36.origin.CGFloat y = v28;
      v36.origin.CGFloat x = v29;
      v36.size.CGFloat height = v26;
      v36.size.CGFloat width = v27;
      if (!CGRectEqualToRect(v32, v36))
      {
        v33.origin.CGFloat x = x;
        v33.origin.CGFloat y = y;
        v33.size.CGFloat width = width;
        v33.size.CGFloat height = height;
        v37.origin.CGFloat x = v18;
        v37.origin.CGFloat y = v19;
        v37.size.CGFloat width = v20;
        v37.size.CGFloat height = v21;
        CGRect v34 = CGRectUnion(v33, v37);
        CGFloat v18 = v34.origin.x;
        CGFloat v19 = v34.origin.y;
        CGFloat v20 = v34.size.width;
        CGFloat v21 = v34.size.height;
      }

      ++v13;
      CGFloat height = v21;
      CGFloat width = v20;
      CGFloat y = v19;
      CGFloat x = v18;
      if (v12 == v13) {
        goto LABEL_9;
      }
    }
  }

  CGFloat v18 = x;
  CGFloat v19 = y;
  CGFloat v20 = width;
  CGFloat v21 = height;
LABEL_9:
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (int64_t)countOfWords
{
  id v3 = objc_msgSend( objc_msgSend( -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0,  v15),  "string"),  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v9 length]) {
          [v4 addObject:v9];
        }
      }

      id v6 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v6);
  }

  return (int64_t)[v4 count];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)rangeOfWordsOnLine:(int64_t)a3
{
  if (-[MRTextRenderer text](self, "text"))
  {
    -[MRTextRenderer _scale](self, "_scale");
    double v6 = v5;
    Mutable = CGPathCreateMutable();
    float v8 = Mutable;
    double width = self->_definedSize.width;
    if (width <= 0.0) {
      double width = self->_resolution.width;
    }
    v45.size.double width = width / v6;
    v45.size.CGFloat height = self->_resolution.height / v6;
    v45.origin.CGFloat x = 0.0;
    v45.origin.CGFloat y = 0.0;
    CGPathAddRect(Mutable, 0LL, v45);
    CFAttributedStringRef aStr = -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  v40,  self->_definedSize.width,  self->_definedSize.height);
    double v10 = CTFramesetterCreateWithAttributedString(aStr);
    if (v10)
    {
      cf = v10;
      v43.CFIndex location = 0LL;
      v43.length = 0LL;
      Frame = CTFramesetterCreateFrame(v10, v43, v8, 0LL);
      Lines = CTFrameGetLines(Frame);
      CGRect v32 = v8;
      if (Lines)
      {
        __int128 v12 = Lines;
        if (CFArrayGetCount(Lines) <= a3)
        {
          int64_t v14 = 0LL;
          uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_28;
        }

        if ((a3 & 0x8000000000000000LL) == 0)
        {
          uint64_t v13 = 0LL;
          int64_t v14 = 0LL;
          CFIndex v15 = 0LL;
          CGRect v33 = v12;
          int64_t v34 = a3;
          do
          {
            ValueAtIndeCGFloat x = (const __CTLine *)CFArrayGetValueAtIndex(v12, v15);
            CFRange StringRange = CTLineGetStringRange(ValueAtIndex);
            CFAttributedStringRef v17 = CFAttributedStringCreateWithSubstring(kCFAllocatorDefault, aStr, StringRange);
            id v18 = objc_msgSend( -[__CFAttributedString string](v17, "string"),  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
            id v19 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
            __int128 v36 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            __int128 v39 = 0u;
            id v20 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = *(void *)v37;
              do
              {
                for (i = 0LL; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v37 != v22) {
                    objc_enumerationMutation(v18);
                  }
                  double v24 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
                  if ([v24 length]) {
                    [v19 addObject:v24];
                  }
                }

                id v21 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
              }

              while (v21);
            }

            id v25 = [v19 count];

            BOOL v26 = v15 == v34;
            if (v15 == v34)
            {
              int64_t v14 = (int64_t)v25;
              id v27 = 0LL;
            }

            else
            {
              id v27 = v25;
            }

            v13 += (uint64_t)v27;
            ++v15;
            __int128 v12 = v33;
          }

          while (!v26);
          goto LABEL_28;
        }
      }

      int64_t v14 = 0LL;
      uint64_t v13 = 0LL;
LABEL_28:
      CFRelease(cf);
      CFRelease(Frame);
      CFRelease(v32);
      goto LABEL_29;
    }

    CGPathRelease(v8);
  }

  uint64_t v13 = 0LL;
  int64_t v14 = 0LL;
LABEL_29:
  int64_t v28 = v13;
  int64_t v29 = v14;
  result.var1 = v29;
  result.var0 = v28;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)rangeOfGlyphsOnLine:(int64_t)a3
{
  if (!-[MRTextRenderer text](self, "text")) {
    goto LABEL_13;
  }
  -[MRTextRenderer _scale](self, "_scale");
  double v6 = v5;
  Mutable = CGPathCreateMutable();
  -[MRTextRenderer _sizeToRendererAt](self, "_sizeToRendererAt");
  double width = v8;
  double v10 = -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  &v23);
  if (width <= 0.0) {
    double width = self->_resolution.width;
  }
  v26.size.double width = width / v6;
  v26.size.CGFloat height = self->_resolution.height / v6;
  v26.origin.CGFloat x = 0.0;
  v26.origin.CGFloat y = 0.0;
  CGPathAddRect(Mutable, 0LL, v26);
  __int128 v11 = CTFramesetterCreateWithAttributedString(v10);
  if (!v11)
  {
    CGPathRelease(Mutable);
    goto LABEL_13;
  }

  __int128 v12 = v11;
  v25.CFIndex location = 0LL;
  v25.length = 0LL;
  Frame = CTFramesetterCreateFrame(v11, v25, Mutable, 0LL);
  CFRelease(v12);
  CGPathRelease(Mutable);
  if (!Frame)
  {
LABEL_13:
    int64_t v16 = 0LL;
    Glyphsize_t Count = 0LL;
    goto LABEL_16;
  }

  Lines = CTFrameGetLines(Frame);
  if (Lines && (CFIndex v15 = Lines, CFArrayGetCount(Lines) > a3))
  {
    int64_t v16 = 0LL;
    if (a3)
    {
      CFIndex v17 = 0LL;
      do
      {
        ValueAtIndeCGFloat x = (const __CTLine *)CFArrayGetValueAtIndex(v15, v17);
        v16 += CTLineGetGlyphCount(ValueAtIndex);
        ++v17;
      }

      while (a3 != v17);
    }

    id v19 = (const __CTLine *)CFArrayGetValueAtIndex(v15, a3);
    Glyphsize_t Count = CTLineGetGlyphCount(v19);
  }

  else
  {
    int64_t v16 = 0LL;
    Glyphsize_t Count = 0LL;
  }

  CFRelease(Frame);
LABEL_16:
  int64_t v21 = v16;
  int64_t v22 = GlyphCount;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)rangeOfGlyphsForWordsInRange:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v4 = self;
  if (-[MRTextRenderer text](self, "text"))
  {
    -[MRTextRenderer _sizeToRendererAt](v4, "_sizeToRendererAt");
    id v5 = -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( v4,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  &v33);
    id v6 = [v5 string];
    id v27 = (char *)[v6 length];
    id v7 = objc_msgSend( v6,  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    double v8 = (char *)[v6 length];
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id obj = v7;
    id v9 = [v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v9)
    {
      id v10 = v9;
      id v24 = v5;
      CFRange v25 = v4;
      __int128 v11 = 0LL;
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v14 = *(void *)v30;
      int64_t v15 = var0 + var1;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(obj);
          }
          CFIndex v17 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          if ([v17 length])
          {
            id v18 = (char *)objc_msgSend(v6, "rangeOfString:options:range:", v17, 2, v11, v8);
            __int128 v11 = &v18[v19];
            if (v12 == var0) {
              uint64_t v13 = v18;
            }
            if (++v12 == v15)
            {
              int64_t v20 = v11 - v13;
              goto LABEL_17;
            }

            double v8 = (char *)(v27 - v11);
          }
        }

        id v10 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v10) {
          continue;
        }
        break;
      }

      int64_t v20 = 0LL;
LABEL_17:
      id v5 = v24;
      id v4 = v25;
    }

    else
    {
      int64_t v20 = 0LL;
      uint64_t v13 = 0LL;
    }

    int64_t v21 = -[MRTextRenderer _glyphIndexForStringIndex:inString:forSize:]( v4,  "_glyphIndexForStringIndex:inString:forSize:",  v13,  v5,  v33,  v34);
    int64_t v22 = (char *)((_BYTE *)-[MRTextRenderer _glyphIndexForStringIndex:inString:forSize:]( v4,  "_glyphIndexForStringIndex:inString:forSize:",  &v13[v20],  v5,  v33,  v34)
                 - v21);
  }

  else
  {
    int64_t v21 = 0LL;
    int64_t v22 = 0LL;
  }

  int64_t v23 = (int64_t)v21;
  result.int64_t var1 = (int64_t)v22;
  result.int64_t var0 = v23;
  return result;
}

- (CGContext)retainedContextOfWordsInRange:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v4 = self;
  if (!-[MRTextRenderer text](self, "text")) {
    return 0LL;
  }
  -[MRTextRenderer _sizeToRendererAt](v4, "_sizeToRendererAt");
  id v5 = -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( v4,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  v33);
  id v6 = [v5 string];
  id v27 = (char *)[v6 length];
  id v7 = objc_msgSend( v6,  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  double v8 = (char *)[v6 length];
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v7;
  id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    id v24 = v5;
    CFRange v25 = v4;
    __int128 v11 = 0LL;
    uint64_t v12 = 0LL;
    CFIndex v13 = 0LL;
    uint64_t v14 = *(void *)v30;
    int64_t v15 = var0 + var1;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        CFIndex v17 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        if ([v17 length])
        {
          id v18 = (char *)objc_msgSend(v6, "rangeOfString:options:range:", v17, 2, v11, v8);
          __int128 v11 = &v18[v19];
          if (v12 == var0) {
            CFIndex v13 = (CFIndex)v18;
          }
          if (++v12 == v15)
          {
            v20.length = (CFIndex)&v11[-v13];
            goto LABEL_17;
          }

          double v8 = (char *)(v27 - v11);
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    v20.length = 0LL;
LABEL_17:
    id v5 = v24;
    id v4 = v25;
  }

  else
  {
    v20.length = 0LL;
    CFIndex v13 = 0LL;
  }

  v20.CFIndex location = v13;
  CFAttributedStringRef v22 = CFAttributedStringCreateWithSubstring(kCFAllocatorDefault, (CFAttributedStringRef)v5, v20);
  -[MRTextRenderer _sizeOfString:](v4, "_sizeOfString:", v22);
  int64_t v21 = -[MRTextRenderer _retainedContextFromAttributedString:withSize:]( v4,  "_retainedContextFromAttributedString:withSize:",  v22);

  return v21;
}

- (CGPoint)originOfWordAtIndex:(int64_t)a3
{
  if (-[MRTextRenderer text](self, "text"))
  {
    -[MRTextRenderer _sizeToRendererAt](self, "_sizeToRendererAt");
    CFRange v20 = self;
    id v19 = -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  v27);
    id v4 = [v19 string];
    int64_t v21 = [v4 length];
    id v5 = objc_msgSend( v4,  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    id v6 = [v4 length];
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      id v9 = 0LL;
      id v10 = 0LL;
      uint64_t v11 = 0LL;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v5);
          }
          uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          if ([v14 length])
          {
            int64_t v15 = objc_msgSend(v4, "rangeOfString:options:range:", v14, 2, v10, v6);
            id v9 = v15;
            if (v11 == a3) {
              goto LABEL_15;
            }
            id v10 = &v15[v16];
            id v6 = (id)(v21 - &v15[v16]);
            ++v11;
          }
        }

        id v8 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v8);
    }

    else
    {
      id v9 = 0LL;
    }

- (int64_t)countOfGlyphs
{
  CTFramesetterRef v3 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)-[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  v18));
  if (!v3) {
    return 0LL;
  }
  id v4 = v3;
  -[MRTextRenderer _scale](self, "_scale");
  double v6 = v5;
  Mutable = CGPathCreateMutable();
  v20.size.double width = v18[0] / v6;
  v20.size.CGFloat height = 30000.0;
  v20.origin.double x = 0.0;
  v20.origin.double y = 0.0;
  CGPathAddRect(Mutable, 0LL, v20);
  v19.CFIndex location = 0LL;
  v19.length = 0LL;
  Frame = CTFramesetterCreateFrame(v4, v19, Mutable, 0LL);
  if (Frame)
  {
    id v9 = Frame;
    Lines = CTFrameGetLines(Frame);
    if (Lines && (uint64_t v11 = Lines, Count = CFArrayGetCount(Lines), Count >= 1))
    {
      CFIndex v13 = Count;
      int64_t v14 = 0LL;
      for (CFIndex i = 0LL; i != v13; ++i)
      {
        ValueAtIndedouble x = (const __CTLine *)CFArrayGetValueAtIndex(v11, i);
        v14 += CTLineGetGlyphCount(ValueAtIndex);
      }
    }

    else
    {
      int64_t v14 = 0LL;
    }

    CFRelease(v9);
  }

  else
  {
    int64_t v14 = 0LL;
  }

  CFRelease(Mutable);
  CFRelease(v4);
  return v14;
}

- (CGContext)retainedContextOfGlyphAtIndex:(int64_t)a3
{
  id v4 = (char *)-[MRTextRenderer rangeOfStringForGlyphIndex:](self, "rangeOfStringForGlyphIndex:", a3);
  CFIndex v6 = v5;
  -[MRTextRenderer _sizeToRendererAt](self, "_sizeToRendererAt");
  v13[0] = v7;
  v13[1] = v8;
  id v9 = -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  v13);
  if (v4 <= -[__CFAttributedString length](v9, "length") && &v4[v6] <= -[__CFAttributedString length](v9, "length"))
  {
    v14.CFIndex location = (CFIndex)v4;
    v14.length = v6;
    CFAttributedStringRef v10 = CFAttributedStringCreateWithSubstring(kCFAllocatorDefault, v9, v14);
  }

  else
  {
    CFAttributedStringRef v10 = 0LL;
  }

  if (-[__CFAttributedString length](v10, "length"))
  {
    -[MRTextRenderer _sizeOfString:](self, "_sizeOfString:", v10);
    uint64_t v11 = -[MRTextRenderer _retainedContextFromAttributedString:withSize:]( self,  "_retainedContextFromAttributedString:withSize:",  v10);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)rangeOfStringForGlyphIndex:(int64_t)a3
{
  CTFramesetterRef v5 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)-[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  v46));
  if (v5)
  {
    CFIndex v6 = v5;
    -[MRTextRenderer _scale](self, "_scale");
    double v8 = v7;
    Mutable = CGPathCreateMutable();
    v50.size.double width = v46[0] / v8;
    v50.size.CGFloat height = 30000.0;
    v50.origin.double x = 0.0;
    v50.origin.double y = 0.0;
    CGPathAddRect(Mutable, 0LL, v50);
    v48.CFIndex location = 0LL;
    v48.length = 0LL;
    Frame = CTFramesetterCreateFrame(v6, v48, Mutable, 0LL);
    if (Frame)
    {
      uint64_t v11 = Frame;
      Lines = CTFrameGetLines(Frame);
      __int128 v36 = Mutable;
      __int128 v37 = v6;
      cf = v11;
      if (Lines && (CFIndex v13 = Lines, v39 = CFArrayGetCount(Lines), v39 >= 1))
      {
        int64_t v42 = a3;
        CFRange v43 = 0LL;
        int64_t v14 = 0LL;
        CFIndex v15 = 0LL;
        uint64_t v16 = 1LL;
        __int128 v38 = v13;
        do
        {
          ValueAtIndedouble x = (const __CTLine *)CFArrayGetValueAtIndex(v13, v15);
          int64_t v18 = CTLineGetGlyphCount(ValueAtIndex) + v14;
          int64_t v40 = v18;
          CFIndex v41 = v15;
          if (v14 <= a3 && v18 > a3)
          {
            GlyphRuns = CTLineGetGlyphRuns(ValueAtIndex);
            if (GlyphRuns)
            {
              CGRect v20 = GlyphRuns;
              CFIndex Count = CFArrayGetCount(GlyphRuns);
              if (Count >= 1)
              {
                CFIndex v21 = 0LL;
                int64_t v44 = v20;
                do
                {
                  int64_t v22 = v14;
                  __int128 v23 = (const __CTRun *)CFArrayGetValueAtIndex(v20, v21);
                  GlyphCFIndex Count = CTRunGetGlyphCount(v23);
                  CFRange StringRange = CTRunGetStringRange(v23);
                  v14 += GlyphCount;
                  CFIndex v26 = a3 - v22;
                  if (a3 >= v22 && v14 > a3)
                  {
                    char Status = CTRunGetStatus(v23);
                    StringIndicesPtr = CTRunGetStringIndicesPtr(v23);
                    __int128 v29 = (CFIndex *)StringIndicesPtr;
                    if (!StringIndicesPtr)
                    {
                      __int128 v29 = (CFIndex *)malloc(8 * GlyphCount);
                      v49.CFIndex location = 0LL;
                      v49.length = GlyphCount;
                      CTRunGetStringIndices(v23, v49, v29);
                    }

                    if ((Status & 1) != 0) {
                      CFIndex v30 = GlyphCount + ~v26;
                    }
                    else {
                      CFIndex v30 = v26;
                    }
                    if (v26 >= GlyphCount - 1)
                    {
                      CFIndex v32 = StringRange.location + StringRange.length;
                    }

                    else
                    {
                      uint64_t v31 = GlyphCount + ~v26 - 1;
                      if ((Status & 1) == 0) {
                        uint64_t v31 = v26 + 1;
                      }
                      CFIndex v32 = v29[v31];
                    }

                    uint64_t v33 = v32 - v29[v30];
                    CFRange v43 = (const __CTFramesetter *)v29[v30];
                    if (StringIndicesPtr)
                    {
                      uint64_t v16 = v33;
                    }

                    else
                    {
                      uint64_t v16 = v33;
                      free(v29);
                    }

                    a3 = v42;
                  }

                  ++v21;
                  CGRect v20 = v44;
                }

                while (Count != v21);
              }
            }
          }

          int64_t v14 = v40;
          CFIndex v15 = v41 + 1;
          CFIndex v13 = v38;
        }

        while (v41 + 1 != v39);
      }

      else
      {
        CFRange v43 = 0LL;
        uint64_t v16 = 1LL;
      }

      CFRelease(cf);
      Mutable = v36;
      CFIndex v6 = v37;
    }

    else
    {
      CFRange v43 = 0LL;
      uint64_t v16 = 1LL;
    }

    CFRelease(Mutable);
    CFRelease(v6);
    CTFramesetterRef v5 = v43;
  }

  else
  {
    uint64_t v16 = 1LL;
  }

  int64_t v34 = v16;
  result.int64_t var1 = v34;
  result.int64_t var0 = (int64_t)v5;
  return result;
}

- (int64_t)glyphIndexForStringIndex:(int64_t)a3
{
  id v5 = -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  v7);
  return -[MRTextRenderer _glyphIndexForStringIndex:inString:forSize:]( self,  "_glyphIndexForStringIndex:inString:forSize:",  a3,  v5,  v7[0],  v7[1]);
}

- (int64_t)_glyphIndexForStringIndex:(int64_t)a3 inString:(id)a4 forSize:(CGSize)a5
{
  double width = a5.width;
  CTFramesetterRef v8 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)a4);
  if (!v8) {
    return 0LL;
  }
  id v9 = v8;
  -[MRTextRenderer _scale](self, "_scale");
  double v11 = v10;
  Mutable = CGPathCreateMutable();
  v48.size.double width = width / v11;
  v48.size.CGFloat height = 30000.0;
  v48.origin.double x = 0.0;
  v48.origin.double y = 0.0;
  CGPathAddRect(Mutable, 0LL, v48);
  v46.CFIndex location = 0LL;
  v46.length = 0LL;
  Frame = CTFramesetterCreateFrame(v9, v46, Mutable, 0LL);
  if (Frame)
  {
    int64_t v14 = Frame;
    Lines = CTFrameGetLines(Frame);
    CFIndex v39 = Mutable;
    int64_t v40 = v9;
    cf = v14;
    if (Lines)
    {
      uint64_t v16 = Lines;
      CFIndex Count = CFArrayGetCount(Lines);
      if (Count >= 1)
      {
        int64_t v17 = 0LL;
        CFIndex v18 = 0LL;
        CFIndex v19 = 0LL;
        CFIndex v41 = v16;
        while (1)
        {
          ValueAtIndedouble x = (const __CTLine *)CFArrayGetValueAtIndex(v16, v19);
          GlyphCFIndex Count = CTLineGetGlyphCount(ValueAtIndex);
          CFRange StringRange = CTLineGetStringRange(ValueAtIndex);
          CFIndex v44 = v19;
          CFIndex v45 = v18;
          CFIndex v43 = GlyphCount;
          if (StringRange.location <= a3 && StringRange.location + StringRange.length > a3)
          {
            GlyphRuns = CTLineGetGlyphRuns(ValueAtIndex);
            if (GlyphRuns)
            {
              __int128 v24 = GlyphRuns;
              CFIndex v25 = CFArrayGetCount(GlyphRuns);
              if (v25 >= 1) {
                break;
              }
            }
          }

- (CGPoint)originOfGlyphAtIndex:(int64_t)a3
{
  if (self->_lastGlyphIndex >= a3)
  {
    -[MRTextRenderer _scale](self, "_scale");
    double v8 = v7;
    Mutable = CGPathCreateMutable();
    -[MRTextRenderer _sizeToRendererAt](self, "_sizeToRendererAt");
    v31[0] = v10;
    v31[1] = v11;
    uint64_t v12 = -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  v31);
    double width = v31[0];
    if (v31[0] <= 0.0) {
      double width = self->_resolution.width;
    }
    v36.size.double width = width / v8;
    v36.size.CGFloat height = self->_resolution.height / v8;
    v36.origin.double x = 0.0;
    v36.origin.double y = 0.0;
    CGPathAddRect(Mutable, 0LL, v36);
    int64_t v14 = CTFramesetterCreateWithAttributedString(v12);
    v32.CFIndex location = 0LL;
    v32.length = 0LL;
    Frame = CTFramesetterCreateFrame(v14, v32, Mutable, 0LL);
    Lines = CTFrameGetLines(Frame);
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    CFIndex Count = CFArrayGetCount(Lines);
    if (Count)
    {
      uint64_t v18 = Count;
      v33.CFIndex location = Count - 1;
      v33.length = 1LL;
      CTFrameGetLineOrigins(Frame, v33, &v30);
      if (v18 >= 1)
      {
        CFIndex v19 = 0LL;
        int64_t v20 = 0LL;
        double v21 = v30.y;
        while (1)
        {
          ValueAtIndedouble x = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v19);
          GlyphCFIndex Count = CTLineGetGlyphCount(ValueAtIndex);
          if (v20 <= a3 && GlyphCount + v20 > a3) {
            break;
          }
          ++v19;
          v20 += GlyphCount;
          if (v18 == v19) {
            goto LABEL_16;
          }
        }

        v34.CFIndex location = v19;
        v34.length = 1LL;
        CTFrameGetLineOrigins(Frame, v34, &v30);
        id v24 = -[MRTextRenderer rangeOfStringForGlyphIndex:](self, "rangeOfStringForGlyphIndex:", a3);
        double v25 = v30.x;
        double x = v25 + CTLineGetOffsetForStringIndex(ValueAtIndex, (CFIndex)v24, 0LL);
        double y = v30.y - v21;
      }

- (CGRect)frameOfLineWithGlyphAtIndex:(int64_t)a3 range:(_NSRange *)a4
{
  lastGlyphIndedouble x = self->_lastGlyphIndex;
  if (lastGlyphIndex >= a3)
  {
    uint64_t v12 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)-[MRTextRenderer text](self, "text"));
    -[MRTextRenderer _scale](self, "_scale");
    double v14 = v13;
    Mutable = CGPathCreateMutable();
    -[MRTextRenderer _sizeToRendererAt](self, "_sizeToRendererAt");
    if (width <= 0.0) {
      double width = self->_resolution.width;
    }
    v57.size.double width = width / v14;
    v57.size.double height = self->_resolution.height / v14;
    double v17 = 0.0;
    v57.origin.double x = 0.0;
    v57.origin.double y = 0.0;
    CGPathAddRect(Mutable, 0LL, v57);
    v54.CFIndex location = 0LL;
    v54.length = 0LL;
    Frame = CTFramesetterCreateFrame(v12, v54, Mutable, 0LL);
    Lines = CTFrameGetLines(Frame);
    CFIndex Count = CFArrayGetCount(Lines);
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double v23 = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    if (Lines)
    {
      uint64_t v25 = Count;
      v55.CFIndex location = Count - 1;
      v55.length = 1LL;
      CTFrameGetLineOrigins(Frame, v55, &origins);
      if (v25 >= 1)
      {
        CGRect v48 = v12;
        int64_t v26 = 0LL;
        CFIndex v27 = 0LL;
        double v28 = origins.y;
        while (1)
        {
          ValueAtIndedouble x = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v27);
          GlyphCFIndex Count = CTLineGetGlyphCount(ValueAtIndex);
          ++v27;
          v26 += GlyphCount;
          if (v25 == v27)
          {
            uint64_t v12 = v48;
            goto LABEL_20;
          }
        }

        a4->CFIndex location = v26;
        a4->length = GlyphCount;
        v56.CFIndex location = v27;
        v56.length = 1LL;
        CTFrameGetLineOrigins(Frame, v56, &origins);
        double x = origins.x;
        double v31 = origins.y;
        CFRange StringRange = CTLineGetStringRange(ValueAtIndex);
        CFRange v33 = -[NSAttributedString string](-[MRTextRenderer text](self, "text"), "string");
        NSUInteger v34 = -[NSAttributedString length](-[MRTextRenderer text](self, "text"), "length");
        if (StringRange.length + StringRange.location - 1 >= v34 - 1) {
          CFIndex v35 = v34 - 1;
        }
        else {
          CFIndex v35 = StringRange.length + StringRange.location - 1;
        }
        double TrailingWhitespaceWidth = 0.0;
        double y = v31 - v28;
        double TypographicBounds = CTLineGetTypographicBounds(ValueAtIndex, &ascent, &descent, &leading);
        double v38 = ascent + descent;
        double v39 = leading;
        uint64_t v12 = v49;
        if (-[NSString characterAtIndex:]( -[NSAttributedString string](-[MRTextRenderer text](self, "text"), "string"),  "characterAtIndex:",  (char *)-[NSAttributedString length](-[MRTextRenderer text](self, "text"), "length") - 1) == 10) {
          double y = y + ascent + descent + leading;
        }
        double v23 = TypographicBounds - TrailingWhitespaceWidth;
        double height = v38 + v39;
      }
    }

- (CGSize)_sizeOfString:(id)a3
{
  if (!a3 || ![a3 length]) {
    goto LABEL_37;
  }
  id v5 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)a3);
  Mutable = CGPathCreateMutable();
  -[MRTextRenderer _scale](self, "_scale");
  double v8 = v7;
  double width = self->_definedSize.width;
  if (width <= 0.0) {
    double width = self->_resolution.width;
  }
  v59.size.double width = width / v8;
  v59.size.double height = 30000.0;
  double v10 = 0.0;
  v59.origin.CGFloat x = 0.0;
  v59.origin.CGFloat y = 0.0;
  CGPathAddRect(Mutable, 0LL, v59);
  v56.CFIndex location = 0LL;
  v56.length = 0LL;
  Frame = CTFramesetterCreateFrame(v5, v56, Mutable, 0LL);
  if (!Frame)
  {
    CFRelease(Mutable);
    CFRelease(v5);
LABEL_37:
    double v42 = CGSizeZero.width;
    double height = CGSizeZero.height;
    goto LABEL_43;
  }

  uint64_t v12 = Frame;
  cf = Mutable;
  CGRect v50 = v5;
  CGRect v48 = self;
  Path = CTFrameGetPath(Frame);
  BoundingBoCGFloat x = CGPathGetBoundingBox(Path);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  double v16 = BoundingBox.size.width;
  CGFloat v17 = BoundingBox.size.height;
  Lines = CTFrameGetLines(v12);
  CFIndex Count = CFArrayGetCount(Lines);
  double v20 = 0.0;
  CFIndex v21 = Count - 1;
  if (Count >= 1)
  {
    CFIndex v22 = Count;
    for (CFIndex i = 0LL; i != v22; ++i)
    {
      ValueAtIndeCGFloat x = (const __CTLine *)CFArrayGetValueAtIndex(Lines, i);
      CFRange StringRange = CTLineGetStringRange(ValueAtIndex);
      double TrailingWhitespaceWidth = 0.0;
      if ((objc_msgSend( objc_msgSend(a3, "string"),  "isEqualToString:",  @"                                      ") & 1) == 0)
      {
        id v51 = [a3 string];
        CFIndex v27 = (char *)[a3 length];
        uint64_t v28 = StringRange.length + StringRange.location - 1 >= (unint64_t)(v27 - 1)
      }

      double v29 = CTLineGetTypographicBounds(ValueAtIndex, &ascent, &descent, &leading) - TrailingWhitespaceWidth;
      int v30 = 0;
      if ((objc_msgSend( objc_msgSend(a3, "string"),  "isEqualToString:",  @"                                      ") & 1) == 0 && v29 > v16)
      {
        id v31 = [a3 string];
        CFRange v32 = (char *)[a3 length];
        else {
          CFIndex v33 = StringRange.length + StringRange.location - 1;
        }
        if (objc_msgSend(v31, "characterAtIndex:", v33, v48) == 32)
        {
          double v29 = v29 - CTLineGetTrailingWhitespaceWidth(ValueAtIndex);
          int v30 = 1;
        }

        else
        {
          int v30 = 0;
        }
      }

      if (v29 > v20) {
        double v20 = v29;
      }
      if (v21 == i)
      {
        v57.CFIndex location = v21;
        v57.length = 1LL;
        CTFrameGetLineOrigins(v12, v57, &origins);
        v61.origin.CGFloat x = x;
        v61.origin.CGFloat y = y;
        v61.size.double width = v16;
        v61.size.double height = v17;
        double v34 = CGRectGetMaxY(v61) - origins.y + descent;
        double v35 = leading;
        if (v22 == 1) {
          double v35 = -0.0;
        }
        double v10 = v34 + v35;
        if (((objc_msgSend( objc_msgSend(a3, "string", v48),  "characterAtIndex:",  (char *)objc_msgSend(a3, "length") - 1) != 10) & ~v30) == 0) {
          double v10 = v10 + ascent + descent + leading;
        }
      }
    }
  }

  CFRelease(cf);
  CFRelease(v12);
  CFRelease(v50);
  Attribute = (const __CTParagraphStyle *)CFAttributedStringGetAttribute( (CFAttributedStringRef)a3,  0LL,  kCTParagraphStyleAttributeName,  0LL);
  if (Attribute)
  {
    origins.CGFloat x = 0.0;
    BOOL ValueForSpecifier = CTParagraphStyleGetValueForSpecifier( Attribute,  kCTParagraphStyleSpecifierFirstLineHeadIndent,  8uLL,  &origins);
    double v38 = origins.x;
    if (!ValueForSpecifier) {
      double v38 = -0.0;
    }
    double v20 = v20 + v38;
  }

  double v39 = (double *)v48;
  if (objc_msgSend(a3, "length", v48))
  {
    [v39 _shadowSizeOffsetForString:a3];
  }

  else
  {
    double v40 = CGSizeZero.width;
    double v41 = CGSizeZero.height;
  }

  float v44 = v8 * (v20 + v40);
  float v45 = ceilf(v44);
  float v46 = v8 * (v10 + v41);
  double height = ceilf(v46);
  double v47 = v39[5];
  if (v47 <= 0.0) {
    double v47 = v39[7];
  }
  double v42 = v45;
  if (v47 < height) {
    double height = v47;
  }
LABEL_43:
  result.double height = height;
  result.double width = v42;
  return result;
}

- (int64_t)numberOfLines
{
  return -[MRTextRenderer _numberOfLinesInString:]( self,  "_numberOfLinesInString:",  -[MRTextRenderer text](self, "text"));
}

- (int64_t)numberOfLinesForTruncatedText
{
  return -[MRTextRenderer _numberOfLinesInString:]( self,  "_numberOfLinesInString:",  -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  &v3,  self->_definedSize.width,  self->_definedSize.height));
}

- (id)truncatedText
{
  return -[MRTextRenderer _truncateTextToFitInSize:fromCenter:outSize:]( self,  "_truncateTextToFitInSize:fromCenter:outSize:",  0LL,  &v3,  self->_definedSize.width,  self->_definedSize.height);
}

- (int64_t)_numberOfLinesInString:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  Mutable = CGPathCreateMutable();
  double v6 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)a3);
  -[MRTextRenderer _scale](self, "_scale");
  double width = self->_definedSize.width;
  if (width <= 0.0) {
    double width = self->_resolution.width;
  }
  v21.size.double width = width / v7;
  v21.size.double height = self->_resolution.height / v7;
  v21.origin.CGFloat x = 0.0;
  v21.origin.CGFloat y = 0.0;
  CGPathAddRect(Mutable, 0LL, v21);
  v20.CFIndex location = 0LL;
  v20.length = 0LL;
  Frame = CTFramesetterCreateFrame(v6, v20, Mutable, 0LL);
  if (Frame)
  {
    double v10 = Frame;
    Lines = CTFrameGetLines(Frame);
    if (Lines)
    {
      uint64_t v12 = Lines;
      CFIndex Count = CFArrayGetCount(Lines);
      if (Count >= 1)
      {
        ValueAtIndeCGFloat x = (const __CTLine *)CFArrayGetValueAtIndex(v12, Count - 1);
        CFRange StringRange = CTLineGetStringRange(ValueAtIndex);
        if (StringRange.location + StringRange.length < (unint64_t)[a3 length]
          || ((id v16 = [a3 string],
               CGFloat v17 = (char *)[a3 length],
               StringRange.location + StringRange.length - 1 >= (unint64_t)(v17 - 1))
            ? (CFIndex v18 = (CFIndex)(v17 - 1))
            : (CFIndex v18 = StringRange.location + StringRange.length - 1),
              [v16 characterAtIndex:v18] == 10))
        {
          ++Count;
        }
      }
    }

    else
    {
      CFIndex Count = 0LL;
    }

    CFRelease(v10);
  }

  else
  {
    CFIndex Count = 0LL;
  }

  CFRelease(v6);
  CFRelease(Mutable);
  return Count;
}

- (CGSize)shadowOffset
{
  if (-[NSAttributedString length](-[MRTextRenderer text](self, "text"), "length"))
  {
    -[MRTextRenderer _scale](self, "_scale");
    double v4 = v3;
    Attribute = (void *)CFAttributedStringGetAttribute( (CFAttributedStringRef)-[MRTextRenderer text](self, "text"),  0LL,  @"shadow",  0LL);
    if (Attribute)
    {
      double v6 = Attribute;
      objc_msgSend(objc_msgSend(Attribute, "objectForKey:", @"offset"), "CGSizeValue");
      double width = v4 * v7;
      double height = v4 * v9;
      objc_msgSend(objc_msgSend(v6, "objectForKey:", @"blurRadius"), "floatValue");
      double v12 = v11 * 0.5;
    }

    else
    {
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
      double v12 = 0.0;
    }

    double v13 = -v12;
    if (width >= 0.0) {
      double v15 = -v12;
    }
    else {
      double v15 = v12;
    }
    double v16 = v15 - width;
    if (width < 0.0) {
      double v13 = v16;
    }
    double v17 = -0.0;
    if (height > 0.0) {
      double v17 = height;
    }
    double v14 = v12 + v17;
  }

  else
  {
    double v13 = CGSizeZero.width;
    double v14 = CGSizeZero.height;
  }

  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)_shadowSizeOffsetForString:(id)a3
{
  id v4 = [a3 length];
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  if (v4)
  {
    Attribute = (void *)CFAttributedStringGetAttribute((CFAttributedStringRef)a3, 0LL, @"shadow", 0LL);
    if (Attribute)
    {
      double v8 = Attribute;
      objc_msgSend(objc_msgSend(Attribute, "objectForKey:", @"blurRadius"), "floatValue");
      double v10 = v9 * 0.5;
      objc_msgSend(objc_msgSend(v8, "objectForKey:", @"offset"), "CGSizeValue");
      double width = CGSizeZero.width + v10 + fabs(v11 + v11);
      double height = height + v10 + fabs(v12 + v12);
    }
  }

  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)squeezeWidthForLineCount:(int64_t)a3
{
  if (-[MRTextRenderer numberOfLines](self, "numberOfLines") <= a3)
  {
    do
    {
      double width = self->_definedSize.width;
      self->_definedSize.double width = width + -5.0;
    }

    while (-[MRTextRenderer numberOfLines](self, "numberOfLines") <= a3);
    self->_definedSize.double width = width;
    -[MRTextRenderer updateLineSpacing](self, "updateLineSpacing");
  }

- (void)updateLineSpacing
{
  if (self->_lineSpacingFactor != 1.0)
  {
    double v3 = (NSAttributedString *)-[NSAttributedString mutableCopy](self->_text, "mutableCopy");
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    int64_t v4 = -[MRTextRenderer numberOfLines](self, "numberOfLines");
    if (v4)
    {
      int64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        double v7 = -[NSAttributedString attribute:atIndex:effectiveRange:]( v3,  "attribute:atIndex:effectiveRange:",  kCTParagraphStyleAttributeName,  -[MRTextRenderer rangeOfGlyphsOnLine:](self, "rangeOfGlyphsOnLine:", i),  &v18);
        if (v7)
        {
          double v8 = v7;
          if (CTParagraphStyleGetValueForSpecifier(v7, kCTParagraphStyleSpecifierAlignment, 1uLL, &valueBuffer))
          {
            settings[0].spec = kCTParagraphStyleSpecifierAlignment;
            uint64_t v9 = 1LL;
            settings[0].valueSize = 1LL;
            settings[0].value = &valueBuffer;
          }

          else
          {
            uint64_t v9 = 0LL;
          }

          double v16 = 0.0;
          if (CTParagraphStyleGetValueForSpecifier(v8, kCTParagraphStyleSpecifierFirstLineHeadIndent, 8uLL, &v16))
          {
            double v10 = &settings[v9];
            v10->spec = kCTParagraphStyleSpecifierFirstLineHeadIndent;
            ++v9;
            v10->valueSize = 8LL;
            v10->value = &v16;
          }

          uint64_t v15 = 0LL;
          if (CTParagraphStyleGetValueForSpecifier(v8, kCTParagraphStyleSpecifierHeadIndent, 8uLL, &v15))
          {
            double v11 = &settings[v9];
            v11->spec = kCTParagraphStyleSpecifierHeadIndent;
            ++v9;
            v11->valueSize = 8LL;
            v11->value = &v15;
          }
        }

        else
        {
          uint64_t v9 = 0LL;
        }

        if (i) {
          double lineSpacingFactor = self->_lineSpacingFactor;
        }
        else {
          double lineSpacingFactor = 1.0;
        }
        double v16 = lineSpacingFactor;
        double v13 = &settings[v9];
        v13->spec = kCTParagraphStyleSpecifierLineHeightMultiple;
        v13->valueSize = 8LL;
        v13->value = &v16;
        CTParagraphStyleRef v14 = CTParagraphStyleCreate(settings, v9 + 1);
        -[NSAttributedString addAttribute:value:range:]( v3,  "addAttribute:value:range:",  kCTParagraphStyleAttributeName,  v14,  v18,  v19);
        CFRelease(v14);
      }
    }

    self->_text = v3;
  }

- (id)_truncateTextToFitInSize:(CGSize)a3 fromCenter:(BOOL)a4 outSize:(CGSize *)a5
{
  double height = a3.height;
  double width = a3.width;
  if (self->_originalCacheSize.width == a3.width && self->_originalCacheSize.height == a3.height)
  {
    *a5 = self->_cachedSize;
    return self->_cachedText;
  }

  else
  {
    BOOL v10 = a4;
    if (a5) {
      *a5 = a3;
    }
    double v11 = -[MRTextRenderer text](self, "text");
    double v12 = -[NSAttributedString length](v11, "length");
    if (v12) {
      double v12 = -[MRTextRenderer _glyphIndexForStringIndex:inString:forSize:]( self,  "_glyphIndexForStringIndex:inString:forSize:",  v12 - 1,  v11,  width,  height);
    }
    self->_lastGlyphIndeCGFloat x = (int64_t)v12;
    if (!self->_truncate) {
      return -[MRTextRenderer text](self, "text");
    }
    int64_t v13 = -[MRTextRenderer numberOfLines](self, "numberOfLines");
    int64_t v14 = -[MRTextRenderer maxNumberOfLines](self, "maxNumberOfLines");
    uint64_t v15 = -[MRTextRenderer text](self, "text");
    if (v13 <= v14)
    {
      return v15;
    }

    else
    {
      if (-[NSString isEqualToString:]( -[NSAttributedString string](v15, "string"),  "isEqualToString:",  @"                                      "))
      {
        return -[MRTextRenderer text](self, "text");
      }

      id v17 = -[NSAttributedString mutableCopy](v11, "mutableCopy");
      uint64_t v18 = (NSAttributedString *)-[NSAttributedString mutableCopy](v11, "mutableCopy");
      uint64_t v19 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  @"...",  -[NSAttributedString attributesAtIndex:effectiveRange:]( v11,  "attributesAtIndex:effectiveRange:",  0LL,  0LL));
      int64_t v20 = -[NSAttributedString length](v11, "length");
      if ([v17 length] && (v20 & 0x8000000000000000) == 0)
      {
        uint64_t v21 = 0LL;
        do
        {
          unint64_t v22 = (unint64_t)[v17 length];
          if (v10) {
            double v23 = (char *)(v22 >> 1);
          }
          else {
            double v23 = (char *)(v22 - 1);
          }
          id v24 = objc_msgSend(objc_msgSend(v17, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v23);
          objc_msgSend(v17, "deleteCharactersInRange:", v24, v25);
          -[NSAttributedString setAttributedString:](v18, "setAttributedString:", v17);
          -[NSAttributedString insertAttributedString:atIndex:](v18, "insertAttributedString:atIndex:", v19, v24);
          uint64_t v26 = -[MRTextRenderer _numberOfLinesInString:](self, "_numberOfLinesInString:", v18);
          if (v26 <= -[MRTextRenderer maxNumberOfLines](self, "maxNumberOfLines")) {
            break;
          }
          if (![v17 length]) {
            break;
          }
        }

        while (v21++ < v20);
        double v11 = v18;
      }

      if (-[NSString hasSuffix:](-[NSAttributedString string](v11, "string"), "hasSuffix:", @"...")) {
        double v11 = (NSAttributedString *)-[NSAttributedString mutableCopy](v11, "mutableCopy");
      }
      -[MRTextRenderer _sizeOfString:](self, "_sizeOfString:", v11);
      double v30 = v28;
      double v31 = v29;
      if (a5)
      {
        a5->double width = v28;
        a5->double height = v29;
      }

      CFRange v32 = -[NSAttributedString length](v11, "length");
      if (v32) {
        CFRange v32 = -[MRTextRenderer _glyphIndexForStringIndex:inString:forSize:]( self,  "_glyphIndexForStringIndex:inString:forSize:",  v32 - 1,  v11,  v30,  v31);
      }
      self->_lastGlyphIndeCGFloat x = (int64_t)v32;
    }
  }

  return v11;
}

- (void)trimWhitespace
{
  double v3 = -[NSString stringByTrimmingCharactersInSet:]( -[NSAttributedString string](self->_text, "string"),  "stringByTrimmingCharactersInSet:",  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  int64_t v4 = -[NSMutableAttributedString initWithAttributedString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithAttributedString:",  self->_text);
  -[NSMutableAttributedString replaceCharactersInRange:withString:]( v4,  "replaceCharactersInRange:withString:",  0LL,  -[NSAttributedString length](self->_text, "length"),  v3);
  -[MRTextRenderer setText:](self, "setText:", v4);
}

- (NSAttributedString)placeholderText
{
  return self->_placeholderText;
}

- (CGSize)resolution
{
  double width = self->_resolution.width;
  double height = self->_resolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)maxNumberOfLines
{
  return self->_maxNumberOfLines;
}

- (void)setMaxNumberOfLines:(int64_t)a3
{
  self->_maxNumberOfLines = a3;
}

- (BOOL)truncate
{
  return self->_truncate;
}

- (void)setTruncate:(BOOL)a3
{
  self->_truncate = a3;
}

- (CGSize)definedSize
{
  double width = self->_definedSize.width;
  double height = self->_definedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDefinedSize:(CGSize)a3
{
  self->_definedSize = a3;
}

- (BOOL)renderAtDefinedSize
{
  return self->_renderAtDefinedSize;
}

- (void)setRenderAtDefinedSize:(BOOL)a3
{
  self->_renderAtDefinedSize = a3;
}

- (double)lineSpacingFactor
{
  return self->_lineSpacingFactor;
}

- (void)setLineSpacingFactor:(double)a3
{
  self->_double lineSpacingFactor = a3;
}

- (CGSize)inset
{
  double width = self->_inset.width;
  double height = self->_inset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInset:(CGSize)a3
{
  self->_inset = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int64_t)columnCount
{
  return self->_columnCount;
}

- (void)setColumnCount:(int64_t)a3
{
  self->_unint64_t columnCount = a3;
}

- (double)columnMargin
{
  return self->_columnMargin;
}

- (void)setColumnMargin:(double)a3
{
  self->_double columnMargin = a3;
}

- (double)extraFooter
{
  return self->_extraFooter;
}

- (void)setExtraFooter:(double)a3
{
  self->_double extraFooter = a3;
}

- (BOOL)centerVertically
{
  return self->_centerVertically;
}

- (void)setCenterVertically:(BOOL)a3
{
  self->_centerVerticallCGFloat y = a3;
}

- (CGRect)imageRect
{
  double x = self->_imageRect.origin.x;
  double y = self->_imageRect.origin.y;
  double width = self->_imageRect.size.width;
  double height = self->_imageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImageRect:(CGRect)a3
{
  self->_imageRect = a3;
}

- (id)_invertRect:(CGRect)a3 inRect:(CGRect)a4
{
  double width = a4.size.width;
  double height = a3.size.height;
  double v6 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v9 = a3.size.width <= a3.size.height;
  double v10 = a3.origin.y + a3.size.height;
  double v11 = a4.size.height - (a3.origin.y + a3.size.height);
  if (a3.size.width > a3.size.height) {
    double v12 = x;
  }
  else {
    double v12 = a4.origin.x;
  }
  if (v9) {
    double v13 = a4.origin.y;
  }
  else {
    double v13 = a3.origin.y + a3.size.height;
  }
  if (v9) {
    double v14 = a4.size.width;
  }
  else {
    double v14 = v6;
  }
  if (v9) {
    double v15 = y;
  }
  else {
    double v15 = v11;
  }
  if (v9) {
    double v16 = v10;
  }
  else {
    double v16 = a4.origin.y;
  }
  if (v9) {
    double v17 = v11;
  }
  else {
    double v17 = y;
  }
  if (v6 < height) {
    double v18 = a4.origin.x;
  }
  else {
    double v18 = v12;
  }
  if (v6 < height) {
    double v19 = a4.origin.y;
  }
  else {
    double v19 = v13;
  }
  double v46 = a4.origin.x;
  double v47 = v19;
  if (v6 < height) {
    double v20 = width;
  }
  else {
    double v20 = v14;
  }
  if (v6 < height) {
    double v21 = y;
  }
  else {
    double v21 = v15;
  }
  if (v6 < height) {
    double v22 = v10;
  }
  else {
    double v22 = v16;
  }
  if (v6 < height) {
    double v23 = v11;
  }
  else {
    double v23 = v17;
  }
  if (v6 < height) {
    double v24 = y;
  }
  else {
    double v24 = a4.origin.y;
  }
  if (v6 < height) {
    double v25 = height;
  }
  else {
    double v25 = a4.size.height;
  }
  if (v6 < height) {
    double v26 = y;
  }
  else {
    double v26 = a4.origin.y;
  }
  double rect1 = v26;
  double v45 = v24;
  double v27 = v18;
  double v41 = v22;
  CGFloat v42 = v21;
  double v28 = v20;
  double v43 = v23;
  v53.origin.double x = x;
  v53.origin.double y = y;
  v53.size.double width = v6;
  v53.size.double height = height;
  double v48 = v18;
  double v49 = v20;
  if (CGRectIntersectsRect(*(CGRect *)(&v22 - 1), v53))
  {
    double v18 = CGRectZero.origin.x;
    double v41 = CGRectZero.origin.y;
    double v20 = CGRectZero.size.width;
    double v43 = CGRectZero.size.height;
  }

  double v40 = v20;
  double v37 = v18;
  double v29 = x + v6;
  v50.origin.double x = v46;
  v50.origin.double y = rect1;
  v50.size.double width = x;
  v50.size.double height = v25;
  v54.origin.double x = x;
  v54.origin.double y = y;
  v54.size.double width = v6;
  v54.size.double height = height;
  BOOL v30 = CGRectIntersectsRect(v50, v54);
  CGFloat v31 = x;
  CGFloat v32 = v25;
  if (v30)
  {
    double v46 = CGRectZero.origin.x;
    double rect1 = CGRectZero.origin.y;
    CGFloat v31 = CGRectZero.size.width;
    CGFloat v32 = CGRectZero.size.height;
  }

  double v38 = v32;
  double v39 = v31;
  double v33 = width - v29;
  v51.origin.double y = v47;
  v51.origin.double x = v48;
  v51.size.double width = v49;
  double v34 = v42;
  v51.size.double height = v42;
  v55.origin.double x = x;
  v55.origin.double y = y;
  v55.size.double width = v6;
  v55.size.double height = height;
  if (CGRectIntersectsRect(v51, v55))
  {
    double v47 = CGRectZero.origin.y;
    double v48 = CGRectZero.origin.x;
    double v34 = CGRectZero.size.height;
    double v49 = CGRectZero.size.width;
  }

  v52.origin.double x = x + v6;
  v52.origin.double y = v45;
  v52.size.double width = v33;
  v52.size.double height = v25;
  v56.origin.double x = x;
  v56.origin.double y = y;
  v56.size.double width = v6;
  v56.size.double height = height;
  if (CGRectIntersectsRect(v52, v56))
  {
    double v29 = CGRectZero.origin.x;
    double v45 = CGRectZero.origin.y;
    double v33 = CGRectZero.size.width;
    double v25 = CGRectZero.size.height;
  }

  id v35 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (v39 > 0.0 && v38 > 0.0) {
    objc_msgSend( v35,  "addObject:",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v46, rect1, v39, v38));
  }
  if (v33 > 0.0 && v25 > 0.0) {
    objc_msgSend( v35,  "addObject:",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v29, v45, v33, v25));
  }
  if (v40 > 0.0 && v43 > 0.0) {
    objc_msgSend( v35,  "addObject:",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v37, v41, v40, v43));
  }
  if (v49 > 0.0 && v34 > 0.0) {
    objc_msgSend( v35,  "addObject:",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v48, v47, v49, v34));
  }
  return v35;
}

@end