@interface TVMusicPlayItemsPAFData
+ (id)PAFDataFromDictionary:(id)a3;
- (NSData)recommendationData;
- (NSString)featureName;
- (void)setFeatureName:(id)a3;
- (void)setRecommendationData:(id)a3;
@end

@implementation TVMusicPlayItemsPAFData

+ (id)PAFDataFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TVMusicPlayItemsPAFData);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"featureName"]);
  -[TVMusicPlayItemsPAFData setFeatureName:](v4, "setFeatureName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"recommendationData"]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"recommendationData"]);
  }
  else {
    v9 = 0LL;
  }

  if ([v9 length])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
    if ([v10 length]) {
      -[TVMusicPlayItemsPAFData setRecommendationData:](v4, "setRecommendationData:", v10);
    }
  }

  return v4;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (void)setRecommendationData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end