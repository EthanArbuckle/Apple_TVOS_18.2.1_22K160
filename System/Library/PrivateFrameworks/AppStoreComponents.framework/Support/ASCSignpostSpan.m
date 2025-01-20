@interface ASCSignpostSpan
+ (BOOL)supportsSecureCoding;
- (ASCSignpostSpan)init;
- (ASCSignpostSpan)initWithCoder:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateInterval)dateRange;
- (NSMutableSet)mutableSupplementaryTags;
- (NSSet)supplementaryTags;
- (id)description;
- (unint64_t)primaryTag;
- (void)addSupplementaryTag:(unint64_t)a3;
- (void)beginEmitting;
- (void)encodeWithCoder:(id)a3;
- (void)endEmitting;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation ASCSignpostSpan

- (ASCSignpostSpan)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ASCSignpostSpan;
  v3 = -[ASCSignpostSpan init](&v7, "init");
  if (v3)
  {
    v3->_primaryTag = ASCSignpostTagUnique();
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    mutableSupplementaryTags = v3->_mutableSupplementaryTags;
    v3->_mutableSupplementaryTags = v4;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCSignpostSpan)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  objc_super v7 = -[NSSet initWithObjects:](v5, "initWithObjects:", v6, objc_opt_class(&OBJC_CLASS___NSSet), 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"supplementaryTags"]);
  if (v8)
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___ASCSignpostSpan;
    v9 = -[ASCSignpostSpan init](&v20, "init");
    if (v9)
    {
      v9->_primaryTag = (unint64_t)[v4 decodeInt64ForKey:@"primaryTag"];
      v10 = (NSMutableSet *)[v8 mutableCopy];
      mutableSupplementaryTags = v9->_mutableSupplementaryTags;
      v9->_mutableSupplementaryTags = v10;

      id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"startDate"];
      uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
      startDate = v9->_startDate;
      v9->_startDate = (NSDate *)v13;

      id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"endDate"];
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
      endDate = v9->_endDate;
      v9->_endDate = (NSDate *)v16;
    }

    self = v9;
    v18 = self;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000E1A30();
    }
    v18 = 0LL;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[ASCSignpostSpan primaryTag](self, "primaryTag"), @"primaryTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan supplementaryTags](self, "supplementaryTags"));
  [v4 encodeObject:v5 forKey:@"supplementaryTags"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan startDate](self, "startDate"));
  [v4 encodeObject:v6 forKey:@"startDate"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan endDate](self, "endDate"));
  [v4 encodeObject:v7 forKey:@"endDate"];
}

- (NSSet)supplementaryTags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan mutableSupplementaryTags](self, "mutableSupplementaryTags"));
  id v3 = [v2 copy];

  return (NSSet *)v3;
}

- (NSDateInterval)dateRange
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan startDate](self, "startDate"));
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan endDate](self, "endDate"));
    if (!v5)
    {
      id v12 = 0LL;
      goto LABEL_7;
    }

    uint64_t v6 = (void *)v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan endDate](self, "endDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan startDate](self, "startDate"));
    id v9 = [v7 compare:v8];

    if (v9 != (id)-1LL)
    {
      v10 = objc_alloc(&OBJC_CLASS___NSDateInterval);
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan startDate](self, "startDate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan endDate](self, "endDate"));
      id v12 = -[NSDateInterval initWithStartDate:endDate:](v10, "initWithStartDate:endDate:", v4, v11);

LABEL_7:
      return v12;
    }
  }

  id v12 = 0LL;
  return v12;
}

- (void)addSupplementaryTag:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan mutableSupplementaryTags](self, "mutableSupplementaryTags"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  [v5 addObject:v4];
}

- (void)beginEmitting
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan startDate](self, "startDate"));

  if (v3)
  {
    objc_exception_throw(  -[NSException initWithName:reason:userInfo:]( objc_alloc(&OBJC_CLASS___NSException),  "initWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Signpost span has already begun",  0LL));
    -[ASCSignpostSpan endEmitting](v4, v5);
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -1.0));
    -[ASCSignpostSpan setStartDate:](self, "setStartDate:", v6);
  }

- (void)endEmitting
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan startDate](self, "startDate"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan endDate](self, "endDate"));

    if (!v4)
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 1.0));
      -[ASCSignpostSpan setEndDate:](self, "setEndDate:", v10);

      return;
    }

    SEL v5 = objc_alloc(&OBJC_CLASS___NSException);
    NSExceptionName v6 = NSInternalInconsistencyException;
    id v7 = @"Signpost span has already ended";
  }

  else
  {
    SEL v5 = objc_alloc(&OBJC_CLASS___NSException);
    NSExceptionName v6 = NSInternalInconsistencyException;
    id v7 = @"Cannot end signpost span which has not begun";
  }

  objc_exception_throw(-[NSException initWithName:reason:userInfo:](v5, "initWithName:reason:userInfo:", v6, v7, 0LL));
  -[ASCSignpostSpan description](v8, v9);
}

- (id)description
{
  uint64_t v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  -[ASCDescriber addUInt64:withName:]( v3,  "addUInt64:withName:",  -[ASCSignpostSpan primaryTag](self, "primaryTag"),  @"primaryTag");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan mutableSupplementaryTags](self, "mutableSupplementaryTags"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"supplementaryTags");

  SEL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan startDate](self, "startDate"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"startDate");

  NSExceptionName v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCSignpostSpan endDate](self, "endDate"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"endDate");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v7;
}

- (unint64_t)primaryTag
{
  return self->_primaryTag;
}

- (NSMutableSet)mutableSupplementaryTags
{
  return self->_mutableSupplementaryTags;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end