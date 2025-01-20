@interface CPLScopeChange
- (BOOL)canAcceptShareWithCloudKit;
- (id)rootRecordUsingTempCKAssetURL:(id)a3 inZone:(id)a4;
- (void)updateCKShare:(id)a3;
- (void)updateWithCKShare:(id)a3 currentUserID:(id)a4;
- (void)updateWithLibraryInfoCKRecord:(id)a3 zone:(id)a4 userRecordID:(id)a5;
@end

@implementation CPLScopeChange

- (BOOL)canAcceptShareWithCloudKit
{
  switch((unint64_t)-[CPLScopeChange scopeType](self, "scopeType"))
  {
    case 2uLL:
    case 3uLL:
    case 5uLL:
      BOOL result = 1;
      break;
    case 4uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned __int8 v4 = [v3 BOOLForKey:@"CPLAcceptOwnedShareURL"];

      BOOL result = v4;
      break;
    default:
      BOOL result = 0;
      break;
  }

  return result;
}

- (void)updateWithCKShare:(id)a3 currentUserID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = -[CPLShare initWithCKShare:currentUserID:]( objc_alloc(&OBJC_CLASS___CPLShare),  "initWithCKShare:currentUserID:",  v7,  v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:CKShareTitleKey]);
  if (v8) {
    -[CPLScopeChange setTitle:](self, "setTitle:", v8);
  }
  -[CPLScopeChange setShare:](self, "setShare:", v9);
}

- (void)updateWithLibraryInfoCKRecord:(id)a3 zone:(id)a4 userRecordID:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = -[CPLLibraryInfo initWithCKRecord:zone:]( objc_alloc(&OBJC_CLASS___CPLLibraryInfo),  "initWithCKRecord:zone:",  v8,  v7);

  -[CPLScopeChange setLibraryInfo:](self, "setLibraryInfo:", v9);
}

- (id)rootRecordUsingTempCKAssetURL:(id)a3 inZone:(id)a4
{
  return 0LL;
}

- (void)updateCKShare:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLScopeChange share](self, "share"));
  v5 = v4;
  if (v4)
  {
    id v6 = (char *)[v4 publicPermission];
    else {
      id v7 = v6;
    }
    [v9 setPublicPermission:v7];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLScopeChange title](self, "title"));
  [v9 setObject:v8 forKey:CKShareTitleKey];
}

@end