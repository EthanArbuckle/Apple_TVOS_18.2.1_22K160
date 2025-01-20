@interface SALocalSearchShowLocalSearchResult
- (id)_ad_transformedMapsRequest;
- (id)_ad_transformedMapsSuccessResponse;
@end

@implementation SALocalSearchShowLocalSearchResult

- (id)_ad_transformedMapsRequest
{
  id v3 = objc_alloc_init(&OBJC_CLASS___STSiriLocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowLocalSearchResult rawData](self, "rawData"));
  [v3 setGeoResult:v4];

  [v3 setResultType:2];
  id v5 = objc_alloc(&OBJC_CLASS___STShowMapsSearchResultsRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SALocalSearchShowLocalSearchResult extSessionGuid](self, "extSessionGuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[SALocalSearchShowLocalSearchResult extSessionGuidCreatedTimestamp]( self,  "extSessionGuidCreatedTimestamp"));
  id v8 = [v5 _initWithLocation:v3 extSessionGuid:v6 extSessionGuidCreatedTimestamp:v7];

  return v8;
}

- (id)_ad_transformedMapsSuccessResponse
{
  return objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
}

@end