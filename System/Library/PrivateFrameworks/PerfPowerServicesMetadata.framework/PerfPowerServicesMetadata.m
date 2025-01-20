}

uint64_t PPSPBRoundingReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0LL;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1LL || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(_BYTE *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v23 += 7;
          BOOL v14 = v24++ >= 9;
          if (v14)
          {
            uint64_t v25 = 0LL;
            goto LABEL_43;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v25 = 0LL;
        }
LABEL_43:
        *(void *)(a1 + 8) = v25;
      }

      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_39:
        *(_DWORD *)(a1 + 16) = v19;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

LABEL_12:
  return v5;
}

  return v5;
}

  return v5;
}

BOOL PPSPBEnumTupleReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8LL;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16LL;
    goto LABEL_22;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

id logHandle()
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global_47);
  }
  return (id)logHandle___logObj;
}

void __logHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "MetadataDecl");
  v1 = (void *)logHandle___logObj;
  logHandle___logObj = (uint64_t)v0;
}

void OUTLINED_FUNCTION_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t PPSPBMetricTypeReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0LL;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1LL || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(_BYTE *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v23 += 7;
          BOOL v14 = v24++ >= 9;
          if (v14)
          {
            uint64_t v25 = 0LL;
            goto LABEL_43;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v25 = 0LL;
        }
LABEL_43:
        *(void *)(a1 + 8) = v25;
      }

      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_39:
        *(_DWORD *)(a1 + 16) = v19;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

id PPSSQLStoreLog()
{
  if (PPSSQLStoreLog_onceToken != -1) {
    dispatch_once(&PPSSQLStoreLog_onceToken, &__block_literal_global_1);
  }
  return (id)PPSSQLStoreLog___logObj;
}

id performStatement(sqlite3_stmt *a1)
{
  v2 = (void *)objc_opt_new();
  columnNamesForStatement(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v26 = 0;
  uint64_t v4 = sqlite3_column_count(a1);
  while (1)
  {
    while (1)
    {
      int v5 = sqlite3_step(a1);
      if (v5 != 100) {
        break;
      }
      [MEMORY[0x189603FC8] dictionary];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)v4 >= 1)
      {
        for (uint64_t i = 0LL; i != v4; ++i)
        {
          [v3 objectAtIndexedSubscript:i];
          char v8 = (void *)objc_claimAutoreleasedReturnValue();
          valueForStatementColumn(a1, i);
          unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 setObject:v9 forKeyedSubscript:v8];
        }
      }

      [v2 addObject:v6];
    }

    if (v5 != 5) {
      break;
    }
    if (v26 > 4) {
      goto LABEL_14;
    }
    ++v26;
    sqlite3_sleep(10);
  }

  if (v5 != 11)
  {
    if (v26 < 6) {
      goto LABEL_17;
    }
LABEL_14:
    PPSSQLStoreLog();
    unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      performStatement_cold_1(v10, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_16;
  }

  PPSSQLStoreLog();
  unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    performStatement_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
  }
LABEL_16:

  v2 = 0LL;
LABEL_17:

  return v2;
}

id columnNamesForStatement(sqlite3_stmt *a1)
{
  v2 = (void *)objc_opt_new();
  int v3 = sqlite3_column_count(a1);
  if (v3 >= 1)
  {
    int v4 = v3;
    for (int i = 0; i != v4; ++i)
    {
      objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name(a1, i));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 addObject:v6];
    }
  }

  return v2;
}

id valueForStatementColumn(sqlite3_stmt *a1, int a2)
{
  int v4 = sqlite3_column_type(a1, a2) - 1;
  int v5 = 0LL;
  switch(v4)
  {
    case 0:
      int v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607968]), "initWithLongLong:", sqlite3_column_int64(a1, a2));
      break;
    case 1:
      int v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607968]), "initWithDouble:", sqlite3_column_double(a1, a2));
      break;
    case 2:
      int v5 = (void *)objc_msgSend(objc_alloc(NSString), "initWithUTF8String:", sqlite3_column_text(a1, a2));
      break;
    case 4:
      return v5;
    default:
      v6 = sqlite3_column_blob(a1, a2);
      int v5 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F48]),  "initWithBytes:length:",  v6,  sqlite3_column_bytes(a1, a2));
      break;
  }

  return v5;
}

void __PPSSQLStoreLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "SQLMetadataStore");
  v1 = (void *)PPSSQLStoreLog___logObj;
  PPSSQLStoreLog___logObj = (uint64_t)v0;
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

uint64_t PPSPBMetricHistoryReadFrom(void *a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x189611CF0];
  int v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(&OBJC_CLASS___PPSPBMetric);
        [a1 addMetrics:v17];
        if (!PBReaderPlaceMark() || (PPSPBMetricReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0LL;
        }

        PBReaderRecallMark();
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18880E3C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_20:
  [v3 objectForKeyedSubscript:@"value"];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 doubleValue];
  uint64_t v21 = v20;

  [v3 objectForKeyedSubscript:@"value"];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [v22 unsignedIntegerValue];

  if (v21 >= 0.0 && round(v21) == (double)v23)
  {
LABEL_24:
    int v15 = 1;
    goto LABEL_25;
  }

  PPSStorageLog();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    +[PPSRounding(JSON) isValidRoundingJSON:].cold.3(v3);
  }
LABEL_17:

  int v15 = 0;
LABEL_25:

  return v15;
}

  source = self->_source;
  if (source)
  {
    -[PPSPBSource dictionaryRepresentation](source, "dictionaryRepresentation");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v18 forKey:@"source"];
  }

  uint64_t v19 = (__int16)self->_has;
  if ((v19 & 8) != 0)
  {
    [MEMORY[0x189607968] numberWithInt:self->_deviceCapability];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v20 forKey:@"deviceCapability"];

    uint64_t v19 = (__int16)self->_has;
  }

  if ((v19 & 0x20) != 0)
  {
    [MEMORY[0x189607968] numberWithInt:self->_enabledPopulation];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v21 forKey:@"enabledPopulation"];
  }

  rounding = self->_rounding;
  if (rounding)
  {
    -[PPSPBRounding dictionaryRepresentation](rounding, "dictionaryRepresentation");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v23 forKey:@"rounding"];
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    [MEMORY[0x189607968] numberWithInt:self->_obfuscation];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v24 forKey:@"obfuscation"];
  }

  metricDescription = self->_metricDescription;
  if (metricDescription) {
    [v4 setObject:metricDescription forKey:@"metricDescription"];
  }
  exampleValue = self->_exampleValue;
  if (exampleValue) {
    [v4 setObject:exampleValue forKey:@"exampleValue"];
  }
  build = self->_build;
  if (build) {
    [v4 setObject:build forKey:@"build"];
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    [MEMORY[0x189607968] numberWithInt:self->_privacyClassification];
    char v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v28 forKey:@"privacyClassification"];
  }

  enumMapping = self->_enumMapping;
  if (enumMapping)
  {
    v30 = -[PPSPBEnumMapping dictionaryRepresentation](enumMapping, "dictionaryRepresentation");
    [v4 setObject:v30 forKey:@"enumMapping"];
  }

  groupBy = self->_groupBy;
  if (groupBy)
  {
    v32 = -[PPSPBGroupingDimensions dictionaryRepresentation](groupBy, "dictionaryRepresentation");
    [v4 setObject:v32 forKey:@"groupBy"];
  }

  metricType = self->_metricType;
  if (metricType)
  {
    v34 = -[PPSPBMetricType dictionaryRepresentation](metricType, "dictionaryRepresentation");
    [v4 setObject:v34 forKey:@"metricType"];
  }

  v35 = (__int16)self->_has;
  if ((v35 & 2) != 0)
  {
    [MEMORY[0x189607968] numberWithInt:self->_auxiliaryType];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v41 forKey:@"auxiliaryType"];

    v35 = (__int16)self->_has;
    if ((v35 & 0x2000) == 0)
    {
LABEL_46:
      if ((v35 & 0x1000) == 0) {
        goto LABEL_47;
      }
LABEL_56:
      [MEMORY[0x189607968] numberWithBool:self->_dmaCompliant];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setObject:v43 forKey:@"dmaCompliant"];

      if ((*(_WORD *)&self->_has & 0x40) == 0) {
        return v4;
      }
      goto LABEL_48;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_46;
  }

  [MEMORY[0x189607968] numberWithBool:self->_filterEntryLogging];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v42 forKey:@"filterEntryLogging"];

  v35 = (__int16)self->_has;
  if ((v35 & 0x1000) != 0) {
    goto LABEL_56;
  }
LABEL_47:
  if ((v35 & 0x40) != 0)
  {
LABEL_48:
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_fixedArraySize];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v36 forKey:@"fixedArraySize"];
  }

  return v4;
}

  if (self->_source)
  {
    PBDataWriterWriteSubmessage();
    int v4 = v9;
  }

  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v4 = v9;
    v7 = (__int16)self->_has;
  }

  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v4 = v9;
  }

  if (self->_rounding)
  {
    PBDataWriterWriteSubmessage();
    int v4 = v9;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v4 = v9;
  }

  if (self->_metricDescription)
  {
    PBDataWriterWriteStringField();
    int v4 = v9;
  }

  if (self->_exampleValue)
  {
    PBDataWriterWriteStringField();
    int v4 = v9;
  }

  if (self->_build)
  {
    PBDataWriterWriteStringField();
    int v4 = v9;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v4 = v9;
  }

  if (self->_enumMapping)
  {
    PBDataWriterWriteSubmessage();
    int v4 = v9;
  }

  if (self->_groupBy)
  {
    PBDataWriterWriteSubmessage();
    int v4 = v9;
  }

  if (self->_metricType)
  {
    PBDataWriterWriteSubmessage();
    int v4 = v9;
  }

  char v8 = (__int16)self->_has;
  if ((v8 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v4 = v9;
    char v8 = (__int16)self->_has;
    if ((v8 & 0x2000) == 0)
    {
LABEL_46:
      if ((v8 & 0x1000) == 0) {
        goto LABEL_47;
      }
LABEL_56:
      PBDataWriterWriteBOOLField();
      int v4 = v9;
      if ((*(_WORD *)&self->_has & 0x40) == 0) {
        goto LABEL_49;
      }
      goto LABEL_48;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_46;
  }

  PBDataWriterWriteBOOLField();
  int v4 = v9;
  char v8 = (__int16)self->_has;
  if ((v8 & 0x1000) != 0) {
    goto LABEL_56;
  }
LABEL_47:
  if ((v8 & 0x40) != 0)
  {
LABEL_48:
    PBDataWriterWriteUint32Field();
    int v4 = v9;
  }

  if (self->_source)
  {
    objc_msgSend(v9, "setSource:");
    int v4 = v9;
  }

  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_deviceCapability;
    *((_WORD *)v4 + 94) |= 8u;
    v7 = (__int16)self->_has;
  }

  if ((v7 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_enabledPopulation;
    *((_WORD *)v4 + 94) |= 0x20u;
  }

  if (self->_rounding)
  {
    objc_msgSend(v9, "setRounding:");
    int v4 = v9;
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)v4 + 32) = self->_obfuscation;
    *((_WORD *)v4 + 94) |= 0x100u;
  }

  if (self->_metricDescription)
  {
    objc_msgSend(v9, "setMetricDescription:");
    int v4 = v9;
  }

  if (self->_exampleValue)
  {
    objc_msgSend(v9, "setExampleValue:");
    int v4 = v9;
  }

  if (self->_build)
  {
    objc_msgSend(v9, "setBuild:");
    int v4 = v9;
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_privacyClassification;
    *((_WORD *)v4 + 94) |= 0x200u;
  }

  if (self->_enumMapping)
  {
    objc_msgSend(v9, "setEnumMapping:");
    int v4 = v9;
  }

  if (self->_groupBy)
  {
    objc_msgSend(v9, "setGroupBy:");
    int v4 = v9;
  }

  if (self->_metricType)
  {
    objc_msgSend(v9, "setMetricType:");
    int v4 = v9;
  }

  char v8 = (__int16)self->_has;
  if ((v8 & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_auxiliaryType;
    *((_WORD *)v4 + 94) |= 2u;
    char v8 = (__int16)self->_has;
    if ((v8 & 0x2000) == 0)
    {
LABEL_46:
      if ((v8 & 0x1000) == 0) {
        goto LABEL_47;
      }
LABEL_56:
      *((_BYTE *)v4 + 184) = self->_dmaCompliant;
      *((_WORD *)v4 + 94) |= 0x1000u;
      if ((*(_WORD *)&self->_has & 0x40) == 0) {
        goto LABEL_49;
      }
      goto LABEL_48;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_46;
  }

  *((_BYTE *)v4 + 185) = self->_filterEntryLogging;
  *((_WORD *)v4 + 94) |= 0x2000u;
  char v8 = (__int16)self->_has;
  if ((v8 & 0x1000) != 0) {
    goto LABEL_56;
  }
LABEL_47:
  if ((v8 & 0x40) != 0)
  {
LABEL_48:
    *((_DWORD *)v4 + 20) = self->_fixedArraySize;
    *((_WORD *)v4 + 94) |= 0x40u;
  }

  v29 = 0LL;
LABEL_21:
  char v28 = -[PPSPBSource hash](self->_source, "hash");
  unint64_t v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    unint64_t v27 = 2654435761LL * self->_deviceCapability;
    if ((v10 & 0x20) != 0) {
      goto LABEL_23;
    }
  }

  else
  {
    unint64_t v27 = 0LL;
    if ((v10 & 0x20) != 0)
    {
LABEL_23:
      unsigned int v26 = 2654435761LL * self->_enabledPopulation;
      goto LABEL_26;
    }
  }

  unsigned int v26 = 0LL;
LABEL_26:
  uint64_t v25 = -[PPSPBRounding hash](self->_rounding, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v11 = 2654435761LL * self->_obfuscation;
  }
  else {
    uint64_t v11 = 0LL;
  }
  unint64_t v12 = -[NSString hash](self->_metricDescription, "hash");
  char v13 = -[NSString hash](self->_exampleValue, "hash");
  uint64_t v14 = -[NSString hash](self->_build, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    int v15 = 2654435761LL * self->_privacyClassification;
  }
  else {
    int v15 = 0LL;
  }
  uint64_t v16 = -[PPSPBEnumMapping hash](self->_enumMapping, "hash");
  uint64_t v17 = -[PPSPBGroupingDimensions hash](self->_groupBy, "hash");
  uint64_t v18 = -[PPSPBMetricType hash](self->_metricType, "hash");
  uint64_t v19 = (__int16)self->_has;
  if ((v19 & 2) != 0)
  {
    uint64_t v20 = 2654435761LL * self->_auxiliaryType;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_34:
      uint64_t v21 = 2654435761LL * self->_filterEntryLogging;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_35;
      }
LABEL_39:
      uint64_t v22 = 0LL;
      if ((v19 & 0x40) != 0) {
        goto LABEL_36;
      }
LABEL_40:
      uint64_t v23 = 0LL;
      return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23;
    }
  }

  else
  {
    uint64_t v20 = 0LL;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_34;
    }
  }

  uint64_t v21 = 0LL;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v22 = 2654435761LL * self->_dmaCompliant;
  if ((v19 & 0x40) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v23 = 2654435761LL * self->_fixedArraySize;
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23;
}

LABEL_11:
  [v3 objectForKeyedSubscript:@"category"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 unsignedIntValue];

  if (v19 == 2)
  {
    [v3 objectForKeyedSubscript:@"value"];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v20 unsignedIntValue])
    {
      [v3 objectForKeyedSubscript:@"value"];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v21 unsignedIntValue];

      if (v22 < 5) {
        goto LABEL_14;
      }
    }

    else
    {
    }

    PPSStorageLog();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[PPSMetricType(JSON) isValidMetricTypeJSON:].cold.3();
    }
LABEL_22:

    uint64_t v23 = 0;
    goto LABEL_23;
  }

LABEL_14:
  uint64_t v23 = 1;
LABEL_23:

  return v23;
}

void OUTLINED_FUNCTION_0_1( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1_1(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id OUTLINED_FUNCTION_5(id a1)
{
  return a1;
}

  ;
}

void OUTLINED_FUNCTION_7( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return objc_opt_class();
}

  ;
}

  ;
}

uint64_t PPSPBEnumMappingReadFrom(void *a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x189611CF0];
  int v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(&OBJC_CLASS___PPSPBEnumTuple);
        [a1 addEnumMap:v17];
        if (!PBReaderPlaceMark() || !PPSPBEnumTupleReadFrom((uint64_t)v17, a2))
        {

          return 0LL;
        }

        PBReaderRecallMark();
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPSPBUnitReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x189611CF0];
  int v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(va, 8) = v17;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPSPBSourceReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x189611CF0];
  int v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(va, 8) = v17;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPSPBCadenceTupleReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x189611CF0];
  int v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0LL;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1LL || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(_BYTE *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v23 += 7;
          BOOL v14 = v24++ >= 9;
          if (v14)
          {
            uint64_t v25 = 0LL;
            goto LABEL_43;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v25 = 0LL;
        }
LABEL_43:
        *(void *)(a1 + _Block_object_dispose(va, 8) = v25;
      }

      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_39:
        *(_DWORD *)(a1 + 16) = v19;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

LABEL_4:
  int v4 = 1;
LABEL_10:

  return v4;
}

void sub_18881D468( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void OUTLINED_FUNCTION_2_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_3_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_1_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t PPSPBGroupingDimensionsReadFrom(void *a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x189611CF0];
  int v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        char v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17) {
          [a1 addGroupBy:v17];
        }
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPSPBCadenceReadFrom(void *a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x189611CF0];
  int v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(&OBJC_CLASS___PPSPBCadenceTuple);
        [a1 addCadences:v17];
        if (!PBReaderPlaceMark() || (PPSPBCadenceTupleReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0LL;
        }

        PBReaderRecallMark();
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_188820FA0(_Unwind_Exception *a1)
{
}

LABEL_7:
  -[PPSMetadataStore metricsByID](self, "metricsByID");
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 objectForKeyedSubscript:v6];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 objectForKeyedSubscript:v7];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_sync_exit(@"++metricsByIDSync++");

  return v20;
}

  -[PPSMetadataStore metricsByID](self, "metricsByID");
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 objectForKeyedSubscript:v8];
  char v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 objectForKeyedSubscript:v9];
  char v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 objectForKeyedSubscript:v10];
  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_sync_exit(@"++metricsByIDSync++");

  return v24;
}

void sub_188821150(_Unwind_Exception *a1)
{
}

void sub_18882132C(_Unwind_Exception *a1)
{
}

void sub_188822150(_Unwind_Exception *a1)
{
}

id PPSStoreLog()
{
  if (PPSStoreLog_onceToken != -1) {
    dispatch_once(&PPSStoreLog_onceToken, &__block_literal_global_13_0);
  }
  return (id)PPSStoreLog___logObj;
}

void __PPSStoreLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "MetadataStore");
  v1 = (void *)PPSStoreLog___logObj;
  PPSStoreLog___logObj = (uint64_t)v0;
}

id PPSMetricLog()
{
  if (PPSMetricLog_onceToken != -1) {
    dispatch_once(&PPSMetricLog_onceToken, &__block_literal_global_6);
  }
  return (id)PPSMetricLog___logObj;
}

void __PPSMetricLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "MetricConstruction");
  v1 = (void *)PPSMetricLog___logObj;
  PPSMetricLog___logObj = (uint64_t)v0;
}

id PPSStorageLog()
{
  if (PPSStorageLog_onceToken != -1) {
    dispatch_once(&PPSStorageLog_onceToken, &__block_literal_global_3_1);
  }
  return (id)PPSStorageLog___logObj;
}

void __PPSStorageLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "MetricSerialization");
  v1 = (void *)PPSStorageLog___logObj;
  PPSStorageLog___logObj = (uint64_t)v0;
}

id PPSClientInterfaceLog()
{
  if (PPSClientInterfaceLog_onceToken != -1) {
    dispatch_once(&PPSClientInterfaceLog_onceToken, &__block_literal_global_8);
  }
  return (id)PPSClientInterfaceLog___logObj;
}

void __PPSClientInterfaceLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "ClientInterface");
  v1 = (void *)PPSClientInterfaceLog___logObj;
  PPSClientInterfaceLog___logObj = (uint64_t)v0;
}

LABEL_52:
  [MEMORY[0x189607968] numberWithUnsignedInt:self->_timeToLive];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v40 forKey:@"timeToLive"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_19:
    [MEMORY[0x189607968] numberWithInt:self->_mode];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v16 forKey:@"mode"];
  }

  PBDataWriterWriteUint32Field();
  int v4 = v9;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_19:
    PBDataWriterWriteInt32Field();
    int v4 = v9;
  }

  *((_DWORD *)v4 + 42) = self->_timeToLive;
  *((_WORD *)v4 + 94) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_19:
    *((_DWORD *)v4 + 2_Block_object_dispose(va, 8) = self->_mode;
    *((_WORD *)v4 + 94) |= 0x80u;
  }

uint64_t PPSPBMetricReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x189611CF0];
  int v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  v7 = (int *)MEMORY[0x189611CD8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5)) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0LL;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      unint64_t v10 = 0LL;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 120LL;
        goto LABEL_98;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 160LL;
        goto LABEL_98;
      case 3u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 40LL;
        goto LABEL_98;
      case 4u:
        *(_WORD *)(a1 + 188) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7LL && v21 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 8;
        }

        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          uint64_t v22 = 0LL;
        }

        *(void *)(a1 + _Block_object_dispose(va, 8) = v22;
        goto LABEL_197;
      case 5u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0LL;
        *(_WORD *)(a1 + 188) |= 4u;
        while (2)
        {
          uint64_t v26 = *v3;
          uint64_t v27 = *(void *)(a2 + v26);
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v29 = *(_BYTE *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              BOOL v15 = v24++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_146;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_146:
        uint64_t v107 = 48LL;
        goto LABEL_196;
      case 6u:
        v30 = objc_alloc_init(&OBJC_CLASS___PPSPBUnit);
        objc_storeStrong((id *)(a1 + 176), v30);
        goto LABEL_114;
      case 7u:
        v30 = objc_alloc_init(&OBJC_CLASS___PPSPBCadence);
        objc_storeStrong((id *)(a1 + 32), v30);
        goto LABEL_114;
      case 8u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v25 = 0LL;
        *(_WORD *)(a1 + 188) |= 0x10u;
        while (2)
        {
          uint64_t v33 = *v3;
          uint64_t v34 = *(void *)(a2 + v33);
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v36 = *(_BYTE *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v35;
            v25 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v15 = v32++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_150;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_150:
        uint64_t v107 = 56LL;
        goto LABEL_196;
      case 9u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v25 = 0LL;
        *(_WORD *)(a1 + 188) |= 0x400u;
        while (2)
        {
          uint64_t v39 = *v3;
          uint64_t v40 = *(void *)(a2 + v39);
          unint64_t v41 = v40 + 1;
          if (v40 == -1 || v41 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v42 = *(_BYTE *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v41;
            v25 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              BOOL v15 = v38++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_154;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_154:
        uint64_t v107 = 152LL;
        goto LABEL_196;
      case 0xAu:
        char v43 = 0;
        unsigned int v44 = 0;
        uint64_t v25 = 0LL;
        *(_WORD *)(a1 + 188) |= 0x800u;
        while (2)
        {
          uint64_t v45 = *v3;
          uint64_t v46 = *(void *)(a2 + v45);
          unint64_t v47 = v46 + 1;
          if (v46 == -1 || v47 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v48 = *(_BYTE *)(*(void *)(a2 + *v7) + v46);
            *(void *)(a2 + v45) = v47;
            v25 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              BOOL v15 = v44++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_158;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_158:
        uint64_t v107 = 168LL;
        goto LABEL_196;
      case 0xBu:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v25 = 0LL;
        *(_WORD *)(a1 + 188) |= 0x80u;
        while (2)
        {
          uint64_t v51 = *v3;
          uint64_t v52 = *(void *)(a2 + v51);
          unint64_t v53 = v52 + 1;
          if (v52 == -1 || v53 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v54 = *(_BYTE *)(*(void *)(a2 + *v7) + v52);
            *(void *)(a2 + v51) = v53;
            v25 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              BOOL v15 = v50++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_162;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_162:
        uint64_t v107 = 112LL;
        goto LABEL_196;
      case 0xCu:
        v30 = objc_alloc_init(&OBJC_CLASS___PPSPBSource);
        objc_storeStrong((id *)(a1 + 144), v30);
        goto LABEL_114;
      case 0xDu:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v25 = 0LL;
        *(_WORD *)(a1 + 188) |= 8u;
        while (2)
        {
          uint64_t v57 = *v3;
          uint64_t v58 = *(void *)(a2 + v57);
          unint64_t v59 = v58 + 1;
          if (v58 == -1 || v59 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v60 = *(_BYTE *)(*(void *)(a2 + *v7) + v58);
            *(void *)(a2 + v57) = v59;
            v25 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              BOOL v15 = v56++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_166;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_166:
        uint64_t v107 = 52LL;
        goto LABEL_196;
      case 0xEu:
        char v61 = 0;
        unsigned int v62 = 0;
        uint64_t v25 = 0LL;
        *(_WORD *)(a1 + 188) |= 0x20u;
        while (2)
        {
          uint64_t v63 = *v3;
          uint64_t v64 = *(void *)(a2 + v63);
          unint64_t v65 = v64 + 1;
          if (v64 == -1 || v65 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v66 = *(_BYTE *)(*(void *)(a2 + *v7) + v64);
            *(void *)(a2 + v63) = v65;
            v25 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              v61 += 7;
              BOOL v15 = v62++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_170;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_170:
        uint64_t v107 = 60LL;
        goto LABEL_196;
      case 0x10u:
        v30 = objc_alloc_init(&OBJC_CLASS___PPSPBRounding);
        objc_storeStrong((id *)(a1 + 136), v30);
        goto LABEL_114;
      case 0x11u:
        char v68 = 0;
        unsigned int v69 = 0;
        uint64_t v25 = 0LL;
        *(_WORD *)(a1 + 188) |= 0x100u;
        while (2)
        {
          uint64_t v70 = *v3;
          uint64_t v71 = *(void *)(a2 + v70);
          unint64_t v72 = v71 + 1;
          if (v71 == -1 || v72 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v73 = *(_BYTE *)(*(void *)(a2 + *v7) + v71);
            *(void *)(a2 + v70) = v72;
            v25 |= (unint64_t)(v73 & 0x7F) << v68;
            if (v73 < 0)
            {
              v68 += 7;
              BOOL v15 = v69++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_174;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_174:
        uint64_t v107 = 128LL;
        goto LABEL_196;
      case 0x12u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 96LL;
        goto LABEL_98;
      case 0x13u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 72LL;
        goto LABEL_98;
      case 0x14u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24LL;
LABEL_98:
        v74 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_197;
      case 0x15u:
        char v75 = 0;
        unsigned int v76 = 0;
        uint64_t v25 = 0LL;
        *(_WORD *)(a1 + 188) |= 0x200u;
        while (2)
        {
          uint64_t v77 = *v3;
          uint64_t v78 = *(void *)(a2 + v77);
          unint64_t v79 = v78 + 1;
          if (v78 == -1 || v79 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v80 = *(_BYTE *)(*(void *)(a2 + *v7) + v78);
            *(void *)(a2 + v77) = v79;
            v25 |= (unint64_t)(v80 & 0x7F) << v75;
            if (v80 < 0)
            {
              v75 += 7;
              BOOL v15 = v76++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_178;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_178:
        uint64_t v107 = 132LL;
        goto LABEL_196;
      case 0x16u:
        v30 = objc_alloc_init(&OBJC_CLASS___PPSPBEnumMapping);
        objc_storeStrong((id *)(a1 + 64), v30);
        goto LABEL_114;
      case 0x17u:
        v30 = objc_alloc_init(&OBJC_CLASS___PPSPBGroupingDimensions);
        objc_storeStrong((id *)(a1 + 88), v30);
        goto LABEL_114;
      case 0x18u:
        v30 = objc_alloc_init(&OBJC_CLASS___PPSPBMetricType);
        objc_storeStrong((id *)(a1 + 104), v30);
        if (PBReaderPlaceMark() && (PPSPBMetricTypeReadFrom((uint64_t)v30, a2) & 1) != 0)
        {
LABEL_114:
          PBReaderRecallMark();

LABEL_197:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(_BYTE *)(a2 + *v5) == 0;
          }
          continue;
        }

LABEL_202:
        return 0LL;
      case 0x19u:
        char v81 = 0;
        unsigned int v82 = 0;
        uint64_t v25 = 0LL;
        *(_WORD *)(a1 + 188) |= 2u;
        while (2)
        {
          uint64_t v83 = *v3;
          uint64_t v84 = *(void *)(a2 + v83);
          unint64_t v85 = v84 + 1;
          if (v84 == -1 || v85 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v86 = *(_BYTE *)(*(void *)(a2 + *v7) + v84);
            *(void *)(a2 + v83) = v85;
            v25 |= (unint64_t)(v86 & 0x7F) << v81;
            if (v86 < 0)
            {
              v81 += 7;
              BOOL v15 = v82++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_182;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_182:
        uint64_t v107 = 16LL;
        goto LABEL_196;
      case 0x1Au:
        char v87 = 0;
        unsigned int v88 = 0;
        uint64_t v89 = 0LL;
        *(_WORD *)(a1 + 188) |= 0x2000u;
        while (2)
        {
          uint64_t v90 = *v3;
          uint64_t v91 = *(void *)(a2 + v90);
          unint64_t v92 = v91 + 1;
          if (v91 == -1 || v92 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v93 = *(_BYTE *)(*(void *)(a2 + *v7) + v91);
            *(void *)(a2 + v90) = v92;
            v89 |= (unint64_t)(v93 & 0x7F) << v87;
            if (v93 < 0)
            {
              v87 += 7;
              BOOL v15 = v88++ >= 9;
              if (v15)
              {
                uint64_t v89 = 0LL;
                goto LABEL_186;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v89 = 0LL;
        }
LABEL_186:
        BOOL v108 = v89 != 0;
        uint64_t v109 = 185LL;
        goto LABEL_191;
      case 0x1Bu:
        char v94 = 0;
        unsigned int v95 = 0;
        uint64_t v96 = 0LL;
        *(_WORD *)(a1 + 188) |= 0x1000u;
        while (2)
        {
          uint64_t v97 = *v3;
          uint64_t v98 = *(void *)(a2 + v97);
          unint64_t v99 = v98 + 1;
          if (v98 == -1 || v99 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v100 = *(_BYTE *)(*(void *)(a2 + *v7) + v98);
            *(void *)(a2 + v97) = v99;
            v96 |= (unint64_t)(v100 & 0x7F) << v94;
            if (v100 < 0)
            {
              v94 += 7;
              BOOL v15 = v95++ >= 9;
              if (v15)
              {
                uint64_t v96 = 0LL;
                goto LABEL_190;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v96 = 0LL;
        }
LABEL_190:
        BOOL v108 = v96 != 0;
        uint64_t v109 = 184LL;
LABEL_191:
        *(_BYTE *)(a1 + v109) = v108;
        goto LABEL_197;
      case 0x1Cu:
        char v101 = 0;
        unsigned int v102 = 0;
        uint64_t v25 = 0LL;
        *(_WORD *)(a1 + 188) |= 0x40u;
        while (2)
        {
          uint64_t v103 = *v3;
          uint64_t v104 = *(void *)(a2 + v103);
          unint64_t v105 = v104 + 1;
          if (v104 == -1 || v105 > *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v106 = *(_BYTE *)(*(void *)(a2 + *v7) + v104);
            *(void *)(a2 + v103) = v105;
            v25 |= (unint64_t)(v106 & 0x7F) << v101;
            if (v106 < 0)
            {
              v101 += 7;
              BOOL v15 = v102++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_195;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_195:
        uint64_t v107 = 80LL;
LABEL_196:
        *(_DWORD *)(a1 + v107) = v25;
        goto LABEL_197;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_197;
    }
  }

LABEL_49:
}
}

LABEL_26:
  *(_DWORD *)(v5 + 16_Block_object_dispose(va, 8) = self->_timeToLive;
  *(_WORD *)(v5 + 188) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 112) = self->_mode;
    *(_WORD *)(v5 + 188) |= 0x80u;
  }

LABEL_10:
  uint64_t v18 = -[PPSPBSource copyWithZone:](self->_source, "copyWithZone:", a3);
  uint64_t v19 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v18;

  uint64_t v20 = (__int16)self->_has;
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_deviceCapability;
    *(_WORD *)(v5 + 188) |= 8u;
    uint64_t v20 = (__int16)self->_has;
  }

  if ((v20 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_enabledPopulation;
    *(_WORD *)(v5 + 188) |= 0x20u;
  }

  unint64_t v21 = -[PPSPBRounding copyWithZone:](self->_rounding, "copyWithZone:", a3);
  uint64_t v22 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v21;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 12_Block_object_dispose(va, 8) = self->_obfuscation;
    *(_WORD *)(v5 + 188) |= 0x100u;
  }

  char v23 = -[NSString copyWithZone:](self->_metricDescription, "copyWithZone:", a3);
  unsigned int v24 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v23;

  uint64_t v25 = -[NSString copyWithZone:](self->_exampleValue, "copyWithZone:", a3);
  uint64_t v26 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v25;

  uint64_t v27 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  unint64_t v28 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v27;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_privacyClassification;
    *(_WORD *)(v5 + 188) |= 0x200u;
  }

  char v29 = -[PPSPBEnumMapping copyWithZone:](self->_enumMapping, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v29;

  char v31 = -[PPSPBGroupingDimensions copyWithZone:](self->_groupBy, "copyWithZone:", a3);
  unsigned int v32 = *(void **)(v5 + 88);
  *(void *)(v5 + 8_Block_object_dispose(va, 8) = v31;

  uint64_t v33 = -[PPSPBMetricType copyWithZone:](self->_metricType, "copyWithZone:", a3);
  uint64_t v34 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v33;

  unint64_t v35 = (__int16)self->_has;
  if ((v35 & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_auxiliaryType;
    *(_WORD *)(v5 + 188) |= 2u;
    unint64_t v35 = (__int16)self->_has;
    if ((v35 & 0x2000) == 0)
    {
LABEL_20:
      if ((v35 & 0x1000) == 0) {
        goto LABEL_21;
      }
LABEL_30:
      *(_BYTE *)(v5 + 184) = self->_dmaCompliant;
      *(_WORD *)(v5 + 188) |= 0x1000u;
      if ((*(_WORD *)&self->_has & 0x40) == 0) {
        return (id)v5;
      }
      goto LABEL_22;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_20;
  }

  *(_BYTE *)(v5 + 185) = self->_filterEntryLogging;
  *(_WORD *)(v5 + 188) |= 0x2000u;
  unint64_t v35 = (__int16)self->_has;
  if ((v35 & 0x1000) != 0) {
    goto LABEL_30;
  }
LABEL_21:
  if ((v35 & 0x40) != 0)
  {
LABEL_22:
    *(_DWORD *)(v5 + 80) = self->_fixedArraySize;
    *(_WORD *)(v5 + 188) |= 0x40u;
  }

  return (id)v5;
}

LABEL_106:
    uint64_t v25 = 0;
    goto LABEL_107;
  }

  if ((*((_WORD *)v4 + 94) & 0x1000) != 0) {
    goto LABEL_106;
  }
LABEL_101:
  if ((v23 & 0x40) != 0)
  {
    if ((v24 & 0x40) == 0 || self->_fixedArraySize != *((_DWORD *)v4 + 20)) {
      goto LABEL_106;
    }
    uint64_t v25 = 1;
  }

  else
  {
    uint64_t v25 = (v24 & 0x40) == 0;
  }

LABEL_107:
  return v25;
}

LABEL_33:
  self->_timeToLive = *((_DWORD *)v4 + 42);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 94) & 0x80) != 0)
  {
LABEL_27:
    self->_mode = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 0x80u;
  }

LABEL_28:
  source = self->_source;
  uint64_t v12 = *((void *)v4 + 18);
  if (source)
  {
    if (!v12) {
      goto LABEL_38;
    }
    -[PPSPBSource mergeFrom:](source, "mergeFrom:");
  }

  else
  {
    if (!v12) {
      goto LABEL_38;
    }
    -[PPSPBMetric setSource:](self, "setSource:");
  }

  int v4 = v23;
LABEL_38:
  unint64_t v13 = *((_WORD *)v4 + 94);
  if ((v13 & 8) != 0)
  {
    self->_deviceCapability = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 8u;
    unint64_t v13 = *((_WORD *)v4 + 94);
  }

  if ((v13 & 0x20) != 0)
  {
    self->_enabledPopulation = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x20u;
  }

  rounding = self->_rounding;
  BOOL v15 = *((void *)v4 + 17);
  if (rounding)
  {
    if (!v15) {
      goto LABEL_48;
    }
    -[PPSPBRounding mergeFrom:](rounding, "mergeFrom:");
  }

  else
  {
    if (!v15) {
      goto LABEL_48;
    }
    -[PPSPBMetric setRounding:](self, "setRounding:");
  }

  int v4 = v23;
LABEL_48:
  if ((*((_WORD *)v4 + 94) & 0x100) != 0)
  {
    self->_obfuscation = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_has |= 0x100u;
  }

  if (*((void *)v4 + 12))
  {
    -[PPSPBMetric setMetricDescription:](self, "setMetricDescription:");
    int v4 = v23;
  }

  if (*((void *)v4 + 9))
  {
    -[PPSPBMetric setExampleValue:](self, "setExampleValue:");
    int v4 = v23;
  }

  if (*((void *)v4 + 3))
  {
    -[PPSPBMetric setBuild:](self, "setBuild:");
    int v4 = v23;
  }

  if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
    self->_privacyClassification = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_has |= 0x200u;
  }

  enumMapping = self->_enumMapping;
  char v17 = *((void *)v4 + 8);
  if (enumMapping)
  {
    if (!v17) {
      goto LABEL_64;
    }
    -[PPSPBEnumMapping mergeFrom:](enumMapping, "mergeFrom:");
  }

  else
  {
    if (!v17) {
      goto LABEL_64;
    }
    -[PPSPBMetric setEnumMapping:](self, "setEnumMapping:");
  }

  int v4 = v23;
LABEL_64:
  groupBy = self->_groupBy;
  uint64_t v19 = *((void *)v4 + 11);
  if (groupBy)
  {
    if (!v19) {
      goto LABEL_70;
    }
    -[PPSPBGroupingDimensions mergeFrom:](groupBy, "mergeFrom:");
  }

  else
  {
    if (!v19) {
      goto LABEL_70;
    }
    -[PPSPBMetric setGroupBy:](self, "setGroupBy:");
  }

  int v4 = v23;
LABEL_70:
  metricType = self->_metricType;
  unint64_t v21 = *((void *)v4 + 13);
  if (metricType)
  {
    if (!v21) {
      goto LABEL_76;
    }
    -[PPSPBMetricType mergeFrom:](metricType, "mergeFrom:");
  }

  else
  {
    if (!v21) {
      goto LABEL_76;
    }
    -[PPSPBMetric setMetricType:](self, "setMetricType:");
  }

  int v4 = v23;
LABEL_76:
  uint64_t v22 = *((_WORD *)v4 + 94);
  if ((v22 & 2) != 0)
  {
    self->_auxiliaryType = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
    uint64_t v22 = *((_WORD *)v4 + 94);
    if ((v22 & 0x2000) == 0)
    {
LABEL_78:
      if ((v22 & 0x1000) == 0) {
        goto LABEL_79;
      }
LABEL_84:
      self->_dmaCompliant = *((_BYTE *)v4 + 184);
      *(_WORD *)&self->_has |= 0x1000u;
      if ((*((_WORD *)v4 + 94) & 0x40) == 0) {
        goto LABEL_81;
      }
      goto LABEL_80;
    }
  }

  else if ((*((_WORD *)v4 + 94) & 0x2000) == 0)
  {
    goto LABEL_78;
  }

  self->_filterEntryLogging = *((_BYTE *)v4 + 185);
  *(_WORD *)&self->_has |= 0x2000u;
  uint64_t v22 = *((_WORD *)v4 + 94);
  if ((v22 & 0x1000) != 0) {
    goto LABEL_84;
  }
LABEL_79:
  if ((v22 & 0x40) != 0)
  {
LABEL_80:
    self->_fixedArraySize = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x40u;
  }

LABEL_81:
}

uint64_t PPSPBMetricStreamReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x189611CF0];
  int v4 = (int *)MEMORY[0x189611CE8];
  int v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 24) |= 1u;
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7LL && v20 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v20 + 8;
        }

        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          uint64_t v21 = 0LL;
        }

        *(void *)(a1 + _Block_object_dispose(va, 8) = v21;
      }

      else if ((v10 >> 3) == 1)
      {
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___PPSPBMetricHistory);
        [(id)a1 addMetricHistory:v18];
        if (!PBReaderPlaceMark() || (PPSPBMetricHistoryReadFrom(v18, a2) & 1) == 0)
        {

          return 0LL;
        }

        PBReaderRecallMark();
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

LABEL_8:
    v6 = 0;
  }

LABEL_9:
  return v6;
}

void performStatement_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void performStatement_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x189611CF8]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x189611D08]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x189611D10]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x189611D20]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x189611D28]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x189611D30]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x189611D38]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x189611D40]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x189611D50]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x189611D58]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x189611D60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x189616488](cls, outCount);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1895FA9D8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

double fmod(double a1, double a2)
{
  return result;
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerateClasses( const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x189616A00](property);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x189617120](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x189617130](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617138](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617140](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617158](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x189617160](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x189617178](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617180](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1896171C8](a1);
}

int sqlite3_exec( sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1896171D8](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617200](pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x189617260](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x189617270](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_sleep(int a1)
{
  return MEMORY[0x1896172C0](*(void *)&a1);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x189617300](a1);
}

uint64_t objc_msgSend_initWithName_subsystem_category_version_datatype_unit_cadence_directionality_storage_timeToLive_mode_deviceCapability_population_obfuscation_privacyClassification_optionalPayload_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithName_subsystem_category_version_datatype_unit_cadence_directionality_storage_timeToLive_mode_deviceCapability_population_obfuscation_privacyClassification_optionalPayload_);
}