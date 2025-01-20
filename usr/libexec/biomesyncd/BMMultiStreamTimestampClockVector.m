@interface BMMultiStreamTimestampClockVector
+ (BOOL)supportsSecureCoding;
+ (id)deserialize:(id)a3 error:(id *)a4;
- (BMMultiStreamTimestampClockVector)init;
- (BMMultiStreamTimestampClockVector)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)allKeys;
- (id)description;
- (id)serialize:(id *)a3;
- (id)timestampClockVectorForStreamIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setVectorClockTo:(id)a3 forStreamIdentifier:(id)a4;
@end

@implementation BMMultiStreamTimestampClockVector

- (BMMultiStreamTimestampClockVector)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BMMultiStreamTimestampClockVector;
  v2 = -[BMMultiStreamTimestampClockVector init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    vectorClock = v2->_vectorClock;
    v2->_vectorClock = v3;
  }

  return v2;
}

- (void)setVectorClockTo:(id)a3 forStreamIdentifier:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[NSMutableDictionary setValue:forKey:](self->_vectorClock, "setValue:forKey:");
    }
  }

- (id)timestampClockVectorForStreamIdentifier:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_vectorClock, "objectForKey:"));
  }
  else {
    return 0LL;
  }
}

- (id)allKeys
{
  return -[NSMutableDictionary allKeys](self->_vectorClock, "allKeys");
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary description](self->_vectorClock, "description"));
  v5 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@", v4);

  return v5;
}

- (unint64_t)hash
{
  v3 = objc_alloc(&OBJC_CLASS___NSOrderedSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMMultiStreamTimestampClockVector allKeys](self, "allKeys"));
  v5 = -[NSOrderedSet initWithArray:](v3, "initWithArray:", v4);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  objc_super v6 = v5;
  id v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    unint64_t v10 = 1LL;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_vectorClock, "valueForKey:", v12, (void)v16));
        unint64_t v14 = (unint64_t)[v12 hash];
        v10 ^= v14 ^ (unint64_t)[v13 hash];
      }

      id v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v8);
  }

  else
  {
    unint64_t v10 = 1LL;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___BMMultiStreamTimestampClockVector, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSSet);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[BMMultiStreamTimestampClockVector allKeys](self, "allKeys"));
    uint64_t v9 = -[NSSet initWithArray:](v7, "initWithArray:", v8);

    unint64_t v10 = objc_alloc(&OBJC_CLASS___NSSet);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
    v12 = -[NSSet initWithArray:](v10, "initWithArray:", v11);

    if (-[NSSet isEqual:](v9, "isEqual:", v12))
    {
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      v13 = v9;
      id v14 = -[NSSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      if (v14)
      {
        id v15 = v14;
        v24 = v12;
        uint64_t v16 = *(void *)v26;
        while (2)
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( -[BMMultiStreamTimestampClockVector timestampClockVectorForStreamIdentifier:]( self,  "timestampClockVectorForStreamIdentifier:",  v18));
            v20 = (void *)objc_claimAutoreleasedReturnValue([v4 timestampClockVectorForStreamIdentifier:v18]);
            id v21 = [v19 compareToVector:v20];

            if (v21)
            {
              BOOL v22 = 0;
              goto LABEL_15;
            }
          }

          id v15 = -[NSSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
          if (v15) {
            continue;
          }
          break;
        }

        BOOL v22 = 1;
LABEL_15:
        v12 = v24;
      }

      else
      {
        BOOL v22 = 1;
      }
    }

    else
    {
      BOOL v22 = 0;
    }
  }

  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BMMultiStreamTimestampClockVector)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___BMMultiStreamTimestampClockVector;
  uint64_t v6 = -[BMMultiStreamTimestampClockVector init](&v15, "init");
  if (v6)
  {
    v16[0] = objc_opt_class(&OBJC_CLASS___NSString, v5);
    v16[1] = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    v16[2] = objc_opt_class(&OBJC_CLASS___CKDistributedTimestampClockVector, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"vectorClock"]);
    v12 = (NSMutableDictionary *)[v11 mutableCopy];
    vectorClock = v6->_vectorClock;
    v6->_vectorClock = v12;
  }

  return v6;
}

- (id)serialize:(id *)a3
{
  return +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  a3);
}

+ (id)deserialize:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v5 = a3;
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___BMMultiStreamTimestampClockVector, v6),  v5,  a4);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end