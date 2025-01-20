@interface TIContinuousPath
+ (BOOL)supportsSecureCoding;
- (NSArray)samples;
- (TIContinuousPath)init;
- (TIContinuousPath)initWithCoder:(id)a3;
- (TIContinuousPath)initWithJsonDictionary:(id)a3;
- (TIContinuousPath)initWithTimeStamp:(double)a3;
- (double)timeStamp;
- (id)description;
- (id)toJsonDictionary;
- (void)addSample:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIContinuousPath

- (TIContinuousPath)initWithTimeStamp:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TIContinuousPath;
  v3 = -[TIContinuousPath init](&v7, "init", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    samples = v3->_samples;
    v3->_samples = v4;
  }

  return v3;
}

- (TIContinuousPath)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TIContinuousPath;
  v2 = -[TIContinuousPath init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    samples = v2->_samples;
    v2->_samples = v3;
  }

  return v2;
}

- (TIContinuousPath)initWithJsonDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TIContinuousPath;
  v5 = -[TIContinuousPath init](&v19, "init");
  if (v5)
  {
    objc_super v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    samples = v5->_samples;
    v5->_samples = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"samples"]);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = -[TIContinuousPathSample initWithJsonDictionary:]( objc_alloc(&OBJC_CLASS___TIContinuousPathSample),  "initWithJsonDictionary:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v12));
          -[TIContinuousPath addSample:](v5, "addSample:", v13);

          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }

      while (v10);
    }
  }

  return v5;
}

- (double)timeStamp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_samples, "objectAtIndexedSubscript:", 0LL));
  [v2 timeStamp];
  double v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (TIContinuousPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TIContinuousPath;
  v5 = -[TIContinuousPath init](&v13, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
    objc_super v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___TIContinuousPathSample),  0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"samples"]);
    id v10 = (NSMutableArray *)[v9 copy];
    samples = v5->_samples;
    v5->_samples = v10;
  }

  return v5;
}

- (void)addSample:(id)a3
{
}

- (id)toJsonDictionary
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = self->_samples;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "toJsonDictionary", (void)v12));
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"samples"];
  return v3;
}

- (id)description
{
  double v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@: %p",  objc_opt_class(self),  self);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = self->_samples;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"; sample = %@",
          *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8));
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  -[NSMutableString appendString:](v3, "appendString:", @">");
  return v3;
}

- (NSArray)samples
{
  return &self->_samples->super;
}

- (void).cxx_destruct
{
}

@end