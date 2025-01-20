@interface ADNotificationOrderedDictionary
- (ADNotificationOrderedDictionary)init;
- (id)allBulletins;
- (id)appendItemWithBulletin:(id)a3;
- (id)bulletinForInternalID:(id)a3;
- (id)bulletinWithNotificationID:(id)a3;
- (void)enumerateBulletinsAfterBulletinWithNotificationID:(id)a3 usingBlock:(id)a4;
- (void)removeBulletinItem:(id)a3;
- (void)removeBulletinWithInternalID:(id)a3;
- (void)setBulletin:(id)a3 forInternalID:(id)a4;
@end

@implementation ADNotificationOrderedDictionary

- (ADNotificationOrderedDictionary)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ADNotificationOrderedDictionary;
  v2 = -[ADNotificationOrderedDictionary init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    allBulletins = v2->_allBulletins;
    v2->_allBulletins = v3;
  }

  return v2;
}

- (id)bulletinForInternalID:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_allBulletins, "objectForKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 object]);

  return v4;
}

- (id)bulletinWithNotificationID:(id)a3
{
  id v4 = a3;
  v5 = self->_orderedBulletinsHead;
  if (v5)
  {
    objc_super v6 = v5;
    while (1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFLinkedListItem object](v6, "object"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 publisherBulletinID]);
      unsigned int v9 = [v8 isEqualToString:v4];

      if (v9) {
        break;
      }
      v10 = (AFLinkedListItem *)objc_claimAutoreleasedReturnValue(-[AFLinkedListItem nextItem](v6, "nextItem"));

      objc_super v6 = v10;
      if (!v10) {
        goto LABEL_8;
      }
    }

    v10 = (AFLinkedListItem *)objc_claimAutoreleasedReturnValue(-[AFLinkedListItem object](v6, "object"));
  }

  else
  {
    v10 = 0LL;
  }

- (id)allBulletins
{
  v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableDictionary count](self->_allBulletins, "count"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_allBulletins, "allValues", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) object]);
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (void)setBulletin:(id)a3 forInternalID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADNotificationOrderedDictionary bulletinForInternalID:](self, "bulletinForInternalID:", v6));

  if (v7) {
    -[ADNotificationOrderedDictionary removeBulletinWithInternalID:](self, "removeBulletinWithInternalID:", v6);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADNotificationOrderedDictionary appendItemWithBulletin:](self, "appendItemWithBulletin:", v9));
  -[NSMutableDictionary setObject:forKey:](self->_allBulletins, "setObject:forKey:", v8, v6);
}

- (void)removeBulletinWithInternalID:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_allBulletins, "objectForKey:"));
  if (v4) {
    -[ADNotificationOrderedDictionary removeBulletinItem:](self, "removeBulletinItem:", v4);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_allBulletins, "removeObjectForKey:", v5);
}

- (void)enumerateBulletinsAfterBulletinWithNotificationID:(id)a3 usingBlock:(id)a4
{
  id v14 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    uint64_t v7 = self->_orderedBulletinsHead;
    if (v7)
    {
      v8 = v7;
      unsigned __int8 v9 = 0;
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v8 object]);
        __int128 v11 = v10;
        if ((v9 & 1) != 0)
        {
          v6[2](v6, v10);
          unsigned __int8 v9 = 1;
        }

        else
        {
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 publisherBulletinID]);
          unsigned __int8 v9 = [v12 isEqualToString:v14];
        }

        uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 nextItem]);
        v8 = (void *)v13;
      }

      while (v13);
    }
  }
}

- (id)appendItemWithBulletin:(id)a3
{
  id v4 = a3;
  id v5 = -[AFLinkedListItem initWithObject:](objc_alloc(&OBJC_CLASS___AFLinkedListItem), "initWithObject:", v4);

  if (self->_orderedBulletinsHead) {
    -[AFLinkedListItem insertAfterItem:](v5, "insertAfterItem:", self->_orderedBulletinsTail);
  }
  else {
    objc_storeStrong((id *)&self->_orderedBulletinsHead, v5);
  }
  objc_storeStrong((id *)&self->_orderedBulletinsTail, v5);
  return v5;
}

- (void)removeBulletinItem:(id)a3
{
  id v4 = (AFLinkedListItem *)a3;
  unsigned __int8 v9 = v4;
  if (self->_orderedBulletinsHead == v4)
  {
    id v5 = (AFLinkedListItem *)objc_claimAutoreleasedReturnValue(-[AFLinkedListItem nextItem](v4, "nextItem"));
    orderedBulletinsHead = self->_orderedBulletinsHead;
    self->_orderedBulletinsHead = v5;

    id v4 = v9;
  }

  if (self->_orderedBulletinsTail == v4)
  {
    uint64_t v7 = (AFLinkedListItem *)objc_claimAutoreleasedReturnValue(-[AFLinkedListItem previousItem](v9, "previousItem"));
    orderedBulletinsTail = self->_orderedBulletinsTail;
    self->_orderedBulletinsTail = v7;

    id v4 = v9;
  }

  -[AFLinkedListItem removeFromList](v4, "removeFromList");
}

- (void).cxx_destruct
{
}

@end