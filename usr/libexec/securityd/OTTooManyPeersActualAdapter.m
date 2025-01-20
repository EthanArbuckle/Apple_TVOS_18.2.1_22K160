@interface OTTooManyPeersActualAdapter
- (BOOL)shouldPopDialog;
- (unint64_t)getLimit;
@end

@implementation OTTooManyPeersActualAdapter

- (BOOL)shouldPopDialog
{
  return 0;
}

- (unint64_t)getLimit
{
  return 170LL;
}

@end