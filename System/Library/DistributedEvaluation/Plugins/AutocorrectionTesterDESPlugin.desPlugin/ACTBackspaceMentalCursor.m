@interface ACTBackspaceMentalCursor
- (ACTBackspaceMentalCursor)init;
- (id)description;
@end

@implementation ACTBackspaceMentalCursor

- (ACTBackspaceMentalCursor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ACTBackspaceMentalCursor;
  return -[ACTBackspaceMentalCursor init](&v3, "init");
}

- (id)description
{
  v2 = (objc_class *)objc_opt_class(self);
  objc_super v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@>", v4));

  return v5;
}

@end