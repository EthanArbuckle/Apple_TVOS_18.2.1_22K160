@interface TVUNRentalUtilities
+ (id)fetchRentals;
+ (id)validRentalWithIdentifier:(unint64_t)a3 inRentals:(id)a4;
@end

@implementation TVUNRentalUtilities

+ (id)fetchRentals
{
  id v2 = sub_1000084A0();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "TVUNRentalUtilities - Begin fetchRentals",  (uint8_t *)&v19,  2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (qword_1000364B0 != -1) {
    dispatch_once(&qword_1000364B0, &stru_100031100);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery movieRentalsQuery](&OBJC_CLASS___MPMediaQuery, "movieRentalsQuery"));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  uint64_t v7 = MPMediaItemPropertyRentalExpirationDate;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:]( &OBJC_CLASS___MPMediaPropertyPredicate,  "predicateWithValue:forProperty:comparisonType:",  v6,  MPMediaItemPropertyRentalExpirationDate,  101LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:]( &OBJC_CLASS___MPMediaPropertyPredicate,  "predicateWithValue:forProperty:comparisonType:",  &off_100032C98,  v7,  0LL));
  v23[0] = v8;
  v23[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaCompoundAnyPredicate predicateMatchingPredicates:]( &OBJC_CLASS___MPMediaCompoundAnyPredicate,  "predicateMatchingPredicates:",  v10));

  [v5 addFilterPredicate:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
  id v13 = sub_1000084A0();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v12 count]));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v16 timeIntervalSinceDate:v4];
    int v19 = 138412546;
    v20 = v15;
    __int16 v21 = 2048;
    uint64_t v22 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "TVUNRentalUtilities- End fetchRentals [%@] elapsed:%.5f",  (uint8_t *)&v19,  0x16u);
  }

  return v12;
}

+ (id)validRentalWithIdentifier:(unint64_t)a3 inRentals:(id)a4
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v5 = a4;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = MPMediaItemPropertyStoreID;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForProperty:", v9, (void)v20));
      id v13 = [v12 longLongValue];

      if (v13 == (id)a3) {
        break;
      }
      if (v7 == (id)++v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }

    id v14 = sub_1000084A0();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v25 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "TVUNRentalUtilities- Found rental: %llu",  buf,  0xCu);
    }

    if ((objc_msgSend(v11, "tvun_isExpired") & 1) == 0)
    {
      id v18 = v11;
      goto LABEL_18;
    }

    id v16 = sub_1000084A0();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v25 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "TVUNRentalUtilities -Skipping expired rental: %llu",  buf,  0xCu);
    }
  }

@end