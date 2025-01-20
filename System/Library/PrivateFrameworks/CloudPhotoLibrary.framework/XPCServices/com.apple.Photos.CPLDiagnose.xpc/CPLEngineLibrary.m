@interface CPLEngineLibrary
- (id)initWithParameters:(id)a3;
@end

@implementation CPLEngineLibrary

- (id)initWithParameters:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clientLibraryBaseURL]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudLibraryStateStorageURL]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudLibraryResourceStorageURL]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryIdentifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 mainScopeIdentifier]);
  id v10 = [v4 options];

  v11 = -[CPLEngineLibrary initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:]( self,  "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:main ScopeIdentifier:options:",  v5,  v6,  v7,  v8,  v9,  v10);
  return v11;
}

@end