@interface ASCEligibility
+ (BOOL)isAppDistributionLaunchAngel:(id)a3;
+ (BOOL)isGameOverlayUI:(id)a3;
+ (BOOL)isITunesStoreClient:(id)a3;
+ (BOOL)isInternalASCClient:(id)a3;
+ (BOOL)isSpotlightClient:(id)a3;
@end

@implementation ASCEligibility

+ (BOOL)isSpotlightClient:(id)a3
{
  unint64_t v5 = 0LL;
  do
  {
    unint64_t v6 = v5;
    if (v5 == 9) {
      break;
    }
    unsigned int v7 = [a3 hasPrefix:*(&off_10011F068 + v5 + 1)];
    unint64_t v5 = v6 + 1;
  }

  while (!v7);
  return v6 < 9;
}

+ (BOOL)isInternalASCClient:(id)a3
{
  uint64_t v4 = 0LL;
  char v5 = 1;
  do
  {
    unsigned int v6 = [a3 hasPrefix:*(&off_10011F0B8 + v4)];
    if ((v5 & 1) == 0) {
      break;
    }
    char v5 = 0;
    uint64_t v4 = 1LL;
  }

  while (!v6);
  return v6;
}

+ (BOOL)isAppDistributionLaunchAngel:(id)a3
{
  return [a3 isEqualToString:@"com.apple.AppDistributionLaunchAngel"];
}

+ (BOOL)isITunesStoreClient:(id)a3
{
  return [a3 hasPrefix:@"com.apple.MobileStore"];
}

+ (BOOL)isGameOverlayUI:(id)a3
{
  return [a3 hasPrefix:@"com.apple.GameOverlayUI"];
}

@end