@interface _DASKnapsackSolver
- (BOOL)index_vect;
- (OS_os_log)logger;
- (_DASKnapsackSolver)init;
- (char)values_vect;
- (id)solveKnapsackWithCapacity:(id)a3 forItemWeights:(id)a4 andItemValues:(id)a5;
- (unsigned)J;
- (unsigned)n_cols;
- (unsigned)n_rows;
- (unsigned)weight_vect;
- (void)reset;
- (void)setIndex_vect:(BOOL *)a3;
- (void)setJ:(unsigned __int16 *)a3;
- (void)setLogger:(id)a3;
- (void)setN_cols:(unsigned int)a3;
- (void)setN_rows:(unsigned __int8)a3;
- (void)setValues_vect:(char *)a3;
- (void)setWeight_vect:(unsigned int *)a3;
@end

@implementation _DASKnapsackSolver

- (_DASKnapsackSolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____DASKnapsackSolver;
  v2 = -[_DASKnapsackSolver init](&v6, "init");
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"DASKnapsackSolver"));
  v4 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v3;

  v2[8] = 0;
  *((_DWORD *)v2 + 3) = 0;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  return (_DASKnapsackSolver *)v2;
}

- (id)solveKnapsackWithCapacity:(id)a3 forItemWeights:(id)a4 andItemValues:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if ((unint64_t)[v10 count] >= 0xFF)
  {
    logger = v11->_logger;
    if (!os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v13 = "Error: Exceeded the maximum number of solver inputs (UINT8_MAX - 1).";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    goto LABEL_27;
  }

  if ((unint64_t)[v8 unsignedLongValue] >> 32)
  {
    logger = v11->_logger;
    if (!os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v13 = "Error: Exceeded the maximum solver capacity UINT32_MAX.";
    goto LABEL_7;
  }

  unsigned int v14 = [v8 unsignedIntValue];
  size_t v15 = (size_t)[v10 count];
  id v16 = [v9 count];
  uint64_t v17 = v14 + 1;
  v11->_n_cols = v17;
  v11->_unsigned __int8 n_rows = v15 + 1;
  if (v16 != (id)v15 || (unint64_t)v16 < 2 || v17 < 3 || (v15 + 1) <= 2u)
  {
    v28 = v11->_logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v29 = "Error: Invalid solver input.";
    goto LABEL_26;
  }

  v18 = (char *)malloc(v15);
  v11->_values_vect = v18;
  v19 = (unsigned int *)malloc(4 * v15);
  v11->_weight_vect = v19;
  if (!v18 || !v19)
  {
    v28 = v11->_logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v29 = "Error: Failed to allocate memory for I/O vectorization.";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
    goto LABEL_27;
  }

  uint64_t v20 = 0LL;
  do
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:v20]);
    if ((unint64_t)[v21 longValue] >= 0x100)
    {
      v31 = v11->_logger;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Error: Item values must be positive and less than UINT8_MAX.",  buf,  2u);
      }

      -[_DASKnapsackSolver reset](v11, "reset");
      v27 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", &off_1001219F0, 0LL);

      goto LABEL_28;
    }

    v11->_values_vect[v20] = [v21 unsignedCharValue];
    v22 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v20]);
    v11->_weight_vect[v20] = [v22 unsignedIntValue];

    ++v20;
  }

  while (v15 != v20);
  unsigned int v23 = 0;
  uint64_t v24 = 0LL;
  unsigned int v25 = -1;
  do
  {
    unsigned int v26 = v11->_weight_vect[v24];
    v23 += v26;
    if (v26 < v25) {
      unsigned int v25 = v11->_weight_vect[v24];
    }
    ++v24;
  }

  while (v15 != v24);
  if (v25 > v14)
  {
    v27 = objc_alloc_init(&OBJC_CLASS___NSSet);
LABEL_61:
    -[_DASKnapsackSolver reset](v11, "reset");
    goto LABEL_28;
  }

  if (v23 <= v14)
  {
    v49 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  v15));
    uint64_t v54 = 0LL;
    do
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v54));
      -[NSMutableSet addObject:](v49, "addObject:", v55);

      ++v54;
    }

    while (v15 != v54);
    v53 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v49);
LABEL_60:
    v27 = v53;

    goto LABEL_61;
  }

  v32 = (unsigned __int16 **)calloc(v11->_n_rows, 8uLL);
  v11->_J = v32;
  if (!v32)
  {
    v56 = v11->_logger;
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v57 = "Error: Failed to allocate memory for solver core.";
    goto LABEL_68;
  }

  *v11->_J = (unsigned __int16 *)calloc(v11->_n_cols, 2uLL);
  J = v11->_J;
  if (!*J)
  {
    v56 = v11->_logger;
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v57 = "Error: Failed to allocate memory for solver core.";
    goto LABEL_68;
  }

  if (v11->_n_rows < 2u)
  {
LABEL_46:
    v42 = (BOOL *)calloc(v15, 1uLL);
    v11->_index_vect = v42;
    if (v42)
    {
      unsigned __int8 n_rows = v11->_n_rows;
      LOBYTE(v44) = n_rows - 1;
      if (n_rows != 1)
      {
        weight_vect = v11->_weight_vect;
        v45 = v11->_J;
        unsigned int v47 = v11->_n_cols - 1;
        uint64_t v44 = v44;
        do
        {
          uint64_t v48 = (v44 - 1);
          if (v45[v44][v47] > v45[v48][v47])
          {
            v47 -= weight_vect[v48];
            v42[v48] = 1;
          }

          --v44;
        }

        while (v48);
      }

      v49 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      uint64_t v50 = 0LL;
      unsigned __int8 v51 = 0;
      do
      {
        if (v11->_index_vect[v50])
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v51));
          -[NSMutableSet addObject:](v49, "addObject:", v52);
        }

        uint64_t v50 = ++v51;
      }

      while (v15 > v51);
      v53 = (NSSet *)-[NSMutableSet copy](v49, "copy");
      goto LABEL_60;
    }

    v56 = v11->_logger;
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v57 = "Error: Failed to allocate memory for I/O vectorization.";
LABEL_68:
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, v57, buf, 2u);
    goto LABEL_27;
  }

  size_t v34 = 2LL * v11->_n_cols;
  unsigned __int8 v35 = 1;
  while (1)
  {
    J[v35] = (unsigned __int16 *)malloc(v34);
    J = v11->_J;
    v36 = J[v35];
    if (!v36) {
      break;
    }
    unint64_t v37 = 0LL;
    uint64_t v38 = (v35 - 1);
    unint64_t v39 = v11->_weight_vect[v38];
    v40 = J[v38];
    do
    {
      unsigned int v41 = v40[v37];
      v36[v37++] = v41;
    }

    while (v17 != v37);
  }

  v58 = v11->_logger;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Error: Failed to allocate memory for solver core.",  buf,  2u);
  }

- (void)reset
{
  J = self->_J;
  if (J)
  {
    if (self->_n_rows)
    {
      unint64_t v4 = 0LL;
      do
        free(self->_J[v4++]);
      while (v4 < self->_n_rows);
      J = self->_J;
    }

    free(J);
  }

  self->_unsigned __int8 n_rows = 0;
  self->_n_cols = 0;
}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLogger:(id)a3
{
}

- (BOOL)index_vect
{
  return self->_index_vect;
}

- (void)setIndex_vect:(BOOL *)a3
{
  self->_index_vect = a3;
}

- (char)values_vect
{
  return self->_values_vect;
}

- (void)setValues_vect:(char *)a3
{
  self->_values_vect = a3;
}

- (unsigned)weight_vect
{
  return self->_weight_vect;
}

- (void)setWeight_vect:(unsigned int *)a3
{
  self->_weight_vect = a3;
}

- (unsigned)n_rows
{
  return self->_n_rows;
}

- (void)setN_rows:(unsigned __int8)a3
{
  self->_unsigned __int8 n_rows = a3;
}

- (unsigned)n_cols
{
  return self->_n_cols;
}

- (void)setN_cols:(unsigned int)a3
{
  self->_n_cols = a3;
}

- (unsigned)J
{
  return self->_J;
}

- (void)setJ:(unsigned __int16 *)a3
{
  self->_J = a3;
}

- (void).cxx_destruct
{
}

@end