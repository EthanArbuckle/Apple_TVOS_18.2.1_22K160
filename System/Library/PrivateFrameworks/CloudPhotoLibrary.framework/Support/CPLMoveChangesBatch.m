@interface CPLMoveChangesBatch
- (CPLMoveChangesBatch)initWithCapacity:(unint64_t)a3;
- (NSArray)changes;
- (NSArray)destinationRecordIDs;
- (id)changeWithSourceRecordID:(id)a3;
- (id)description;
- (id)redactedDescription;
- (void)addChange:(id)a3;
@end

@implementation CPLMoveChangesBatch

- (CPLMoveChangesBatch)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLMoveChangesBatch;
  v4 = -[CPLMoveChangesBatch init](&v10, "init");
  if (v4)
  {
    v5 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a3);
    changes = v4->_changes;
    v4->_changes = v5;

    v7 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  a3);
    changePerSourceRecordID = v4->_changePerSourceRecordID;
    v4->_changePerSourceRecordID = v7;
  }

  return v4;
}

- (NSArray)changes
{
  return (NSArray *)-[NSMutableArray copy](self->_changes, "copy");
}

- (NSArray)destinationRecordIDs
{
  v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_changes, "count"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = self->_changes;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v8), "destinationRecord", (void)v12));
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
        -[NSMutableArray addObject:](v3, "addObject:", v10);

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return (NSArray *)v3;
}

- (void)addChange:(id)a3
{
  changes = self->_changes;
  id v5 = a3;
  -[NSMutableArray addObject:](changes, "addObject:", v5);
  changePerSourceRecordID = self->_changePerSourceRecordID;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 sourceRecordID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](changePerSourceRecordID, "setObject:forKeyedSubscript:", v5, v7);
}

- (id)changeWithSourceRecordID:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_changePerSourceRecordID, "objectForKeyedSubscript:", a3);
}

- (id)description
{
  return -[NSMutableArray description](self->_changes, "description");
}

- (id)redactedDescription
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%@ %lu move changes>",  objc_opt_class(self),  -[NSMutableArray count](self->_changes, "count"));
}

- (void).cxx_destruct
{
}

@end