@interface GEOAPDailyCountsQueueElem
- (BOOL)isEqual:(id)a3;
- (GEOAPDailyCountsQueueElem)initWithType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 createTime:(id)a7;
- (NSNumber)usageBool;
- (NSString)appId;
- (NSString)usageString;
- (id)copy;
- (int)countType;
- (unint64_t)hash;
@end

@implementation GEOAPDailyCountsQueueElem

- (GEOAPDailyCountsQueueElem)initWithType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 createTime:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___GEOAPDailyCountsQueueElem;
  v17 = -[GEOAPQueueElem init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->super._createTime, a7);
    v18->_countType = a3;
    objc_storeStrong((id *)&v18->_usageString, a4);
    objc_storeStrong((id *)&v18->_usageBool, a5);
    objc_storeStrong((id *)&v18->_appId, a6);
  }

  return v18;
}

- (id)copy
{
  return -[GEOAPDailyCountsQueueElem initWithType:usageString:usageBool:appId:createTime:]( objc_alloc(&OBJC_CLASS___GEOAPDailyCountsQueueElem),  "initWithType:usageString:usageBool:appId:createTime:",  self->_countType,  self->_usageString,  self->_usageBool,  self->_appId,  self->super._createTime);
}

- (unint64_t)hash
{
  uint64_t countType = self->_countType;
  unint64_t v4 = -[NSString hash](self->_usageString, "hash") ^ countType;
  unint64_t v5 = (unint64_t)-[NSNumber hash](self->_usageBool, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_appId, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPDailyCountsQueueElem usageString](self, "usageString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 usageString]);
    char v9 = (v7 != 0LL) ^ (v8 != 0LL);

    if ((v9 & 1) != 0) {
      goto LABEL_18;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPDailyCountsQueueElem usageBool](self, "usageBool"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 usageBool]);
    char v12 = (v10 != 0LL) ^ (v11 != 0LL);

    if ((v12 & 1) != 0) {
      goto LABEL_18;
    }
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[GEOAPDailyCountsQueueElem usageString](self, "usageString"));
    if (v13)
    {
      id v14 = (void *)v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 usageString]);

      if (v15)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPDailyCountsQueueElem usageString](self, "usageString"));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v6 usageString]);
        unsigned int v18 = [v16 isEqualToString:v17];

        if (!v18) {
          goto LABEL_18;
        }
      }
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[GEOAPDailyCountsQueueElem usageBool](self, "usageBool"));
    if (v19)
    {
      objc_super v20 = (void *)v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue([v6 usageBool]);

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPDailyCountsQueueElem usageBool](self, "usageBool"));
        unsigned int v23 = [v22 BOOLValue];
        v24 = (void *)objc_claimAutoreleasedReturnValue([v6 usageBool]);
        unsigned int v25 = [v24 BOOLValue];

        if (v23 != v25) {
          goto LABEL_18;
        }
      }
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue([v6 createTime]);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPQueueElem createTime](self, "createTime"));
    [v26 timeIntervalSinceDate:v27];
    double v29 = v28;

    LODWORD(v26) = -[GEOAPDailyCountsQueueElem countType](self, "countType");
    if ((_DWORD)v26 != [v6 countType])
    {
LABEL_18:
      BOOL v33 = 0;
    }

    else
    {
      if (v29 < 0.0) {
        double v29 = -v29;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAPDailyCountsQueueElem appId](self, "appId"));
      v31 = (void *)objc_claimAutoreleasedReturnValue([v6 appId]);
      unsigned __int8 v32 = [v30 isEqualToString:v31];
      if (v29 < 1.0) {
        BOOL v33 = v32;
      }
      else {
        BOOL v33 = 0;
      }
    }
  }

  else
  {
    BOOL v33 = 0;
  }

  return v33;
}

- (int)countType
{
  return self->_countType;
}

- (NSString)usageString
{
  return self->_usageString;
}

- (NSNumber)usageBool
{
  return self->_usageBool;
}

- (NSString)appId
{
  return self->_appId;
}

- (void).cxx_destruct
{
}

@end