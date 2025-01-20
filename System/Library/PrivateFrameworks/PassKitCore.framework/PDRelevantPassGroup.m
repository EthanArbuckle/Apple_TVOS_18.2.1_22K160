@interface PDRelevantPassGroup
- (NSArray)sortedPasses;
- (NSData)iconData;
- (NSSet)passes;
- (NSString)bodyText;
- (NSString)relevantText;
- (NSString)titleText;
- (PDCandidateRelevantPass)seedPass;
- (PDRelevantPassGroup)init;
- (PDRelevantPassGroup)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4;
- (id)_dateText;
- (void)_addCandidate:(id)a3;
- (void)_addCandidate:(id)a3 withRelevantText:(id)a4;
- (void)_recomputeSeedPass;
- (void)addCandidate:(id)a3 forBeacon:(id)a4;
- (void)addCandidate:(id)a3 forDate:(id)a4;
- (void)addCandidate:(id)a3 forLocation:(id)a4;
- (void)removeCandidate:(id)a3;
@end

@implementation PDRelevantPassGroup

- (PDRelevantPassGroup)init
{
  return 0LL;
}

- (PDRelevantPassGroup)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDRelevantPassGroup;
  v9 = -[PDRelevantPassGroup init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseManager, a3);
    objc_storeStrong((id *)&v10->_cardFileManager, a4);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    passes = v10->_passes;
    v10->_passes = v11;
  }

  return v10;
}

- (NSSet)passes
{
  return (NSSet *)self->_passes;
}

- (NSArray)sortedPasses
{
  id v2 = -[NSMutableSet pk_mutableArrayCopy](self->_passes, "pk_mutableArrayCopy");
  [v2 sortUsingComparator:&stru_100655F00];
  return (NSArray *)v2;
}

- (NSData)iconData
{
  if (self->_seedPass)
  {
    v3 = objc_autoreleasePoolPush();
    databaseManager = self->_databaseManager;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCandidateRelevantPass uniqueIdentifier](self->_seedPass, "uniqueIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](databaseManager, "passWithUniqueIdentifier:", v5));

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 notificationIconImage]);
    id v8 = +[NSData dataWithCGImage:](&OBJC_CLASS___NSData, "dataWithCGImage:", PKPassNotificationIconImage(v7, 0LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    objc_autoreleasePoolPop(v3);
  }

  else
  {
    v9 = 0LL;
  }

  return (NSData *)v9;
}

- (NSString)titleText
{
  return -[PDCandidateRelevantPass organizationName](self->_seedPass, "organizationName");
}

- (NSString)bodyText
{
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[PDRelevantPassGroup _dateText](self, "_dateText"));
  relevantText = v3;
  if (v3 || (relevantText = self->_relevantText) != 0LL)
  {
    v5 = relevantText;
  }

  else
  {
    uint64_t v8 = PKLocalizedString(@"NEARBY");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  }

  v6 = v5;

  return v6;
}

- (NSString)relevantText
{
  return self->_relevantText;
}

- (PDCandidateRelevantPass)seedPass
{
  return self->_seedPass;
}

- (id)_dateText
{
  relevantDate = self->_relevantDate;
  if (relevantDate)
  {
    v3 = relevantDate;
    v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPassRelevantDate date](v3, "date"));
    v6 = v5;
    if (v5)
    {
      if (([v5 isToday] & 1) != 0
        || ([v6 isTomorrow] & 1) != 0
        || [v6 isYesterday])
      {
        -[NSDateFormatter setDateStyle:](v4, "setDateStyle:", 3LL);
        -[NSDateFormatter setTimeStyle:](v4, "setTimeStyle:", 1LL);
        -[NSDateFormatter setDoesRelativeDateFormatting:](v4, "setDoesRelativeDateFormatting:", 1LL);
      }

      else
      {
        -[NSDateFormatter setDateStyle:](v4, "setDateStyle:", 2LL);
        -[NSDateFormatter setTimeStyle:](v4, "setTimeStyle:", 1LL);
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v4, "stringFromDate:", v6));
    }

    else
    {
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue(-[PKPassRelevantDate effectiveStartDate](v3, "effectiveStartDate"));
      v10 = (NSDate *)objc_claimAutoreleasedReturnValue(-[PKPassRelevantDate effectiveEndDate](v3, "effectiveEndDate"));
      uint64_t v11 = PKDateRangeStringFromDateToDate(v9, v10, 0, 0, 1);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pk_uppercaseFirstStringForPreferredLocale"));
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (void)addCandidate:(id)a3 forDate:(id)a4
{
  id v21 = a3;
  id v7 = a4;
  -[PDRelevantPassGroup _addCandidate:](self, "_addCandidate:", v21);
  if (v7)
  {
    p_relevantDate = &self->_relevantDate;
    if (([v7 isEqual:self->_relevantDate] & 1) == 0)
    {
      if (*p_relevantDate)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPassRelevantDate effectiveEndDate](*p_relevantDate, "effectiveEndDate"));
        v10 = v9;
        if (v9)
        {
          [v9 timeIntervalSinceNow];
          double v12 = v11;
        }

        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPassRelevantDate date](*p_relevantDate, "date"));
          [v13 timeIntervalSinceNow];
          double v12 = v14;
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue([v7 effectiveEndDate]);
        v16 = v15;
        if (v15)
        {
          [v15 timeIntervalSinceNow];
          double v18 = v17;
        }

        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v7 date]);
          [v19 timeIntervalSinceNow];
          double v18 = v20;
        }

        if ((v16, v12 < 0.0)
          && v18 > 0.0
          && (id)-[PDCandidateRelevantPass style](self->_seedPass, "style") != (id)4
          || fabs(v18) < fabs(v12))
        {
          objc_storeStrong((id *)&self->_relevantDate, a4);
          objc_storeStrong((id *)&self->_seedPass, a3);
        }
      }
    }
  }
}

- (void)addCandidate:(id)a3 forLocation:(id)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a4 relevantText]);
  -[PDRelevantPassGroup _addCandidate:withRelevantText:](self, "_addCandidate:withRelevantText:", v6, v7);
}

- (void)addCandidate:(id)a3 forBeacon:(id)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a4 relevantText]);
  -[PDRelevantPassGroup _addCandidate:withRelevantText:](self, "_addCandidate:withRelevantText:", v6, v7);
}

- (void)_addCandidate:(id)a3 withRelevantText:(id)a4
{
  double v14 = (PDCandidateRelevantPass *)a3;
  id v6 = a4;
  -[PDRelevantPassGroup _addCandidate:](self, "_addCandidate:", v14);
  if (v14 && !self->_relevantText)
  {
    cardFileManager = self->_cardFileManager;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCandidateRelevantPass uniqueIdentifier](v14, "uniqueIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardFileManager dataAccessorForObjectWithUniqueID:]( cardFileManager,  "dataAccessorForObjectWithUniqueID:",  v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundle]);
    uint64_t v11 = PKLocalizedPassStringForPassBundle(v6, v10, 0LL);
    double v12 = (NSString *)objc_claimAutoreleasedReturnValue(v11);
    relevantText = self->_relevantText;
    self->_relevantText = v12;
  }

  if (self->_seedPass != v14) {
    -[PDRelevantPassGroup _recomputeSeedPass](self, "_recomputeSeedPass");
  }
}

- (void)_addCandidate:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!self->_seedPass)
  {
    objc_storeStrong((id *)&self->_seedPass, a3);
    id v5 = v6;
  }

  -[NSMutableSet addObject:](self->_passes, "addObject:", v5);
}

- (void)removeCandidate:(id)a3
{
  passes = self->_passes;
  id v5 = (PDCandidateRelevantPass *)a3;
  -[NSMutableSet removeObject:](passes, "removeObject:", v5);
  seedPass = self->_seedPass;

  if (seedPass == v5) {
    -[PDRelevantPassGroup _recomputeSeedPass](self, "_recomputeSeedPass");
  }
}

- (void)_recomputeSeedPass
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_passes, "allObjects"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingComparator:&stru_100655F20]);

  v4 = (PDCandidateRelevantPass *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  seedPass = self->_seedPass;
  self->_seedPass = v4;
}

- (void).cxx_destruct
{
}

@end