@interface NSInvocation
+ (const)_typeWithoutQualifiers:(const char *)a3;
- (id)BOOLDescriptionAtIndex:(int64_t)a3;
- (id)argumentDescriptionForIndex:(int64_t)a3;
- (id)blockDescriptionAtIndex:(int64_t)a3;
- (id)blockInvocationDescription;
- (id)cStringDescriptionAtIndex:(int64_t)a3;
- (id)charDescriptionAtIndex:(int64_t)a3;
- (id)doubleDescriptionAtIndex:(int64_t)a3;
- (id)floatDescriptionAtIndex:(int64_t)a3;
- (id)intDescriptionAtIndex:(int64_t)a3;
- (id)invocationDescription;
- (id)longDescriptionAtIndex:(int64_t)a3;
- (id)longDoubleDescriptionAtIndex:(int64_t)a3;
- (id)longLongDescriptionAtIndex:(int64_t)a3;
- (id)objectDescriptionAtIndex:(int64_t)a3;
- (id)pointerDescriptionAtIndex:(int64_t)a3;
- (id)selectorDescriptionAtIndex:(int64_t)a3;
- (id)shortDescriptionAtIndex:(int64_t)a3;
- (id)unsignedCharDescriptionAtIndex:(int64_t)a3;
- (id)unsignedIntDescriptionAtIndex:(int64_t)a3;
- (id)unsignedLongDescriptionAtIndex:(int64_t)a3;
- (id)unsignedLongLongDescriptionAtIndex:(int64_t)a3;
- (id)unsignedShortDescriptionAtIndex:(int64_t)a3;
- (int64_t)getBlockArgumentIndex;
@end

@implementation NSInvocation

+ (const)_typeWithoutQualifiers:(const char *)a3
{
  v3 = a3 - 1;
  do
    int v4 = *++v3;
  while (memchr("rnNoORV", v4, 8uLL));
  return v3;
}

- (id)invocationDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation methodSignature](self, "methodSignature"));
  id v4 = [v3 numberOfArguments];
  v5 = NSStringFromSelector(-[NSInvocation selector](self, "selector"));
  v6 = (NSMutableString *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4 != (id)2)
  {
    v14 = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString componentsSeparatedByString:](v6, "componentsSeparatedByString:", @":"));

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    if ((unint64_t)v4 >= 3)
    {
      for (unint64_t i = 2LL; (id)i != v4; ++i)
      {
        if (i <= 2) {
          v10 = &stru_100024E50;
        }
        else {
          v10 = @" ";
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:i - 2]);
        -[NSMutableString appendFormat:](v7, "appendFormat:", @"%@%@:", v10, v11);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation argumentDescriptionForIndex:](self, "argumentDescriptionForIndex:", i));
        -[NSMutableString appendString:](v7, "appendString:", v12);
      }
    }

    v3 = v14;
  }

  return v7;
}

- (id)blockInvocationDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation methodSignature](self, "methodSignature"));
  id v4 = [v3 numberOfArguments];
  if (v4 == (id)1)
  {
    v5 = (NSMutableString *)@"block(void)";
  }

  else
  {
    id v6 = v4;
    v5 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  @"block(");
    if (v6)
    {
      for (unint64_t i = 1LL; (id)i != v6; ++i)
      {
        if (i <= 1) {
          v8 = &stru_100024E50;
        }
        else {
          v8 = @", ";
        }
        -[NSMutableString appendFormat:](v5, "appendFormat:", @"%@", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation argumentDescriptionForIndex:](self, "argumentDescriptionForIndex:", i));
        -[NSMutableString appendString:](v5, "appendString:", v9);
      }
    }

    -[NSMutableString appendString:](v5, "appendString:", @""));
  }

  return v5;
}

- (id)argumentDescriptionForIndex:(int64_t)a3
{
  id v5 = objc_claimAutoreleasedReturnValue(-[NSInvocation methodSignature](self, "methodSignature"));
  id v6 = [v5 getArgumentTypeAtIndex:a3];

  unsigned int v8 = *(unsigned __int8 *)objc_msgSend((id)objc_opt_class(self, v7), "_typeWithoutQualifiers:", v6);
  if (v8 > 0x52)
  {
    switch(v8)
    {
      case 'c':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation charDescriptionAtIndex:](self, "charDescriptionAtIndex:", a3));
        break;
      case 'd':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation doubleDescriptionAtIndex:](self, "doubleDescriptionAtIndex:", a3));
        break;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
        goto LABEL_16;
      case 'f':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation floatDescriptionAtIndex:](self, "floatDescriptionAtIndex:", a3));
        break;
      case 'i':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation intDescriptionAtIndex:](self, "intDescriptionAtIndex:", a3));
        break;
      case 'q':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation longDescriptionAtIndex:](self, "longDescriptionAtIndex:", a3));
        break;
      case 'r':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation cStringDescriptionAtIndex:](self, "cStringDescriptionAtIndex:", a3));
        break;
      case 's':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation shortDescriptionAtIndex:](self, "shortDescriptionAtIndex:", a3));
        break;
      default:
        if (v8 == 83)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation unsignedShortDescriptionAtIndex:](self, "unsignedShortDescriptionAtIndex:", a3));
        }

        else if (v8 == 94)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation pointerDescriptionAtIndex:](self, "pointerDescriptionAtIndex:", a3));
        }

        else
        {
LABEL_16:
          v9 = (void *)objc_claimAutoreleasedReturnValue([@"<??" stringByAppendingString:@">"]);
        }

        break;
    }
  }

  else
  {
    switch(v8)
    {
      case '@':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation objectDescriptionAtIndex:](self, "objectDescriptionAtIndex:", a3));
        return v9;
      case 'A':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
        goto LABEL_16;
      case 'B':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation BOOLDescriptionAtIndex:](self, "BOOLDescriptionAtIndex:", a3));
        return v9;
      case 'C':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation unsignedCharDescriptionAtIndex:](self, "unsignedCharDescriptionAtIndex:", a3));
        return v9;
      case 'D':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation longDoubleDescriptionAtIndex:](self, "longDoubleDescriptionAtIndex:", a3));
        return v9;
      case 'I':
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation unsignedIntDescriptionAtIndex:](self, "unsignedIntDescriptionAtIndex:", a3));
        return v9;
      default:
        if (v8 == 58)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation selectorDescriptionAtIndex:](self, "selectorDescriptionAtIndex:", a3));
        }

        else
        {
          if (v8 != 81) {
            goto LABEL_16;
          }
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation unsignedLongDescriptionAtIndex:](self, "unsignedLongDescriptionAtIndex:", a3));
        }

        break;
    }
  }

  return v9;
}

- (id)objectDescriptionAtIndex:(int64_t)a3
{
  id v12 = 0LL;
  -[NSInvocation getArgument:atIndex:](self, "getArgument:atIndex:", &v12, a3);
  if (!v12) {
    return @"nil";
  }
  if (([v12 isProxy] & 1) != 0
    || (id v4 = v12, v5 = objc_opt_class(&OBJC_CLASS___NSString, v3), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v12 description]);
    id v6 = (void *)v8;
    v9 = @"<nil description>";
    if (v8) {
      v9 = (__CFString *)v8;
    }
    uint64_t v7 = v9;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"@\"%@\"",  v6));
  }

  v10 = v7;

  return v10;
}

- (id)BOOLDescriptionAtIndex:(int64_t)a3
{
  if (v5) {
    uint64_t v3 = @"YES";
  }
  else {
    uint64_t v3 = @"NO";
  }
  return v3;
}

- (id)charDescriptionAtIndex:(int64_t)a3
{
  if (BYTE1(v5[0]) || LOBYTE(v5[0]) > 1u) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%c'",  LOBYTE(v5[0])));
  }
  uint64_t v3 = @"NO";
  if (LOBYTE(v5[0]) == 1) {
    uint64_t v3 = @"YES";
  }
  return v3;
}

- (id)unsignedCharDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%c'",  LOBYTE(v4[0])));
}

- (id)intDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  v4));
}

- (id)unsignedIntDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  v4));
}

- (id)shortDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%hi",  v4));
}

- (id)unsignedShortDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%hu",  v4));
}

- (id)longDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  v4));
}

- (id)unsignedLongDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  v4));
}

- (id)longLongDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%qi",  v4));
}

- (id)unsignedLongLongDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%qu",  v4));
}

- (id)doubleDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%f",  v4));
}

- (id)floatDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%f",  v4));
}

- (id)longDoubleDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%Lf",  v4));
}

- (id)pointerDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%p",  v4));
}

- (id)cStringDescriptionAtIndex:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\"%s\"",  v5));
}

- (id)selectorDescriptionAtIndex:(int64_t)a3
{
  uint64_t v3 = NSStringFromSelector(aSelector);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  char v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"@selector(%@)", v4));

  return v5;
}

- (id)blockDescriptionAtIndex:(int64_t)a3
{
  uint64_t v4 = 0LL;
  -[NSInvocation getArgument:atIndex:](self, "getArgument:atIndex:", &v4, a3);
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v4));
}

- (int64_t)getBlockArgumentIndex
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSInvocation methodSignature](self, "methodSignature"));
  id v3 = [v2 numberOfArguments];
  if ((unint64_t)v3 < 3)
  {
LABEL_5:
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  else
  {
    id v4 = v3;
    int64_t v5 = 2LL;
    while (strcmp((const char *)[v2 getArgumentTypeAtIndex:v5], "@?"))
    {
      if (v4 == (id)++v5) {
        goto LABEL_5;
      }
    }
  }

  return v5;
}

@end