@interface DACActivityDB
- (DACActivityDB)init;
- (NSMutableDictionary)registeredActivities;
- (id)description;
- (void)_withLock:(id)a3;
@end

@implementation DACActivityDB

- (DACActivityDB)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DACActivityDB;
  v2 = -[DACActivityDB init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    registeredActivities = v3->_registeredActivities;
    v3->_registeredActivities = (NSMutableDictionary *)v4;
  }

  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  uint64_t v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACActivityDB registeredActivities](self, "registeredActivities"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<%@: %p, size(%lu)>",  v5,  self,  [v6 count]));

  return v7;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableDictionary)registeredActivities
{
  return self->_registeredActivities;
}

- (void).cxx_destruct
{
}

@end