@interface IDSActivityDescription
+ (BOOL)supportsSecureCoding;
- (IDSActivityDescription)initWithCoder:(id)a3;
- (NSString)activity;
- (NSString)subActivity;
- (double)timeSubscribed;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActivity:(id)a3;
- (void)setSubActivity:(id)a3;
- (void)setTimeSubscribed:(double)a3;
@end

@implementation IDSActivityDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double timeSubscribed = self->_timeSubscribed;
  id v5 = a3;
  [v5 encodeDouble:@"time" forKey:timeSubscribed];
  [v5 encodeObject:self->_activity forKey:@"activity"];
  [v5 encodeObject:self->_subActivity forKey:@"subactivity"];
}

- (IDSActivityDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IDSActivityDescription;
  v6 = -[IDSActivityDescription init](&v16, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"activity");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    activity = v6->_activity;
    v6->_activity = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"subactivity");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    subActivity = v6->_subActivity;
    v6->_subActivity = (NSString *)v12;

    [v4 decodeDoubleForKey:@"time"];
    v6->_double timeSubscribed = v14;
  }

  return v6;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; timeSubscribed: %fL; activity: %@; subActivity: %@>",
           objc_opt_class(self, a2),
           self,
           *(void *)&self->_timeSubscribed,
           self->_activity,
           self->_subActivity);
}

- (double)timeSubscribed
{
  return self->_timeSubscribed;
}

- (void)setTimeSubscribed:(double)a3
{
  self->_double timeSubscribed = a3;
}

- (NSString)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (NSString)subActivity
{
  return self->_subActivity;
}

- (void)setSubActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end