@interface CMPedometerTable
+ (id)convertToCMPedometerBins:(id)a3;
+ (id)convertToCMStrideCalibrationData:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForValueIn:(double)a3;
- (BOOL)isBin:(unint64_t)a3 sameActivityAsBin:(unint64_t)a4;
- (BOOL)isNativeValueOutAvailableInBinsFromIndex:(unint64_t)a3 withLength:(unint64_t)a4;
- (BOOL)isRunNativeValueOutAvailable;
- (BOOL)isValueInRun:(double)a3;
- (BOOL)isValueInValid:(double)a3;
- (BOOL)isWalkNativeValueOutAvailable;
- (BOOL)testMode;
- (CMPedometerTable)initWithTableName:(id)a3 valueInName:(id)a4 valueOutName:(id)a5 defaultValue:(double)a6 binBoundariesWalk:()vector<double binBoundariesRun:(std:()vector<double :(std:(BOOL)a9 :allocator<double>> *)a8 allocator<double>> *)a7 testMode:;
- (double)valueOutForValueIn:(double)a3;
- (id).cxx_construct;
- (id)binArrayToArchivedData:(id)a3;
- (id)copyBins;
- (id)defaultBins;
- (id)description;
- (unint64_t)binIndexForValueIn:(double)a3;
- (unint64_t)walkBinCount;
- (void)dealloc;
- (void)setBins:(id)a3;
- (void)updateAdjacentBin:(unint64_t)a3 withAlpha:(double)a4 valueOut:(double)a5 nativeBin:(unint64_t)a6;
- (void)updateBinsWithValueOut:(double)a3 valueIn:(double)a4 alpha:(double)a5;
- (void)updateNativeBin:(unint64_t)a3 withAlpha:(double)a4 valueOut:(double)a5;
@end

@implementation CMPedometerTable

- (CMPedometerTable)initWithTableName:(id)a3 valueInName:(id)a4 valueOutName:(id)a5 defaultValue:(double)a6 binBoundariesWalk:()vector<double binBoundariesRun:(std:()vector<double :(std:(BOOL)a9 :allocator<double>> *)a8 allocator<double>> *)a7 testMode:
{
  BOOL v9 = a9;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___CMPedometerTable;
  v16 = -[CMPedometerTable init](&v45, "init");
  if (!v16) {
    return (CMPedometerTable *)v16;
  }
  *((void *)v16 + 1) = a3;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *((double *)v16 + 4) = a6;
  v17 = (void **)(v16 + 88);
  sub_1001AC380((void **)v16 + 11, a7->__end_ - a7->__begin_ + a8->__end_ - a8->__begin_ + 1);
  unint64_t v18 = *((void *)v16 + 13);
  v19 = (char *)*((void *)v16 + 12);
  if ((unint64_t)v19 >= v18)
  {
    v21 = (char *)*v17;
    uint64_t v22 = (v19 - (_BYTE *)*v17) >> 3;
    unint64_t v23 = v22 + 1;
    uint64_t v24 = v18 - (void)v21;
    if (v24 >> 2 > v23) {
      unint64_t v23 = v24 >> 2;
    }
    else {
      unint64_t v25 = v23;
    }
    if (v25)
    {
      v26 = (char *)sub_1000071BC((uint64_t)(v16 + 104), v25);
      v21 = (char *)*((void *)v16 + 11);
      v19 = (char *)*((void *)v16 + 12);
    }

    else
    {
      v26 = 0LL;
    }

    v27 = &v26[8 * v22];
    v28 = &v26[8 * v25];
    *(void *)v27 = 0LL;
    v20 = v27 + 8;
    while (v19 != v21)
    {
      uint64_t v29 = *((void *)v19 - 1);
      v19 -= 8;
      *((void *)v27 - 1) = v29;
      v27 -= 8;
    }

    *((void *)v16 + 11) = v27;
    *((void *)v16 + 12) = v20;
    *((void *)v16 + 13) = v28;
    if (v21) {
      operator delete(v21);
    }
  }

  else
  {
    *(void *)v19 = 0LL;
    v20 = v19 + 8;
  }

  *((void *)v16 + 12) = v20;
  sub_10091EDB4(a7->__begin_, a7->__end_, (uint64_t)(v16 + 88));
  sub_10091EDB4(a8->__begin_, a8->__end_, (uint64_t)(v16 + 88));
  v16[112] = v9;
  if (v9)
  {
    id v30 = [v16 defaultBins];
  }

  else
  {
    uint64_t v31 = sub_1002F8DDC();
    *((void *)v16 + 15) = v31;
    *(void *)buf = 0LL;
    id v32 = 0LL;
    else {
      uint64_t v33 = 0LL;
    }
    if (!v33)
    {
      id v34 = [v16 defaultBins];
      id v32 = v34;
      [v16 binArrayToArchivedData:v34];
      sub_1002AB3DC(*((void *)v16 + 15));
      (*(void (**)(void))(**((void **)v16 + 15) + 944LL))(*((void *)v16 + 15));
    }

    objc_opt_class(&OBJC_CLASS___CMPedometerBin);
    uint64_t v36 = v35;
    *(void *)&double v37 = objc_opt_class(&OBJC_CLASS___NSArray).n128_u64[0];
    v39 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v36, v37, v38, 0LL);
    if (!v33) {
      goto LABEL_32;
    }
    id v30 = objc_msgSend( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v39,  v33,  0),  "mutableCopy");
  }

  id v32 = v30;
LABEL_32:
  *((void *)v16 + 16) = v32;
  if (![v32 count])
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101860DD0);
    }
    v40 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_FAULT))
    {
      id v41 = [*((id *)v16 + 1) UTF8String];
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      __int16 v47 = 2082;
      v48 = "";
      __int16 v49 = 2081;
      id v50 = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Pedometer Calibration Table Empty After Initialization, tableName:%{private, locati on:escape_only}s}",  buf,  0x1Cu);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101860DD0);
      }
    }

    v42 = (os_log_s *)qword_101934518;
    if (os_signpost_enabled((os_log_t)qword_101934518))
    {
      id v43 = [*((id *)v16 + 1) UTF8String];
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      __int16 v47 = 2082;
      v48 = "";
      __int16 v49 = 2081;
      id v50 = v43;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v42,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Pedometer Calibration Table Empty After Initialization",  "{msg%{public}.0s:Pedometer Calibration Table Empty After Initialization, tableName:%{private, locati on:escape_only}s}",  buf,  0x1Cu);
    }
  }

  return (CMPedometerTable *)v16;
}

- (id)binArrayToArchivedData:(id)a3
{
  if ((objc_opt_respondsToSelector( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:") & 1) != 0) {
    return +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", a3),  1LL,  0LL);
  }
  else {
    return 0LL;
  }
}

- (id)defaultBins
{
  v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 1);
  for (i = self->_binBoundaries.__begin_; i != self->_binBoundaries.__end_ - 1; ++i)
  {
    id v5 = objc_alloc(&OBJC_CLASS___CMPedometerBin);
    double v6 = *i;
    double v7 = i[1];
    -[NSMutableArray addObject:]( v3,  "addObject:",  [v5 initWithValueOut:0 begin:self->_defaultValue end:v6 state:v7]);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMPedometerTable;
  -[CMPedometerTable dealloc](&v3, "dealloc");
}

- (id)copyBins
{
  objc_super v3 = -[NSArray initWithArray:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:", self->_bins);
  objc_sync_exit(self);
  return v3;
}

- (double)valueOutForValueIn:(double)a3
{
  id v5 = -[CMPedometerTable copyBins](self, "copyBins");
  double defaultValue = self->_defaultValue;
  unint64_t v7 = -[CMPedometerTable binIndexForValueIn:](self, "binIndexForValueIn:", a3);
  if ([v5 count] && v7 < (unint64_t)objc_msgSend(v5, "count"))
  {
    if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:", a3))
    {
      v8 = (char *)[v5 count];
      int64_t v9 = -[CMPedometerTable walkBinCount](self, "walkBinCount");
    }

    else
    {
      v8 = -[CMPedometerTable walkBinCount](self, "walkBinCount");
      int64_t v9 = 0LL;
    }

    objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "valueOut");
    double defaultValue = v10;
    uint64_t v11 = (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "state");
    int64_t v12 = v7 - 1;
    if (v11 <= 1)
    {
      v13 = (char *)(v7 + 1);
      if (v11 != 1
        || (v12 < v9
         || (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7 - 1), "state") < 2
         || (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "upperQuartile"), v14 < a3))
        && ((uint64_t)v13 >= (uint64_t)v8
         || (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7 + 1), "state") < 2
         || (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "lowerQuartile"), v15 >= a3)))
      {
        objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "upperQuartile");
        if (v16 >= a3) {
          v13 = (char *)v7;
        }
        if ((uint64_t)v13 < (uint64_t)v8)
        {
          while ((uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v13), "state") <= 0)
          {
            if (v8 == ++v13)
            {
              v13 = v8;
              break;
            }
          }
        }

        objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "lowerQuartile");
        if (v17 < a3) {
          int64_t v12 = v7;
        }
        if (v12 >= v9)
        {
          while ((uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v12), "state") <= 0)
          {
            unint64_t v18 = (char *)(v12 - 1);
            if (v12-- <= v9) {
              goto LABEL_27;
            }
          }
        }

        unint64_t v18 = (char *)v12;
LABEL_27:
        if (v13 != v18)
        {
          int64_t v20 = v9 - 1;
          if (v13 == v8)
          {
            if (v18 != (char *)v20)
            {
              v21 = v5;
              uint64_t v22 = v18;
LABEL_33:
              objc_msgSend(objc_msgSend(v21, "objectAtIndexedSubscript:", v22), "valueOut");
              double defaultValue = v23;
            }
          }

          else
          {
            v21 = v5;
            if (v18 == (char *)v20)
            {
              uint64_t v22 = v13;
              goto LABEL_33;
            }

            uint64_t v24 = (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v18), "state");
            id v25 = [v5 objectAtIndexedSubscript:v18];
            if (v24 < 2) {
              [v25 upperQuartile];
            }
            else {
              [v25 end];
            }
            double v27 = v26;
            uint64_t v28 = (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v13), "state");
            id v29 = [v5 objectAtIndexedSubscript:v13];
            if (v28 < 2) {
              [v29 lowerQuartile];
            }
            else {
              [v29 begin];
            }
            double v31 = v30;
            objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v18), "valueOut");
            double v33 = v32;
            objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v13), "valueOut");
            double defaultValue = v33 + (a3 - v27) * (v34 - v33) / (v31 - v27);
          }
        }
      }
    }
  }

  return defaultValue;
}

- (BOOL)isNativeValueOutAvailableInBinsFromIndex:(unint64_t)a3 withLength:(unint64_t)a4
{
  id v6 = -[CMPedometerTable copyBins](self, "copyBins");
  if ([v6 count]
    && (__int128 v16 = 0u,
        __int128 v17 = 0u,
        __int128 v14 = 0u,
        __int128 v15 = 0u,
        id v7 = objc_msgSend(v6, "subarrayWithRange:", a3, a4, 0),
        (id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16]) != 0))
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if ((uint64_t)[*(id *)(*((void *)&v14 + 1) + 8 * (void)i) state] > 1)
        {
          BOOL v12 = 1;
          goto LABEL_13;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 0;
      if (v9) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v12 = 0;
  }

- (BOOL)isWalkNativeValueOutAvailable
{
  return -[CMPedometerTable isNativeValueOutAvailableInBinsFromIndex:withLength:]( self,  "isNativeValueOutAvailableInBinsFromIndex:withLength:",  -[CMPedometerTable binIndexForValueIn:](self, "binIndexForValueIn:", *self->_binBoundariesWalk.__begin_),  self->_binBoundariesWalk.__end_ - self->_binBoundariesWalk.__begin_);
}

- (BOOL)isRunNativeValueOutAvailable
{
  return -[CMPedometerTable isNativeValueOutAvailableInBinsFromIndex:withLength:]( self,  "isNativeValueOutAvailableInBinsFromIndex:withLength:",  -[CMPedometerTable binIndexForValueIn:](self, "binIndexForValueIn:", *self->_binBoundariesRun.__begin_),  self->_binBoundariesRun.__end_ - self->_binBoundariesRun.__begin_);
}

- (void)updateNativeBin:(unint64_t)a3 withAlpha:(double)a4 valueOut:(double)a5
{
  id v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:");
  [v9 valueOut];
  double v11 = a4 * a5 + v10 * (1.0 - a4);
  id v12 = objc_alloc(&OBJC_CLASS___CMPedometerBin);
  [v9 begin];
  double v14 = v13;
  [v9 end];
  double v16 = v15;
  uint64_t v17 = (uint64_t)[v9 state];
  if (v17 <= 1) {
    uint64_t v18 = 1LL;
  }
  else {
    uint64_t v18 = v17;
  }
  -[NSMutableArray setObject:atIndexedSubscript:]( self->_bins,  "setObject:atIndexedSubscript:",  [v12 initWithValueOut:v18 + 1 begin:v11 end:v14 state:v16],  a3);
}

- (void)updateAdjacentBin:(unint64_t)a3 withAlpha:(double)a4 valueOut:(double)a5 nativeBin:(unint64_t)a6
{
  if (-[CMPedometerTable isBin:sameActivityAsBin:](self, "isBin:sameActivityAsBin:", a3, a6))
  {
    id v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:", a3);
    if ((uint64_t)[v10 state] <= 10)
    {
      [v10 valueOut];
      double v12 = a4 * a5 + v11 * (1.0 - a4);
      id v13 = objc_alloc(&OBJC_CLASS___CMPedometerBin);
      [v10 begin];
      double v15 = v14;
      [v10 end];
      double v17 = v16;
      uint64_t v18 = (uint64_t)[v10 state];
      if (v18 <= 1) {
        uint64_t v19 = 1LL;
      }
      else {
        uint64_t v19 = v18;
      }
      -[NSMutableArray setObject:atIndexedSubscript:]( self->_bins,  "setObject:atIndexedSubscript:",  [v13 initWithValueOut:v19 begin:v12 end:v15 state:v17],  a3);
    }
  }

- (BOOL)isBin:(unint64_t)a3 sameActivityAsBin:(unint64_t)a4
{
  unint64_t v4 = self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 1;
  if (v4 <= a3 || v4 <= a4) {
    return 0;
  }
  BOOL v9 = -[CMPedometerTable walkBinCount](self, "walkBinCount") <= a3;
  return v9 ^ (-[CMPedometerTable walkBinCount](self, "walkBinCount") > a4);
}

- (BOOL)isValueInRun:(double)a3
{
  return *(self->_binBoundariesWalk.__end_ - 1) < a3;
}

- (unint64_t)binIndexForValueIn:(double)a3
{
  if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:")
    && (unint64_t result = -[CMPedometerTable walkBinCount](self, "walkBinCount")) != 0)
  {
    uint64_t v6 = 8LL;
  }

  else
  {
    unint64_t result = 0LL;
    uint64_t v6 = 5LL;
  }

  id v8 = (char *)self + v6 * 8;
  id v7 = (double *)(&self->super.isa)[v6];
  uint64_t v9 = *((void *)v8 + 1) - (void)v7;
  if (!v9) {
    return self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 2;
  }
  unint64_t v10 = v9 >> 3;
  if (v10 <= 1) {
    unint64_t v10 = 1LL;
  }
  while (*v7 < a3)
  {
    ++result;
    ++v7;
    if (!--v10) {
      return self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 2;
    }
  }

  return result;
}

- (BOOL)isValueInValid:(double)a3
{
  return a3 >= 0.0 && *(self->_binBoundariesRun.__end_ - 1) >= a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForValueIn:(double)a3
{
  begin = self->_binBoundaries.__begin_;
  end = self->_binBoundaries.__end_;
  double v6 = -1.0;
  if (begin == end) {
    goto LABEL_10;
  }
  uint64_t v7 = 0LL;
  while (begin[v7] < a3)
  {
    if (&begin[++v7] == end) {
      goto LABEL_10;
    }
  }

  if (!(v7 * 8))
  {
LABEL_10:
    double v8 = -1.0;
  }

  else
  {
    double v8 = -1.0;
    if (&begin[v7] != end)
    {
      double v6 = begin[v7 - 1];
      double v8 = begin[v7];
    }
  }

  result.var1 = v8;
  result.var0 = v6;
  return result;
}

- (void)setBins:(id)a3
{
  bins = self->_bins;
  if (bins != a3)
  {

    self->_bins = (NSMutableArray *)[a3 mutableCopy];
  }

  objc_sync_exit(self);
  if (!self->_testMode)
  {
    -[CMPedometerTable binArrayToArchivedData:](self, "binArrayToArchivedData:", a3);
    sub_1002AB3DC((uint64_t)self->_persistentStore);
    (*(void (**)(void *))(*(void *)self->_persistentStore + 944LL))(self->_persistentStore);
  }

  -[CMPedometerTable logBins](self, "logBins");
  -[CMPedometerTable binsDidChange](self, "binsDidChange");
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (unint64_t)walkBinCount
{
  return self->_binBoundariesWalk.__end_ - self->_binBoundariesWalk.__begin_;
}

- (id)description
{
  id v3 = -[CMPedometerTable copyBins](self, "copyBins");
  uint64_t v7 = 0LL;
  double v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  unint64_t v10 = sub_10091E4E8;
  double v11 = sub_10091E4F8;
  double v12 = &stru_1018A4B00;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10091E504;
  v6[3] = &unk_101860D60;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)updateBinsWithValueOut:(double)a3 valueIn:(double)a4 alpha:(double)a5
{
  unint64_t v9 = -[CMPedometerTable binIndexForValueIn:](self, "binIndexForValueIn:", a4);
  if (v9 >= (unint64_t)-[NSMutableArray count](self->_bins, "count"))
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101860DD0);
    }
    double v16 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      unint64_t v44 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "binIndex %{public}lu invalid", buf, 0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101860DD0);
      }
      int v25 = 134349056;
      unint64_t v26 = v9;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  17LL,  "binIndex %{public}lu invalid",  &v25,  12);
      uint64_t v18 = (uint8_t *)v17;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMPedometerTable updateBinsWithValueOut:valueIn:alpha:]", "%s\n", v17);
      if (v18 != buf) {
        free(v18);
      }
    }
  }

  else
  {
    id v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:", v9);
    -[CMPedometerTable updateNativeBin:withAlpha:valueOut:](self, "updateNativeBin:withAlpha:valueOut:", v9, a5, a3);
    -[CMPedometerTable updateAdjacentBin:withAlpha:valueOut:nativeBin:]( self,  "updateAdjacentBin:withAlpha:valueOut:nativeBin:",  v9 - 1,  v9,  a5,  a3);
    -[CMPedometerTable updateAdjacentBin:withAlpha:valueOut:nativeBin:]( self,  "updateAdjacentBin:withAlpha:valueOut:nativeBin:",  v9 + 1,  v9,  a5,  a3);
    -[CMPedometerTable setBins:](self, "setBins:", self->_bins);
    id v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:", v9);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101860DD0);
    }
    double v12 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_INFO))
    {
      id v13 = -[NSString UTF8String](self->_tableName, "UTF8String");
      double v14 = -[NSString UTF8String](self->_valueInName, "UTF8String");
      double v15 = -[NSString UTF8String](self->_valueOutName, "UTF8String");
      *(_DWORD *)buf = 136317186;
      unint64_t v44 = (unint64_t)v13;
      __int16 v45 = 2080;
      v46 = v14;
      __int16 v47 = 2048;
      double v48 = a4;
      __int16 v49 = 2080;
      id v50 = v15;
      __int16 v51 = 2048;
      double v52 = a3;
      __int16 v53 = 2048;
      double v54 = a5;
      __int16 v55 = 2048;
      unint64_t v56 = v9;
      __int16 v57 = 2080;
      id v58 = objc_msgSend(objc_msgSend(v10, "description"), "UTF8String");
      __int16 v59 = 2080;
      id v60 = objc_msgSend(objc_msgSend(v11, "description"), "UTF8String");
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,NativeBinIndex,%lu,OldBinStatus,%s,NewBinStatus,%s",  buf,  0x5Cu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101860DD0);
      }
      uint64_t v19 = qword_101934518;
      int64_t v20 = -[NSString UTF8String](self->_tableName, "UTF8String");
      v21 = -[NSString UTF8String](self->_valueInName, "UTF8String");
      uint64_t v22 = -[NSString UTF8String](self->_valueOutName, "UTF8String");
      int v25 = 136317186;
      unint64_t v26 = (unint64_t)v20;
      __int16 v27 = 2080;
      uint64_t v28 = v21;
      __int16 v29 = 2048;
      double v30 = a4;
      __int16 v31 = 2080;
      double v32 = v22;
      __int16 v33 = 2048;
      double v34 = a3;
      __int16 v35 = 2048;
      double v36 = a5;
      __int16 v37 = 2048;
      unint64_t v38 = v9;
      __int16 v39 = 2080;
      id v40 = objc_msgSend(objc_msgSend(v10, "description"), "UTF8String");
      __int16 v41 = 2080;
      id v42 = objc_msgSend(objc_msgSend(v11, "description"), "UTF8String");
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v19,  1LL,  "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,NativeBinIndex,%lu,OldBinStatus,%s,NewBinStatus,%s",  (const char *)&v25,  92);
      uint64_t v24 = (uint8_t *)v23;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMPedometerTable updateBinsWithValueOut:valueIn:alpha:]", "%s\n", v23);
      if (v24 != buf) {
        free(v24);
      }
    }
  }

  objc_sync_exit(self);
}

+ (id)convertToCMPedometerBins:(id)a3
{
  id v4 =  -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [a3 count]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10091EB60;
  v6[3] = &unk_101860D88;
  v6[4] = v4;
  [a3 enumerateObjectsUsingBlock:v6];
  return v4;
}

+ (id)convertToCMStrideCalibrationData:(id)a3
{
  id v4 =  -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [a3 count]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10091EC88;
  v6[3] = &unk_101860DB0;
  v6[4] = v4;
  [a3 enumerateObjectsUsingBlock:v6];
  return v4;
}

- (void).cxx_destruct
{
  begin = self->_binBoundaries.__begin_;
  if (begin)
  {
    self->_binBoundaries.__end_ = begin;
    operator delete(begin);
  }

  id v4 = self->_binBoundariesRun.__begin_;
  if (v4)
  {
    self->_binBoundariesRun.__end_ = v4;
    operator delete(v4);
  }

  id v5 = self->_binBoundariesWalk.__begin_;
  if (v5)
  {
    self->_binBoundariesWalk.__end_ = v5;
    operator delete(v5);
  }

- (id).cxx_construct
{
  *((void *)self + 13) = 0LL;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end