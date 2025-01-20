@interface TVPSharedPSUtilities
+ (id)_getDateForElapsedDays:(int64_t)a3 fromDate:(id)a4;
+ (id)formattedDateStringForPhotoStreamBatch:(id)a3;
+ (id)getFormattedStringForCommentPostedOnDate:(id)a3;
+ (id)photoStreamBatchesForPhotos:(id)a3;
+ (id)sortedPhotosFromPhotoBatches:(id)a3;
+ (id)stringForDisplayingDateAndTime:(id)a3;
+ (id)stringForDisplayingDateOnly:(id)a3;
+ (id)stringForDisplayingTime12H:(id)a3;
@end

@implementation TVPSharedPSUtilities

+ (id)stringForDisplayingTime12H:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_100102EE8 != -1)
  {
    dispatch_once(&qword_100102EE8, &stru_1000C9FB0);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    v5 = 0LL;
    goto LABEL_6;
  }

  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100102EE0 stringFromDate:v4]);
LABEL_6:

  return v5;
}

+ (id)stringForDisplayingDateAndTime:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_100102EF8 != -1)
  {
    dispatch_once(&qword_100102EF8, &stru_1000C9FD0);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    v5 = 0LL;
    goto LABEL_6;
  }

  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100102EF0 stringFromDate:v4]);
LABEL_6:

  return v5;
}

+ (id)stringForDisplayingDateOnly:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_100102F08 != -1)
  {
    dispatch_once(&qword_100102F08, &stru_1000C9FF0);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    v5 = 0LL;
    goto LABEL_6;
  }

  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100102F00 stringFromDate:v4]);
LABEL_6:

  return v5;
}

+ (id)getFormattedStringForCommentPostedOnDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  [v6 setTimeZone:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 components:252 fromDate:v5]);
  [v8 setHour:0];
  [v8 setMinute:0];
  [v8 setSecond:0];
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 dateFromComponents:v8]);
  id v11 = objc_msgSend((id)objc_opt_class(a1, v10), "_getDateForElapsedDays:fromDate:", -1, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v14 = objc_msgSend((id)objc_opt_class(a1, v13), "_getDateForElapsedDays:fromDate:", -2, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v17 = objc_msgSend((id)objc_opt_class(a1, v16), "_getDateForElapsedDays:fromDate:", -3, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v20 = objc_msgSend((id)objc_opt_class(a1, v19), "_getDateForElapsedDays:fromDate:", -6, v9);
  uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
  id v23 = objc_msgSend((id)objc_opt_class(a1, v22), "_getDateForElapsedDays:fromDate:", -4, v9);
  v70 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = objc_msgSend((id)objc_opt_class(a1, v24), "_getDateForElapsedDays:fromDate:", -5, v9);
  uint64_t v69 = objc_claimAutoreleasedReturnValue(v25);
  id v27 = objc_msgSend((id)objc_opt_class(a1, v26), "_getDateForElapsedDays:fromDate:", -7, v9);
  v68 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v5 timeIntervalSinceDate:v4];
  double v29 = v28;
  [v5 timeIntervalSinceDate:v9];
  v67 = (void *)v21;
  if (v29 <= v31)
  {
    if ((uint64_t)(v29 / 3600.0) < 1)
    {
      id v53 = objc_msgSend((id)objc_opt_class(a1, v30), "stringForDisplayingTime12H:", v4);
      uint64_t v41 = objc_claimAutoreleasedReturnValue(v53);
      goto LABEL_14;
    }

    v64 = v18;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v43 = v8;
    v44 = v5;
    v45 = v6;
    id v46 = v4;
    v47 = v15;
    v48 = v12;
    v49 = (void *)objc_claimAutoreleasedReturnValue( [v42 localizedStringForKey:@"CommentPostedSomeHoursAgo" value:&stru_1000CC6C8 table:0]);
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v49,  (uint64_t)(v29 / 3600.0)));

    v12 = v48;
    v15 = v47;
    id v4 = v46;
    v6 = v45;
    v5 = v44;
    v8 = v43;

    v18 = v64;
LABEL_18:
    v58 = (void *)v69;
    goto LABEL_19;
  }

  [v5 timeIntervalSinceDate:v12];
  if (v29 <= v32)
  {
    v51 = v18;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v50 = (void *)objc_claimAutoreleasedReturnValue( [v52 localizedStringForKey:@"CommentPostedYesterday" value:&stru_1000CC6C8 table:0]);

    v18 = v51;
    goto LABEL_18;
  }

  [v5 timeIntervalSinceDate:v15];
  if (v29 <= v33)
  {
    v65 = v12;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v55 = v18;
    v56 = (void *)objc_claimAutoreleasedReturnValue( [v54 localizedStringForKey:@"CommentPostedSomeDaysAgo" value:&stru_1000CC6C8 table:0]);
    uint64_t v57 = 2LL;
LABEL_17:
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v56,  v57));

    v18 = v55;
    v12 = v65;
    goto LABEL_18;
  }

  [v5 timeIntervalSinceDate:v18];
  if (v29 <= v34)
  {
    v65 = v12;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v55 = v18;
    v56 = (void *)objc_claimAutoreleasedReturnValue( [v54 localizedStringForKey:@"CommentPostedSomeDaysAgo" value:&stru_1000CC6C8 table:0]);
    uint64_t v57 = 3LL;
    goto LABEL_17;
  }

  [v5 timeIntervalSinceDate:v70];
  if (v29 > v35)
  {
    [v5 timeIntervalSinceDate:v69];
    if (v29 > v36)
    {
      [v5 timeIntervalSinceDate:v21];
      if (v29 > v37)
      {
        [v5 timeIntervalSinceDate:v68];
        if (v29 > v39)
        {
          id v40 = objc_msgSend((id)objc_opt_class(a1, v38), "stringForDisplayingDateOnly:", v4);
          uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
LABEL_14:
          v50 = (void *)v41;
          goto LABEL_18;
        }
      }
    }
  }

  v66 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v66, "setDateFormat:", @"EEEE");
  [v5 timeIntervalSinceDate:v70];
  v60 = v70;
  v58 = (void *)v69;
  if (v29 > v61)
  {
    [v5 timeIntervalSinceDate:v69];
    v60 = (void *)v69;
    if (v29 > v62)
    {
      [v5 timeIntervalSinceDate:v21];
      if (v29 <= v63) {
        v60 = (void *)v21;
      }
      else {
        v60 = v68;
      }
    }
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v66, "stringFromDate:", v60));

LABEL_19:
  return v50;
}

+ (id)photoStreamBatchesForPhotos:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_10001493C;
  v12 = &unk_1000CA018;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v14 = v4;
  id v5 = v4;
  id v6 = v13;
  [v3 enumerateObjectsUsingBlock:&v9];

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingComparator:", &stru_1000CA058, v9, v10, v11, v12));
  return v7;
}

+ (id)sortedPhotosFromPhotoBatches:(id)a3
{
  id v3 = a3;
  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v3;
  id v21 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v21)
  {
    int v4 = 0;
    uint64_t v5 = 0LL;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        [v7 setBatchIndex:v5];
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 photosInfo]);
        if ([v8 count])
        {
          uint64_t v22 = v5;
          unint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
          uint64_t v11 = 0LL;
          do
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue([v7 photoIndices]);
            id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (v4 + v9)));
            [v12 addObject:v13];

            id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v9]);
            if ([v14 mediaType] == (id)2) {
              ++v10;
            }
            else {
              ++v11;
            }

            ++v9;
          }

          while (v9 < (unint64_t)[v8 count]);
          v4 += v9;
          uint64_t v5 = v22;
        }

        else
        {
          uint64_t v11 = 0LL;
          uint64_t v10 = 0LL;
        }

        [v7 setPhotoAssetCount:v11];
        [v7 setVideoAssetCount:v10];
        v15 = (void *)objc_claimAutoreleasedReturnValue([v7 photosInfo]);
        -[NSMutableArray addObjectsFromArray:](v20, "addObjectsFromArray:", v15);

        ++v5;
      }

      id v21 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v21);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v20));
  return v16;
}

+ (id)_getDateForElapsedDays:(int64_t)a3 fromDate:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  [v6 setTimeZone:v7];
  v8 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setDay:](v8, "setDay:", a3);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingComponents:v8 toDate:v5 options:0]);

  return v9;
}

+ (id)formattedDateStringForPhotoStreamBatch:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;

    if (v6 >= 604800.0)
    {
      if (v6 >= 1209600.0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"photoStreamPhotosEarlierThanTwoWeeks" value:&stru_1000CC6C8 table:0]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v11,  2LL));

        goto LABEL_9;
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v7;
      unint64_t v9 = @"photoStreamPhotosLastWeek";
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v7;
      unint64_t v9 = @"photoStreamPhotosThisWeek";
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v9 value:&stru_1000CC6C8 table:0]);
LABEL_9:

    return v10;
  }

  uint64_t v10 = 0LL;
  return v10;
}

@end