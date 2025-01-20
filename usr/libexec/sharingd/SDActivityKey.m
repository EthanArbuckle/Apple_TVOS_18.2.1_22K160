@interface SDActivityKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidKey;
- (NSDate)dateCreated;
- (NSDictionary)dictRepresentation;
- (NSMutableData)keyData;
- (NSUUID)keyIdentifier;
- (SDActivityKey)initWithDictRepresentation:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)lastUsedCounter;
- (void)dealloc;
- (void)setDateCreated:(id)a3;
- (void)setKeyData:(id)a3;
- (void)setKeyIdentifier:(id)a3;
- (void)setLastUsedCounter:(unsigned __int16)a3;
- (void)setValidKey:(BOOL)a3;
@end

@implementation SDActivityKey

- (SDActivityKey)initWithDictRepresentation:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SDActivityKey;
  v5 = -[SDActivityKey init](&v22, "init");
  if (!v5) {
    goto LABEL_4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"keyData"]);
  id v7 = [v6 length];
  if (v7 == (id)32)
  {
    v9 = (NSMutableData *)[v6 mutableCopy];
    keyData = v5->_keyData;
    v5->_keyData = v9;

    v11 = objc_alloc(&OBJC_CLASS___NSUUID);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"keyIdentifier"]);
    v13 = -[NSUUID initWithUUIDString:](v11, "initWithUUIDString:", v12);
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"dateCreated"]);
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"lastUsedCounter"]);
    v5->_lastUsedCounter = (unsigned __int16)[v17 integerValue];

LABEL_4:
    v18 = v5;
    goto LABEL_8;
  }

  uint64_t v19 = handoff_log(v7, v8);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_1000E817C(v6, v20);
  }

  v18 = 0LL;
LABEL_8:

  return v18;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData"));
  id v4 = [v3 length];
  id v5 = objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData"));
  cc_clear(v4, [v5 mutableBytes]);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDActivityKey;
  -[SDActivityKey dealloc](&v6, "dealloc");
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyIdentifier](self, "keyIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey dateCreated](self, "dateCreated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, keyIdentifier:%@, dateCreated:%@, lastUsedCounter:%hu>",  v5,  self,  v7,  v8,  -[SDActivityKey lastUsedCounter](self, "lastUsedCounter")));

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 keyData]);

    unsigned __int8 v10 = [v8 isEqual:v9];
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableData hash](self->_keyData, "hash");
}

- (NSDictionary)dictRepresentation
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"keyData");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyIdentifier](self, "keyIdentifier"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"keyIdentifier");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey dateCreated](self, "dateCreated"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"dateCreated");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  -[SDActivityKey lastUsedCounter](self, "lastUsedCounter")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"lastUsedCounter");

  return (NSDictionary *)v3;
}

- (BOOL)isValidKey
{
  return -[SDActivityKey lastUsedCounter](self, "lastUsedCounter") != 0;
}

- (NSUUID)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (unsigned)lastUsedCounter
{
  return self->_lastUsedCounter;
}

- (void)setLastUsedCounter:(unsigned __int16)a3
{
  self->_lastUsedCounter = a3;
}

- (void)setValidKey:(BOOL)a3
{
  self->_validKey = a3;
}

- (NSMutableData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end