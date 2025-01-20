@interface SAStructuredDictationPlaceResult
- (id)ad_transcriptionResultWithAddressBookManager:(id)a3;
@end

@implementation SAStructuredDictationPlaceResult

- (id)ad_transcriptionResultWithAddressBookManager:(id)a3
{
  v3 = self;
  id v4 = objc_alloc_init(&OBJC_CLASS___STSiriLocation);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationPlaceResult resultData](v3, "resultData"));
  [v4 setGeoResult:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationPlaceResult placeResultType](v3, "placeResultType"));
  unsigned __int8 v7 = [v6 isEqualToString:SAStructuredDictationPlaceResultPlaceResultTypeFORWARD_GEOCODEValue];

  if ((v7 & 1) != 0)
  {
    uint64_t v8 = 1LL;
LABEL_5:
    [v4 setResultType:v8];
    goto LABEL_6;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationPlaceResult placeResultType](v3, "placeResultType"));
  unsigned int v10 = [v9 isEqualToString:SAStructuredDictationPlaceResultPlaceResultTypePLACE_SEARCHValue];

  if (v10)
  {
    uint64_t v8 = 2LL;
    goto LABEL_5;
  }

@end