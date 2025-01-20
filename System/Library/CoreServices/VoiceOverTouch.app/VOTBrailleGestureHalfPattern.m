@interface VOTBrailleGestureHalfPattern
+ (id)halfPatternWithDictionaryRepresentation:(id)a3;
+ (id)halfPatternWithDots:(id)a3;
+ (id)halfPatternWithTopDot:(id)a3 middleDot:(id)a4 bottomDot:(id)a5;
+ (id)halfPatternWithTopDot:(id)a3 middleDot:(id)a4 bottomDot:(id)a5 fourthDot:(id)a6;
- (NSDictionary)dictionaryRepresentation;
- (NSValue)bottomDot;
- (NSValue)fourthDot;
- (NSValue)middleDot;
- (NSValue)topDot;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dotArrayReversed:(BOOL)a3;
- (unint64_t)count;
- (void)setBottomDot:(id)a3;
- (void)setFourthDot:(id)a3;
- (void)setMiddleDot:(id)a3;
- (void)setTopDot:(id)a3;
@end

@implementation VOTBrailleGestureHalfPattern

+ (id)halfPatternWithTopDot:(id)a3 middleDot:(id)a4 bottomDot:(id)a5
{
  return [a1 halfPatternWithTopDot:a3 middleDot:a4 bottomDot:a5 fourthDot:0];
}

+ (id)halfPatternWithTopDot:(id)a3 middleDot:(id)a4 bottomDot:(id)a5 fourthDot:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)a1);
  [v14 setTopDot:v13];

  [v14 setMiddleDot:v12];
  [v14 setBottomDot:v11];

  [v14 setFourthDot:v10];
  return v14;
}

+ (id)halfPatternWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"TopDot"]);
  id v7 = sub_100039F14(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setTopDot:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"MiddleDot"]);
  id v10 = sub_100039F14(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v5 setMiddleDot:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BottomDot"]);
  id v13 = sub_100039F14(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v5 setBottomDot:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FourthDot"]);
  id v16 = sub_100039F14(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v5 setFourthDot:v17];

  return v5;
}

+ (id)halfPatternWithDots:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  if ([v4 count])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
    [v5 setTopDot:v6];
  }

  else
  {
    [v5 setTopDot:0];
  }

  if ((unint64_t)[v4 count] <= 1)
  {
    [v5 setMiddleDot:0];
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:1]);
    [v5 setMiddleDot:v7];
  }

  if ((unint64_t)[v4 count] <= 2)
  {
    [v5 setBottomDot:0];
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:2]);
    [v5 setBottomDot:v8];
  }

  if ((unint64_t)[v4 count] <= 3)
  {
    [v5 setFourthDot:0];
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:3]);
    [v5 setFourthDot:v9];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)objc_opt_class(self, a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern topDot](self, "topDot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern middleDot](self, "middleDot"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern bottomDot](self, "bottomDot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern fourthDot](self, "fourthDot"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 halfPatternWithTopDot:v5 middleDot:v6 bottomDot:v7 fourthDot:v8]);

  return v9;
}

- (unint64_t)count
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern topDot](self, "topDot"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern middleDot](self, "middleDot"));
  uint64_t v5 = 1LL;
  if (v3) {
    uint64_t v5 = 2LL;
  }
  if (v4) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = v3 != 0LL;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern bottomDot](self, "bottomDot"));

  if (v7) {
    unint64_t v8 = v6 + 1;
  }
  else {
    unint64_t v8 = v6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern fourthDot](self, "fourthDot"));

  if (v9) {
    return v8 + 1;
  }
  else {
    return v8;
  }
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureHalfPattern;
  id v3 = -[VOTBrailleGestureHalfPattern description](&v11, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern topDot](self, "topDot"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern middleDot](self, "middleDot"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern bottomDot](self, "bottomDot"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern fourthDot](self, "fourthDot"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByAppendingFormat:@" - top: %@, middle: %@, bottom: %@, fourth: %@", v5, v6, v7, v8]);

  return v9;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern topDot](self, "topDot"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern topDot](self, "topDot"));
    id v6 = sub_100039FBC(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v3 setObject:v7 forKeyedSubscript:@"TopDot"];
  }

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern middleDot](self, "middleDot"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern middleDot](self, "middleDot"));
    id v10 = sub_100039FBC(v9);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v3 setObject:v11 forKeyedSubscript:@"MiddleDot"];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern bottomDot](self, "bottomDot"));

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern bottomDot](self, "bottomDot"));
    id v14 = sub_100039FBC(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v3 setObject:v15 forKeyedSubscript:@"BottomDot"];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern fourthDot](self, "fourthDot"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern fourthDot](self, "fourthDot"));
    id v18 = sub_100039FBC(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v3 setObject:v19 forKeyedSubscript:@"FourthDot"];
  }

  return (NSDictionary *)v3;
}

- (id)dotArrayReversed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern fourthDot](self, "fourthDot"));

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern fourthDot](self, "fourthDot"));
      [v5 addObject:v7];
    }

    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern bottomDot](self, "bottomDot"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern bottomDot](self, "bottomDot"));
      [v5 addObject:v9];
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern middleDot](self, "middleDot"));

    if (v10)
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern middleDot](self, "middleDot"));
      [v5 addObject:v11];
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern topDot](self, "topDot"));

    if (v12)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern topDot](self, "topDot"));
LABEL_18:
      v21 = (void *)v13;
      [v5 addObject:v13];
    }
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern topDot](self, "topDot"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern topDot](self, "topDot"));
      [v5 addObject:v15];
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern middleDot](self, "middleDot"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern middleDot](self, "middleDot"));
      [v5 addObject:v17];
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern bottomDot](self, "bottomDot"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern bottomDot](self, "bottomDot"));
      [v5 addObject:v19];
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern fourthDot](self, "fourthDot"));

    if (v20)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureHalfPattern fourthDot](self, "fourthDot"));
      goto LABEL_18;
    }
  }

  return v5;
}

- (NSValue)topDot
{
  return self->_topDot;
}

- (void)setTopDot:(id)a3
{
}

- (NSValue)middleDot
{
  return self->_middleDot;
}

- (void)setMiddleDot:(id)a3
{
}

- (NSValue)bottomDot
{
  return self->_bottomDot;
}

- (void)setBottomDot:(id)a3
{
}

- (NSValue)fourthDot
{
  return self->_fourthDot;
}

- (void)setFourthDot:(id)a3
{
}

- (void).cxx_destruct
{
}

@end