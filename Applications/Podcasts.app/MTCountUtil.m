@interface MTCountUtil
+ (id)stringForEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4;
+ (id)stringForNewEpisodeCount:(int64_t)a3;
+ (id)stringForNewEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4;
+ (id)stringForPodcastCount:(int64_t)a3;
+ (id)stringForStationCount:(int64_t)a3;
+ (id)stringForUnplayedEpisodeCount:(int64_t)a3;
+ (id)stringForUnplayedEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4;
@end

@implementation MTCountUtil

+ (id)stringForEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    if (v4) {
      v7 = @"1 Episode";
    }
    else {
      v7 = @"1 episode";
    }
    goto LABEL_13;
  }

  if (!a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    if (v4) {
      v7 = @"0 Episodes";
    }
    else {
      v7 = @"0 episodes";
    }
LABEL_13:
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v7 value:&stru_100248948 table:0]);
    goto LABEL_14;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = v8;
  if (v4) {
    v10 = @"%@ Episodes";
  }
  else {
    v10 = @"%@ episodes";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:&stru_100248948 table:0]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  uint64_t v12 = IMAccessibilityLocalizedNumber(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v6,  @"%@",  0LL,  v13));

LABEL_14:
  return v14;
}

+ (id)stringForNewEpisodeCount:(int64_t)a3
{
  return [a1 stringForNewEpisodeCount:a3 titleCase:0];
}

+ (id)stringForNewEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    if (v4) {
      v7 = @"1 New Episode";
    }
    else {
      v7 = @"1 new episode";
    }
    goto LABEL_13;
  }

  if (!a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    if (v4) {
      v7 = @"0 New Episodes";
    }
    else {
      v7 = @"0 new episodes";
    }
LABEL_13:
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v7 value:&stru_100248948 table:0]);
    goto LABEL_14;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = v8;
  if (v4) {
    v10 = @"%@ New Episodes";
  }
  else {
    v10 = @"%@ new episodes";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:&stru_100248948 table:0]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  uint64_t v12 = IMAccessibilityLocalizedNumber(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v6,  @"%@",  0LL,  v13));

LABEL_14:
  return v14;
}

+ (id)stringForUnplayedEpisodeCount:(int64_t)a3
{
  return [a1 stringForUnplayedEpisodeCount:a3 titleCase:0];
}

+ (id)stringForUnplayedEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    if (v4) {
      v7 = @"1 Unplayed Episode";
    }
    else {
      v7 = @"1 unplayed episode";
    }
    goto LABEL_13;
  }

  if (!a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    if (v4) {
      v7 = @"0 Unplayed Episodes";
    }
    else {
      v7 = @"0 unplayed episodes";
    }
LABEL_13:
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v7 value:&stru_100248948 table:0]);
    goto LABEL_14;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = v8;
  if (v4) {
    v10 = @"%@ Unplayed Episodes";
  }
  else {
    v10 = @"%@ unplayed episodes";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:&stru_100248948 table:0]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  uint64_t v12 = IMAccessibilityLocalizedNumber(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v6,  @"%@",  0LL,  v13));

LABEL_14:
  return v14;
}

+ (id)stringForPodcastCount:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = v4;
    v6 = @"1 podcast";
  }

  else
  {
    if (a3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"%@ podcasts" value:&stru_100248948 table:0]);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      uint64_t v10 = IMAccessibilityLocalizedNumber(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v5,  @"%@",  0LL,  v11));

      goto LABEL_7;
    }

    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = v4;
    v6 = @"0 podcasts";
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:&stru_100248948 table:0]);
LABEL_7:

  return v7;
}

+ (id)stringForStationCount:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = v4;
    v6 = @"1 station";
  }

  else
  {
    if (a3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"%@ stations" value:&stru_100248948 table:0]);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      uint64_t v10 = IMAccessibilityLocalizedNumber(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v5,  @"%@",  0LL,  v11));

      goto LABEL_7;
    }

    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = v4;
    v6 = @"0 stations";
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:&stru_100248948 table:0]);
LABEL_7:

  return v7;
}

@end