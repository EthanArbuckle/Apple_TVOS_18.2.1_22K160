@interface DBTDuxburyFormatParser
+ (id)allCodeNodes;
- (DBTDuxburyFormatParser)init;
- (NSMutableArray)parserStack;
- (id)LaTeXRepresentationOfString:(id)a3 error:(id *)a4;
- (id)_parseInputString:(id)a3 error:(id *)a4;
- (unint64_t)advanceIndex;
- (unint64_t)startIndex;
- (void)_initState;
- (void)closeENodeIfNeeded;
- (void)setAdvanceIndex:(unint64_t)a3;
- (void)setParserStack:(id)a3;
- (void)setStartIndex:(unint64_t)a3;
@end

@implementation DBTDuxburyFormatParser

+ (id)allCodeNodes
{
  v3[0] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatBNode);
  v3[1] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatBLINENode);
  v3[2] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatBOLIMNode);
  v3[3] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatBULIMNode);
  v3[4] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatENode);
  v3[5] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatFNode);
  v3[6] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatIXRTNode);
  v3[7] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatPNode);
  v3[8] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatONode);
  v3[9] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatSQRTNode);
  v3[10] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatTNode);
  v3[11] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatTCNode);
  v3[12] = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatUNode);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  13LL));
}

- (DBTDuxburyFormatParser)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DBTDuxburyFormatParser;
  v2 = -[DBTDuxburyFormatParser init](&v4, "init");
  -[DBTDuxburyFormatParser _initState](v2, "_initState");
  return v2;
}

- (void)_initState
{
  v3 = objc_alloc_init(&OBJC_CLASS___DBTDuxburyFormatRootNode);
  objc_super v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v3));
  parserStack = self->_parserStack;
  self->_parserStack = v4;

  self->_startIndex = 0LL;
  self->_advanceIndex = 0LL;
}

- (id)LaTeXRepresentationOfString:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyFormatParser _parseInputString:error:](self, "_parseInputString:error:", a3));
  v6 = v5;
  if (a4 && *a4) {
    v7 = 0LL;
  }
  else {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 LaTeXRepresentation]);
  }

  return v7;
}

- (id)_parseInputString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[DBTDuxburyFormatParser _initState](self, "_initState");
  id v97 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\x{1c}([a-zA-Z0-9]+)\\x{1f}",  1LL,  &v97));
  id v8 = v97;
  id v96 = v8;
  v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"[^\\x{1c}]*",  1LL,  &v96));
  id v9 = v96;

  if (v9)
  {
    v10 = 0LL;
    if (a4) {
      *a4 = v9;
    }
    goto LABEL_67;
  }

  v11 = (char *)[v6 length];
  v81 = v7;
  if (![v6 length])
  {
    v12 = 0LL;
LABEL_59:
    parserStack = self->_parserStack;
    p_parserStack = &self->_parserStack;
    id v9 = 0LL;
    if ((unint64_t)-[NSMutableArray count](parserStack, "count") >= 2)
    {
      do
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](*p_parserStack, "lastObject"));
        -[NSMutableArray removeLastObject](*p_parserStack, "removeLastObject");
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](*p_parserStack, "lastObject"));
        v70 = (void *)objc_claimAutoreleasedReturnValue([v69 children]);
        unsigned __int8 v71 = [v70 containsObject:v68];

        if ((v71 & 1) == 0)
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](*p_parserStack, "lastObject"));
          [v72 addChild:v68];
        }
      }

      while ((unint64_t)-[NSMutableArray count](*p_parserStack, "count") > 1);
    }

    id v73 = DBTLogFormatParser();
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
      -[DBTDuxburyFormatParser _parseInputString:error:].cold.1((id *)p_parserStack, v74);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](*p_parserStack, "lastObject"));
    v7 = v81;
    goto LABEL_66;
  }

  v79 = a4;
  v12 = 0LL;
  unint64_t v13 = 0LL;
  id v80 = v6;
  while (1)
  {
    v14 = v12;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstMatchInString:options:range:", v6, 4, v13, v11));

    if (v12) {
      break;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "firstMatchInString:options:range:", v6, 4, v13, v11));
    if (v12)
    {
      -[DBTDuxburyFormatParser closeENodeIfNeeded](self, "closeENodeIfNeeded");
      id v36 = [v12 range];
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", v36, v37));
      v38 = -[DBTDuxburyFormatTextNode initWithText:]( objc_alloc(&OBJC_CLASS___DBTDuxburyFormatTextNode),  "initWithText:",  v17);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_parserStack, "lastObject"));
      [v39 addChild:v38];

      id v40 = [v12 range];
      unint64_t v13 = (unint64_t)v40 + v41;
      [v12 range];
      uint64_t v43 = v42;

LABEL_33:
      v11 -= v43;
    }

- (void)closeENodeIfNeeded
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->_parserStack, "reverseObjectEnumerator", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatENode);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          id v13 = v9;

          if (!(v6 & 1 | (v13 == 0LL)))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue([v13 expressionNode]);

            if (v14)
            {
              while (1)
              {
                id v15 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_parserStack, "lastObject"));

                if (v15 == v13) {
                  break;
                }
                -[NSMutableArray removeLastObject](self->_parserStack, "removeLastObject");
              }

              -[NSMutableArray removeLastObject](self->_parserStack, "removeLastObject");
            }
          }

          goto LABEL_19;
        }

        uint64_t v11 = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatONode);
        if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
        {
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatUNode);
          if ((objc_opt_isKindOfClass(v9, v12) & 1) == 0) {
            continue;
          }
        }

        char v6 = 1;
      }

      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v13 = 0LL;
LABEL_19:
}

- (NSMutableArray)parserStack
{
  return self->_parserStack;
}

- (void)setParserStack:(id)a3
{
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(unint64_t)a3
{
  self->_startIndex = a3;
}

- (unint64_t)advanceIndex
{
  return self->_advanceIndex;
}

- (void)setAdvanceIndex:(unint64_t)a3
{
  self->_advanceIndex = a3;
}

- (void).cxx_destruct
{
}

- (void)_parseInputString:(id *)a1 error:(os_log_s *)a2 .cold.1(id *a1, os_log_s *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 lastObject]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 debugDescription]);
  int v5 = 138412290;
  char v6 = v4;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Parsed input to tree:\n%@", (uint8_t *)&v5, 0xCu);
}

@end