@interface SHLLibraryBatch
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChanges;
- (NSSet)deletions;
- (NSSet)insertions;
- (SHLLibraryBatch)initWithCoder:(id)a3;
- (SHLLibraryBatch)initWithInsertions:(id)a3 deletions:(id)a4;
- (id)differenceOfBatch:(id)a3;
- (id)subdivideIntoBatchesOfSize:(int64_t)a3;
- (int64_t)numberOfItems;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHLLibraryBatch

- (SHLLibraryBatch)initWithInsertions:(id)a3 deletions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHLLibraryBatch;
  v9 = -[SHLLibraryBatch init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_insertions, a3);
    objc_storeStrong((id *)&v10->_deletions, a4);
  }

  return v10;
}

- (SHLLibraryBatch)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSSet, v5);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___SHLLibraryTrack, v7);
  v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v8,  objc_opt_class(&OBJC_CLASS___SHLLibraryGroup, v9),  0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"libraryBatchInsertions"]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSSet, v13);
  v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  objc_opt_class(&OBJC_CLASS___NSString, v15),  0LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"libraryBatchDeletions"]);

  v19 = -[SHLLibraryBatch initWithInsertions:deletions:](self, "initWithInsertions:deletions:", v12, v18);
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  insertions = self->_insertions;
  id v5 = a3;
  [v5 encodeObject:insertions forKey:@"libraryBatchInsertions"];
  [v5 encodeObject:self->_deletions forKey:@"libraryBatchDeletions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)differenceOfBatch:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryBatch insertions](self, "insertions"));
  id v6 = [v5 mutableCopy];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryBatch deletions](self, "deletions"));
  id v8 = [v7 mutableCopy];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 insertions]);
  [v6 minusSet:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 deletions]);
  [v8 minusSet:v10];

  v11 = objc_alloc(&OBJC_CLASS___SHLLibraryBatch);
  id v12 = [v6 copy];
  id v13 = [v8 copy];
  uint64_t v14 = -[SHLLibraryBatch initWithInsertions:deletions:](v11, "initWithInsertions:deletions:", v12, v13);

  return v14;
}

- (id)subdivideIntoBatchesOfSize:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryBatch insertions](self, "insertions"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  id v8 = [v7 mutableCopy];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryBatch deletions](self, "deletions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
  id v11 = [v10 mutableCopy];
  while (1)
  {

    if (![v8 count] && !objc_msgSend(v11, "count")) {
      break;
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", a3));
    do
    {
      id v12 = (char *)[v9 count];
      id v13 = [v10 count];
      if ([v8 count] && &v12[(void)v13] < (char *)a3)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
        [v8 removeObjectAtIndex:0];
        [v9 addObject:v14];
      }

      uint64_t v15 = (char *)[v9 count];
      id v16 = [v10 count];
      if ([v11 count] && &v15[(void)v16] < (char *)a3)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
        [v11 removeObjectAtIndex:0];
        [v10 addObject:v17];
      }

      v18 = (char *)[v9 count];
      id v19 = [v10 count];
      if ([v8 count]) {
        BOOL v20 = 0;
      }
      else {
        BOOL v20 = [v11 count] == 0;
      }
    }

    while (&v18[(void)v19] < (char *)a3 && !v20);
    id v21 = [v9 copy];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v21));

    id v23 = [v10 copy];
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));

    v25 = -[SHLLibraryBatch initWithInsertions:deletions:]( objc_alloc(&OBJC_CLASS___SHLLibraryBatch),  "initWithInsertions:deletions:",  v22,  v24);
    [v5 addObject:v25];
  }

  id v26 = [v5 copy];

  return v26;
}

- (BOOL)hasChanges
{
  return -[SHLLibraryBatch numberOfItems](self, "numberOfItems") > 0;
}

- (int64_t)numberOfItems
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryBatch insertions](self, "insertions"));
  id v4 = (char *)[v3 count];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryBatch deletions](self, "deletions"));
  id v6 = &v4[(void)[v5 count]];

  return (int64_t)v6;
}

- (NSSet)insertions
{
  return self->_insertions;
}

- (NSSet)deletions
{
  return self->_deletions;
}

- (void).cxx_destruct
{
}

@end