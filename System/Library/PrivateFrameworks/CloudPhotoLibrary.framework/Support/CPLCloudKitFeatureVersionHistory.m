@interface CPLCloudKitFeatureVersionHistory
+ (Class)featureVersionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)featureVersions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureVersionAtIndex:(unint64_t)a3;
- (unint64_t)featureVersionsCount;
- (unint64_t)hash;
- (void)addFeatureVersion:(id)a3;
- (void)clearFeatureVersions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeatureVersions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLCloudKitFeatureVersionHistory

- (void)clearFeatureVersions
{
}

- (void)addFeatureVersion:(id)a3
{
  id v4 = a3;
  featureVersions = self->_featureVersions;
  id v8 = v4;
  if (!featureVersions)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_featureVersions;
    self->_featureVersions = v6;

    id v4 = v8;
    featureVersions = self->_featureVersions;
  }

  -[NSMutableArray addObject:](featureVersions, "addObject:", v4);
}

- (unint64_t)featureVersionsCount
{
  return (unint64_t)-[NSMutableArray count](self->_featureVersions, "count");
}

- (id)featureVersionAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_featureVersions, "objectAtIndex:", a3);
}

+ (Class)featureVersionType
{
  return (Class)objc_opt_class(&OBJC_CLASS___CPLCloudKitFeatureVersion);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLCloudKitFeatureVersionHistory;
  id v3 = -[CPLCloudKitFeatureVersionHistory description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitFeatureVersionHistory dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[NSMutableArray count](self->_featureVersions, "count"))
  {
    id v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_featureVersions, "count"));
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    v5 = self->_featureVersions;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v9),  "dictionaryRepresentation",  (void)v12));
          -[NSMutableArray addObject:](v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v7);
    }

    [v3 setObject:v4 forKey:@"featureVersion"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLCloudKitFeatureVersionHistoryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_featureVersions;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage(v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9), 1LL);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (-[CPLCloudKitFeatureVersionHistory featureVersionsCount](self, "featureVersionsCount"))
  {
    [v8 clearFeatureVersions];
    unint64_t v4 = -[CPLCloudKitFeatureVersionHistory featureVersionsCount](self, "featureVersionsCount");
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitFeatureVersionHistory featureVersionAtIndex:](self, "featureVersionAtIndex:", i));
        [v8 addFeatureVersion:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = self->_featureVersions;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v13);
        [v5 addFeatureVersion:v11];

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)])
  {
    featureVersions = self->_featureVersions;
    else {
      unsigned __int8 v6 = 1;
    }
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableArray hash](self->_featureVersions, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = *((id *)a3 + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[CPLCloudKitFeatureVersionHistory addFeatureVersion:]( self,  "addFeatureVersion:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8),  (void)v9);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (NSMutableArray)featureVersions
{
  return self->_featureVersions;
}

- (void)setFeatureVersions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end