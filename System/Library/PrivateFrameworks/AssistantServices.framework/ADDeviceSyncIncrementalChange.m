@interface ADDeviceSyncIncrementalChange
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncIncrementalChange)init;
- (ADDeviceSyncIncrementalChange)initWithBuilder:(id)a3;
- (ADDeviceSyncIncrementalChange)initWithCoder:(id)a3;
- (ADDeviceSyncIncrementalChange)initWithGeneration:(unint64_t)a3 date:(id)a4 insertedOrUpdatedItems:(id)a5 deletedItemUUIDs:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)deletedItemUUIDs;
- (NSArray)insertedOrUpdatedItems;
- (NSDate)date;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncIncrementalChange

- (ADDeviceSyncIncrementalChange)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceSyncIncrementalChangeMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ADDeviceSyncIncrementalChange;
  v5 = -[ADDeviceSyncIncrementalChange init](&v18, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceSyncIncrementalChangeMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncIncrementalChangeMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceSyncIncrementalChangeMutation isDirty](v7, "isDirty"))
    {
      v6->_generation = -[_ADDeviceSyncIncrementalChangeMutation getGeneration](v7, "getGeneration");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncIncrementalChangeMutation getDate](v7, "getDate"));
      v9 = (NSDate *)[v8 copy];
      date = v6->_date;
      v6->_date = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncIncrementalChangeMutation getInsertedOrUpdatedItems]( v7,  "getInsertedOrUpdatedItems"));
      v12 = (NSArray *)[v11 copy];
      insertedOrUpdatedItems = v6->_insertedOrUpdatedItems;
      v6->_insertedOrUpdatedItems = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncIncrementalChangeMutation getDeletedItemUUIDs](v7, "getDeletedItemUUIDs"));
      v15 = (NSArray *)[v14 copy];
      deletedItemUUIDs = v6->_deletedItemUUIDs;
      v6->_deletedItemUUIDs = v15;
    }
  }

  return v6;
}

- (ADDeviceSyncIncrementalChange)init
{
  return -[ADDeviceSyncIncrementalChange initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceSyncIncrementalChange)initWithGeneration:(unint64_t)a3 date:(id)a4 insertedOrUpdatedItems:(id)a5 deletedItemUUIDs:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100258CD0;
  v15[3] = &unk_1004F7AC0;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  unint64_t v19 = a3;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  v13 = -[ADDeviceSyncIncrementalChange initWithBuilder:](self, "initWithBuilder:", v15);

  return v13;
}

- (id)description
{
  return -[ADDeviceSyncIncrementalChange _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceSyncIncrementalChange;
  id v5 = -[ADDeviceSyncIncrementalChange description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {generation = %llu, date = %@, insertedOrUpdatedItems = %@, deletedItemUUIDs = %@}",  v6,  self->_generation,  self->_date,  self->_insertedOrUpdatedItems,  self->_deletedItemUUIDs);

  return v7;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_generation));
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = (unint64_t)-[NSDate hash](self->_date, "hash");
  unint64_t v6 = v5 ^ (unint64_t)-[NSArray hash](self->_insertedOrUpdatedItems, "hash");
  unint64_t v7 = v6 ^ (unint64_t)-[NSArray hash](self->_deletedItemUUIDs, "hash") ^ v4;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ADDeviceSyncIncrementalChange *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceSyncIncrementalChange);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id generation = (id)self->_generation;
      if (generation == (id)-[ADDeviceSyncIncrementalChange generation](v6, "generation"))
      {
        v8 = (NSDate *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncIncrementalChange date](v6, "date"));
        date = self->_date;
        if (date == v8 || -[NSDate isEqual:](date, "isEqual:", v8))
        {
          id v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncIncrementalChange insertedOrUpdatedItems](v6, "insertedOrUpdatedItems"));
          insertedOrUpdatedItems = self->_insertedOrUpdatedItems;
          if (insertedOrUpdatedItems == v10
            || -[NSArray isEqual:](insertedOrUpdatedItems, "isEqual:", v10))
          {
            id v12 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncIncrementalChange deletedItemUUIDs](v6, "deletedItemUUIDs"));
            deletedItemUUIDs = self->_deletedItemUUIDs;
            BOOL v14 = deletedItemUUIDs == v12 || -[NSArray isEqual:](deletedItemUUIDs, "isEqual:", v12);
          }

          else
          {
            BOOL v14 = 0;
          }
        }

        else
        {
          BOOL v14 = 0;
        }
      }

      else
      {
        BOOL v14 = 0;
      }
    }

    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (ADDeviceSyncIncrementalChange)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADDeviceSyncIncrementalChange::generation"];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 unsignedLongLongValue];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"ADDeviceSyncIncrementalChange::date"];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
  id v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  objc_opt_class(&OBJC_CLASS___ADDeviceSyncItem),  0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v12 forKey:@"ADDeviceSyncIncrementalChange::insertedOrUpdatedItems"]);

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray);
  v15 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v14, objc_opt_class(&OBJC_CLASS___NSUUID), 0LL);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v16 forKey:@"ADDeviceSyncIncrementalChange::deletedItemUUIDs"]);

  id v18 = -[ADDeviceSyncIncrementalChange initWithGeneration:date:insertedOrUpdatedItems:deletedItemUUIDs:]( self,  "initWithGeneration:date:insertedOrUpdatedItems:deletedItemUUIDs:",  v7,  v9,  v13,  v17);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t generation = self->_generation;
  id v6 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  generation));
  [v6 encodeObject:v5 forKey:@"ADDeviceSyncIncrementalChange::generation"];

  [v6 encodeObject:self->_date forKey:@"ADDeviceSyncIncrementalChange::date"];
  [v6 encodeObject:self->_insertedOrUpdatedItems forKey:@"ADDeviceSyncIncrementalChange::insertedOrUpdatedItems"];
  [v6 encodeObject:self->_deletedItemUUIDs forKey:@"ADDeviceSyncIncrementalChange::deletedItemUUIDs"];
}

- (unint64_t)generation
{
  return self->_generation;
}

- (NSDate)date
{
  return self->_date;
}

- (NSArray)insertedOrUpdatedItems
{
  return self->_insertedOrUpdatedItems;
}

- (NSArray)deletedItemUUIDs
{
  return self->_deletedItemUUIDs;
}

- (void).cxx_destruct
{
}

+ (id)newWithBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithBuilder:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncIncrementalChangeMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceSyncIncrementalChangeMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncIncrementalChangeMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceSyncIncrementalChangeMutation isDirty](v5, "isDirty"))
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncIncrementalChange);
      v6->_unint64_t generation = -[_ADDeviceSyncIncrementalChangeMutation getGeneration](v5, "getGeneration");
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncIncrementalChangeMutation getDate](v5, "getDate"));
      id v8 = (NSDate *)[v7 copy];
      date = v6->_date;
      v6->_date = v8;

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[_ADDeviceSyncIncrementalChangeMutation getInsertedOrUpdatedItems]( v5,  "getInsertedOrUpdatedItems"));
      id v11 = (NSArray *)[v10 copy];
      insertedOrUpdatedItems = v6->_insertedOrUpdatedItems;
      v6->_insertedOrUpdatedItems = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncIncrementalChangeMutation getDeletedItemUUIDs](v5, "getDeletedItemUUIDs"));
      uint64_t v14 = (NSArray *)[v13 copy];
      deletedItemUUIDs = v6->_deletedItemUUIDs;
      v6->_deletedItemUUIDs = v14;
    }

    else
    {
      id v6 = (ADDeviceSyncIncrementalChange *)-[ADDeviceSyncIncrementalChange copy](self, "copy");
    }
  }

  else
  {
    id v6 = (ADDeviceSyncIncrementalChange *)-[ADDeviceSyncIncrementalChange copy](self, "copy");
  }

  return v6;
}

@end