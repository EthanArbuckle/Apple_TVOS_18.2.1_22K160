@interface MTTVSwitchCell
- (BOOL)customiseLabelAndSeparatorInsets;
- (void)toggleOn:(BOOL)a3;
@end

@implementation MTTVSwitchCell

- (void)toggleOn:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v9 = v5;
  if (v3) {
    v6 = @"Yes";
  }
  else {
    v6 = @"No";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v6 value:&stru_100248948 table:0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSwitchCell detailTextLabel](self, "detailTextLabel"));
  [v8 setText:v7];
}

- (BOOL)customiseLabelAndSeparatorInsets
{
  return 0;
}

@end