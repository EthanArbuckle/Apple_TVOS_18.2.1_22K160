@interface CPLLibraryInfo
- (CPLLibraryInfo)initWithCKRecord:(id)a3 zone:(id)a4;
- (id)_assetCountsFromCKRecord:(id)a3;
- (void)updateWithCKRecord:(id)a3 zone:(id)a4;
@end

@implementation CPLLibraryInfo

- (id)_assetCountsFromCKRecord:(id)a3
{
  if (!a3) {
    return &__NSDictionary0__struct;
  }
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 valueForKey:@"photosCount"]);
  v5 = (void *)v4;
  if (v4) {
    v6 = (_UNKNOWN **)v4;
  }
  else {
    v6 = &off_10025A0F8;
  }
  v7 = v6;

  v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"videosCount"]);
  if (v8) {
    v9 = v8;
  }
  else {
    v9 = &off_10025A0F8;
  }
  v10 = v9;

  v13[0] = @"public.image";
  v13[1] = @"public.movie";
  v14[0] = v7;
  v14[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

  return v11;
}

- (CPLLibraryInfo)initWithCKRecord:(id)a3 zone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = &OBJC_CLASS___CPLLibraryInfo;
  v8 = -[CPLLibraryInfo init](&v11, "init");
  v9 = v8;
  if (v8) {
    -[CPLLibraryInfo updateWithCKRecord:zone:](v8, "updateWithCKRecord:zone:", v6, v7);
  }

  return v9;
}

- (void)updateWithCKRecord:(id)a3 zone:(id)a4
{
  id v36 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLLibraryInfo _assetCountsFromCKRecord:](self, "_assetCountsFromCKRecord:", v36));
  -[CPLLibraryInfo setAssetCounts:](self, "setAssetCounts:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v36 valueForKey:@"featureVersion"]);
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
      uint64_t v8 = (uint64_t)[v6 unsignedIntegerValue];
    }
    else {
      uint64_t v8 = 1LL;
    }
  }

  else
  {
    if (qword_100296340 != -1) {
      dispatch_once(&qword_100296340, &stru_1002414A0);
    }
    uint64_t v8 = qword_100290C18;
  }

  id v9 = [[CPLFeatureVersionHistory alloc] initWithCurrentFeatureVersion:v8];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v36 valueForKey:@"featureVersionHistory"]);
  if (v10)
  {
    v34 = self;
    v35 = v6;
    objc_super v11 = v9;
    v12 = -[CPLCloudKitFeatureVersionHistory initWithData:]( objc_alloc(&OBJC_CLASS___CPLCloudKitFeatureVersionHistory),  "initWithData:",  v10);
    v13 = v12;
    if (v12)
    {
      unint64_t v14 = -[CPLCloudKitFeatureVersionHistory featureVersionsCount](v12, "featureVersionsCount");
      if (v14)
      {
        unint64_t v15 = v14;
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitFeatureVersionHistory featureVersionAtIndex:](v13, "featureVersionAtIndex:", i));
          if ([v17 hasVersion] && objc_msgSend(v17, "hasServerToken"))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v17 serverToken]);
            id v19 = [v17 version];
            if (v18)
            {
              id v20 = v19;
              v21 = -[CKServerChangeToken initWithData:]( objc_alloc(&OBJC_CLASS___CKServerChangeToken),  "initWithData:",  v18);
              if (v21)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  v21));
                [v11 addSyncAnchor:v22 forFeatureVersion:v20];
              }
            }
          }
        }
      }
    }

    self = v34;
    id v6 = v35;
    id v9 = v11;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v36 valueForKey:@"accountFlags"]);
  if (v23)
  {
    -[CPLLibraryInfo setAccountFlagsData:](self, "setAccountFlagsData:", v23);
  }

  else
  {
    id v24 = v9;
    id v25 = objc_alloc_init(&OBJC_CLASS___CPLAccountFlags);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"CPLDefaultHEVCFlag"]);

    if (v27 && (objc_opt_respondsToSelector(v27, "BOOLValue") & 1) != 0) {
      objc_msgSend(v25, "setDefaultHEVC:", objc_msgSend(v27, "BOOLValue"));
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue([v25 data]);
    -[CPLLibraryInfo setAccountFlagsData:](self, "setAccountFlagsData:", v28);

    id v9 = v24;
  }

  -[CPLLibraryInfo setFeatureVersionHistory:](self, "setFeatureVersionHistory:", v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v36 valueForKey:@"featureCompatibleVersion"]);
  if (v29 && (uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v29, v30) & 1) != 0))
  {
    -[CPLLibraryInfo setFeatureCompatibleVersion:](self, "setFeatureCompatibleVersion:", v29);
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:@"CPLDefaultFeatureCompatibleVersion"]);

    if (v32)
    {
      uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0) {
        -[CPLLibraryInfo setFeatureCompatibleVersion:](self, "setFeatureCompatibleVersion:", v32);
      }
    }
  }
}

@end