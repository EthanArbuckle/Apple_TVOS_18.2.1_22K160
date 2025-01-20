@interface TPPBPolicyKeyViewMapping
+ (id)TPPBPolicyKeyViewMappingWithView:(id)a3 matchingRule:(id)a4;
- (BOOL)hasMatchingRule;
- (BOOL)hasView;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)view;
- (TPPBDictionaryMatchingRule)matchingRule;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMatchingRule:(id)a3;
- (void)setView:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyKeyViewMapping

- (BOOL)hasMatchingRule
{
  return self->_matchingRule != 0LL;
}

- (BOOL)hasView
{
  return self->_view != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPolicyKeyViewMapping;
  v4 = -[TPPBPolicyKeyViewMapping description](&v8, sel_description);
  v5 = -[TPPBPolicyKeyViewMapping dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  matchingRule = self->_matchingRule;
  if (matchingRule)
  {
    v5 = -[TPPBDictionaryMatchingRule dictionaryRepresentation](matchingRule, "dictionaryRepresentation");
    [v3 setObject:v5 forKey:@"matching_rule"];
  }

  view = self->_view;
  if (view) {
    [v3 setObject:view forKey:@"view"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyKeyViewMappingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_matchingRule)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_view)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_matchingRule)
  {
    objc_msgSend(v4, "setMatchingRule:");
    id v4 = v5;
  }

  if (self->_view)
  {
    objc_msgSend(v5, "setView:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = -[TPPBDictionaryMatchingRule copyWithZone:](self->_matchingRule, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = -[NSString copyWithZone:](self->_view, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((matchingRule = self->_matchingRule, !((unint64_t)matchingRule | v4[1]))
     || -[TPPBDictionaryMatchingRule isEqual:](matchingRule, "isEqual:")))
  {
    view = self->_view;
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
  unint64_t v3 = -[TPPBDictionaryMatchingRule hash](self->_matchingRule, "hash");
  return -[NSString hash](self->_view, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  matchingRule = self->_matchingRule;
  uint64_t v6 = v4[1];
  char v7 = v4;
  if (matchingRule)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[TPPBDictionaryMatchingRule mergeFrom:](matchingRule, "mergeFrom:");
  }

  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[TPPBPolicyKeyViewMapping setMatchingRule:](self, "setMatchingRule:");
  }

  id v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[TPPBPolicyKeyViewMapping setView:](self, "setView:");
    id v4 = v7;
  }
}

- (TPPBDictionaryMatchingRule)matchingRule
{
  return self->_matchingRule;
}

- (void)setMatchingRule:(id)a3
{
}

- (NSString)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)TPPBPolicyKeyViewMappingWithView:(id)a3 matchingRule:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyKeyViewMapping);
  -[TPPBPolicyKeyViewMapping setView:](v7, "setView:", v6);

  -[TPPBPolicyKeyViewMapping setMatchingRule:](v7, "setMatchingRule:", v5);
  return v7;
}

@end