@interface NIHeading
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NIHeading)initWithCoder:(id)a3;
- (NIHeading)initWithTimestamp:(id)a3 trueHeading:(double)a4 magneticHeading:(double)a5 headingAccuracy:(double)a6;
- (NSDate)timestamp;
- (double)headingAccuracy;
- (double)magneticHeading;
- (double)trueHeading;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHeadingAccuracy:(double)a3;
- (void)setMagneticHeading:(double)a3;
- (void)setTimestamp:(id)a3;
- (void)setTrueHeading:(double)a3;
@end

@implementation NIHeading

- (NIHeading)initWithTimestamp:(id)a3 trueHeading:(double)a4 magneticHeading:(double)a5 headingAccuracy:(double)a6
{
  id v10 = a3;
  if (!v10) {
    __assert_rtn( "-[NIHeading initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:]",  "NILocation.mm",  235,  "timestamp");
  }
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NIHeading;
  v11 = -[NIHeading init](&v15, "init");
  if (v11)
  {
    v12 = (NSDate *)[v10 copy];
    timestamp = v11->_timestamp;
    v11->_timestamp = v12;

    v11->_trueHeading = a4;
    v11->_magneticHeading = a5;
    v11->_headingAccuracy = a6;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NIHeading initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:]( +[NIHeading allocWithZone:](&OBJC_CLASS___NIHeading, "allocWithZone:", a3),  "initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:",  self->_timestamp,  self->_trueHeading,  self->_magneticHeading,  self->_headingAccuracy);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v4 encodeDouble:@"trueHeading" forKey:self->_trueHeading];
  [v4 encodeDouble:@"magneticHeading" forKey:self->_magneticHeading];
  [v4 encodeDouble:@"headingAccuracy" forKey:self->_headingAccuracy];
}

- (NIHeading)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v5), @"timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8 && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate, v7), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
  {
    [v4 decodeDoubleForKey:@"trueHeading"];
    double v11 = v10;
    [v4 decodeDoubleForKey:@"magneticHeading"];
    double v13 = v12;
    [v4 decodeDoubleForKey:@"headingAccuracy"];
    objc_super v15 = -[NIHeading initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:]( objc_alloc(&OBJC_CLASS___NIHeading),  "initWithTimestamp:trueHeading:magneticHeading:headingAccuracy:",  v8,  v11,  v13,  v14);
  }

  else
  {
    objc_super v15 = 0LL;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v7 = (NIHeading *)v4;
    v8 = v7;
    if (v7 == self)
    {
      BOOL v22 = 1;
LABEL_17:

      goto LABEL_18;
    }

    timestamp = self->_timestamp;
    if (!timestamp)
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIHeading timestamp](v7, "timestamp"));

      if (!v10)
      {
        unsigned __int8 v12 = 1;
        goto LABEL_7;
      }

      timestamp = self->_timestamp;
    }

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIHeading timestamp](v8, "timestamp"));
    unsigned __int8 v12 = -[NSDate isEqual:](timestamp, "isEqual:", v11);

LABEL_7:
    double trueHeading = self->_trueHeading;
    -[NIHeading trueHeading](v8, "trueHeading");
    double v15 = v14;
    double magneticHeading = self->_magneticHeading;
    -[NIHeading magneticHeading](v8, "magneticHeading");
    double v18 = v17;
    double headingAccuracy = self->_headingAccuracy;
    -[NIHeading headingAccuracy](v8, "headingAccuracy");
    if (trueHeading == v15) {
      unsigned __int8 v21 = v12;
    }
    else {
      unsigned __int8 v21 = 0;
    }
    if (magneticHeading != v18) {
      unsigned __int8 v21 = 0;
    }
    if (headingAccuracy == v20) {
      BOOL v22 = v21;
    }
    else {
      BOOL v22 = 0;
    }
    goto LABEL_17;
  }

  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  timestamp = self->_timestamp;
  if (timestamp) {
    unint64_t v4 = (unint64_t)-[NSDate hash](timestamp, "hash");
  }
  else {
    unint64_t v4 = 0LL;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_trueHeading));
  unint64_t v6 = (unint64_t)[v5 hash];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_magneticHeading));
  unint64_t v8 = (unint64_t)[v7 hash];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_headingAccuracy));
  unint64_t v10 = v6 ^ v4 ^ v8 ^ (unint64_t)[v9 hash];

  return v10;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  unint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIHeading descriptionInternal](self, "descriptionInternal"));
  uint64_t v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1fdeg",  *(void *)&self->_trueHeading));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1fdeg",  *(void *)&self->_magneticHeading));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.1fdeg",  *(void *)&self->_headingAccuracy));
    unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Time: %@. TrueHeading: %@. MagHeading: %@. HeadingAcc: %@",  self->_timestamp,  v3,  v4,  v5));
  }

  else
  {
    unint64_t v6 = @"***";
  }

  return v6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)trueHeading
{
  return self->_trueHeading;
}

- (void)setTrueHeading:(double)a3
{
  self->_double trueHeading = a3;
}

- (double)magneticHeading
{
  return self->_magneticHeading;
}

- (void)setMagneticHeading:(double)a3
{
  self->_double magneticHeading = a3;
}

- (double)headingAccuracy
{
  return self->_headingAccuracy;
}

- (void)setHeadingAccuracy:(double)a3
{
  self->_double headingAccuracy = a3;
}

- (void).cxx_destruct
{
}

@end