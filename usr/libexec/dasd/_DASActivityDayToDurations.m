@interface _DASActivityDayToDurations
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSDictionary)activityDurations;
- (_DASActivityDayToDurations)initWithCoder:(id)a3;
- (_DASActivityDayToDurations)initWithDate:(id)a3 activityDurations:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityDurations:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation _DASActivityDayToDurations

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations date](self, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations activityDurations](self, "activityDurations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Date: %@, Activity Durations %@",  v3,  v4));

  return v5;
}

- (_DASActivityDayToDurations)initWithDate:(id)a3 activityDurations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____DASActivityDayToDurations;
  v9 = -[_DASActivityDayToDurations init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    objc_storeStrong((id *)&v10->_activityDurations, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class(self) allocWithZone:a3];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations date](self, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityDayToDurations activityDurations](self, "activityDurations"));
  id v7 = [v4 initWithDate:v5 activityDurations:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  [v5 encodeObject:self->_activityDurations forKey:@"activityDurations"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASActivityDayToDurations)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"date"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  v8,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"activityDurations"]);

  objc_super v12 = 0LL;
  if (v6) {
    BOOL v13 = v11 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13) {
    objc_super v12 = (_DASActivityDayToDurations *)[objc_alloc((Class)objc_opt_class(self)) initWithDate:v6 activityDurations:v11];
  }

  return v12;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSDictionary)activityDurations
{
  return self->_activityDurations;
}

- (void)setActivityDurations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end