@interface DBTDuxburyFormatIXRTNode
+ (id)beginCode;
+ (id)endCode;
+ (id)innerCodes;
- (BOOL)foundInnerCode:(id)a3;
- (id)LaTeXRepresentation;
- (void)foundEndCode:(id)a3;
@end

@implementation DBTDuxburyFormatIXRTNode

+ (id)beginCode
{
  return @"ixrts";
}

+ (id)endCode
{
  return @"ixrte";
}

+ (id)innerCodes
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"ixrtd");
}

- (id)LaTeXRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode children](self, "children"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 LaTeXRepresentation]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 LaTeXRepresentation]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\\sqrt[%@]{%@}",  v7,  v8));

  return v9;
}

- (BOOL)foundInnerCode:(id)a3
{
  if ([a3 isEqualToString:@"ixrtd"])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode children](self, "children"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    uint64_t v6 = objc_opt_class(v5);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatIXRTRootNode);

    if (v6 != v7)
    {
      v8 = objc_alloc_init(&OBJC_CLASS___DBTDuxburyFormatIXRTRootNode);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode children](self, "children"));
      -[DBTDuxburyFormatNode addChildren:](v8, "addChildren:", v9);

      -[DBTDuxburyFormatNode removeAllChildren](self, "removeAllChildren");
      -[DBTDuxburyFormatNode addChild:](self, "addChild:", v8);
    }
  }

  return 1;
}

- (void)foundEndCode:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DBTDuxburyFormatIXRTNode;
  id v4 = a3;
  -[DBTDuxburyFormatNode foundEndCode:](&v14, "foundEndCode:", v4);
  v5 = (void *)objc_opt_class(self);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endCode", v14.receiver, v14.super_class));
  unsigned int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode children](self, "children"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

    v10 = objc_alloc_init(&OBJC_CLASS___DBTDuxburyFormatIXRTRadicandNode);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode children](self, "children"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatNode children](self, "children"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subarrayWithRange:", 1, (char *)objc_msgSend(v12, "count") - 1));

    -[DBTDuxburyFormatNode addChildren:](v10, "addChildren:", v13);
    -[DBTDuxburyFormatNode removeAllChildren](self, "removeAllChildren");
    -[DBTDuxburyFormatNode addChild:](self, "addChild:", v9);
    -[DBTDuxburyFormatNode addChild:](self, "addChild:", v10);
  }

@end