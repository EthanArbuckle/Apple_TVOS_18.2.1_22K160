@interface ICSDKAddToLibraryResponse
- (BOOL)updateRequired;
- (NSDictionary)addedItems;
- (void)setAddedItems:(id)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICSDKAddToLibraryResponse

- (NSDictionary)addedItems
{
  return self->_addedItems;
}

- (void)setAddedItems:(id)a3
{
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (void).cxx_destruct
{
}

@end