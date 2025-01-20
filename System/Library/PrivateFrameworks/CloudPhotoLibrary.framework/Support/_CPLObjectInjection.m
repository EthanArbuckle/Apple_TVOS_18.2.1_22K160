@interface _CPLObjectInjection
- (NSArray)variables;
- (NSData)sql;
- (_CPLObjectInjection)initWithVariables:(id)a3 object:(id)a4 sql:(id)a5;
- (id)bindValuesToKeepAlive;
- (id)object;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation _CPLObjectInjection

- (_CPLObjectInjection)initWithVariables:(id)a3 object:(id)a4 sql:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____CPLObjectInjection;
  v12 = -[_CPLObjectInjection init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_variables, a3);
    objc_storeStrong(&v13->_object, a4);
    objc_storeStrong((id *)&v13->_sql, a5);
  }

  return v13;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  v7 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count](self->_variables, "count"));
  bindValuesToKeepAlive = self->_bindValuesToKeepAlive;
  self->_bindValuesToKeepAlive = v7;

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  obj = self->_variables;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  int v10 = a4;
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v24;
    int v21 = a4;
    do
    {
      v13 = 0LL;
      int v14 = a4;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        objc_super v15 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v13);
        id object = self->_object;
        v17 = (void *)objc_claimAutoreleasedReturnValue([v15 variableName]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([object valueForKey:v17]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v15 bindableValueForValue:v18]);

        if (v19)
        {
          [v19 sqliteBind:a3 index:(char *)v13 + a4];
          -[NSMutableArray addObject:](self->_bindValuesToKeepAlive, "addObject:", v19);
        }

        else
        {
          sqlite3_bind_null(a3, a4 + (_DWORD)v13);
        }

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      a4 += (int)v13;
    }

    while (v11);
    int v10 = v14 + (_DWORD)v13;
    a4 = v21;
  }

  return v10 - a4;
}

- (id)bindValuesToKeepAlive
{
  return self->_bindValuesToKeepAlive;
}

- (NSArray)variables
{
  return self->_variables;
}

- (id)object
{
  return self->_object;
}

- (NSData)sql
{
  return self->_sql;
}

- (void).cxx_destruct
{
}

@end