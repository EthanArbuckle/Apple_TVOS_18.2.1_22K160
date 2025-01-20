@interface TVPhotoCollectionGroup
- (BOOL)isEqual:(id)a3;
- (NSArray)photoCollections;
- (NSDictionary)photoCollectionGroupProviderInfo;
- (NSString)photoCollectionGroupDescription;
- (NSString)photoCollectionGroupIdentifier;
- (NSString)photoCollectionGroupName;
- (TVPhotoCollectionGroup)initWithIdentifier:(id)a3;
- (TVPhotoCollectionGroup)initWithName:(id)a3;
- (TVPhotoCollectionGroup)initWithName:(id)a3 description:(id)a4;
- (TVPhotoCollectionGroup)initWithPhotoCollections:(id)a3;
- (unint64_t)hash;
@end

@implementation TVPhotoCollectionGroup

- (TVPhotoCollectionGroup)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPhotoCollectionGroup;
  v5 = -[TVPhotoCollectionGroup init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    photoCollectionGroupName = v5->_photoCollectionGroupName;
    v5->_photoCollectionGroupName = v6;
  }

  return v5;
}

- (TVPhotoCollectionGroup)initWithName:(id)a3 description:(id)a4
{
  id v6 = a4;
  v7 = -[TVPhotoCollectionGroup initWithName:](self, "initWithName:", a3);
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    photoCollectionGroupDescription = v7->_photoCollectionGroupDescription;
    v7->_photoCollectionGroupDescription = v8;
  }

  return v7;
}

- (TVPhotoCollectionGroup)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPhotoCollectionGroup;
  v5 = -[TVPhotoCollectionGroup init](&v9, "init");
  if (v5)
  {
    id v6 = (NSString *)[v4 copy];
    photoCollectionGroupIdentifier = v5->_photoCollectionGroupIdentifier;
    v5->_photoCollectionGroupIdentifier = v6;
  }

  return v5;
}

- (TVPhotoCollectionGroup)initWithPhotoCollections:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPhotoCollectionGroup;
  v5 = -[TVPhotoCollectionGroup init](&v9, "init");
  if (v5)
  {
    id v6 = (NSArray *)[v4 copy];
    photoCollections = v5->_photoCollections;
    v5->_photoCollections = v6;
  }

  return v5;
}

- (unint64_t)hash
{
  return ~(unint64_t)-[NSArray hash](self->_photoCollections, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TVPhotoCollectionGroup *)a3;
  if (self == v4) {
    goto LABEL_7;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVPhotoCollectionGroup);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    unsigned __int8 v9 = 0;
    goto LABEL_9;
  }

  photoCollections = self->_photoCollections;
  if (photoCollections) {
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoCollectionGroup photoCollections](v4, "photoCollections"));

  if (!v7)
  {
LABEL_7:
    unsigned __int8 v9 = 1;
    goto LABEL_9;
  }

  photoCollections = self->_photoCollections;
LABEL_6:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoCollectionGroup photoCollections](v4, "photoCollections"));
  unsigned __int8 v9 = -[NSArray isEqualToArray:](photoCollections, "isEqualToArray:", v8);

LABEL_9:
  return v9;
}

- (NSString)photoCollectionGroupName
{
  photoCollectionGroupName = self->_photoCollectionGroupName;
  if (!photoCollectionGroupName)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_photoCollections, "firstObject"));
    if ((id)-[NSArray count](self->_photoCollections, "count") != (id)1
      || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionName])) == 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 photoSource]);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 sourceName]);
    }

    v7 = (NSString *)[v5 copy];
    v8 = self->_photoCollectionGroupName;
    self->_photoCollectionGroupName = v7;

    photoCollectionGroupName = self->_photoCollectionGroupName;
  }

  return photoCollectionGroupName;
}

- (NSString)photoCollectionGroupIdentifier
{
  photoCollectionGroupIdentifier = self->_photoCollectionGroupIdentifier;
  if (!photoCollectionGroupIdentifier)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v4 = self->_photoCollections;
    id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionIdentifier", (void)v14));
          id v10 = [v9 length];

          if (v10)
          {
            id v5 = (id)objc_claimAutoreleasedReturnValue([v8 collectionIdentifier]);
            goto LABEL_12;
          }
        }

        id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        if (v5) {
          continue;
        }
        break;
      }
    }

- (NSDictionary)photoCollectionGroupProviderInfo
{
  if (!-[NSDictionary count](self->_photoCollectionGroupProviderInfo, "count"))
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    v3 = self->_photoCollections;
    id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)i),  "providerInfo",  (void)v11));
          if (v8)
          {
            photoCollectionGroupProviderInfo = self->_photoCollectionGroupProviderInfo;
            self->_photoCollectionGroupProviderInfo = v8;

            goto LABEL_12;
          }
        }

        id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
        if (v5) {
          continue;
        }
        break;
      }
    }

- (NSString)photoCollectionGroupDescription
{
  return self->_photoCollectionGroupDescription;
}

- (NSArray)photoCollections
{
  return self->_photoCollections;
}

- (void).cxx_destruct
{
}

@end