@interface FFFeatureState
- (id)name;
@end

@implementation FFFeatureState

- (id)name
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FFFeatureState domain](self, "domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FFFeatureState feature](self, "feature"));
  v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@/%@", v4, v5);

  return v6;
}

@end