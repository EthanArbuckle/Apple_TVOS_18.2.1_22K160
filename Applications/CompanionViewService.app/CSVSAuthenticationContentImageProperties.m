@interface CSVSAuthenticationContentImageProperties
- (CGSize)shadowOffset;
- (CGSize)size;
- (UIColor)shadowColor;
- (double)cornerRadius;
- (double)shadowOpacity;
- (double)shadowRadius;
- (int64_t)contentMode;
- (void)setContentMode:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowRadius:(double)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation CSVSAuthenticationContentImageProperties

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (void).cxx_destruct
{
}

@end