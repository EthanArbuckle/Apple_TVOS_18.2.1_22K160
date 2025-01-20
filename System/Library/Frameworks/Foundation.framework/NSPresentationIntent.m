@interface NSPresentationIntent
+ (BOOL)supportsSecureCoding;
+ (NSPresentationIntent)blockQuoteIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)codeBlockIntentWithIdentity:(NSInteger)identity languageHint:(NSString *)languageHint nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)headerIntentWithIdentity:(NSInteger)identity level:(NSInteger)level nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)listItemIntentWithIdentity:(NSInteger)identity ordinal:(NSInteger)ordinal nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)orderedListIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)paragraphIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)tableCellIntentWithIdentity:(NSInteger)identity column:(NSInteger)column nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)tableHeaderRowIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)tableIntentWithIdentity:(NSInteger)identity columnCount:(NSInteger)columnCount alignments:(NSArray *)alignments nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)tableRowIntentWithIdentity:(NSInteger)identity row:(NSInteger)row nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)thematicBreakIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)unorderedListIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToPresentationIntent:(NSPresentationIntent *)other;
- (NSArray)columnAlignments;
- (NSInteger)column;
- (NSInteger)columnCount;
- (NSInteger)headerLevel;
- (NSInteger)identity;
- (NSInteger)indentationLevel;
- (NSInteger)ordinal;
- (NSInteger)row;
- (NSPresentationIntent)initWithCoder:(id)a3;
- (NSPresentationIntent)parentIntent;
- (NSPresentationIntentKind)intentKind;
- (NSString)languageHint;
- (id)_init;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPresentationIntent

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPresentationIntent;
  return -[NSPresentationIntent init](&v3, sel_init);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPresentationIntent;
  -[NSPresentationIntent dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  int64_t v3 = self->_intentKind ^ self->_identity ^ self->_headerLevel ^ self->_indentationLevel;
  NSUInteger v4 = v3 ^ -[NSString hash](self->_languageHint, "hash") ^ self->_columnCount;
  columnAlignments = self->_columnAlignments;
  int64_t v6 = self->_ordinal ^ self->_column ^ self->_row;
  return v4 ^ v6 ^ -[NSArray hash](columnAlignments, "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v5 = [a3 identity], v5 == -[NSPresentationIntent identity](self, "identity")))
  {
    return -[NSPresentationIntent isEquivalentToPresentationIntent:](self, "isEquivalentToPresentationIntent:", a3);
  }

  else
  {
    return 0;
  }

- (BOOL)isEquivalentToPresentationIntent:(NSPresentationIntent *)other
{
  if (other == self) {
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (uint64_t v5 = -[NSPresentationIntent languageHint](self, "languageHint"),
        int64_t v6 = -[NSPresentationIntent languageHint](other, "languageHint"),
        v7 = -[NSPresentationIntent parentIntent](self, "parentIntent"),
        v8 = -[NSPresentationIntent parentIntent](other, "parentIntent"),
        v9 = -[NSPresentationIntent columnAlignments](self, "columnAlignments"),
        v10 = -[NSPresentationIntent columnAlignments](other, "columnAlignments"),
        NSPresentationIntentKind v11 = -[NSPresentationIntent intentKind](other, "intentKind"),
        v11 != -[NSPresentationIntent intentKind](self, "intentKind")))
  {
LABEL_16:
    LOBYTE(v12) = 0;
    return v12;
  }

  if (v5 == v6 || (int v12 = -[NSString isEqual:](v5, "isEqual:", v6)) != 0)
  {
    NSInteger v13 = -[NSPresentationIntent headerLevel](other, "headerLevel");
    if (v13 != -[NSPresentationIntent headerLevel](self, "headerLevel")) {
      goto LABEL_16;
    }
    NSInteger v14 = -[NSPresentationIntent ordinal](other, "ordinal");
    if (v14 != -[NSPresentationIntent ordinal](self, "ordinal")) {
      goto LABEL_16;
    }
    NSInteger v15 = -[NSPresentationIntent indentationLevel](other, "indentationLevel");
    if (v15 != -[NSPresentationIntent indentationLevel](self, "indentationLevel")) {
      goto LABEL_16;
    }
    if (v9 == v10
      || (int v12 = -[NSArray isEqual:]( -[NSPresentationIntent columnAlignments](other, "columnAlignments"),  "isEqual:",  -[NSPresentationIntent columnAlignments](self, "columnAlignments"))) != 0)
    {
      NSInteger v16 = -[NSPresentationIntent columnCount](other, "columnCount");
      if (v16 == -[NSPresentationIntent columnCount](self, "columnCount"))
      {
        NSInteger v17 = -[NSPresentationIntent column](other, "column");
        if (v17 == -[NSPresentationIntent column](self, "column"))
        {
          NSInteger v18 = -[NSPresentationIntent row](other, "row");
          if (v18 == -[NSPresentationIntent row](self, "row"))
          {
            if (v7 != v8)
            {
              LOBYTE(v12) = -[NSPresentationIntent isEquivalentToPresentationIntent:]( v7,  "isEquivalentToPresentationIntent:",  v8);
              return v12;
            }

- (id)description
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  int64_t v3 =  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@ %p>",  objc_opt_class(),  self);
  -[NSMutableString appendString:](v3, "appendString:", @": ");
  unint64_t v4 = self->_intentKind - 1;
  if (v4 > 0xA) {
    uint64_t v5 = @"Paragraph";
  }
  else {
    uint64_t v5 = off_189CA5318[v4];
  }
  -[NSMutableString appendString:](v3, "appendString:", v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" (id %ld)", self->_identity);
  switch(self->_intentKind)
  {
    case 1LL:
      -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" (%ld) indent %ld",  self->_headerLevel,  self->_indentationLevel);
      break;
    case 2LL:
    case 3LL:
      -[NSMutableString appendFormat:](v3, "appendFormat:", @" indent %ld", self->_indentationLevel, v21);
      break;
    case 4LL:
      -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" ordinal %ld, indent %ld",  self->_ordinal,  self->_indentationLevel);
      break;
    case 5LL:
      languageHint = self->_languageHint;
      -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" (%@) indent %ld",  languageHint,  self->_indentationLevel);
      break;
    case 8LL:
      columnAlignments = self->_columnAlignments;
      int64_t columnCount = self->_columnCount;
      if (columnAlignments && -[NSArray count](self->_columnAlignments, "count"))
      {
        int64_t v22 = columnCount;
        v23 = v3;
        v9 = (void *)[MEMORY[0x189603FA8] array];
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( columnAlignments,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v26;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(columnAlignments);
              }
              NSInteger v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              char v15 = [v14 isEqual:&off_189D0EC78];
              NSInteger v16 = @"left";
              if ((v15 & 1) == 0)
              {
                char v17 = [v14 isEqual:&off_189D0EC90];
                NSInteger v16 = @"right";
                if ((v17 & 1) == 0)
                {
                  else {
                    NSInteger v16 = @"unknown";
                  }
                }
              }

              [v9 addObject:v16];
            }

            uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( columnAlignments,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
          }

          while (v11);
        }

        NSInteger v18 = (const __CFString *)[v9 componentsJoinedByString:@","];
        int64_t v3 = v23;
        int64_t columnCount = v22;
      }

      else
      {
        NSInteger v18 = @"none";
      }

      -[NSMutableString appendFormat:](v3, "appendFormat:", @" %ld columns, alignment %@", columnCount, v18);
      break;
    case 0xALL:
      int64_t row = self->_row;
      goto LABEL_28;
    case 0xBLL:
      int64_t row = self->_column;
LABEL_28:
      -[NSMutableString appendFormat:](v3, "appendFormat:", @" # %ld", row, v21);
      break;
    default:
      break;
  }

  if (self->_parentIntent)
  {
    -[NSMutableString appendString:](v3, "appendString:", @"\n ");
    -[NSMutableString appendString:]( v3,  "appendString:",  -[NSPresentationIntent description](self->_parentIntent, "description"));
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPresentationIntent)initWithCoder:(id)a3
{
  v8[2] = *MEMORY[0x1895F89C0];
  unint64_t v4 = -[NSPresentationIntent _init](self, "_init");
  if (v4)
  {
    v4->_intentKind = [a3 decodeIntegerForKey:@"NS.intentKind"];
    v4->_parentIntent = (NSPresentationIntent *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.parentIntent"];
    v4->_identity = [a3 decodeIntegerForKey:@"NS.identity"];
    v4->_ordinal = [a3 decodeIntegerForKey:@"NS.ordinal"];
    if ([a3 requiresSecureCoding])
    {
      uint64_t v5 = (void *)[a3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"NS.columnAlignments"];
    }

    else
    {
      int64_t v6 = (void *)MEMORY[0x189604010];
      v8[0] = objc_opt_class();
      v8[1] = objc_opt_class();
      uint64_t v5 = (void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v6,  "setWithArray:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v8, 2)),  @"NS.columnAlignments");
    }

    v4->_columnAlignments = (NSArray *)v5;
    v4->_int64_t columnCount = [a3 decodeIntegerForKey:@"NS.columnCount"];
    v4->_headerLevel = [a3 decodeIntegerForKey:@"NS.headerLevel"];
    v4->_languageHint = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.languageHint"];
    v4->_column = [a3 decodeIntegerForKey:@"NS.column"];
    v4->_int64_t row = [a3 decodeIntegerForKey:@"NS.row"];
    v4->_indentationLevel = [a3 decodeIntegerForKey:@"NS.indentationLevel"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (NSPresentationIntent)paragraphIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  int64_t v6 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
  v6[3] = identity;
  v6[1] = 0LL;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)headerIntentWithIdentity:(NSInteger)identity level:(NSInteger)level nestedInsideIntent:(NSPresentationIntent *)parent
{
  v8 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
  void v8[3] = identity;
  v8[1] = 1LL;
  v8[7] = level;
  if (parent) {
    NSInteger v9 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel");
  }
  else {
    NSInteger v9 = 0LL;
  }
  v8[11] = v9;
  v8[2] = parent;
  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)codeBlockIntentWithIdentity:(NSInteger)identity languageHint:(NSString *)languageHint nestedInsideIntent:(NSPresentationIntent *)parent
{
  v8 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
  void v8[3] = identity;
  v8[1] = 5LL;
  v8[8] = -[NSString copy](languageHint, "copy");
  if (parent) {
    NSInteger v9 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel");
  }
  else {
    NSInteger v9 = 0LL;
  }
  v8[11] = v9;
  v8[2] = parent;
  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)thematicBreakIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  int64_t v6 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
  v6[3] = identity;
  v6[1] = 7LL;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)orderedListIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  int64_t v6 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
  v6[3] = identity;
  v6[1] = 2LL;
  if (parent) {
    NSInteger v7 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel");
  }
  else {
    NSInteger v7 = 0LL;
  }
  v6[11] = v7;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)unorderedListIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  int64_t v6 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
  v6[3] = identity;
  v6[1] = 3LL;
  if (parent) {
    NSInteger v7 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel");
  }
  else {
    NSInteger v7 = 0LL;
  }
  v6[11] = v7;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)listItemIntentWithIdentity:(NSInteger)identity ordinal:(NSInteger)ordinal nestedInsideIntent:(NSPresentationIntent *)parent
{
  v8 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
  v8[1] = 4LL;
  void v8[3] = identity;
  v8[4] = ordinal;
  if (parent) {
    NSInteger v9 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel") + 1;
  }
  else {
    NSInteger v9 = 0LL;
  }
  v8[11] = v9;
  v8[2] = parent;
  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)blockQuoteIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  int64_t v6 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
  v6[3] = identity;
  v6[1] = 6LL;
  if (parent) {
    NSInteger v7 = -[NSPresentationIntent indentationLevel](parent, "indentationLevel") + 1;
  }
  else {
    NSInteger v7 = 0LL;
  }
  v6[11] = v7;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)tableIntentWithIdentity:(NSInteger)identity columnCount:(NSInteger)columnCount alignments:(NSArray *)alignments nestedInsideIntent:(NSPresentationIntent *)parent
{
  if (-[NSArray count](alignments, "count") == columnCount)
  {
    uint64_t v12 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
    v12[3] = identity;
    v12[1] = 8LL;
    v12[2] = parent;
    v12[6] = columnCount;
    v12[5] = -[NSArray copy](alignments, "copy");
    return (NSPresentationIntent *)v12;
  }

  else
  {
    NSInteger v14 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: column count does not match count of alignments", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
    objc_exception_throw(v14);
    return +[NSPresentationIntent tableRowIntentWithIdentity:row:nestedInsideIntent:](v15, v16, v17, v18, v19);
  }

+ (NSPresentationIntent)tableRowIntentWithIdentity:(NSInteger)identity row:(NSInteger)row nestedInsideIntent:(NSPresentationIntent *)parent
{
  v8 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
  void v8[3] = identity;
  v8[1] = 10LL;
  v8[10] = row;
  v8[2] = parent;
  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)tableHeaderRowIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  int64_t v6 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
  v6[3] = identity;
  v6[1] = 9LL;
  v6[2] = parent;
  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)tableCellIntentWithIdentity:(NSInteger)identity column:(NSInteger)column nestedInsideIntent:(NSPresentationIntent *)parent
{
  v8 = -[NSPresentationIntent _init](objc_alloc(&OBJC_CLASS___NSPresentationIntent), "_init");
  void v8[3] = identity;
  v8[1] = 11LL;
  v8[9] = column;
  v8[2] = parent;
  return (NSPresentationIntent *)v8;
}

- (NSPresentationIntentKind)intentKind
{
  return self->_intentKind;
}

- (NSPresentationIntent)parentIntent
{
  return (NSPresentationIntent *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSInteger)identity
{
  return self->_identity;
}

- (NSInteger)ordinal
{
  return self->_ordinal;
}

- (NSArray)columnAlignments
{
  return self->_columnAlignments;
}

- (NSInteger)columnCount
{
  return self->_columnCount;
}

- (NSInteger)headerLevel
{
  return self->_headerLevel;
}

- (NSString)languageHint
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSInteger)column
{
  return self->_column;
}

- (NSInteger)row
{
  return self->_row;
}

- (NSInteger)indentationLevel
{
  return self->_indentationLevel;
}

@end