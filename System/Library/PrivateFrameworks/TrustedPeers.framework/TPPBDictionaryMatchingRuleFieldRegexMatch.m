@interface TPPBDictionaryMatchingRuleFieldRegexMatch
- (BOOL)hasFieldName;
- (BOOL)hasRegex;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3 error:(id *)a4;
- (BOOL)readFrom:(id)a3;
- (NSString)fieldName;
- (NSString)regex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFieldName:(id)a3;
- (void)setRegex:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBDictionaryMatchingRuleFieldRegexMatch

- (BOOL)hasFieldName
{
  return self->_fieldName != 0LL;
}

- (BOOL)hasRegex
{
  return self->_regex != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBDictionaryMatchingRuleFieldRegexMatch;
  v4 = -[TPPBDictionaryMatchingRuleFieldRegexMatch description](&v8, sel_description);
  v5 = -[TPPBDictionaryMatchingRuleFieldRegexMatch dictionaryRepresentation](self, "dictionaryRepresentation");
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
  regex = self->_regex;
  if (regex) {
    [v4 setObject:regex forKey:@"regex"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDictionaryMatchingRuleFieldRegexMatchReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fieldName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_regex)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fieldName)
  {
    objc_msgSend(v4, "setFieldName:");
    id v4 = v5;
  }

  if (self->_regex)
  {
    objc_msgSend(v5, "setRegex:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_fieldName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = -[NSString copyWithZone:](self->_regex, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((fieldName = self->_fieldName, !((unint64_t)fieldName | v4[1]))
     || -[NSString isEqual:](fieldName, "isEqual:")))
  {
    regex = self->_regex;
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
  NSUInteger v3 = -[NSString hash](self->_fieldName, "hash");
  return -[NSString hash](self->_regex, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[TPPBDictionaryMatchingRuleFieldRegexMatch setFieldName:](self, "setFieldName:");
    id v4 = v5;
  }

  if (v4[2])
  {
    -[TPPBDictionaryMatchingRuleFieldRegexMatch setRegex:](self, "setRegex:");
    id v4 = v5;
  }
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
}

- (NSString)regex
{
  return self->_regex;
}

- (void)setRegex:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)matches:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[TPPBDictionaryMatchingRuleFieldRegexMatch hasFieldName](self, "hasFieldName"))
  {
    -[TPPBDictionaryMatchingRuleFieldRegexMatch fieldName](self, "fieldName");
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 length];
  }

  id v8 = objc_alloc(MEMORY[0x189607A00]);
  v9 = -[TPPBDictionaryMatchingRuleFieldRegexMatch regex](self, "regex");
  id v17 = 0LL;
  v10 = (void *)[v8 initWithPattern:v9 options:0 error:&v17];
  id v11 = v17;

  if (v10)
  {
    v12 = -[TPPBDictionaryMatchingRuleFieldRegexMatch fieldName](self, "fieldName");
    [v6 objectForKeyedSubscript:v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      [NSString stringWithFormat:@"%@", v13];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v15 = objc_msgSend(v10, "numberOfMatchesInString:options:range:", v14, 0, 0, objc_msgSend(v14, "length")) != 0;
    }

    else
    {
      BOOL v15 = 0;
    }
  }

  else
  {
    BOOL v15 = 0;
    if (a4 && v11)
    {
      BOOL v15 = 0;
      *a4 = v11;
    }
  }

  return v15;
}

@end