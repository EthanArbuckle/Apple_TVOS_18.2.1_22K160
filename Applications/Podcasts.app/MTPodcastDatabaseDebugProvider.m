@interface MTPodcastDatabaseDebugProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation MTPodcastDatabaseDebugProvider

- (id)debugData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants sharedDocumentsDirectory](&OBJC_CLASS___MTConstants, "sharedDocumentsDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDatabaseDebugProvider debugDataFileName](self, "debugDataFileName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:v4]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v5));
  return v6;
}

- (id)debugDataFileName
{
  return kLibraryDatabaseFilename;
}

@end