@interface keyDataObject
- (double)valueDouble:(int64_t)a3;
- (id)keyString;
- (id)valueStr:(int64_t)a3;
- (int64_t)numValues;
- (keyDataObject)initWith:(id)a3;
- (keyDataObject)initWithT:(id)a3;
- (void)addToTimeArray:(double)a3 idx:(int64_t)a4;
- (void)addToValueArray:(id)a3 idx:(int64_t)a4;
@end

@implementation keyDataObject

- (keyDataObject)initWith:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___keyDataObject;
  v5 = -[keyDataObject init](&v11, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v4));
    keyString = v5->keyString;
    v5->keyString = (NSString *)v6;

    v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    valueArray = v5->valueArray;
    v5->valueArray = v8;

    v5->type = 1;
  }

  return v5;
}

- (keyDataObject)initWithT:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___keyDataObject;
  v5 = -[keyDataObject init](&v11, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v4));
    keyString = v5->keyString;
    v5->keyString = (NSString *)v6;

    v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    valueArray = v5->valueArray;
    v5->valueArray = v8;

    v5->type = 2;
  }

  return v5;
}

- (id)keyString
{
  return self->keyString;
}

- (id)valueStr:(int64_t)a3
{
  else {
    v5 = 0LL;
  }
  return v5;
}

- (double)valueDouble:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->valueArray, "objectAtIndex:", a3));
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (int64_t)numValues
{
  return (int64_t)-[NSMutableArray count](self->valueArray, "count");
}

- (void)addToValueArray:(id)a3 idx:(int64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", a3, a4));
  -[NSMutableArray addObject:](self->valueArray, "addObject:", v5);
}

- (void)addToTimeArray:(double)a3 idx:(int64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4, a3));
  -[NSMutableArray addObject:](self->valueArray, "addObject:", v5);
}

- (void).cxx_destruct
{
}

@end