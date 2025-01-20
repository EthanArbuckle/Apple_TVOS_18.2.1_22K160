@interface MTDateParser
+ (id)dateFormatters;
- (id)dateFromRSSDateString:(id)a3;
@end

@implementation MTDateParser

- (id)dateFromRSSDateString:(id)a3
{
  id v3 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDateParser dateFormatters](&OBJC_CLASS___MTDateParser, "dateFormatters", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(id *)(*((void *)&v11 + 1) + 8 * v7);
      objc_sync_enter(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dateFromString:v3]);
      objc_sync_exit(v8);

      if (v9) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    v9 = 0LL;
  }

  return v9;
}

+ (id)dateFormatters
{
  if (qword_1002B6A60 != -1) {
    dispatch_once(&qword_1002B6A60, &stru_100242B88);
  }
  return (id)qword_1002B6A58;
}

@end