@interface NSLocale
- (NSString)languageCodeAndCountryCode;
@end

@implementation NSLocale

- (NSString)languageCodeAndCountryCode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSLocale languageCode](self, "languageCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSLocale countryCode](self, "countryCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v3, v4));

  return (NSString *)v5;
}

@end