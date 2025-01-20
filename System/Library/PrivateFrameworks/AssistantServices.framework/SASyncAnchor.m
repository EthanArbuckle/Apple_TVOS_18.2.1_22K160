@interface SASyncAnchor
- (id)description;
@end

@implementation SASyncAnchor

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = &OBJC_CLASS___SASyncAnchor;
  id v4 = -[SASyncAnchor description](&v9, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASyncAnchor key](self, "key"));
  v7 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@ key: %@", v5, v6);

  return v7;
}

@end