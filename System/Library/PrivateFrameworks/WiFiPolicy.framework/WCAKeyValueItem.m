@interface WCAKeyValueItem
+ (BOOL)supportsSecureCoding;
- (BOOL)BOOLValue;
- (NSArray)arrayValue;
- (NSData)bytesValue;
- (NSDictionary)dictionaryValue;
- (NSError)error;
- (NSString)key;
- (NSString)stringValue;
- (WCAKeyValueItem)initWithCoder:(id)a3;
- (WCAKeyValueItem)initWithKey:(id)a3 error:(id)a4;
- (WCAKeyValueItem)initWithKey:(id)a3 value:(id)a4;
- (double)doubleValue;
- (float)floatValue;
- (id)description;
- (int)int32Value;
- (int64_t)int64Value;
- (unint64_t)uint64Value;
- (unsigned)uint32Value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WCAKeyValueItem

- (WCAKeyValueItem)initWithKey:(id)a3 value:(id)a4
{
  v6 = (NSString *)a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WCAKeyValueItem;
  v8 = -[WCAKeyValueItem init](&v13, sel_init);
  key = v8->_key;
  v8->_key = v6;
  v10 = v6;

  id value = v8->_value;
  v8->_id value = v7;

  return v8;
}

- (WCAKeyValueItem)initWithKey:(id)a3 error:(id)a4
{
  v6 = (NSString *)a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WCAKeyValueItem;
  v8 = -[WCAKeyValueItem init](&v13, sel_init);
  key = v8->_key;
  v8->_key = v6;
  v10 = v6;

  id value = v8->_value;
  v8->_id value = v7;

  return v8;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ : %p ", v5, self];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 appendFormat:@"key: %@", self->_key];
  [self->_value description];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 appendFormat:@", value: %@", v7];

  [v6 appendString:@">"];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"_key"];
  [v5 encodeObject:self->_value forKey:@"_value"];
}

- (WCAKeyValueItem)initWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___WCAKeyValueItem;
  id v3 = a3;
  v4 = -[WCAKeyValueItem init](&v17, sel_init);
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"_key"];
  key = v4->_key;
  v4->_key = (NSString *)v5;

  id v7 = (void *)MEMORY[0x189604010];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0, v17.receiver, v17.super_class);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v3 decodeObjectOfClasses:v13 forKey:@"_value"];

  id value = v4->_value;
  v4->_id value = (id)v14;

  return v4;
}

- (NSDictionary)dictionaryValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSDictionary", self->_value);
    }
  }

  return (NSDictionary *)self->_value;
}

- (NSArray)arrayValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSArray", self->_value);
    }
  }

  return (NSArray *)self->_value;
}

- (double)doubleValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSNumber", self->_value);
    }
  }

  [self->_value doubleValue];
  return result;
}

- (float)floatValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSNumber", self->_value);
    }
  }

  [self->_value floatValue];
  return result;
}

- (int)int32Value
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSNumber", self->_value);
    }
  }

  return [self->_value intValue];
}

- (int64_t)int64Value
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSNumber", self->_value);
    }
  }

  return [self->_value longLongValue];
}

- (unsigned)uint32Value
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSNumber", self->_value);
    }
  }

  return [self->_value unsignedIntValue];
}

- (unint64_t)uint64Value
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSNumber", self->_value);
    }
  }

  return [self->_value unsignedLongLongValue];
}

- (BOOL)BOOLValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSNumber", self->_value);
    }
  }

  return [self->_value BOOLValue];
}

- (NSString)stringValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSString", self->_value);
    }
  }

  return (NSString *)self->_value;
}

- (NSData)bytesValue
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSData", self->_value);
    }
  }

  return (NSData *)self->_value;
}

- (NSError)error
{
  id value = self->_value;
  uint64_t v4 = [MEMORY[0x189603FE8] null];
  if (value == (id)v4)
  {
  }

  else
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      NSLog(@"Failed to convert value %@ to NSError", self->_value);
    }
  }

  return (NSError *)self->_value;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end