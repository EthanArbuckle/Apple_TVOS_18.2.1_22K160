@interface TPPBDictionaryMatchingRuleFieldExists
- (BOOL)hasFieldName;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3 error:(id *)a4;
- (BOOL)readFrom:(id)a3;
- (NSString)fieldName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFieldName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBDictionaryMatchingRuleFieldExists

- (BOOL)hasFieldName
{
  return self->_fieldName != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBDictionaryMatchingRuleFieldExists;
  v4 = -[TPPBDictionaryMatchingRuleFieldExists description](&v8, sel_description);
  v5 = -[TPPBDictionaryMatchingRuleFieldExists dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  fieldName = self->_fieldName;
  if (fieldName) {
    [v3 setObject:fieldName forKey:@"fieldName"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDictionaryMatchingRuleFieldExistsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_fieldName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  fieldName = self->_fieldName;
  if (fieldName) {
    [a3 setFieldName:fieldName];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_fieldName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    fieldName = self->_fieldName;
    else {
      char v6 = 1;
    }
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_fieldName, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[TPPBDictionaryMatchingRuleFieldExists setFieldName:](self, "setFieldName:");
  }
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)matches:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[TPPBDictionaryMatchingRuleFieldExists hasFieldName](self, "hasFieldName")
    && (-[TPPBDictionaryMatchingRuleFieldExists fieldName](self, "fieldName"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v8))
  {
    v9 = -[TPPBDictionaryMatchingRuleFieldExists fieldName](self, "fieldName");
    [v6 objectForKeyedSubscript:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v11 = v10 != 0LL;
  }

  else if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CKKSMatcherError" code:1 description:@"Rule missing field name"];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

@end