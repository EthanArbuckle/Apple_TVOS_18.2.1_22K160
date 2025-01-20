@interface WiFiUsageLQMTriggerCriteriaFilter
- (NSMutableArray)criterias;
- (NSMutableSet)features;
- (NSPredicate)filterSamplesPredicate;
- (WiFiUsageLQMTriggerCriteriaFilter)initWith:(id)a3 forFields:(id)a4 andFeatures:(id)a5;
- (id)description;
- (void)setCriterias:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setFilterSamplesPredicate:(id)a3;
@end

@implementation WiFiUsageLQMTriggerCriteriaFilter

- (WiFiUsageLQMTriggerCriteriaFilter)initWith:(id)a3 forFields:(id)a4 andFeatures:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [v9 objectForKey:@"type"];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
  }

  else
  {
    [v9 objectForKey:@"test"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      NSLog( @"%s -  Failed to parse (Criteria does not contain key 'type'): %@",  "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]",  v9);
LABEL_36:
      v5 = 0LL;
      goto LABEL_37;
    }
  }

  id v36 = (id)objc_opt_new();
  v14 = (void *)objc_opt_new();
  [v9 objectForKey:@"type"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    [v9 objectForKey:@"type"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v9 objectForKey:@"type"];
      v5 = (WiFiUsageLQMTriggerCriteriaFilter *)objc_claimAutoreleasedReturnValue();
      int v17 = -[WiFiUsageLQMTriggerCriteriaFilter isEqualToString:](v5, "isEqualToString:", @"filter");

      if (v17)
      {
        [v9 objectForKey:@"filterconditions"];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          [v9 objectForKey:@"filterconditions"];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([v9 objectForKey:@"conditions"],
                (v5 = (WiFiUsageLQMTriggerCriteriaFilter *)objc_claimAutoreleasedReturnValue()) != 0LL))
          {
            [v9 objectForKey:@"conditions"];
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              [v9 objectForKey:@"filterconditions"];
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              [(id)objc_opt_class() parseCriteria:v32 intoRequiredFields:0 andFeatures:0 forFields:v10 withType:0 isFilter:1];
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                [MEMORY[0x1896079C8] predicateWithFormat:v22];
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                __int128 v40 = 0u;
                __int128 v41 = 0u;
                __int128 v38 = 0u;
                __int128 v39 = 0u;
                [v9 objectForKey:@"conditions"];
                id obj = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
                if (v35)
                {
                  uint64_t v34 = *(void *)v39;
                  while (2)
                  {
                    for (uint64_t i = 0LL; i != v35; ++i)
                    {
                      if (*(void *)v39 != v34) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        NSLog( @"%s -  Failed to parse keys 'conditions': %@",  "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]",  v9);

                        goto LABEL_34;
                      }

                      v26 = -[WiFiUsageLQMTriggerCriteria initWith:forFields:andFeatures:]( objc_alloc(&OBJC_CLASS___WiFiUsageLQMTriggerCriteria),  "initWith:forFields:andFeatures:",  v25,  v10,  v36);
                      if (v26)
                      {
                        +[WiFiUsageLQMTriggerCriteria predicateNoQuotes:]( &OBJC_CLASS___WiFiUsageLQMTriggerCriteria,  "predicateNoQuotes:",  v23);
                        v5 = (WiFiUsageLQMTriggerCriteriaFilter *)objc_claimAutoreleasedReturnValue();
                        -[WiFiUsageLQMTriggerCriteria setFilterCriteria:](v26, "setFilterCriteria:", v5);

                        [v14 addObject:v26];
                      }
                    }

                    uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
                    if (v35) {
                      continue;
                    }
                    break;
                  }
                }
              }

              else
              {
                v23 = 0LL;
              }

              goto LABEL_26;
            }
          }

          else
          {
          }
        }

        NSLog( @"%s -  Failed to parse keys 'filterconditions' and/or 'conditions': %@",  "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]",  v9);
        goto LABEL_33;
      }
    }

    else
    {
    }
  }

  [v9 objectForKey:@"test"];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = -[WiFiUsageLQMTriggerCriteria initWith:forFields:andFeatures:]( objc_alloc(&OBJC_CLASS___WiFiUsageLQMTriggerCriteria),  "initWith:forFields:andFeatures:",  v9,  v10,  v11);
    [v14 addObject:v28];

    v22 = 0LL;
    v23 = 0LL;
LABEL_26:
    if ([v14 count])
    {
      v37.receiver = self;
      v37.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMTriggerCriteriaFilter;
      v29 = -[WiFiUsageLQMTriggerCriteriaFilter init](&v37, sel_init);
      objc_storeStrong((id *)&v29->_filterSamplesPredicate, v23);
      objc_storeStrong((id *)&v29->_features, v36);
      objc_storeStrong((id *)&v29->_criterias, v14);
      self = v29;
      int v30 = 0;
      v5 = self;
    }

    else
    {
      int v30 = 0;
      v5 = 0LL;
    }

    goto LABEL_35;
  }

  NSLog( @"%s -  Failed to parse (Criteria does not contain key 'test'): %@",  "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]",  v9);
LABEL_33:
  v22 = 0LL;
  v23 = 0LL;
LABEL_34:
  int v30 = 1;
LABEL_35:

  if (v30) {
    goto LABEL_36;
  }
LABEL_37:

  return v5;
}

- (id)description
{
  return (id)-[NSMutableArray description](self->_criterias, "description");
}

- (NSPredicate)filterSamplesPredicate
{
  return self->_filterSamplesPredicate;
}

- (void)setFilterSamplesPredicate:(id)a3
{
}

- (NSMutableArray)criterias
{
  return self->_criterias;
}

- (void)setCriterias:(id)a3
{
}

- (NSMutableSet)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (void).cxx_destruct
{
}

@end