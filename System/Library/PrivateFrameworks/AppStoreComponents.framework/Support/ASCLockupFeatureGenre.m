@interface ASCLockupFeatureGenre
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureGenre)initWithCoder:(id)a3;
- (ASCLockupFeatureGenre)initWithGenreName:(id)a3 genreID:(id)a4 subgenres:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)subgenres;
- (NSString)description;
- (NSString)genreID;
- (NSString)genreName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureGenre

- (ASCLockupFeatureGenre)initWithGenreName:(id)a3 genreID:(id)a4 subgenres:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ASCLockupFeatureGenre;
  v11 = -[ASCLockupFeatureGenre init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    genreName = v11->_genreName;
    v11->_genreName = v12;

    v14 = (NSString *)[v9 copy];
    genreID = v11->_genreID;
    v11->_genreID = v14;

    v16 = (NSArray *)[v10 copy];
    subgenres = v11->_subgenres;
    v11->_subgenres = v16;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureGenre)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"genreName"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"genreID"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
  v11 = -[NSSet initWithObjects:](v9, "initWithObjects:", v10, objc_opt_class(&OBJC_CLASS___ASCGenre), 0LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"subgenres"]);

  v13 = -[ASCLockupFeatureGenre initWithGenreName:genreID:subgenres:]( self,  "initWithGenreName:genreID:subgenres:",  v6,  v8,  v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre genreName](self, "genreName"));
  [v4 encodeObject:v5 forKey:@"genreName"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre genreID](self, "genreID"));
  [v4 encodeObject:v6 forKey:@"genreID"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre subgenres](self, "subgenres"));
  [v4 encodeObject:v7 forKey:@"subgenres"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre genreName](self, "genreName"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre genreID](self, "genreID"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre subgenres](self, "subgenres"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  unint64_t v7 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureGenre *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupFeatureGenre);
    v6 = v4;
    unint64_t v7 = v6;
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

    uint64_t v10 = v8;

    if (!v10)
    {
      unsigned __int8 v9 = 0;
LABEL_27:

      goto LABEL_28;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre genreName](self, "genreName"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre genreName](v10, "genreName"));
    v13 = (void *)v12;
    if (v11 && v12)
    {
      if ([v11 isEqual:v12])
      {
LABEL_12:
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre genreID](self, "genreID"));
        uint64_t v15 = objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre genreID](v10, "genreID"));
        v16 = (void *)v15;
        if (v14 && v15)
        {
        }

        else if (v14 == (void *)v15)
        {
LABEL_15:
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre subgenres](self, "subgenres"));
          uint64_t v18 = objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre subgenres](v10, "subgenres"));
          objc_super v19 = (void *)v18;
          if (v17 && v18) {
            unsigned __int8 v9 = [v17 isEqual:v18];
          }
          else {
            unsigned __int8 v9 = v17 == (void *)v18;
          }

          goto LABEL_25;
        }

        unsigned __int8 v9 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }

    else if (v11 == (void *)v12)
    {
      goto LABEL_12;
    }

    unsigned __int8 v9 = 0;
LABEL_26:

    goto LABEL_27;
  }

  unsigned __int8 v9 = 1;
LABEL_28:

  return v9;
}

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre genreName](self, "genreName"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"genreName");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre genreID](self, "genreID"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"genreID");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureGenre subgenres](self, "subgenres"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"subgenres");

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v7;
}

- (NSString)genreName
{
  return self->_genreName;
}

- (NSString)genreID
{
  return self->_genreID;
}

- (NSArray)subgenres
{
  return self->_subgenres;
}

- (void).cxx_destruct
{
}

@end