@interface ACCMemUsageStat
- (ACCMemUsageStat)init;
- (ACCMemUsageStat)initWithName:(id)a3;
- (ACCMemUsageStatInfo)statInfo;
- (BOOL)update;
- (NSMutableDictionary)markList;
- (NSString)name;
- (double)timeIntervalSinceLastUpdate;
- (double)timeIntervalSinceMark:(id)a3;
- (double)timeIntervalSinceStart;
- (id)description;
- (id)getMark:(id)a3;
- (void)mark:(id)a3;
- (void)removeMark:(id)a3;
@end

@implementation ACCMemUsageStat

- (ACCMemUsageStat)init
{
  return -[ACCMemUsageStat initWithName:](self, "initWithName:", 0LL);
}

- (ACCMemUsageStat)initWithName:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ACCMemUsageStat;
  v6 = -[ACCMemUsageStat init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = -[ACCMemUsageStatInfo initWithName:]( objc_alloc(&OBJC_CLASS___ACCMemUsageStatInfo),  "initWithName:",  &stru_100200A40);
    statInfo = v7->_statInfo;
    v7->_statInfo = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    markList = v7->_markList;
    v7->_markList = v10;

    -[ACCMemUsageStat update](v7, "update");
  }

  return v7;
}

- (id)description
{
  if (self->_name) {
    name = (const __CFString *)self->_name;
  }
  else {
    name = &stru_100200A40;
  }
  return +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"ACCMemUsageStat:%@ \nstatinfo: \n%@ markList: %lu entries \n",  name,  self->_statInfo,  -[NSMutableDictionary count](self->_markList, "count"));
}

- (BOOL)update
{
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v14 = 0LL;
  BOOL MemoryUse = getMemoryUse(&v16, &v15, &v14);
  if (MemoryUse)
  {
    -[ACCMemUsageStatInfo updateResident:virtualValue:physFootprintValue:]( self->_statInfo,  "updateResident:virtualValue:physFootprintValue:",  v16,  v15,  v14);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_markList, "allValues", 0LL));
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) updateResident:v16 virtualValue:v15 physFootprintValue:v14];
        }

        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v17 count:16];
      }

      while (v6);
    }
  }

  return MemoryUse;
}

- (void)mark:(id)a3
{
  id v7 = a3;
  v4 = (ACCMemUsageStatInfo *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_markList, "objectForKey:"));
  if (!v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___ACCMemUsageStatInfo);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-mark-%@",  self->_name,  v7));
    v4 = -[ACCMemUsageStatInfo initWithName:andInfo:](v5, "initWithName:andInfo:", v6, self->_statInfo);

    -[NSMutableDictionary setObject:forKey:](self->_markList, "setObject:forKey:", v4, v7);
  }
}

- (id)getMark:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_markList, "objectForKey:", a3);
}

- (void)removeMark:(id)a3
{
}

- (double)timeIntervalSinceStart
{
  return result;
}

- (double)timeIntervalSinceLastUpdate
{
  return result;
}

- (double)timeIntervalSinceMark:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_markList, "objectForKey:", a3));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 startTime]);
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;
  }

  else
  {
    double v7 = -1.0;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (ACCMemUsageStatInfo)statInfo
{
  return self->_statInfo;
}

- (NSMutableDictionary)markList
{
  return self->_markList;
}

- (void).cxx_destruct
{
}

@end