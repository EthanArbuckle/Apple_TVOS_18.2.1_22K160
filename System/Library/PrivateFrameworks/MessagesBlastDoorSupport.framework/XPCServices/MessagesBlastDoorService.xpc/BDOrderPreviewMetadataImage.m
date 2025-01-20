@interface BDOrderPreviewMetadataImage
- (NSData)data;
- (unint64_t)kind;
@end

@implementation BDOrderPreviewMetadataImage

- (NSData)data
{
  return self->_data;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
}

@end