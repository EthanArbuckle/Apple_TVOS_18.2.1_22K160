@interface CallHistoryDataSourcePredicate
+ (id)predicateFilteringOutCallTypes:(unint64_t)a3;
+ (id)predicateForAudioCalls;
+ (id)predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles:(id)a3 isoCountryCodes:(id)a4;
+ (id)predicateForCallsAfterDate:(id)a3 beforeDate:(id)a4;
+ (id)predicateForCallsThatAreRead:(BOOL)a3;
+ (id)predicateForCallsThatWereAnswered:(BOOL)a3;
+ (id)predicateForCallsThatWereOriginated:(BOOL)a3;
+ (id)predicateForCallsWithAnyOfTheseRemoteParticipantHandles:(id)a3 isoCountryCodes:(id)a4;
+ (id)predicateForCallsWithCallCategory:(unsigned int)a3;
+ (id)predicateForCallsWithDurationGreaterThan:(double)a3;
+ (id)predicateForCallsWithDurationLongerThanImmediateHangUp;
+ (id)predicateForCallsWithNoDuration;
+ (id)predicateForCallsWithNumberOfRemoteParticipants:(int64_t)a3;
+ (id)predicateForCallsWithServiceProvider:(id)a3;
+ (id)predicateForFaceTimeCalls;
+ (id)predicateForJustMissedCalls;
+ (id)predicateForMissedCallsSinceDate:(id)a3;
+ (id)predicateForRemoteParticipantsWithNormalizedValues:(id)a3;
+ (id)predicateForRemoteParticipantsWithValues:(id)a3;
+ (id)predicateForRemoteParticipantsWithValues:(id)a3 caseInsensitiveValues:(id)a4 normalizedValues:(id)a5;
+ (id)predicateForRemoteParticipantsWithValuesCaseInsensitive:(id)a3;
+ (id)predicateForTelephonyCalls;
+ (id)predicateForTelephonyOrFaceTimeCalls;
+ (id)predicateForVideoCalls;
@end

@implementation CallHistoryDataSourcePredicate

+ (id)predicateForJustMissedCalls
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -15.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForMissedCallsSinceDate:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForMissedCallsSinceDate:",  v2));

  return v3;
}

+ (id)predicateForMissedCallsSinceDate:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForCallsThatWereAnswered:0]);
  -[NSMutableArray addObject:](v5, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForCallsThatWereOriginated:0]);
  -[NSMutableArray addObject:](v5, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForCallsWithNoDuration]);
  -[NSMutableArray addObject:](v5, "addObject:", v8);

  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForCallsAfterDate:v4 beforeDate:0]);
    -[NSMutableArray addObject:](v5, "addObject:", v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v5));

  return v10;
}

+ (id)predicateForCallsThatWereAnswered:(BOOL)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"answered = %d",  a3);
}

+ (id)predicateForCallsThatWereOriginated:(BOOL)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"originated = %d",  a3);
}

+ (id)predicateForCallsWithNoDuration
{
  return +[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", @"duration = 0");
}

+ (id)predicateForCallsWithDurationGreaterThan:(double)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"duration > %f",  *(void *)&a3);
}

+ (id)predicateForCallsWithDurationLongerThanImmediateHangUp
{
  return [a1 predicateForCallsWithDurationGreaterThan:3.0];
}

+ (id)predicateForCallsAfterDate:(id)a3 beforeDate:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"date > %@",  v5));
      -[NSMutableArray addObject:](v7, "addObject:", v8);
    }

    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"date < %@",  v6));
      -[NSMutableArray addObject:](v7, "addObject:", v9);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v7));
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  }

  return v10;
}

+ (id)predicateForCallsWithNumberOfRemoteParticipants:(int64_t)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"remoteParticipantHandles.@count = %d",  a3);
}

+ (id)predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles:(id)a3 isoCountryCodes:(id)a4
{
  id v5 = a3;
  id v30 = a4;
  unint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v27 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v28 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[CHHandle tu_normalizedCHHandlesFromTUHandle:isoCountryCodes:]( &OBJC_CLASS___CHHandle,  "tu_normalizedCHHandlesFromTUHandle:isoCountryCodes:",  v11,  v30));
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v32;
          do
          {
            for (j = 0LL; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v12);
              }
              if ([v17 length]) {
                -[NSMutableOrderedSet addObject:](v6, "addObject:", v17);
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }

          while (v14);
        }

        id v18 = [v11 type];
        if (v18 == (id)1 || v18 == (id)3)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 destinationIDWithoutControlOrPhoneNumberSeparatorCharacters]);
          v22 = v28;
        }

        else
        {
          if (v18 != (id)2) {
            goto LABEL_24;
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
          -[NSMutableOrderedSet addObject:](v27, "addObject:", v23);

          v20 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 destinationIDWithoutControlOrPhoneNumberSeparatorCharacters]);
          v22 = v27;
        }

        -[NSMutableOrderedSet addObject:](v22, "addObject:", v21);

LABEL_24:
      }

      id v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }

    while (v8);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue( [a1 predicateForRemoteParticipantsWithValues:v27 caseInsensitiveValues:v28 normalizedValues:v6]);
  return v24;
}

+ (id)predicateForCallsWithAnyOfTheseRemoteParticipantHandles:(id)a3 isoCountryCodes:(id)a4
{
  id v24 = a1;
  id v5 = a3;
  id v29 = a4;
  unint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v28 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[CHHandle tu_normalizedCHHandlesFromTUHandle:isoCountryCodes:]( &OBJC_CLASS___CHHandle,  "tu_normalizedCHHandlesFromTUHandle:isoCountryCodes:",  v10,  v29,  v24));
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        id v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v12)
        {
          id v13 = v12;
          char v14 = 0;
          uint64_t v15 = *(void *)v31;
          do
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v11);
              }
              if ([v17 length]) {
                -[NSMutableOrderedSet addObject:](v6, "addObject:", v17);
              }
              else {
                char v14 = 1;
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }

          while (v13);
        }

        else
        {
          char v14 = 0;
        }

        if (![v11 count] || (v14 & 1) != 0)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 value]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 destinationIDWithoutControlOrPhoneNumberSeparatorCharacters]);

          if ([v19 length])
          {
            id v20 = [v10 type];
            if (v20 == (id)3) {
              goto LABEL_24;
            }
            v21 = v26;
            if (v20 == (id)2)
            {
LABEL_25:
              -[NSMutableOrderedSet addObject:](v21, "addObject:", v19);
            }

            else if (v20 == (id)1)
            {
LABEL_24:
              v21 = v25;
              goto LABEL_25;
            }
          }
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }

    while (v8);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( [v24 predicateForRemoteParticipantsWithValues:v26 caseInsensitiveValues:v25 normalizedValues:v6]);
  return v22;
}

+ (id)predicateForRemoteParticipantsWithValues:(id)a3 caseInsensitiveValues:(id)a4 normalizedValues:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v12 = [(id)objc_opt_class(a1) predicateForRemoteParticipantsWithNormalizedValues:v8];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13) {
    -[NSMutableArray addObject:](v11, "addObject:", v13);
  }
  id v14 = [(id)objc_opt_class(a1) predicateForRemoteParticipantsWithValues:v10];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15) {
    -[NSMutableArray addObject:](v11, "addObject:", v15);
  }
  id v16 = [(id)objc_opt_class(a1) predicateForRemoteParticipantsWithValuesCaseInsensitive:v9];
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v17);
  if (-[NSMutableArray count](v11, "count") == (id)1)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v11, "firstObject"));
  }

  else
  {
    id v19 = -[NSMutableArray copy](v11, "copy");
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v19));
  }

  return v18;
}

+ (id)predicateForRemoteParticipantsWithNormalizedValues:(id)a3
{
  id v3 = a3;
  if ([v3 count] == (id)1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
    id v5 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"ANY remoteParticipantHandles.normalizedValue == %@",  v4);
  }

  else
  {
    if ((unint64_t)[v3 count] < 2)
    {
      unint64_t v6 = 0LL;
      goto LABEL_7;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 array]);
    id v5 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"ANY remoteParticipantHandles.normalizedValue IN %@",  v4);
  }

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

LABEL_7:
  return v6;
}

+ (id)predicateForRemoteParticipantsWithValues:(id)a3
{
  id v3 = a3;
  if ([v3 count] == (id)1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
    id v5 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"ANY remoteParticipantHandles.value == %@",  v4);
  }

  else
  {
    if ((unint64_t)[v3 count] < 2)
    {
      unint64_t v6 = 0LL;
      goto LABEL_7;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 array]);
    id v5 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"ANY remoteParticipantHandles.value IN %@",  v4);
  }

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

LABEL_7:
  return v6;
}

+ (id)predicateForRemoteParticipantsWithValuesCaseInsensitive:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"ANY remoteParticipantHandles.value ==[c] %@",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9)));
        -[NSMutableArray addObject:](v4, "addObject:", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = -[NSMutableArray copy](v4, "copy");
  return v11;
}

+ (id)predicateForCallsWithServiceProvider:(id)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"service_provider = %@",  a3);
}

+ (id)predicateForTelephonyCalls
{
  return [a1 predicateForCallsWithServiceProvider:kCHServiceProviderTelephony];
}

+ (id)predicateForFaceTimeCalls
{
  return [a1 predicateForCallsWithServiceProvider:kCHServiceProviderFaceTime];
}

+ (id)predicateForTelephonyOrFaceTimeCalls
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForTelephonyCalls]);
  v8[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForFaceTimeCalls]);
  v8[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v5));

  return v6;
}

+ (id)predicateForCallsWithCallCategory:(unsigned int)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"call_category == %@",  v3));

  return v4;
}

+ (id)predicateForAudioCalls
{
  return [a1 predicateForCallsWithCallCategory:kCHCallCategoryAudio];
}

+ (id)predicateForVideoCalls
{
  return [a1 predicateForCallsWithCallCategory:kCHCallCategoryVideo];
}

+ (id)predicateForCallsThatAreRead:(BOOL)a3
{
  return +[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", @"read == %d", a3);
}

+ (id)predicateFilteringOutCallTypes:(unint64_t)a3
{
  int v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ((v3 & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForTelephonyCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForTelephonyCalls"));
    -[NSMutableArray addObject:](v4, "addObject:", v5);
  }

  if ((~v3 & 6LL) != 0)
  {
    if ((v3 & 2) != 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForFaceTimeCalls"));
      v15[0] = v7;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForAudioCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForAudioCalls"));
      v15[1] = v8;
      id v9 = v15;
    }

    else
    {
      if ((v3 & 4) == 0) {
        goto LABEL_11;
      }
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForFaceTimeCalls"));
      v14[0] = v7;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForVideoCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForVideoCalls"));
      v14[1] = v8;
      id v9 = v14;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v10));
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForFaceTimeCalls"));
  }

  -[NSMutableArray addObject:](v4, "addObject:", v6);

LABEL_11:
  if (-[NSMutableArray count](v4, "count"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v4));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v11));
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  }

  return v12;
}

@end