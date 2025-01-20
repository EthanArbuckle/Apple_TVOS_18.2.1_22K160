@interface STAlarm
- (void)_ad_updateWithModification:(id)a3;
@end

@implementation STAlarm

- (void)_ad_updateWithModification:(id)a3
{
  id v14 = a3;
  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v14 enabled]);
  v6 = v5;
  if (v5) {
    -[STAlarm setEnabled:](v4, "setEnabled:", [v5 BOOLValue]);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v14 hour]);
  v8 = v7;
  if (v7) {
    -[STAlarm setHourOfDay:](v4, "setHourOfDay:", [v7 integerValue]);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v14 minute]);
  v10 = v9;
  if (v9) {
    -[STAlarm setMinuteOfHour:](v4, "setMinuteOfHour:", [v9 integerValue]);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v14 label]);
  if (v11) {
    -[STAlarm setLabel:](v4, "setLabel:", v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v14 addedFrequency]);
  if ([v12 count]) {
    -[STAlarm setDaysOfWeek:]( v4,  "setDaysOfWeek:",  (unint64_t)-[STAlarm daysOfWeek](v4, "daysOfWeek") & sub_10022A6CC(v12));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([v14 removedFrequency]);
  if ([v13 count]) {
    -[STAlarm setDaysOfWeek:]( v4,  "setDaysOfWeek:",  (unint64_t)-[STAlarm daysOfWeek](v4, "daysOfWeek") & ~sub_10022A6CC(v13));
  }
}

@end