@interface ASCPair
- (ASCPair)initWithFirst:(id)a3 second:(id)a4;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)first;
- (id)second;
- (unint64_t)hash;
@end

@implementation ASCPair

- (ASCPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ASCPair;
  v9 = -[ASCPair init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCPair first](self, "first"));
  id v7 = [v6 copyWithZone:a3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCPair second](self, "second"));
  id v9 = [v8 copyWithZone:a3];
  id v10 = [v5 initWithFirst:v7 second:v9];

  return v10;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCPair first](self, "first"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCPair second](self, "second"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unint64_t v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCPair);
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCPair first](self, "first"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 first]);
    objc_super v12 = (void *)v11;
    if (v10 && v11)
    {
    }

    else if (v10 == (void *)v11)
    {
LABEL_10:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCPair second](self, "second"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 second]);
      v15 = (void *)v14;
      if (v13 && v14) {
        unsigned __int8 v16 = [v13 isEqual:v14];
      }
      else {
        unsigned __int8 v16 = v13 == (void *)v14;
      }

      goto LABEL_18;
    }

    unsigned __int8 v16 = 0;
LABEL_18:

    goto LABEL_19;
  }

  unsigned __int8 v16 = 0;
LABEL_19:

  return v16;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCPair first](self, "first"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCPair second](self, "second"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@, %@)", v3, v4));

  return v5;
}

- (id)first
{
  return self->_first;
}

- (id)second
{
  return self->_second;
}

- (void).cxx_destruct
{
}

@end