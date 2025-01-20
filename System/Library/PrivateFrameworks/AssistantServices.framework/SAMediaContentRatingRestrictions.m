@interface SAMediaContentRatingRestrictions
- (id)_ad_SADHash;
@end

@implementation SAMediaContentRatingRestrictions

- (id)_ad_SADHash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAMediaContentRatingRestrictions countryCode](self, "countryCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%ld-%ld-%ld",  v3,  -[SAMediaContentRatingRestrictions movieRestriction](self, "movieRestriction"),  -[SAMediaContentRatingRestrictions tvRestriction](self, "tvRestriction"),  -[SAMediaContentRatingRestrictions appRestriction](self, "appRestriction")));

  return v4;
}

@end