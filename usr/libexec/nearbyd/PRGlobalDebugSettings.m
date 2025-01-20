@interface PRGlobalDebugSettings
+ (id)sharedSettings;
- (BOOL)BOOLForKey:(id)a3;
- (PRGlobalDebugSettings)init;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (int64_t)integerForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation PRGlobalDebugSettings

+ (id)sharedSettings
{
  if (qword_1007FE580 != -1) {
    dispatch_once(&qword_1007FE580, &stru_1007BBF60);
  }
  return (id)qword_1007FE578;
}

- (PRGlobalDebugSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PRGlobalDebugSettings;
  v2 = -[PRGlobalDebugSettings init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dict = v2->_dict;
    v2->_dict = v3;
  }

  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  -[PRGlobalDebugSettings willChangeValueForKey:](self, "willChangeValueForKey:", v7);
  -[NSMutableDictionary setObject:forKey:](self->_dict, "setObject:forKey:", v6, v7);

  -[PRGlobalDebugSettings didChangeValueForKey:](self, "didChangeValueForKey:", v7);
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", a3));
  id v6 = (void *)v5;
  if (v5 && (objc_opt_isKindOfClass(v5, a4) & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  id v6 = -[PRGlobalDebugSettings objectForKey:ofClass:]( self,  "objectForKey:ofClass:",  v4,  objc_opt_class(&OBJC_CLASS___NSNumber, v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7) {
    unsigned __int8 v8 = [v7 BOOLValue];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  id v6 = -[PRGlobalDebugSettings objectForKey:ofClass:]( self,  "objectForKey:ofClass:",  v4,  objc_opt_class(&OBJC_CLASS___NSNumber, v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7) {
    id v8 = [v7 integerValue];
  }
  else {
    id v8 = 0LL;
  }

  return (int64_t)v8;
}

- (void).cxx_destruct
{
}

@end