@interface DBTDuxburyFormatNode
+ (NSSet)innerCodes;
+ (NSString)beginCode;
+ (NSString)endCode;
- (BOOL)foundInnerCode:(id)a3;
- (BOOL)isClosed;
- (DBTDuxburyFormatNode)init;
- (NSMutableArray)children;
- (id)LaTeXRepresentation;
- (id)_debugDescriptionWithIndent:(unint64_t)a3;
- (id)debugDescription;
- (id)firstChildMatchingBlock:(id)a3;
- (void)addChild:(id)a3;
- (void)addChildren:(id)a3;
- (void)foundEndCode:(id)a3;
- (void)removeAllChildren;
- (void)setChildren:(id)a3;
@end

@implementation DBTDuxburyFormatNode

- (DBTDuxburyFormatNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DBTDuxburyFormatNode;
  v2 = -[DBTDuxburyFormatNode init](&v6, "init");
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  children = v2->_children;
  v2->_children = (NSMutableArray *)v3;

  v2->_closed = 0;
  return v2;
}

+ (NSString)beginCode
{
  return 0LL;
}

+ (NSString)endCode
{
  return 0LL;
}

+ (NSSet)innerCodes
{
  return 0LL;
}

- (void)addChild:(id)a3
{
}

- (void)addChildren:(id)a3
{
}

- (void)removeAllChildren
{
}

- (id)firstChildMatchingBlock:(id)a3
{
  v4 = (uint64_t (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode children](self, "children"));
  id v6 = [v5 mutableCopy];
  while (1)
  {

    if (![v6 count]) {
      break;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue([v6 lastObject]);
    [v6 removeLastObject];
    if ((v4[2](v4, v5) & 1) != 0) {
      goto LABEL_6;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 children]);
    [v6 addObjectsFromArray:v7];
  }

  v5 = 0LL;
LABEL_6:

  return v5;
}

- (BOOL)foundInnerCode:(id)a3
{
  return 1;
}

- (void)foundEndCode:(id)a3
{
  self->_closed = 1;
}

- (id)LaTeXRepresentation
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = self->_children;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)v8),  "LaTeXRepresentation",  (void)v11));
        [v3 appendString:v9];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)debugDescription
{
  return -[DBTDuxburyFormatNode _debugDescriptionWithIndent:](self, "_debugDescriptionWithIndent:", 0LL);
}

- (id)_debugDescriptionWithIndent:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      [v5 appendString:@" "];
      --v6;
    }

    while (v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode description](self, "description"));
  [v5 appendString:v7];

  if (-[NSMutableArray count](self->_children, "count"))
  {
    [v5 appendString:@"\n"];
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v8 = self->_children;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      unint64_t v12 = a3 + 2;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          __int128 v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_debugDescriptionWithIndent:", v12, (void)v18));
          [v5 appendString:v15];

          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_children, "lastObject"));
          if (v14 != v16) {
            [v5 appendString:@"\n"];
          }
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      }

      while (v10);
    }
  }

  return v5;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (void).cxx_destruct
{
}

@end