@interface IMDebugUserDefaultsDataProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation IMDebugUserDefaultsDataProvider

- (id)debugDataFileName
{
  return @"UserDefaults.txt";
}

- (id)debugData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryRepresentation]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);

  return v5;
}

@end