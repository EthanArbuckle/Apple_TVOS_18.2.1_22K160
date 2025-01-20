@interface GTMTLReplayActivityHarvestResourceObject
- (GTMTLReplayActivityHarvestResourceObject)initWithAttributes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (void)outputToLog:(id)a3;
@end

@implementation GTMTLReplayActivityHarvestResourceObject

- (GTMTLReplayActivityHarvestResourceObject)initWithAttributes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GTMTLReplayActivityHarvestResourceObject;
  v6 = -[GTMTLReplayActivity initWithType:](&v9, "initWithType:", @"harvestResourceObject");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attributes, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GTMTLReplayActivityHarvestResourceObject;
  v4 = -[GTMTLReplayActivity copyWithZone:](&v7, "copyWithZone:", a3);
  id v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 5, self->_attributes);
  }
  return v5;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", @"type"));
  if (!v3)
  {
    id v5 = @"a";
    goto LABEL_9;
  }

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2);
  id v5 = @"a";
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
LABEL_9:
    v8 = @"resource";
    goto LABEL_19;
  }

  v6 = (int *)[v3 unsignedLongLongValue];
  if ((uint64_t)v6 <= 21)
  {
    if (v6 == (int *)((char *)&dword_0 + 1))
    {
      objc_super v7 = "Texture";
      goto LABEL_17;
    }

    if (v6 == (int *)((char *)&dword_0 + 2))
    {
      objc_super v7 = "Buffer";
      goto LABEL_17;
    }
  }

  else
  {
    if (v6 == (int *)((char *)&dword_14 + 2))
    {
      objc_super v7 = "Threadgroup buffer";
      goto LABEL_17;
    }

    if (v6 == &dword_18)
    {
      objc_super v7 = "Indirect command buffer";
      goto LABEL_17;
    }

    if (v6 == (int *)((char *)&stru_20.cmdsize + 3))
    {
      objc_super v7 = "Rasterization rate map";
      goto LABEL_17;
    }
  }

  objc_super v7 = "Resource";
LABEL_17:
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
  if (v6 == &dword_18) {
    id v5 = @"an";
  }
LABEL_19:
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Harvesting %@ %@",  v5,  v8));

  return v9;
}

- (id)jsonObject
{
  activityType = self->super._activityType;
  v9[0] = @"activityType";
  v9[1] = @"attributes";
  attributes = self->_attributes;
  v10[0] = activityType;
  v10[1] = attributes;
  v9[2] = @"activityStartTime";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&time_scale * (double)self->super._activityStartTime));
  v10[2] = v5;
  v9[3] = @"activityEndTime";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&time_scale * (double)self->super._activityEndTime));
  v10[3] = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));

  return v7;
}

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    attributes = self->_attributes;
    int v7 = 138543618;
    v8 = activityType;
    __int16 v9 = 2114;
    v10 = attributes;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%{public}@", (uint8_t *)&v7, 0x16u);
  }

- (void).cxx_destruct
{
}

@end