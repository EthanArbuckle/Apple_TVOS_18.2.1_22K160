@interface NSNumber
- (id)dbgStringForType:(id)a3 error:(id *)a4;
@end

@implementation NSNumber

- (id)dbgStringForType:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 isEqualToString:@"b"])
  {
    uint64_t v19 = -[NSNumber BOOLValue](self, "BOOLValue");
LABEL_3:
    v7 = @"%d";
LABEL_9:
    v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v19);
    goto LABEL_10;
  }

  if ([v6 isEqualToString:@"f"])
  {
    -[NSNumber floatValue](self, "floatValue");
    v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%a", v8);
LABEL_10:
    a4 = (id *)objc_claimAutoreleasedReturnValue(v9);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:@"d"])
  {
LABEL_8:
    -[NSNumber doubleValue](self, "doubleValue");
    uint64_t v19 = v10;
    v7 = @"%la";
    goto LABEL_9;
  }

  if ([v6 isEqualToString:@"integer"])
  {
    uint64_t v12 = -[NSNumber integerValue](self, "integerValue");
LABEL_14:
    v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", v12);
    goto LABEL_10;
  }

  if ([v6 isEqualToString:@"uinteger"])
  {
    unint64_t v13 = -[NSNumber unsignedIntegerValue](self, "unsignedIntegerValue");
LABEL_17:
    v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lx", v13);
    goto LABEL_10;
  }

  if ([v6 isEqualToString:@"i"])
  {
    uint64_t v19 = -[NSNumber intValue](self, "intValue");
    goto LABEL_3;
  }

  if ([v6 isEqualToString:@"ui"])
  {
    v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  -[NSNumber unsignedIntValue](self, "unsignedIntValue"));
    goto LABEL_10;
  }

  if ([v6 isEqualToString:@"l"])
  {
    uint64_t v12 = -[NSNumber longValue](self, "longValue");
    goto LABEL_14;
  }

  if ([v6 isEqualToString:@"ul"])
  {
    unint64_t v13 = -[NSNumber unsignedLongValue](self, "unsignedLongValue");
    goto LABEL_17;
  }

  if ([v6 isEqualToString:@"ll"])
  {
    uint64_t v14 = -[NSNumber longLongValue](self, "longLongValue");
LABEL_30:
    v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llx", v14);
    goto LABEL_10;
  }

  if ([v6 isEqualToString:@"ull"])
  {
    uint64_t v14 = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
    goto LABEL_30;
  }

  if (a4)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown type specifier: %@",  v6));
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    v21 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyNumberStringEncodingErrorDomain",  1LL,  v16));

    id v18 = v17;
    *a4 = v18;

    a4 = 0LL;
  }

@end