@interface RemoveableSoftwareLookupOperation
- (NSArray)softwareLibraryItems;
- (void)run;
- (void)setSoftwareLibraryItems:(id)a3;
@end

@implementation RemoveableSoftwareLookupOperation

- (void)run
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (SSIsDaemon())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100158C20;
    v29[3] = &unk_10034C6D8;
    id v30 = v2;
    [v3 enumerateApplicationsOfType:1 block:v29];
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v23 = *(void *)v26;
    uint64_t v6 = SSSoftwareLibraryItemPropertyITunesItemIdentifier;
    uint64_t v7 = SSSoftwareLibraryItemBundleIdentifier;
    uint64_t v8 = SSSoftwareLibraryItemBundleVersion;
    uint64_t v9 = SSSoftwareLibraryItemPropertyITunesAccountIdentifier;
    uint64_t v10 = SSSoftwareLibraryItemPropertyFamilyAccountIdentifier;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v11);
        id v13 = objc_alloc_init(&OBJC_CLASS___SSSoftwareLibraryItem);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 itemID]);
        [v13 _setValue:v14 forProperty:v6];

        objc_msgSend(v13, "setBeta:", objc_msgSend(v12, "isBetaApp"));
        objc_msgSend(v13, "setPlaceholder:", objc_msgSend(v12, "isPlaceholder"));
        objc_msgSend(v13, "setProfileValidated:", objc_msgSend(v12, "profileValidated"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
        [v13 _setValue:v15 forProperty:v7];

        v16 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleVersion]);
        [v13 _setValue:v16 forProperty:v8];

        v17 = (void *)objc_claimAutoreleasedReturnValue([v12 purchaserDSID]);
        [v13 _setValue:v17 forProperty:v9];

        v18 = (void *)objc_claimAutoreleasedReturnValue([v12 familyID]);
        [v13 _setValue:v18 forProperty:v10];

        [v24 addObject:v13];
        v11 = (char *)v11 + 1;
      }

      while (v5 != v11);
      id v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v5);
  }

  v19 = (NSArray *)[v24 copy];
  softwareLibraryItems = self->_softwareLibraryItems;
  self->_softwareLibraryItems = v19;

  -[RemoveableSoftwareLookupOperation setSuccess:](self, "setSuccess:", 1LL);
}

- (NSArray)softwareLibraryItems
{
  return (NSArray *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setSoftwareLibraryItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end