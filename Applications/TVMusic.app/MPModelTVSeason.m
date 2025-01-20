@interface MPModelTVSeason
- (id)tvm_seasonTitle;
@end

@implementation MPModelTVSeason

- (id)tvm_seasonTitle
{
  if (-[MPModelTVSeason sortType](self, "sortType") || (uint64_t)-[MPModelTVSeason number](self, "number") < 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelTVSeason show](self, "show"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"MusicLibrarySeasonTitle" value:&stru_100279068 table:0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v6,  -[MPModelTVSeason number](self, "number")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelTVSeason show](self, "show"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ – %@",  v8,  v3));
  }

  return v4;
}

@end