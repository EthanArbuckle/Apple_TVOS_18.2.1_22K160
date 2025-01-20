@interface GEOWiFiQualityServiceRequester
- (id)_validateResponse:(id)a3;
- (void)cancel;
@end

@implementation GEOWiFiQualityServiceRequester

- (void)cancel
{
}

- (id)_validateResponse:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___GEOWiFiQualityServiceResponse, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0) {
    v7 = 0LL;
  }
  else {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -16LL,  @"server responded with wrong type"));
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end