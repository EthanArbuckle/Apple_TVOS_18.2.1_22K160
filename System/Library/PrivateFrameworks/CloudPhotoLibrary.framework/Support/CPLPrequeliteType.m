@interface CPLPrequeliteType
+ (id)dataType;
+ (id)dateType;
+ (id)integerType;
+ (id)stringType;
- (CPLPrequeliteType)initWithTypeName:(const char *)a3 defaultValue:(id)a4 objcClass:(Class)a5;
- (Class)objcClass;
- (NSData)sql;
- (NSString)description;
- (id)_bindableValueForValue:(id)a3;
- (id)_valueForBindableValue:(id)a3;
- (id)defaultValueForNull;
- (id)rawInjectionForValue:(id)a3;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation CPLPrequeliteType

+ (id)integerType
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016635C;
  block[3] = &unk_10023E138;
  block[4] = a1;
  if (qword_1002A3AE8 != -1) {
    dispatch_once(&qword_1002A3AE8, block);
  }
  return (id)qword_1002A3AE0;
}

+ (id)dataType
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100166428;
  block[3] = &unk_10023E138;
  block[4] = a1;
  if (qword_1002A3AF8 != -1) {
    dispatch_once(&qword_1002A3AF8, block);
  }
  return (id)qword_1002A3AF0;
}

+ (id)stringType
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001664F0;
  block[3] = &unk_10023E138;
  block[4] = a1;
  if (qword_1002A3B08 != -1) {
    dispatch_once(&qword_1002A3B08, block);
  }
  return (id)qword_1002A3B00;
}

+ (id)dateType
{
  if (qword_1002A3B18 != -1) {
    dispatch_once(&qword_1002A3B18, &stru_100247978);
  }
  return (id)qword_1002A3B10;
}

- (CPLPrequeliteType)initWithTypeName:(const char *)a3 defaultValue:(id)a4 objcClass:(Class)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CPLPrequeliteType;
  v10 = -[CPLPrequeliteType init](&v15, "init");
  if (v10)
  {
    id v11 = +[PQLRawInjection rawInjection:length:](&OBJC_CLASS___PQLRawInjection, "rawInjection:length:", a3, strlen(a3));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    injection = v10->_injection;
    v10->_injection = (PQLRawInjection *)v12;

    v10->_objcClass = a5;
    objc_storeStrong(&v10->_defaultValue, a4);
  }

  return v10;
}

- (Class)objcClass
{
  return self->_objcClass;
}

- (NSData)sql
{
  return (NSData *)-[PQLRawInjection sql](self->_injection, "sql");
}

- (id)defaultValueForNull
{
  return self->_defaultValue;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return 0;
}

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PQLRawInjection sql](self->_injection, "sql"));
  v5 = -[NSString initWithData:encoding:](v3, "initWithData:encoding:", v4, 4LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<SQLType %@>", v5));

  return (NSString *)v6;
}

- (id)_bindableValueForValue:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, self->_objcClass);
    if ((isKindOfClass & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v9 = __CPLGenericOSLogDomain(isKindOfClass);
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          Class objcClass = self->_objcClass;
          *(_DWORD *)buf = 138413058;
          v16 = self;
          __int16 v17 = 2112;
          Class v18 = objcClass;
          __int16 v19 = 2112;
          id v20 = (id)objc_opt_class(v6);
          __int16 v21 = 2112;
          v22 = v6;
          id v12 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Invalid value for %@ (%@): %@ '%@'",  buf,  0x2Au);
        }
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Preque liteStore/CPLPrequeliteUtilites.m"));
      [v13 handleFailureInMethod:a2, self, v14, 103, @"Invalid value for %@ (%@): %@ '%@'", self, self->_objcClass, objc_opt_class(v6), v6 object file lineNumber description];

      abort();
    }
  }

  return v6;
}

- (id)_valueForBindableValue:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, self->_objcClass);
    if ((isKindOfClass & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v9 = __CPLGenericOSLogDomain(isKindOfClass);
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          Class objcClass = self->_objcClass;
          *(_DWORD *)buf = 138413058;
          v16 = self;
          __int16 v17 = 2112;
          Class v18 = objcClass;
          __int16 v19 = 2112;
          id v20 = (id)objc_opt_class(v6);
          __int16 v21 = 2112;
          v22 = v6;
          id v12 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Invalid value for %@ (%@): %@ '%@'",  buf,  0x2Au);
        }
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Preque liteStore/CPLPrequeliteUtilites.m"));
      [v13 handleFailureInMethod:a2, self, v14, 108, @"Invalid value for %@ (%@): %@ '%@'", self, self->_objcClass, objc_opt_class(v6), v6 object file lineNumber description];

      abort();
    }
  }

  return v6;
}

- (id)rawInjectionForValue:(id)a3
{
  id v5 = a3;
  if (-[objc_class isSubclassOfClass:]( self->_objcClass,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___NSData))) {
    sub_10019B640(a2, (uint64_t)self);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteType _bindableValueForValue:](self, "_bindableValueForValue:", v5));

  Class objcClass = self->_objcClass;
  if (objcClass == (Class)objc_opt_class(&OBJC_CLASS___NSString))
  {
    id v11 = (PQLRawInjection *)objc_claimAutoreleasedReturnValue( +[PQLNameInjection nameWithString:]( &OBJC_CLASS___PQLNameInjection,  "nameWithString:",  v6));
  }

  else
  {
    v8 = objc_alloc(&OBJC_CLASS___PQLRawInjection);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
    id v11 = -[PQLRawInjection initWithData:](v8, "initWithData:", v10);
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end