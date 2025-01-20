@interface MADAutoTargetLookupResults
+ (BOOL)supportsSecureCoding;
- (MADAutoTargetLookupResults)initWithCoder:(id)a3;
- (NSArray)targetGroupNames;
- (NSMutableDictionary)setLookupResults;
- (NSString)targetBuild;
- (NSString)targetOSVersion;
- (NSString)targetRestoreVersion;
- (NSString)targetTrainName;
- (id)initForTargetOSVersion:(id)a3 forTargetBuild:(id)a4 forTargetTrainName:(id)a5 forTargetRestoreVersion:(id)a6 targetingGroupNames:(id)a7;
- (id)newSummaryWithoutEntryID;
- (id)summary;
- (int64_t)lookupResultsAssetCount;
- (void)encodeWithCoder:(id)a3;
- (void)setSetLookupResults:(id)a3;
@end

@implementation MADAutoTargetLookupResults

- (id)initForTargetOSVersion:(id)a3 forTargetBuild:(id)a4 forTargetTrainName:(id)a5 forTargetRestoreVersion:(id)a6 targetingGroupNames:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MADAutoTargetLookupResults;
  v17 = -[MADAutoTargetLookupResults init](&v23, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_targetOSVersion, a3);
    objc_storeStrong((id *)&v18->_targetBuild, a4);
    objc_storeStrong((id *)&v18->_targetTrainName, a5);
    objc_storeStrong((id *)&v18->_targetRestoreVersion, a6);
    objc_storeStrong((id *)&v18->_targetGroupNames, a7);
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    setLookupResults = v18->_setLookupResults;
    v18->_setLookupResults = v19;
  }

  return v18;
}

- (MADAutoTargetLookupResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MADAutoTargetLookupResults;
  v5 = -[MADAutoTargetLookupResults init](&v27, "init");
  if (v5)
  {
    v29[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v29[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v29[2] = objc_opt_class(&OBJC_CLASS___MADAutoSetLookupResult);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 3LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    v28[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v28[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"targetOSVersion"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    targetOSVersion = v5->_targetOSVersion;
    v5->_targetOSVersion = (NSString *)v11;

    id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"targetBuild"];
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    targetBuild = v5->_targetBuild;
    v5->_targetBuild = (NSString *)v14;

    id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"targetTrainName"];
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    targetTrainName = v5->_targetTrainName;
    v5->_targetTrainName = (NSString *)v17;

    id v19 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"targetRestoreVersion"];
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    targetRestoreVersion = v5->_targetRestoreVersion;
    v5->_targetRestoreVersion = (NSString *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"targetGroupNames"]);
    targetGroupNames = v5->_targetGroupNames;
    v5->_targetGroupNames = (NSArray *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"setLookupResults"]);
    setLookupResults = v5->_setLookupResults;
    v5->_setLookupResults = (NSMutableDictionary *)v24;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetOSVersion](self, "targetOSVersion"));
  [v4 encodeObject:v5 forKey:@"targetOSVersion"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetBuild](self, "targetBuild"));
  [v4 encodeObject:v6 forKey:@"targetBuild"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetTrainName](self, "targetTrainName"));
  [v4 encodeObject:v7 forKey:@"targetTrainName"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetRestoreVersion](self, "targetRestoreVersion"));
  [v4 encodeObject:v8 forKey:@"targetRestoreVersion"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetGroupNames](self, "targetGroupNames"));
  [v4 encodeObject:v9 forKey:@"targetGroupNames"];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults setLookupResults](self, "setLookupResults"));
  [v4 encodeObject:v10 forKey:@"setLookupResults"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetTrainName](self, "targetTrainName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetRestoreVersion](self, "targetRestoreVersion"));
  id v5 = -[MADAutoTargetLookupResults newSummaryWithoutEntryID](self, "newSummaryWithoutEntryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TARGET[trainName:%@|restoreVersion:%@]%@",  v3,  v4,  v5));

  return v6;
}

- (id)newSummaryWithoutEntryID
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetGroupNames](self, "targetGroupNames"));
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    v7 = 0LL;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; (id)i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        if (v7) {
          -[NSMutableString appendFormat:]( v7,  "appendFormat:",  @",%@",  *(void *)(*((void *)&v19 + 1) + 8 * i));
        }
        else {
          v7 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  *(void *)(*((void *)&v19 + 1) + 8 * i));
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
  }

  else
  {
    v7 = 0LL;
  }

  v18 = objc_alloc(&OBJC_CLASS___NSString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetOSVersion](self, "targetOSVersion"));
  if (v9) {
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetOSVersion](self, "targetOSVersion"));
  }
  else {
    id v10 = @"N";
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetBuild](self, "targetBuild"));
  v12 = @"N";
  if (v11) {
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults targetBuild](self, "targetBuild"));
  }
  else {
    id v13 = @"N";
  }
  if (v7) {
    v12 = (const __CFString *)v7;
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults setLookupResults](self, "setLookupResults"));
  if (v14)
  {
    uint64_t i = objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults setLookupResults](self, "setLookupResults"));
    id v15 = [(id)i count];
  }

  else
  {
    id v15 = 0LL;
  }

  id v16 = -[NSString initWithFormat:]( v18,  "initWithFormat:",  @"[OSVersion:%@|Build:%@|GroupNames:%@|LookupResults:%ld|Assets:%ld]",  v10,  v13,  v12,  v15,  -[MADAutoTargetLookupResults lookupResultsAssetCount](self, "lookupResultsAssetCount"));
  if (v14) {

  }
  if (v11) {
  if (v9)
  }

  return v16;
}

- (int64_t)lookupResultsAssetCount
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults setLookupResults](self, "setLookupResults", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0LL;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoTargetLookupResults setLookupResults](self, "setLookupResults"));
        id v11 = [v10 safeObjectForKey:v9 ofClass:objc_opt_class(MADAutoSetLookupResult)];
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

        if (v12)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 autoAssetSetCatalog]);
          id v14 = [v13 safeObjectForKey:@"Assets" ofClass:objc_opt_class(NSArray)];
          id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

          v6 += (int64_t)[v15 count];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }

  else
  {
    int64_t v6 = 0LL;
  }

  return v6;
}

- (NSString)targetOSVersion
{
  return self->_targetOSVersion;
}

- (NSString)targetBuild
{
  return self->_targetBuild;
}

- (NSString)targetTrainName
{
  return self->_targetTrainName;
}

- (NSString)targetRestoreVersion
{
  return self->_targetRestoreVersion;
}

- (NSArray)targetGroupNames
{
  return self->_targetGroupNames;
}

- (NSMutableDictionary)setLookupResults
{
  return self->_setLookupResults;
}

- (void)setSetLookupResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end