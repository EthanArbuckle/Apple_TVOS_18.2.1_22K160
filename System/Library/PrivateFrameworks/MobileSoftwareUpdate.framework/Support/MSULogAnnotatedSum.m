@interface MSULogAnnotatedSum
+ (id)sum;
- (MSULogAnnotatedSum)init;
- (NSString)label;
- (id)description;
- (unint64_t)padding;
- (unint64_t)unit;
- (void)add:(int64_t)a3 annotation:(id)a4;
- (void)add:(int64_t)a3 annotationFormat:(id)a4;
- (void)dealloc;
- (void)format:(unint64_t)a3 label:(id)a4 padding:(unint64_t)a5;
@end

@implementation MSULogAnnotatedSum

+ (id)sum
{
  return objc_alloc_init(&OBJC_CLASS___MSULogAnnotatedSum);
}

- (MSULogAnnotatedSum)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSULogAnnotatedSum;
  v2 = -[MSULogAnnotatedSum init](&v4, "init");
  if (v2)
  {
    v2->addends = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->annotations = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->cachedDescription = 0LL;
    v2->_unit = 0x100000LL;
    v2->_label = (NSString *)@"MB";
    v2->_padding = 2LL;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSULogAnnotatedSum;
  -[MSULogAnnotatedSum dealloc](&v3, "dealloc");
}

- (void)format:(unint64_t)a3 label:(id)a4 padding:(unint64_t)a5
{
  if (a3)
  {
    self->_unit = a3;
    self->_label = (NSString *)a4;
    self->_padding = a5;

    self->cachedDescription = 0LL;
  }

  objc_sync_exit(self);
}

- (void)add:(int64_t)a3 annotation:(id)a4
{
  v7 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3);
  if (v7)
  {
    -[NSMutableArray addObject:](self->addends, "addObject:", v7);
    if (a4) {
      v8 = (const __CFString *)a4;
    }
    else {
      v8 = &stru_10005E618;
    }
    -[NSMutableArray addObject:](self->annotations, "addObject:", v8);

    self->cachedDescription = 0LL;
  }

  objc_sync_exit(self);
}

- (void)add:(int64_t)a3 annotationFormat:(id)a4
{
  v6 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", a4, &v7);
  -[MSULogAnnotatedSum add:annotation:](self, "add:annotation:", a3, v6);
}

- (id)description
{
  cachedDescription = self->cachedDescription;
  if (!cachedDescription)
  {
    context = objc_autoreleasePoolPush();
    v22 = +[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"\n");
    v21 = (char *)-[NSMutableArray count](self->addends, "count");
    uint64_t v23 = -[MSULogAnnotatedSum unit](self, "unit");
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    addends = self->addends;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( addends,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
    if (v5)
    {
      uint64_t v6 = *(void *)v25;
      unint64_t v7 = 1LL;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v25 != v6) {
            objc_enumerationMutation(addends);
          }
          v9 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          v10 = objc_autoreleasePoolPush();
          NSUInteger v11 = -[NSString length]( -[NSNumber stringValue]( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  (uint64_t)[v9 longLongValue] / v23),  "stringValue"),  "length");
          objc_autoreleasePoolPop(v10);
          if (v11 > v7) {
            unint64_t v7 = v11;
          }
        }

        id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( addends,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
      }

      while (v5);
    }

    else
    {
      unint64_t v7 = 1LL;
    }

    if (v21)
    {
      uint64_t v12 = 0LL;
      for (j = 0LL; j != v21; ++j)
      {
        uint64_t v14 = (uint64_t)objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:](self->addends, "objectAtIndexedSubscript:", j),  "longLongValue");
        id v15 = -[NSMutableArray objectAtIndexedSubscript:](self->annotations, "objectAtIndexedSubscript:", j);
        id v16 = -[NSMutableString length](v22, "length");
        -[NSMutableString appendFormat:]( v22,  "appendFormat:",  @"%*lld",  (char *)-[MSULogAnnotatedSum padding](self, "padding") + v7,  v14 / v23);
        if (-[NSString length](-[MSULogAnnotatedSum label](self, "label"), "length")) {
          -[NSMutableString appendFormat:]( v22,  "appendFormat:",  @" %@",  -[MSULogAnnotatedSum label](self, "label"));
        }
        if ([v15 length]) {
          -[NSMutableString appendFormat:](v22, "appendFormat:", @" %@", v15);
        }
        -[NSMutableString appendString:](v22, "appendString:", @"\n");
        v12 += v14 / v23;
      }

      if (-[MSULogAnnotatedSum padding](self, "padding")) {
        -[NSMutableString replaceCharactersInRange:withString:]( v22,  "replaceCharactersInRange:withString:",  v16,  1LL,  @"+");
      }
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    for (unint64_t k = 0LL; k < -[MSULogAnnotatedSum padding](self, "padding") + v7; ++k)
      -[NSMutableString appendString:](v22, "appendString:", @"-");
    -[NSMutableString appendString:](v22, "appendString:", @"\n");
    -[NSMutableString appendFormat:]( v22,  "appendFormat:",  @"%*lld",  (char *)-[MSULogAnnotatedSum padding](self, "padding") + v7,  v12);
    if (-[NSString length](-[MSULogAnnotatedSum label](self, "label"), "length")) {
      -[NSMutableString appendFormat:](v22, "appendFormat:", @" %@", -[MSULogAnnotatedSum label](self, "label"));
    }
    if (v22) {
      self->cachedDescription = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", v22);
    }
    objc_autoreleasePoolPop(context);
    cachedDescription = self->cachedDescription;
  }

  if (cachedDescription) {
    v18 = (const __CFString *)cachedDescription;
  }
  else {
    v18 = @"<MSUAnnotatedSum>";
  }
  objc_sync_exit(self);
  return (id)v18;
}

- (unint64_t)unit
{
  return self->_unit;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)padding
{
  return self->_padding;
}

@end