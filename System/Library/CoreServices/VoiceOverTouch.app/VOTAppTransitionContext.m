@interface VOTAppTransitionContext
+ (VOTAppTransitionContext)contextWithPID:(int)a3 bundleID:(id)a4 displayName:(id)a5;
- (NSString)announcableName;
- (NSString)bundleID;
- (NSString)displayName;
- (id)description;
- (int)pid;
- (void)setBundleID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setPid:(int)a3;
@end

@implementation VOTAppTransitionContext

+ (VOTAppTransitionContext)contextWithPID:(int)a3 bundleID:(id)a4 displayName:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  v9 = objc_alloc_init(&OBJC_CLASS___VOTAppTransitionContext);
  -[VOTAppTransitionContext setPid:](v9, "setPid:", v6);
  -[VOTAppTransitionContext setBundleID:](v9, "setBundleID:", v8);

  -[VOTAppTransitionContext setDisplayName:](v9, "setDisplayName:", v7);
  return v9;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[VOTAppTransitionContext pid](self, "pid")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTAppTransitionContext displayName](self, "displayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTAppTransitionContext bundleID](self, "bundleID"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTAppTransitionContext announcableName](self, "announcableName"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_VOTAppTransitionContext<%p>. pid:%@ displayName:%@ bundleID:%@ announcableName:%@",  self,  v3,  v4,  v5,  v6));

  return v7;
}

- (NSString)announcableName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTAppTransitionContext bundleID](self, "bundleID"));
  if ([v3 isEqualToString:@"com.apple.HeadBoard"])
  {
    v4 = off_1001AC148;
    v5 = @"app.replacement.name.headboard";
LABEL_6:
    id v8 = sub_10004A988(v4, v5, 0LL);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(v8);
    v10 = &stru_10017A920;
    goto LABEL_7;
  }

  if (([v3 isEqualToString:@"com.apple.TVScreenSaver"] & 1) != 0
    || (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTAppTransitionContext bundleID](self, "bundleID")),
        unsigned int v7 = [v6 isEqualToString:@"com.apple.TVIdleScreen"],
        v6,
        v7))
  {
    v4 = off_1001AC148;
    v5 = @"app.replacement.name.tvscreensaver";
    goto LABEL_6;
  }

  if (([v3 isEqualToString:@"com.apple.TVAirPlay"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.TVPeripheralAgent"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.PineBoard"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.TVConferenceRoomDisplay"] & 1) != 0)
  {
    v10 = &stru_10017A920;
    v9 = &stru_10017A920;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTAppTransitionContext displayName](self, "displayName"));

    if (v12) {
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[VOTAppTransitionContext displayName](self, "displayName"));
    }
    else {
      v13 = &stru_10017A920;
    }
    v10 = v13;
    v9 = v10;
  }

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
}

@end