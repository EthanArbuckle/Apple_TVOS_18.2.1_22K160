@interface AKUserDefaults
+ (id)objectForKey:(id)a3;
+ (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation AKUserDefaults

+ (void)setValue:(id)a3 forKey:(id)a4
{
}

+ (id)objectForKey:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v3]);

  return v5;
}

@end