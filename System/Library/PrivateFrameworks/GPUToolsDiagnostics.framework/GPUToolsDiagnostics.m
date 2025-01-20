_UNKNOWN **GPUTools::Diag::SwizzleMTLTracker::GetCallstackFromStore( GPUTools::Diag::SwizzleMTLTracker *this, uint64_t a2, GPUTools::Diag::BacktraceStore *a3)
{
  NSData *v6;
  uint64_t v7;
  _UNKNOWN **result;
  _BYTE v9[4096];
  unsigned int v10;
  v6 = objc_opt_new(&OBJC_CLASS___NSData);
  GPUTools::Diag::BacktraceStore::RemoveBacktrace((GPUTools::Diag::BacktraceStore *)v9, (uint64_t)a3, a2);
  if (v10)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v9, 512LL));

    result = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
    v6 = (NSData *)v7;
  }

  else
  {
    result = &off_22928;
  }

  *(void *)this = v6;
  *((void *)this + 1) = result;
  return result;
}

void sub_1E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( void *a1, unint64_t a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8(v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a2;
    if (*(void *)&v2 <= a2) {
      unint64_t v4 = a2 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v4 = (*(void *)&v2 - 1LL) & a2;
  }

  v5 = *(void **)(*a1 + 8 * v4);
  if (!v5) {
    return 0LL;
  }
  result = (void *)*v5;
  if (*v5)
  {
    do
    {
      unint64_t v7 = result[1];
      if (v7 == a2)
      {
        if (result[2] == a2) {
          return result;
        }
      }

      else
      {
        if (v3.u32[0] > 1uLL)
        {
          if (v7 >= *(void *)&v2) {
            v7 %= *(void *)&v2;
          }
        }

        else
        {
          v7 &= *(void *)&v2 - 1LL;
        }

        if (v7 != v4) {
          return 0LL;
        }
      }

      result = (void *)*result;
    }

    while (result);
  }

  return result;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,void *>>>::operator()[abi:nn180100]( char a1, void *__p)
{
  if (a1)
  {
    uint8x8_t v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void GPUTools::Diag::SwizzleMTLTracker::CompletionHandler(void *a1)
{
  id v153 = a1;
  id v2 = [v153 globalTraceObjectID];
  v149 = (void *)GPUTools::Diag::SwizzleMTLTracker::Tracker;
  GPUTools::Diag::SwizzleMTLTracker::GetCallstackFromStore( (GPUTools::Diag::SwizzleMTLTracker *)&v195,  (uint64_t)v2,  (GPUTools::Diag::BacktraceStore *)(GPUTools::Diag::SwizzleMTLTracker::Tracker + 240));
  unint64_t v148 = (unint64_t)v2;
  if ((objc_opt_respondsToSelector(v153, "logs") & 1) != 0)
  {
    __int128 v193 = 0u;
    __int128 v194 = 0u;
    __int128 v191 = 0u;
    __int128 v192 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v153 logs]);
    id v163 = [obj countByEnumeratingWithState:&v191 objects:v209 count:16];
    if (v163)
    {
      uint64_t v161 = *(void *)v192;
      id v150 = v196;
      id v151 = v195;
      do
      {
        v179 = 0LL;
        do
        {
          if (*(void *)v192 != v161) {
            objc_enumerationMutation(obj);
          }
          uint8x8_t v3 = *(void **)(*((void *)&v191 + 1) + 8LL * (void)v179);
          if ([v3 conformsToProtocol:&OBJC_PROTOCOL___MTLFunctionLog])
          {
            id v181 = v3;
            id v159 = v153;
            id v173 = v151;
            id v175 = v150;
            v187 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            v189 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            v185 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            unint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            id v5 = v181;
            __int128 v205 = 0u;
            __int128 v206 = 0u;
            __int128 v207 = 0u;
            __int128 v208 = 0u;
            id v182 = v5;
            v6 = (void *)objc_claimAutoreleasedReturnValue([v5 errorStackTrace]);
            id v7 = [v6 countByEnumeratingWithState:&v205 objects:v219 count:16];
            if (v7)
            {
              uint64_t v8 = *(void *)v206;
              do
              {
                for (i = 0LL; i != v7; i = (char *)i + 1)
                {
                  if (*(void *)v206 != v8) {
                    objc_enumerationMutation(v6);
                  }
                  v10 = *(void **)(*((void *)&v205 + 1) + 8LL * (void)i);
                  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 URL]);
                  v1 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v11 path]);
                  -[NSMutableArray addObject:](v187, "addObject:", v1);

                  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 functionName]);
                  -[NSMutableArray addObject:](v189, "addObject:", v12);

                  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 line]));
                  -[NSMutableArray addObject:](v185, "addObject:", v13);

                  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 column]));
                  -[NSMutableArray addObject:](v4, "addObject:", v14);
                }

                id v7 = [v6 countByEnumeratingWithState:&v205 objects:v219 count:16];
              }

              while (v7);
            }

            uint64_t v15 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
            v177 = objc_alloc_init(&OBJC_CLASS___NSData);
            v16 = (void *)objc_claimAutoreleasedReturnValue([v182 function]);
            Class v17 = NSClassFromString(@"MTLGPUDebugFunction");
            Class v18 = NSClassFromString(@"MTLLegacySVFunction");
            while ((objc_opt_respondsToSelector(v16, "baseObject") & 1) != 0
                 && (objc_opt_isKindOfClass(v16, v17) & 1) == 0
                 && (!v18 || (objc_opt_isKindOfClass(v16, v18) & 1) == 0))
            {
              uint64_t v19 = objc_claimAutoreleasedReturnValue([v16 performSelector:"baseObject"]);

              v16 = (void *)v19;
            }

            id AssociatedObject = objc_getAssociatedObject(v16, &GPUTools::Diag::AssociatedObjectKey);
            v21 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
            v155 = v21;
            if (v21)
            {
              unint64_t v22 = (unint64_t)[v21 hash];
              v171 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  v22));
              unint64_t v23 = *(void *)(v15 + 48);
              if (v23)
              {
                uint8x8_t v24 = (uint8x8_t)vcnt_s8((int8x8_t)v23);
                v24.i16[0] = vaddlv_u8(v24);
                if (v24.u32[0] > 1uLL)
                {
                  unint64_t v25 = v22;
                  if (v22 >= v23) {
                    unint64_t v25 = v22 % v23;
                  }
                }

                else
                {
                  unint64_t v25 = (v23 - 1) & v22;
                }

                v26 = *(void **)(*(void *)(v15 + 40) + 8 * v25);
                if (v26)
                {
                  for (j = (void *)*v26; j; j = (void *)*j)
                  {
                    unint64_t v28 = j[1];
                    if (v28 == v22)
                    {
                      if (j[2] == v22)
                      {
                        v83 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( (void *)v15,  v22);
                        int v55 = *((unsigned __int8 *)v83 + 64);
                        v84 = &stru_20D90;
                        if (v83[5]) {
                          v84 = @" ";
                        }
LABEL_158:
                        v169 = (__CFString *)v84;
                        goto LABEL_117;
                      }
                    }

                    else
                    {
                      if (v24.u32[0] > 1uLL)
                      {
                        if (v28 >= v23) {
                          v28 %= v23;
                        }
                      }

                      else
                      {
                        v28 &= v23 - 1;
                      }

                      if (v28 != v25) {
                        break;
                      }
                    }
                  }
                }

                if (v24.u32[0] > 1uLL)
                {
                  v1 = (NSMutableArray *)v22;
                  if (v22 >= v23) {
                    v1 = (NSMutableArray *)(v22 % v23);
                  }
                }

                else
                {
                  v1 = (NSMutableArray *)((v23 - 1) & v22);
                }

                v29 = *(void **)(*(void *)(v15 + 40) + 8LL * (void)v1);
                if (v29)
                {
                  for (k = (void *)*v29; k; k = (void *)*k)
                  {
                    unint64_t v31 = k[1];
                    if (v31 == v22)
                    {
                      if (k[2] == v22) {
                        goto LABEL_110;
                      }
                    }

                    else
                    {
                      if (v24.u32[0] > 1uLL)
                      {
                        if (v31 >= v23) {
                          v31 %= v23;
                        }
                      }

                      else
                      {
                        v31 &= v23 - 1;
                      }

                      if ((NSMutableArray *)v31 != v1) {
                        break;
                      }
                    }
                  }
                }
              }

              v32 = operator new(0x18uLL);
              void *v32 = 0LL;
              v32[1] = v22;
              v32[2] = v22;
              float v33 = (float)(unint64_t)(*(void *)(v15 + 64) + 1LL);
              float v34 = *(float *)(v15 + 72);
              if (!v23 || (float)(v34 * (float)v23) < v33)
              {
                BOOL v35 = (v23 & (v23 - 1)) != 0;
                if (v23 < 3) {
                  BOOL v35 = 1LL;
                }
                unint64_t v36 = v35 | (2 * v23);
                unint64_t v37 = vcvtps_u32_f32(v33 / v34);
                if (v36 <= v37) {
                  int8x8_t prime = (int8x8_t)v37;
                }
                else {
                  int8x8_t prime = (int8x8_t)v36;
                }
                if (*(void *)&prime == 1LL)
                {
                  int8x8_t prime = (int8x8_t)2LL;
                }

                else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
                {
                  int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
                }

                unint64_t v23 = *(void *)(v15 + 48);
                if (*(void *)&prime <= v23)
                {
                  if (*(void *)&prime < v23)
                  {
                    unint64_t v45 = vcvtps_u32_f32((float)*(unint64_t *)(v15 + 64) / *(float *)(v15 + 72));
                    if (v23 < 3
                      || (uint8x8_t v46 = (uint8x8_t)vcnt_s8((int8x8_t)v23), v46.i16[0] = vaddlv_u8(v46), v46.u32[0] > 1uLL))
                    {
                      unint64_t v45 = std::__next_prime(v45);
                    }

                    else
                    {
                      uint64_t v47 = 1LL << -(char)__clz(v45 - 1);
                      if (v45 >= 2) {
                        unint64_t v45 = v47;
                      }
                    }

                    if (*(void *)&prime <= v45) {
                      int8x8_t prime = (int8x8_t)v45;
                    }
                    if (*(void *)&prime >= v23)
                    {
                      unint64_t v23 = *(void *)(v15 + 48);
                    }

                    else
                    {
                      if (prime) {
                        goto LABEL_66;
                      }
                      v85 = *(void **)(v15 + 40);
                      *(void *)(v15 + 40) = 0LL;
                      if (v85) {
                        operator delete(v85);
                      }
                      unint64_t v23 = 0LL;
                      *(void *)(v15 + 48) = 0LL;
                    }
                  }
                }

                else
                {
LABEL_66:
                  if (*(void *)&prime >> 61) {
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  }
                  v39 = operator new(8LL * *(void *)&prime);
                  v40 = *(void **)(v15 + 40);
                  *(void *)(v15 + 40) = v39;
                  if (v40) {
                    operator delete(v40);
                  }
                  uint64_t v41 = 0LL;
                  *(int8x8_t *)(v15 + 48) = prime;
                  do
                    *(void *)(*(void *)(v15 + 40) + 8 * v41++) = 0LL;
                  while (*(void *)&prime != v41);
                  v42 = *(void **)(v15 + 56);
                  if (v42)
                  {
                    unint64_t v43 = v42[1];
                    uint8x8_t v44 = (uint8x8_t)vcnt_s8(prime);
                    v44.i16[0] = vaddlv_u8(v44);
                    if (v44.u32[0] > 1uLL)
                    {
                      if (v43 >= *(void *)&prime) {
                        v43 %= *(void *)&prime;
                      }
                    }

                    else
                    {
                      v43 &= *(void *)&prime - 1LL;
                    }

                    *(void *)(*(void *)(v15 + 40) + 8 * v43) = v15 + 56;
                    v48 = (void *)*v42;
                    if (*v42)
                    {
                      do
                      {
                        unint64_t v49 = v48[1];
                        if (v44.u32[0] > 1uLL)
                        {
                          if (v49 >= *(void *)&prime) {
                            v49 %= *(void *)&prime;
                          }
                        }

                        else
                        {
                          v49 &= *(void *)&prime - 1LL;
                        }

                        if (v49 != v43)
                        {
                          uint64_t v50 = *(void *)(v15 + 40);
                          if (!*(void *)(v50 + 8 * v49))
                          {
                            *(void *)(v50 + 8 * v49) = v42;
                            goto LABEL_91;
                          }

                          void *v42 = *v48;
                          void *v48 = **(void **)(*(void *)(v15 + 40) + 8 * v49);
                          **(void **)(*(void *)(v15 + 40) + 8 * v49) = v48;
                          v48 = v42;
                        }

                        unint64_t v49 = v43;
LABEL_91:
                        v42 = v48;
                        v48 = (void *)*v48;
                        unint64_t v43 = v49;
                      }

                      while (v48);
                    }
                  }

                  unint64_t v23 = (unint64_t)prime;
                }

                if ((v23 & (v23 - 1)) != 0)
                {
                  if (v22 >= v23) {
                    v1 = (NSMutableArray *)(v22 % v23);
                  }
                  else {
                    v1 = (NSMutableArray *)v22;
                  }
                }

                else
                {
                  v1 = (NSMutableArray *)((v23 - 1) & v22);
                }
              }

              uint64_t v51 = *(void *)(v15 + 40);
              v52 = *(void **)(v51 + 8LL * (void)v1);
              if (v52)
              {
                void *v32 = *v52;
                goto LABEL_108;
              }

              void *v32 = *(void *)(v15 + 56);
              *(void *)(v15 + 56) = v32;
              *(void *)(v51 + 8LL * (void)v1) = v15 + 56;
              if (*v32)
              {
                unint64_t v53 = *(void *)(*v32 + 8LL);
                if ((v23 & (v23 - 1)) != 0)
                {
                  if (v53 >= v23) {
                    v53 %= v23;
                  }
                }

                else
                {
                  v53 &= v23 - 1;
                }

                v52 = (void *)(*(void *)(v15 + 40) + 8 * v53);
LABEL_108:
                void *v52 = v32;
              }

              ++*(void *)(v15 + 64);
LABEL_110:
              v54 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( (void *)v15,  v22);
              int v55 = *((unsigned __int8 *)v54 + 64);
              if (v54[3])
              {
                v56 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:"));
                v169 = &stru_20D90;
              }

              else
              {
                v57 = (void *)v54[4];
                if (v57)
                {
                  v56 = v57;
                  v169 = &stru_20D90;
                }

                else
                {
                  v58 = (void *)v54[5];
                  if (!v58)
                  {
                    v84 = &stru_20D90;
                    goto LABEL_158;
                  }

                  v59 = v58;
                  v56 = objc_alloc_init(&OBJC_CLASS___NSData);
                  v169 = v59;
                }
              }

              v177 = v56;
LABEL_117:
              BOOL v157 = v55 != 0;
            }

            else
            {
              BOOL v157 = 0;
              v169 = &stru_20D90;
              v171 = &off_22928;
            }

            v60 = (__CFString *)objc_claimAutoreleasedReturnValue([v182 debugDescription]);
            v154 = v60;
            id v61 = -[__CFString length](v60, "length");
            v62 = @"Invalid OOB access detected";
            if (v61) {
              v62 = v60;
            }
            v165 = v62;
            v63 = (void *)objc_claimAutoreleasedReturnValue([v182 function]);
            v64 = (void *)objc_claimAutoreleasedReturnValue([v63 unpackedFilePath]);
            BOOL v65 = v64 == 0LL;

            if (v65)
            {
              v167 = &stru_20D90;
            }

            else
            {
              v66 = (void *)objc_claimAutoreleasedReturnValue([v63 filePath]);
              if (v66) {
                v167 = (__CFString *)objc_claimAutoreleasedReturnValue([v63 filePath]);
              }
              else {
                v167 = (__CFString *)objc_claimAutoreleasedReturnValue([v63 unpackedFilePath]);
              }
            }

            id v67 = (id)GPUTools::Diag::SwizzleMTLTracker::Transport;
            if (v67)
            {
              v217[0] = @"path";
              v217[1] = @"line";
              v218[0] = v187;
              v218[1] = v185;
              v217[2] = @"column";
              v217[3] = @"functionName";
              v218[2] = v4;
              v218[3] = v189;
              v217[4] = @"source";
              v217[5] = @"metallib";
              v218[4] = v169;
              v218[5] = v177;
              v218[6] = v171;
              v217[6] = @"metallibHash";
              v217[7] = @"isDefaultMetallib";
              v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v157));
              v218[7] = v68;
              v217[8] = @"MTLName";
              v69 = (void *)objc_claimAutoreleasedReturnValue([v63 name]);
              if (v69) {
                v70 = (__CFString *)objc_claimAutoreleasedReturnValue([v63 name]);
              }
              else {
                v70 = &stru_20D90;
              }
              v218[8] = v70;
              v218[9] = v167;
              v217[9] = @"MTLURL";
              v217[10] = @"message";
              v218[10] = v165;
              v218[11] = v173;
              v217[11] = @"CPUBacktrace";
              v217[12] = @"ptrsNum";
              v218[12] = v175;
              v1 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v218,  v217,  13LL));
              if (v69) {

              }
              v78 = (void *)objc_claimAutoreleasedReturnValue( +[GTTransportMessage_tools_diagnostics messageWithKind:plistPayload:]( &OBJC_CLASS___GTTransportMessage_tools_diagnostics,  "messageWithKind:plistPayload:",  4352LL,  v1));
              [v67 send:v78 error:0];
            }

            else
            {
              v1 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
              for (unint64_t m = 0LL; m < (unint64_t)-[NSMutableArray count](v189, "count"); ++m)
              {
                v72 = (void *)objc_opt_new(&OBJC_CLASS___GTCallstackFrame);
                v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v187, "objectAtIndexedSubscript:", m));
                v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v73));
                [v72 setFile:v74];

                v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v185, "objectAtIndexedSubscript:", m));
                objc_msgSend(v72, "setLine:", objc_msgSend(v75, "unsignedLongValue"));

                v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", m));
                objc_msgSend(v72, "setColumn:", objc_msgSend(v76, "unsignedLongValue"));

                v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v189, "objectAtIndexedSubscript:", m));
                [v72 setFunctionName:v77];

                -[NSMutableArray addObject:](v1, "addObject:", v72);
              }

              v78 = (void *)objc_opt_new(&OBJC_CLASS___GTDiagnosticsIssue);
              [v78 setCallstack:v1];
              [v78 setCpuCallstackData:v173];
              objc_msgSend(v78, "setCpuCallstackFramesNum:", objc_msgSend(v175, "unsignedLongValue"));
              [v78 setLibraryOnlineSource:v169];
              [v78 setLibraryOfflineSource:v177];
              v79 = (void *)objc_claimAutoreleasedReturnValue([v171 stringValue]);
              [v78 setLibraryHash:v79];

              [v78 setIsDefaultLibrary:v157];
              v80 = (void *)objc_claimAutoreleasedReturnValue([v63 name]);
              if (v80) {
                v81 = (__CFString *)objc_claimAutoreleasedReturnValue([v63 name]);
              }
              else {
                v81 = &stru_20D90;
              }
              [v78 setMetalFunctionName:v81];
              if (v80) {

              }
              v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v167));
              [v78 setMetalFunctionFile:v82];

              [v78 setMetalLogMessage:v165];
              [(id)GPUTools::Diag::SwizzleMTLTracker::FacilityImpl notifyDiagnosticsIssue:v78];
            }
          }

          v179 = (char *)v179 + 1;
        }

        while (v179 != v163);
        id v86 = [obj countByEnumeratingWithState:&v191 objects:v209 count:16];
        id v163 = v86;
      }

      while (v86);
    }
  }

  v87 = (void *)objc_claimAutoreleasedReturnValue([v153 error]);
  BOOL v88 = v87 == 0LL;

  if (!v88)
  {
    id v89 = v195;
    id v90 = v196;
    id v91 = v153;
    id v162 = v89;
    id v164 = v90;
    v166 = v91;
    v92 = (void *)objc_claimAutoreleasedReturnValue([v91 error]);
    v93 = (void *)objc_claimAutoreleasedReturnValue([v92 userInfo]);
    v160 = (void *)objc_claimAutoreleasedReturnValue([v93 valueForKey:MTLCommandBufferEncoderInfoErrorKey]);

    v94 = objc_opt_new(&OBJC_CLASS___NSData);
    v172 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v170 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v207 = 0u;
    __int128 v208 = 0u;
    __int128 v205 = 0u;
    __int128 v206 = 0u;
    id v174 = v160;
    id v95 = [v174 countByEnumeratingWithState:&v205 objects:v219 count:16];
    if (v95)
    {
      uint64_t v96 = *(void *)v206;
      do
      {
        for (n = 0LL; n != v95; n = (char *)n + 1)
        {
          if (*(void *)v206 != v96) {
            objc_enumerationMutation(v174);
          }
          v98 = *(void **)(*((void *)&v205 + 1) + 8LL * (void)n);
          if ([v98 errorState] == &dword_4) {
            -[NSMutableArray addObject:](v172, "addObject:", v98);
          }
        }

        id v95 = [v174 countByEnumeratingWithState:&v205 objects:v219 count:16];
      }

      while (v95);
    }

    id v99 = -[NSMutableArray count](v172, "count");
    v100 = v170;
    if (v99) {
      v100 = v172;
    }
    v168 = v100;
    if (-[NSMutableArray count](v172, "count"))
    {
      v156 = @"The commands associated with an encoder caused an error";
      v101 = v172;
    }

    else
    {
      if (!-[NSMutableArray count](v170, "count"))
      {
        v190 = @"[MTLCommandEncoder endEncoding]";
        v103 = &off_22928;
LABEL_214:

        goto LABEL_215;
      }

      v156 = @"The commands associated with the encoder were affected by an error, which may or may not have been caused by the commands themselves, and failed to execute in full";
      v101 = v170;
    }

    v158 = v101;

    v178 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v180 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v184 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v203 = 0u;
    __int128 v204 = 0u;
    __int128 v201 = 0u;
    __int128 v202 = 0u;
    v168 = v158;
    id v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v168,  "countByEnumeratingWithState:objects:count:",  &v201,  v218,  16LL);
    if (v102)
    {
      v190 = @"[MTLCommandEncoder endEncoding]";
      v103 = &off_22928;
      uint64_t v176 = *(void *)v202;
      do
      {
        id v183 = v102;
        v104 = 0LL;
        v105 = v94;
        v188 = v103;
        do
        {
          if (*(void *)v202 != v176) {
            objc_enumerationMutation(v168);
          }
          v106 = *(void **)(*((void *)&v201 + 1) + 8LL * (void)v104);
          __int128 v197 = 0u;
          __int128 v198 = 0u;
          __int128 v199 = 0u;
          __int128 v200 = 0u;
          v107 = (void *)objc_claimAutoreleasedReturnValue([v106 debugSignposts]);
          v186 = v105;
          id v108 = [v107 countByEnumeratingWithState:&v197 objects:v217 count:16];
          if (v108)
          {
            uint64_t v109 = *(void *)v198;
            while (2)
            {
              for (ii = 0LL; ii != v108; ii = (char *)ii + 1)
              {
                if (*(void *)v198 != v109) {
                  objc_enumerationMutation(v107);
                }
                v111 = *(void **)(*((void *)&v197 + 1) + 8LL * (void)ii);
                if ([v111 hasPrefix:@"GPUToolsDebugInfo"])
                {
                  v113 = (void *)objc_claimAutoreleasedReturnValue([v111 componentsSeparatedByString:@"_"]);
                  v114 = (void *)objc_claimAutoreleasedReturnValue([v113 objectAtIndexedSubscript:1]);
                  id v112 = [v114 integerValue];
                  v115 = (void *)objc_claimAutoreleasedReturnValue([v106 label]);
                  if ([v115 length])
                  {
                    v116 = (void *)objc_claimAutoreleasedReturnValue([v106 label]);
                    v117 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %@",  v116));
                  }

                  else
                  {
                    v117 = &stru_20D90;
                  }

                  v118 = (void *)objc_claimAutoreleasedReturnValue([v113 objectAtIndexedSubscript:2]);
                  uint64_t v119 = objc_claimAutoreleasedReturnValue([v118 stringByAppendingString:v117]);

                  v190 = (__CFString *)v119;
                  goto LABEL_197;
                }
              }

              id v108 = [v107 countByEnumeratingWithState:&v197 objects:v217 count:16];
              if (v108) {
                continue;
              }
              break;
            }
          }

          id v112 = 0LL;
LABEL_197:

          GPUTools::Diag::SwizzleMTLTracker::GetCallstackFromStore( (GPUTools::Diag::SwizzleMTLTracker *)&v211,  (uint64_t)v112,  (GPUTools::Diag::BacktraceStore *)(GPUTools::Diag::SwizzleMTLTracker::Tracker + 120));
          v94 = v211;
          v211 = 0LL;

          v103 = v212;
          v212 = 0LL;

          -[NSMutableArray addObject:](v178, "addObject:", v94);
          -[NSMutableArray addObject:](v180, "addObject:", v103);
          if (v190) {
            v120 = v190;
          }
          else {
            v120 = &stru_20D90;
          }
          -[NSMutableArray addObject:](v184, "addObject:", v120);
          v104 = (char *)v104 + 1;
          v105 = v94;
          v188 = v103;
        }

        while (v104 != v183);
        id v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v168,  "countByEnumeratingWithState:objects:count:",  &v201,  v218,  16LL);
      }

      while (v102);
    }

    else
    {
      v190 = @"[MTLCommandEncoder endEncoding]";
      v103 = &off_22928;
    }

    v121 = (void *)objc_claimAutoreleasedReturnValue([v166 label]);
    if ([v121 length])
    {
      v122 = (void *)objc_claimAutoreleasedReturnValue([v166 label]);
      v123 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %@",  v122));
    }

    else
    {
      v123 = &stru_20D90;
    }

    v124 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MTLCommandBuffer%@ execution failed: %@",  v123,  v156));
    id v125 = (id)GPUTools::Diag::SwizzleMTLTracker::Transport;
    if (v125)
    {
      v210[0] = @"message";
      v210[1] = @"CPUBacktrace";
      v211 = v124;
      v212 = (_UNKNOWN **)v162;
      v210[2] = @"ptrsNum";
      v210[3] = @"encoderCallstackDataArray";
      id v213 = v164;
      v214 = v178;
      v210[4] = @"encoderCallstackCountArray";
      v210[5] = @"encoderMessageArray";
      v215 = v180;
      v216 = v184;
      v126 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v211,  v210,  6LL));
      v127 = (void *)objc_claimAutoreleasedReturnValue( +[GTTransportMessage_tools_diagnostics messageWithKind:plistPayload:]( &OBJC_CLASS___GTTransportMessage_tools_diagnostics,  "messageWithKind:plistPayload:",  4356LL,  v126));
      [v125 send:v127 error:0];
    }

    else
    {
      v126 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      for (unint64_t jj = 0LL; jj < (unint64_t)-[NSMutableArray count](v184, "count"); ++jj)
      {
        v129 = (void *)objc_opt_new(&OBJC_CLASS___GTFaultingEncoder);
        v130 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v178, "objectAtIndexedSubscript:", jj));
        [v129 setCpuCallstackData:v130];

        v131 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v180, "objectAtIndexedSubscript:", jj));
        objc_msgSend(v129, "setCpuCallstackFramesNum:", objc_msgSend(v131, "integerValue"));

        v132 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v184, "objectAtIndexedSubscript:", jj));
        [v129 setMetalLogMessage:v132];

        -[NSMutableArray addObject:](v126, "addObject:", v129);
      }

      v127 = (void *)objc_opt_new(&OBJC_CLASS___GTCommandBufferIssue);
      [v127 setMetalLogMessage:v124];
      [v127 setCommandBufferCommitCallstackData:v162];
      objc_msgSend(v127, "setCommandBufferCommitCallstackFramesNum:", objc_msgSend(v164, "integerValue"));
      [v127 setFaultingEncoders:v126];
      [(id)GPUTools::Diag::SwizzleMTLTracker::FacilityImpl notifyCommandBufferIssue:v127];
    }

    goto LABEL_214;
  }

LABEL_215:
  v133 = v149 + 10;
  v134 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( v149 + 10,  v148);
  if (v134)
  {
    v135 = v134;
    v136 = (uint64_t *)v134[3];
    v137 = (uint64_t *)v134[4];
    while (v136 != v137)
    {
      uint64_t v138 = *v136++;
      GPUTools::Diag::BacktraceStore::RemoveBacktrace( (GPUTools::Diag::BacktraceStore *)v219,  (uint64_t)(v149 + 15),  v138);
    }

    int8x8_t v139 = (int8x8_t)v149[11];
    unint64_t v140 = v135[1];
    uint8x8_t v141 = (uint8x8_t)vcnt_s8(v139);
    v141.i16[0] = vaddlv_u8(v141);
    if (v141.u32[0] > 1uLL)
    {
      if (v140 >= *(void *)&v139) {
        v140 %= *(void *)&v139;
      }
    }

    else
    {
      v140 &= *(void *)&v139 - 1LL;
    }

    v142 = *(void **)(*v133 + 8 * v140);
    do
    {
      v143 = v142;
      v142 = (void *)*v142;
    }

    while (v142 != v135);
    if (v143 == v149 + 12) {
      goto LABEL_235;
    }
    unint64_t v144 = v143[1];
    if (v141.u32[0] > 1uLL)
    {
      if (v144 >= *(void *)&v139) {
        v144 %= *(void *)&v139;
      }
    }

    else
    {
      v144 &= *(void *)&v139 - 1LL;
    }

    if (v144 != v140)
    {
LABEL_235:
      if (!*v135) {
        goto LABEL_236;
      }
      unint64_t v145 = *(void *)(*v135 + 8LL);
      if (v141.u32[0] > 1uLL)
      {
        if (v145 >= *(void *)&v139) {
          v145 %= *(void *)&v139;
        }
      }

      else
      {
        v145 &= *(void *)&v139 - 1LL;
      }

      if (v145 != v140) {
LABEL_236:
      }
        *(void *)(*v133 + 8 * v140) = 0LL;
    }

    uint64_t v146 = *v135;
    if (*v135)
    {
      unint64_t v147 = *(void *)(v146 + 8);
      if (v141.u32[0] > 1uLL)
      {
        if (v147 >= *(void *)&v139) {
          v147 %= *(void *)&v139;
        }
      }

      else
      {
        v147 &= *(void *)&v139 - 1LL;
      }

      if (v147 != v140)
      {
        *(void *)(*v133 + 8 * v147) = v143;
        uint64_t v146 = *v135;
      }
    }

    void *v143 = v146;
    void *v135 = 0LL;
    --v149[13];
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,void *>>>::operator()[abi:nn180100]( 1,  v135);
  }
}

void sub_36CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20, void *a21, void *a22, void *a23, void *a24, uint64_t a25, void *a26, void *a27, uint64_t a28, uint64_t a29, void *a30, void *a31, uint64_t a32, void *a33, uint64_t a34, uint64_t a35, void *a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, void *a45, void *a46)
{
  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDefaultLibrary( GPUTools::Diag::SwizzleMTLTracker *this, objc_object *a2, objc_selector *a3)
{
  uint64_t v5 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  v6 = *(unsigned int (**)(const char *, void, objc_selector *))(GPUTools::Diag::SwizzleMTLTracker::Tracker
                                                                            + 384);
  if (!v6 || (id v7 = 0LL, v6("MTLGPUDebugDevice_newDefaultLibrary", 0LL, a3)))
  {
    uint64_t v8 = (*(uint64_t (**)(GPUTools::Diag::SwizzleMTLTracker *, objc_object *, objc_selector *))(v5 + 392))( this,  a2,  a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v7 = v9;
    if (v9)
    {
      v10 = *(dispatch_queue_s **)(v5 + 368);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newDefaultLibraryEP11objc_objectP13objc_selector_block_invoke;
      v14[3] = &unk_20A50;
      uint64_t v16 = v5;
      id v11 = v9;
      id v15 = v11;
      dispatch_sync(v10, v14);
      id v12 = v11;
    }
  }

  return v7;
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newDefaultLibraryEP11objc_objectP13objc_selector_block_invoke( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint8x8_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pathForResource:@"default" ofType:@"metallib"]);

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) hash];
  id v7 = v3;
  id v6 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v7;
  __int128 v10 = 0u;
  id v11 = v6;
  id v12 = 0LL;
  uint64_t v13 = 1LL;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>( v4,  (unint64_t)v5,  (uint64_t *)&v8);
}

void sub_3E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  id v5 = va_arg(va1, id);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  std::pair<unsigned long const,GPUTools::Diag::Library>::~pair((id *)va1);
  GPUTools::Diag::Library::~Library((id *)va);

  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>( uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }

    uint64_t v9 = *(void **)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (i = (void *)*v9; i; i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == a2)
        {
          if (i[2] == a2) {
            return;
          }
        }

        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }

          else
          {
            v11 &= v7 - 1;
          }

          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t v12 = (void *)(a1 + 16);
  uint64_t v13 = (char *)operator new(0x48uLL);
  __int128 v14 = *(_OWORD *)(a3 + 1);
  *(_OWORD *)(a3 + 1) = 0u;
  __int128 v15 = *(_OWORD *)(a3 + 3);
  *(_OWORD *)(a3 + 3) = 0u;
  uint64_t v16 = *a3;
  *((void *)v13 + 1) = a2;
  *((void *)v13 + 2) = v16;
  uint64_t v17 = a3[5];
  uint64_t v18 = a3[6];
  a3[5] = 0LL;
  v40[0] = v13;
  v40[1] = a1 + 16;
  *(void *)uint64_t v13 = 0LL;
  *(_OWORD *)(v13 + 24) = v14;
  *(_OWORD *)(v13 + 40) = v15;
  *((void *)v13 + 7) = v17;
  *((void *)v13 + 8) = v18;
  char v41 = 1;
  float v19 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v20 = *(float *)(a1 + 32);
  if (!v7 || (float)(v20 * (float)v7) < v19)
  {
    BOOL v21 = 1LL;
    if (v7 >= 3) {
      BOOL v21 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v7);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      int8x8_t prime = (int8x8_t)v23;
    }
    else {
      int8x8_t prime = (int8x8_t)v22;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }

    unint64_t v7 = *(void *)(a1 + 8);
    if (*(void *)&prime > v7) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v7)
    {
      unint64_t v31 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v7 < 3 || (uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v32.i16[0] = vaddlv_u8(v32), v32.u32[0] > 1uLL))
      {
        unint64_t v31 = std::__next_prime(v31);
      }

      else
      {
        uint64_t v33 = 1LL << -(char)__clz(v31 - 1);
        if (v31 >= 2) {
          unint64_t v31 = v33;
        }
      }

      if (*(void *)&prime <= v31) {
        int8x8_t prime = (int8x8_t)v31;
      }
      if (*(void *)&prime >= v7)
      {
        unint64_t v7 = *(void *)(a1 + 8);
      }

      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          unint64_t v25 = operator new(8LL * *(void *)&prime);
          v26 = *(void **)a1;
          *(void *)a1 = v25;
          if (v26) {
            operator delete(v26);
          }
          uint64_t v27 = 0LL;
          *(int8x8_t *)(a1 + 8) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v27++) = 0LL;
          while (*(void *)&prime != v27);
          unint64_t v28 = (void *)*v12;
          if (*v12)
          {
            unint64_t v29 = v28[1];
            uint8x8_t v30 = (uint8x8_t)vcnt_s8(prime);
            v30.i16[0] = vaddlv_u8(v30);
            if (v30.u32[0] > 1uLL)
            {
              if (v29 >= *(void *)&prime) {
                v29 %= *(void *)&prime;
              }
            }

            else
            {
              v29 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)a1 + 8 * v29) = v12;
            float v34 = (void *)*v28;
            if (*v28)
            {
              do
              {
                unint64_t v35 = v34[1];
                if (v30.u32[0] > 1uLL)
                {
                  if (v35 >= *(void *)&prime) {
                    v35 %= *(void *)&prime;
                  }
                }

                else
                {
                  v35 &= *(void *)&prime - 1LL;
                }

                if (v35 != v29)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v35))
                  {
                    *(void *)(*(void *)a1 + 8 * v35) = v28;
                    goto LABEL_55;
                  }

                  *unint64_t v28 = *v34;
                  *float v34 = **(void **)(*(void *)a1 + 8 * v35);
                  **(void **)(*(void *)a1 + 8 * v35) = v34;
                  float v34 = v28;
                }

                unint64_t v35 = v29;
LABEL_55:
                unint64_t v28 = v34;
                float v34 = (void *)*v34;
                unint64_t v29 = v35;
              }

              while (v34);
            }
          }

          unint64_t v7 = (unint64_t)prime;
          goto LABEL_59;
        }

        v39 = *(void **)a1;
        *(void *)a1 = 0LL;
        if (v39) {
          operator delete(v39);
        }
        unint64_t v7 = 0LL;
        *(void *)(a1 + 8) = 0LL;
      }
    }

LABEL_59:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
      else {
        unint64_t v3 = a2;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
  }

  unint64_t v36 = *(void **)(*(void *)a1 + 8 * v3);
  uint64_t v37 = v40[0];
  if (v36)
  {
    *(void *)v40[0] = *v36;
LABEL_72:
    *unint64_t v36 = v37;
    goto LABEL_73;
  }

  *(void *)v40[0] = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v37;
  *(void *)(*(void *)a1 + 8 * v3) = v12;
  if (*(void *)v37)
  {
    unint64_t v38 = *(void *)(*(void *)v37 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v38 >= v7) {
        v38 %= v7;
      }
    }

    else
    {
      v38 &= v7 - 1;
    }

    unint64_t v36 = (void *)(*(void *)a1 + 8 * v38);
    goto LABEL_72;
  }

LABEL_73:
  v40[0] = 0LL;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,void *>>>>::reset[abi:nn180100]((uint64_t)v40);
}

void sub_42E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

id *std::pair<unsigned long const,GPUTools::Diag::Library>::~pair(id *a1)
{
  return a1;
}

void GPUTools::Diag::Library::~Library(id *this)
{
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,void *>>>>::reset[abi:nn180100]( uint64_t a1)
{
  v1 = *(id **)a1;
  *(void *)a1 = 0LL;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16)) {
      std::__destroy_at[abi:nn180100]<std::pair<unsigned long const,GPUTools::Diag::Library>,0>(v1 + 2);
    }
    operator delete(v1);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<unsigned long const,GPUTools::Diag::Library>,0>(id *a1)
{
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDefaultLibraryWithBundle( uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v9 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newDefaultLibraryWithBundle", v7) & 1) == 0)
  {
    unint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 400))(a1, a2, v7, a4);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      uint64_t v12 = *(dispatch_queue_s **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker45MTLGPUDebugDevice_newDefaultLibraryWithBundleEP11objc_objectP13objc_selectorP8NSBundlePU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_20700;
      id v17 = v7;
      id v13 = v11;
      id v18 = v13;
      uint64_t v19 = v8;
      dispatch_sync(v12, block);
      id v14 = v13;
    }
  }

  return v11;
}

void sub_4514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker45MTLGPUDebugDevice_newDefaultLibraryWithBundleEP11objc_objectP13objc_selectorP8NSBundlePU15__autoreleasingP7NSError_block_invoke( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathForResource:@"default" ofType:@"metallib"]);
  id v3 = [*(id *)(a1 + 40) hash];
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v2;
  id v5 = *(id *)(a1 + 40);
  id v7 = v3;
  id v8 = v6;
  __int128 v9 = 0u;
  id v10 = v5;
  id v11 = 0LL;
  uint64_t v12 = 1LL;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>( v4,  (unint64_t)v3,  (uint64_t *)&v7);
}

void sub_4604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  id v5 = va_arg(va1, id);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  std::pair<unsigned long const,GPUTools::Diag::Library>::~pair((id *)va1);
  GPUTools::Diag::Library::~Library((id *)va);

  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithData( uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v9 = *(uint64_t (**)(const char *, void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newLibraryWithData", 0LL) & 1) == 0)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 408))(a1, a2, v7, a4);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      uint64_t v12 = *(dispatch_queue_s **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker36MTLGPUDebugDevice_newLibraryWithDataEP11objc_objectP13objc_selectorPU27objcproto16OS_dispatch_data8NSObjectPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_20700;
      id v17 = v7;
      id v13 = v11;
      id v18 = v13;
      uint64_t v19 = v8;
      dispatch_sync(v12, block);
      id v14 = v13;
    }
  }

  return v11;
}

void sub_4730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker36MTLGPUDebugDevice_newLibraryWithDataEP11objc_objectP13objc_selectorPU27objcproto16OS_dispatch_data8NSObjectPU15__autoreleasingP7NSError_block_invoke( uint64_t a1)
{
  dispatch_data_t v2 = dispatch_data_create_map(*(dispatch_data_t *)(a1 + 32), (const void **)&buffer_ptr, &size_ptr);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buffer_ptr, size_ptr));
  uint64_t v4 = NSTemporaryDirectory();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v5, 1LL));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 globallyUniqueString]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:v8]);
  [v3 writeToURL:v9 atomically:1];
  id v10 = [*(id *)(a1 + 40) hash];
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByReplacingOccurrencesOfString:@"file://" withString:&stru_20D90]);
  id v14 = *(id *)(a1 + 40);
  id v15 = v10;
  id v16 = v13;
  __int128 v17 = 0u;
  id v18 = v14;
  __int128 v19 = 0u;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>( v11,  (unint64_t)v10,  (uint64_t *)&v15);
}

void sub_48DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  _Unwind_Resume(a1);
}

void sub_4928()
{
}

void sub_4930()
{
  JUMPOUT(0x4914LL);
}

void sub_493C()
{
}

void sub_4944()
{
  JUMPOUT(0x4918LL);
}

void sub_4950()
{
}

void sub_4958()
{
}

void GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithSourceOptionsHandler( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10) {
    id v10 = objc_alloc_init(&OBJC_CLASS___MTLCompileOptions);
  }
  -[MTLCompileOptions setDebuggingEnabled:](v10, "setDebuggingEnabled:", 1LL);
  uint64_t v12 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v13 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (!v13 || (v13("MTLGPUDebugDevice_newLibraryWithSourceOptionsHandler", v9) & 1) != 0)
  {
    id v14 = *(void (**)(uint64_t, uint64_t, id, MTLCompileOptions *, void *))(v12 + 416);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker52MTLGPUDebugDevice_newLibraryWithSourceOptionsHandlerEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsU13block_pointerFvPU21objcproto10MTLLibrary11objc_objectP7NSErrorE_block_invoke;
    v15[3] = &unk_20728;
    uint64_t v18 = v12;
    id v16 = v9;
    id v17 = v11;
    v14(a1, a2, v16, v10, v15);
  }
}

void sub_4A8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker52MTLGPUDebugDevice_newLibraryWithSourceOptionsHandlerEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsU13block_pointerFvPU21objcproto10MTLLibrary11objc_objectP7NSErrorE_block_invoke( uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    id v6 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 368LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker52MTLGPUDebugDevice_newLibraryWithSourceOptionsHandlerEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsU13block_pointerFvPU21objcproto10MTLLibrary11objc_objectP7NSErrorE_block_invoke_2;
    block[3] = &unk_20700;
    id v7 = v9;
    uint64_t v8 = *(void *)(a1 + 48);
    id v11 = v7;
    uint64_t v13 = v8;
    id v12 = *(id *)(a1 + 32);
    dispatch_sync(v6, block);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_4B94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker52MTLGPUDebugDevice_newLibraryWithSourceOptionsHandlerEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsU13block_pointerFvPU21objcproto10MTLLibrary11objc_objectP7NSErrorE_block_invoke_2( uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hash];
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 40) copy];
  id v5 = *(id *)(a1 + 32);
  id v6 = v2;
  *(_OWORD *)id v7 = 0u;
  id v8 = v4;
  id v9 = v5;
  __int128 v10 = 0u;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>( v3,  (unint64_t)v2,  (uint64_t *)&v6);
}

void sub_4C48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithSourceOptionsError( uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a3;
  __int128 v10 = a4;
  id v11 = v10;
  if (v10)
  {
    -[MTLCompileOptions setDebuggingEnabled:](v10, "setDebuggingEnabled:", 1LL);
  }

  else
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___MTLCompileOptions);
    -[MTLCompileOptions setDebuggingEnabled:](v11, "setDebuggingEnabled:", 1LL);
  }

  uint64_t v12 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v13 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v13 && (v13("MTLGPUDebugDevice_newLibraryWithSourceOptionsError", v9) & 1) == 0)
  {
    id v16 = 0LL;
  }

  else
  {
    uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, id, MTLCompileOptions *, uint64_t))(v12 + 424))( a1,  a2,  v9,  v11,  a5);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v15;
    if (v15)
    {
      id v17 = *(dispatch_queue_s **)(v12 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker50MTLGPUDebugDevice_newLibraryWithSourceOptionsErrorEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_20700;
      id v18 = v15;
      id v22 = v18;
      uint64_t v24 = v12;
      id v23 = v9;
      dispatch_sync(v17, block);
      id v19 = v18;
    }
  }

  return v16;
}

void sub_4DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker50MTLGPUDebugDevice_newLibraryWithSourceOptionsErrorEP11objc_objectP13objc_selectorP8NSStringP17MTLCompileOptionsPU15__autoreleasingP7NSError_block_invoke( uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hash];
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 40) copy];
  id v5 = *(id *)(a1 + 32);
  id v6 = v2;
  *(_OWORD *)id v7 = 0u;
  id v8 = v4;
  id v9 = v5;
  __int128 v10 = 0u;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>( v3,  (unint64_t)v2,  (uint64_t *)&v6);
}

void sub_4E64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithFile( uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v9 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newLibraryWithFile", v7) & 1) == 0)
  {
    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 432))(a1, a2, v7, a4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = *(dispatch_queue_s **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker36MTLGPUDebugDevice_newLibraryWithFileEP11objc_objectP13objc_selectorP8NSStringPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_20700;
      uint64_t v20 = v8;
      id v14 = v11;
      id v18 = v14;
      id v19 = v7;
      dispatch_sync(v13, block);
      id v15 = v14;
    }
  }

  return v12;
}

void sub_4F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker36MTLGPUDebugDevice_newLibraryWithFileEP11objc_objectP13objc_selectorP8NSStringPU15__autoreleasingP7NSError_block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) hash];
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  id v6 = v3;
  id v7 = v4;
  __int128 v8 = 0u;
  id v9 = v5;
  __int128 v10 = 0u;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>( v2,  (unint64_t)v3,  (uint64_t *)&v6);
}

void sub_503C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithURL( uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v9 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newLibraryWithURL", v7) & 1) == 0)
  {
    id v11 = 0LL;
  }

  else
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 440))(a1, a2, v7, a4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      uint64_t v12 = *(dispatch_queue_s **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newLibraryWithURLEP11objc_objectP13objc_selectorP5NSURLPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_20700;
      id v17 = v7;
      uint64_t v19 = v8;
      id v13 = v11;
      id v18 = v13;
      dispatch_sync(v12, block);
      id v14 = v13;
    }
  }

  return v11;
}

void sub_5160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newLibraryWithURLEP11objc_objectP13objc_selectorP5NSURLPU15__autoreleasingP7NSError_block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) absoluteString]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByReplacingOccurrencesOfString:@"file://" withString:&stru_20D90]);

  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) hash];
  id v7 = v3;
  id v6 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v7;
  __int128 v10 = 0u;
  id v11 = v6;
  __int128 v12 = 0u;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>( v4,  (unint64_t)v5,  (uint64_t *)&v8);
}

void sub_5248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  id v5 = va_arg(va1, id);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  std::pair<unsigned long const,GPUTools::Diag::Library>::~pair((id *)va1);
  GPUTools::Diag::Library::~Library((id *)va);

  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithDAG( uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a3;
  id v10 = a4;
  if (GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithDAG(objc_object *,objc_selector *,NSString *,NSArray *,NSError * {__autoreleasing}*)::onceToken != -1) {
    dispatch_once( &GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithDAG(objc_object *,objc_selector *,NSString *,NSArray *,NSError * {__autoreleasing}*)::onceToken,  &__block_literal_global);
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, id, id, uint64_t))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 448))( a1,  a2,  v9,  v10,  a5);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

void sub_5324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newLibraryWithDAGEP11objc_objectP13objc_selectorP8NSStringP7NSArrayPU15__autoreleasingP7NSError_block_invoke( id a1)
{
}

void GPUTools::Diag::SendUnsupportedSelectorMessage(GPUTools::Diag *this, const char *a2)
{
  if ((v3 & 1) == 0
  {
    GPUTools::Diag::SendUnsupportedSelectorMessage(char const*)::logger = (uint64_t)os_log_create( "com.apple.runtime-issues",  "Metal Diagnostics Warning");
  }

  uint64_t v4 = (os_log_s *)GPUTools::Diag::SendUnsupportedSelectorMessage(char const*)::logger;
  if (os_log_type_enabled( (os_log_t)GPUTools::Diag::SendUnsupportedSelectorMessage(char const*)::logger,  OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315138;
    id v6 = this;
    _os_log_fault_impl( &dword_0,  v4,  OS_LOG_TYPE_FAULT,  "Using selector %s is not supported with Metal Diagnostics. Validation issues may not trigger.",  (uint8_t *)&v5,  0xCu);
  }

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptor( uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptor(objc_object *,objc_selector *,MTLStitchedLibraryDescriptor *,NSError * {__autoreleasing}*)::onceToken != -1) {
    dispatch_once( &GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptor(objc_object *,objc_selector *,MTLStitchedLibraryDescriptor *,NSError * {__autoreleasing}*)::onceToken,  &__block_literal_global_151);
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 456))( a1,  a2,  v7,  a4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

void sub_54B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker50MTLGPUDebugDevice_newLibraryWithStitchedDescriptorEP11objc_objectP13objc_selectorP28MTLStitchedLibraryDescriptorPU15__autoreleasingP7NSError_block_invoke( id a1)
{
}

void GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptorHandler( uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v7 = a4;
  if (GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptorHandler(objc_object *,objc_selector *,MTLStitchedLibraryDescriptor *,void({block_pointer})(objc_object  {objcproto10MTLLibrary}*,NSError *))::onceToken != -1) {
    dispatch_once( &GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptorHandler(objc_object *,objc_selector *,MTLStitchedLibraryDescriptor *,void({block_pointer})(objc_object  {objcproto10MTLLibrary}*,NSError *))::onceToken,  &__block_literal_global_153);
  }
  (*(void (**)(uint64_t, uint64_t, id, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 464))(a1, a2, v8, v7);
}

void sub_5568( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker57MTLGPUDebugDevice_newLibraryWithStitchedDescriptorHandlerEP11objc_objectP13objc_selectorP28MTLStitchedLibraryDescriptorU13block_pointerFvPU21objcproto10MTLLibrary11objc_objectP7NSErrorE_block_invoke( id a1)
{
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDynamicLibrary( uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v9 = *(uint64_t (**)(const char *, void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newDynamicLibrary", 0LL) & 1) == 0)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 472))(a1, a2, v7, a4);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      uint64_t v12 = *(dispatch_queue_s **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newDynamicLibraryEP11objc_objectP13objc_selectorPU21objcproto10MTLLibrary11objc_objectPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_20700;
      uint64_t v19 = v8;
      id v17 = v7;
      id v13 = v11;
      id v18 = v13;
      dispatch_sync(v12, block);
      id v14 = v13;
    }
  }

  return v11;
}

void sub_5694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker35MTLGPUDebugDevice_newDynamicLibraryEP11objc_objectP13objc_selectorPU21objcproto10MTLLibrary11objc_objectPU15__autoreleasingP7NSError_block_invoke( uint64_t a1)
{
  uint64_t v2 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( *(void **)(a1 + 48),  (unint64_t)[*(id *)(a1 + 32) hash]);
  if (v2)
  {
    unsigned __int8 v3 = v2;
    id v18 = (id)v2[3];
    id v19 = (id)v3[4];
    id v20 = (id)v3[5];
    id v21 = (id)v3[6];
    id v4 = (id)v3[7];
    uint64_t v23 = v3[8];
    id v22 = *(id *)(a1 + 40);

    uint64_t v5 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 40) hash];
    id v6 = v18;
    id v12 = v6;
    id v7 = v19;
    id v13 = v7;
    id v8 = v20;
    id v14 = v8;
    id v9 = v21;
    id v15 = v9;
    id v10 = v22;
    id v16 = v10;
    uint64_t v17 = v23;
    std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>( v5,  (unint64_t)v11,  (uint64_t *)&v11);
  }

void sub_580C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  id v3 = va_arg(va1, id);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  std::pair<unsigned long const,GPUTools::Diag::Library>::~pair((id *)va);
  GPUTools::Diag::Library::~Library((id *)va1);
  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDynamicLibraryWithURL( uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v9 = *(uint64_t (**)(const char *, void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v9 && (v9("MTLGPUDebugDevice_newDynamicLibraryWithURL", 0LL) & 1) == 0)
  {
    id v11 = 0LL;
  }

  else
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 480))(a1, a2, v7, a4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      id v12 = *(dispatch_queue_s **)(v8 + 368);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker42MTLGPUDebugDevice_newDynamicLibraryWithURLEP11objc_objectP13objc_selectorP5NSURLPU15__autoreleasingP7NSError_block_invoke;
      block[3] = &unk_20700;
      id v17 = v7;
      uint64_t v19 = v8;
      id v13 = v11;
      id v18 = v13;
      dispatch_sync(v12, block);
      id v14 = v13;
    }
  }

  return v11;
}

void sub_5938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker42MTLGPUDebugDevice_newDynamicLibraryWithURLEP11objc_objectP13objc_selectorP5NSURLPU15__autoreleasingP7NSError_block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) absoluteString]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByReplacingOccurrencesOfString:@"file://" withString:&stru_20D90]);

  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) hash];
  id v7 = v3;
  id v6 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v7;
  __int128 v10 = 0u;
  id v11 = 0LL;
  id v12 = v6;
  uint64_t v13 = 0LL;
  std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,GPUTools::Diag::Library>>( v4,  (unint64_t)v5,  (uint64_t *)&v8);
}

void sub_5A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  id v5 = va_arg(va1, id);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  std::pair<unsigned long const,GPUTools::Diag::Library>::~pair((id *)va1);
  GPUTools::Diag::Library::~Library((id *)va);

  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithName( GPUTools::Diag::SwizzleMTLTracker *this, objc_object *a2, objc_selector *a3, NSString *a4)
{
  id v6 = a3;
  uint64_t v7 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v8 = *(uint64_t (**)(const char *, objc_selector *))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v8 && (v8("MTLGPUDebugLibrary_newFunctionWithName", v6) & 1) == 0)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v9 = (*(uint64_t (**)(GPUTools::Diag::SwizzleMTLTracker *, objc_object *, objc_selector *))(v7 + 488))( this,  a2,  v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
      id v13 = -[GPUTools::Diag::SwizzleMTLTracker hash](this, "hash");
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 unpackedFilePath]);
      id v15 = [v14 length];

      if (v15
        || std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( (void *)v7,  (unint64_t)v13))
      {
        objc_setAssociatedObject(v12, &GPUTools::Diag::AssociatedObjectKey, this, 0LL);
      }
    }
  }

  return v11;
}

void sub_5B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithNameConstantValuesHandler( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v13 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (!v13 || (v13("MTLGPUDebugLibrary_newFunctionWithNameConstantValuesHandler", v9) & 1) != 0)
  {
    id v14 = *(void (**)(uint64_t, uint64_t, id, id, void *))(v12 + 496);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker59MTLGPUDebugLibrary_newFunctionWithNameConstantValuesHandlerEP11objc_objectP13objc_selectorP8NSStringP25MTLFunctionConstantValuesU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke;
    v15[3] = &unk_207B0;
    uint64_t v17 = a1;
    uint64_t v18 = v12;
    id v16 = v11;
    v14(a1, a2, v9, v10, v15);
  }
}

void sub_5C64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker59MTLGPUDebugLibrary_newFunctionWithNameConstantValuesHandlerEP11objc_objectP13objc_selectorP8NSStringP25MTLFunctionConstantValuesU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke( uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = v10;
    id v7 = [*(id *)(a1 + 40) hash];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 unpackedFilePath]);
    id v9 = [v8 length];

    if (!v9
      && !std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( *(void **)(a1 + 48),  (unint64_t)v7))
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();

      goto LABEL_6;
    }

    objc_setAssociatedObject(v6, &GPUTools::Diag::AssociatedObjectKey, *(id *)(a1 + 40), 0LL);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_6:
}

void sub_5D74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithNameConstantValuesError( void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v12 = *(uint64_t (**)(const char *, id))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v12 && (v12("MTLGPUDebugLibrary_newFunctionWithNameConstantValuesError", v9) & 1) == 0)
  {
    id v15 = 0LL;
  }

  else
  {
    uint64_t v13 = (*(uint64_t (**)(void *, uint64_t, id, id, uint64_t))(v11 + 504))(a1, a2, v9, v10, a5);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
      id v17 = [a1 hash];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 unpackedFilePath]);
      id v19 = [v18 length];

      if (v19
        || std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( (void *)v11,  (unint64_t)v17))
      {
        objc_setAssociatedObject(v16, &GPUTools::Diag::AssociatedObjectKey, a1, 0LL);
      }
    }
  }

  return v15;
}

void sub_5EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithDescriptorCompletionHandler( uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v10 = *(uint64_t (**)(const char *, void *))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (!v10
    || (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 name]),
        char v12 = v10("MTLGPUDebugLibrary_newFunctionWithDescriptorCompletionHandler", v11),
        v11,
        (v12 & 1) != 0))
  {
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, id, void *))(v9 + 512);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker61MTLGPUDebugLibrary_newFunctionWithDescriptorCompletionHandlerEP11objc_objectP13objc_selectorP21MTLFunctionDescriptorU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke;
    v14[3] = &unk_207B0;
    uint64_t v16 = a1;
    uint64_t v17 = v9;
    id v15 = v8;
    v13(a1, a2, v7, v14);
  }
}

void sub_5FE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker61MTLGPUDebugLibrary_newFunctionWithDescriptorCompletionHandlerEP11objc_objectP13objc_selectorP21MTLFunctionDescriptorU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke( uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = v10;
    id v7 = [*(id *)(a1 + 40) hash];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 unpackedFilePath]);
    id v9 = [v8 length];

    if (!v9
      && !std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( *(void **)(a1 + 48),  (unint64_t)v7))
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();

      goto LABEL_6;
    }

    objc_setAssociatedObject(v6, &GPUTools::Diag::AssociatedObjectKey, *(id *)(a1 + 40), 0LL);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_6:
}

void sub_60FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithDescriptorError( void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = v7;
  uint64_t v9 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v10 = *(uint64_t (**)(const char *, void *))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v10
    && (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 name]),
        char v12 = v10("MTLGPUDebugLibrary_newFunctionWithDescriptorError", v11),
        v11,
        (v12 & 1) == 0))
  {
    id v15 = 0LL;
  }

  else
  {
    uint64_t v13 = (*(uint64_t (**)(void *, uint64_t, void *, uint64_t))(v9 + 520))(a1, a2, v8, a4);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
      id v17 = [a1 hash];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 unpackedFilePath]);
      id v19 = [v18 length];

      if (v19
        || std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( (void *)v9,  (unint64_t)v17))
      {
        objc_setAssociatedObject(v16, &GPUTools::Diag::AssociatedObjectKey, a1, 0LL);
      }
    }
  }

  return v15;
}

void sub_6244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorCompletionHandler( uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 528);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker73MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorCompletionHandlerEP11objc_objectP13objc_selectorP33MTLIntersectionFunctionDescriptorU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke;
  v10[3] = &unk_207B0;
  uint64_t v12 = a1;
  uint64_t v13 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v11 = v7;
  id v9 = v7;
  v8(a1, a2, a3, v10);
}

void sub_6328( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker73MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorCompletionHandlerEP11objc_objectP13objc_selectorP33MTLIntersectionFunctionDescriptorU13block_pointerFvPU22objcproto11MTLFunction11objc_objectP7NSErrorE_block_invoke( uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = v10;
    id v7 = [*(id *)(a1 + 40) hash];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 unpackedFilePath]);
    id v9 = [v8 length];

    if (!v9
      && !std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( *(void **)(a1 + 48),  (unint64_t)v7))
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();

      goto LABEL_6;
    }

    objc_setAssociatedObject(v6, &GPUTools::Diag::AssociatedObjectKey, *(id *)(a1 + 40), 0LL);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_6:
}

void sub_6428( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorError( void *a1)
{
  uint64_t v2 = (void *)GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v3 = (*(uint64_t (**)(void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 536))();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v7 = [a1 hash];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 unpackedFilePath]);
    id v9 = [v8 length];

    if (v9
      || std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( v2,  (unint64_t)v7))
    {
      objc_setAssociatedObject(v6, &GPUTools::Diag::AssociatedObjectKey, a1, 0LL);
    }
  }

  return v5;
}

void sub_6510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void GPUTools::Diag::SwizzleMTLTracker::_MTLCommandBuffer_commit( GPUTools::Diag::SwizzleMTLTracker *this, objc_object *a2, objc_selector *a3)
{
  uint64_t v5 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v6 = *(unsigned int (**)(const char *, void, objc_selector *))(GPUTools::Diag::SwizzleMTLTracker::Tracker
                                                                            + 384);
  if (!v6 || v6("_MTLCommandBuffer_commit", 0LL, a3))
  {
    id v7 = this;
    bzero(__src, 0x1008uLL);
    LODWORD(__src[512]) = backtrace(__src, 512);
    id v8 = -[GPUTools::Diag::SwizzleMTLTracker globalTraceObjectID](v7, "globalTraceObjectID");
    id v9 = *(dispatch_queue_s **)(v5 + 352);
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    uint64_t v15 = (uint64_t)___ZN8GPUTools4Diag14BacktraceStore15InsertBacktraceENS0_9CallstackEm_block_invoke;
    id v16 = (uint64_t (*)(uint64_t, uint64_t))&__block_descriptor_4152_e5_v8__0l;
    id v17 = (void (*)(uint64_t))(v5 + 240);
    memcpy(v18, __src, 0x1008uLL);
    v18[513] = v8;
    dispatch_async(v9, &v13);
    uint64_t v13 = 0LL;
    uint64_t v14 = (uint64_t)&v13;
    uint64_t v15 = 0x3032000000LL;
    id v16 = __Block_byref_object_copy_;
    id v17 = __Block_byref_object_dispose_;
    v18[0] = *(id *)(v5 + 360);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker24_MTLCommandBuffer_commitEP11objc_objectP13objc_selector_block_invoke;
    v11[3] = &unk_207D8;
    v11[4] = &v13;
    id v10 = objc_retainBlock(v11);
    -[GPUTools::Diag::SwizzleMTLTracker addCompletedHandler:](v7, "addCompletedHandler:", v10);
    (*(void (**)(GPUTools::Diag::SwizzleMTLTracker *, objc_object *))(v5 + 544))(v7, a2);

    _Block_object_dispose(&v13, 8);
  }

void sub_66EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker24_MTLCommandBuffer_commitEP11objc_objectP13objc_selector_block_invoke( uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(dispatch_queue_s **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = ___ZN8GPUTools4Diag17SwizzleMTLTracker24_MTLCommandBuffer_commitEP11objc_objectP13objc_selector_block_invoke_2;
  block[3] = &unk_20988;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTracker24_MTLCommandBuffer_commitEP11objc_objectP13objc_selector_block_invoke_2( uint64_t a1)
{
}

id GPUTools::Diag::SwizzleMTLTracker::_MTLCommandQueue_commandBufferWithDescriptor( GPUTools::Diag::SwizzleMTLTracker *this, objc_object *a2, objc_selector *a3, MTLCommandBufferDescriptor *a4)
{
  id v6 = a3;
  if (!v6) {
    id v6 = objc_opt_new(&OBJC_CLASS___MTLCommandBufferDescriptor);
  }
  -[objc_selector setErrorOptions:](v6, "setErrorOptions:", 1LL);
  uint64_t v7 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  id v8 = *(uint64_t (**)(const char *, void))(GPUTools::Diag::SwizzleMTLTracker::Tracker + 384);
  if (v8 && (v8("_MTLCommandQueue_commandBufferWithDescriptor", 0LL) & 1) == 0)
  {
    id v10 = 0LL;
  }

  else
  {
    uint64_t v9 = (*(uint64_t (**)(GPUTools::Diag::SwizzleMTLTracker *, objc_object *, objc_selector *))(v7 + 552))( this,  a2,  v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v10;
}

void sub_6868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void GPUTools::Diag::SwizzleMTLTracker::_MTLCommandEncoder_endEncoding( GPUTools::Diag::SwizzleMTLTracker *this, objc_object *a2, objc_selector *a3)
{
  uint64_t v6 = GPUTools::Diag::SwizzleMTLTracker::Tracker;
  uint64_t v7 = *(unsigned int (**)(const char *, void, objc_selector *))(GPUTools::Diag::SwizzleMTLTracker::Tracker
                                                                            + 384);
  if (v7 && !v7("_MTLCommandEncoder_endEncoding", 0LL, a3)) {
    return;
  }
  bzero(__src, 0x1008uLL);
  LODWORD(__src[512]) = backtrace(__src, 512);
  id v8 = this;
  id v9 = -[GPUTools::Diag::SwizzleMTLTracker globalTraceObjectID](v8, "globalTraceObjectID");
  id v10 = *(dispatch_queue_s **)(v6 + 232);
  *(void *)&__int128 v65 = _NSConcreteStackBlock;
  *((void *)&v65 + 1) = 3221225472LL;
  *(void *)&__int128 v66 = ___ZN8GPUTools4Diag14BacktraceStore15InsertBacktraceENS0_9CallstackEm_block_invoke;
  *((void *)&v66 + 1) = &__block_descriptor_4152_e5_v8__0l;
  v67[0] = v6 + 120;
  memcpy(&v67[1], __src, 0x1008uLL);
  v67[514] = v9;
  dispatch_async(v10, &v65);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GPUTools::Diag::SwizzleMTLTracker commandBuffer](v8, "commandBuffer"));
  unint64_t v12 = (unint64_t)[v11 globalTraceObjectID];

  uint64_t v13 = (void *)(v6 + 80);
  uint64_t v14 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::find<unsigned long>( (void *)(v6 + 80),  v12);
  if (v14)
  {
    uint64_t v15 = v14;
    id v17 = (char *)v14[4];
    unint64_t v16 = v14[5];
    if ((unint64_t)v17 >= v16)
    {
      uint64_t v24 = (char *)v14[3];
      uint64_t v25 = (v17 - v24) >> 3;
      unint64_t v26 = v25 + 1;
      uint64_t v27 = v16 - (void)v24;
      if (v27 >> 2 > v26) {
        unint64_t v26 = v27 >> 2;
      }
      else {
        unint64_t v28 = v26;
      }
      if (v28)
      {
        if (v28 >> 61) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        unint64_t v29 = (char *)operator new(8 * v28);
        uint64_t v24 = (char *)v15[3];
        id v17 = (char *)v15[4];
      }

      else
      {
        unint64_t v29 = 0LL;
      }

      v40 = &v29[8 * v25];
      char v41 = &v29[8 * v28];
      *(void *)v40 = v9;
      uint64_t v18 = v40 + 8;
      while (v17 != v24)
      {
        uint64_t v42 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v40 - 1) = v42;
        v40 -= 8;
      }

      v15[3] = v40;
      void v15[4] = v18;
      v15[5] = v41;
      if (v24) {
        operator delete(v24);
      }
    }

    else
    {
      *(void *)id v17 = v9;
      uint64_t v18 = v17 + 8;
    }

    void v15[4] = v18;
    goto LABEL_97;
  }

  id v19 = operator new(8uLL);
  *id v19 = v9;
  id v20 = v19 + 1;
  *(void *)&__int128 v21 = v19;
  *((void *)&v21 + 1) = v19 + 1;
  __int128 v63 = v21;
  unint64_t v22 = *(void *)(v6 + 88);
  if (!v22) {
    goto LABEL_32;
  }
  uint8x8_t v23 = (uint8x8_t)vcnt_s8((int8x8_t)v22);
  v23.i16[0] = vaddlv_u8(v23);
  if (v23.u32[0] > 1uLL)
  {
    unint64_t v3 = v12;
    if (v12 >= v22) {
      unint64_t v3 = v12 % v22;
    }
  }

  else
  {
    unint64_t v3 = (v22 - 1) & v12;
  }

  uint8x8_t v30 = *(void **)(*v13 + 8 * v3);
  if (!v30 || (unint64_t v31 = (void *)*v30) == 0LL)
  {
LABEL_32:
    uint64_t v33 = (char *)operator new(0x30uLL);
    v62 = (void *)(v6 + 96);
    *(void *)uint64_t v33 = 0LL;
    *((void *)v33 + 1) = v12;
    *((void *)v33 + 2) = v12;
    *(_OWORD *)(v33 + 24) = v63;
    *((void *)v33 + 5) = v20;
    float v34 = (float)(unint64_t)(*(void *)(v6 + 104) + 1LL);
    float v35 = *(float *)(v6 + 112);
    if (v22 && (float)(v35 * (float)v22) >= v34)
    {
LABEL_85:
      v54 = (void *)*v13;
      int v55 = *(void **)(*v13 + 8 * v3);
      if (v55)
      {
        *(void *)uint64_t v33 = *v55;
      }

      else
      {
        *(void *)uint64_t v33 = *v62;
        void *v62 = v33;
        v54[v3] = v62;
        if (!*(void *)v33)
        {
LABEL_94:
          ++*(void *)(v6 + 104);
          v60 = 0LL;
          goto LABEL_95;
        }

        unint64_t v56 = *(void *)(*(void *)v33 + 8LL);
        if ((v22 & (v22 - 1)) != 0)
        {
          if (v56 >= v22) {
            v56 %= v22;
          }
        }

        else
        {
          v56 &= v22 - 1;
        }

        int v55 = (void *)(*v13 + 8 * v56);
      }

      *int v55 = v33;
      goto LABEL_94;
    }

    BOOL v36 = 1LL;
    if (v22 >= 3) {
      BOOL v36 = (v22 & (v22 - 1)) != 0;
    }
    unint64_t v37 = v36 | (2 * v22);
    unint64_t v38 = vcvtps_u32_f32(v34 / v35);
    if (v37 <= v38) {
      int8x8_t prime = (int8x8_t)v38;
    }
    else {
      int8x8_t prime = (int8x8_t)v37;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v22 = *(void *)(v6 + 88);
    }

    if (*(void *)&prime > v22) {
      goto LABEL_51;
    }
    if (*(void *)&prime < v22)
    {
      unint64_t v49 = vcvtps_u32_f32((float)*(unint64_t *)(v6 + 104) / *(float *)(v6 + 112));
      if (v22 < 3 || (uint8x8_t v50 = (uint8x8_t)vcnt_s8((int8x8_t)v22), v50.i16[0] = vaddlv_u8(v50), v50.u32[0] > 1uLL))
      {
        unint64_t v49 = std::__next_prime(v49);
      }

      else
      {
        uint64_t v51 = 1LL << -(char)__clz(v49 - 1);
        if (v49 >= 2) {
          unint64_t v49 = v51;
        }
      }

      if (*(void *)&prime <= v49) {
        int8x8_t prime = (int8x8_t)v49;
      }
      if (*(void *)&prime >= v22)
      {
        unint64_t v22 = *(void *)(v6 + 88);
      }

      else
      {
        if (prime)
        {
LABEL_51:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          unint64_t v43 = operator new(8LL * *(void *)&prime);
          uint8x8_t v44 = (void *)*v13;
          void *v13 = v43;
          if (v44) {
            operator delete(v44);
          }
          uint64_t v45 = 0LL;
          *(int8x8_t *)(v6 + 88) = prime;
          do
            *(void *)(*v13 + 8 * v45++) = 0LL;
          while (*(void *)&prime != v45);
          uint8x8_t v46 = (void *)*v62;
          if (*v62)
          {
            unint64_t v47 = v46[1];
            uint8x8_t v48 = (uint8x8_t)vcnt_s8(prime);
            v48.i16[0] = vaddlv_u8(v48);
            if (v48.u32[0] > 1uLL)
            {
              if (v47 >= *(void *)&prime) {
                v47 %= *(void *)&prime;
              }
            }

            else
            {
              v47 &= *(void *)&prime - 1LL;
            }

            *(void *)(*v13 + 8 * v47) = v62;
            v52 = (void *)*v46;
            if (*v46)
            {
              do
              {
                unint64_t v53 = v52[1];
                if (v48.u32[0] > 1uLL)
                {
                  if (v53 >= *(void *)&prime) {
                    v53 %= *(void *)&prime;
                  }
                }

                else
                {
                  v53 &= *(void *)&prime - 1LL;
                }

                if (v53 != v47)
                {
                  if (!*(void *)(*v13 + 8 * v53))
                  {
                    *(void *)(*v13 + 8 * v53) = v46;
                    goto LABEL_76;
                  }

                  *uint8x8_t v46 = *v52;
                  void *v52 = **(void **)(*v13 + 8 * v53);
                  **(void **)(*v13 + 8 * v53) = v52;
                  v52 = v46;
                }

                unint64_t v53 = v47;
LABEL_76:
                uint8x8_t v46 = v52;
                v52 = (void *)*v52;
                unint64_t v47 = v53;
              }

              while (v52);
            }
          }

          unint64_t v22 = (unint64_t)prime;
          goto LABEL_80;
        }

        id v61 = (void *)*v13;
        void *v13 = 0LL;
        if (v61) {
          operator delete(v61);
        }
        unint64_t v22 = 0LL;
        *(void *)(v6 + 88) = 0LL;
      }
    }

LABEL_80:
    if ((v22 & (v22 - 1)) != 0)
    {
      if (v12 >= v22) {
        unint64_t v3 = v12 % v22;
      }
      else {
        unint64_t v3 = v12;
      }
    }

    else
    {
      unint64_t v3 = (v22 - 1) & v12;
    }

    goto LABEL_85;
  }

  while (1)
  {
    unint64_t v32 = v31[1];
    if (v32 == v12) {
      break;
    }
    if (v23.u32[0] > 1uLL)
    {
      if (v32 >= v22) {
        v32 %= v22;
      }
    }

    else
    {
      v32 &= v22 - 1;
    }

    if (v32 != v3) {
      goto LABEL_32;
    }
LABEL_31:
    unint64_t v31 = (void *)*v31;
    if (!v31) {
      goto LABEL_32;
    }
  }

  if (v31[2] != v12) {
    goto LABEL_31;
  }
  v60 = (void *)v63;
LABEL_95:
  if (v60) {
    operator delete(v60);
  }
LABEL_97:
  unint64_t v57 = (unint64_t)-[GPUTools::Diag::SwizzleMTLTracker getType](v8, "getType");
  if (v57 >= 4) {
    v58 = "_MTLCommandEncoder";
  }
  else {
    v58 = (&off_20860)[v57];
  }
  memset(v67, 0, 224);
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  snprintf((char *)&v65, 0x100uLL, "%s_%lu%s", "GPUToolsDebugInfo", v9, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", &v65));
  -[GPUTools::Diag::SwizzleMTLTracker insertDebugSignpost:](v8, "insertDebugSignpost:", v59);

  (*(void (**)(GPUTools::Diag::SwizzleMTLTracker *, objc_object *))(v6 + 560))(v8, a2);
}

void sub_6F54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 a13)
{
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools4Diag17SwizzleMTLTrackerC2EP11GTTransportPFbPKcP11objc_objectE_block_invoke( uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) dispatchMessage:v4 replyConnection:WeakRetained];
  }
}

void sub_7020( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::~__hash_table( uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      id v4 = (void *)v2[3];
      if (v4)
      {
        v2[4] = v4;
        operator delete(v4);
      }

      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  id v5 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

uint64_t std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table( uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  id v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::~__hash_table( uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (id *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<unsigned long const,GPUTools::Diag::Library>,0>(v2 + 2);
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  id v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void GTToolsDiagnostics_DylibMain(void)
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v0 infoDictionary]);

  v234 = (void *)v1;
  if (v1)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    unint64_t v3 = v2;
    if (v2)
    {
      [v2 operatingSystemVersion];
    }

    else
    {
      __int128 v239 = 0uLL;
      v240 = 0LL;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu.%lu",  (void)v239,  *((void *)&v239 + 1)));
    id v5 = v4;
    if ((uint64_t)v240 >= 1)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", @".%lu", v240));

      id v5 = (void *)v6;
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v234 objectForKeyedSubscript:@"LSMinimumSystemVersion"]);
    if (v7) {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v234 objectForKeyedSubscript:@"LSMinimumSystemVersion"]);
    }
    else {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v234 objectForKeyedSubscript:@"MinimumOSVersion"]);
    }
    id v9 = (void *)v8;

    if (v9 && ([v5 isEqualToString:v9] & 1) == 0)
    {
      id v10 = os_log_create("com.apple.runtime-issues", "Metal Diagnostics Warning");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v236 = [v9 UTF8String];
        __int16 v237 = 2080;
        id v238 = [v5 UTF8String];
        _os_log_fault_impl( &dword_0,  v10,  OS_LOG_TYPE_FAULT,  "Application Deployment Target Version (%s) does not match OS Version (%s) - diagnostics may be missing debug information",  buf,  0x16u);
      }
    }
  }

  id v11 = getenv("GT_HOST_URL_MTL_DIAGNOSTICS");
  if (!v11)
  {

LABEL_41:
    id v229 = v19;
    unint64_t v32 = operator new(0x238uLL);
    id v233 = v229;
    _OWORD *v32 = 0u;
    v32[1] = 0u;
    *((_DWORD *)v32 + 8) = 1065353216;
    *(_OWORD *)((char *)v32 + 40) = 0u;
    *(_OWORD *)((char *)v32 + 56) = 0u;
    *((_DWORD *)v32 + 18) = 1065353216;
    v32[5] = 0u;
    v32[6] = 0u;
    *((_DWORD *)v32 + 28) = 1065353216;
    *(_OWORD *)((char *)v32 + 120) = 0u;
    *(_OWORD *)((char *)v32 + 136) = 0u;
    *(_OWORD *)((char *)v32 + 152) = 0u;
    *(_OWORD *)((char *)v32 + 168) = 0u;
    *(_OWORD *)((char *)v32 + 184) = 0u;
    *(_OWORD *)((char *)v32 + 200) = 0u;
    *((void *)v32 + 27) = 0LL;
    *((_DWORD *)v32 + 56) = 1065353216;
    *((void *)v32 + 29) = 0LL;
    dispatch_queue_t v33 = dispatch_queue_create("com.apple.gputools.diagnostics_encoder_backtrace", 0LL);
    float v34 = (void *)*((void *)v32 + 29);
    *((void *)v32 + 29) = v33;

    v32[15] = 0u;
    *((void *)v32 + 42) = 0LL;
    v32[19] = 0u;
    v32[20] = 0u;
    v32[17] = 0u;
    v32[18] = 0u;
    v32[16] = 0u;
    *((_DWORD *)v32 + 86) = 1065353216;
    *((void *)v32 + 44) = 0LL;
    dispatch_queue_t v35 = dispatch_queue_create("com.apple.gputools.diagnostics_commandbuffer_backtrace", 0LL);
    BOOL v36 = (void *)*((void *)v32 + 44);
    *((void *)v32 + 44) = v35;

    *(_OWORD *)((char *)v32 + 360) = 0u;
    *(_OWORD *)((char *)v32 + 376) = 0u;
    dispatch_queue_t v37 = dispatch_queue_create("com.apple.gputools.diagnostics_log", 0LL);
    unint64_t v38 = (void *)*((void *)v32 + 45);
    *((void *)v32 + 45) = v37;

    dispatch_queue_t v39 = dispatch_queue_create("com.apple.gputools.diagnostics_library", 0LL);
    v40 = (void *)*((void *)v32 + 46);
    *((void *)v32 + 46) = v39;

    dispatch_queue_t v41 = dispatch_queue_create("com.apple.gputools.diagnostics_transport", 0LL);
    uint64_t v42 = (void *)*((void *)v32 + 47);
    *((void *)v32 + 47) = v41;

    objc_storeStrong((id *)&GPUTools::Diag::SwizzleMTLTracker::Transport, v19);
    GPUTools::Diag::SwizzleMTLTracker::Tracker = (uint64_t)v32;
    unint64_t v43 = v233;
    if (!v233)
    {
      v230 = (char *)dispatch_queue_create("com.apple.gputools.diagnostics", 0LL);
      uint64_t v44 = GTTransportServiceDaemonConnectionNew();
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      name = (char *)[[GTServiceProperties alloc] initWithProtocol:&OBJC_PROTOCOL___GTMTLDiagnosticsService];
      v231 = (char *)objc_alloc_init(&OBJC_CLASS___GTMTLDiagnosticsService);
      objc_storeStrong((id *)&GPUTools::Diag::SwizzleMTLTracker::FacilityImpl, v231);
      id v46 = [[GTMTLDiagnosticsServiceXPCDispatcher alloc] initWithService:v231 properties:name];
      objc_initWeak((id *)buf, v45);
      *(void *)&__int128 v239 = _NSConcreteStackBlock;
      *((void *)&v239 + 1) = 3221225472LL;
      v240 = ___ZN8GPUTools4Diag17SwizzleMTLTrackerC2EP11GTTransportPFbPKcP11objc_objectE_block_invoke;
      v241 = &unk_20800;
      objc_copyWeak(&v243, (id *)buf);
      unint64_t v47 = (dispatch_semaphore_s *)v46;
      v242 = v47;
      [v45 activateWithMessageHandler:&v239 andErrorHandler:&__block_literal_global_185];
      uint8x8_t v48 = (void *)objc_claimAutoreleasedReturnValue([v45 connection]);
      char v49 = registerService(v48, name);

      if ((v49 & 1) != 0)
      {
        id v50 = v45;
        uint64_t v51 = (void *)GPUTools::Diag::SwizzleMTLTracker::RetainedConnection;
        GPUTools::Diag::SwizzleMTLTracker::RetainedConnection = (uint64_t)v50;
      }

      else
      {
        uint64_t v51 = (void *)GPUTools::Diag::SwizzleMTLTracker::FacilityImpl;
        GPUTools::Diag::SwizzleMTLTracker::FacilityImpl = 0LL;
      }

      objc_destroyWeak(&v243);
      objc_destroyWeak((id *)buf);

      unint64_t v43 = 0LL;
    }

    v52 = NSClassFromString(@"MTLGPUDebugDevice");
    InstanceMethod = class_getInstanceMethod(v52, "newDefaultLibrary");
    if (InstanceMethod
      && (IMP v54 = method_setImplementation( InstanceMethod,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDefaultLibrary),  (*((void *)v32 + 49) = v54) != 0LL))
    {
      int v55 = &stru_20D90;
    }

    else
    {
      int v55 = (__CFString *)objc_claimAutoreleasedReturnValue( [&stru_20D90 stringByAppendingString:@"MTLGPUDebugDevice-@selector(newDefaultLibrary)\n"]);
    }

    unint64_t v56 = NSClassFromString(@"MTLGPUDebugDevice");
    unint64_t v57 = class_getInstanceMethod(v56, "newDefaultLibraryWithBundle:error:");
    if (!v57
      || (IMP v58 = method_setImplementation( v57,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDefaultLibraryWithBundle),  (*((void *)v32 + 50) = v58) == 0LL))
    {
      uint64_t v59 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugDevice-@selector(newDefaultLibraryWithBundle:error:)\n"));

      int v55 = (__CFString *)v59;
    }

    v60 = NSClassFromString(@"MTLGPUDebugDevice");
    id v61 = class_getInstanceMethod(v60, "newLibraryWithData:error:");
    if (!v61
      || (IMP v62 = method_setImplementation( v61,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithData),  (*((void *)v32 + 51) = v62) == 0LL))
    {
      uint64_t v63 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugDevice-@selector(newLibraryWithData:error:)\n"));

      int v55 = (__CFString *)v63;
    }

    v64 = NSClassFromString(@"MTLGPUDebugDevice");
    __int128 v65 = class_getInstanceMethod(v64, "newLibraryWithSource:options:completionHandler:");
    if (!v65
      || (IMP v66 = method_setImplementation( v65,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithSourceOptionsHandler),  (*((void *)v32 + 52) = v66) == 0LL))
    {
      uint64_t v67 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugDevice-@selector(newLibraryWithSource:options:completionHandler:)\n"));

      int v55 = (__CFString *)v67;
    }

    v68 = NSClassFromString(@"MTLGPUDebugDevice");
    v69 = class_getInstanceMethod(v68, "newLibraryWithSource:options:error:");
    if (!v69
      || (IMP v70 = method_setImplementation( v69,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithSourceOptionsError),  (*((void *)v32 + 53) = v70) == 0LL))
    {
      uint64_t v71 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugDevice-@selector(newLibraryWithSource:options:error:)\n"));

      int v55 = (__CFString *)v71;
    }

    v72 = NSClassFromString(@"MTLGPUDebugDevice");
    v73 = class_getInstanceMethod(v72, "newLibraryWithFile:error:");
    if (!v73
      || (IMP v74 = method_setImplementation( v73,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithFile),  (*((void *)v32 + 54) = v74) == 0LL))
    {
      uint64_t v75 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugDevice-@selector(newLibraryWithFile:error:)\n"));

      int v55 = (__CFString *)v75;
    }

    v76 = NSClassFromString(@"MTLGPUDebugDevice");
    v77 = class_getInstanceMethod(v76, "newLibraryWithURL:error:");
    if (!v77
      || (IMP v78 = method_setImplementation( v77,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithURL),  (*((void *)v32 + 55) = v78) == 0LL))
    {
      uint64_t v79 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugDevice-@selector(newLibraryWithURL:error:)\n"));

      int v55 = (__CFString *)v79;
    }

    v80 = NSClassFromString(@"MTLGPUDebugDevice");
    v81 = class_getInstanceMethod(v80, "newLibraryWithDAG:functions:error:");
    if (!v81
      || (IMP v82 = method_setImplementation( v81,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithDAG),  (*((void *)v32 + 56) = v82) == 0LL))
    {
      uint64_t v83 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugDevice-@selector(newLibraryWithDAG:functions:error:)\n"));

      int v55 = (__CFString *)v83;
    }

    v84 = NSClassFromString(@"MTLGPUDebugDevice");
    v85 = class_getInstanceMethod(v84, "newLibraryWithStitchedDescriptor:error:");
    if (!v85
      || (IMP v86 = method_setImplementation( v85,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptor),  (*((void *)v32 + 57) = v86) == 0LL))
    {
      uint64_t v87 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugDevice-@selector(newLibraryWithStitchedDescriptor:error:)\n"));

      int v55 = (__CFString *)v87;
    }

    BOOL v88 = NSClassFromString(@"MTLGPUDebugDevice");
    id v89 = class_getInstanceMethod(v88, "newLibraryWithStitchedDescriptor:completionHandler:");
    if (!v89
      || (IMP v90 = method_setImplementation( v89,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptorHandler),  (*((void *)v32 + 58) = v90) == 0LL))
    {
      uint64_t v91 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugDevice-@selector(newLibraryWithStitchedDescriptor:completionHandler:)\n"));

      int v55 = (__CFString *)v91;
    }

    v92 = NSClassFromString(@"MTLGPUDebugDevice");
    v93 = class_getInstanceMethod(v92, "newDynamicLibrary:error:");
    if (!v93
      || (IMP v94 = method_setImplementation( v93,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDynamicLibrary),  (*((void *)v32 + 59) = v94) == 0LL))
    {
      uint64_t v95 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugDevice-@selector(newDynamicLibrary:error:)\n"));

      int v55 = (__CFString *)v95;
    }

    uint64_t v96 = NSClassFromString(@"MTLGPUDebugDevice");
    v97 = class_getInstanceMethod(v96, "newDynamicLibraryWithURL:error:");
    if (!v97
      || (IMP v98 = method_setImplementation( v97,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDynamicLibraryWithURL),  (*((void *)v32 + 60) = v98) == 0LL))
    {
      uint64_t v99 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugDevice-@selector(newDynamicLibraryWithURL:error:)\n"));

      int v55 = (__CFString *)v99;
    }

    v100 = NSClassFromString(@"MTLGPUDebugLibrary");
    v101 = class_getInstanceMethod(v100, "newFunctionWithName:");
    if (!v101
      || (IMP v102 = method_setImplementation( v101,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithName),  (*((void *)v32 + 61) = v102) == 0LL))
    {
      uint64_t v103 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugLibrary-@selector(newFunctionWithName:)\n"));

      int v55 = (__CFString *)v103;
    }

    v104 = NSClassFromString(@"MTLGPUDebugLibrary");
    v105 = class_getInstanceMethod(v104, "newFunctionWithName:constantValues:completionHandler:");
    if (!v105
      || (IMP v106 = method_setImplementation( v105,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithNameConstantValuesHandler),  (*((void *)v32 + 62) = v106) == 0LL))
    {
      uint64_t v107 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugLibrary-@selector(newFunctionWithName:constantValues:completionHandler:)\n"));

      int v55 = (__CFString *)v107;
    }

    id v108 = NSClassFromString(@"MTLGPUDebugLibrary");
    uint64_t v109 = class_getInstanceMethod(v108, "newFunctionWithName:constantValues:error:");
    if (!v109
      || (IMP v110 = method_setImplementation( v109,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithNameConstantValuesError),  (*((void *)v32 + 63) = v110) == 0LL))
    {
      uint64_t v111 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugLibrary-@selector(newFunctionWithName:constantValues:error:)\n"));

      int v55 = (__CFString *)v111;
    }

    id v112 = NSClassFromString(@"MTLGPUDebugLibrary");
    v113 = class_getInstanceMethod(v112, "newFunctionWithDescriptor:completionHandler:");
    if (!v113
      || (IMP v114 = method_setImplementation( v113,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithDescriptorCompletionHandler),  (*((void *)v32 + 64) = v114) == 0LL))
    {
      uint64_t v115 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugLibrary-@selector(newFunctionWithDescriptor:completionHandler:)\n"));

      int v55 = (__CFString *)v115;
    }

    v116 = NSClassFromString(@"MTLGPUDebugLibrary");
    v117 = class_getInstanceMethod(v116, "newFunctionWithDescriptor:error:");
    if (!v117
      || (IMP v118 = method_setImplementation( v117,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithDescriptorError),  (*((void *)v32 + 65) = v118) == 0LL))
    {
      uint64_t v119 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugLibrary-@selector(newFunctionWithDescriptor:error:)\n"));

      int v55 = (__CFString *)v119;
    }

    v120 = NSClassFromString(@"MTLGPUDebugLibrary");
    v121 = class_getInstanceMethod(v120, "newIntersectionFunctionWithDescriptor:completionHandler:");
    if (!v121
      || (IMP v122 = method_setImplementation( v121,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorCompletionHandler),  (*((void *)v32 + 66) = v122) == 0LL))
    {
      uint64_t v123 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugLibrary-@selector(newIntersectionFunctionWithDescriptor:completionHandler:)\n"));

      int v55 = (__CFString *)v123;
    }

    v124 = NSClassFromString(@"MTLGPUDebugLibrary");
    id v125 = class_getInstanceMethod(v124, "newIntersectionFunctionWithDescriptor:error:");
    if (!v125
      || (IMP v126 = method_setImplementation( v125,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorError),  (*((void *)v32 + 67) = v126) == 0LL))
    {
      uint64_t v127 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLGPUDebugLibrary-@selector(newIntersectionFunctionWithDescriptor:error:)\n"));

      int v55 = (__CFString *)v127;
    }

    v128 = NSClassFromString(@"MTLLegacySVDevice");
    v129 = class_getInstanceMethod(v128, "newDefaultLibrary");
    if (!v129
      || (IMP v130 = method_setImplementation( v129,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDefaultLibrary),  (*((void *)v32 + 49) = v130) == 0LL))
    {
      uint64_t v131 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newDefaultLibrary)\n"));

      int v55 = (__CFString *)v131;
    }

    v132 = NSClassFromString(@"MTLLegacySVDevice");
    v133 = class_getInstanceMethod(v132, "newDefaultLibraryWithBundle:error:");
    if (!v133
      || (IMP v134 = method_setImplementation( v133,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDefaultLibraryWithBundle),  (*((void *)v32 + 50) = v134) == 0LL))
    {
      uint64_t v135 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newDefaultLibraryWithBundle:error:)\n"));

      int v55 = (__CFString *)v135;
    }

    v136 = NSClassFromString(@"MTLLegacySVDevice");
    v137 = class_getInstanceMethod(v136, "newLibraryWithData:error:");
    if (!v137
      || (IMP v138 = method_setImplementation( v137,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithData),  (*((void *)v32 + 51) = v138) == 0LL))
    {
      uint64_t v139 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newLibraryWithData:error:)\n"));

      int v55 = (__CFString *)v139;
    }

    unint64_t v140 = NSClassFromString(@"MTLLegacySVDevice");
    uint8x8_t v141 = class_getInstanceMethod(v140, "newLibraryWithSource:options:completionHandler:");
    if (!v141
      || (IMP v142 = method_setImplementation( v141,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithSourceOptionsHandler),  (*((void *)v32 + 52) = v142) == 0LL))
    {
      uint64_t v143 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newLibraryWithSource:options:completionHandler:)\n"));

      int v55 = (__CFString *)v143;
    }

    unint64_t v144 = NSClassFromString(@"MTLLegacySVDevice");
    unint64_t v145 = class_getInstanceMethod(v144, "newLibraryWithSource:options:error:");
    if (!v145
      || (IMP v146 = method_setImplementation( v145,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithSourceOptionsError),  (*((void *)v32 + 53) = v146) == 0LL))
    {
      uint64_t v147 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newLibraryWithSource:options:error:)\n"));

      int v55 = (__CFString *)v147;
    }

    unint64_t v148 = NSClassFromString(@"MTLLegacySVDevice");
    v149 = class_getInstanceMethod(v148, "newLibraryWithFile:error:");
    if (!v149
      || (IMP v150 = method_setImplementation( v149,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithFile),  (*((void *)v32 + 54) = v150) == 0LL))
    {
      uint64_t v151 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newLibraryWithFile:error:)\n"));

      int v55 = (__CFString *)v151;
    }

    v152 = NSClassFromString(@"MTLLegacySVDevice");
    id v153 = class_getInstanceMethod(v152, "newLibraryWithURL:error:");
    if (!v153
      || (IMP v154 = method_setImplementation( v153,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithURL),  (*((void *)v32 + 55) = v154) == 0LL))
    {
      uint64_t v155 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newLibraryWithURL:error:)\n"));

      int v55 = (__CFString *)v155;
    }

    v156 = NSClassFromString(@"MTLLegacySVDevice");
    BOOL v157 = class_getInstanceMethod(v156, "newLibraryWithDAG:functions:error:");
    if (!v157
      || (IMP v158 = method_setImplementation( v157,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithDAG),  (*((void *)v32 + 56) = v158) == 0LL))
    {
      uint64_t v159 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newLibraryWithDAG:functions:error:)\n"));

      int v55 = (__CFString *)v159;
    }

    v160 = NSClassFromString(@"MTLLegacySVDevice");
    uint64_t v161 = class_getInstanceMethod(v160, "newLibraryWithStitchedDescriptor:error:");
    if (!v161
      || (IMP v162 = method_setImplementation( v161,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptor),  (*((void *)v32 + 57) = v162) == 0LL))
    {
      uint64_t v163 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newLibraryWithStitchedDescriptor:error:)\n"));

      int v55 = (__CFString *)v163;
    }

    id v164 = NSClassFromString(@"MTLLegacySVDevice");
    v165 = class_getInstanceMethod(v164, "newLibraryWithStitchedDescriptor:completionHandler:");
    if (!v165
      || (IMP v166 = method_setImplementation( v165,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newLibraryWithStitchedDescriptorHandler),  (*((void *)v32 + 58) = v166) == 0LL))
    {
      uint64_t v167 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newLibraryWithStitchedDescriptor:completionHandler:)\n"));

      int v55 = (__CFString *)v167;
    }

    v168 = NSClassFromString(@"MTLLegacySVDevice");
    v169 = class_getInstanceMethod(v168, "newDynamicLibrary:error:");
    if (!v169
      || (IMP v170 = method_setImplementation( v169,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDynamicLibrary),  (*((void *)v32 + 59) = v170) == 0LL))
    {
      uint64_t v171 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newDynamicLibrary:error:)\n"));

      int v55 = (__CFString *)v171;
    }

    v172 = NSClassFromString(@"MTLLegacySVDevice");
    id v173 = class_getInstanceMethod(v172, "newDynamicLibraryWithURL:error:");
    if (!v173
      || (IMP v174 = method_setImplementation( v173,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugDevice_newDynamicLibraryWithURL),  (*((void *)v32 + 60) = v174) == 0LL))
    {
      uint64_t v175 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVDevice-@selector(newDynamicLibraryWithURL:error:)\n"));

      int v55 = (__CFString *)v175;
    }

    uint64_t v176 = NSClassFromString(@"MTLLegacySVLibrary");
    v177 = class_getInstanceMethod(v176, "newFunctionWithName:");
    if (!v177
      || (IMP v178 = method_setImplementation( v177,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithName),  (*((void *)v32 + 61) = v178) == 0LL))
    {
      uint64_t v179 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVLibrary-@selector(newFunctionWithName:)\n"));

      int v55 = (__CFString *)v179;
    }

    v180 = NSClassFromString(@"MTLLegacySVLibrary");
    id v181 = class_getInstanceMethod(v180, "newFunctionWithName:constantValues:completionHandler:");
    if (!v181
      || (IMP v182 = method_setImplementation( v181,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithNameConstantValuesHandler),  (*((void *)v32 + 62) = v182) == 0LL))
    {
      uint64_t v183 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVLibrary-@selector(newFunctionWithName:constantValues:completionHandler:)\n"));

      int v55 = (__CFString *)v183;
    }

    v184 = NSClassFromString(@"MTLLegacySVLibrary");
    v185 = class_getInstanceMethod(v184, "newFunctionWithName:constantValues:error:");
    if (!v185
      || (IMP v186 = method_setImplementation( v185,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithNameConstantValuesError),  (*((void *)v32 + 63) = v186) == 0LL))
    {
      uint64_t v187 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVLibrary-@selector(newFunctionWithName:constantValues:error:)\n"));

      int v55 = (__CFString *)v187;
    }

    v188 = NSClassFromString(@"MTLLegacySVLibrary");
    v189 = class_getInstanceMethod(v188, "newFunctionWithDescriptor:completionHandler:");
    if (!v189
      || (IMP v190 = method_setImplementation( v189,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithDescriptorCompletionHandler),  (*((void *)v32 + 64) = v190) == 0LL))
    {
      uint64_t v191 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVLibrary-@selector(newFunctionWithDescriptor:completionHandler:)\n"));

      int v55 = (__CFString *)v191;
    }

    __int128 v192 = NSClassFromString(@"MTLLegacySVLibrary");
    __int128 v193 = class_getInstanceMethod(v192, "newFunctionWithDescriptor:error:");
    if (!v193
      || (IMP v194 = method_setImplementation( v193,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newFunctionWithDescriptorError),  (*((void *)v32 + 65) = v194) == 0LL))
    {
      uint64_t v195 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVLibrary-@selector(newFunctionWithDescriptor:error:)\n"));

      int v55 = (__CFString *)v195;
    }

    id v196 = NSClassFromString(@"MTLLegacySVLibrary");
    __int128 v197 = class_getInstanceMethod(v196, "newIntersectionFunctionWithDescriptor:completionHandler:");
    if (!v197
      || (IMP v198 = method_setImplementation( v197,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorCompletionHandler),  (*((void *)v32 + 66) = v198) == 0LL))
    {
      uint64_t v199 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVLibrary-@selector(newIntersectionFunctionWithDescriptor:completionHandler:)\n"));

      int v55 = (__CFString *)v199;
    }

    __int128 v200 = NSClassFromString(@"MTLLegacySVLibrary");
    __int128 v201 = class_getInstanceMethod(v200, "newIntersectionFunctionWithDescriptor:error:");
    if (!v201
      || (IMP v202 = method_setImplementation( v201,  (IMP)GPUTools::Diag::SwizzleMTLTracker::MTLGPUDebugLibrary_newIntersectionFunctionWithDescriptorError),  (*((void *)v32 + 67) = v202) == 0LL))
    {
      uint64_t v203 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"MTLLegacySVLibrary-@selector(newIntersectionFunctionWithDescriptor:error:)\n"));

      int v55 = (__CFString *)v203;
    }

    __int128 v204 = NSClassFromString(@"_MTLCommandBuffer");
    __int128 v205 = class_getInstanceMethod(v204, "commit");
    if (!v205
      || (IMP v206 = method_setImplementation(v205, (IMP)GPUTools::Diag::SwizzleMTLTracker::_MTLCommandBuffer_commit),
          (*((void *)v32 + 68) = v206) == 0LL))
    {
      uint64_t v207 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"_MTLCommandBuffer-@selector(commit)\n"));

      int v55 = (__CFString *)v207;
    }

    __int128 v208 = NSClassFromString(@"_MTLCommandQueue");
    v209 = class_getInstanceMethod(v208, "commandBufferWithDescriptor:");
    if (!v209
      || (IMP v210 = method_setImplementation( v209,  (IMP)GPUTools::Diag::SwizzleMTLTracker::_MTLCommandQueue_commandBufferWithDescriptor),  (*((void *)v32 + 69) = v210) == 0LL))
    {
      uint64_t v211 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"_MTLCommandQueue-@selector(commandBufferWithDescriptor:)\n"));

      int v55 = (__CFString *)v211;
    }

    v212 = NSClassFromString(@"_MTLCommandEncoder");
    id v213 = class_getInstanceMethod(v212, "endEncoding");
    if (!v213
      || (IMP v214 = method_setImplementation(v213, (IMP)GPUTools::Diag::SwizzleMTLTracker::_MTLCommandEncoder_endEncoding),
          (*((void *)v32 + 70) = v214) == 0LL))
    {
      uint64_t v215 = objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingString:]( v55,  "stringByAppendingString:",  @"_MTLCommandEncoder-@selector(endEncoding)\n"));

      int v55 = (__CFString *)v215;
    }

    v216 = v55;

    v217 = v216;
    id v218 = -[__CFString length](v217, "length");

    if (v218) {
      uint64_t v219 = 0LL;
    }
    else {
      uint64_t v219 = (uint64_t)v32;
    }
    v220 = v217;
    -[__CFString length](v220, "length");
    v221 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
    v222 = (void *)objc_claimAutoreleasedReturnValue(v221);
    v224 = (void *)objc_claimAutoreleasedReturnValue( +[GTTransportMessage_tools_diagnostics messageWithKind:objectPayload:]( &OBJC_CLASS___GTTransportMessage_tools_diagnostics,  "messageWithKind:objectPayload:",  4355LL,  v222));
    [v223 send:v224 error:0];

    goto LABEL_174;
  }

  unint64_t v12 = v11;
  uint64_t v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
  if (!v13) {
    __assert_rtn("GTTransport *DYCreateTransportC(const char *)", "", 0, "url_str");
  }
  uint64_t v14 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v13);
  uint64_t v15 = v14;
  if (!v14)
  {
    if (s_logUsingOsLog)
    {
      v225 = (os_log_s *)gt_default_log();
      if (!os_log_type_enabled(v225, OS_LOG_TYPE_FAULT)) {
        goto LABEL_182;
      }
      LODWORD(v239) = 136315138;
      *(void *)((char *)&v239 + 4) = v12;
      v226 = "fail: [create_transport] failed to parse GT_HOST_URL: %s";
LABEL_181:
      _os_log_fault_impl(&dword_0, v225, OS_LOG_TYPE_FAULT, v226, (uint8_t *)&v239, 0xCu);
      goto LABEL_182;
    }

    v227 = __stderrp;
    v228 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"fail: [create_transport] failed to parse GT_HOST_URL: %s",  v12),  "UTF8String");
LABEL_186:
    fprintf(v227, "%s\n", v228);
LABEL_182:
    abort();
  }

  unint64_t v16 = -[NSURL scheme](v14, "scheme");
  if (-[NSString isEqualToString:](v16, "isEqualToString:", @"null"))
  {
    id v17 = 0LL;
    goto LABEL_28;
  }

  if (-[NSString isEqualToString:](v16, "isEqualToString:", @"file"))
  {
    id v20 = off_200C8;
  }

  else
  {
    if (!-[NSString isEqualToString:](v16, "isEqualToString:", @"dysmt")
      && !-[NSString isEqualToString:](v16, "isEqualToString:", @"dysmtdeferred"))
    {
      goto LABEL_178;
    }

    id v20 = off_200C0;
  }

  id v17 = [objc_alloc(*v20) initWithMode:1];
  [v17 setUrl:v15];
  if (!v17)
  {
LABEL_178:
    if (s_logUsingOsLog)
    {
      v225 = (os_log_s *)gt_default_log();
      if (!os_log_type_enabled(v225, OS_LOG_TYPE_FAULT)) {
        goto LABEL_182;
      }
      LODWORD(v239) = 136315138;
      *(void *)((char *)&v239 + 4) = v12;
      v226 = "fail: [create_transport] failed to create transport; GT_HOST_URL: %s";
      goto LABEL_181;
    }

    v227 = __stderrp;
    v228 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"fail: [create_transport] failed to create transport; GT_HOST_URL: %s",
               v12),
             "UTF8String");
    goto LABEL_186;
  }

LABEL_28:

  {
    unint64_t v22 = (os_log_s *)dispatch_queue_create("gputools.diagnostics_sync", 0LL);
    [v23 setMessageHandler:&__block_literal_global_9];
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0LL);
    *(void *)&__int128 v239 = _NSConcreteStackBlock;
    *((void *)&v239 + 1) = 3221225472LL;
    v240 = ___ZL24InitTransportWithHostURLPKc_block_invoke_40;
    v241 = &unk_20988;
    uint64_t v25 = v24;
    v242 = v25;
    [v23 setRegistrationHandler:&v239];
    [v23 resume];
    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    if (([v26 BOOLResult] & 1) == 0)
    {
      if (s_logUsingOsLog)
      {
        id v27 = gt_default_log();
        unint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl( &dword_0,  v28,  OS_LOG_TYPE_FAULT,  "fail: Failed to connect to transport in tools diagnostics dylib",  buf,  2u);
        }
      }

      else
      {
        unint64_t v31 = __stderrp;
        unint64_t v28 = (os_log_s *) objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"fail: Failed to connect to transport in tools diagnostics dylib"));
        fprintf(v31, "%s\n", (const char *)-[os_log_s UTF8String](v28, "UTF8String"));
      }
    }
  }

  else if (s_logUsingOsLog)
  {
    id v29 = gt_default_log();
    unint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v239) = 0;
      _os_log_fault_impl( &dword_0,  v22,  OS_LOG_TYPE_FAULT,  "fail: Failed to init transport in tools diagnostics dylib",  (uint8_t *)&v239,  2u);
    }
  }

  else
  {
    uint8x8_t v30 = __stderrp;
    unint64_t v22 = (os_log_s *) objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"fail: Failed to init transport in tools diagnostics dylib"));
    fprintf(v30, "%s\n", (const char *)-[os_log_s UTF8String](v22, "UTF8String"));
  }

    goto LABEL_41;
LABEL_174:
}

void sub_87F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *a26, id location)
{
  _Unwind_Resume(a1);
}

void GTToolsDiagnostics_DylibExit(void)
{
  {
    uint64_t v1 = (void *)GPUTools::Diag::SwizzleMTLTracker::Transport;
    GPUTools::Diag::SwizzleMTLTracker::Transport = 0LL;

    GPUTools::Diag::SwizzleMTLTracker::Tracker = 0LL;
    id v2 = v0[46];
    v0[46] = 0LL;

    id v3 = v0[45];
    v0[45] = 0LL;

    GPUTools::Diag::BacktraceStore::~BacktraceStore((GPUTools::Diag::BacktraceStore *)(v0 + 30));
    GPUTools::Diag::BacktraceStore::~BacktraceStore((GPUTools::Diag::BacktraceStore *)(v0 + 15));
    std::__hash_table<std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<unsigned long>>>>::~__hash_table((uint64_t)(v0 + 10));
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table((uint64_t)(v0 + 5));
    id v4 = (void *)std::__hash_table<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,GPUTools::Diag::Library>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,GPUTools::Diag::Library>>>::~__hash_table((uint64_t)v0);
    operator delete(v4);
  }

uint64_t ___ZL24InitTransportWithHostURLPKc_block_invoke_40(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ___ZL24InitTransportWithHostURLPKc_block_invoke(id a1, GTTransportMessage_tools_diagnostics *a2)
{
  id v2 = a2;
  if (-[GTTransportMessage_tools_diagnostics kind](v2, "kind") == 4353)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[GTTransportMessage_tools_diagnostics plistPayload](v2, "plistPayload"));
    id v4 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"message"]);
    id v5 = [v4 cStringUsingEncoding:4];
    uint64_t v6 = os_log_create("com.apple.runtime-issues", "Metal Diagnostics");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315138;
      id v8 = v5;
      _os_log_fault_impl(&dword_0, v6, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v7, 0xCu);
    }
  }
}

void sub_8CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFStringRef _StringForError(uint64_t a1)
{
  if (a1 <= 511)
  {
    switch(a1)
    {
      case 1LL:
        return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid filename (%ld)",  1LL);
      case 2LL:
        return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"data is too large (%ld)",  2LL);
      case 3LL:
        return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IO failure (%ld)",  3LL);
      case 4LL:
        return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"out of memory (%ld)",  4LL);
      case 5LL:
        uint64_t v3 = 5LL;
        goto LABEL_64;
      case 6LL:
        uint64_t v3 = 6LL;
LABEL_64:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to connect to the device. (%ld)",  v3);
        break;
      case 7LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"read-only capture archive (%ld)",  7LL);
        break;
      case 8LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"truncated capture archive store (%ld)",  8LL);
        break;
      case 9LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"truncated capture archive index (%ld)",  9LL);
        break;
      case 10LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid capture archive index (%ld)",  10LL);
        break;
      case 11LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unknown capture archive index version (%ld)",  11LL);
        break;
      case 12LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"file exists in capture archive (%ld)",  12LL);
        break;
      case 13LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"file does not exists in capture archive (%ld)",  13LL);
        break;
      case 14LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"capture archive does not exist (%ld)",  14LL);
        break;
      case 15LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"missing capture archive index (%ld)",  15LL);
        break;
      case 16LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid capture archive metadata (%ld)",  16LL);
        break;
      case 17LL:
      case 27LL:
        return 0LL;
      case 18LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"corrupted capture archive store (%ld)",  18LL);
        break;
      case 19LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"could not write capture archive metadata (%ld)",  19LL);
        break;
      case 20LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"capture archive has been closed (%ld)",  20LL);
        break;
      case 21LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"already tried to launch guest app (%ld)",  21LL);
        break;
      case 22LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid launch dictionary (%ld)",  22LL);
        break;
      case 23LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"guest app not found (%ld)",  23LL);
        break;
      case 24LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"guest app launch timed out (%ld)",  24LL);
        break;
      case 25LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid guest app session (%ld)",  25LL);
        break;
      case 26LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"guest app has not been launched yet (%ld)",  26LL);
        break;
      case 28LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"did not find interpose dylib (%ld)",  28LL);
        break;
      case 29LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to launch guest app (%ld)",  29LL);
        break;
      case 30LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"guest app terminated (%ld)",  30LL);
        break;
      case 31LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"lost transport connection (%ld)",  31LL);
        break;
      case 32LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid transport (%ld)",  32LL);
        break;
      case 33LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"transport is not connected (%ld)",  33LL);
        break;
      case 34LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"message has already been sent (%ld)",  34LL);
        break;
      case 35LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"in-reply-to message has not been sent (%ld)",  35LL);
        break;
      case 36LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to encode message attributes (%ld)",  36LL);
        break;
      case 37LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"connect timed out (%ld)",  37LL);
        break;
      case 38LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"undefined socket path (%ld)",  38LL);
        break;
      case 39LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"socket path is too long (%ld)",  39LL);
        break;
      case 40LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"message originated from this transport (%ld)",  40LL);
        break;
      case 41LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"initialized function stream with immutable data but swapping is required (%ld)",  41LL);
        break;
      case 42LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"transfer refused (%ld)",  42LL);
        break;
      case 43LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"protocol error (%ld)",  43LL);
        break;
      case 44LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"path outside destination root (%ld)",  44LL);
        break;
      case 45LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"transfer aborted (%ld)",  45LL);
        break;
      case 46LL:
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unknown item type (%ld)",  46LL);
        break;
      default:
        switch(a1)
        {
          case 256LL:
            result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid socket descriptor (%ld)",  256LL);
            break;
          case 257LL:
            result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid socket url (%ld)",  257LL);
            break;
          case 258LL:
            result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"transport source cancelled (%ld)",  258LL);
            break;
          case 259LL:
            result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"corrupt transport message header (%ld)",  259LL);
            break;
          case 260LL:
            result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"corrupt transport message attributes (%ld)",  260LL);
            break;
          case 261LL:
            result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"message too large (%ld)",  261LL);
            break;
          default:
            return 0LL;
        }

        break;
    }

    return result;
  }

  if (a1 <= 2047)
  {
    if (a1 <= 1023)
    {
      uint64_t v2 = a1 - 512;
      result = @"Device connection lost.";
      switch(v2)
      {
        case 0LL:
          result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"guest app crashed (%ld)",  512LL);
          break;
        case 1LL:
          result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"another capture session is active (%ld)",  513LL);
          break;
        case 2LL:
          result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"capture session is already active (%ld)",  514LL);
          break;
        case 3LL:
          result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"capture session activation failed (%ld)",  515LL);
          break;
        case 4LL:
          result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"inferior already running (%ld)",  516LL);
          break;
        case 5LL:
          result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GL dispatch table mismatch (%ld)",  517LL);
          break;
        case 6LL:
          result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"inferior and host session ids mismatch (%ld)",  518LL);
          break;
        case 7LL:
          return result;
        default:
          return 0LL;
      }

      return result;
    }

    if (a1 <= 1279)
    {
      switch(a1)
      {
        case 1024LL:
          return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"truncated data (%ld)",  1024LL);
        case 1025LL:
          return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid transport message payload (%ld)",  1025LL);
        case 1026LL:
          return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unexpected transport message (%ld)",  1026LL);
      }
    }

    else if (a1 > 1791)
    {
      if (a1 == 1792) {
        return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no data (%ld)",  1792LL);
      }
      if (a1 == 1793) {
        return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"guest app session error (%ld)",  1793LL);
      }
    }

    else
    {
      if (a1 == 1280) {
        return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid function stream header (%ld)",  1280LL);
      }
      if (a1 == 1536) {
        return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"position does not exist in archive (%ld)",  1536LL);
      }
    }

    return 0LL;
  }

  if (a1 <= 4351)
  {
    if (a1 > 2304)
    {
      switch(a1)
      {
        case 2305LL:
          return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no archive data (%ld)",  2305LL);
        case 2306LL:
          return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no thumbnail support (%ld)",  2306LL);
        case 4096LL:
          return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to create core symbolicator (%ld)",  4096LL);
      }
    }

    else
    {
      switch(a1)
      {
        case 2048LL:
          return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"already replaying (%ld)",  2048LL);
        case 2049LL:
          return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no loaded archives (%ld)",  2049LL);
        case 2304LL:
          return (const __CFString *)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"no resource streamer (%ld)",  2304LL);
      }
    }

    return 0LL;
  }

  switch(a1)
  {
    case 4608LL:
      result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot find the specified username and host (%ld)",  4608LL);
      break;
    case 4609LL:
      result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Specified remote machine is not available. Please make sure to login with specified user (%ld)",  4609LL);
      break;
    case 4610LL:
      result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot find the target path provided (%ld)",  4610LL);
      break;
    case 4611LL:
      result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot authenticate SSH, make sure the authentication is done right (%ld)",  4611LL);
      break;
    case 4612LL:
      result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot find Xcode.app on the remote machine. Please make sure that Xcode.app is in the Applications folder (%ld)",  4612LL);
      break;
    case 4613LL:
      result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Metal.framework is not available on the remote machine (%ld)",  4613LL);
      break;
    case 4614LL:
      result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing environment variables, please make sure all the required environment variables are enabled (%ld)",  4614LL);
      break;
    default:
      if (a1 == 4352)
      {
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Shader profiler failed due to an internal error (%ld)",  4352LL);
      }

      else
      {
        if (a1 != 4353) {
          return 0LL;
        }
        result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Shader profiler does not support multi-context captures (%ld)",  4353LL);
      }

      break;
  }

  return result;
}

void sub_9880(_Unwind_Exception *a1)
{
  uint64_t v3 = (void *)std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_9B5C(_Unwind_Exception *a1)
{
}

void sub_9E38(_Unwind_Exception *a1)
{
}

void std::__hash_table<std::__hash_value_type<long long,objc_object {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object {objcproto8NSObject}*>>::__rehash<true>( uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }

    else
    {
      uint64_t v13 = 1LL << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }

    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      unint64_t v16 = *(void **)a1;
      *(void *)a1 = 0LL;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0LL;
      return;
    }
  }

  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  id v5 = operator new(8 * prime);
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0LL;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0LL;
  while (prime != v7);
  id v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }

    else
    {
      v9 &= prime - 1;
    }

    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    uint64_t v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }

        else
        {
          v15 &= prime - 1;
        }

        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }

          *id v8 = *v14;
          void *v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          uint64_t v14 = v8;
        }

        size_t v15 = v9;
LABEL_31:
        id v8 = v14;
        uint64_t v14 = (void *)*v14;
        size_t v9 = v15;
      }

      while (v14);
    }
  }

LABEL_16:
      abort();
    }

    uint8x8_t v10 = __stderrp;
    unint64_t v11 = @"fail: queue cannot be NULL";
LABEL_15:
    fprintf( v10,  "%s\n",  -[NSString UTF8String]( +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, a4),  "UTF8String"));
    goto LABEL_16;
  }

  if (!a4)
  {
    if (s_logUsingOsLog)
    {
      id v8 = (os_log_s *)gt_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        size_t v9 = "fail: block cannot be NULL";
LABEL_12:
        _os_log_fault_impl(&dword_0, v8, OS_LOG_TYPE_FAULT, v9, buf, 2u);
        abort();
      }

      goto LABEL_16;
    }

    uint8x8_t v10 = __stderrp;
    unint64_t v11 = @"fail: block cannot be NULL";
    goto LABEL_15;
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GTContinuation_tools_diagnostics;
  uint64_t v6 = -[GTContinuation_tools_diagnostics init](&v12, "init");
  if (v6)
  {
    dispatch_retain((dispatch_object_t)a3);
    v6->queue = (OS_dispatch_queue *)a3;
    v6->block = [a4 copy];
  }

  return v6;
}

      abort();
    }

    size_t v15 = __stderrp;
    unint64_t v16 = @"fail: queue cannot be NULL";
LABEL_15:
    fprintf( v15,  "%s\n",  -[NSString UTF8String]( +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v16, a4),  "UTF8String"));
    goto LABEL_16;
  }

  if (!a4)
  {
    if (s_logUsingOsLog)
    {
      uint64_t v13 = (os_log_s *)gt_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v14 = "fail: transport cannot be nil";
LABEL_12:
        _os_log_fault_impl(&dword_0, v13, OS_LOG_TYPE_FAULT, v14, buf, 2u);
        abort();
      }

      goto LABEL_16;
    }

    size_t v15 = __stderrp;
    unint64_t v16 = @"fail: transport cannot be nil";
    goto LABEL_15;
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___GTTransportSource_tools_diagnostics;
  uint64_t v6 = -[GTTransportSource_tools_diagnostics init](&v18, "init");
  if (v6)
  {
    v6->_transport = (GTTransport_tools_diagnostics *)a4;
    uint64_t v7 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"gputools.%@.%p.%@",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", object_getClassName(v6)),  v6,  @"manager"),  "UTF8String");
    id v8 = dispatch_queue_create_with_target_V2(v7, 0LL, (dispatch_queue_t)a3);
    v6->_queue = (OS_dispatch_queue *)v8;
    dispatch_suspend(v8);
    size_t v9 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"gputools.%@.%p.%@",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", object_getClassName(v6)),  v6,  @"message"),  "UTF8String");
    uint8x8_t v10 = dispatch_queue_create_with_target_V2(v9, 0LL, (dispatch_queue_t)a3);
    v6->_mqueue = (OS_dispatch_queue *)v10;
    dispatch_suspend(v10);
    queue = (dispatch_queue_s *)v6->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __46__GTTransportSource__initWithQueue_transport___block_invoke;
    block[3] = &unk_20988;
    void block[4] = v6;
    dispatch_async(queue, block);
  }

  return v6;
}

    LOBYTE(v7) = 0;
    return v7;
  }

  uint64_t v7 = -[GTTransport_tools_diagnostics _packMessage:error:](self, "_packMessage:error:", a3, a4);
  if (v7)
  {
    isa = self[1].super.isa;
    size_t v9 = BYTE1(self->_interposerVersion);
    if (v9) {
      dispatch_suspend((dispatch_object_t)self->_queue);
    }
    sendQueue = self->_sendQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __34__GTTransport_relayMessage_error___block_invoke;
    v14[3] = &unk_20B40;
    size_t v15 = v9;
    void v14[4] = self;
    v14[5] = a3;
    ((void (*)(OS_dispatch_queue *, void *))isa)(sendQueue, v14);
    LOBYTE(v7) = 1;
  }

  return v7;
}

void sub_C5A0(_Unwind_Exception *exception_object)
{
}

void sub_C5D8(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    if (a2 == 2)
    {
      *(void *)(v2 + 40) = 0LL;
      objc_end_catch();
    }

    JUMPOUT(0xC534LL);
  }

  JUMPOUT(0xC5C8LL);
}

void __clang_call_terminate(void *a1)
{
}

void sub_D660( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_36:
    LOBYTE(v15) = 0;
    return v15;
  }

  size_t v15 = -[GTTransport_tools_diagnostics _packMessage:error:](self, "_packMessage:error:", a3, a5);
  if (v15)
  {
    unint64_t v16 = -[GTTransport_tools_diagnostics _nextMessageSerial](self, "_nextMessageSerial");
    if (a4) {
      id v17 = (uint64_t)[a4 serial];
    }
    else {
      id v17 = 0xFFFFFFFFLL;
    }
    [a3 _setSerial:v16 replySerial:v17 transport:self];
    if (a8)
    {
      uint64_t v18 = -[GTContinuation_tools_diagnostics initWithQueue:block:]( objc_alloc(&OBJC_CLASS___GTTransportMessageReplyContinuation_tools_diagnostics),  "initWithQueue:block:",  a6,  a8);
      id v19 = v18;
      p_invalid = &self->_invalid;
      do
        __int128 v21 = __ldaxr((unsigned int *)p_invalid);
      while (__stlxr(v21 + 1, (unsigned int *)p_invalid));
      isa = self[1].super.isa;
      id v23 = BYTE1(self->_interposerVersion);
      if (v18)
      {
        if (a7)
        {
          v18->timeout = a7;
          dispatch_semaphore_t v24 = dispatch_time(0LL, a7);
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke;
          block[3] = &unk_20A28;
          void block[4] = self;
          v40 = v16;
          dispatch_after(v24, (dispatch_queue_t)queue, block);
        }

        unint64_t v26 = self->_queue;
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_2;
        v37[3] = &unk_20AC8;
        v37[4] = self;
        v37[5] = v19;
        unint64_t v38 = v16;
        dispatch_sync((dispatch_queue_t)v26, v37);
        if (!v23) {
          goto LABEL_24;
        }
      }

      else if (!BYTE1(self->_interposerVersion))
      {
LABEL_24:
        id v29 = 0;
        goto LABEL_25;
      }
    }

    else
    {
      id v27 = &self->_invalid;
      do
        unint64_t v28 = __ldaxr((unsigned int *)v27);
      while (__stlxr(v28 + 1, (unsigned int *)v27));
      id v19 = 0LL;
      isa = self[1].super.isa;
      id v29 = BYTE1(self->_interposerVersion);
      if (!v29) {
        goto LABEL_25;
      }
    }

    dispatch_suspend((dispatch_object_t)self->_queue);
    id v29 = 1;
LABEL_25:
    sendQueue = self->_sendQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_3;
    v34[3] = &unk_20B18;
    BOOL v36 = v29;
    v34[4] = self;
    v34[5] = v19;
    v34[6] = a3;
    dispatch_queue_t v35 = v16;
    ((void (*)(OS_dispatch_queue *, void *))isa)(sendQueue, v34);

    LOBYTE(v15) = 1;
  }

  return v15;
}

void __Block_byref_object_copy__76(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__77(uint64_t a1)
{
}

void sub_E948(_Unwind_Exception *a1)
{
}

void sub_EA00(_Unwind_Exception *a1)
{
}

uint64_t GPUTools::VMBuffer::_alloc(GPUTools::VMBuffer *this, vm_size_t a2, uint64_t a3)
{
  int v3 = 0;
  vm_address_t address = 0LL;
  if (3 * vm_page_size <= a2) {
    vm_size_t v4 = (a2 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  }
  else {
    vm_size_t v4 = 3 * vm_page_size;
  }
  vm_size_t v5 = v4 + v4 * a3;
  while (1)
  {
    vm_map_t v6 = mach_task_self_;
    vm_size_t v7 = vm_page_size + v5;
    if (!vm_allocate(mach_task_self_, &address, vm_page_size + v5, 1))
    {
      vm_address_t v8 = address;
      vm_address_t v9 = address + v4;
      target_vm_address_t address = address + v4;
      uint64_t v10 = a3;
      if (a3)
      {
        while (!vm_deallocate(v6, v9, v4)
             && !vm_remap(v6, &target_address, v4, 0LL, 0, v6, address, 0, &cur_protection, &v15, 2u))
        {
          vm_address_t v9 = target_address + v4;
          target_address += v4;
          if (!--v10)
          {
            vm_address_t v8 = address;
            goto LABEL_11;
          }
        }

        goto LABEL_12;
      }

LABEL_11:
      if (!vm_protect(v6, v8 + v7 - vm_page_size, vm_page_size, 0, 0)) {
        break;
      }
    }

LABEL_12:
    vm_deallocate(mach_task_self_, address, vm_page_size + v5);
    if (++v3 == 5) {
      return 0LL;
    }
  }

  *(void *)this = address;
  *((void *)this + 1) = v4;
  *((void *)this + 2) = a3;
  return 1LL;
}

vm_address_t *GPUTools::VMBuffer::_dealloc(vm_address_t *this)
{
  if (*this)
  {
    uint64_t v1 = this;
    this = (vm_address_t *)vm_deallocate(mach_task_self_, *this, vm_page_size + this[1] + this[1] * this[2]);
    v1[1] = 0LL;
    v1[2] = 0LL;
    vm_address_t *v1 = 0LL;
  }

  return this;
}

LABEL_20:
          iov += v18;
          uint64_t v14 = v7 - ((unint64_t)((char *)iov - (char *)self->_iov) >> 4);
        }

        id v17 = *v16;
      }

      while (*v16 == 4);
      if (v17 != 35) {
        break;
      }
      if (LOBYTE(self->super._interposerVersion))
      {
        if (a3) {
          *a3 = -[GTTransport_tools_diagnostics error](self, "error");
        }
        goto LABEL_24;
      }

      -[GTBaseStreamTransport_tools_diagnostics _waitEAGAIN](self, "_waitEAGAIN");
    }

    unint64_t v22 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v17,  0LL);
    -[GTBaseStreamTransport_tools_diagnostics _scheduleInvalidation:](self, "_scheduleInvalidation:", v22);
    if (a3) {
      *a3 = v22;
    }
    *__error() = v17;
LABEL_24:
    vm_map_t v6 = -1LL;
  }

  unint64_t v16 = atomic_load((unsigned int *)self->_incomingShmem + 4);
  if (v16 != -1) {
    return;
  }
  vm_size_t v4 = 31LL;
LABEL_23:
  id v17 = objc_autoreleasePoolPush();
  -[GTBaseStreamTransport_tools_diagnostics _scheduleInvalidation:]( self,  "_scheduleInvalidation:",  +[GTError_tools_diagnostics errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_tools_diagnostics,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  v4,  0LL));
  objc_autoreleasePoolPop(v17);
}

LABEL_25:
  -[GTBaseStreamTransport_tools_diagnostics _clearBuffers](self, "_clearBuffers");
  return v6;
}

LABEL_23:
      abort();
    }

    uint8x8_t v12 = __stderrp;
    uint64_t v13 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"fail: url scheme has to be dysmt: %s",  objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String"));
LABEL_22:
    -[NSString UTF8String](v13, "UTF8String");
    fprintf(v12, "%s\n");
    goto LABEL_23;
  }

  if (!objc_msgSend(objc_msgSend(a3, "path"), "length"))
  {
    if (s_logUsingOsLog)
    {
      uint64_t v10 = (os_log_s *)gt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        unint64_t v16 = objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String");
        vm_size_t v7 = "fail: url path cannot be nil or empty: %s";
LABEL_17:
        vm_address_t v8 = v10;
        vm_address_t v9 = 12;
LABEL_18:
        _os_log_fault_impl(&dword_0, v8, OS_LOG_TYPE_FAULT, v7, buf, v9);
        abort();
      }

      goto LABEL_23;
    }

    uint8x8_t v12 = __stderrp;
    uint64_t v13 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"fail: url path cannot be nil or empty: %s",  objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String"));
    goto LABEL_22;
  }

  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __34__GTSharedMemoryTransport_setUrl___block_invoke;
  block[3] = &unk_209B0;
  void block[4] = a3;
  block[5] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

  objc_msgSend( a4,  "setError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0));
  objc_msgSend(a4, "setResult:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  if (v17 != -1) {
    close(v17);
  }
}

LABEL_17:
    if (a6)
    {
      uint64_t v18 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
      LOBYTE(v16) = 0;
      *a6 = v18;
    }

    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return (char)v16;
}

void sub_10DDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t smt_poll_thread_entry(void *a1)
{
  uint64_t v2 = (dispatch_queue_s *)a1[1];
  int v3 = (void *)a1[2];
  snprintf(__str, 0x40uLL, "gputools.smt_poll.%p", a1);
  pthread_setname_np(__str);
  while (!*((_BYTE *)a1 + 24))
  {
    dispatch_sync(v2, v3);
    usleep(0x1F40u);
  }

  return 0LL;
}

void sub_1230C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_14:
    abort();
  }

  if (a3 && ![a3 filePathURL])
  {
    if (s_logUsingOsLog)
    {
      uint64_t v10 = (os_log_s *)gt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        vm_prot_t v15 = objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String");
        vm_size_t v7 = "fail: unix domain socket url must be a file url: %s";
        vm_address_t v8 = v10;
        vm_address_t v9 = 12;
LABEL_11:
        _os_log_fault_impl(&dword_0, v8, OS_LOG_TYPE_FAULT, v7, buf, v9);
        abort();
      }
    }

    else
    {
      uint8x8_t v12 = __stderrp;
      -[NSString UTF8String]( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"fail: unix domain socket url must be a file url: %s",  objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String")),  "UTF8String");
      fprintf(v12, "%s\n");
    }

    goto LABEL_14;
  }

  queue = self->super.super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __38__GTUNIXDomainSocketTransport_setUrl___block_invoke;
  block[3] = &unk_209B0;
  void block[4] = a3;
  block[5] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

void GPUTools::Diag::BacktraceStore::~BacktraceStore(GPUTools::Diag::BacktraceStore *this)
{
  uint64_t v2 = (void *)*((void *)this + 14);
  *((void *)this + 14) = 0LL;

  int v3 = (void *)*((void *)this + 11);
  if (v3)
  {
    do
    {
      vm_size_t v4 = (void *)*v3;
      operator delete(v3);
      int v3 = v4;
    }

    while (v4);
  }

  vm_size_t v5 = (void *)*((void *)this + 9);
  *((void *)this + 9) = 0LL;
  if (v5) {
    operator delete(v5);
  }
  vm_map_t v6 = (void **)*((void *)this + 4);
  vm_size_t v7 = (void **)*((void *)this + 5);
  *((void *)this + _Block_object_dispose(va, 8) = 0LL;
  unint64_t v8 = (char *)v7 - (char *)v6;
  if ((unint64_t)((char *)v7 - (char *)v6) >= 0x11)
  {
    do
    {
      operator delete(*v6);
      vm_size_t v7 = (void **)*((void *)this + 5);
      vm_map_t v6 = (void **)(*((void *)this + 4) + 8LL);
      *((void *)this + 4) = v6;
      unint64_t v8 = (char *)v7 - (char *)v6;
    }

    while ((unint64_t)((char *)v7 - (char *)v6) > 0x10);
  }

  unint64_t v9 = v8 >> 3;
  if (v9 == 1)
  {
    uint64_t v10 = 512LL;
    goto LABEL_11;
  }

  if (v9 == 2)
  {
    uint64_t v10 = 1024LL;
LABEL_11:
    *((void *)this + 7) = v10;
  }

  if (v6 != v7)
  {
    do
    {
      unint64_t v11 = *v6++;
      operator delete(v11);
    }

    while (v6 != v7);
    uint64_t v13 = *((void *)this + 4);
    uint64_t v12 = *((void *)this + 5);
    if (v12 != v13) {
      *((void *)this + 5) = v12 + ((v13 - v12 + 7) & 0xFFFFFFFFFFFFFFF8LL);
    }
  }

  uint64_t v14 = (void *)*((void *)this + 3);
  if (v14) {
    operator delete(v14);
  }
  vm_prot_t v15 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v15;
    operator delete(v15);
  }

void ___ZN8GPUTools4Diag14BacktraceStore15InsertBacktraceENS0_9CallstackEm_block_invoke(void *a1)
{
  uint64_t v2 = (char **)a1[4];
  int v3 = *v2;
  vm_size_t v4 = v2[8];
  if (v4)
  {
    vm_size_t v5 = (void **)v2[4];
    int64_t v6 = (*(int **)((char *)v5 + (((unint64_t)v2[7] >> 7) & 0x1FFFFFFFFFFFFF8LL)))[(unint64_t)v2[7] & 0x3FF];
    unint64_t v7 = (unint64_t)(v2[7] + 1);
    v2[7] = (char *)v7;
    v2[8] = v4 - 1;
    if (v7 >= 0x800)
    {
      operator delete(*v5);
      v2[4] += 8;
      v2[7] -= 1024;
      int v3 = *(char **)a1[4];
    }

    memcpy(&v3[4104 * (int)v6], a1 + 5, 0x1008uLL);
  }

  else
  {
    int64_t v6 = (int64_t)v2[1];
    unint64_t v8 = (unint64_t)v2[2];
    if (v6 >= v8)
    {
      unint64_t v10 = 0x803FE00FF803FE01LL * ((v6 - (uint64_t)v3) >> 3) + 1;
      if (v10 > 0xFF803FE00FF80LL) {
        abort();
      }
      unint64_t v11 = 0x803FE00FF803FE01LL * ((uint64_t)(v8 - (void)v3) >> 3);
      if (2 * v11 > v10) {
        unint64_t v10 = 2 * v11;
      }
      if (v11 >= 0x7FC01FF007FC0LL) {
        unint64_t v12 = 0xFF803FE00FF80LL;
      }
      else {
        unint64_t v12 = v10;
      }
      if (v12)
      {
        if (v12 > 0xFF803FE00FF80LL) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        uint64_t v13 = (char *)operator new(4104 * v12);
      }

      else
      {
        uint64_t v13 = 0LL;
      }

      uint64_t v14 = &v13[8 * ((v6 - (uint64_t)v3) >> 3)];
      vm_prot_t v15 = &v13[4104 * v12];
      memcpy(v14, a1 + 5, 0x1008uLL);
      unint64_t v9 = v14 + 4104;
      if ((char *)v6 != v3)
      {
        do
        {
          v6 -= 4104LL;
          v14 -= 4104;
          memcpy(v14, (const void *)v6, 0x1008uLL);
        }

        while ((char *)v6 != v3);
        int64_t v6 = (int64_t)*v2;
      }

      *uint64_t v2 = v14;
      v2[1] = v9;
      v2[2] = v15;
      if (v6) {
        operator delete((void *)v6);
      }
    }

    else
    {
      memcpy(v2[1], a1 + 5, 0x1008uLL);
      unint64_t v9 = (char *)(v6 + 4104);
    }

    v2[1] = v9;
  }

  uint64_t v16 = a1[4];
  unint64_t v17 = a1[518];
  unint64_t v18 = *(void *)(v16 + 80);
  if (v18)
  {
    uint8x8_t v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
    v19.i16[0] = vaddlv_u8(v19);
    if (v19.u32[0] > 1uLL)
    {
      int64_t v6 = a1[518];
      if (v17 >= v18) {
        int64_t v6 = v17 % v18;
      }
    }

    else
    {
      int64_t v6 = (v18 - 1) & v17;
    }

    id v20 = *(void **)(*(void *)(v16 + 72) + 8 * v6);
    if (v20)
    {
      for (i = (void *)*v20; i; i = (void *)*i)
      {
        unint64_t v22 = i[1];
        if (v22 == v17)
        {
          if (i[2] == v17) {
            return;
          }
        }

        else
        {
          if (v19.u32[0] > 1uLL)
          {
            if (v22 >= v18) {
              v22 %= v18;
            }
          }

          else
          {
            v22 &= v18 - 1;
          }

          if (v22 != v6) {
            break;
          }
        }
      }
    }
  }

  int v23 = -133956095 * ((*(void *)(v16 + 8) - *(void *)v16) >> 3) - 1;
  dispatch_semaphore_t v24 = operator new(0x20uLL);
  *dispatch_semaphore_t v24 = 0LL;
  v24[1] = v17;
  v24[2] = v17;
  *((_DWORD *)v24 + 6) = v23;
  float v25 = (float)(unint64_t)(*(void *)(v16 + 96) + 1LL);
  float v26 = *(float *)(v16 + 104);
  if (!v18 || (float)(v26 * (float)v18) < v25)
  {
    BOOL v27 = 1LL;
    if (v18 >= 3) {
      BOOL v27 = (v18 & (v18 - 1)) != 0;
    }
    unint64_t v28 = v27 | (2 * v18);
    unint64_t v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29) {
      int8x8_t prime = (int8x8_t)v29;
    }
    else {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }

    unint64_t v18 = *(void *)(v16 + 80);
    if (*(void *)&prime > v18) {
      goto LABEL_52;
    }
    if (*(void *)&prime < v18)
    {
      unint64_t v37 = vcvtps_u32_f32((float)*(unint64_t *)(v16 + 96) / *(float *)(v16 + 104));
      if (v18 < 3 || (uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v18), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
      {
        unint64_t v37 = std::__next_prime(v37);
      }

      else
      {
        uint64_t v39 = 1LL << -(char)__clz(v37 - 1);
        if (v37 >= 2) {
          unint64_t v37 = v39;
        }
      }

      if (*(void *)&prime <= v37) {
        int8x8_t prime = (int8x8_t)v37;
      }
      if (*(void *)&prime >= v18)
      {
        unint64_t v18 = *(void *)(v16 + 80);
      }

      else
      {
        if (prime)
        {
LABEL_52:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          unint64_t v31 = operator new(8LL * *(void *)&prime);
          uint64_t v32 = *(void **)(v16 + 72);
          *(void *)(v16 + 72) = v31;
          if (v32) {
            operator delete(v32);
          }
          uint64_t v33 = 0LL;
          *(int8x8_t *)(v16 + 80) = prime;
          do
            *(void *)(*(void *)(v16 + 72) + 8 * v33++) = 0LL;
          while (*(void *)&prime != v33);
          float v34 = *(void **)(v16 + 88);
          if (v34)
          {
            unint64_t v35 = v34[1];
            uint8x8_t v36 = (uint8x8_t)vcnt_s8(prime);
            v36.i16[0] = vaddlv_u8(v36);
            if (v36.u32[0] > 1uLL)
            {
              if (v35 >= *(void *)&prime) {
                v35 %= *(void *)&prime;
              }
            }

            else
            {
              v35 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)(v16 + 72) + 8 * v35) = v16 + 88;
            v40 = (void *)*v34;
            if (*v34)
            {
              do
              {
                unint64_t v41 = v40[1];
                if (v36.u32[0] > 1uLL)
                {
                  if (v41 >= *(void *)&prime) {
                    v41 %= *(void *)&prime;
                  }
                }

                else
                {
                  v41 &= *(void *)&prime - 1LL;
                }

                if (v41 != v35)
                {
                  uint64_t v42 = *(void *)(v16 + 72);
                  if (!*(void *)(v42 + 8 * v41))
                  {
                    *(void *)(v42 + 8 * v41) = v34;
                    goto LABEL_77;
                  }

                  *float v34 = *v40;
                  void *v40 = **(void **)(*(void *)(v16 + 72) + 8 * v41);
                  **(void **)(*(void *)(v16 + 72) + 8 * v41) = v40;
                  v40 = v34;
                }

                unint64_t v41 = v35;
LABEL_77:
                float v34 = v40;
                v40 = (void *)*v40;
                unint64_t v35 = v41;
              }

              while (v40);
            }
          }

          unint64_t v18 = (unint64_t)prime;
          goto LABEL_81;
        }

        id v46 = *(void **)(v16 + 72);
        *(void *)(v16 + 72) = 0LL;
        if (v46) {
          operator delete(v46);
        }
        unint64_t v18 = 0LL;
        *(void *)(v16 + 80) = 0LL;
      }
    }

LABEL_81:
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v17 >= v18) {
        int64_t v6 = v17 % v18;
      }
      else {
        int64_t v6 = v17;
      }
    }

    else
    {
      int64_t v6 = (v18 - 1) & v17;
    }
  }

  uint64_t v43 = *(void *)(v16 + 72);
  uint64_t v44 = *(void **)(v43 + 8 * v6);
  if (v44)
  {
    *dispatch_semaphore_t v24 = *v44;
LABEL_94:
    *uint64_t v44 = v24;
    goto LABEL_95;
  }

  *dispatch_semaphore_t v24 = *(void *)(v16 + 88);
  *(void *)(v16 + 8_Block_object_dispose(va, 8) = v24;
  *(void *)(v43 + 8 * v6) = v16 + 88;
  if (*v24)
  {
    unint64_t v45 = *(void *)(*v24 + 8LL);
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v45 >= v18) {
        v45 %= v18;
      }
    }

    else
    {
      v45 &= v18 - 1;
    }

    uint64_t v44 = (void *)(*(void *)(v16 + 72) + 8 * v45);
    goto LABEL_94;
  }

LABEL_95:
  ++*(void *)(v16 + 96);
}

void sub_13888(_Unwind_Exception *a1)
{
}

void GPUTools::Diag::BacktraceStore::RemoveBacktrace( GPUTools::Diag::BacktraceStore *this, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = 0LL;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x103812000000LL;
  unint64_t v11 = __Block_byref_object_copy__98;
  unint64_t v12 = __Block_byref_object_dispose__99;
  uint64_t v13 = "";
  bzero(&v14, 0x1008uLL);
  int64_t v6 = *(dispatch_queue_s **)(a2 + 112);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  id v7[2] = ___ZN8GPUTools4Diag14BacktraceStore15RemoveBacktraceEm_block_invoke;
  v7[3] = &unk_20C50;
  v7[5] = a2;
  v7[6] = a3;
  v7[4] = &v8;
  dispatch_sync(v6, v7);
  memcpy(this, v9 + 6, 0x1008uLL);
  _Block_object_dispose(&v8, 8);
}

void *__Block_byref_object_copy__98(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 48), (const void *)(a2 + 48), 0x1008uLL);
}

void ___ZN8GPUTools4Diag14BacktraceStore15RemoveBacktraceEm_block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[5];
  int8x8_t v2 = (int8x8_t)v1[10];
  if (!*(void *)&v2) {
    return;
  }
  unint64_t v4 = a1[6];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    unint64_t v6 = a1[6];
    if (v4 >= *(void *)&v2) {
      unint64_t v6 = v4 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v6 = (*(void *)&v2 - 1LL) & v4;
  }

  unint64_t v7 = *(void ***)(v1[9] + 8 * v6);
  if (!v7) {
    return;
  }
  uint64_t v8 = *v7;
  if (!*v7) {
    return;
  }
  while (1)
  {
    unint64_t v9 = v8[1];
    if (v9 == v4) {
      break;
    }
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v2) {
        v9 %= *(void *)&v2;
      }
    }

    else
    {
      v9 &= *(void *)&v2 - 1LL;
    }

    if (v9 != v6) {
      return;
    }
LABEL_16:
    uint64_t v8 = (void *)*v8;
    if (!v8) {
      return;
    }
  }

  if (v8[2] != v4) {
    goto LABEL_16;
  }
  memcpy((void *)(*(void *)(a1[4] + 8LL) + 48LL), (const void *)(*v1 + 4104LL * *((int *)v8 + 6)), 0x1008uLL);
  uint64_t v10 = (void *)a1[5];
  unint64_t v11 = (char *)v10[5];
  unint64_t v12 = (char *)v10[4];
  uint64_t v13 = v11 - v12;
  if (v11 == v12) {
    uint64_t v14 = 0LL;
  }
  else {
    uint64_t v14 = ((v11 - v12) << 7) - 1;
  }
  unint64_t v15 = v10[7];
  uint64_t v16 = v10[8];
  unint64_t v17 = v16 + v15;
  if (v14 == v16 + v15)
  {
    BOOL v18 = v15 >= 0x400;
    unint64_t v19 = v15 - 1024;
    if (v18)
    {
      v10[7] = v19;
      uint64_t v22 = *(void *)v12;
      id v20 = v12 + 8;
      uint64_t v21 = v22;
      void v10[4] = v20;
      if ((char *)v10[6] == v11)
      {
        unint64_t v23 = v10[3];
        uint64_t v24 = (uint64_t)&v20[-v23];
        if ((unint64_t)v20 <= v23)
        {
          uint64_t v53 = (uint64_t)&v11[-v23];
          BOOL v52 = v53 == 0;
          uint64_t v54 = v53 >> 2;
          if (v52) {
            unint64_t v55 = 1LL;
          }
          else {
            unint64_t v55 = v54;
          }
          unint64_t v56 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v55);
          IMP v58 = &v56[8 * (v55 >> 2)];
          uint64_t v59 = (uint64_t *)v10[4];
          unint64_t v11 = v58;
          uint64_t v60 = v10[5] - (void)v59;
          if (v60)
          {
            unint64_t v11 = &v58[v60 & 0xFFFFFFFFFFFFFFF8LL];
            uint64_t v61 = 8 * (v60 >> 3);
            IMP v62 = &v56[8 * (v55 >> 2)];
            do
            {
              uint64_t v63 = *v59++;
              *(void *)IMP v62 = v63;
              v62 += 8;
              v61 -= 8LL;
            }

            while (v61);
          }

          v64 = (void *)v10[3];
          v10[3] = v56;
          void v10[4] = v58;
          v10[5] = v11;
          v10[6] = &v56[8 * v57];
          if (v64)
          {
            operator delete(v64);
            unint64_t v11 = (char *)v10[5];
          }
        }

        else
        {
          uint64_t v25 = v24 >> 3;
          BOOL v26 = v24 >> 3 < -1;
          uint64_t v27 = (v24 >> 3) + 2;
          if (v26) {
            uint64_t v28 = v27;
          }
          else {
            uint64_t v28 = v25 + 1;
          }
          uint64_t v29 = -(v28 >> 1);
          uint64_t v30 = v28 >> 1;
          unint64_t v31 = &v20[-8 * v30];
          int64_t v32 = v11 - v20;
          if (v11 == v20)
          {
            uint64_t v33 = v11;
          }

          else
          {
            memmove(&v20[-8 * v30], v20, v11 - v20);
            uint64_t v33 = (char *)v10[4];
          }

          unint64_t v11 = &v31[v32];
          void v10[4] = &v33[8 * v29];
          v10[5] = &v31[v32];
        }
      }

      *(void *)unint64_t v11 = v21;
LABEL_87:
      v10[5] += 8LL;
    }

    else
    {
      uint64_t v35 = v13 >> 3;
      uint8x8_t v36 = (char *)v10[6];
      unint64_t v37 = (char *)v10[3];
      if (v13 >> 3 < (unint64_t)((v36 - v37) >> 3))
      {
        uint8x8_t v38 = operator new(0x1000uLL);
        uint64_t v39 = v38;
        if (v36 == v11)
        {
          __int128 v65 = (char *)v10[4];
          if (v65 == (char *)v10[3])
          {
            v101 = (_BYTE *)v10[5];
            IMP v102 = (_BYTE *)v10[6];
            if (v101 >= v102)
            {
              if (v102 == v65) {
                unint64_t v106 = 1LL;
              }
              else {
                unint64_t v106 = (v102 - v65) >> 2;
              }
              uint64_t v107 = 2 * v106;
              id v108 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v106);
              IMP v66 = &v108[(v107 + 6) & 0xFFFFFFFFFFFFFFF8LL];
              IMP v110 = (uint64_t *)v10[4];
              uint64_t v111 = v66;
              uint64_t v112 = v10[5] - (void)v110;
              if (v112)
              {
                uint64_t v111 = &v66[v112 & 0xFFFFFFFFFFFFFFF8LL];
                uint64_t v113 = 8 * (v112 >> 3);
                IMP v114 = v66;
                do
                {
                  uint64_t v115 = *v110++;
                  *(void *)IMP v114 = v115;
                  v114 += 8;
                  v113 -= 8LL;
                }

                while (v113);
              }

              v116 = (void *)v10[3];
              v10[3] = v108;
              void v10[4] = v66;
              v10[5] = v111;
              v10[6] = &v108[8 * v109];
              if (v116)
              {
                operator delete(v116);
                IMP v66 = (char *)v10[4];
              }
            }

            else
            {
              uint64_t v103 = (v102 - v101) >> 3;
              if (v103 >= -1) {
                uint64_t v104 = v103 + 1;
              }
              else {
                uint64_t v104 = v103 + 2;
              }
              uint64_t v105 = v104 >> 1;
              IMP v66 = &v65[8 * (v104 >> 1)];
              if (v101 != v65)
              {
                memmove(&v65[8 * (v104 >> 1)], v65, v101 - v65);
                __int128 v65 = (char *)v10[5];
              }

              void v10[4] = v66;
              v10[5] = &v65[8 * v105];
            }
          }

          else
          {
            IMP v66 = (char *)v10[4];
          }

          *((void *)v66 - 1) = v39;
          v117 = (char *)v10[4];
          IMP v118 = (char *)v10[5];
          void v10[4] = v117 - 8;
          uint64_t v119 = *((void *)v117 - 1);
          void v10[4] = v117;
          if (v118 == (char *)v10[6])
          {
            unint64_t v120 = v10[3];
            uint64_t v121 = (uint64_t)&v117[-v120];
            if ((unint64_t)v117 <= v120)
            {
              uint64_t v129 = (uint64_t)&v118[-v120];
              BOOL v52 = v129 == 0;
              uint64_t v130 = v129 >> 2;
              if (v52) {
                unint64_t v131 = 1LL;
              }
              else {
                unint64_t v131 = v130;
              }
              v132 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v131);
              IMP v134 = &v132[8 * (v131 >> 2)];
              uint64_t v135 = (uint64_t *)v10[4];
              IMP v118 = v134;
              uint64_t v136 = v10[5] - (void)v135;
              if (v136)
              {
                IMP v118 = &v134[v136 & 0xFFFFFFFFFFFFFFF8LL];
                uint64_t v137 = 8 * (v136 >> 3);
                IMP v138 = &v132[8 * (v131 >> 2)];
                do
                {
                  uint64_t v139 = *v135++;
                  *(void *)IMP v138 = v139;
                  v138 += 8;
                  v137 -= 8LL;
                }

                while (v137);
              }

              unint64_t v140 = (void *)v10[3];
              v10[3] = v132;
              void v10[4] = v134;
              v10[5] = v118;
              v10[6] = &v132[8 * v133];
              if (v140)
              {
                operator delete(v140);
                IMP v118 = (char *)v10[5];
              }
            }

            else
            {
              uint64_t v122 = v121 >> 3;
              BOOL v26 = v121 >> 3 < -1;
              uint64_t v123 = (v121 >> 3) + 2;
              if (v26) {
                uint64_t v124 = v123;
              }
              else {
                uint64_t v124 = v122 + 1;
              }
              uint64_t v125 = -(v124 >> 1);
              uint64_t v126 = v124 >> 1;
              uint64_t v127 = &v117[-8 * v126];
              int64_t v128 = v118 - v117;
              if (v118 != v117)
              {
                memmove(&v117[-8 * v126], v117, v118 - v117);
                v117 = (char *)v10[4];
              }

              IMP v118 = &v127[v128];
              void v10[4] = &v117[8 * v125];
              v10[5] = &v127[v128];
            }
          }

          *(void *)IMP v118 = v119;
        }

        else
        {
          *(void *)unint64_t v11 = v38;
        }

        goto LABEL_87;
      }

      if (v36 == v37) {
        unint64_t v40 = 1LL;
      }
      else {
        unint64_t v40 = (v36 - v37) >> 2;
      }
      unint64_t v41 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v40);
      uint64_t v43 = v42;
      uint64_t v44 = &v41[8 * v35];
      *(void *)&__int128 v45 = v41;
      *((void *)&v45 + 1) = v44;
      __int128 v144 = v45;
      id v46 = operator new(0x1000uLL);
      *(void *)&__int128 v47 = v44;
      *((void *)&v47 + 1) = &v41[8 * v43];
      if (v35 == v43)
      {
        uint64_t v48 = 8 * v35;
        *(void *)&__int128 v49 = v144;
        if (v13 < 1)
        {
          uint64_t v67 = v46;
          uint64_t v68 = v48 >> 2;
          if (v11 == v12) {
            unint64_t v69 = 1LL;
          }
          else {
            unint64_t v69 = v68;
          }
          IMP v70 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v69);
          uint64_t v44 = &v70[8 * (v69 >> 2)];
          *(void *)&__int128 v49 = v70;
          *((void *)&v49 + 1) = v44;
          *(void *)&__int128 v47 = v44;
          *((void *)&v47 + 1) = &v70[8 * v71];
          if (v41)
          {
            __int128 v141 = v47;
            __int128 v145 = v49;
            operator delete(v41);
            __int128 v47 = v141;
            __int128 v49 = v145;
          }

          id v46 = v67;
        }

        else
        {
          uint64_t v50 = v48 >> 3;
          if (v50 >= -1) {
            unint64_t v51 = v50 + 1;
          }
          else {
            unint64_t v51 = v50 + 2;
          }
          v44 -= 8 * (v51 >> 1);
          *(void *)&__int128 v47 = v44;
          *((void *)&v49 + 1) = v44;
        }
      }

      else
      {
        __int128 v49 = v144;
      }

      *(void *)uint64_t v44 = v46;
      *(void *)&__int128 v47 = v47 + 8;
      for (uint64_t i = v10[5]; i != v10[4]; i -= 8LL)
      {
        v73 = (void *)*((void *)&v49 + 1);
        if (*((void *)&v49 + 1) == (void)v49)
        {
          uint64_t v75 = (_BYTE *)v47;
          if ((unint64_t)v47 >= *((void *)&v47 + 1))
          {
            if (*((void *)&v47 + 1) == *((void *)&v49 + 1)) {
              unint64_t v80 = 1LL;
            }
            else {
              unint64_t v80 = (uint64_t)(*((void *)&v47 + 1) - *((void *)&v49 + 1)) >> 2;
            }
            v81 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(v80);
            IMP v74 = &v81[(2 * v80 + 6) & 0xFFFFFFFFFFFFFFF8LL];
            uint64_t v83 = v74;
            uint64_t v84 = v75 - (_BYTE *)v73;
            if (v75 != (_BYTE *)v73)
            {
              uint64_t v83 = &v74[v84 & 0xFFFFFFFFFFFFFFF8LL];
              uint64_t v85 = 8 * (v84 >> 3);
              IMP v86 = v74;
              uint64_t v87 = v73;
              do
              {
                uint64_t v88 = *v87++;
                *(void *)IMP v86 = v88;
                v86 += 8;
                v85 -= 8LL;
              }

              while (v85);
            }

            *(void *)&__int128 v49 = v81;
            *((void *)&v49 + 1) = v74;
            *(void *)&__int128 v47 = v83;
            *((void *)&v47 + 1) = &v81[8 * v82];
            if (v73)
            {
              __int128 v142 = v47;
              __int128 v147 = v49;
              operator delete(v73);
              __int128 v47 = v142;
              __int128 v49 = v147;
            }
          }

          else
          {
            uint64_t v76 = (uint64_t)(*((void *)&v47 + 1) - v47) >> 3;
            if (v76 >= -1) {
              uint64_t v77 = v76 + 1;
            }
            else {
              uint64_t v77 = v76 + 2;
            }
            uint64_t v78 = v77 >> 1;
            uint64_t v79 = v47 + 8 * (v77 >> 1);
            IMP v74 = (char *)(v79 - (v47 - *((void *)&v49 + 1)));
            if ((void)v47 == *((void *)&v49 + 1))
            {
              uint64_t v75 = (_BYTE *)*((void *)&v49 + 1);
            }

            else
            {
              uint64_t v143 = *((void *)&v47 + 1);
              uint64_t v146 = v49;
              memmove( (void *)(v79 - (v47 - *((void *)&v49 + 1))),  *((const void **)&v49 + 1),  v47 - *((void *)&v49 + 1));
              *((void *)&v47 + 1) = v143;
              *(void *)&__int128 v49 = v146;
            }

            *((void *)&v49 + 1) = v74;
            *(void *)&__int128 v47 = &v75[8 * v78];
          }
        }

        else
        {
          IMP v74 = (char *)*((void *)&v49 + 1);
        }

        uint64_t v89 = *(void *)(i - 8);
        *((void *)v74 - 1) = v89;
        *((void *)&v49 + 1) -= 8LL;
      }

      IMP v90 = (void *)v10[3];
      *(_OWORD *)(v10 + 3) = v49;
      *(_OWORD *)(v10 + 5) = v47;
      if (v90) {
        operator delete(v90);
      }
    }

    unint64_t v12 = (char *)v10[4];
    uint64_t v16 = v10[8];
    unint64_t v17 = v10[7] + v16;
    float v34 = (void *)a1[5];
  }

  else
  {
    float v34 = (void *)a1[5];
  }

  *(_DWORD *)(*(void *)&v12[(v17 >> 7) & 0x1FFFFFFFFFFFFF8LL] + 4 * (v17 & 0x3FF)) = *((_DWORD *)v8 + 6);
  v10[8] = v16 + 1;
  int8x8_t v91 = (int8x8_t)v34[10];
  unint64_t v92 = v8[1];
  uint8x8_t v93 = (uint8x8_t)vcnt_s8(v91);
  v93.i16[0] = vaddlv_u8(v93);
  if (v93.u32[0] > 1uLL)
  {
    if (v92 >= *(void *)&v91) {
      v92 %= *(void *)&v91;
    }
  }

  else
  {
    v92 &= *(void *)&v91 - 1LL;
  }

  uint64_t v94 = v34[9];
  uint64_t v95 = *(void **)(v94 + 8 * v92);
  do
  {
    uint64_t v96 = v95;
    uint64_t v95 = (void *)*v95;
  }

  while (v95 != v8);
  if (v96 == v34 + 11) {
    goto LABEL_106;
  }
  unint64_t v97 = v96[1];
  if (v93.u32[0] > 1uLL)
  {
    if (v97 >= *(void *)&v91) {
      v97 %= *(void *)&v91;
    }
  }

  else
  {
    v97 &= *(void *)&v91 - 1LL;
  }

  if (v97 != v92)
  {
LABEL_106:
    if (!*v8) {
      goto LABEL_107;
    }
    unint64_t v98 = *(void *)(*v8 + 8LL);
    if (v93.u32[0] > 1uLL)
    {
      if (v98 >= *(void *)&v91) {
        v98 %= *(void *)&v91;
      }
    }

    else
    {
      v98 &= *(void *)&v91 - 1LL;
    }

    if (v98 != v92) {
LABEL_107:
    }
      *(void *)(v94 + 8 * v92) = 0LL;
  }

  uint64_t v99 = *v8;
  if (*v8)
  {
    unint64_t v100 = *(void *)(v99 + 8);
    if (v93.u32[0] > 1uLL)
    {
      if (v100 >= *(void *)&v91) {
        v100 %= *(void *)&v91;
      }
    }

    else
    {
      v100 &= *(void *)&v91 - 1LL;
    }

    if (v100 != v92)
    {
      *(void *)(v34[9] + 8 * v100) = v96;
      uint64_t v99 = *v8;
    }
  }

  *uint64_t v96 = v99;
  *uint64_t v8 = 0LL;
  --v34[12];
  operator delete(v8);
}

void sub_14180( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int128 a11)
{
  if ((void)a11) {
    operator delete((void *)a11);
  }
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<int *>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a1);
}

uint64_t GTCoreAllocatorInit(uint64_t result)
{
  hideMemory = result & 1;
  return result;
}

uint64_t GTCoreAllocatorIsHiddingMemory()
{
  return hideMemory;
}

vm_address_t GTCoreAlloc(uint64_t a1, memory_object_size_t a2)
{
  kern_return_t v12;
  FILE *v14;
  void block[4];
  kern_return_t v16;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v21;
  __int16 v22;
  char *v23;
  vm_address_t address = 0LL;
  size = a2;
  mach_error_t memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, 0LL, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    mach_error_t v4 = memory_entry_64;
    if (!s_logUsingOsLog)
    {
      unint64_t v11 = __stderrp;
      mach_error_string(memory_entry_64);
      fprintf(v11, "warning: failed to create memory entry error 0x%x (%s)\n");
      return 0LL;
    }

    uint8x8_t v5 = (os_log_s *)gt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unint64_t v6 = mach_error_string(v4);
      *(_DWORD *)buf = 67109378;
      uint64_t v21 = v4;
      uint64_t v22 = 2080;
      unint64_t v23 = v6;
      unint64_t v7 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_9:
      _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
      return 0LL;
    }

    return 0LL;
  }

  mach_error_t v8 = vm_map(mach_task_self_, &address, a2, 0LL, 1, object_handle, 0LL, 0, 3, 3, 1u);
  if (v8)
  {
    mach_error_t v9 = v8;
    if (!s_logUsingOsLog)
    {
      uint64_t v14 = __stderrp;
      mach_error_string(v8);
      fprintf(v14, "warning: failed to map memory error 0x%x (%s)\n");
      return 0LL;
    }

    uint8x8_t v5 = (os_log_s *)gt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = mach_error_string(v9);
      *(_DWORD *)buf = 67109378;
      uint64_t v21 = v9;
      uint64_t v22 = 2080;
      unint64_t v23 = v10;
      unint64_t v7 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_9;
    }

    return 0LL;
  }

  if (hideMemory)
  {
    unint64_t v12 = mach_memory_entry_ownership(object_handle, mach_task_self_, 4, 1);
    if (v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = __GTCoreAlloc_block_invoke;
      block[3] = &__block_descriptor_tmp;
      uint64_t v16 = v12;
      if (GTCoreAlloc_onceToken != -1) {
        dispatch_once(&GTCoreAlloc_onceToken, block);
      }
    }
  }

  mach_port_deallocate(mach_task_self_, object_handle);
  return address;
}

void __GTCoreAlloc_block_invoke(uint64_t a1)
{
  if (s_logUsingOsLog)
  {
    int8x8_t v2 = (os_log_s *)gt_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      mach_error_t v3 = *(_DWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109378;
      mach_error_t v8 = v3;
      __int16 v9 = 2080;
      uint64_t v10 = mach_error_string(v3);
      _os_log_error_impl( &dword_0,  v2,  OS_LOG_TYPE_ERROR,  "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)",  buf,  0x12u);
    }
  }

  else
  {
    mach_error_t v4 = __stderrp;
    mach_error_t v5 = *(_DWORD *)(a1 + 32);
    unint64_t v6 = mach_error_string(v5);
    fprintf(v4, "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)\n", v5, v6);
  }

vm_address_t *GTCoreFree(vm_address_t *result, vm_size_t size)
{
  if (result)
  {
    int8x8_t v2 = result;
    result = (vm_address_t *)vm_deallocate(mach_task_self_, *result, size);
    *int8x8_t v2 = 0LL;
  }

  return result;
}

id gt_default_log()
{
  v0 = s_defaultLog;
  if (s_defaultLog == &_os_log_default)
  {
    if (gt_default_log_onceToken != -1) {
      dispatch_once(&gt_default_log_onceToken, &__block_literal_global_115);
    }
    v0 = s_defaultLog;
  }

  return v0;
}

void __gt_default_log_block_invoke(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead",  v1,  2u);
  }

id gt_tagged_log(unint64_t a1)
{
  if (s_logCount <= a1)
  {
    if (s_logUsingOsLog)
    {
      id v5 = gt_default_log();
      unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v12 = a1;
        _os_log_fault_impl(&dword_0, v6, OS_LOG_TYPE_FAULT, "fail: Invalid log tag: %llu", buf, 0xCu);
      }
    }

    else
    {
      unint64_t v7 = __stderrp;
      id v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"fail: Invalid log tag: %llu", a1));
      fprintf(v7, "%s\n", (const char *)[v8 UTF8String]);
    }

    id v4 = &_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    __copy_constructor_8_8_s0_s8_s16_s24(buf, (id *)(s_logs + 32 * a1));
    int v2 = GTCoreLog_enabled((uint64_t)buf);
    mach_error_t v3 = v13;
    if (!v2) {
      mach_error_t v3 = &_os_log_disabled;
    }
    id v4 = v3;
    __destructor_8_s0_s8_s16_s24((id *)buf);
  }

  return v4;
}

id __copy_constructor_8_8_s0_s8_s16_s24(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  id result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t GTCoreLog_enabled(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 1LL;
  }
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = [v2 BOOLForKey:*(void *)(a1 + 16)];

  return (uint64_t)v3;
}

void __destructor_8_s0_s8_s16_s24(id *a1)
{
}

uint64_t GTCoreLogUseOsLog()
{
  return s_logUsingOsLog;
}

void GTCoreLogInit(const char *a1, uint64_t a2, int a3)
{
  if (s_defaultLog == &_os_log_default)
  {
    unint64_t v7 = a1;
    os_log_t v8 = os_log_create(a1, "");
    id v9 = s_defaultLog;
    s_defaultLog = v8;

    p_vtable = &OBJC_CLASS___GTUNIXDomainSocketTransport_tools_diagnostics.vtable;
    s_logs = (uint64_t)calloc(a3, 0x20uLL);
    s_logCount = a3;
    if (a3 >= 1)
    {
      unint64_t v11 = 0LL;
      unint64_t v12 = a3;
      uint64_t v13 = a2 + 8;
      uint64_t v14 = 16LL;
      unint64_t v15 = &CFHash_ptr;
      id v38 = (id)v12;
      do
      {
        uint64_t v16 = *(const char **)v13;
        if (v11 == *(char **)(v13 - 8))
        {
          unint64_t v17 = v7;
          uint64_t v18 = *(unsigned __int8 *)(v13 + 8);
          unint64_t v19 = (char *)p_vtable[126];
          id v20 = &v19[v14];
          uint64_t v21 = v17;
          uint64_t v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15[50], "stringWithUTF8String:"));
          unint64_t v23 = *(void **)&v19[v14 - 16];
          *((void *)v20 - 2) = v22;

          uint64_t v24 = objc_claimAutoreleasedReturnValue([v15[50] stringWithUTF8String:v16]);
          uint64_t v25 = *(void **)&v19[v14 - 8];
          *((void *)v20 - 1) = v24;

          if (v18)
          {
            uint64_t v26 = objc_claimAutoreleasedReturnValue( [v15[50] stringWithFormat:@"%@.%@.enableLog", *((void *)v20 - 2), *((void *)v20 - 1)]);
            uint64_t v27 = *(void **)&v19[v14];
            *(void *)&v19[v14] = v26;
          }

          else
          {
            uint64_t v27 = *(void **)&v19[v14];
            *(void *)&v19[v14] = 0LL;
          }

          unint64_t v7 = v21;
          os_log_t v30 = os_log_create(v21, v16);
          unint64_t v31 = *(void **)&v19[v14 + 8];
          *(void *)&v19[v14 + 8] = v30;

          GTCoreLog_enabled((uint64_t)(v20 - 16));
          p_vtable = (void **)(&OBJC_CLASS___GTUNIXDomainSocketTransport_tools_diagnostics + 24);
          unint64_t v12 = (unint64_t)v38;
          unint64_t v15 = &CFHash_ptr;
        }

        else
        {
          if (s_logUsingOsLog)
          {
            id v28 = gt_default_log();
            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              unint64_t v41 = v16;
              __int16 v42 = 1024;
              int v43 = (int)v11;
              _os_log_error_impl( &dword_0,  v29,  OS_LOG_TYPE_ERROR,  "warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT",  buf,  0x12u);
            }
          }

          else
          {
            int64_t v32 = __stderrp;
            uint64_t v29 = (os_log_s *) objc_claimAutoreleasedReturnValue( objc_msgSend( v15[50], "stringWithFormat:", @"warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT", v16, v11));
            fprintf(v32, "%s\n", (const char *)-[os_log_s UTF8String](v29, "UTF8String"));
          }

          objc_storeStrong((id *)((char *)p_vtable[126] + v14 + 8), &_os_log_default);
        }

        ++v11;
        v14 += 32LL;
        v13 += 24LL;
      }

      while ((char *)v12 != v11);
    }

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned __int8 v34 = [v33 BOOLForKey:@"GPUToolsPerfLogging"];

    if ((v34 & 1) != 0)
    {
      os_log_t v35 = os_log_create(v7, "");
      uint8x8_t v36 = g_signpostLog;
      g_signpostLog = v35;
    }
  }

  else if (s_logUsingOsLog)
  {
    id v3 = gt_default_log();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v41 = "Log already initialized, did you call GTCoreLogInit twice?";
      _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "warning: %s", buf, 0xCu);
    }
  }

  else
  {
    unint64_t v37 = __stderrp;
    id v39 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"warning: %s", "Log already initialized, did you call GTCoreLogInit twice?"));
    fprintf(v37, "%s\n", (const char *)[v39 UTF8String]);
  }

uint64_t GTCoreLogTagEnabled(unint64_t a1)
{
  if (s_logCount <= a1) {
    return 0LL;
  }
  __copy_constructor_8_8_s0_s8_s16_s24(v3, (id *)(s_logs + 32 * a1));
  uint64_t v1 = GTCoreLog_enabled((uint64_t)v3);
  __destructor_8_s0_s8_s16_s24(v3);
  return v1;
}

uint64_t GTCoreLogUseStandardOutputStreams(uint64_t result)
{
  s_logUsingOsLog = result ^ 1;
  return result;
}

uint64_t __GLOBAL_init_65535()
{
  return __cxa_atexit((void (*)(void *))GTToolsDiagnostics_DylibExit, 0LL, &dword_0);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}