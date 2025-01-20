@interface HMCAMDEmbeddedDevice
- (BOOL)filterNSDataLogging;
- (HMCAMDEmbeddedDevice)init;
- (id)instanceOfClass:(Class)a3 forShortName:(id)a4;
- (id)performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 error:(id *)a6;
- (id)valueForUndefinedKey:(id)a3;
- (void)setFilterNSDataLogging:(BOOL)a3;
@end

@implementation HMCAMDEmbeddedDevice

- (HMCAMDEmbeddedDevice)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___HMCAMDEmbeddedDevice;
  v2 = -[HMCAMDEmbeddedDevice init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_filterNSDataLogging = 0;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    classInstances = v3->_classInstances;
    v3->_classInstances = (NSMutableDictionary *)v4;
  }

  return v3;
}

- (id)instanceOfClass:(Class)a3 forShortName:(id)a4
{
  id v6 = a4;
  objc_super v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v7->_classInstances, "objectForKeyedSubscript:", v6));

  if (v8) {
    goto LABEL_4;
  }
  v9 = (void *)objc_opt_new(a3);
  if (v9)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_classInstances, "setObject:forKeyedSubscript:", v9, v6);

LABEL_4:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v7->_classInstances, "objectForKeyedSubscript:", v6));
  }

  objc_sync_exit(v7);

  return v9;
}

- (id)performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v13));
  id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v14,  0LL));

  objc_exception_throw(v15);
  return -[HMCAMDEmbeddedDevice valueForUndefinedKey:](v16, v17, v18);
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0LL;
}

- (BOOL)filterNSDataLogging
{
  return self->_filterNSDataLogging;
}

- (void)setFilterNSDataLogging:(BOOL)a3
{
  self->_filterNSDataLogging = a3;
}

- (void).cxx_destruct
{
}

@end