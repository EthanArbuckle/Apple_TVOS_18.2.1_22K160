@interface PBDependencyContext
- (NSMapTable)classesToInstances;
- (NSMutableSet)fetchedInstanceClasses;
- (PBDependencyContext)init;
- (id)instanceForClass:(Class)a3;
- (void)setClassesToInstances:(id)a3;
- (void)setFetchedInstanceClasses:(id)a3;
@end

@implementation PBDependencyContext

- (PBDependencyContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBDependencyContext;
  v2 = -[PBDependencyContext init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    classesToInstances = v2->_classesToInstances;
    v2->_classesToInstances = (NSMapTable *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    fetchedInstanceClasses = v2->_fetchedInstanceClasses;
    v2->_fetchedInstanceClasses = v5;
  }

  return v2;
}

- (id)instanceForClass:(Class)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_classesToInstances, "objectForKey:"));
  if (v5)
  {
    -[NSMutableSet addObject:](self->_fetchedInstanceClasses, "addObject:", a3);
    id v6 = v5;
  }

  else
  {
    id v7 = sub_1000829AC();
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100279FFC(a3, (uint64_t)self, v8);
    }
  }

  return v5;
}

- (NSMutableSet)fetchedInstanceClasses
{
  return self->_fetchedInstanceClasses;
}

- (void)setFetchedInstanceClasses:(id)a3
{
}

- (NSMapTable)classesToInstances
{
  return self->_classesToInstances;
}

- (void)setClassesToInstances:(id)a3
{
}

- (void).cxx_destruct
{
}

@end