@interface GEOAPRRLogQueueElem
- (BOOL)isEqual:(id)a3;
- (GEOAPRRLogQueueElem)initWithData:(id)a3 createTime:(id)a4;
- (NSData)rrLogData;
- (id)copy;
- (unint64_t)hash;
@end

@implementation GEOAPRRLogQueueElem

- (GEOAPRRLogQueueElem)initWithData:(id)a3 createTime:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GEOAPRRLogQueueElem;
  v9 = -[GEOAPQueueElem init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->super._createTime, a4);
    objc_storeStrong((id *)&v10->_rrLogData, a3);
  }

  return v10;
}

- (id)copy
{
  return -[GEOAPRRLogQueueElem initWithData:createTime:]( objc_alloc(&OBJC_CLASS___GEOAPRRLogQueueElem),  "initWithData:createTime:",  self->_rrLogData,  self->super._createTime);
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPQueueElem createTime](self, "createTime"));
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPRRLogQueueElem rrLogData](self, "rrLogData"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 createTime]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPQueueElem createTime](self, "createTime"));
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    double v11 = -v10;
    if (v10 >= 0.0) {
      double v11 = v10;
    }
    if (v11 >= 1.0)
    {
      char v14 = 0;
    }

    else
    {
      rrLogData = self->_rrLogData;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v6 rrLogData]);
      LOBYTE(rrLogData) = -[NSData isEqual:](rrLogData, "isEqual:", v13);

      char v14 = rrLogData ^ 1;
    }
  }

  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSData)rrLogData
{
  return self->_rrLogData;
}

- (void).cxx_destruct
{
}

@end