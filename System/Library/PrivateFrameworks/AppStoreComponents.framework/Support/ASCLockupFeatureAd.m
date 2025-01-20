@interface ASCLockupFeatureAd
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureAd)initWithCoder:(id)a3;
- (ASCLockupFeatureAd)initWithEditorsChoice:(BOOL)a3 productRating:(float)a4 productRatingBadge:(id)a5 productDescription:(id)a6;
- (BOOL)isEditorsChoice;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)productDescription;
- (NSString)productRatingBadge;
- (float)productRating;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureAd

- (ASCLockupFeatureAd)initWithEditorsChoice:(BOOL)a3 productRating:(float)a4 productRatingBadge:(id)a5 productDescription:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ASCLockupFeatureAd;
  v12 = -[ASCLockupFeatureAd init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    v12->_isEditorsChoice = a3;
    v12->_productRating = a4;
    v14 = (NSString *)[v10 copy];
    productRatingBadge = v13->_productRatingBadge;
    v13->_productRatingBadge = v14;

    v16 = (NSString *)[v11 copy];
    productDescription = v13->_productDescription;
    v13->_productDescription = v16;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureAd)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeBoolForKey:@"isEditorsChoice"];
  if ([v4 containsValueForKey:@"productRating"])
  {
    [v4 decodeFloatForKey:@"productRating"];
    int v7 = v6;
    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"productRatingBadge"];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"productDescription"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LODWORD(v12) = v7;
    self =  -[ASCLockupFeatureAd initWithEditorsChoice:productRating:productRatingBadge:productDescription:]( self,  "initWithEditorsChoice:productRating:productRatingBadge:productDescription:",  v5,  v9,  v11,  v12);

    v13 = self;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000E1130();
    }
    v13 = 0LL;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ASCLockupFeatureAd isEditorsChoice](self, "isEditorsChoice"),  @"isEditorsChoice");
  -[ASCLockupFeatureAd productRating](self, "productRating");
  objc_msgSend(v4, "encodeFloat:forKey:", @"productRating");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureAd productRatingBadge](self, "productRatingBadge"));
  [v4 encodeObject:v5 forKey:@"productRatingBadge"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureAd productDescription](self, "productDescription"));
  [v4 encodeObject:v6 forKey:@"productDescription"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCLockupFeatureAd isEditorsChoice](self, "isEditorsChoice"));
  -[ASCLockupFeatureAd productRating](self, "productRating");
  -[ASCHasher combineDouble:](v3, "combineDouble:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureAd productRatingBadge](self, "productRatingBadge"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureAd productDescription](self, "productDescription"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  unint64_t v7 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  float v4 = (ASCLockupFeatureAd *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupFeatureAd);
    id v6 = v4;
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

    id v10 = v8;

    if (!v10
      || (unsigned int v11 = -[ASCLockupFeatureAd isEditorsChoice](self, "isEditorsChoice"),
          v11 != -[ASCLockupFeatureAd isEditorsChoice](v10, "isEditorsChoice"))
      || (-[ASCLockupFeatureAd productRating](self, "productRating"),
          float v13 = v12,
          -[ASCLockupFeatureAd productRating](v10, "productRating"),
          v13 != v14))
    {
      unsigned __int8 v9 = 0;
LABEL_18:

      goto LABEL_19;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureAd productRatingBadge](self, "productRatingBadge"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureAd productRatingBadge](v10, "productRatingBadge"));
    v17 = (void *)v16;
    if (v15 && v16)
    {
    }

    else if (v15 == (void *)v16)
    {
LABEL_14:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureAd productDescription](self, "productDescription"));
      uint64_t v19 = objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureAd productDescription](v10, "productDescription"));
      v20 = (void *)v19;
      if (v18 && v19) {
        unsigned __int8 v9 = [v18 isEqual:v19];
      }
      else {
        unsigned __int8 v9 = v18 == (void *)v19;
      }

      goto LABEL_24;
    }

    unsigned __int8 v9 = 0;
LABEL_24:

    goto LABEL_18;
  }

  unsigned __int8 v9 = 1;
LABEL_19:

  return v9;
}

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCLockupFeatureAd isEditorsChoice](self, "isEditorsChoice"),  @"isEditorsChoice");
  -[ASCLockupFeatureAd productRating](self, "productRating");
  -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", @"productRating", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureAd productRatingBadge](self, "productRatingBadge"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"productRatingBadge");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupFeatureAd productDescription](self, "productDescription"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"productDescription");

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v7;
}

- (BOOL)isEditorsChoice
{
  return self->_isEditorsChoice;
}

- (float)productRating
{
  return self->_productRating;
}

- (NSString)productRatingBadge
{
  return self->_productRatingBadge;
}

- (NSString)productDescription
{
  return self->_productDescription;
}

- (void).cxx_destruct
{
}

@end