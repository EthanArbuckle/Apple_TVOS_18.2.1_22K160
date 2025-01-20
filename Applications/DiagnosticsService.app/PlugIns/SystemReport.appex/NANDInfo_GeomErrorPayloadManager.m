@interface NANDInfo_GeomErrorPayloadManager
- (BOOL)hasNewErrors;
- (BOOL)invalid_error_payload;
- (BOOL)iteratePerPageDictsForMaxPagesWithStatus:(unsigned int)a3 iteratorCallBack:(id)a4;
- (NANDInfo_GeomErrorPayloadManager)initWithPayloadBuf:(char *)a3 bufSize:(unint64_t)a4 prevNumErrors:(unsigned int)a5;
- (NSMutableArray)error_pages_array;
- (NSMutableArray)error_payload_array;
- (NSMutableDictionary)other_stats_dict;
- (id)dictionaryRepresentation;
- (unsigned)num_errors_in_payload_cur;
- (unsigned)num_errors_in_payload_prev;
- (void)parseErrorPayloadBuf:(char *)a3 bufSize:(unint64_t)a4;
- (void)populateOtherStats:(id)a3;
- (void)setError_pages_array:(id)a3;
- (void)setError_payload_array:(id)a3;
- (void)setInvalid_error_payload:(BOOL)a3;
- (void)setNum_errors_in_payload_cur:(unsigned int)a3;
- (void)setNum_errors_in_payload_prev:(unsigned int)a3;
- (void)setOther_stats_dict:(id)a3;
@end

@implementation NANDInfo_GeomErrorPayloadManager

- (NANDInfo_GeomErrorPayloadManager)initWithPayloadBuf:(char *)a3 bufSize:(unint64_t)a4 prevNumErrors:(unsigned int)a5
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NANDInfo_GeomErrorPayloadManager;
  v8 = -[NANDInfo_GeomErrorPayloadManager init](&v22, "init");
  v9 = v8;
  v10 = 0LL;
  if (a4 >= 4 && v8)
  {
    v8->_invalid_error_payload = 0;
    v8->_num_errors_in_payload_prev = a5;
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    error_payload_array = v9->_error_payload_array;
    v9->_error_payload_array = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    error_pages_array = v9->_error_pages_array;
    v9->_error_pages_array = v13;

    other_stats_dict = v9->_other_stats_dict;
    v9->_other_stats_dict = 0LL;

    int v16 = *(_DWORD *)a3;
    if (*(_DWORD *)a3)
    {
      unsigned int v17 = 0;
      v18 = a3 + 4;
      unsigned int v19 = 4;
      do
      {
        uint64_t v20 = *((unsigned __int16 *)v18 + 1) + 4LL;
        v19 += v20;
        if (a4 < v19) {
          break;
        }
        v17 += *((unsigned __int16 *)v18 + 11) + ((v18[12] >> 1) & 1);
        v18 += v20;
        --v16;
      }

      while (v16);
    }

    else
    {
      unsigned int v17 = 0;
    }

    v9->_num_errors_in_payload_cur = v17;
    syslog( 5,  "total %u geom error entries. Previous %u",  -[NANDInfo_GeomErrorPayloadManager num_errors_in_payload_cur](v9, "num_errors_in_payload_cur"),  -[NANDInfo_GeomErrorPayloadManager num_errors_in_payload_prev](v9, "num_errors_in_payload_prev"));
    v10 = v9;
  }

  return v10;
}

- (void)parseErrorPayloadBuf:(char *)a3 bufSize:(unint64_t)a4
{
  if (!a3 || a4 <= 3)
  {
    syslog(3, "Error: invalid geom error payload buffer");
    -[NANDInfo_GeomErrorPayloadManager setInvalid_error_payload:](self, "setInvalid_error_payload:", 1LL);
    return;
  }

  int v7 = *(_DWORD *)a3;
  syslog(5, "total %u geom error entries", *(_DWORD *)a3);
  int v51 = v7;
  if (!v7) {
    return;
  }
  v8 = 0LL;
  v9 = 0LL;
  v52 = &a3[a4];
  uint64_t v10 = 0LL;
  v11 = a3 + 4;
  v50 = self;
  while (v52 >= v11 || v52 >= &v11[*((unsigned __int16 *)v11 + 1) + 4])
  {
    syslog(5, "Geom error idx %d", v10);
    if (*(_WORD *)v11)
    {
      syslog(3, "Error: entry %u mismatch in expected block tlv type");
      goto LABEL_32;
    }

    if (*((_WORD *)v11 + 2) != 1)
    {
      syslog(3, "Error: entry %u mismatch in expected err header tlv type");
      goto LABEL_32;
    }

    v12 = &v11[*((unsigned __int16 *)v11 + 3) + 8];
    if (*(_WORD *)v12 != 2)
    {
      syslog(3, "Error: entry %u mismatch in expected payload header tlv type");
      goto LABEL_32;
    }

    uint64_t v13 = *(unsigned __int16 *)(v11 + 15);
    v14 = v12 + 4;
    unint64_t v15 = (unint64_t)&v11[*((unsigned __int16 *)v11 + 1) + 4];
    if (v15 < (unint64_t)&v12[((unint64_t)(v13 + 3) >> 2) + 4])
    {
      syslog(3, "Error: entry %u end of geom error page status exceeds entry end");
      goto LABEL_32;
    }

    if (v15 > (unint64_t)v52)
    {
      syslog(3, "Error: entry %u end of geom error entry exceeds buffer end");
      goto LABEL_32;
    }

    uint64_t v53 = (uint64_t)&v11[*((unsigned __int16 *)v11 + 1) + 4];
    int v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v17, @"ESR_header_i");

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((_DWORD *)v11 + 2) & 0xF));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v18, @"msp");

    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  (*((_DWORD *)v11 + 2) >> 4) & 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v19, @"channel");

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  (*((_DWORD *)v11 + 2) >> 5) & 0xF));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v20, @"die");

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  (*((_DWORD *)v11 + 2) >> 9) & 7));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v21, @"plane");

    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  (*((_DWORD *)v11 + 2) >> 12) & 0x7FFF));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v22, @"bork");

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((_DWORD *)v11 + 2) >> 27));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v23, @"reason");

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *(unsigned __int16 *)(v11 + 13)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v24, @"failPage");

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v13));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v25, @"numOfPages");

    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v11[17]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v26, @"mode");

    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  (v11[12] >> 1) & 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v27, @"reliability");

    unsigned int v28 = v11[12] >> 2;
    if (v28 >= 4)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v11 + 25)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v29, @"cycles");

      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v11 + 29)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v30, @"age");

      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v11 + 33)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v31, @"timeStamp");

      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *(unsigned __int16 *)(v11 + 69)));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v32,  @"readDisturbCounter");

      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v11[71]));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v33, @"flow");

      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v11[72]));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v34, @"minTemp");

      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v11[73]));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v35, @"maxTemp");

      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v11[24] & 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v36, @"openBlock");

LABEL_15:
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *((unsigned __int16 *)v11 + 10)));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v37,  @"numScannedPages");

      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *((unsigned __int16 *)v11 + 11)));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v38,  @"numFailures");

      goto LABEL_16;
    }

    if (v28 == 3) {
      goto LABEL_15;
    }
LABEL_16:
    int v54 = v10;
    v39 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);

    if ((_DWORD)v13)
    {
      char v40 = 0;
      uint64_t v41 = 0LL;
      do
      {
        uint64_t v42 = (*((unsigned __int8 *)v14 + ((unint64_t)v41 >> 2)) >> (v40 & 6)) & 3;
        if ((_DWORD)v41 == *(unsigned __int16 *)(v11 + 13))
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  (*((unsigned __int8 *)v14 + ((unint64_t)v41 >> 2)) >> (v40 & 6)) & 3));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v43,  @"failPageStatus");
        }

        if ((_DWORD)v42)
        {
          v55[0] = @"ESR_page_i";
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v41));
          v55[1] = @"ESR_page_i_status";
          v56[0] = v44;
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v42));
          v56[1] = v45;
          v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  2LL));
          -[NSMutableArray addObject:](v39, "addObject:", v46);
        }

        uint64_t v41 = (v41 + 1);
        v40 += 2;
      }

      while ((_DWORD)v13 != (_DWORD)v41);
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableArray count](v39, "count")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v47,  @"ESR_numFailedPages");

    self = v50;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](v50, "error_payload_array"));
    [v48 addObject:v16];

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_pages_array](v50, "error_pages_array"));
    [v49 addObject:v39];

    v11 = (char *)v53;
    uint64_t v10 = (v54 + 1);
    v8 = v39;
    v9 = v16;
    if ((_DWORD)v10 == v51)
    {

      return;
    }
  }

  syslog(3, "Error: entry %u end of geom error header exceeds buffer end");
LABEL_32:
  -[NANDInfo_GeomErrorPayloadManager setInvalid_error_payload:](self, "setInvalid_error_payload:", 1LL);
}

- (void)populateOtherStats:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NANDInfo_GeomErrorPayloadManager setOther_stats_dict:](self, "setOther_stats_dict:", v6);

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = [&off_10008E680 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      id v9 = 0LL;
      uint64_t v10 = *(void *)v17;
      do
      {
        v11 = 0LL;
        v12 = v9;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(&off_10008E680);
          }
          id v9 = *(id *)(*((void *)&v16 + 1) + 8LL * (void)v11);

          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v9]);
          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v9]);
            unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager other_stats_dict](self, "other_stats_dict"));
            [v15 setObject:v14 forKeyedSubscript:v9];
          }

          v11 = (char *)v11 + 1;
          v12 = v9;
        }

        while (v8 != v11);
        id v8 = [&off_10008E680 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }
  }
}

- (BOOL)iteratePerPageDictsForMaxPagesWithStatus:(unsigned int)a3 iteratorCallBack:(id)a4
{
  uint64_t v5 = (uint64_t (**)(id, id))a4;
  if (-[NANDInfo_GeomErrorPayloadManager invalid_error_payload](self, "invalid_error_payload")) {
    goto LABEL_30;
  }
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](self, "error_payload_array"));
  if (!v6) {
    goto LABEL_30;
  }
  id v7 = (void *)v6;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_pages_array](self, "error_pages_array"));
  if (!v8)
  {

    goto LABEL_30;
  }

  id v9 = (void *)v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager other_stats_dict](self, "other_stats_dict"));

  if (!v10)
  {
LABEL_30:
    syslog(3, "ERROR: Missing valid input data");
    BOOL v41 = 0;
    goto LABEL_31;
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](self, "error_payload_array"));
  id v47 = [v11 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v47)
  {
    unsigned int v52 = 0;
    v12 = 0LL;
    uint64_t v13 = 0LL;
    v14 = 0LL;
    id v15 = 0LL;
    uint64_t v48 = *(void *)v60;
    v44 = v11;
    v46 = self;
    while (2)
    {
      uint64_t v16 = 0LL;
      __int128 v17 = v13;
      __int128 v18 = v14;
      do
      {
        if (*(void *)v60 != v48)
        {
          uint64_t v19 = v16;
          objc_enumerationMutation(v11);
          uint64_t v16 = v19;
        }

        uint64_t v49 = v16;
        id v20 = *(id *)(*((void *)&v59 + 1) + 8 * v16);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_pages_array](self, "error_pages_array"));
        id v22 = [v21 count];

        if ((unint64_t)v22 <= v52)
        {
          syslog(3, "ERROR: error pages array smaller than payload array!");
          BOOL v41 = 0;
          v14 = v18;
          uint64_t v13 = v17;
          goto LABEL_36;
        }

        context = objc_autoreleasePoolPush();
        int v51 = v20;
        v14 = -[NSMutableDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:copyItems:",  v20,  1LL);

        v23 = self;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_pages_array](self, "error_pages_array"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:v52]);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager other_stats_dict](v23, "other_stats_dict"));
        -[NSMutableDictionary addEntriesFromDictionary:](v14, "addEntriesFromDictionary:", v25);

        if ([v13 count])
        {
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          id obj = v13;
          id v26 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
          if (v26)
          {
            id v27 = v26;
            int v28 = 0;
            uint64_t v29 = *(void *)v56;
            v45 = v13;
            while (2)
            {
              v30 = 0LL;
              int v31 = v28 + 1;
              int v43 = v28 + (_DWORD)v27;
              v32 = v15;
              do
              {
                if (*(void *)v56 != v29) {
                  objc_enumerationMutation(obj);
                }
                id v15 = *(id *)(*((void *)&v55 + 1) + 8LL * (void)v30);

                if (v31 + (int)v30 > a3)
                {
                  v11 = v44;
                  uint64_t v13 = v45;
                  goto LABEL_25;
                }

                v33 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"ESR_page_i"]);
                -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v33,  @"ESR_page_i");

                v34 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"ESR_page_i_status"]);
                -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v34,  @"ESR_page_i_status");

                v35 = objc_autoreleasePoolPush();
                v36 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  v14,  1LL);
                int v37 = v5[2](v5, v36);

                if (!v37)
                {
                  syslog(3, "ERROR: failed to run the callBack when iterating error payload pages!");
                  objc_autoreleasePoolPop(v35);

                  v11 = v44;
                  uint64_t v13 = v45;
                  goto LABEL_33;
                }

                objc_autoreleasePoolPop(v35);
                v30 = (char *)v30 + 1;
                v32 = v15;
              }

              while (v27 != v30);
              id v27 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
              v11 = v44;
              uint64_t v13 = v45;
              int v28 = v43;
              if (v27) {
                continue;
              }
              break;
            }
          }

          id v15 = 0LL;
LABEL_25:
        }

        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  &off_10008E800,  @"ESR_page_i");
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  &off_10008E800,  @"ESR_page_i_status");
          v38 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  v14,  1LL);
          char v39 = v5[2](v5, v38);

          if ((v39 & 1) == 0)
          {
            syslog(3, "ERROR: failed to run the callBack on error entry without error pages!");
LABEL_33:
            objc_autoreleasePoolPop(context);
            BOOL v41 = 0;
            id v20 = v51;
            goto LABEL_36;
          }
        }

        self = v46;
        ++v52;
        objc_autoreleasePoolPop(context);
        uint64_t v16 = v49 + 1;
        v12 = v51;
        __int128 v17 = v13;
        char v40 = v13;
        __int128 v18 = v14;
      }

      while ((id)(v49 + 1) != v47);
      v12 = v51;
      uint64_t v13 = v40;
      id v47 = [v11 countByEnumeratingWithState:&v59 objects:v64 count:16];
      if (v47) {
        continue;
      }
      break;
    }

    id v20 = 0LL;
  }

  else
  {
    id v20 = 0LL;
    uint64_t v13 = 0LL;
    v14 = 0LL;
    id v15 = 0LL;
  }

  BOOL v41 = 1;
LABEL_36:

LABEL_31:
  return v41;
}

- (id)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (-[NANDInfo_GeomErrorPayloadManager invalid_error_payload](self, "invalid_error_payload"))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"invalidErrorPayload");
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](self, "error_payload_array"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 count]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"error_count");

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](self, "error_payload_array"));
    id v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager other_stats_dict](self, "other_stats_dict"));

      if (v8)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager other_stats_dict](self, "other_stats_dict"));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  @"other_stats");
      }

      uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"error_payload");

      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_payload_array](self, "error_payload_array"));
      id v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11)
      {
        id v12 = v11;
        v25 = self;
        uint64_t v13 = 0LL;
        int v14 = 0;
        id v15 = 0LL;
        uint64_t v16 = *(void *)v27;
        do
        {
          __int128 v17 = 0LL;
          __int128 v18 = v13;
          uint64_t v19 = v15;
          do
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(obj);
            }
            id v15 = *(id *)(*((void *)&v26 + 1) + 8LL * (void)v17);

            uint64_t v13 = -[NSMutableDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:copyItems:",  v15,  1LL);
            id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NANDInfo_GeomErrorPayloadManager error_pages_array](v25, "error_pages_array"));
            v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:(v14 + (_DWORD)v17)]);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v21,  @"page_statuses");

            id v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"error_payload"));
            [v22 addObject:v13];

            __int128 v17 = (char *)v17 + 1;
            __int128 v18 = v13;
            uint64_t v19 = v15;
          }

          while (v12 != v17);
          id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
          v14 += (int)v17;
        }

        while (v12);
      }
    }
  }

  return v3;
}

- (BOOL)hasNewErrors
{
  if (-[NANDInfo_GeomErrorPayloadManager invalid_error_payload](self, "invalid_error_payload")) {
    return 0;
  }
  unsigned int v4 = -[NANDInfo_GeomErrorPayloadManager num_errors_in_payload_cur](self, "num_errors_in_payload_cur");
  return v4 > -[NANDInfo_GeomErrorPayloadManager num_errors_in_payload_prev](self, "num_errors_in_payload_prev");
}

- (NSMutableArray)error_payload_array
{
  return self->_error_payload_array;
}

- (void)setError_payload_array:(id)a3
{
}

- (NSMutableArray)error_pages_array
{
  return self->_error_pages_array;
}

- (void)setError_pages_array:(id)a3
{
}

- (NSMutableDictionary)other_stats_dict
{
  return self->_other_stats_dict;
}

- (void)setOther_stats_dict:(id)a3
{
}

- (unsigned)num_errors_in_payload_cur
{
  return self->_num_errors_in_payload_cur;
}

- (void)setNum_errors_in_payload_cur:(unsigned int)a3
{
  self->_num_errors_in_payload_cur = a3;
}

- (unsigned)num_errors_in_payload_prev
{
  return self->_num_errors_in_payload_prev;
}

- (void)setNum_errors_in_payload_prev:(unsigned int)a3
{
  self->_num_errors_in_payload_prev = a3;
}

- (BOOL)invalid_error_payload
{
  return self->_invalid_error_payload;
}

- (void)setInvalid_error_payload:(BOOL)a3
{
  self->_invalid_error_payload = a3;
}

- (void).cxx_destruct
{
}

@end