@interface ACCMemUsageStatInfo
- (ACCMemUsageStatInfo)init;
- (ACCMemUsageStatInfo)initWithName:(id)a3;
- (ACCMemUsageStatInfo)initWithName:(id)a3 andInfo:(id)a4;
- (ACCStatInfoAccumulator)physFootprintMem;
- (ACCStatInfoAccumulator)residentMem;
- (ACCStatInfoAccumulator)virtualMem;
- (NSDate)lastUpdateTime;
- (NSDate)startTime;
- (NSString)name;
- (double)timeIntervalSinceLastUpdate;
- (double)timeIntervalSinceStart;
- (id)description;
- (void)setInfo:(id)a3;
- (void)updateResident:(unint64_t)a3 virtualValue:(unint64_t)a4 physFootprintValue:(unint64_t)a5;
@end

@implementation ACCMemUsageStatInfo

- (ACCMemUsageStatInfo)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ACCMemUsageStatInfo;
  v2 = -[ACCMemUsageStatInfo init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0LL;

    v5 = -[ACCStatInfoAccumulator initWithName:]( objc_alloc(&OBJC_CLASS___ACCStatInfoAccumulator),  "initWithName:",  @"resident");
    residentMem = v3->_residentMem;
    v3->_residentMem = v5;

    v7 = -[ACCStatInfoAccumulator initWithName:]( objc_alloc(&OBJC_CLASS___ACCStatInfoAccumulator),  "initWithName:",  @"virtual");
    virtualMem = v3->_virtualMem;
    v3->_virtualMem = v7;

    v9 = -[ACCStatInfoAccumulator initWithName:]( objc_alloc(&OBJC_CLASS___ACCStatInfoAccumulator),  "initWithName:",  @"physFootprint");
    physFootprintMem = v3->_physFootprintMem;
    v3->_physFootprintMem = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    startTime = v3->_startTime;
    v3->_startTime = (NSDate *)v11;

    lastUpdateTime = v3->_lastUpdateTime;
    v3->_lastUpdateTime = 0LL;
  }

  return v3;
}

- (ACCMemUsageStatInfo)initWithName:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___ACCMemUsageStatInfo;
  v6 = -[ACCMemUsageStatInfo init](&v24, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = objc_alloc(&OBJC_CLASS___ACCStatInfoAccumulator);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-resident", v5));
    v10 = -[ACCStatInfoAccumulator initWithName:](v8, "initWithName:", v9);
    residentMem = v7->_residentMem;
    v7->_residentMem = v10;

    v12 = objc_alloc(&OBJC_CLASS___ACCStatInfoAccumulator);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-virtual", v5));
    v14 = -[ACCStatInfoAccumulator initWithName:](v12, "initWithName:", v13);
    virtualMem = v7->_virtualMem;
    v7->_virtualMem = v14;

    v16 = objc_alloc(&OBJC_CLASS___ACCStatInfoAccumulator);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-physFootprint",  v5));
    v18 = -[ACCStatInfoAccumulator initWithName:](v16, "initWithName:", v17);
    physFootprintMem = v7->_physFootprintMem;
    v7->_physFootprintMem = v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    startTime = v7->_startTime;
    v7->_startTime = (NSDate *)v20;

    lastUpdateTime = v7->_lastUpdateTime;
    v7->_lastUpdateTime = 0LL;
  }

  return v7;
}

- (ACCMemUsageStatInfo)initWithName:(id)a3 andInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___ACCMemUsageStatInfo;
  v9 = -[ACCMemUsageStatInfo init](&v27, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    uint64_t v11 = objc_alloc(&OBJC_CLASS___ACCStatInfoAccumulator);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-resident", v7));
    v13 = -[ACCStatInfoAccumulator initWithName:](v11, "initWithName:", v12);
    residentMem = v10->_residentMem;
    v10->_residentMem = v13;

    objc_super v15 = objc_alloc(&OBJC_CLASS___ACCStatInfoAccumulator);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-virtual", v7));
    v17 = -[ACCStatInfoAccumulator initWithName:](v15, "initWithName:", v16);
    virtualMem = v10->_virtualMem;
    v10->_virtualMem = v17;

    v19 = objc_alloc(&OBJC_CLASS___ACCStatInfoAccumulator);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-physFootprint",  v7));
    v21 = -[ACCStatInfoAccumulator initWithName:](v19, "initWithName:", v20);
    physFootprintMem = v10->_physFootprintMem;
    v10->_physFootprintMem = v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    startTime = v10->_startTime;
    v10->_startTime = (NSDate *)v23;

    lastUpdateTime = v10->_lastUpdateTime;
    v10->_lastUpdateTime = 0LL;

    -[ACCMemUsageStatInfo setInfo:](v10, "setInfo:", v8);
  }

  return v10;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  name = &stru_100200A40;
  if (self->_name) {
    name = (const __CFString *)self->_name;
  }
  v22 = name;
  -[NSDate timeIntervalSince1970](self->_startTime, "timeIntervalSince1970");
  uint64_t v21 = v5;
  -[NSDate timeIntervalSince1970](self->_lastUpdateTime, "timeIntervalSince1970");
  uint64_t v20 = v6;
  [v3 timeIntervalSince1970];
  uint64_t v19 = v7;
  [v3 timeIntervalSinceDate:self->_startTime];
  uint64_t v18 = v8;
  [v3 timeIntervalSinceDate:self->_lastUpdateTime];
  uint64_t v17 = v9;
  unint64_t v16 = -[ACCStatInfoAccumulator start](self->_residentMem, "start");
  double v15 = (double)-[ACCStatInfoAccumulator start](self->_residentMem, "start") / 1000000.0;
  unint64_t v14 = -[ACCStatInfoAccumulator last](self->_residentMem, "last");
  double v13 = (double)-[ACCStatInfoAccumulator last](self->_residentMem, "last") / 1000000.0;
  unint64_t v12 = -[ACCStatInfoAccumulator max](self->_residentMem, "max");
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"  ACCMemUsageStatInfo:%@ startTime=%f, lastUpdateTime=%f, curTime=%f, sinceStart=%f, sinceLast=%f \n         resident: (start:%10llu / %8.3fM, last:%10llu / %8.3fM, max:%10llu / %8.3fM, diff:%10llu / %8.3fM, avg:%10llu / %8.3fM) \n          virtual: (start:%10llu / %8.3fM, last:%10llu / %8.3fM, max:%10llu / %8.3fM, diff:%10llu / %8.3fM, avg:%10llu / %8.3fM) \n    physFootprint: (start:%10llu / %8.3fM, last:%10llu / %8.3fM, max:%10llu / %8.3fM, diff:%10llu / %8.3fM, avg:%10llu / %8.3fM) \n",  v22,  v21,  v20,  v19,  v18,  v17,  v16,  *(void *)&v15,  v14,  *(void *)&v13,  v12,  (double)-[ACCStatInfoAccumulator max](self->_residentMem, "max") / 1000000.0,  (_BYTE *)-[ACCStatInfoAccumulator max](self->_residentMem, "max")
                  - (_BYTE *)-[ACCStatInfoAccumulator start](self->_residentMem, "start"),
                    (double)(unint64_t)((_BYTE *)-[ACCStatInfoAccumulator max](self->_residentMem, "max")
                                             - (_BYTE *)-[ACCStatInfoAccumulator start](self->_residentMem, "start"))
                  / 1000000.0,
                    -[ACCStatInfoAccumulator average](self->_residentMem, "average"),
                    (double)-[ACCStatInfoAccumulator average](self->_residentMem, "average") / 1000000.0,
                    -[ACCStatInfoAccumulator start](self->_virtualMem, "start"),
                    (double)-[ACCStatInfoAccumulator start](self->_virtualMem, "start") / 1000000.0,
                    -[ACCStatInfoAccumulator last](self->_virtualMem, "last"),
                    (double)-[ACCStatInfoAccumulator last](self->_virtualMem, "last") / 1000000.0,
                    -[ACCStatInfoAccumulator max](self->_virtualMem, "max"),
                    (double)-[ACCStatInfoAccumulator max](self->_virtualMem, "max") / 1000000.0,
                    (_BYTE *)-[ACCStatInfoAccumulator max](self->_virtualMem, "max")
                  - (_BYTE *)-[ACCStatInfoAccumulator start](self->_virtualMem, "start"),
                    (double)(unint64_t)((_BYTE *)-[ACCStatInfoAccumulator max](self->_virtualMem, "max")
                                             - (_BYTE *)-[ACCStatInfoAccumulator start](self->_virtualMem, "start"))
                  / 1000000.0,
                    -[ACCStatInfoAccumulator average](self->_virtualMem, "average"),
                    (double)-[ACCStatInfoAccumulator average](self->_virtualMem, "average") / 1000000.0,
                    -[ACCStatInfoAccumulator start](self->_physFootprintMem, "start"),
                    (double)-[ACCStatInfoAccumulator start](self->_physFootprintMem, "start") / 1000000.0,
                    -[ACCStatInfoAccumulator last](self->_physFootprintMem, "last"),
                    (double)-[ACCStatInfoAccumulator last](self->_physFootprintMem, "last") / 1000000.0,
                    -[ACCStatInfoAccumulator max](self->_physFootprintMem, "max"),
                    (double)-[ACCStatInfoAccumulator max](self->_physFootprintMem, "max") / 1000000.0,
                    (_BYTE *)-[ACCStatInfoAccumulator max](self->_physFootprintMem, "max")
                  - (_BYTE *)-[ACCStatInfoAccumulator start](self->_physFootprintMem, "start"),
                    (double)(unint64_t)((_BYTE *)-[ACCStatInfoAccumulator max](self->_physFootprintMem, "max")
                                             - (_BYTE *)-[ACCStatInfoAccumulator start]( self->_physFootprintMem,  "start"))
                  / 1000000.0,
                    -[ACCStatInfoAccumulator average](self->_physFootprintMem, "average"),
                    (double)-[ACCStatInfoAccumulator average](self->_physFootprintMem, "average") / 1000000.0));

  return v10;
}

- (void)setInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v5;

  -[ACCStatInfoAccumulator reset](self->_residentMem, "reset");
  residentMem = self->_residentMem;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 residentMem]);
  -[ACCStatInfoAccumulator set:](residentMem, "set:", v8);

  -[ACCStatInfoAccumulator reset](self->_virtualMem, "reset");
  virtualMem = self->_virtualMem;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 virtualMem]);
  -[ACCStatInfoAccumulator set:](virtualMem, "set:", v10);

  -[ACCStatInfoAccumulator reset](self->_physFootprintMem, "reset");
  physFootprintMem = self->_physFootprintMem;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v4 physFootprintMem]);

  -[ACCStatInfoAccumulator set:](physFootprintMem, "set:", v12);
}

- (void)updateResident:(unint64_t)a3 virtualValue:(unint64_t)a4 physFootprintValue:(unint64_t)a5
{
  uint64_t v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v9;

  -[ACCStatInfoAccumulator add:](self->_residentMem, "add:", a3);
  -[ACCStatInfoAccumulator add:](self->_virtualMem, "add:", a4);
  -[ACCStatInfoAccumulator add:](self->_physFootprintMem, "add:", a5);
}

- (double)timeIntervalSinceStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 timeIntervalSinceDate:self->_startTime];
  double v5 = v4;

  return v5;
}

- (double)timeIntervalSinceLastUpdate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 timeIntervalSinceDate:self->_lastUpdateTime];
  double v5 = v4;

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (ACCStatInfoAccumulator)residentMem
{
  return self->_residentMem;
}

- (ACCStatInfoAccumulator)virtualMem
{
  return self->_virtualMem;
}

- (ACCStatInfoAccumulator)physFootprintMem
{
  return self->_physFootprintMem;
}

- (void).cxx_destruct
{
}

@end