@interface TVSettingsPreferenceKeyValue
- (NSString)key;
- (TVSettingsPreferenceKeyValue)initWithDomain:(id)a3 key:(id)a4 containerPath:(id)a5;
- (id)value;
- (void)dealloc;
- (void)setValue:(id)a3;
@end

@implementation TVSettingsPreferenceKeyValue

- (TVSettingsPreferenceKeyValue)initWithDomain:(id)a3 key:(id)a4 containerPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSettingsPreferenceKeyValue;
  v11 = -[TVSettingsPreferenceKeyValue init](&v14, "init");
  if (v11)
  {
    v12 = (__CFString *)v8;
    v11->_domain = v12;
    v15 = v12;
    v11->_domains = (__CFArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v15,  1LL));
    v11->_key = (__CFString *)v9;
    v11->_containerPath = (__CFString *)v10;
  }

  return v11;
}

- (void)dealloc
{
  key = self->_key;
  if (key) {
    CFRelease(key);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsPreferenceKeyValue;
  -[TVSettingsPreferenceKeyValue dealloc](&v4, "dealloc");
}

- (id)value
{
  return (id)_CFPreferencesCopyAppValueWithContainer( self->_key,  self->_domain,  self->_containerPath);
}

- (void)setValue:(id)a3
{
}

- (NSString)key
{
  return (NSString *)self->_key;
}

@end