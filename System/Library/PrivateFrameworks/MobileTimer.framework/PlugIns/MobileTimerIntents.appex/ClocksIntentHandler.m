@interface ClocksIntentHandler
- (id)allClocks;
- (id)clocksFromCities:(id)a3;
- (id)defaultCitiesForClocks:(id)a3;
- (id)userConfiguredClocks;
- (void)getCitiesMatchingSearch:(id)a3 completionHandler:(id)a4;
- (void)handleClocks:(id)a3 completion:(id)a4;
- (void)provideCitiesOptionsForClocks:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5;
@end

@implementation ClocksIntentHandler

- (void)provideCitiesOptionsForClocks:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 length])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100002204;
    v12[3] = &unk_1000041F0;
    id v13 = v8;
    -[ClocksIntentHandler getCitiesMatchingSearch:completionHandler:]( self,  "getCitiesMatchingSearch:completionHandler:",  v7,  v12);
  }

  else
  {
    v9 = objc_alloc(&OBJC_CLASS___INObjectCollection);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClocksIntentHandler allClocks](self, "allClocks"));
    v11 = -[INObjectCollection initWithItems:](v9, "initWithItems:", v10);

    -[INObjectCollection setUsesIndexedCollation:](v11, "setUsesIndexedCollation:", 1LL);
    (*((void (**)(id, INObjectCollection *, void))v8 + 2))(v8, v11, 0LL);
  }
}

- (id)allClocks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](&OBJC_CLASS___WorldClockManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allCities]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClocksIntentHandler clocksFromCities:](self, "clocksFromCities:", v4));

  return v5;
}

- (id)clocksFromCities:(id)a3
{
  id v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100002384;
  v7[3] = &unk_100004218;
  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v4 = v8;
  [v3 enumerateObjectsUsingBlock:v7];

  id v5 = -[NSMutableArray copy](v4, "copy");
  return v5;
}

- (id)defaultCitiesForClocks:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](&OBJC_CLASS___WorldClockManager, "sharedManager", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 citiesMatchingIdentifiers:&off_1000043B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClocksIntentHandler clocksFromCities:](self, "clocksFromCities:", v5));

  return v6;
}

- (void)getCitiesMatchingSearch:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  v6 = (void (**)(id, void *, void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClocksIntentHandler allClocks](self, "allClocks"));
  if ([v11 length])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](&OBJC_CLASS___WorldClockManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 citiesMatchingName:v11]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClocksIntentHandler clocksFromCities:](self, "clocksFromCities:", v9));

    v6[2](v6, v10, 0LL);
  }

  else
  {
    v6[2](v6, v7, 0LL);
  }
}

- (id)userConfiguredClocks
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](&OBJC_CLASS___WorldClockManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cities]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClocksIntentHandler clocksFromCities:](self, "clocksFromCities:", v4));

  return v5;
}

- (void)handleClocks:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v34 = (void (**)(id, id))a4;
  v38 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  v35 = v5;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 cities]);
  id v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(id *)(*((void *)&v40 + 1) + 8LL * (void)i);
        id v8 = objc_alloc(&OBJC_CLASS___MTWorldClock);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v7 displayString]);
        id v11 = [v8 initWithIdentifier:v9 displayString:v10];

        v12 = (void *)objc_claimAutoreleasedReturnValue([v7 displayString]);
        [v11 setCity:v12];

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 timeZoneName]);
        [v11 setTimeZoneName:v13];

        v14 = (void *)objc_claimAutoreleasedReturnValue([v11 timeZoneName]);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](&OBJC_CLASS___NSTimeZone, "timeZoneWithName:", v14));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        v18 = [v15 secondsFromGMTForDate:v17];
        uint64_t v19 = v18 - (_BYTE *)[v16 secondsFromGMTForDate:v17];
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[MTUtilities dayAndTimeZoneOffsetStringFromDate:withTimeZoneOffset:timeZoneAbbreviation:spaceBeforeTimeDesignator:hoursOnly:numericOnly:]( &OBJC_CLASS___MTUtilities,  "dayAndTimeZoneOffsetStringFromDate:withTimeZoneOffset:timeZoneAbbreviation:spaceBeforeTimeDesi gnator:hoursOnly:numericOnly:",  v17,  v19,  0LL,  0LL,  0LL,  0LL));
        [v11 setSubtitleString:v20];
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
        [v11 setTimeZoneOffsetFromGMT:v21];

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v19));
        [v11 setTimeZoneOffset:v22];

        v23 = (void *)objc_claimAutoreleasedReturnValue([v15 abbreviation]);
        [v11 setTimeZoneAbbreviation:v23];

        id v24 = [v15 isDaylightSavingTime];
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v24));
        [v11 setIsDaylightSavingTime:v25];

        if ((_DWORD)v24) {
          uint64_t v26 = 2LL;
        }
        else {
          uint64_t v26 = 0LL;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedName:locale:", v26, 0, v34));
        [v11 setTimeZoneDisplayName:v27];

        v28 = (void *)objc_claimAutoreleasedReturnValue([v17 dateByAddingTimeInterval:(double)v19]);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 components:252 fromDate:v28]);

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 components:224 fromDate:v28]);

        [v11 setCurrentDate:v30];
        [v11 setCurrentTime:v32];

        -[NSMutableArray addObject:](v38, "addObject:", v11);
      }

      id v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }

    while (v39);
  }

  id v33 = [[ClocksIntentResponse alloc] initWithCode:4 userActivity:0];
  [v33 setClocks:v38];
  v34[2](v34, v33);
}

@end