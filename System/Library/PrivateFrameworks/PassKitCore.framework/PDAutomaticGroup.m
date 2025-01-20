@interface PDAutomaticGroup
+ (id)createAutomaticGroupForPass:(id)a3 withGroupingProfile:(id)a4;
- (BOOL)addPass:(id)a3 withGroupingProfile:(id)a4;
- (BOOL)isNFCEnabled;
- (BOOL)removePass:(id)a3;
- (BOOL)updateOrderWithCatalogGroup:(id)a3;
- (NSArray)sortedPassUniqueIdentifiers;
- (NSDate)ingestedDate;
- (NSDate)maxDate;
- (NSDate)minDate;
- (NSString)groupingID;
- (NSString)passTypeID;
- (int64_t)passStyle;
- (unint64_t)passType;
- (void)setGroupingID:(id)a3;
- (void)setIngestedDate:(id)a3;
- (void)setMaxDate:(id)a3;
- (void)setMinDate:(id)a3;
- (void)setNFCEnabled:(BOOL)a3;
- (void)setPassStyle:(int64_t)a3;
- (void)setPassTypeID:(id)a3;
- (void)setSortedPassUniqueIdentifiers:(id)a3;
@end

@implementation PDAutomaticGroup

+ (id)createAutomaticGroupForPass:(id)a3 withGroupingProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___PDAutomaticGroup);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 passTypeID]);
  -[PDAutomaticGroup setPassTypeID:](v7, "setPassTypeID:", v8);

  -[PDAutomaticGroup setPassStyle:](v7, "setPassStyle:", [v6 passStyle]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 ingestedDate]);
  -[PDAutomaticGroup setIngestedDate:](v7, "setIngestedDate:", v9);

  if ([v6 passType] != (id)1) {
    -[PDAutomaticGroup setNFCEnabled:](v7, "setNFCEnabled:", [v6 isNFCEnabled]);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 groupingID]);
  if (v10)
  {
    -[PDAutomaticGroup setGroupingID:](v7, "setGroupingID:", v10);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 relevantDates]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[PKPassRelevantDate findDateFromDates:option:]( &OBJC_CLASS___PKPassRelevantDate,  "findDateFromDates:option:",  v11,  0LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[PKPassRelevantDate findDateFromDates:option:]( &OBJC_CLASS___PKPassRelevantDate,  "findDateFromDates:option:",  v11,  3LL));
    -[PDAutomaticGroup setMinDate:](v7, "setMinDate:", v12);
    -[PDAutomaticGroup setMaxDate:](v7, "setMaxDate:", v13);
  }

  id v14 = v6;
  id v15 = [v14 passType];
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 groupingID]);

  if (v15 == (id)1 && v16)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v5 uniqueID]);
    v18 = (void *)v17;
    if (v17)
    {
      uint64_t v21 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
      -[PDAutomaticGroup setSortedPassUniqueIdentifiers:](v7, "setSortedPassUniqueIdentifiers:", v19);
    }
  }

  return v7;
}

- (void)setPassTypeID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  passTypeID = self->_passTypeID;
  self->_passTypeID = v4;

  self->_passType = PKPassTypeForPassTypeIdentifier(self->_passTypeID);
}

- (BOOL)addPass:(id)a3 withGroupingProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  minDate = self->_minDate;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 relevantDates]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[PKPassRelevantDate findDateFromDates:option:]( &OBJC_CLASS___PKPassRelevantDate,  "findDateFromDates:option:",  v9,  0LL));
  uint64_t v11 = PKEarlierDate(minDate, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  char v13 = PKEqualObjects(self->_minDate, v12);
  if ((v13 & 1) == 0) {
    objc_storeStrong((id *)&self->_minDate, v12);
  }
  v47 = v12;
  maxDate = self->_maxDate;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 relevantDates]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[PKPassRelevantDate findDateFromDates:option:]( &OBJC_CLASS___PKPassRelevantDate,  "findDateFromDates:option:",  v15,  3LL));
  uint64_t v17 = PKLaterDate(maxDate, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if ((PKEqualObjects(self->_maxDate, v18) & 1) != 0)
  {
    char v19 = v13 ^ 1;
  }

  else
  {
    objc_storeStrong((id *)&self->_maxDate, v18);
    char v19 = 1;
  }

  ingestedDate = self->_ingestedDate;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 ingestedDate]);
  uint64_t v22 = PKLaterDate(ingestedDate, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if ((PKEqualObjects(self->_ingestedDate, v23) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ingestedDate, v23);
    char v19 = 1;
  }

  if (sub_100379178(self))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    if (v24)
    {
      NSUInteger v25 = -[NSArray count](self->_sortedPassUniqueIdentifiers, "count");
      v26 = objc_alloc(&OBJC_CLASS___NSMutableArray);
      if (v25)
      {
        v43 = v23;
        v44 = v18;
        id v45 = v7;
        id v46 = v6;
        v27 = -[NSMutableArray initWithCapacity:]( v26,  "initWithCapacity:",  (char *)-[NSArray count](self->_sortedPassUniqueIdentifiers, "count") + 1);
        -[NSMutableArray addObject:](v27, "addObject:", v24);
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        v28 = self->_sortedPassUniqueIdentifiers;
        id v29 = -[NSArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v48,  v52,  16LL);
        if (!v29) {
          goto LABEL_25;
        }
        id v30 = v29;
        uint64_t v31 = *(void *)v49;
        while (1)
        {
          for (i = 0LL; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v49 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
            id v34 = v24;
            id v35 = v33;
            if (v34 == v35)
            {

              continue;
            }

            v36 = v35;
            if (!v35)
            {

LABEL_22:
              -[NSMutableArray addObject:](v27, "addObject:", v36);
              continue;
            }

            unsigned __int8 v37 = [v34 isEqualToString:v35];

            if ((v37 & 1) == 0) {
              goto LABEL_22;
            }
          }

          id v30 = -[NSArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v48,  v52,  16LL);
          if (!v30)
          {
LABEL_25:

            id v7 = v45;
            id v6 = v46;
            v23 = v43;
            v18 = v44;
            goto LABEL_29;
          }
        }
      }

      v27 = -[NSMutableArray initWithObjects:](v26, "initWithObjects:", v24, 0LL);
LABEL_29:
      v40 = (NSArray *)-[NSMutableArray copy](v27, "copy");
      sortedPassUniqueIdentifiers = self->_sortedPassUniqueIdentifiers;
      self->_sortedPassUniqueIdentifiers = v40;

      char v19 = 1;
    }

    v39 = v47;
  }

  else
  {
    v38 = self->_sortedPassUniqueIdentifiers;
    v39 = v47;
    if (v38)
    {
      self->_sortedPassUniqueIdentifiers = 0LL;

      char v19 = 1;
    }
  }

  return v19;
}

- (BOOL)removePass:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100379178(self);
  sortedPassUniqueIdentifiers = self->_sortedPassUniqueIdentifiers;
  if (v5)
  {
    if (sortedPassUniqueIdentifiers)
    {
      id v7 = (NSArray *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
      sortedPassUniqueIdentifiers = v7;
      BOOL v8 = v7 != 0LL;
      if (v7)
      {
        v9 = self->_sortedPassUniqueIdentifiers;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_1003792BC;
        v13[3] = &unk_100658678;
        id v14 = v7;
        v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray pk_objectsPassingTest:](v9, "pk_objectsPassingTest:", v13));
        uint64_t v11 = self->_sortedPassUniqueIdentifiers;
        self->_sortedPassUniqueIdentifiers = v10;
      }

      goto LABEL_7;
    }

- (BOOL)updateOrderWithCatalogGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100379178(self);
  sortedPassUniqueIdentifiers = self->_sortedPassUniqueIdentifiers;
  if (v5)
  {
    if (sortedPassUniqueIdentifiers)
    {
      id v7 = -[NSMutableSet initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithArray:",  self->_sortedPassUniqueIdentifiers);
      BOOL v8 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count](self->_sortedPassUniqueIdentifiers, "count"));
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIDs]);
      id v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v30;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
            if (-[NSMutableSet containsObject:](v7, "containsObject:", v14))
            {
              -[NSMutableArray addObject:](v8, "addObject:", v14);
              -[NSMutableSet removeObject:](v7, "removeObject:", v14);
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }

        while (v11);
      }

      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v15 = self->_sortedPassUniqueIdentifiers;
      id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (j = 0LL; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)j);
            if (-[NSMutableSet containsObject:](v7, "containsObject:", v20, (void)v25))
            {
              -[NSMutableArray addObject:](v8, "addObject:", v20);
              -[NSMutableSet removeObject:](v7, "removeObject:", v20);
            }
          }

          id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
        }

        while (v17);
      }

      uint64_t v21 = (NSArray *)-[NSMutableArray copy](v8, "copy");
      uint64_t v22 = self->_sortedPassUniqueIdentifiers;
      self->_sortedPassUniqueIdentifiers = v21;

      goto LABEL_24;
    }

- (NSString)passTypeID
{
  return self->_passTypeID;
}

- (NSString)groupingID
{
  return self->_groupingID;
}

- (void)setGroupingID:(id)a3
{
}

- (int64_t)passStyle
{
  return self->_passStyle;
}

- (void)setPassStyle:(int64_t)a3
{
  self->_passStyle = a3;
}

- (NSDate)minDate
{
  return self->_minDate;
}

- (void)setMinDate:(id)a3
{
}

- (NSDate)maxDate
{
  return self->_maxDate;
}

- (void)setMaxDate:(id)a3
{
}

- (NSDate)ingestedDate
{
  return self->_ingestedDate;
}

- (void)setIngestedDate:(id)a3
{
}

- (BOOL)isNFCEnabled
{
  return self->_nfcEnabled;
}

- (void)setNFCEnabled:(BOOL)a3
{
  self->_nfcEnabled = a3;
}

- (NSArray)sortedPassUniqueIdentifiers
{
  return self->_sortedPassUniqueIdentifiers;
}

- (void)setSortedPassUniqueIdentifiers:(id)a3
{
}

- (unint64_t)passType
{
  return self->_passType;
}

- (void).cxx_destruct
{
}

@end