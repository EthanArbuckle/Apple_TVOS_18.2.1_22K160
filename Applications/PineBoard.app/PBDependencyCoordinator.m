@interface PBDependencyCoordinator
+ (id)sharedInstance;
+ (void)registerInstance:(id)a3 dependencyBlock:(id)a4;
- (NSMapTable)classesToInstances;
- (PBDependencyCoordinator)init;
- (void)_registerInstance:(id)a3 dependencyBlock:(id)a4;
- (void)setClassesToInstances:(id)a3;
@end

@implementation PBDependencyCoordinator

+ (id)sharedInstance
{
  if (qword_1004708C8 != -1) {
    dispatch_once(&qword_1004708C8, &stru_1003D4A50);
  }
  return (id)qword_1004708C0;
}

+ (void)registerInstance:(id)a3 dependencyBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBDependencyCoordinator sharedInstance](&OBJC_CLASS___PBDependencyCoordinator, "sharedInstance"));
  [v7 _registerInstance:v6 dependencyBlock:v5];
}

- (PBDependencyCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBDependencyCoordinator;
  v2 = -[PBDependencyCoordinator init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    classesToInstances = v2->_classesToInstances;
    v2->_classesToInstances = (NSMapTable *)v3;
  }

  return v2;
}

- (void)_registerInstance:(id)a3 dependencyBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void, PBDependencyContext *))a4;
  v8 = (objc_class *)objc_opt_class(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_classesToInstances, "objectForKey:", v8));

  if (v9) {
    goto LABEL_26;
  }
  -[NSMapTable setObject:forKey:](self->_classesToInstances, "setObject:forKey:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class dependencyDescription](v8, "dependencyDescription"));
  id v11 = [v10 copy];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dependencies]);
  if ([v12 count])
  {
    id v48 = v11;
    v49 = v7;
    aClass = v8;
    v13 = objc_alloc_init(&OBJC_CLASS___PBDependencyContext);
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    v47 = v12;
    id obj = v12;
    id v14 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v53 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
          if (([v18 conformsToProtocol:&OBJC_PROTOCOL___PBInstanceDependable] & 1) == 0)
          {
            v35 = objc_alloc(&OBJC_CLASS___NSString);
            v36 = NSStringFromClass(aClass);
            v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
            v38 = (objc_class *)objc_opt_class(v18);
            v39 = NSStringFromClass(v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
            v41 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___PBInstanceDependable);
            v8 = (objc_class *)objc_claimAutoreleasedReturnValue(v41);
            v42 = -[NSString initWithFormat:]( v35,  "initWithFormat:",  @"%@ has a dependency (%@) that does not confirm to %@",  v37,  v40,  v8);

            while (1)
            {
              objc_exception_throw(  -[NSException initWithName:reason:userInfo:]( objc_alloc(&OBJC_CLASS___NSException),  "initWithName:reason:userInfo:",  @"Dependency Exception",  v42,  0LL));
LABEL_26:
              v43 = objc_alloc(&OBJC_CLASS___NSString);
              v44 = NSStringFromClass(v8);
              v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
              v42 = -[NSString initWithFormat:](v43, "initWithFormat:", @"%@ is already registered", v45);
            }
          }

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_classesToInstances, "objectForKey:", v18));
          if (v19) {
            goto LABEL_15;
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue([v18 dependencyDescription]);
          v21 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue([v20 providerBlock]);
          uint64_t v22 = v21[2]();
          v19 = (void *)objc_claimAutoreleasedReturnValue(v22);

          if (([v19 isMemberOfClass:v18] & 1) == 0)
          {
            id v23 = sub_1000829AC();
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              v26 = (objc_class *)objc_opt_class(v18);
              v27 = NSStringFromClass(v26);
              v50 = (void *)objc_claimAutoreleasedReturnValue(v27);
              v28 = (objc_class *)objc_opt_class(v19);
              v29 = NSStringFromClass(v28);
              uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
              *(_DWORD *)buf = 138543618;
              v57 = v50;
              __int16 v58 = 2114;
              uint64_t v59 = v30;
              v31 = (void *)v30;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_FAULT,  "%{public}@'s providerBlock returned unrelated class %{public}@",  buf,  0x16u);
            }
          }

          if (v19)
          {
LABEL_15:
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[PBDependencyContext classesToInstances](v13, "classesToInstances"));
            [v25 setObject:v19 forKey:v18];
          }
        }

        id v15 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
      }

      while (v15);
    }

    v7 = v49;
    v49[2](v49, v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PBDependencyContext fetchedInstanceClasses](v13, "fetchedInstanceClasses"));
    [obj minusSet:v32];

    if ([obj count])
    {
      id v33 = sub_1000829AC();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        sub_100279F50(aClass, (uint64_t)obj, v34);
      }
    }

    v12 = v47;
    id v11 = v48;
  }
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