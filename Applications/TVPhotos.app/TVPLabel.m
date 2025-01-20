@interface TVPLabel
- (CGRect)cachedTextRectForBounds;
- (CGRect)previousBounds;
- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4;
- (CGSize)cachedSizeThatFits;
- (CGSize)previousTargetSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVPLabel)initWithFrame:(CGRect)a3;
- (int64_t)previousNumberOfLines;
- (void)_clearCachedValues;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setBaselineAdjustment:(int64_t)a3;
- (void)setCachedSizeThatFits:(CGSize)a3;
- (void)setCachedTextRectForBounds:(CGRect)a3;
- (void)setFont:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setPreviousBounds:(CGRect)a3;
- (void)setPreviousNumberOfLines:(int64_t)a3;
- (void)setPreviousTargetSize:(CGSize)a3;
- (void)setText:(id)a3;
@end

@implementation TVPLabel

- (TVPLabel)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPLabel;
  result = -[TVPLabel initWithFrame:](&v9, "initWithFrame:");
  if (result)
  {
    result->_cachedTextRectForBounds.origin.CGFloat x = x;
    result->_cachedTextRectForBounds.origin.CGFloat y = y;
    result->_cachedTextRectForBounds.size.CGFloat width = width;
    result->_cachedTextRectForBounds.size.CGFloat height = height;
    CGSize size = CGRectZero.size;
    result->_previousBounds.origin = CGRectZero.origin;
    result->_previousBounds.CGSize size = size;
    result->_previousNumberOfLines = 0LL;
    result->_cachedSizeThatFits.CGFloat width = width;
    result->_cachedSizeThatFits.CGFloat height = height;
    result->_previousTargetSize = CGSizeZero;
  }

  return result;
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPLabel;
  -[TVPLabel setText:](&v4, "setText:", a3);
  -[TVPLabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setFont:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPLabel;
  -[TVPLabel setFont:](&v4, "setFont:", a3);
  -[TVPLabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setLineBreakMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPLabel;
  -[TVPLabel setLineBreakMode:](&v4, "setLineBreakMode:", a3);
  -[TVPLabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setNumberOfLines:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPLabel;
  -[TVPLabel setNumberOfLines:](&v4, "setNumberOfLines:", a3);
  -[TVPLabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPLabel;
  -[TVPLabel setAdjustsFontSizeToFitWidth:](&v4, "setAdjustsFontSizeToFitWidth:", a3);
  -[TVPLabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setBaselineAdjustment:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPLabel;
  -[TVPLabel setBaselineAdjustment:](&v4, "setBaselineAdjustment:", a3);
  -[TVPLabel _clearCachedValues](self, "_clearCachedValues");
}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[TVPLabel previousBounds](self, "previousBounds");
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  if (!CGRectEqualToRect(v15, v18)
    || -[TVPLabel previousNumberOfLines](self, "previousNumberOfLines") != a4
    || (-[TVPLabel cachedTextRectForBounds](self, "cachedTextRectForBounds"),
        v19.origin.double x = CGRectZero.origin.x,
        v19.origin.double y = CGRectZero.origin.y,
        v19.size.double width = CGRectZero.size.width,
        v19.size.double height = CGRectZero.size.height,
        CGRectEqualToRect(v16, v19)))
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___TVPLabel;
    -[TVPLabel textRectForBounds:limitedToNumberOfLines:]( &v14,  "textRectForBounds:limitedToNumberOfLines:",  a4,  x,  y,  width,  height);
    -[TVPLabel setCachedTextRectForBounds:](self, "setCachedTextRectForBounds:");
    -[TVPLabel setPreviousBounds:](self, "setPreviousBounds:", x, y, width, height);
    -[TVPLabel setPreviousNumberOfLines:](self, "setPreviousNumberOfLines:", a4);
  }

  -[TVPLabel cachedTextRectForBounds](self, "cachedTextRectForBounds");
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[TVPLabel previousTargetSize](self, "previousTargetSize");
  BOOL v8 = v7 == width && v6 == height;
  if (!v8
    || ((-[TVPLabel cachedSizeThatFits](self, "cachedSizeThatFits"), v10 == CGSizeZero.width)
      ? (BOOL v11 = v9 == CGSizeZero.height)
      : (BOOL v11 = 0),
        v11))
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___TVPLabel;
    -[TVPLabel sizeThatFits:](&v14, "sizeThatFits:", width, height);
    -[TVPLabel setCachedSizeThatFits:](self, "setCachedSizeThatFits:");
    -[TVPLabel setPreviousTargetSize:](self, "setPreviousTargetSize:", width, height);
  }

  -[TVPLabel cachedSizeThatFits](self, "cachedSizeThatFits");
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)_clearCachedValues
{
  CGPoint origin = CGRectZero.origin;
  CGSize size = CGRectZero.size;
  self->_cachedTextRectForBounds.CGPoint origin = CGRectZero.origin;
  self->_cachedTextRectForBounds.CGSize size = size;
  self->_previousBounds.CGPoint origin = origin;
  self->_previousBounds.CGSize size = size;
  self->_previousNumberOfLines = 0LL;
  CGSize v4 = CGSizeZero;
  self->_cachedSizeThatFits = CGSizeZero;
  self->_previousTargetSize = v4;
}

- (CGRect)cachedTextRectForBounds
{
  double x = self->_cachedTextRectForBounds.origin.x;
  double y = self->_cachedTextRectForBounds.origin.y;
  double width = self->_cachedTextRectForBounds.size.width;
  double height = self->_cachedTextRectForBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedTextRectForBounds:(CGRect)a3
{
  self->_cachedTextRectForBounds = a3;
}

- (CGRect)previousBounds
{
  double x = self->_previousBounds.origin.x;
  double y = self->_previousBounds.origin.y;
  double width = self->_previousBounds.size.width;
  double height = self->_previousBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousBounds:(CGRect)a3
{
  self->_previousBounds = a3;
}

- (int64_t)previousNumberOfLines
{
  return self->_previousNumberOfLines;
}

- (void)setPreviousNumberOfLines:(int64_t)a3
{
  self->_previousNumberOfLines = a3;
}

- (CGSize)cachedSizeThatFits
{
  double width = self->_cachedSizeThatFits.width;
  double height = self->_cachedSizeThatFits.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedSizeThatFits:(CGSize)a3
{
  self->_cachedSizeThatFits = a3;
}

- (CGSize)previousTargetSize
{
  double width = self->_previousTargetSize.width;
  double height = self->_previousTargetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousTargetSize:(CGSize)a3
{
  self->_previousTargetSize = a3;
}

@end