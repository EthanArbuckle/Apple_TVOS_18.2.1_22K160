@interface TVSettingsOSUpdateTrainFacade
- (NSArray)sortedAudiencesForTrain;
- (NSDictionary)colors;
- (NSDictionary)trainAudiences;
- (NSString)currentTrainName;
- (id)colorValues;
- (void)setColors:(id)a3;
- (void)setCurrentTrainName:(id)a3;
- (void)setSortedAudiencesForTrain:(id)a3;
- (void)setTrainAudiences:(id)a3;
@end

@implementation TVSettingsOSUpdateTrainFacade

- (void)setCurrentTrainName:(id)a3
{
  id v9 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateTrainFacade trainAudiences](self, "trainAudiences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v9]);
  v7 = (NSArray *)[v6 mutableCopy];

  -[NSArray sortUsingComparator:](v7, "sortUsingComparator:", &stru_100193F00);
  sortedAudiencesForTrain = self->_sortedAudiencesForTrain;
  self->_sortedAudiencesForTrain = v7;
}

- (id)colorValues
{
  return -[NSDictionary allValues](self->_colors, "allValues");
}

- (NSDictionary)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
}

- (NSDictionary)trainAudiences
{
  return self->_trainAudiences;
}

- (void)setTrainAudiences:(id)a3
{
}

- (NSString)currentTrainName
{
  return self->_currentTrainName;
}

- (NSArray)sortedAudiencesForTrain
{
  return self->_sortedAudiencesForTrain;
}

- (void)setSortedAudiencesForTrain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end