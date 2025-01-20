@interface JaliscoLoadBulkItemArtworkInfoOperation
- (BOOL)useLongIDs;
- (unsigned)itemKind;
@end

@implementation JaliscoLoadBulkItemArtworkInfoOperation

- (BOOL)useLongIDs
{
  return 1;
}

- (unsigned)itemKind
{
  return 2;
}

@end