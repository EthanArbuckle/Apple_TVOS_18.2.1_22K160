@interface KTFetchCloudOperation
- (BOOL)shouldRetry;
@end

@implementation KTFetchCloudOperation

- (BOOL)shouldRetry
{
  return (uint64_t)self->super._startOperation & 1;
}

@end