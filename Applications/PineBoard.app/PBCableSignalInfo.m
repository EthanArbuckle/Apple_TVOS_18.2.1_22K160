@interface PBCableSignalInfo
+ (BOOL)supportsSecureCoding;
+ (id)currentInfoWithLastCableCheckTime:(double)a3;
+ (int)_linkQuality;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (PBCableSignalInfo)initWithCoder:(id)a3;
- (PBCableSignalInfo)initWithDate:(id)a3 cableCheckTime:(double)a4 linkQuality:(int)a5;
- (double)cableCheckTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)linkQuality;
- (int64_t)cableStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLinkQuality:(int)a3;
@end

@implementation PBCableSignalInfo

+ (int)_linkQuality
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  int v3 = [v2 readCableScoreOverride];

  if (v3 > 74)
  {
    if (v3 == 75 || v3 == 100) {
      return v3;
    }
    if (v3 == 0x7FFFFFFF)
    {
LABEL_15:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
      int v3 = [v7 linkQuality];

      return v3;
    }

+ (id)currentInfoWithLastCableCheckTime:(double)a3
{
  id v5 = objc_alloc(&OBJC_CLASS___PBCableSignalInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v7 = -[PBCableSignalInfo initWithDate:cableCheckTime:linkQuality:]( v5,  "initWithDate:cableCheckTime:linkQuality:",  v6,  [a1 _linkQuality],  a3);

  return v7;
}

- (PBCableSignalInfo)initWithDate:(id)a3 cableCheckTime:(double)a4 linkQuality:(int)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBCableSignalInfo;
  v9 = -[PBCableSignalInfo init](&v13, "init");
  if (v9)
  {
    v10 = (NSDate *)[v8 copy];
    date = v9->_date;
    v9->_date = v10;

    v9->_cableCheckTime = a4;
    v9->_linkQuality = a5;
  }

  return v9;
}

- (int64_t)cableStatus
{
  int v2 = -[PBCableSignalInfo linkQuality](self, "linkQuality");
  int64_t result = 2LL;
  if (v2 <= 24)
  {
    if (v2 == -2) {
      return 0LL;
    }
    if (v2 != -1)
    {
      if (!v2) {
        return result;
      }
      return 4LL;
    }

    return 3LL;
  }

  else
  {
    if (v2 > 74)
    {
      if (v2 == 100 || v2 == 75) {
        return 1LL;
      }
      return 4LL;
    }

    if (v2 != 25 && v2 != 50) {
      return 4LL;
    }
  }

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBCableSignalInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBCableSignalInfo;
  v6 = -[PBCableSignalInfo init](&v13, "init");
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___NSDate, v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (PBCableSignalInfo *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClass:v8 forKey:@"date"]);

  if (v9)
  {
    date = v6->_date;
    v6->_date = (NSDate *)v9;

    [v4 decodeDoubleForKey:@"cableCheckTime"];
    v6->_cableCheckTime = v11;
    v6->_linkQuality = [v4 decodeIntForKey:@"linkQuality"];
LABEL_4:
    v9 = v6;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBCableSignalInfo date](self, "date"));
  [v4 encodeObject:v5 forKey:@"date"];

  -[PBCableSignalInfo cableCheckTime](self, "cableCheckTime");
  objc_msgSend(v4, "encodeDouble:forKey:", @"cableCheckTime");
  objc_msgSend(v4, "encodeInt:forKey:", -[PBCableSignalInfo linkQuality](self, "linkQuality"), @"linkQuality");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___PBCableSignalInfo);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBCableSignalInfo date](self, "date"));
  -[PBCableSignalInfo cableCheckTime](self, "cableCheckTime");
  uint64_t v7 = -[PBCableSignalInfo initWithDate:cableCheckTime:linkQuality:]( v4,  "initWithDate:cableCheckTime:linkQuality:",  v5,  -[PBCableSignalInfo linkQuality](self, "linkQuality"),  v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___PBCableSignalInfo, v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v7);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBCableSignalInfo date](self, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 date]);
  unsigned int v11 = [v9 isEqual:v10];

  if (!v11) {
    goto LABEL_5;
  }
  -[PBCableSignalInfo cableCheckTime](self, "cableCheckTime");
  double v13 = v12;
  [v4 cableCheckTime];
  if (v13 == v14)
  {
    unsigned int v15 = -[PBCableSignalInfo linkQuality](self, "linkQuality");
    BOOL v16 = v15 == [v4 linkQuality];
  }

  else
  {
LABEL_5:
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCableSignalInfo date](self, "date"));
  unint64_t v4 = (unint64_t)[v3 hash];
  -[PBCableSignalInfo cableCheckTime](self, "cableCheckTime");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  unint64_t v6 = (unint64_t)[v5 hash];
  unint64_t v7 = v6 ^ v4 ^ -[PBCableSignalInfo linkQuality](self, "linkQuality");

  return v7;
}

- (id)description
{
  int v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateStyle:](v3, "setDateStyle:", 2LL);
  -[NSDateFormatter setTimeStyle:](v3, "setTimeStyle:", 2LL);
  unint64_t v4 = objc_alloc(&OBJC_CLASS___NSString);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBCableSignalInfo;
  id v5 = -[PBCableSignalInfo description](&v14, "description");
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = -[PBCableSignalInfo linkQuality](self, "linkQuality");
  -[PBCableSignalInfo cableCheckTime](self, "cableCheckTime");
  uint64_t v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBCableSignalInfo date](self, "date"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:", v10));
  double v12 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ linkQuality: %i, cableCheckTime: %.0f, date: %@",  v6,  v7,  v9,  v11);

  return v12;
}

- (NSDate)date
{
  return self->_date;
}

- (double)cableCheckTime
{
  return self->_cableCheckTime;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (void)setLinkQuality:(int)a3
{
  self->_linkQuality = a3;
}

- (void).cxx_destruct
{
}

@end