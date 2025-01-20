@interface OTBottleIDs
- (NSArray)partialRecoveryBottleIDs;
- (NSArray)preferredBottleIDs;
- (void)setPartialRecoveryBottleIDs:(id)a3;
- (void)setPreferredBottleIDs:(id)a3;
@end

@implementation OTBottleIDs

- (NSArray)preferredBottleIDs
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPreferredBottleIDs:(id)a3
{
}

- (NSArray)partialRecoveryBottleIDs
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPartialRecoveryBottleIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end