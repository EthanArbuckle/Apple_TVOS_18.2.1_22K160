@interface _GEOTrafficUpdateETARequestConfig
- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (id)additionalURLQueryItems;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation _GEOTrafficUpdateETARequestConfig

- (unint64_t)urlType
{
  return 5LL;
}

- (id)additionalURLQueryItems
{
  uint64_t String = GEOConfigGetString( GeoServicesConfig_ExperimentalDirectionsService[0],  GeoServicesConfig_ExperimentalDirectionsService[1]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(String);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"?"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByTrimmingCharactersInSet:v4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@"="]);

    if ([v6 count] == (id)2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  v7,  v8));

      v12 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    }

    else
    {
      v10 = &__NSArray0__struct;
    }
  }

  else
  {
    v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)serviceTypeNumber
{
  return &off_10005E1C8;
}

- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($8E8A1DFF6E8C798DDDF56DAB3917D12E)673LL;
}

@end