@interface MTDebugSharedUserDefaultsDataProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation MTDebugSharedUserDefaultsDataProvider

- (id)debugDataFileName
{
  return @"SharedUserDefaults.txt";
}

- (id)debugData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryRepresentation]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);

  return v5;
}

@end