@interface NSUserDefaults
- (id)dateForKey:(id)a3;
- (id)fuzzyDaysSinceKey:(id)a3;
- (int)tristateForBoolKey:(id)a3;
@end

@implementation NSUserDefaults

- (id)dateForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self, "objectForKey:", a3));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)fuzzyDaysSinceKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dateForKey:](self, "dateForKey:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[SFAnalytics fuzzyDaysSinceDate:](&OBJC_CLASS___SFAnalytics, "fuzzyDaysSinceDate:", v3)));

  return v4;
}

- (int)tristateForBoolKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self, "objectForKey:", a3));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    int v5 = [v3 BOOLValue];
  }
  else {
    int v5 = -1;
  }

  return v5;
}

@end