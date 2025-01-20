LABEL_11:
    v7 = v5;
    return v7;
  }

  if (!a4)
  {
    v4 = &gPQLEmpty;
    if (!a3) {
      v4 = &gPQLNULL;
    }
    v5 = (void *)*v4;
    goto LABEL_11;
  }

LABEL_9:
  v7 = -[PQLRawInjection initWithUTF8String:length:]( objc_alloc(&OBJC_CLASS___PQLRawInjection),  "initWithUTF8String:length:",  a3,  a4);
  return v7;
}

  return v12;
}

LABEL_56:
              [MEMORY[0x189603F70] raise:v52, @"cannot compile statement [%@] around [...%.10s...]", v8, v10 format];
              break;
            }

            if (!memchr("udi", v10[3], 4uLL)) {
              goto LABEL_56;
            }
            v47 = v56;
            v56 += 8;
            [MEMORY[0x189607968] numberWithLongLong:*(void *)v47];
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            [v6 addObject:v48];

            v13 = v10 + 4;
            break;
          case 'p':
            v24 = v56;
            v56 += 8;
            v18 = [MEMORY[0x189607968] numberWithLongLong:*(void *)v24];
            goto LABEL_31;
          case 's':
            v25 = objc_alloc(NSString);
            v26 = v56;
            v56 += 8;
            v27 = [v25 initWithUTF8String:*(void *)v26];

            [v6 addObject:v27];
            v13 = v10 + 2;
            goto LABEL_53;
          case 'u':
            v28 = (unsigned int *)v56;
            v56 += 8;
            v18 = [MEMORY[0x189607968] numberWithUnsignedInt:*v28];
            goto LABEL_31;
          default:
            goto LABEL_56;
        }
      }

  [v9 appendBytes:"" length:1];
  v37 = self->_specLength;
  if (v37 < 9)
  {
    memcpy(&self->_specUnion, __src, self->_specLength);
    LOWORD(v37) = self->_specLength;
  }

  else
  {
    v38 = (unsigned __int8 *)malloc((unsigned __int16)self->_specLength);
    if (!v38) {
LABEL_61:
    }
      abort();
    v39 = v38;
    memcpy(v38, __src, (unsigned __int16)v37);
    self->_specUnion.ptr = v39;
  }

  [v9 appendBytes:__src length:(__int16)v37];

  return v9;
}

LABEL_33:
      v30 = strcspn(v13, "%");
      [v8 appendBytes:v13 length:v30];
      v10 = &v13[v30];
      if (!v13[v30]) {
        goto LABEL_58;
      }
    }

    v14 = (id *)v56;
    v56 += 8;
    v11 = *v14;
    if ([*v14 conformsToProtocol:&unk_18C72ED98])
    {
      [v11 sql];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 appendData:v15];
    }

    else
    {
      [v8 appendBytes:"?" length:1];
    }

    goto LABEL_12;
  }

  v55 = 0LL;
LABEL_58:
  v49 = -[PQLNameInjectionBase initWithData:](self, "initWithData:", v8);
  v50 = v49;
  if (v49) {
    objc_storeStrong((id *)&v49->_binds, v6);
  }

  return v50;
}

          v13 = 0LL;
          v10 = v11;
LABEL_34:

          if (++v9 >= self->_specLength) {
            goto LABEL_35;
          }
          continue;
        case 5u:
          v24 = a3;
          v23 = *(_DWORD *)a3;
          a3 += 16;
          v25 = (const char *)*((void *)v24 + 1);
          v21 = self->_stmt;
          v11 = (v10 + 1);
          if (v25) {
            v20 = v25;
          }
          else {
            v20 = "";
          }
          v22 = v10;
          goto LABEL_23;
        case 6u:
          v26 = a3;
          v27 = *(_DWORD *)a3;
          a3 += 16;
          v28 = (const char *)*((void *)v26 + 1);
          v11 = (v10 + 1);
          if (v28) {
            v29 = v28;
          }
          else {
            v29 = "";
          }
          sqlite3_bind_blob(self->_stmt, v10, v29, v27, 0LL);
          goto LABEL_33;
        case 7u:
          v11 = (v10 + 1);
          v30 = a3;
          a3 += 8;
          pql_bind_object(self->_stmt, v10, *(void **)v30);
          goto LABEL_33;
        case 8u:
          v31 = a3;
          a3 += 8;
          v13 = *(id *)v31;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            [v13 bindValuesToKeepAlive];
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[PQLStatement keepBindAlive:](self, "keepBindAlive:", v32);
          }

          goto LABEL_34;
        case 9u:
          v33 = a3;
          a3 += 8;
          v34 = (void *)[*(id *)v33 copy];
          -[PQLStatement keepBindAlive:](self, "keepBindAlive:", v34);
          v11 = (v10 + 1);
          pql_sqlite3_bind_pointer(self->_stmt, v10, (sqlite3_int64)v34);

          goto LABEL_33;
        default:
          v13 = 0LL;
          goto LABEL_34;
      }
    }
  }

  self->_inUse = 1;
  if (specLength >= 1)
  {
    ptr = &self->_specUnion;
    goto LABEL_9;
  }

void _pql_log_init()
{
  os_log_t v0 = os_log_create("com.apple.prequelite", "default");
  v1 = (void *)pql_log;
  pql_log = (uint64_t)v0;
}

sqlite3_int64 pql_sqlite3_value_pointer(sqlite3_value *a1)
{
  if (sqlite3_value_type(a1) == 1) {
    return sqlite3_value_int64(a1);
  }
  else {
    return 0LL;
  }
}

id pql_sqlite3_value_object(sqlite3_value *a1)
{
  if (sqlite3_value_type(a1) == 1) {
    id v2 = (id)sqlite3_value_int64(a1);
  }
  else {
    id v2 = 0LL;
  }
  return v2;
}

void _bind_archived_object(sqlite3_stmt *a1, int a2, void *a3)
{
  id v8 = a3;
  v5 = (void *)MEMORY[0x1895CF1AC]();
  v6 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
  [v6 encodeObject:v8 forKey:*MEMORY[0x1896075C8]];
  id v7 = [v6 encodedData];
  sqlite3_bind_blob( a1,  a2,  (const void *)[v7 bytes],  objc_msgSend(v7, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v5);
}

double timeInSeconds(unint64_t a1)
{
  if (timeInSeconds_once != -1) {
    dispatch_once(&timeInSeconds_once, &__block_literal_global);
  }
  return *(double *)&timeInSeconds_factor * (double)a1;
}

double __timeInSeconds_block_invoke()
{
  mach_timebase_info info = 0LL;
  mach_timebase_info(&info);
  if (info.denom)
  {
    LODWORD(result) = info.numer;
    double result = (double)*(unint64_t *)&result / (double)info.denom / 1000000000.0;
    timeInSeconds_factor = *(void *)&result;
  }

  return result;
}
}

void sub_18895DFE4(_Unwind_Exception *a1)
{
}

BOOL __PQLCacheKeyEqual(const void *a1, const void *a2)
{
  return CFEqual(a1, a2) != 0;
}

CFTypeRef __PQLCacheKeyRetain(const void *a1, void *a2)
{
  CFTypeRef result = CFRetain(a1);
  *a2 = result;
  return result;
}

void __PQLCacheValueRelease(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = *((id *)v3 + 14);
  id v5 = a1;
  if (([v3 isTraced] & 1) != 0 || objc_msgSend(v5, "isTraced"))
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    v6 = (void *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      id v7 = v6;
      int v11 = 138412546;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2048;
      id v14 = v5;
      id v8 = v12;
      _os_log_impl(&dword_18895A000, v7, OS_LOG_TYPE_DEBUG, "uncaching: <%@:%p>", (uint8_t *)&v11, 0x16u);
    }
  }

  id v9 = v4;
  objc_sync_enter(v9);
  [v9 addObject:v5];
  CFRelease(v5);

  objc_sync_exit(v9);
  v10 = (dispatch_source_s *)*((void *)v3 + 13);
  if (v10)
  {
    if (!v9) {
      __PQLCacheValueRelease_cold_1();
    }
    dispatch_source_merge_data(v10, 1uLL);
  }
}

void sub_18895E304(_Unwind_Exception *a1)
{
}

LABEL_8:
}

void sub_1889608AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_188960A40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t db_trace(char a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  if ((a1 & 1) != 0)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
    }
    id v7 = (os_log_s *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2080;
      uint64_t v12 = a4;
      _os_log_impl(&dword_18895A000, v7, OS_LOG_TYPE_DEBUG, "connection:%@ sql:'%s'", (uint8_t *)&v9, 0x16u);
    }
  }

  return 0LL;
}

void sub_188960C38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t __PQLBusyHandlerFunction(void *a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x1895CF1AC]();
  id v5 = a1;
  [v5 lockedHandler];
  id v6 = (uint64_t (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    [MEMORY[0x189607870] errorWithSqliteCode:5 andMessage:@"busy handler called"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = ((uint64_t (**)(void, id, void, void *))v6)[2](v6, v5, 0LL, v7);
  }

  else
  {
    uint64_t v9 = [v5 busyHandler];
    id v7 = (void *)v9;
    if (!v9)
    {
      uint64_t v10 = 0LL;
      goto LABEL_6;
    }

    uint64_t v8 = (*(uint64_t (**)(uint64_t, id, uint64_t))(v9 + 16))(v9, v5, a2);
  }

  uint64_t v10 = v8;
LABEL_6:

  objc_autoreleasePoolPop(v4);
  return v10;
}

LABEL_13:
  --self->_suspendCaching;
LABEL_14:

  return v10;
}

uint64_t pql_invoke_xfunc(sqlite3_context *a1, uint64_t a2, uint64_t a3)
{
  id v6 = (uint64_t (**)(void *, sqlite3_context *, uint64_t, uint64_t))sqlite3_user_data(a1);
  return v6[2](v6, a1, a2, a3);
}

LABEL_20:
  [v8 unbindForDB:self returnedRows:0 executionTime:mach_absolute_time() - self->_currentStmtStart preparationTime:a5];
  self->_currentStmtStart = 0LL;
  if (!self->_useBatching && !self->_savePointLevel && (self->_vacuumTracker & 0x80000000) == 0)
  {
    v20 = -[PQLConnection changes](self, "changes");
    -[PQLConnection _vacuumIfNeeded](self, "_vacuumIfNeeded");
    self->_changesOverride = v20;
  }

  uint64_t v13 = v11 == 101;
LABEL_25:

  return v13;
}

      uint64_t v13 = v11 + 2;
LABEL_21:
      v25 = strcspn(v13, "%");
      [v9 appendBytes:v13 length:v25];
      __int16 v11 = &v13[v25];
      if (!v13[v25]) {
        goto LABEL_56;
      }
    }

    uint64_t v13 = v11 + 2;
    id v14 = v9;
    uint64_t v15 = "%";
LABEL_5:
    [v14 appendBytes:v15 length:1];
    goto LABEL_21;
  }

LABEL_14:
  return v9;
}

LABEL_17:
    -[PQLResultSet close](self, "close");
LABEL_18:
    uint64_t v9 = 0;
    goto LABEL_19;
  }

  ++self->_rowNumber;
  uint64_t v9 = 1;
LABEL_19:

  return v9;
}

id __createObjectFromResultSetWithSel_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!*(void *)(a1 + 40) && [*(id *)(a1 + 32) columns] == 1)
  {
    id v6 = (unsigned __int8 *)*(id *)(a1 + 32);
    id v7 = v6;
    if (*((void *)v6 + 2))
    {
      int v8 = v6[32];

      if (!v8) {
        goto LABEL_10;
      }
LABEL_9:
      uint64_t v10 = [v5 objectOfClass:*(void *)(a1 + 48) atIndex:0];
      goto LABEL_14;
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {

      goto LABEL_9;
    }

    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0) {
      goto LABEL_9;
    }
  }

LABEL_10:
  if (*(void *)(a1 + 40)) {
    __int16 v11 = *(const char **)(a1 + 40);
  }
  else {
    __int16 v11 = sel_initFromPQLResultSet_error_;
  }
  IMP MethodImplementation = class_getMethodImplementation(*(Class *)(a1 + 48), v11);
  uint64_t v10 = (uint64_t)MethodImplementation(objc_alloc(*(Class *)(a1 + 48)), *(SEL *)(a1 + 40), v5, a3);
LABEL_14:
  uint64_t v13 = (void *)v10;

  return v13;
}

void ___defaultAllowedClasses_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  id v6 = (void *)_defaultAllowedClasses_allowedClasses;
  _defaultAllowedClasses_allowedClasses = v5;
}

LABEL_45:
        uint64_t v13 = v11 + 4;
        goto LABEL_21;
      }

      if (v21 <= 64)
      {
        if (v21 == 42)
        {
          if (memchr("sp", v11[2], 3uLL))
          {
            a5 += 16;
            v30 = self->_specLength;
            if (v11[2] == 115) {
              v31 = 5;
            }
            else {
              v31 = 6;
            }
            __src[v30] = v31;
            self->_specLength = v30 + 1;
LABEL_38:
            uint64_t v13 = v11 + 3;
            goto LABEL_21;
          }

LABEL_55:
          [MEMORY[0x189603F70] raise:v41, @"cannot compile statement [%@] around [...%.10s...]", v7, v11 format];
          goto LABEL_21;
        }

        if (v21 == 46)
        {
          if (v11[2] != 42 || !memchr("sp", v11[3], 3uLL)) {
            goto LABEL_55;
          }
          a5 += 16;
          v32 = self->_specLength;
          if (v11[3] == 115) {
            v33 = 5;
          }
          else {
            v33 = 6;
          }
          __src[v32] = v33;
          self->_specLength = v32 + 1;
          goto LABEL_45;
        }

        if (v21 != 64) {
          goto LABEL_55;
        }
        v26 = self->_specLength;
        self->_specLength = v26 + 1;
        v27 = 7;
LABEL_30:
        __src[v26] = v27;
      }

      else
      {
LABEL_18:
        a5 += 8;
        v23 = self->_specLength;
        self->_specLength = v23 + 1;
        v24 = 3;
LABEL_19:
        __src[v23] = v24;
      }

LABEL_27:
      if (!v25)
      {
        if (!-[PQLStatement _prepare:withDB:preparationTime:]( v15,  "_prepare:withDB:preparationTime:",  [v17 bytes],  v13,  a7))
        {
          v16 = 0LL;
LABEL_51:

          goto LABEL_52;
        }

        if (a6)
        {
          v26 = v35 ? v17 : v12;
          if (!cache_set_and_retain(a6, v26, v15, 0LL))
          {
            if (v15->_isTraced)
            {
              if (pql_pred != -1) {
                dispatch_once_f(&pql_pred, 0LL, (dispatch_function_t)_pql_log_init);
              }
              v27 = (os_log_s *)pql_log;
              if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                if (v35) {
                  v28 = "";
                }
                else {
                  v28 = "out";
                }
                v39 = v28;
                v40 = 2112;
                v41 = v12;
                v42 = 2112;
                v43 = v15;
                _os_log_impl( &dword_18895A000,  v27,  OS_LOG_TYPE_DEBUG,  "cached statement with%s injections\nsql:  %@\nstmt: %@",  buf,  0x20u);
              }
            }

            cache_release_value(a6, v15);
          }
        }

        v25 = v15;
      }

      if (v25->_inUse)
      {
        while (1)
        {
          next = v25->_next;
          if (!next) {
            break;
          }
          v16 = next;

          v25 = v16;
          if (!v16->_inUse) {
            goto LABEL_50;
          }
        }

        v30 = -[PQLStatement initWithStatement:forDB:preparationTime:]( objc_alloc(&OBJC_CLASS___PQLStatement),  "initWithStatement:forDB:preparationTime:",  v25,  v13,  a7);
        v31 = v25->_next;
        v25->_next = v30;

        v16 = v30;
      }

      else
      {
        v16 = v25;
      }

LABEL_50:
      -[PQLStatement bindArguments:db:](v16, "bindArguments:db:", v37, v13);
      goto LABEL_51;
    }

LABEL_26:
    v25 = (PQLStatement *)v23;
    goto LABEL_27;
  }

  v16 = 0LL;
LABEL_52:

  return v16;
}

LABEL_35:
}

void pql_bind_object(sqlite3_stmt *a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      [v9 sqliteBind:a1 index:a2];
    }

    else if ([v9 conformsToProtocol:&unk_18C72E958])
    {
      uint64_t v5 = (void *)MEMORY[0x1895CF1AC]();
      id v6 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
      [v6 encodeObject:v9 forKey:*MEMORY[0x1896075C8]];
      id v7 = [v6 encodedData];
      sqlite3_bind_blob( a1,  a2,  (const void *)[v7 bytes],  objc_msgSend(v7, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      objc_autoreleasePoolPop(v5);
    }

    else
    {
      id v8 = [v9 description];
      sqlite3_bind_text( a1,  a2,  (const char *)[v8 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
  }

  else
  {
    sqlite3_bind_null(a1, a2);
  }
}

LABEL_36:
    -[PQLStatement bindFromArray:db:](v19, "bindFromArray:db:", v14->_parameters, v11);
    goto LABEL_37;
  }

  v19 = 0LL;
LABEL_38:

  return v19;
}

void __PQLCacheValueRelease_cold_1()
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x189602D50](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_db_clone()
{
  return MEMORY[0x1896170A8]();
}

void abort(void)
{
}

int cache_create(const char *name, const cache_attributes_t *attrs, cache_t **cache_out)
{
  return MEMORY[0x1895F9680](name, attrs, cache_out);
}

int cache_destroy(cache_t *cache)
{
  return MEMORY[0x1895F9688](cache);
}

int cache_get_and_retain(cache_t *cache, void *key, void **value_out)
{
  return MEMORY[0x1895F9698](cache, key, value_out);
}

uint64_t cache_get_count_hint()
{
  return MEMORY[0x1895F96A8]();
}

uint64_t cache_get_name()
{
  return MEMORY[0x1895F96B8]();
}

int cache_release_value(cache_t *cache, void *value)
{
  return MEMORY[0x1895F96C8](cache, value);
}

int cache_remove_all(cache_t *cache)
{
  return MEMORY[0x1895F96D8](cache);
}

int cache_set_and_retain(cache_t *cache, void *key, void *value, cache_cost_t cost)
{
  return MEMORY[0x1895F96E8](cache, key, value, cost);
}

uint64_t cache_set_count_hint()
{
  return MEMORY[0x1895F96F8]();
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1896164C8](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class( dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, unint64_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x189616A48](sel);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1896170C0](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1896170D8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1896170E0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1896170E8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1896170F0](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1896170F8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x189617100](a1, a2, a3);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x189617110](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x189617118](a1);
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

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617150](a1, *(void *)&iCol);
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

sqlite3_value *__cdecl sqlite3_column_value(sqlite3_stmt *a1, int iCol)
{
  return (sqlite3_value *)MEMORY[0x189617188](a1, *(void *)&iCol);
}

int sqlite3_create_function_v2( sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1896171A0](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1896171C0](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1896171C8](a1);
}

int sqlite3_exec( sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1896171D8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1896171E8](db);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1896171F8](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617200](pStmt);
}

int sqlite3_get_autocommit(sqlite3 *a1)
{
  return MEMORY[0x189617210](a1);
}

int sqlite3_initialize(void)
{
  return MEMORY[0x189617218]();
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x189617238](a1);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x189617250](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x189617260](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x189617270](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617288](pStmt);
}

int sqlite3_sleep(int a1)
{
  return MEMORY[0x1896172C0](*(void *)&a1);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1896172F0](pStmt);
}

int sqlite3_status(int op, int *pCurrent, int *pHighwater, int resetFlag)
{
  return MEMORY[0x1896172F8](*(void *)&op, pCurrent, pHighwater, *(void *)&resetFlag);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x189617300](a1);
}

int sqlite3_stmt_busy(sqlite3_stmt *a1)
{
  return MEMORY[0x189617308](a1);
}

int sqlite3_stmt_status(sqlite3_stmt *a1, int op, int resetFlg)
{
  return MEMORY[0x189617310](a1, *(void *)&op, *(void *)&resetFlg);
}

int sqlite3_total_changes(sqlite3 *a1)
{
  return MEMORY[0x189617320](a1);
}

int sqlite3_trace_v2( sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return MEMORY[0x189617328](a1, *(void *)&uMask, xCallback, pCtx);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x189617330](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x189617338](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x189617340](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  return result;
}

sqlite3_value *__cdecl sqlite3_value_dup(const sqlite3_value *a1)
{
  return (sqlite3_value *)MEMORY[0x189617350](a1);
}

void sqlite3_value_free(sqlite3_value *a1)
{
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x189617368](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x189617370](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x189617378](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x189617380](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD070](__s, __charset);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}