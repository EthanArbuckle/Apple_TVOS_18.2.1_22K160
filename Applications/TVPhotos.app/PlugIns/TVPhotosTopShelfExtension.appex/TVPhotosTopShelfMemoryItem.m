@interface TVPhotosTopShelfMemoryItem
- (NSString)keyAssetIdentifier;
- (NSString)memoryIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (TVPhotosTopShelfMemoryItem)initWithTitle:(id)a3 subtitle:(id)a4 memoryIdentifier:(id)a5 keyAssetIdentifier:(id)a6;
@end

@implementation TVPhotosTopShelfMemoryItem

- (TVPhotosTopShelfMemoryItem)initWithTitle:(id)a3 subtitle:(id)a4 memoryIdentifier:(id)a5 keyAssetIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVPhotosTopShelfMemoryItem;
  v14 = -[TVPhotosTopShelfMemoryItem init](&v24, "init");
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    title = v14->_title;
    v14->_title = v15;

    v17 = (NSString *)[v11 copy];
    subtitle = v14->_subtitle;
    v14->_subtitle = v17;

    v19 = (NSString *)[v13 copy];
    keyAssetIdentifier = v14->_keyAssetIdentifier;
    v14->_keyAssetIdentifier = v19;

    v21 = (NSString *)[v12 copy];
    memoryIdentifier = v14->_memoryIdentifier;
    v14->_memoryIdentifier = v21;
  }

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)keyAssetIdentifier
{
  return self->_keyAssetIdentifier;
}

- (NSString)memoryIdentifier
{
  return self->_memoryIdentifier;
}

- (void).cxx_destruct
{
}

@end