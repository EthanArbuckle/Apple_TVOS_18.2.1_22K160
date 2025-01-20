@interface ADDeviceSyncItem
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncItem)init;
- (ADDeviceSyncItem)initWithBuilder:(id)a3;
- (ADDeviceSyncItem)initWithCoder:(id)a3;
- (ADDeviceSyncItem)initWithUUID:(id)a3 properties:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)properties;
- (NSUUID)UUID;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncItem

- (ADDeviceSyncItem)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceSyncItemMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADDeviceSyncItem;
  v5 = -[ADDeviceSyncItem init](&v15, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceSyncItemMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncItemMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceSyncItemMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncItemMutation getUUID](v7, "getUUID"));
      v9 = (NSUUID *)[v8 copy];
      UUID = v6->_UUID;
      v6->_UUID = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncItemMutation getProperties](v7, "getProperties"));
      v12 = (NSDictionary *)[v11 copy];
      properties = v6->_properties;
      v6->_properties = v12;
    }
  }

  return v6;
}

- (ADDeviceSyncItem)init
{
  return -[ADDeviceSyncItem initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceSyncItem)initWithUUID:(id)a3 properties:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002F7388;
  v10[3] = &unk_1004FB470;
  id v11 = a3;
  id v12 = a4;
  id v6 = v12;
  id v7 = v11;
  v8 = -[ADDeviceSyncItem initWithBuilder:](self, "initWithBuilder:", v10);

  return v8;
}

- (id)description
{
  return -[ADDeviceSyncItem _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceSyncItem;
  id v5 = -[ADDeviceSyncItem description](&v9, "description");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {UUID = %@, properties = %@}",  v6,  self->_UUID,  self->_properties);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSUUID hash](self->_UUID, "hash");
  return (unint64_t)-[NSDictionary hash](self->_properties, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ADDeviceSyncItem *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceSyncItem);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      id v7 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncItem UUID](v6, "UUID"));
      UUID = self->_UUID;
      if (UUID == v7 || -[NSUUID isEqual:](UUID, "isEqual:", v7))
      {
        objc_super v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[ADDeviceSyncItem properties](v6, "properties"));
        properties = self->_properties;
        BOOL v11 = properties == v9 || -[NSDictionary isEqual:](properties, "isEqual:", v9);
      }

      else
      {
        BOOL v11 = 0;
      }
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (ADDeviceSyncItem)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"ADDeviceSyncItem::UUID"];
  v20 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___AceObject);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDateInterval);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDecimalNumber);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNull);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSURL);
  v14 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v19,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  objc_opt_class(&OBJC_CLASS___NSUUID),  0LL);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 decodeObjectOfClasses:v15 forKey:@"ADDeviceSyncItem::properties"]);

  v17 = -[ADDeviceSyncItem initWithUUID:properties:](self, "initWithUUID:properties:", v20, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"ADDeviceSyncItem::UUID"];
  [v5 encodeObject:self->_properties forKey:@"ADDeviceSyncItem::properties"];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSDictionary)properties
{
  return self->_properties;
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
  id v4 = (void (**)(id, _ADDeviceSyncItemMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceSyncItemMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceSyncItemMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceSyncItemMutation isDirty](v5, "isDirty"))
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncItem);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncItemMutation getUUID](v5, "getUUID"));
      uint64_t v8 = (NSUUID *)[v7 copy];
      UUID = v6->_UUID;
      v6->_UUID = v8;

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceSyncItemMutation getProperties](v5, "getProperties"));
      uint64_t v11 = (NSDictionary *)[v10 copy];
      properties = v6->_properties;
      v6->_properties = v11;
    }

    else
    {
      uint64_t v6 = (ADDeviceSyncItem *)-[ADDeviceSyncItem copy](self, "copy");
    }
  }

  else
  {
    uint64_t v6 = (ADDeviceSyncItem *)-[ADDeviceSyncItem copy](self, "copy");
  }

  return v6;
}

@end