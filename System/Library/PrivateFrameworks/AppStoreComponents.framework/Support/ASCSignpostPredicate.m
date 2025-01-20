@interface ASCSignpostPredicate
+ (BOOL)supportsSecureCoding;
- (ASCSignpostPredicate)init;
- (ASCSignpostPredicate)initWithCoder:(id)a3;
- (ASCSignpostPredicate)initWithSpans:(id)a3;
- (ASCSignpostPredicate)initWithTags:(id)a3 dateRanges:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSArray)dateRanges;
- (NSSet)tags;
- (id)description;
- (id)predicateByAddingDateRange:(id)a3;
- (id)predicateByAddingTag:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCSignpostPredicate

- (ASCSignpostPredicate)initWithTags:(id)a3 dateRanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ASCSignpostPredicate;
  v8 = -[ASCSignpostPredicate init](&v14, "init");
  if (v8)
  {
    v9 = (NSSet *)[v6 copy];
    tags = v8->_tags;
    v8->_tags = v9;

    v11 = (NSArray *)[v7 copy];
    dateRanges = v8->_dateRanges;
    v8->_dateRanges = v11;
  }

  return v8;
}

- (ASCSignpostPredicate)initWithSpans:(id)a3
{
  v17 = self;
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateRange", v17));
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v11 primaryTag]));
          -[NSMutableSet addObject:](v4, "addObject:", v13);

          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v11 supplementaryTags]);
          -[NSMutableSet unionSet:](v4, "unionSet:", v14);

          -[NSMutableArray addObject:](v5, "addObject:", v12);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_1000E1978(buf, (uint64_t)v11, &v23);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v8);
  }

  v15 = -[ASCSignpostPredicate initWithTags:dateRanges:](v17, "initWithTags:dateRanges:", v4, v5);
  return v15;
}

- (ASCSignpostPredicate)init
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  v4 = -[ASCSignpostPredicate initWithTags:dateRanges:](self, "initWithTags:dateRanges:", v3, &__NSArray0__struct);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCSignpostPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSSet);
  id v7 = -[NSSet initWithObjects:](v5, "initWithObjects:", v6, objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"tags"]);
  if (v8)
  {
    uint64_t v9 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    v11 = -[NSSet initWithObjects:](v9, "initWithObjects:", v10, objc_opt_class(&OBJC_CLASS___NSDateInterval), 0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"dateRanges"]);
    if (v12)
    {
      self = -[ASCSignpostPredicate initWithTags:dateRanges:](self, "initWithTags:dateRanges:", v8, v12);
      v13 = self;
    }

    else
    {
      BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v22) {
        sub_1000E19F8(v22, v23, v24, v25, v26, v27, v28, v29);
      }
      v13 = 0LL;
    }
  }

  else
  {
    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v14) {
      sub_1000E19C0(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    v13 = 0LL;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate tags](self, "tags"));
  [v4 encodeObject:v5 forKey:@"tags"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate dateRanges](self, "dateRanges"));
  [v4 encodeObject:v6 forKey:@"dateRanges"];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate tags](self, "tags"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate dateRanges](self, "dateRanges"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unint64_t v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCSignpostPredicate);
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
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate tags](self, "tags"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 tags]);
    v12 = (void *)v11;
    if (v10 && v11)
    {
    }

    else if (v10 == (void *)v11)
    {
LABEL_10:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate dateRanges](self, "dateRanges"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 dateRanges]);
      uint64_t v15 = (void *)v14;
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
  id v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate tags](self, "tags"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"tags");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate dateRanges](self, "dateRanges"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"dateRanges");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v6;
}

- (BOOL)isEmpty
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate tags](self, "tags"));
  if ([v3 count])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate dateRanges](self, "dateRanges"));
    BOOL v5 = [v4 count] == 0;
  }

  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)predicateByAddingTag:(unint64_t)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate tags](self, "tags"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 setByAddingObject:v6]);

  id v8 = objc_alloc((Class)objc_opt_class(self));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate dateRanges](self, "dateRanges"));
  id v10 = [v8 initWithTags:v7 dateRanges:v9];

  return v10;
}

- (id)predicateByAddingDateRange:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate dateRanges](self, "dateRanges"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 arrayByAddingObject:v4]);

  id v7 = objc_alloc((Class)objc_opt_class(self));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostPredicate tags](self, "tags"));
  id v9 = [v7 initWithTags:v8 dateRanges:v6];

  return v9;
}

- (NSSet)tags
{
  return self->_tags;
}

- (NSArray)dateRanges
{
  return self->_dateRanges;
}

- (void).cxx_destruct
{
}

@end