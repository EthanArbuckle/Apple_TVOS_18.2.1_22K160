@interface ICRemoveFromLibraryResponse
- (BOOL)updateRequired;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICRemoveFromLibraryResponse

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

@end