@interface SAGKPropertyPod
- (id)_convertedCardSections;
@end

@implementation SAGKPropertyPod

- (id)_convertedCardSections
{
  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[SAGKPropertyPod propertyList](self, "propertyList"));
  id v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v18 = *(void *)v21;
    do
    {
      v5 = 0LL;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v5);
        id v7 = objc_alloc_init(&OBJC_CLASS___SFRowCardSection);
        id v8 = objc_alloc_init(&OBJC_CLASS___SFRichText);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
        [v8 setText:v9];

        [v7 setLeadingText:v8];
        id v10 = objc_alloc_init(&OBJC_CLASS___SFRichText);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v6 valueAnnotation]);

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v6 valueAnnotation]);
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v12,  v13));
        }

        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
        }

        [v10 setText:v14];
        [v7 setTrailingText:v10];
        -[NSMutableArray addObject:](v19, "addObject:", v7);

        v5 = (char *)v5 + 1;
      }

      while (v4 != v5);
      id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v4);
  }

  id v15 = -[NSMutableArray copy](v19, "copy");
  return v15;
}

@end