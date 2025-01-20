@interface TPPBPolicyModelToCategory
+ (id)TPPBPolicyModelToCategoryWithPrefix:(id)a3 category:(id)a4;
- (BOOL)hasCategory;
- (BOOL)hasPrefix;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)category;
- (NSString)prefix;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(id)a3;
- (void)setPrefix:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyModelToCategory

- (BOOL)hasPrefix
{
  return self->_prefix != 0LL;
}

- (BOOL)hasCategory
{
  return self->_category != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPolicyModelToCategory;
  v4 = -[TPPBPolicyModelToCategory description](&v8, sel_description);
  v5 = -[TPPBPolicyModelToCategory dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  prefix = self->_prefix;
  if (prefix) {
    [v3 setObject:prefix forKey:@"prefix"];
  }
  category = self->_category;
  if (category) {
    [v4 setObject:category forKey:@"category"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyModelToCategoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_prefix)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_category)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_prefix)
  {
    objc_msgSend(v4, "setPrefix:");
    id v4 = v5;
  }

  if (self->_category)
  {
    objc_msgSend(v5, "setCategory:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_prefix, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = -[NSString copyWithZone:](self->_category, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((prefix = self->_prefix, !((unint64_t)prefix | v4[2]))
     || -[NSString isEqual:](prefix, "isEqual:")))
  {
    category = self->_category;
    else {
      char v7 = 1;
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_prefix, "hash");
  return -[NSString hash](self->_category, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[TPPBPolicyModelToCategory setPrefix:](self, "setPrefix:");
    id v4 = v5;
  }

  if (v4[1])
  {
    -[TPPBPolicyModelToCategory setCategory:](self, "setCategory:");
    id v4 = v5;
  }
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)TPPBPolicyModelToCategoryWithPrefix:(id)a3 category:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyModelToCategory);
  -[TPPBPolicyModelToCategory setPrefix:](v7, "setPrefix:", v6);

  -[TPPBPolicyModelToCategory setCategory:](v7, "setCategory:", v5);
  return v7;
}

@end