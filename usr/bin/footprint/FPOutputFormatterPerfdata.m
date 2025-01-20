@interface FPOutputFormatterPerfdata
- (void)close;
- (void)endAtTime:(id)a3;
- (void)printGlobalAuxData:(id)a3;
- (void)printProcessAuxData:(id)a3 forProcess:(id)a4;
- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5;
- (void)printProcessHeader:(id)a3;
- (void)printProcessTotal:(id)a3 forProcess:(id)a4;
- (void)printSharedCache:(id)a3 categories:(id)a4 sharedWith:(id)a5 total:(id *)a6;
- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7;
- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5;
- (void)startAtTime:(id)a3;
@end

@implementation FPOutputFormatterPerfdata

- (void)startAtTime:(id)a3
{
}

- (void)printProcessHeader:(id)a3
{
}

- (void)printProcessTotal:(id)a3 forProcess:(id)a4
{
  writer = self->_writer;
  uint64_t v7 = pdunit_B;
  id v8 = a4;
  pdwriter_new_value(writer, "total_memory", v7, (double)(unint64_t)[a3 unsignedLongLongValue]);
  v9 = self->_writer;
  id v10 = objc_claimAutoreleasedReturnValue([v8 name]);
  pdwriter_record_variable_str(v9, "process", [v10 UTF8String]);

  v11 = self->_writer;
  id v12 = objc_claimAutoreleasedReturnValue([v8 name]);
  pdwriter_record_variable_str(v11, "procname", [v12 UTF8String]);

  LODWORD(v11) = [v8 pid];
  snprintf(__str, 0xBuLL, "%d", (_DWORD)v11);
  pdwriter_record_label_str(self->_writer, "pid", __str);
  pdwriter_record_tag(self->_writer, pdtag_summary);
}

- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5
{
  id v10 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  currentProcessTotals = self->_currentProcessTotals;
  self->_currentProcessTotals = v6;

  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  currentProcessAuxDatas = self->_currentProcessAuxDatas;
  self->_currentProcessAuxDatas = v8;

  sub_100019560((uint64_t)self, v10);
}

- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7
{
}

- (void)printSharedCache:(id)a3 categories:(id)a4 sharedWith:(id)a5 total:(id *)a6
{
}

- (void)printProcessAuxData:(id)a3 forProcess:(id)a4
{
  id v24 = a3;
  id v6 = objc_claimAutoreleasedReturnValue([a4 name]);
  id v7 = [v6 UTF8String];

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  obj = self->_currentProcessTotals;
  id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v26 = *(void *)v28;
    uint64_t v10 = pdunit_B;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v28 != v26) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_currentProcessTotals,  "objectForKeyedSubscript:",  v12));
        uint64_t v14 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_currentProcessAuxDatas,  "objectForKeyedSubscript:",  v12));
        v15 = (void **)v14;
        writer = self->_writer;
        if (v14) {
          v17 = *(void **)(v14 + 16);
        }
        else {
          v17 = 0LL;
        }
        if (v17) {
          v18 = v17;
        }
        else {
          v18 = v12;
        }
        id v19 = v18;
        id v20 = v17;
        pdwriter_new_value( writer,  [v19 UTF8String],  v10,  (double)(unint64_t)[v13 unsignedLongLongValue]);

        pdwriter_record_variable_str(self->_writer, "process", v7);
        pdwriter_record_variable_str(self->_writer, "procname", v7);
        if (v15) {
          sub_1000199FC((uint64_t)self, v15[1], 0LL);
        }

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
      id v9 = v21;
    }

    while (v21);
  }

  currentProcessTotals = self->_currentProcessTotals;
  self->_currentProcessTotals = 0LL;

  currentProcessAuxDatas = self->_currentProcessAuxDatas;
  self->_currentProcessAuxDatas = 0LL;

  sub_100019BCC((uint64_t)self, v24, "aux_data", (uint64_t)v7);
}

- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5
{
  id v8 = a3;
  pdwriter_new_group(self->_writer, v9, v10);
  uint64_t v22 = pdunit_B;
  pdwriter_new_value(self->_writer, "total_memory", pdunit_B, (double)(a4->var1 + a4->var0));
  pdwriter_record_variable_str(self->_writer, "process", "ALL_PROCESSES");
  pdwriter_record_variable_str(self->_writer, "procname", "ALL_PROCESSES");
  pdwriter_record_tag(self->_writer, pdtag_summary);
  if (v8)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id obj = v8;
    id v23 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (!v23) {
      goto LABEL_18;
    }
    uint64_t v21 = *(void *)v26;
    while (1)
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(obj);
        }
        id v12 = (id *)objc_claimAutoreleasedReturnValue( [obj objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * (void)i)]);
        v13 = sub_10001D850(v12);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          v15 = sub_10001D8D8((uint64_t)v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          writer = self->_writer;
          if (v16)
          {
            v18 = v16;
            int v19 = 0;
            goto LABEL_12;
          }
        }

        else
        {
          writer = self->_writer;
        }

        id v20 = sub_10001D81C((uint64_t)v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v5 = v16;
        v18 = 0LL;
        int v19 = 1;
LABEL_12:
        pdwriter_new_value( writer, [v16 UTF8String], v22, (double)((unint64_t)objc_msgSend(v12, "totalDirtySize")
                 + (unint64_t)[v12 totalSwappedSize]));
        if (v19) {

        }
        pdwriter_record_variable_str(self->_writer, "process", "ALL_PROCESSES");
        pdwriter_record_variable_str(self->_writer, "procname", "ALL_PROCESSES");
        if (v14) {
          sub_1000199FC((uint64_t)self, v14, 0LL);
        }
      }

      id v23 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (!v23)
      {
LABEL_18:

        break;
      }
    }
  }
}

- (void)printGlobalAuxData:(id)a3
{
}

- (void)endAtTime:(id)a3
{
  writer = self->_writer;
  uint64_t v5 = pdunit_ms;
  unint64_t v6 = sub_100019208((unint64_t)a3);
  unint64_t v7 = sub_100019208((unint64_t)self->_startTime);
  pdwriter_new_value(writer, "gather_duration", v5, (double)((v6 - v7) / 0xF4240));
  pdwriter_record_tag(self->_writer, pdtag_context);
}

- (void)close
{
  self->_writer = 0LL;
}

- (void).cxx_destruct
{
}

@end