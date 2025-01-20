@interface APSStatusPrinter
+ (id)statusPrinter;
- (APSStatusPrinter)init;
- (id)description;
- (id)lineWithDescription:(id)a3;
- (void)appendDescription:(id)a3 BOOLValue:(BOOL)a4;
- (void)appendDescription:(id)a3 dateValue:(id)a4;
- (void)appendDescription:(id)a3 enabledValue:(BOOL)a4;
- (void)appendDescription:(id)a3 intValue:(int)a4;
- (void)appendDescription:(id)a3 integerValue:(int64_t)a4;
- (void)appendDescription:(id)a3 longLongValue:(int64_t)a4;
- (void)appendDescription:(id)a3 stringValue:(id)a4;
- (void)appendDescription:(id)a3 successRateWithSuccessCount:(unint64_t)a4 failureCount:(unint64_t)a5;
- (void)appendDescription:(id)a3 timeIntervalValue:(double)a4;
- (void)appendDescription:(id)a3 unsignedLongLongValue:(unint64_t)a4;
- (void)appendDescription:(id)a3 unsignedShortValue:(unsigned __int16)a4;
- (void)appendLine:(id)a3;
- (void)popIndent;
- (void)pushIndent;
@end

@implementation APSStatusPrinter

- (APSStatusPrinter)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___APSStatusPrinter;
  v2 = -[APSStatusPrinter init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    s = v2->_s;
    v2->_s = v3;
  }

  return v2;
}

- (id)lineWithDescription:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if (self->_indent)
  {
    unint64_t v6 = 0LL;
    do
    {
      -[NSMutableString appendString:](v5, "appendString:", @"   ");
      ++v6;
    }

    while (v6 < self->_indent);
  }

  if (v4) {
    v7 = v4;
  }
  else {
    v7 = @"nil description";
  }
  -[NSMutableString appendString:](v5, "appendString:", v7);
  -[NSMutableString appendString:](v5, "appendString:", @":");
  v8 = (char *)-[NSMutableString length](v5, "length");
  if ((unint64_t)v8 <= 0x2D)
  {
    v9 = v8 - 46;
    do
      -[NSMutableString appendString:](v5, "appendString:", @" ");
    while (!__CFADD__(v9++, 1LL));
  }

  return v5;
}

- (void)appendLine:(id)a3
{
  s = self->_s;
  if (!a3) {
    a3 = &stru_100123240;
  }
  -[NSMutableString appendString:](s, "appendString:", a3);
  -[NSMutableString appendString:](self->_s, "appendString:", @"\n");
}

+ (id)statusPrinter
{
  return objc_alloc_init(&OBJC_CLASS___APSStatusPrinter);
}

- (void)pushIndent
{
}

- (void)popIndent
{
}

- (void)appendDescription:(id)a3 stringValue:(id)a4
{
  unint64_t v6 = (__CFString *)a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSStatusPrinter lineWithDescription:](self, "lineWithDescription:", a3));
  id v9 = v7;
  if (v6) {
    v8 = v6;
  }
  else {
    v8 = @"nil";
  }
  [v7 appendString:v8];

  -[APSStatusPrinter appendLine:](self, "appendLine:", v9);
}

- (void)appendDescription:(id)a3 BOOLValue:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSStatusPrinter lineWithDescription:](self, "lineWithDescription:", a3));
  v7 = @"No";
  if (v4) {
    v7 = @"Yes";
  }
  id v8 = v6;
  [v6 appendFormat:@"%@", v7];
  -[APSStatusPrinter appendLine:](self, "appendLine:", v8);
}

- (void)appendDescription:(id)a3 enabledValue:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSStatusPrinter lineWithDescription:](self, "lineWithDescription:", a3));
  v7 = @"Disabled";
  if (v4) {
    v7 = @"Enabled";
  }
  id v8 = v6;
  [v6 appendFormat:@"%@", v7];
  -[APSStatusPrinter appendLine:](self, "appendLine:", v8);
}

- (void)appendDescription:(id)a3 dateValue:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[APSStatusPrinter lineWithDescription:](self, "lineWithDescription:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APSDatePrinter dateStringFromDate:](&OBJC_CLASS___APSDatePrinter, "dateStringFromDate:", v6));

  [v8 appendFormat:@"%@", v7];
  -[APSStatusPrinter appendLine:](self, "appendLine:", v8);
}

- (void)appendDescription:(id)a3 timeIntervalValue:(double)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[APSStatusPrinter lineWithDescription:](self, "lineWithDescription:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APSDatePrinter dateStringFromInterval:](&OBJC_CLASS___APSDatePrinter, "dateStringFromInterval:", a4));
  [v7 appendFormat:@"%@", v6];

  -[APSStatusPrinter appendLine:](self, "appendLine:", v7);
}

- (void)appendDescription:(id)a3 unsignedShortValue:(unsigned __int16)a4
{
}

- (void)appendDescription:(id)a3 intValue:(int)a4
{
}

- (void)appendDescription:(id)a3 longLongValue:(int64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[APSStatusPrinter lineWithDescription:](self, "lineWithDescription:", a3));
  objc_msgSend(v6, "appendFormat:", @"%lld", a4);
  -[APSStatusPrinter appendLine:](self, "appendLine:", v6);
}

- (void)appendDescription:(id)a3 unsignedLongLongValue:(unint64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[APSStatusPrinter lineWithDescription:](self, "lineWithDescription:", a3));
  objc_msgSend(v6, "appendFormat:", @"%llu", a4);
  -[APSStatusPrinter appendLine:](self, "appendLine:", v6);
}

- (void)appendDescription:(id)a3 integerValue:(int64_t)a4
{
}

- (void)appendDescription:(id)a3 successRateWithSuccessCount:(unint64_t)a4 failureCount:(unint64_t)a5
{
  id v14 = a3;
  id v8 = @"*";
  unint64_t v9 = a5 + a4;
  if (__CFADD__(a5, a4) || v9 < a5) {
    goto LABEL_16;
  }
  if (!v9)
  {
    double v10 = 0.0;
LABEL_15:
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.0f%%",  *(void *)&v10));
    goto LABEL_16;
  }

  double v10 = (double)a4 / (double)v9 * 100.0;
  if (a4 && v10 < 1.0)
  {
    if (v10 < 0.000001)
    {
      v11 = @"< 0.000001%%";
      goto LABEL_14;
    }
  }

  else
  {
    if (!a5 || v10 <= 99.499999) {
      goto LABEL_15;
    }
    if (v10 > 99.999999)
    {
      v11 = @"> 99.999999%%";
      goto LABEL_14;
    }
  }

  double v13 = (double)a4 / (double)v9 * 100.0;
  v11 = @"%.06f%%";
LABEL_14:
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, *(void *)&v13));
  if (!v8) {
    goto LABEL_15;
  }
LABEL_16:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSStatusPrinter lineWithDescription:](self, "lineWithDescription:", v14));
  [v12 appendFormat:@"%@ (%llu of %llu)", v8, a4, v9];
  -[APSStatusPrinter appendLine:](self, "appendLine:", v12);
}

- (id)description
{
  return -[NSMutableString description](self->_s, "description");
}

- (void).cxx_destruct
{
}

@end