@interface IDSPseudonym
- (BOOL)csd_isExpired;
@end

@implementation IDSPseudonym

- (BOOL)csd_isExpired
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPseudonym properties](self, "properties"));
  unsigned __int8 v3 = [v2 hasBeenExpiredForAtLeast:0.0];

  return v3;
}

@end