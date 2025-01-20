@interface KTLoggableDataArray
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (KTLoggableDataArray)initWithCoder:(id)a3;
- (KTLoggableDataArray)initWithLoggableDatas:(id)a3;
- (NSArray)loggableDatas;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLoggableDatas:(id)a3;
@end

@implementation KTLoggableDataArray

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTLoggableDataArray)initWithLoggableDatas:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___KTLoggableDataArray;
  v5 = -[KTLoggableDataArray init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[KTLoggableDataArray setLoggableDatas:](v5, "setLoggableDatas:", v4);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[KTLoggableDataArray loggableDatas](self, "loggableDatas"));
  [v4 encodeObject:v5 forKey:@"loggableDatas"];
}

- (KTLoggableDataArray)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
  objc_super v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___KTLoggableData, v7),  0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"loggableDatas"]);

  v11 = -[KTLoggableDataArray initWithLoggableDatas:]( objc_alloc(&OBJC_CLASS___KTLoggableDataArray),  "initWithLoggableDatas:",  v10);
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (KTLoggableDataArray *)a3;
  if (self == v5)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___KTLoggableDataArray, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableDataArray loggableDatas](v5, "loggableDatas"));
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableDataArray loggableDatas](self, "loggableDatas"));
      unsigned __int8 v9 = [v7 isEqualToArray:v8];
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableDataArray loggableDatas](self, "loggableDatas"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return v3;
}

- (NSArray)loggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setLoggableDatas:(id)a3
{
}

- (void).cxx_destruct
{
}

@end