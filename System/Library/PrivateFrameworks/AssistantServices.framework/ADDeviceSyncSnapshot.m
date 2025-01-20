@interface ADDeviceSyncSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncSnapshot)init;
- (ADDeviceSyncSnapshot)initWithBuilder:(id)a3;
- (ADDeviceSyncSnapshot)initWithCoder:(id)a3;
- (ADDeviceSyncSnapshot)initWithGeneration:(unint64_t)a3 date:(id)a4 items:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (NSDate)date;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncSnapshot

- (ADDeviceSyncSnapshot)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceSyncSnapshotMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADDeviceSyncSnapshot;
  v5 = -[ADDeviceSyncSnapshot init](&v15, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceSyncSnapshotMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncSnapshotMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceSyncSnapshotMutation isDirty](v7, "isDirty"))
    {
      v6->_generation = -[_ADDeviceSyncSnapshotMutation getGeneration](v7, "getGeneration");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncSnapshotMutation getDate](v7, "getDate"));
      v9 = (NSDate *)[v8 copy];
      date = v6->_date;
      v6->_date = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncSnapshotMutation getItems](v7, "getItems"));
      v12 = (NSArray *)[v11 copy];
      items = v6->_items;
      v6->_items = v12;
    }
  }

  return v6;
}

- (ADDeviceSyncSnapshot)init
{
  return -[ADDeviceSyncSnapshot initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceSyncSnapshot)initWithGeneration:(unint64_t)a3 date:(id)a4 items:(id)a5
{
  id v8 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10007E364;
  v13[3] = &unk_1004EF2D8;
  id v15 = a5;
  unint64_t v16 = a3;
  id v14 = v8;
  id v9 = v15;
  id v10 = v8;
  v11 = -[ADDeviceSyncSnapshot initWithBuilder:](self, "initWithBuilder:", v13);

  return v11;
}

- (id)description
{
  return -[ADDeviceSyncSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceSyncSnapshot;
  id v5 = -[ADDeviceSyncSnapshot description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {generation = %llu, date = %@, items = %@}",  v6,  self->_generation,  self->_date,  self->_items);

  return v7;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_generation));
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = (unint64_t)-[NSDate hash](self->_date, "hash");
  unint64_t v6 = v5 ^ (unint64_t)-[NSArray hash](self->_items, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ADDeviceSyncSnapshot *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceSyncSnapshot);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id generation = (id)self->_generation;
      if (generation == (id)-[ADDeviceSyncSnapshot generation](v6, "generation"))
      {
        id v8 = (NSDate *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncSnapshot date](v6, "date"));
        date = self->_date;
        if (date == v8 || -[NSDate isEqual:](date, "isEqual:", v8))
        {
          id v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncSnapshot items](v6, "items"));
          items = self->_items;
          BOOL v12 = items == v10 || -[NSArray isEqual:](items, "isEqual:", v10);
        }

        else
        {
          BOOL v12 = 0;
        }
      }

      else
      {
        BOOL v12 = 0;
      }
    }

    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (ADDeviceSyncSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADDeviceSyncSnapshot::generation"];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 unsignedLongLongValue];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"ADDeviceSyncSnapshot::date"];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
  v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  objc_opt_class(&OBJC_CLASS___ADDeviceSyncItem),  0LL);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"ADDeviceSyncSnapshot::items"]);

  id v14 = -[ADDeviceSyncSnapshot initWithGeneration:date:items:](self, "initWithGeneration:date:items:", v7, v9, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t generation = self->_generation;
  id v6 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  generation));
  [v6 encodeObject:v5 forKey:@"ADDeviceSyncSnapshot::generation"];

  [v6 encodeObject:self->_date forKey:@"ADDeviceSyncSnapshot::date"];
  [v6 encodeObject:self->_items forKey:@"ADDeviceSyncSnapshot::items"];
}

- (unint64_t)generation
{
  return self->_generation;
}

- (NSDate)date
{
  return self->_date;
}

- (NSArray)items
{
  return self->_items;
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
  id v4 = (void (**)(id, _ADDeviceSyncSnapshotMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceSyncSnapshotMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncSnapshotMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceSyncSnapshotMutation isDirty](v5, "isDirty"))
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncSnapshot);
      v6->_unint64_t generation = -[_ADDeviceSyncSnapshotMutation getGeneration](v5, "getGeneration");
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncSnapshotMutation getDate](v5, "getDate"));
      id v8 = (NSDate *)[v7 copy];
      date = v6->_date;
      v6->_date = v8;

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncSnapshotMutation getItems](v5, "getItems"));
      v11 = (NSArray *)[v10 copy];
      items = v6->_items;
      v6->_items = v11;
    }

    else
    {
      id v6 = (ADDeviceSyncSnapshot *)-[ADDeviceSyncSnapshot copy](self, "copy");
    }
  }

  else
  {
    id v6 = (ADDeviceSyncSnapshot *)-[ADDeviceSyncSnapshot copy](self, "copy");
  }

  return v6;
}

@end