@interface TSTimeConverter
- (TSTimeConverter)init;
- (TSTimeConverter)initWithContentsOfURL:(id)a3;
- (TSTimeConverter)initWithTAIUTCArray:(id)a3;
- (double)leapSecondForTAIDate:(id)a3;
- (double)leapSecondForUTCDate:(id)a3;
- (id)taiDateFromUTCDate:(id)a3;
- (id)utcDateFromTAIDate:(id)a3;
@end

@implementation TSTimeConverter

- (TSTimeConverter)init
{
  v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resourceURL]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"tai_utc_history.plist"]);

  v7 = -[TSTimeConverter initWithContentsOfURL:](self, "initWithContentsOfURL:", v6);
  return v7;
}

- (TSTimeConverter)initWithTAIUTCArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TSTimeConverter;
  v5 = -[TSTimeConverter init](&v9, "init");
  if (v5)
  {
    if ([v4 count])
    {
      v6 = (NSArray *)[v4 copy];
      taiutc = v5->_taiutc;
      v5->_taiutc = v6;
    }

    else
    {
      taiutc = v5;
      v5 = 0LL;
    }
  }

  return v5;
}

- (TSTimeConverter)initWithContentsOfURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfURL:](&OBJC_CLASS___NSArray, "arrayWithContentsOfURL:", v4));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[TSTAIUTCValue initWithDictionary:]( objc_alloc(&OBJC_CLASS___TSTAIUTCValue),  "initWithDictionary:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10));
        if (v11) {
          [v5 addObject:v11];
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  v12 = -[TSTimeConverter initWithTAIUTCArray:](self, "initWithTAIUTCArray:", v5);

  return v12;
}

- (id)taiDateFromUTCDate:(id)a3
{
  id v4 = a3;
  -[TSTimeConverter leapSecondForUTCDate:](self, "leapSecondForUTCDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:"));

  return v5;
}

- (id)utcDateFromTAIDate:(id)a3
{
  id v4 = a3;
  -[TSTimeConverter leapSecondForTAIDate:](self, "leapSecondForTAIDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:-v5]);

  return v6;
}

- (double)leapSecondForUTCDate:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = -[NSArray count](self->_taiutc, "count");
  if (v5)
  {
    NSUInteger v6 = v5;
    uint64_t v7 = 0LL;
    while (1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 utcDate]);
      [v4 timeIntervalSinceDate:v9];
      double v11 = v10;

      if (v11 >= 0.0) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
    [v13 coefficient];
    double v15 = v14;

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
    __int128 v17 = v16;
    if (v15 == 0.0)
    {
      [v16 constant];
      double v12 = v29;
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v16 utcDate]);
      [v4 timeIntervalSinceDate:v18];
      double v20 = v19 / 86400.0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      uint64_t v22 = (uint64_t)(v20 + (double)(unint64_t)[v21 modifiedJulianDay]);

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      [v17 constant];
      double v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      double v26 = (double)(v22 - (uint64_t)[v25 offset]);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      [v27 coefficient];
      double v12 = v24 + v26 * v28;
    }
  }

  else
  {
LABEL_5:
    double v12 = NAN;
  }

  return v12;
}

- (double)leapSecondForTAIDate:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = -[NSArray count](self->_taiutc, "count");
  if (v5)
  {
    NSUInteger v6 = v5;
    uint64_t v7 = 0LL;
    while (1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 taiDate]);
      [v4 timeIntervalSinceDate:v9];
      double v11 = v10;

      if (v11 >= 0.0) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
    [v13 coefficient];
    double v15 = v14;

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
    __int128 v17 = v16;
    if (v15 == 0.0)
    {
      [v16 constant];
      double v12 = v44;
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v16 taiDate]);
      [v4 timeIntervalSinceDate:v18];
      double v20 = v19 / 86400.0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      uint64_t v22 = (uint64_t)(v20 + (double)(unint64_t)[v21 modifiedJulianDay]);

      double v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      [v23 constant];
      double v25 = v24;
      double v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      double v27 = (double)(v22 - (uint64_t)[v26 offset]);
      double v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      [v28 coefficient];
      double v30 = v29;

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:-(v25 + v27 * v30)]);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 utcDate]);
      [v17 timeIntervalSinceDate:v32];
      double v34 = v33 / 86400.0;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      uint64_t v36 = (uint64_t)(v34 + (double)(unint64_t)[v35 modifiedJulianDay]);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      [v37 constant];
      double v39 = v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      double v41 = (double)(v36 - (uint64_t)[v40 offset]);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7));
      [v42 coefficient];
      double v12 = v39 + v41 * v43;
    }
  }

  else
  {
LABEL_5:
    double v12 = NAN;
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end