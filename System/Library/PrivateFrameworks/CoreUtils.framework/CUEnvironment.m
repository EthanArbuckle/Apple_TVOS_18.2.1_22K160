@interface CUEnvironment
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation CUEnvironment

- (id)description
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSMutableDictionary objectForKeyedSubscript:](v5->_objects, "objectForKeyedSubscript:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  id v8 = v11;
  if (v11 && !v7->_objects)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    objects = v7->_objects;
    v7->_objects = v9;

    id v8 = v11;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_objects, "setObject:forKeyedSubscript:", v8, v6);
  objc_sync_exit(v7);
}

- (void).cxx_destruct
{
}

@end