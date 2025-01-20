@interface SRSubsystemCategoryNameFilter
- (BOOL)shouldReportObject:(id)a3;
- (FilterTier)filterTreeRoot;
- (SRSubsystemCategoryNameFilter)initWithDictionaryArray:(id)a3;
- (id)downsampleEntryForObject:(id)a3;
- (void)addEntryWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 cap:(unint64_t)a6 downsampleRatio:(unint64_t)a7;
@end

@implementation SRSubsystemCategoryNameFilter

- (SRSubsystemCategoryNameFilter)initWithDictionaryArray:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_24:
    v19 = 0LL;
    goto LABEL_25;
  }

  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___SRSubsystemCategoryNameFilter;
  self = -[SRSubsystemCategoryNameFilter init](&v38, "init");
  if (!self) {
    goto LABEL_14;
  }
  v5 = objc_alloc_init(&OBJC_CLASS___FilterRootTier);
  filterTreeRoot = self->_filterTreeRoot;
  self->_filterTreeRoot = &v5->super;

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v7) {
    goto LABEL_13;
  }
  id v8 = v7;
  id v30 = v4;
  uint64_t v9 = *(void *)v35;
  while (2)
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v35 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Subsystem"]);
      if (!v12)
      {
        id v20 = sub_100003E84();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_100009D24(v13, v21, v22);
        }
        goto LABEL_23;
      }

      v13 = (os_log_s *)v12;
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Cap"]);
      if (!v14)
      {
        id v23 = sub_100003E84();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          sub_100009D58(v24, v25, v26);
        }

        goto LABEL_23;
      }

      v15 = (void *)v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"DownsampleRatio"]);
      if (!v16)
      {
        id v27 = sub_100003E84();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_100009D8C(&v32, v33, v28);
        }

LABEL_23:
        id v4 = v30;

        goto LABEL_24;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Category"]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Name"]);
      -[SRSubsystemCategoryNameFilter addEntryWithSubsystem:category:name:cap:downsampleRatio:]( self,  "addEntryWithSubsystem:category:name:cap:downsampleRatio:",  v13,  v17,  v18,  [v15 unsignedLongLongValue],  objc_msgSend(v16, "unsignedLongLongValue"));
    }

    id v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    id v4 = v30;
    if (v8) {
      continue;
    }
    break;
  }

- (BOOL)shouldReportObject:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSubsystemCategoryNameFilter downsampleEntryForObject:](self, "downsampleEntryForObject:", a3));
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 shouldReportThisTime];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (id)downsampleEntryForObject:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_alloc(&OBJC_CLASS___FilterQuery);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 subsystem]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);

  uint64_t v9 = -[FilterQuery initWithSubsystem:category:name:](v5, "initWithSubsystem:category:name:", v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSubsystemCategoryNameFilter filterTreeRoot](self, "filterTreeRoot"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 entryForQuery:v9]);

  return v11;
}

- (void)addEntryWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 cap:(unint64_t)a6 downsampleRatio:(unint64_t)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v16 = -[FilterQuery initWithSubsystem:category:name:]( objc_alloc(&OBJC_CLASS___FilterQuery),  "initWithSubsystem:category:name:",  v14,  v13,  v12);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSubsystemCategoryNameFilter filterTreeRoot](self, "filterTreeRoot"));
  [v15 setCap:a6 downsampleRatio:a7 forQuery:v16];
}

- (FilterTier)filterTreeRoot
{
  return (FilterTier *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end