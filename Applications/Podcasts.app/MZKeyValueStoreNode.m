@interface MZKeyValueStoreNode
+ (BOOL)isServerRevisionNewerThanClient:(id)a3;
+ (id)assetIDForKey:(id)a3 withPrefix:(id)a4;
+ (id)keyValueStoreDataCurrentRevision;
+ (id)keyValueStoreDataFirstRevision;
+ (id)keyWithPrefix:(id)a3 assetID:(id)a4;
+ (id)keysWithPrefix:(id)a3 assetIDs:(id)a4;
+ (id)serverRevisionNewerThanClientKeys;
+ (void)setServerRevisionNewerThanClient:(id)a3;
- (BOOL)hasData;
- (BOOL)mismatch;
- (MZKeyValueStoreNode)init;
- (MZKeyValueStoreTransaction)transaction;
- (NSArray)arrayValue;
- (NSData)dataValue;
- (NSData)value;
- (NSDate)dateValue;
- (NSDictionary)dictionaryValue;
- (NSNumber)numberValue;
- (NSString)key;
- (NSString)name;
- (NSString)stringValue;
- (NSString)version;
- (id)debugDescription;
- (id)description;
- (id)objectValue;
- (id)objectValueMatchingClass:(Class)a3;
- (int)wrapperRevision;
- (void)setArrayValue:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setDictionaryValue:(id)a3;
- (void)setKey:(id)a3;
- (void)setMismatch:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNumberValue:(id)a3;
- (void)setObjectValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setValue:(id)a3;
- (void)setVersion:(id)a3;
- (void)setWrapperRevision:(int)a3;
@end

@implementation MZKeyValueStoreNode

+ (id)serverRevisionNewerThanClientKeys
{
  if (qword_1002B6968 != -1) {
    dispatch_once(&qword_1002B6968, &stru_100241EF8);
  }
  return (id)qword_1002B6960;
}

+ (void)setServerRevisionNewerThanClient:(id)a3
{
  id v7 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serverRevisionNewerThanClientKeys]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v5 setObject:v6 forKey:v7];

  objc_sync_exit(v4);
}

+ (BOOL)isServerRevisionNewerThanClient:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serverRevisionNewerThanClientKeys]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);
  BOOL v8 = v7 != 0LL;

  objc_sync_exit(v5);
  return v8;
}

+ (id)keyValueStoreDataCurrentRevision
{
  v2 = (void *)qword_1002B6970;
  if (!qword_1002B6970)
  {
    v3 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 2LL);
    id v4 = (void *)qword_1002B6970;
    qword_1002B6970 = (uint64_t)v3;

    v2 = (void *)qword_1002B6970;
  }

  return v2;
}

+ (id)keyValueStoreDataFirstRevision
{
  v2 = (void *)qword_1002B6978;
  if (!qword_1002B6978)
  {
    v3 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", 1LL);
    id v4 = (void *)qword_1002B6978;
    qword_1002B6978 = (uint64_t)v3;

    v2 = (void *)qword_1002B6978;
  }

  return v2;
}

+ (id)keyWithPrefix:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    BOOL v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v6, v7);
  }
  else {
    BOOL v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v6, v11);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ([(id)objc_opt_class(a1) isServerRevisionNewerThanClient:v9])
  {

    v9 = 0LL;
  }

  return v9;
}

+ (id)keysWithPrefix:(id)a3 assetIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    BOOL v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        v13 = 0LL;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v13);
          v15 = (void *)objc_opt_class(a1);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "keyWithPrefix:assetID:", v6, v14, (void)v18));
          if (v16) {
            -[NSMutableArray addObject:](v8, "addObject:", v16);
          }

          v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v11);
    }
  }

  else
  {
    BOOL v8 = 0LL;
  }

  return v8;
}

+ (id)assetIDForKey:(id)a3 withPrefix:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", objc_msgSend(a4, "length")));

  return v6;
}

- (MZKeyValueStoreNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MZKeyValueStoreNode;
  result = -[MZKeyValueStoreNode init](&v3, "init");
  if (result) {
    result->_wrapperRevision = 1;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode key](self, "key"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode version](self, "version"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> {_key:%@; _version:%@; _value:[%d bytes]}",
                   v3,
                   self,
                   v4,
                   v5,
                   [v6 length]));

  return v7;
}

- (id)debugDescription
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v3,  0LL,  0LL,  0LL));

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0
    || (id v6 = (NSString *)objc_claimAutoreleasedReturnValue([v4 description])) == 0)
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSString);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
    id v6 = -[NSString initWithData:encoding:](v7, "initWithData:encoding:", v8, 4LL);

    if (!v6)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
      id v6 = (NSString *)objc_claimAutoreleasedReturnValue([v9 hexString]);
    }
  }

  uint64_t v10 = objc_opt_class(self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode key](self, "key"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode version](self, "version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> {_key:%@; _version:%@; _value: %@}",
                    v10,
                    self,
                    v11,
                    v12,
                    v6));

  return v13;
}

- (BOOL)hasData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)objectValueMatchingClass:(Class)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode objectValue](self, "objectValue"));
  if ((objc_opt_isKindOfClass(v4, a3) & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (NSString)stringValue
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString, a2);
  return (NSString *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setStringValue:(id)a3
{
}

- (NSNumber)numberValue
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber, a2);
  return (NSNumber *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setNumberValue:(id)a3
{
}

- (NSDate)dateValue
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDate, a2);
  return (NSDate *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setDateValue:(id)a3
{
}

- (NSData)dataValue
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSData, a2);
  return (NSData *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setDataValue:(id)a3
{
}

- (NSArray)arrayValue
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSArray, a2);
  return (NSArray *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setArrayValue:(id)a3
{
}

- (NSDictionary)dictionaryValue
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary, a2);
  return (NSDictionary *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setDictionaryValue:(id)a3
{
}

- (id)objectValue
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v3,  0LL,  0LL,  0LL));

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v6 = 0LL;
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v7 = v4;
    id v8 = [(id)objc_opt_class(self) keyValueStoreDataCurrentRevision];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:off_1002B2D98]);
    int v11 = [v10 intValue];
    if (v11 <= (int)[v9 intValue])
    {
      if (v10)
      {
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v10 stringValue]);
          id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v15]);
        }

        else
        {
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v10, v16) & 1) == 0) {
            goto LABEL_9;
          }
          id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v10]);
        }

- (void)setObjectValue:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) keyValueStoreDataCurrentRevision];
  id v13 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (-[MZKeyValueStoreNode wrapperRevision](self, "wrapperRevision"))
  {
    id v6 = v13;
  }

  else
  {
    id v7 = [(id)objc_opt_class(self) keyValueStoreDataFirstRevision];
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);

    id v6 = (void *)v8;
  }

  id v9 = off_1002B2D98;
  id v14 = v6;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v14,  v9,  v4,  v10,  0LL));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v11,  kMZKeyValueStorePlistFormatNetworkData,  0LL,  0LL));
  -[MZKeyValueStoreNode setValue:](self, "setValue:", v12);
}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)mismatch
{
  return self->_mismatch;
}

- (void)setMismatch:(BOOL)a3
{
  self->_mismatch = a3;
}

- (int)wrapperRevision
{
  return self->_wrapperRevision;
}

- (void)setWrapperRevision:(int)a3
{
  self->_wrapperRevision = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end