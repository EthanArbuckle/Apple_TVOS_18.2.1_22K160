@interface SAMetrics
+ (BOOL)ad_shouldClassLogToMetrics;
- (NSString)offlineIdentifier;
- (void)setOfflineIdentifier:(id)a3;
@end

@implementation SAMetrics

- (NSString)offlineIdentifier
{
  return (NSString *)objc_getAssociatedObject(self, off_100573D40);
}

- (void)setOfflineIdentifier:(id)a3
{
}

+ (BOOL)ad_shouldClassLogToMetrics
{
  return 0;
}

@end