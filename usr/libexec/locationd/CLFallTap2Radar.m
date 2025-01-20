@interface CLFallTap2Radar
- (BOOL)trigger:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6 response:(unsigned __int8)a7 resolution:(unsigned __int8)a8 isNearFall:(BOOL)a9 isFallSubmissionAllowed:(BOOL)a10 isNearFallSubmissionAllowed:(BOOL)a11;
- (id)initInUniverse:(id)a3;
- (void)dealloc;
@end

@implementation CLFallTap2Radar

- (id)initInUniverse:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLFallTap2Radar;
  v4 = -[CLFallTap2Radar init](&v10, "init");
  if (v4)
  {
    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_101879AE8);
    }
    v5 = (os_log_s *)qword_1019345D8;
    if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Initializing CLFallTap2Radar instance", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019345D0 != -1) {
        dispatch_once(&qword_1019345D0, &stru_101879AE8);
      }
      v9[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345D8,  2LL,  "Initializing CLFallTap2Radar instance",  v9,  2);
      v8 = (uint8_t *)v7;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLFallTap2Radar initInUniverse:]", "%s\n", v7);
      if (v8 != buf) {
        free(v8);
      }
    }

    v4->_universe = (CLIntersiloUniverse *)a3;
  }

  return v4;
}

- (void)dealloc
{
  if (qword_1019345D0 != -1) {
    dispatch_once(&qword_1019345D0, &stru_101879AE8);
  }
  v3 = (os_log_s *)qword_1019345D8;
  if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Tearing down CLFallTap2Radar instance", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_101879AE8);
    }
    v7[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345D8,  2LL,  "Tearing down CLFallTap2Radar instance",  v7,  2);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLFallTap2Radar dealloc]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLFallTap2Radar;
  -[CLFallTap2Radar dealloc](&v6, "dealloc");
}

- (BOOL)trigger:(id)a3 metaData:(id)a4 start:(id)a5 end:(id)a6 response:(unsigned __int8)a7 resolution:(unsigned __int8)a8 isNearFall:(BOOL)a9 isFallSubmissionAllowed:(BOOL)a10 isNearFallSubmissionAllowed:(BOOL)a11
{
  if (sub_1004F8A40())
  {
    if (a9 || a10)
    {
      if (a9 && !a11)
      {
        if (qword_1019345D0 != -1) {
          dispatch_once(&qword_1019345D0, &stru_101879AE8);
        }
        v11 = (os_log_s *)qword_1019345D8;
        if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 68289026;
          int v15 = 0;
          __int16 v16 = 2082;
          v17 = "";
          v12 = "{msg%{public}.0s:CLFallTap2Radar::trigger avoiding tap to radar as near fall submission is not allowed}";
          goto LABEL_14;
        }
      }
    }

    else
    {
      if (qword_1019345D0 != -1) {
        dispatch_once(&qword_1019345D0, &stru_101879AE8);
      }
      v11 = (os_log_s *)qword_1019345D8;
      if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 68289026;
        int v15 = 0;
        __int16 v16 = 2082;
        v17 = "";
        v12 = "{msg%{public}.0s:CLFallTap2Radar::trigger avoiding tap to radar as fall submission is not allowed}";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0x12u);
      }
    }
  }

  return 0;
}

@end