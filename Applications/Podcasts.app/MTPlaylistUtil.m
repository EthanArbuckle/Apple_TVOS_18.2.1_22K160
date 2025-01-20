@interface MTPlaylistUtil
+ (id)stringForEmptyMessage:(id)a3;
+ (id)stringForUnplayedCount:(int64_t)a3;
+ (id)textForUnplayed:(id)a3;
+ (id)textForUnplayedShort:(id)a3;
@end

@implementation MTPlaylistUtil

+ (id)stringForUnplayedCount:(int64_t)a3
{
  if (a3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = v4;
    v6 = @"1 Unplayed";
  }

  else
  {
    if (a3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"%@ Unplayed" value:&stru_100248948 table:0]);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      uint64_t v10 = IMAccessibilityLocalizedNumber(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v5,  @"%@",  0LL,  v11));

      goto LABEL_7;
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = v4;
    v6 = @"0 Unplayed";
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:&stru_100248948 table:0]);
LABEL_7:

  return v7;
}

+ (id)stringForEmptyMessage:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"EMPTY_STATION_IOS" value:&stru_100248948 table:0]);

  return v4;
}

+ (id)textForUnplayed:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 episodes]);
  uint64_t v6 = (uint64_t)[v5 count];

  if (v6 < 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"STATIONS_LABEL_EMPTY" value:&stru_100248948 table:0]);
LABEL_9:

    goto LABEL_10;
  }

  [v4 totalDuration];
  if (v7 != 0.0)
  {
    double v10 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v12 = v11;
    if (v6 == 1) {
      v13 = @"STATIONS_COUNT_EPISODES_SINGULAR_FORMAT";
    }
    else {
      v13 = @"STATIONS_COUNT_EPISODES_FORMAT";
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:v13 value:&stru_100248948 table:0]);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString prettyStringWithDuration:](&OBJC_CLASS___NSString, "prettyStringWithDuration:", v10));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6));
    uint64_t v16 = IMAccessibilityLocalizedNumber(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v9,  @"%@ %@",  0LL,  v17,  v14));
    goto LABEL_9;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 textForUnplayedShort:v4]);
LABEL_10:

  return v8;
}

+ (id)textForUnplayedShort:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 episodes]);
  uint64_t v4 = (uint64_t)[v3 count];

  if (v4 < 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v6 = v5;
    double v7 = @"STATIONS_LABEL_EMPTY";
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v6 = v5;
    if (v4 != 1)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"%@ Episodes" value:&stru_100248948 table:0]);

      double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
      uint64_t v11 = IMAccessibilityLocalizedNumber(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v9,  @"%@",  0LL,  v12));
      uint64_t v6 = (void *)v9;
      goto LABEL_7;
    }

    double v7 = @"1 Episode";
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v7 value:&stru_100248948 table:0]);
LABEL_7:

  return v8;
}

@end