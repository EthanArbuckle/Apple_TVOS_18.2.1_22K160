@interface StatsMagezine
- (BOOL)doesStatIdExistOnDevice:(int64_t)a3 timeAgo:(unsigned int)a4;
- (BOOL)doesStatIdExistOnDeviceForArr:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 timeAgo:(unsigned int)a6;
- (CarryLog_NANDDriver)nandDriver;
- (NSMutableDictionary)statsDictDict;
- (StatsMagezine)initWithNandDriver:(id)a3;
- (float)_getStatsVal:(int64_t)a3 :(int64_t)a4;
- (float)_getStatsVal:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 :(int64_t)a6;
- (float)getStatsDelta:(int64_t)a3 :(unsigned int)a4;
- (float)getStatsDeltaForArr:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 :(unsigned int)a6;
- (void)_lazyLoadStatsDict:(unsigned int)a3;
- (void)setNandDriver:(id)a3;
- (void)setStatsDictDict:(id)a3;
@end

@implementation StatsMagezine

- (StatsMagezine)initWithNandDriver:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___StatsMagezine;
  v6 = -[StatsMagezine init](&v11, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    statsDictDict = v6->_statsDictDict;
    v6->_statsDictDict = v7;

    objc_storeStrong((id *)&v6->_nandDriver, a3);
    v9 = v6;
  }

  return v6;
}

- (void)_lazyLoadStatsDict:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);

  if (!v7)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[StatsMagezine nandDriver](self, "nandDriver"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nandStats_get_hoursAgo:", v3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    [v9 setObject:v8 forKeyedSubscript:v10];
  }

- (float)_getStatsVal:(int64_t)a3 :(int64_t)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
  float v13 = 0.0;
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    [v11 floatValue];
    float v13 = v14;
  }

  return v13;
}

- (float)_getStatsVal:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 :(int64_t)a6
{
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
  float v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);
  float v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);

  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
  char isKindOfClass = objc_opt_isKindOfClass(v15, v16);
  float v18 = 0.0;
  if (a4 <= a5 && (isKindOfClass & 1) != 0)
  {
    v19 = 0LL;
    while (1)
    {
      v20 = v19;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:a4]);

      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v19, v21) & 1) == 0) {
        break;
      }
      [v19 floatValue];
      float v18 = v18 + v22;
      if (++a4 > a5) {
        goto LABEL_8;
      }
    }

    float v18 = 0.0;
LABEL_8:
  }

  return v18;
}

- (float)getStatsDelta:(int64_t)a3 :(unsigned int)a4
{
  float v8 = v7;
  if (a4)
  {
    -[StatsMagezine _getStatsVal::](self, "_getStatsVal::", a3, a4);
    return v8 - v9;
  }

  return v8;
}

- (float)getStatsDeltaForArr:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 :(unsigned int)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  -[StatsMagezine _getStatsVal:startIdx:endIdx::]( self,  "_getStatsVal:startIdx:endIdx::",  a3,  *(void *)&a4,  *(void *)&a5,  0LL);
  float v12 = v11;
  if (a6)
  {
    -[StatsMagezine _getStatsVal:startIdx:endIdx::](self, "_getStatsVal:startIdx:endIdx::", a3, v8, v7, a6);
    return v12 - v13;
  }

  return v12;
}

- (BOOL)doesStatIdExistOnDevice:(int64_t)a3 timeAgo:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  -[StatsMagezine _lazyLoadStatsDict:](self, "_lazyLoadStatsDict:", *(void *)&a4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  float v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  float v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
  char isKindOfClass = objc_opt_isKindOfClass(v11, v12);

  return isKindOfClass & 1;
}

- (BOOL)doesStatIdExistOnDeviceForArr:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 timeAgo:(unsigned int)a6
{
  if (a4 <= a5)
  {
    uint64_t v8 = *(void *)&a6;
    -[StatsMagezine _lazyLoadStatsDict:](self, "_lazyLoadStatsDict:", *(void *)&a6);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[StatsMagezine statsDictDict](self, "statsDictDict"));
    float v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
    float v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);

    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
    BOOL v6 = (objc_opt_isKindOfClass(v7, v16) & 1) != 0 && (unint64_t)[v7 count] > a5;
  }

  else
  {
    BOOL v6 = 0;
    uint64_t v7 = 0LL;
  }

  return v6;
}

- (NSMutableDictionary)statsDictDict
{
  return self->_statsDictDict;
}

- (void)setStatsDictDict:(id)a3
{
}

- (CarryLog_NANDDriver)nandDriver
{
  return self->_nandDriver;
}

- (void)setNandDriver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end