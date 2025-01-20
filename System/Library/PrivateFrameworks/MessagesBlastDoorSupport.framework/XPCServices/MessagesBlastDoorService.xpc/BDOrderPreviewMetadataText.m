@interface BDOrderPreviewMetadataText
- (CGColor)overrideColor;
- (NSString)text;
- (void)dealloc;
@end

@implementation BDOrderPreviewMetadataText

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BDOrderPreviewMetadataText;
  -[BDOrderPreviewMetadataText dealloc](&v3, "dealloc");
}

- (NSString)text
{
  return self->_text;
}

- (CGColor)overrideColor
{
  return self->_overrideColor;
}

- (void).cxx_destruct
{
}

@end