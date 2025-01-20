@interface DBGInsets
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withEdgeInsets:(DBGEdgeInsets)a3;
- (DBGEdgeInsets)edgeInsets;
- (DBGInsets)initWithEdgeInsets:(DBGEdgeInsets)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setEdgeInsets:(DBGEdgeInsets)a3;
@end

@implementation DBGInsets

+ (id)withEdgeInsets:(DBGEdgeInsets)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithEdgeInsets:", a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (DBGInsets)initWithEdgeInsets:(DBGEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DBGInsets;
  result = -[DBGInsets init](&v8, "init");
  if (result)
  {
    result->_edgeInsets.double top = top;
    result->_edgeInsets.double leading = leading;
    result->_edgeInsets.double bottom = bottom;
    result->_edgeInsets.double trailing = trailing;
  }

  return result;
}

- (id)objectValue
{
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v14[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v3));
  v14[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5));
  v14[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
  v14[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 4LL));

  return v12;
}

- (NSString)description
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGInsets objectValue](self, "objectValue"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  double v3 = (objc_class *)objc_opt_class(self, a2);
  double v4 = NSStringFromClass(v3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGInsets description](self, "description"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (DBGEdgeInsets)edgeInsets
{
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (void)setEdgeInsets:(DBGEdgeInsets)a3
{
  DBGEdgeInsets v3 = a3;
  objc_copyStruct(&self->_edgeInsets, &v3, 32LL, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v25 = 0LL;
  uint64_t v7 = DBGDecodeValueFromJSONCompatibleValue(a3, a4, &v25);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v25;
  v10 = v9;
  if (v9)
  {
    double v11 = 0.0;
    if (a5) {
      *a5 = v9;
    }
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    [v15 doubleValue];
    double v14 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
    [v17 doubleValue];
    double v13 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:2]);
    [v19 doubleValue];
    double v12 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:3]);
    [v21 doubleValue];
    double v11 = v22;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "withEdgeInsets:", v14, v13, v12, v11));

  return v23;
}

- (id)JSONCompatibleRepresentation
{
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v14[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v3));
  v14[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5));
  v14[2] = v10;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
  v14[3] = v11;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 4LL));

  return v12;
}

@end