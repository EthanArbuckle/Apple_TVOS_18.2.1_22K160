void sub_1000018C0(uint64_t a1, INObjectCollection *a2, void *a3)
{
  INObjectCollection *v5;
  id v6;
  v6 = a3;
  if (a2)
  {
    v5 = a2;
    a2 = -[INObjectCollection initWithItems:](objc_alloc(&OBJC_CLASS___INObjectCollection), "initWithItems:", v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100001A40(uint64_t a1, uint64_t a2)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[MTUtilities mtCityFromWorldClockCity:](&OBJC_CLASS___MTUtilities, "mtCityFromWorldClockCity:", a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.mobiletimer-framework"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v7 identifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v4 value:&stru_100004258 table:@"WorldClock"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  LOBYTE(v4) = [v5 isEqualToString:v6];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void sub_100002204(uint64_t a1, INObjectCollection *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    v5 = a2;
    a2 = -[INObjectCollection initWithItems:](objc_alloc(&OBJC_CLASS___INObjectCollection), "initWithItems:", v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100002384(uint64_t a1, uint64_t a2)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[MTUtilities mtCityFromWorldClockCity:](&OBJC_CLASS___MTUtilities, "mtCityFromWorldClockCity:", a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.mobiletimer-framework"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v7 identifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v4 value:&stru_100004258 table:@"WorldClock"]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  LOBYTE(v4) = [v5 isEqualToString:v6];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

id objc_msgSend_dayAndTimeZoneOffsetStringFromDate_withTimeZoneOffset_timeZoneAbbreviation_spaceBeforeTimeDesignator_hoursOnly_numericOnly_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "dayAndTimeZoneOffsetStringFromDate:withTimeZoneOffset:timeZoneAbbreviation:spaceBeforeTimeDesignator:hoursOnly:numericOnly:");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneWithName:");
}