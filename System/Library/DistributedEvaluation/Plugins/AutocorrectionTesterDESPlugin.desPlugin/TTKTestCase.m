@interface TTKTestCase
+ (id)convertToIsolatedWordMode:(id)a3;
- (NSArray)records;
- (NSDictionary)metadata;
- (NSMutableDictionary)annotations;
- (NSString)intendedText;
- (TTKTestCase)initWithDictionary:(id)a3;
- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4;
- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4 intendedText:(id)a5;
- (id)toJsonDictionary;
@end

@implementation TTKTestCase

- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4 intendedText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TTKTestCase;
  v12 = -[TTKTestCase init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_metadata, a3);
    objc_storeStrong((id *)&v13->_records, a4);
    objc_storeStrong((id *)&v13->_intendedText, a5);
  }

  return v13;
}

- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4
{
  return -[TTKTestCase initWithMetadata:records:intendedText:]( self,  "initWithMetadata:records:intendedText:",  a3,  a4,  0LL);
}

- (TTKTestCase)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TTKTestCase;
  v5 = -[TTKTestCase init](&v26, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"metadata"]);
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"records"]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        v13 = 0LL;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v13);
          objc_super v15 = objc_alloc(&OBJC_CLASS___TTKTestCaseRecord);
          v16 = -[TTKTestCaseRecord initWithDictionary:](v15, "initWithDictionary:", v14, (void)v22);
          [v9 addObject:v16];

          v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v11);
    }

    objc_storeStrong((id *)&v5->_records, v9);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"annotations"]);
    annotations = v5->_annotations;
    v5->_annotations = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"intended_text"]);
    intendedText = v5->_intendedText;
    v5->_intendedText = (NSString *)v19;
  }

  return v5;
}

- (id)toJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v3 setObject:self->_metadata forKeyedSubscript:@"metadata"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v5 = self->_records;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v8), "toJsonDictionary", (void)v13));
        [v4 addObject:v9];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  [v3 setObject:v4 forKeyedSubscript:@"records"];
  annotations = self->_annotations;
  if (annotations) {
    [v3 setObject:annotations forKeyedSubscript:@"annotations"];
  }
  intendedText = self->_intendedText;

  return v3;
}

+ (id)convertToIsolatedWordMode:(id)a3
{
  id v3 = a3;
  v46 = v3;
  id v4 = (TTKTestCase *)objc_claimAutoreleasedReturnValue([v3 intendedText]);

  if (v4)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 records]);
    id v6 = [v5 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v6)
    {
      int v7 = 0;
      uint64_t v54 = *(void *)v63;
      id obj = v5;
      while (2)
      {
        v8 = 0LL;
        id v52 = v6;
        do
        {
          int v9 = v7;
          if (*(void *)v63 != v54) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)v8);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 intendedText]);
          int v50 = v9;
          uint64_t v12 = v9;
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 substringFromIndex:v9]);

          v56 = (void *)objc_claimAutoreleasedReturnValue([v10 primaryIntendedText]);
          if (![v56 length]) {
            goto LABEL_31;
          }
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lowercaseString]);
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v56 lowercaseString]);
          int v16 = [v14 rangeOfString:v15];
          int v18 = v17;

          if (v16 >= 1)
          {
            uint64_t v19 = 0LL;
            while (1)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceCharacterSet"));
              unsigned __int8 v21 = objc_msgSend( v20,  "characterIsMember:",  objc_msgSend(v13, "characterAtIndex:", v19));

              if ((v21 & 1) == 0
                && [v13 characterAtIndex:v19] != 46
                && [v13 characterAtIndex:v19] != 42)
              {
                break;
              }

              if (v16 == ++v19) {
                goto LABEL_14;
              }
            }

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSArray)records
{
  return self->_records;
}

- (NSMutableDictionary)annotations
{
  return self->_annotations;
}

- (NSString)intendedText
{
  return self->_intendedText;
}

- (void).cxx_destruct
{
}

@end