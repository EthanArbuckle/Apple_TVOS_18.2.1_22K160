@interface TVHMusicMainSection
+ (id)new;
- (NSArray)items;
- (NSDictionary)itemByIdentifier;
- (NSString)identifier;
- (NSString)title;
- (TVHMusicMainSection)init;
- (TVHMusicMainSection)initWithItems:(id)a3;
- (id)itemForIdentifier:(id)a3;
- (void)setItemByIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVHMusicMainSection

+ (id)new
{
  return 0LL;
}

- (TVHMusicMainSection)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMusicMainSection)initWithItems:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVHMusicMainSection;
  v5 = -[TVHMusicMainSection init](&v26, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = (NSArray *)[v4 copy];
    items = v5->_items;
    v5->_items = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    v12 = v5->_items;
    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier", (void)v22));
          -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v17, v18);
        }

        id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
      }

      while (v14);
    }

    v19 = (NSDictionary *)-[NSMutableDictionary copy](v11, "copy");
    itemByIdentifier = v5->_itemByIdentifier;
    v5->_itemByIdentifier = v19;
  }

  return v5;
}

- (id)itemForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicMainSection itemByIdentifier](self, "itemByIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (NSDictionary)itemByIdentifier
{
  return self->_itemByIdentifier;
}

- (void)setItemByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end