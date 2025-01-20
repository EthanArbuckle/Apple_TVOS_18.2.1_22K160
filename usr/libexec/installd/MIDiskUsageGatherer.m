@interface MIDiskUsageGatherer
- (BOOL)calcDynamic;
- (BOOL)calcShared;
- (BOOL)calcStatic;
- (MIDiskUsageGatherer)initWithIdentifiers:(id)a3 options:(id)a4;
- (NSArray)identifiers;
- (id)_gatherForIdentifier:(id)a3;
- (id)gatherUsageInfoWithError:(id *)a3;
@end

@implementation MIDiskUsageGatherer

- (MIDiskUsageGatherer)initWithIdentifiers:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MIDiskUsageGatherer;
  v9 = -[MIDiskUsageGatherer init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifiers, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"DynamicDiskUsage"]);
    v10->_calcDynamic = sub_1000133E0(v11, 0LL);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"SharedDiskUsage"]);
    v10->_calcShared = sub_1000133E0(v12, 0LL);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"StaticDiskUsage"]);
    v10->_calcStatic = sub_1000133E0(v13, 0LL);
  }

  return v10;
}

- (id)_gatherForIdentifier:(id)a3
{
  id v26 = a3;
  sub_10004D4E4(v26);
  unsigned int v4 = -[MIDiskUsageGatherer calcDynamic](self, "calcDynamic");
  unsigned int v5 = -[MIDiskUsageGatherer calcShared](self, "calcShared");
  unsigned int v6 = -[MIDiskUsageGatherer calcStatic](self, "calcStatic");
  uint64_t v7 = 2LL;
  if (!v4) {
    uint64_t v7 = 0LL;
  }
  if (v5) {
    v7 |= 8uLL;
  }
  id v31 = 0LL;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[MIContainer allContainersForAllPersonasForIdentifier:options:error:]( &OBJC_CLASS___MIContainer,  "allContainersForAllPersonasForIdentifier:options:error:",  v26,  v7 | v6,  &v31));
  id v25 = v31;
  if (v8)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    id v24 = v8;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    if (v10)
    {
      uint64_t v14 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          if (-[MIDiskUsageGatherer calcStatic](self, "calcStatic")
            && (objc_opt_class(&OBJC_CLASS___MIBundleContainer), (objc_opt_isKindOfClass(v16) & 1) != 0))
          {
            v13 += (uint64_t)[v16 diskUsage];
          }

          else if (-[MIDiskUsageGatherer calcShared](self, "calcShared") {
                 && (objc_opt_class(&OBJC_CLASS___MIGroupContainer), (objc_opt_isKindOfClass(v16) & 1) != 0))
          }
          {
            v11 += (uint64_t)[v16 diskUsage];
          }

          else if (-[MIDiskUsageGatherer calcDynamic](self, "calcDynamic"))
          {
            objc_opt_class(&OBJC_CLASS___MIDataContainer);
            if ((objc_opt_isKindOfClass(v16) & 1) != 0) {
              v12 += (uint64_t)[v16 diskUsage];
            }
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }

      while (v10);
    }

    id v8 = v24;
    v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    if (-[MIDiskUsageGatherer calcStatic](self, "calcStatic"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v13));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v18,  @"StaticDiskUsage");
    }

    if (-[MIDiskUsageGatherer calcDynamic](self, "calcDynamic"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v12));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v19,  @"DynamicDiskUsage");
    }

    if (-[MIDiskUsageGatherer calcShared](self, "calcShared"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v11));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v20,  @"SharedDiskUsage");
    }

    int v21 = 0;
  }

  else
  {
    if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
    {
      v17 = 0LL;
    }

    else
    {
      v17 = 0LL;
      MOLogWrite(qword_100095BF8);
    }

    int v21 = 8;
  }

  sub_10004D608(v26);
  if ((v21 | 8) == 8)
  {
    v22 = v25;
    id v8 = -[NSMutableDictionary copy](v17, "copy");
  }

  else
  {
    v22 = v25;
  }

  return v8;
}

- (id)gatherUsageInfoWithError:(id *)a3
{
  unsigned int v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (!-[MIDiskUsageGatherer calcDynamic](self, "calcDynamic")
    && !-[MIDiskUsageGatherer calcStatic](self, "calcStatic")
    && !-[MIDiskUsageGatherer calcShared](self, "calcShared"))
  {
    id v17 = sub_1000130F4( (uint64_t)"-[MIDiskUsageGatherer gatherUsageInfoWithError:]",  138LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"No usage type to fetch specified.",  v6,  v18);
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v14 = 0LL;
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskUsageGatherer identifiers](self, "identifiers", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v11);
        objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v12) & 1) != 0)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskUsageGatherer _gatherForIdentifier:](self, "_gatherForIdentifier:", v12));
          if (v13) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, v12);
          }
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }

  uint64_t v14 = v5;
  objc_super v15 = 0LL;
  if (a3)
  {
LABEL_16:
    if (!v14) {
      *a3 = v15;
    }
  }

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (BOOL)calcStatic
{
  return self->_calcStatic;
}

- (BOOL)calcDynamic
{
  return self->_calcDynamic;
}

- (BOOL)calcShared
{
  return self->_calcShared;
}

- (void).cxx_destruct
{
}

@end