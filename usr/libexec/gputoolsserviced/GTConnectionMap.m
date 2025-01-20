@interface GTConnectionMap
- (BOOL)retrieveConnection:(id *)a3 forId:(unint64_t)a4;
- (BOOL)retrieveId:(unint64_t *)a3 forConnection:(id)a4;
- (GTConnectionMap)init;
- (NSArray)connections;
- (unint64_t)remove:(id)a3;
- (void)insert:(id)a3;
@end

@implementation GTConnectionMap

- (GTConnectionMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GTConnectionMap;
  v2 = -[GTConnectionMap init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    idToConnection = v2->_idToConnection;
    v2->_idToConnection = v3;

    v2->_nextConnectionId = 1LL;
  }

  return v2;
}

- (void)insert:(id)a3
{
  idToConnection = self->_idToConnection;
  unint64_t nextConnectionId = self->_nextConnectionId;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  nextConnectionId));
  -[NSMutableDictionary setObject:forKeyedSubscript:](idToConnection, "setObject:forKeyedSubscript:", v6, v7);

  ++self->_nextConnectionId;
}

- (unint64_t)remove:(id)a3
{
  idToConnection = self->_idToConnection;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  -[NSMutableDictionary removeObjectForKey:](idToConnection, "removeObjectForKey:", v5);

  return v7;
}

- (BOOL)retrieveId:(unint64_t *)a3 forConnection:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_idToConnection, "allKeysForObject:", a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  *a3 = (unint64_t)[v6 unsignedIntegerValue];

  LOBYTE(a3) = [v5 count] != 0;
  return (char)a3;
}

- (BOOL)retrieveConnection:(id *)a3 forId:(unint64_t)a4
{
  idToConnection = self->_idToConnection;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  *a3 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( idToConnection,  "objectForKeyedSubscript:",  v6));

  return *a3 != 0LL;
}

- (NSArray)connections
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_idToConnection, "allValues");
}

- (void).cxx_destruct
{
}

@end