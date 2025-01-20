@interface TVSettingsContainerizedPreferencesFacade
- (NSMutableDictionary)valueKeyPairs;
- (NSString)containerPath;
- (NSString)domain;
- (TVSettingsContainerizedPreferencesFacade)initWithDomain:(id)a3 containerPath:(id)a4;
- (id)valueForPreferenceKey:(id)a3;
- (void)setValueKeyPairs:(id)a3;
@end

@implementation TVSettingsContainerizedPreferencesFacade

- (TVSettingsContainerizedPreferencesFacade)initWithDomain:(id)a3 containerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___TVSettingsContainerizedPreferencesFacade;
    v9 = -[TVSettingsContainerizedPreferencesFacade init](&v18, "init");
    if (v9)
    {
      v10 = (NSString *)[v6 copy];
      domain = v9->_domain;
      v9->_domain = v10;

      v12 = (NSString *)[v8 copy];
      containerPath = v9->_containerPath;
      v9->_containerPath = v12;

      v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      valueKeyPairs = v9->_valueKeyPairs;
      v9->_valueKeyPairs = v14;
    }

    self = v9;
    v16 = self;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000FAA80((uint64_t)v6, (uint64_t)v8);
    }
    v16 = 0LL;
  }

  return v16;
}

- (id)valueForPreferenceKey:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = (_TVSettingsPreferenceInvalidKeyValue *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_valueKeyPairs,  "objectForKeyedSubscript:",  v5));
    if (!v6)
    {
      id v6 = -[TVSettingsPreferenceKeyValue initWithDomain:key:containerPath:]( objc_alloc(&OBJC_CLASS___TVSettingsPreferenceKeyValue),  "initWithDomain:key:containerPath:",  self->_domain,  v5,  self->_containerPath);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_valueKeyPairs, "setObject:forKeyedSubscript:", v6, v5);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000FAB08((uint64_t)self);
    }
    id v6 = -[TVSettingsPreferenceKeyValue initWithDomain:key:containerPath:]( objc_alloc(&OBJC_CLASS____TVSettingsPreferenceInvalidKeyValue),  "initWithDomain:key:containerPath:",  self->_domain,  v5,  self->_containerPath);
  }

  return v6;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)containerPath
{
  return self->_containerPath;
}

- (NSMutableDictionary)valueKeyPairs
{
  return self->_valueKeyPairs;
}

- (void)setValueKeyPairs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end