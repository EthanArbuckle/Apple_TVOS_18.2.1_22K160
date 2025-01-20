@interface MobileTimerAlarmObject
+ (id)alarmObjectWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (NSNumber)enabled;
- (NSURL)alarmId;
- (void)setDictionary:(id)a3;
@end

@implementation MobileTimerAlarmObject

+ (id)alarmObjectWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___MobileTimerAlarmObject);
  -[MobileTimerAlarmObject setDictionary:](v4, "setDictionary:", v3);

  return v4;
}

- (NSURL)alarmId
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](self->_dictionary, "valueForKey:", SAAlarmUpdateAlarmIdPListKey));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v2));
  }
  else {
    v4 = 0LL;
  }

  return (NSURL *)v4;
}

- (NSNumber)enabled
{
  return (NSNumber *)-[NSDictionary valueForKey:](self->_dictionary, "valueForKey:", SAAlarmUpdateEnabledPListKey);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end