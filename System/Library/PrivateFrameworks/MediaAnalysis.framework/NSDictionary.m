@interface NSDictionary
- (BOOL)vcp_isValidEffectsResult;
- (id)vcp_effectsResult;
- (id)vcp_gatingDescriptions;
- (id)vcp_matchingScenes;
- (id)vcp_recipe;
- (unint64_t)vcp_longExposureSugestionState;
- (unint64_t)vcp_loopSugestionState;
@end

@implementation NSDictionary

- (id)vcp_effectsResult
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary vcp_results](self, "vcp_results"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:MediaAnalysisLivePhotoEffectsResultsKey]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);

  return v5;
}

- (BOOL)vcp_isValidEffectsResult
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self,  "objectForKey:",  MediaAnalysisResultLoopSuggestionStateAttributeKey));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self,  "objectForKey:",  MediaAnalysisResultLongExposureSuggestionStateAttributeKey));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self,  "objectForKey:",  MediaAnalysisResultLivePhotoEffectsRecipeAttributeKey));
      BOOL v6 = v5 != 0LL;
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)vcp_loopSugestionState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self,  "objectForKey:",  MediaAnalysisResultLoopSuggestionStateAttributeKey));
  v3 = v2;
  if (v2) {
    id v4 = [v2 unsignedIntegerValue];
  }
  else {
    id v4 = 0LL;
  }

  return (unint64_t)v4;
}

- (unint64_t)vcp_longExposureSugestionState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self,  "objectForKey:",  MediaAnalysisResultLongExposureSuggestionStateAttributeKey));
  v3 = v2;
  if (v2) {
    id v4 = [v2 unsignedIntegerValue];
  }
  else {
    id v4 = 0LL;
  }

  return (unint64_t)v4;
}

- (id)vcp_recipe
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self,  "objectForKey:",  MediaAnalysisResultLivePhotoEffectsRecipeAttributeKey));
  id v3 = [[VCPProtoLivePhotoEffectsRecipe alloc] initWithData:v2];
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 exportToLegacyDictionary]);

  return v4;
}

- (id)vcp_gatingDescriptions
{
  return -[NSDictionary objectForKey:]( self,  "objectForKey:",  MediaAnalysisResultLivePhotoEffectsGatingDescriptionsAttributeKey);
}

- (id)vcp_matchingScenes
{
  return -[NSDictionary objectForKey:]( self,  "objectForKey:",  MediaAnalysisResultLivePhotoEffectsMatchingScenesAttributeKey);
}

@end