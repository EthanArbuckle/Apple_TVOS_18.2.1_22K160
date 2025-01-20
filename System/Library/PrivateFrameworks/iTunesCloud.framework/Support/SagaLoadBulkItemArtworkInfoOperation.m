@interface SagaLoadBulkItemArtworkInfoOperation
- (BOOL)useLongIDs;
- (unsigned)itemKind;
@end

@implementation SagaLoadBulkItemArtworkInfoOperation

- (BOOL)useLongIDs
{
  return 0;
}

- (unsigned)itemKind
{
  return 2;
}

@end