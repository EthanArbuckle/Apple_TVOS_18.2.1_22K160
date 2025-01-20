@interface DBTDuxburyFormatENode
+ (id)beginCode;
+ (id)innerCodes;
- (BOOL)foundInnerCode:(id)a3;
- (BOOL)hasSeenOverNode;
- (BOOL)hasSeenUnderNode;
- (DBTDuxburyFormatEExpressionNode)expressionNode;
- (id)LaTeXRepresentation;
- (void)setExpressionNode:(id)a3;
- (void)setSeenOverNode:(BOOL)a3;
- (void)setSeenUnderNode:(BOOL)a3;
@end

@implementation DBTDuxburyFormatENode

+ (id)beginCode
{
  return @"e";
}

+ (id)innerCodes
{
  return +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"os", @"us", 0LL);
}

- (id)LaTeXRepresentation
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode firstChildMatchingBlock:](self, "firstChildMatchingBlock:", &__block_literal_global));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode firstChildMatchingBlock:](self, "firstChildMatchingBlock:", &__block_literal_global_97));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatENode expressionNode](self, "expressionNode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 LaTeXRepresentation]);
  id v7 = [v6 mutableCopy];

  if (v3 | v4)
  {
    [v7 appendString:@"\\limits"];
    if (v3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([(id)v3 LaTeXRepresentation]);
      [v7 appendFormat:@"^{%@}", v8];
    }

    if (v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v4 LaTeXRepresentation]);
      [v7 appendFormat:@"_{%@}", v9];
    }
  }

  return v7;
}

BOOL __44__DBTDuxburyFormatENode_LaTeXRepresentation__block_invoke(id a1, DBTDuxburyFormatNode *a2)
{
  v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatONode);
  char isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

BOOL __44__DBTDuxburyFormatENode_LaTeXRepresentation__block_invoke_2(id a1, DBTDuxburyFormatNode *a2)
{
  v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatUNode);
  char isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (BOOL)foundInnerCode:(id)a3
{
  id v4 = a3;
  if (!-[DBTDuxburyFormatENode hasSeenOverNode](self, "hasSeenOverNode")
    && !-[DBTDuxburyFormatENode hasSeenUnderNode](self, "hasSeenUnderNode"))
  {
    v5 = objc_alloc_init(&OBJC_CLASS___DBTDuxburyFormatEExpressionNode);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode children](self, "children"));
    -[DBTDuxburyFormatNode addChildren:](v5, "addChildren:", v6);

    -[DBTDuxburyFormatNode removeAllChildren](self, "removeAllChildren");
    -[DBTDuxburyFormatNode addChild:](self, "addChild:", v5);
    objc_storeWeak((id *)&self->_expressionNode, v5);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[DBTDuxburyFormatONode beginCode](&OBJC_CLASS___DBTDuxburyFormatONode, "beginCode"));
  unsigned int v8 = [v4 isEqualToString:v7];

  if (v8) {
    self->_seenOverNode = 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DBTDuxburyFormatUNode beginCode](&OBJC_CLASS___DBTDuxburyFormatUNode, "beginCode"));
  unsigned int v10 = [v4 isEqualToString:v9];

  if (v10) {
    self->_seenUnderNode = 1;
  }

  return 0;
}

- (DBTDuxburyFormatEExpressionNode)expressionNode
{
  return (DBTDuxburyFormatEExpressionNode *)objc_loadWeakRetained((id *)&self->_expressionNode);
}

- (void)setExpressionNode:(id)a3
{
}

- (BOOL)hasSeenOverNode
{
  return self->_seenOverNode;
}

- (void)setSeenOverNode:(BOOL)a3
{
  self->_seenOverNode = a3;
}

- (BOOL)hasSeenUnderNode
{
  return self->_seenUnderNode;
}

- (void)setSeenUnderNode:(BOOL)a3
{
  self->_seenUnderNode = a3;
}

- (void).cxx_destruct
{
}

@end