@interface TVSBVideoBulletinAnimationContext
- (CGRect)bulletinFrame;
- (NSAttributedString)chinSubtitle;
- (NSString)chinTitle;
- (UIImage)chinImage;
- (void)setBulletinFrame:(CGRect)a3;
- (void)setChinImage:(id)a3;
- (void)setChinSubtitle:(id)a3;
- (void)setChinTitle:(id)a3;
@end

@implementation TVSBVideoBulletinAnimationContext

- (CGRect)bulletinFrame
{
  double y = self->_bulletinFrame.origin.y;
  double x = self->_bulletinFrame.origin.x;
  double height = self->_bulletinFrame.size.height;
  double width = self->_bulletinFrame.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBulletinFrame:(CGRect)a3
{
  self->_bulletinFrame = a3;
}

- (NSString)chinTitle
{
  return self->_chinTitle;
}

- (void)setChinTitle:(id)a3
{
}

- (NSAttributedString)chinSubtitle
{
  return self->_chinSubtitle;
}

- (void)setChinSubtitle:(id)a3
{
}

- (UIImage)chinImage
{
  return self->_chinImage;
}

- (void)setChinImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end