@interface _TVSettingsPreferenceInvalidKeyValue
- (id)key;
- (id)value;
@end

@implementation _TVSettingsPreferenceInvalidKeyValue

- (id)key
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____TVSettingsPreferenceInvalidKeyValue;
  v2 = -[TVSettingsPreferenceKeyValue key](&v6, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v3));

  return v4;
}

- (id)value
{
  return 0LL;
}

@end