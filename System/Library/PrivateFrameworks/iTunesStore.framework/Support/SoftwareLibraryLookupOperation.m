@interface SoftwareLibraryLookupOperation
- (NSArray)bundleIdentifiers;
- (NSArray)itemIdentifiers;
- (NSArray)softwareLibraryItems;
- (SoftwareLibraryLookupOperation)initWithBundleIdentifiers:(id)a3;
- (SoftwareLibraryLookupOperation)initWithItemIdentifiers:(id)a3;
- (id)_newSoftwareLibraryItemWithApplicationRecord:(id)a3;
- (id)_newSoftwareLibraryItemWithContainerPath:(id)a3;
- (void)_loadFromBundleIdentifiers;
- (void)_loadFromItemIdentifiers;
- (void)run;
@end

@implementation SoftwareLibraryLookupOperation

- (SoftwareLibraryLookupOperation)initWithBundleIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    int v16 = 138543362;
    id v17 = (id)objc_opt_class(self);
    id v9 = v17;
    v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%{public}@: Using bundle identifiers for a software-library lookup operation…",  &v16,  12);

    if (!v10) {
      goto LABEL_13;
    }
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v5, @"%@");
  }

LABEL_13:
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SoftwareLibraryLookupOperation;
  v11 = -[SoftwareLibraryLookupOperation init](&v15, "init");
  if (v11)
  {
    v12 = (NSArray *)[v4 copy];
    bundleIDs = v11->_bundleIDs;
    v11->_bundleIDs = v12;
  }

  return v11;
}

- (SoftwareLibraryLookupOperation)initWithItemIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if ((_DWORD)v7)
  {
    int v16 = 138543362;
    id v17 = (id)objc_opt_class(self);
    id v9 = v17;
    v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%{public}@: Using store item identifiers for a software-library lookup operation…",  &v16,  12);

    if (!v10) {
      goto LABEL_13;
    }
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v5, @"%@");
  }

LABEL_13:
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SoftwareLibraryLookupOperation;
  v11 = -[SoftwareLibraryLookupOperation init](&v15, "init");
  if (v11)
  {
    v12 = (NSArray *)[v4 copy];
    itemIDs = v11->_itemIDs;
    v11->_itemIDs = v12;
  }

  return v11;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIDs;
}

- (NSArray)itemIdentifiers
{
  return self->_itemIDs;
}

- (NSArray)softwareLibraryItems
{
  v3 = self->_softwareLibraryItems;
  -[SoftwareLibraryLookupOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  if (self->_itemIDs) {
    -[SoftwareLibraryLookupOperation _loadFromItemIdentifiers](self, "_loadFromItemIdentifiers");
  }
  else {
    -[SoftwareLibraryLookupOperation _loadFromBundleIdentifiers](self, "_loadFromBundleIdentifiers");
  }
  -[SoftwareLibraryLookupOperation setSuccess:](self, "setSuccess:", 1LL);
}

- (void)_loadFromBundleIdentifiers
{
  v60 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  v62 = self;
  obj = self->_bundleIDs;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v72,  v83,  16LL);
  id v4 = &ACSLocateCachingServer_ptr;
  v5 = &ACSLocateCachingServer_ptr;
  if (!v3)
  {
    id v7 = 0LL;
    goto LABEL_49;
  }

  id v6 = v3;
  id v7 = 0LL;
  uint64_t v63 = *(void *)v73;
  uint64_t v58 = SSSoftwareLibraryItemBundleVersion;
  uint64_t v59 = SSSoftwareLibraryItemBundleIdentifier;
  do
  {
    v8 = 0LL;
    do
    {
      if (*(void *)v73 != v63) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)v8);
      v10 = objc_autoreleasePoolPush();
      id v11 = objc_alloc((Class)v5[337]);
      id v71 = v7;
      id v12 = [v11 initWithBundleIdentifier:v9 allowPlaceholder:1 error:&v71];
      id v13 = v71;

      if (v12)
      {
        id v14 = -[SoftwareLibraryLookupOperation _newSoftwareLibraryItemWithApplicationRecord:]( v62,  "_newSoftwareLibraryItemWithApplicationRecord:",  v12);
        if (v14) {
          goto LABEL_8;
        }
        goto LABEL_29;
      }

      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v4[459] sharedDaemonConfig]);
      if (!v15) {
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v4[459] sharedConfig]);
      }
      unsigned int v16 = objc_msgSend(v15, "shouldLog", v56);
      else {
        unsigned int v17 = v16;
      }
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        uint64_t v19 = v17;
      }
      else {
        uint64_t v19 = v17 & 2;
      }
      if ((_DWORD)v19)
      {
        v20 = (void *)objc_opt_class(v62);
        int v77 = 138543874;
        v78 = v20;
        __int16 v79 = 2114;
        v80 = v9;
        __int16 v81 = 2114;
        id v82 = v13;
        id v21 = v20;
        LODWORD(v57) = 32;
        id v4 = &ACSLocateCachingServer_ptr;
        v22 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  16LL,  "%{public}@: Failed to get an application record for the bundle identifier “%{public}@”: %{public}@",  &v77,  v57);

        v5 = &ACSLocateCachingServer_ptr;
        if (!v22) {
          goto LABEL_23;
        }
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
        free(v22);
        v56 = v18;
        SSFileLog(v15, @"%@");
      }

      else
      {
        v5 = &ACSLocateCachingServer_ptr;
      }

LABEL_23:
      if (![v9 hasPrefix:@"com.apple"])
      {
        id v12 = 0LL;
LABEL_29:
        id v7 = v13;
        goto LABEL_30;
      }

      id v23 = objc_alloc((Class)v5[337]);
      id v70 = v13;
      id v12 = [v23 initWithBundleIdentifierOfSystemPlaceholder:v9 error:&v70];
      id v7 = v70;

      if (!v12)
      {
        id v14 = (id)objc_claimAutoreleasedReturnValue([v4[459] sharedDaemonConfig]);
        if (!v14) {
          id v14 = (id)objc_claimAutoreleasedReturnValue([v4[459] sharedConfig]);
        }
        unsigned int v28 = objc_msgSend(v14, "shouldLog", v56);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          uint64_t v30 = v28;
        }
        else {
          uint64_t v30 = v28 & 2;
        }
        if ((_DWORD)v30)
        {
          v31 = (void *)objc_opt_class(v62);
          int v77 = 138543874;
          v78 = v31;
          __int16 v79 = 2114;
          v80 = v9;
          __int16 v81 = 2114;
          id v82 = v7;
          id v32 = v31;
          LODWORD(v57) = 32;
          id v12 = (id)_os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  16LL,  "%{public}@: Failed to get an application record for the system-placeholder bundle identifier “%{pu blic}@”: %{public}@",  &v77,  v57);

          if (v12)
          {
            v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
            free(v12);
            v56 = v29;
            SSFileLog(v14, @"%@");
            v5 = &ACSLocateCachingServer_ptr;
            id v4 = &ACSLocateCachingServer_ptr;
            goto LABEL_44;
          }

          v5 = &ACSLocateCachingServer_ptr;
          id v4 = &ACSLocateCachingServer_ptr;
        }

        else
        {
          v5 = &ACSLocateCachingServer_ptr;
LABEL_44:

          id v12 = 0LL;
        }

- (void)_loadFromItemIdentifiers
{
  unsigned int v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v26 = self;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  obj = self->_itemIDs;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v40,  16LL);
  if (v3)
  {
    id v4 = v3;
    id v5 = 0LL;
    uint64_t v6 = *(void *)v31;
    uint64_t v27 = *(void *)v31;
    while (1)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        v8 = v5;
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0 && [v9 integerValue])
        {
          id v11 = objc_autoreleasePoolPush();
          id v12 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
          id v13 = [v9 unsignedLongLongValue];
          id v29 = v5;
          id v14 = [v12 initWithStoreItemIdentifier:v13 error:&v29];
          id v5 = v29;

          if (v14)
          {
            id v15 = -[SoftwareLibraryLookupOperation _newSoftwareLibraryItemWithApplicationRecord:]( v26,  "_newSoftwareLibraryItemWithApplicationRecord:",  v14);
            if (v15) {
              -[NSMutableArray addObject:](v25, "addObject:", v15);
            }
LABEL_11:
            uint64_t v6 = v27;
          }

          else
          {
            id v15 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
            if (!v15) {
              id v15 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            LODWORD(v16) = objc_msgSend(v15, "shouldLog", v23);
            unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              uint64_t v16 = v16;
            }
            else {
              v16 &= 2u;
            }
            if ((_DWORD)v16)
            {
              v18 = (void *)objc_opt_class(v26);
              int v34 = 138543874;
              v35 = v18;
              __int16 v36 = 2114;
              unsigned int v37 = v9;
              __int16 v38 = 2114;
              id v39 = v5;
              id v19 = v18;
              LODWORD(v24) = 32;
              v20 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  16LL,  "%{public}@: Failed to get an application record for the store item identifier “%{public}@”: %{public}@",  &v34,  v24);

              if (!v20) {
                goto LABEL_11;
              }
              unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
              free(v20);
              id v23 = v17;
              SSFileLog(v15, @"%@");
            }

            uint64_t v6 = v27;
          }

          objc_autoreleasePoolPop(v11);
          continue;
        }
      }

      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v40,  16LL);
      if (!v4) {
        goto LABEL_29;
      }
    }
  }

  id v5 = 0LL;
LABEL_29:

  -[SoftwareLibraryLookupOperation lock](v26, "lock");
  id v21 = (NSArray *)-[NSMutableArray copy](v25, "copy");
  softwareLibraryItems = v26->_softwareLibraryItems;
  v26->_softwareLibraryItems = v21;

  -[SoftwareLibraryLookupOperation unlock](v26, "unlock");
}

- (id)_newSoftwareLibraryItemWithApplicationRecord:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleContainerURL]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);

  id v7 = -[SoftwareLibraryLookupOperation _newSoftwareLibraryItemWithContainerPath:]( self,  "_newSoftwareLibraryItemWithContainerPath:",  v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 iTunesMetadata]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v8 storeItemIdentifier]));

  if (!v7)
  {
    if ([v9 integerValue])
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___SSSoftwareLibraryItem);
      [v7 _setValue:v9 forProperty:SSSoftwareLibraryItemPropertyITunesItemIdentifier];
    }

    else
    {
      id v7 = 0LL;
    }
  }

  objc_msgSend(v7, "setBeta:", objc_msgSend(v4, "isBeta"));
  objc_msgSend(v7, "setPlaceholder:", objc_msgSend(v4, "isPlaceholder"));
  objc_msgSend(v7, "setProfileValidated:", objc_msgSend(v4, "isProfileValidated"));
  objc_msgSend(v7, "setLaunchProhibited:", objc_msgSend(v4, "isLaunchProhibited"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  [v7 _setValue:v10 forProperty:SSSoftwareLibraryItemBundleIdentifier];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleVersion]);
  [v7 _setValue:v11 forProperty:SSSoftwareLibraryItemBundleVersion];

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 applicationDSID]));
  [v7 _setValue:v12 forProperty:SSSoftwareLibraryItemPropertyITunesAccountIdentifier];

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 applicationFamilyID]));
  [v7 _setValue:v13 forProperty:SSSoftwareLibraryItemPropertyFamilyAccountIdentifier];

  return v7;
}

- (id)_newSoftwareLibraryItemWithContainerPath:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:@"iTunesMetadata.plist"]);
  if (v3)
  {
    id v4 = -[NSDictionary initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithContentsOfFile:", v3);
    if (v4) {
      id v5 = [[SSSoftwareLibraryItem alloc] _initWithITunesMetadata:v4];
    }
    else {
      id v5 = 0LL;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end