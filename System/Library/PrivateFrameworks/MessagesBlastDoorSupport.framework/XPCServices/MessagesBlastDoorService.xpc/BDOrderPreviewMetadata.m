@interface BDOrderPreviewMetadata
- (BDOrderPreviewMetadata)initWithOrderData:(id)a3 workingDirectory:(id)a4 error:(id *)a5;
- (BDOrderPreviewMetadataImage)headerImage;
- (BDOrderPreviewMetadataText)primaryText;
- (BDOrderPreviewMetadataText)secondaryText;
- (BDOrderPreviewMetadataText)tertiaryText;
- (CGColor)backgroundColor;
- (void)dealloc;
@end

@implementation BDOrderPreviewMetadata

- (BDOrderPreviewMetadata)initWithOrderData:(id)a3 workingDirectory:(id)a4 error:(id *)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BDOrderPreviewMetadata;

  return 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BDOrderPreviewMetadata;
  -[BDOrderPreviewMetadata dealloc](&v3, "dealloc");
}

- (BDOrderPreviewMetadataImage)headerImage
{
  return self->_headerImage;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BDOrderPreviewMetadataText)primaryText
{
  return self->_primaryText;
}

- (BDOrderPreviewMetadataText)secondaryText
{
  return self->_secondaryText;
}

- (BDOrderPreviewMetadataText)tertiaryText
{
  return self->_tertiaryText;
}

- (void).cxx_destruct
{
}

@end