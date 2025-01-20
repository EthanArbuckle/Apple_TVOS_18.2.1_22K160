@interface ASCGenre
+ (BOOL)supportsSecureCoding;
- (ASCGenre)initWithCoder:(id)a3;
- (ASCGenre)initWithName:(id)a3 identifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCGenre

- (ASCGenre)initWithName:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ASCGenre;
  v8 = -[ASCGenre init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    v11 = (NSString *)[v7 copy];
    identifier = v8->_identifier;
    v8->_identifier = v11;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCGenre)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ASCGenre;
  v5 = -[ASCGenre init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"name"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    name = v5->_name;
    v5->_name = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"identifier"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCGenre name](self, "name"));
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ASCGenre identifier](self, "identifier"));
  [v4 encodeObject:v6 forKey:@"identifier"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCGenre name](self, "name"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCGenre identifier](self, "identifier"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unint64_t v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCGenre *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCGenre);
    unint64_t v6 = v4;
    uint64_t v7 = v6;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
        v8 = v7;
      }
      else {
        v8 = 0LL;
      }
    }

    else
    {
      v8 = 0LL;
    }

    uint64_t v10 = v8;

    if (!v10)
    {
      unsigned __int8 v9 = 0;
LABEL_21:

      goto LABEL_22;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCGenre name](self, "name"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCGenre name](v10, "name"));
    objc_super v13 = (void *)v12;
    if (v11 && v12)
    {
    }

    else if (v11 == (void *)v12)
    {
LABEL_12:
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCGenre identifier](self, "identifier"));
      uint64_t v15 = objc_claimAutoreleasedReturnValue(-[ASCGenre identifier](v10, "identifier"));
      v16 = (void *)v15;
      if (v14 && v15) {
        unsigned __int8 v9 = [v14 isEqual:v15];
      }
      else {
        unsigned __int8 v9 = v14 == (void *)v15;
      }

      goto LABEL_20;
    }

    unsigned __int8 v9 = 0;
LABEL_20:

    goto LABEL_21;
  }

  unsigned __int8 v9 = 1;
LABEL_22:

  return v9;
}

- (id)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCGenre name](self, "name"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"name");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCGenre identifier](self, "identifier"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"identifier");

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end