@interface HTDisplayParser
+ ($2825F4736939C4A6D3AD43837233062D)displayStateBeforeOrAtTime:(unint64_t)a3 timestamps:(id)a4 states:(id)a5;
+ (DisplayStateChangeEvent)displayStateBeforeHangStartTimestamp:(unint64_t)a3 displayTimestamps:(id)a4 displayStates:(id)a5;
+ (id)displayEventStatesFromDisplayInfo:(id)a3;
+ (id)displayEventTimestampsFromDisplayInfo:(id)a3;
+ (id)displayInfoForSpindump:(id)a3 startAbsoluteTime:(unint64_t)a4 endAbsoluteTime:(unint64_t)a5;
+ (id)displayOnIntervalsForDisplayTimestamps:(id)a3 displayStates:(id)a4 startTimestamp:(unint64_t)a5 endTimestamp:(unint64_t)a6 startState:(id *)a7 endState:(id *)a8;
@end

@implementation HTDisplayParser

+ (id)displayEventTimestampsFromDisplayInfo:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v3 count])
  {
    unint64_t v6 = 0LL;
    *(void *)&__int128 v5 = 134217984LL;
    __int128 v14 = v5;
    do
    {
      id v7 = sub_1000199EC();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v6]);
        id v11 = [v10 unsignedLongLongValue];
        *(_DWORD *)buf = v14;
        id v16 = v11;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "display event timestamp: %llu",  buf,  0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v6]);
      -[NSMutableArray addObject:](v4, "addObject:", v9);

      v6 += 2LL;
    }

    while ((unint64_t)[v3 count] > v6);
  }

  id v12 = -[NSMutableArray copy](v4, "copy", v14);

  return v12;
}

+ (id)displayEventStatesFromDisplayInfo:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v3 count])
  {
    unint64_t v6 = 1LL;
    *(void *)&__int128 v5 = 134217984LL;
    __int128 v14 = v5;
    do
    {
      id v7 = sub_1000199EC();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v6]);
        id v11 = [v10 unsignedLongLongValue];
        *(_DWORD *)buf = v14;
        id v16 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "display event state: %llu", buf, 0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v6]);
      -[NSMutableArray addObject:](v4, "addObject:", v9);

      v6 += 2LL;
    }

    while ((unint64_t)[v3 count] >= v6);
  }

  id v12 = -[NSMutableArray copy](v4, "copy", v14);

  return v12;
}

+ ($2825F4736939C4A6D3AD43837233062D)displayStateBeforeOrAtTime:(unint64_t)a3 timestamps:(id)a4 states:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 count])
  {
    unint64_t v9 = 0LL;
    LODWORD(v10) = -1;
    LODWORD(v11) = -1;
    do
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v9]);
      id v13 = [v12 unsignedLongLongValue];

      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v9]);
      unsigned int v15 = [v14 intValue];

      else {
        uint64_t v11 = v11;
      }
      else {
        uint64_t v10 = v10;
      }
      ++v9;
    }

    while ((unint64_t)[v7 count] > v9);
    unint64_t v16 = v10 << 32;
  }

  else
  {
    unint64_t v16 = 0xFFFFFFFF00000000LL;
    uint64_t v11 = 0xFFFFFFFFLL;
  }

  return ($2825F4736939C4A6D3AD43837233062D)(v16 | v11);
}

+ (DisplayStateChangeEvent)displayStateBeforeHangStartTimestamp:(unint64_t)a3 displayTimestamps:(id)a4 displayStates:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v14 = 0LL;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x3010000000LL;
  v17 = &unk_10006F2C2;
  __int128 v18 = xmmword_100038FB0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000EB68;
  v13[3] = &unk_1000713B0;
  v13[4] = &v14;
  v13[5] = a3;
  [v7 enumerateObjectsWithOptions:2 usingBlock:v13];
  unint64_t v9 = v15[4];
  uint64_t v10 = v15[5];
  _Block_object_dispose(&v14, 8);

  unint64_t v11 = v9;
  uint64_t v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

+ (id)displayOnIntervalsForDisplayTimestamps:(id)a3 displayStates:(id)a4 startTimestamp:(unint64_t)a5 endTimestamp:(unint64_t)a6 startState:(id *)a7 endState:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  *a7 = +[HTDisplayParser displayStateBeforeOrAtTime:timestamps:states:]( &OBJC_CLASS___HTDisplayParser,  "displayStateBeforeOrAtTime:timestamps:states:",  a5,  v13,  v14);
  *a8 = +[HTDisplayParser displayStateBeforeOrAtTime:timestamps:states:]( &OBJC_CLASS___HTDisplayParser,  "displayStateBeforeOrAtTime:timestamps:states:",  a6,  v13,  v14);
  id v15 = sub_1000199EC();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100034488();
  }

  id v17 = sub_1000199EC();
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100034420();
  }

  if (a7->var0 == -1)
  {
    id v19 = sub_1000199EC();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_1000343E0(v20);
    }

    a7->uint64_t var0 = 0;
  }

  v38 = v13;
  id v21 = [v13 mutableCopy];
  id v22 = [v14 mutableCopy];
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a5));
  [v21 setObject:v23 atIndexedSubscript:a7->var0];

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a6));
  [v21 insertObject:v24 atIndex:a8->var0 + 1];

  v25 = &off_100076418;
  int var1 = a8->var1;
  if (!var1) {
    v25 = &off_100076400;
  }
  if (var1 == 1) {
    v27 = &off_1000763E8;
  }
  else {
    v27 = v25;
  }
  [v22 insertObject:v27 atIndex:a8->var0 + 1];
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t var0 = a7->var0;
  if ((int)var0 <= a8->var0)
  {
    do
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:var0]);
      if ([v30 intValue] == 1)
      {
        uint64_t v31 = var0 + 1;
        v32 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:var0 + 1]);
        unsigned int v33 = [v32 intValue];

        if (!v33)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:var0]);
          [v28 addObject:v34];

          v35 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:var0 + 1]);
          [v28 addObject:v35];
        }
      }

      else
      {

        uint64_t v31 = var0 + 1;
      }

      BOOL v36 = var0 < a8->var0;
      uint64_t var0 = v31;
    }

    while (v36);
  }

  return v28;
}

+ (id)displayInfoForSpindump:(id)a3 startAbsoluteTime:(unint64_t)a4 endAbsoluteTime:(unint64_t)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"DisplayData"]);
  if ([v8 count])
  {
    uint64_t v44 = -1LL;
    *(void *)buf = -1LL;
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 displayEventTimestampsFromDisplayInfo:v8]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 displayEventStatesFromDisplayInfo:v8]);
    id v43 = +[HTDisplayParser displayStateBeforeHangStartTimestamp:displayTimestamps:displayStates:]( &OBJC_CLASS___HTDisplayParser,  "displayStateBeforeHangStartTimestamp:displayTimestamps:displayStates:",  a4,  v9,  v10);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[HTDisplayParser displayOnIntervalsForDisplayTimestamps:displayStates:startTimestamp:endTimestamp:startState:endState:]( &OBJC_CLASS___HTDisplayParser,  "displayOnIntervalsForDisplayTimestamps:displayStates:startTimestamp:endTimestamp:startState:endState:",  v9,  v10,  a4,  a5,  buf,  &v44));
    id v12 = [v11 mutableCopy];
    double v13 = sub_100002FAC(a4);
    double v14 = sub_100002FAC(a5);
    if ([v11 count])
    {
      unint64_t v15 = (unint64_t)v14 - (unint64_t)v13;
      id v16 = [v11 count];
      LODWORD(v17) = 0;
      if (v16 != (id)1)
      {
        unint64_t v39 = (unint64_t)v14 - (unint64_t)v13;
        v40 = v10;
        v41 = v9;
        v42 = v8;
        __int128 v18 = 0LL;
        unint64_t v19 = 0LL;
        double v20 = (double)(unint64_t)v13;
        do
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v18, v17, v39, v40, v41, v42));
          unint64_t v22 = (unint64_t)(sub_100002FAC((unint64_t)[v21 unsignedLongLongValue]) - v20);

          v23 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v18 + 1]);
          unint64_t v24 = (unint64_t)(sub_100002FAC((unint64_t)[v23 unsignedLongLongValue]) - v20);

          v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v22));
          [v12 setObject:v25 atIndexedSubscript:v18];

          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v24));
          [v12 setObject:v26 atIndexedSubscript:v18 + 1];

          unint64_t v19 = v19 - v22 + v24;
          v18 += 2;
        }

        while ((char *)[v11 count] - 1 > v18);
        *(float *)&double v17 = (float)v19;
        unint64_t v9 = v41;
        id v8 = v42;
        unint64_t v15 = v39;
        uint64_t v10 = v40;
      }

      float v27 = *(float *)&v17 / (float)v15;
    }

    else
    {
      float v27 = 0.0;
    }

    uint64_t v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)&buf[4]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v32, @"startState");

    unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", HIDWORD(v44)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v33, @"endState");

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v12,  @"displayOnIntervals");
    if (v43)
    {
      v34 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_100003000(a4 - (void)v43));
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v35,  @"secondsSinceDisplayStateBeforeHangStart");
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  &off_100076478,  @"secondsSinceDisplayStateBeforeHangStart");
    }

    *(float *)&double v36 = v27;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v36));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v37,  @"displayOnPercent");

    v46 = @"displayData";
    v47 = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
  }

  else
  {
    id v28 = sub_1000199EC();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "No display information has been logged. Are you sure you restarted after writing to defaults?",  buf,  2u);
    }

    v30 = &__NSDictionary0__struct;
  }

  return v30;
}

  ;
}

@end