@interface SagaLoadBulkContainerArtworkInfoOperation
- (BOOL)useLongIDs;
- (unsigned)itemKind;
@end

@implementation SagaLoadBulkContainerArtworkInfoOperation

- (BOOL)useLongIDs
{
  return 0;
}

- (unsigned)itemKind
{
  return 1;
}

@end