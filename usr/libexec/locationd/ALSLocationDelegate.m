@interface ALSLocationDelegate
- (ALSLocationDelegate)initWithRequester:(void *)a3;
- (void)addRequesterWithOutstandingRequest:(id)a3;
- (void)dealloc;
- (void)finished:(id)a3;
- (void)processCells:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7;
- (void)processScdmaCells:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7;
- (void)processWireless:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7 surroundingWifiBands:(const void *)a8;
- (void)requester:(id)a3 didFailWithError:(id)a4;
- (void)requester:(id)a3 didReceiveResponse:(id)a4 forRequest:(id)a5;
- (void)requesterDidFinish:(id)a3;
@end

@implementation ALSLocationDelegate

- (ALSLocationDelegate)initWithRequester:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ALSLocationDelegate;
  v4 = -[ALSLocationDelegate init](&v6, "init");
  if (v4)
  {
    v4->fRequestersWithOutstandingRequests = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v4->fRequester = a3;
  }

  return v4;
}

- (void)dealloc
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  fRequestersWithOutstandingRequests = self->fRequestersWithOutstandingRequests;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( fRequestersWithOutstandingRequests,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(fRequestersWithOutstandingRequests);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) cancel];
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( fRequestersWithOutstandingRequests,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ALSLocationDelegate;
  -[ALSLocationDelegate dealloc](&v8, "dealloc");
}

- (void)requester:(id)a3 didReceiveResponse:(id)a4 forRequest:(id)a5
{
  double Current = CFAbsoluteTimeGetCurrent();
  id v9 = [a4 cellTowers];
  id v58 = [a4 scdmaCellTowers];
  id v10 = [a4 cdmaCellTowers];
  id v11 = [a4 lteCellTowers];
  id v56 = [a4 nr5GCellTowers];
  id v12 = [a4 wirelessAPs];
  [a3 timestamp];
  double v14 = Current - v13;
  v57 = v12;
  if ([v12 count])
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101836B98);
    }
    v15 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240960;
      *(_DWORD *)&buf[4] = [a3 tag];
      *(_WORD *)&buf[8] = 2050;
      *(double *)&buf[10] = v14;
      __int16 v69 = 2050;
      v70 = (const char *)[v12 count];
      __int16 v71 = 1026;
      unsigned int v72 = [a3 type];
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "@AlsFlow, reply, tag, %{public}d, wifi, rtt, %{public}.1f, aps, %{public}lu, type, %{public}d",  buf,  0x22u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101836B98);
      }
      uint64_t v47 = qword_101934858;
      *(_DWORD *)__p = 67240960;
      *(_DWORD *)&__p[4] = [a3 tag];
      *(_WORD *)&__p[8] = 2050;
      *(double *)&__p[10] = v14;
      *(_WORD *)&__p[18] = 2050;
      *(void *)&__p[20] = [v12 count];
      __int16 v66 = 1026;
      unsigned int v67 = [a3 type];
      v48 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v47,  0LL,  "@AlsFlow, reply, tag, %{public}d, wifi, rtt, %{public}.1f, aps, %{public}lu, type, %{public}d",  __p,  34);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]",  "%s\n",  v48);
      if (v48 != buf) {
        free(v48);
      }
    }
  }

  if ([v9 count]
    || [v10 count]
    || [v11 count]
    || [v58 count]
    || [v56 count])
  {
    unsigned int v16 = [v9 count];
    unsigned int v17 = [v10 count];
    unsigned int v18 = [v11 count];
    unsigned int v19 = [v58 count];
    signed int v20 = v17 + v16 + v18 + v19 + [v56 count];
    if ((id)v20 == [v9 count])
    {
      v21 = "gsm";
    }

    else if ((id)v20 == [v11 count])
    {
      v21 = "lte";
    }

    else if ((id)v20 == [v10 count])
    {
      v21 = "cdma";
    }

    else if ((id)v20 == [v58 count])
    {
      v21 = "scdma";
    }

    else if ((id)v20 == [v56 count])
    {
      v21 = "nr";
    }

    else
    {
      v21 = "multiple";
    }

    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101836B98);
    }
    v22 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v23 = [a3 tag];
      *(_DWORD *)buf = 67240962;
      *(_DWORD *)&buf[4] = v23;
      *(_WORD *)&buf[8] = 2050;
      *(double *)&buf[10] = v14;
      __int16 v69 = 2082;
      v70 = v21;
      __int16 v71 = 1026;
      unsigned int v72 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "@AlsFlow, reply, tag, %{public}d, cell, rtt, %{public}.1f, %{public}s, %{public}d",  buf,  0x22u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101836B98);
      }
      uint64_t v44 = qword_101934858;
      unsigned int v45 = [a3 tag];
      *(_DWORD *)__p = 67240962;
      *(_DWORD *)&__p[4] = v45;
      *(_WORD *)&__p[8] = 2050;
      *(double *)&__p[10] = v14;
      *(_WORD *)&__p[18] = 2082;
      *(void *)&__p[20] = v21;
      __int16 v66 = 1026;
      unsigned int v67 = v20;
      LODWORD(v55) = 34;
      v46 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v44,  0LL,  "@AlsFlow, reply, tag, %{public}d, cell, rtt, %{public}.1f, %{public}s, %{public}d",  __p,  v55);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]",  "%s\n",  v46);
      if (v46 != buf) {
        free(v46);
      }
    }
  }

  (*(void (**)(uint64_t *))(qword_101995698 + 16))(&qword_101995698);
  ++dword_1019956CC;
  (*(void (**)(uint64_t *))(qword_101995698 + 24))(&qword_101995698);
  sub_1010DDBC0(buf, "didReceiveResponse");
  sub_100987188((uint64_t)&qword_101995698, (uint64_t *)buf, *((_DWORD *)self->fRequester + 118));
  if (SBYTE3(v70) < 0) {
    operator delete(*(void **)buf);
  }
  if ([v10 count])
  {
    fRequester = self->fRequester;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_1003E3694;
    v62[3] = &unk_101836A38;
    v62[4] = v10;
    v62[5] = self;
    v62[6] = a3;
    *(double *)&v62[7] = Current;
    sub_1003E3630((uint64_t)fRequester, (int)[a3 type], (int)objc_msgSend(a3, "tag"), (uint64_t)v62);
  }

  if ([v11 count])
  {
    v25 = self->fRequester;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_1003E42AC;
    v61[3] = &unk_101836A38;
    v61[4] = v11;
    v61[5] = self;
    v61[6] = a3;
    *(double *)&v61[7] = Current;
    sub_1003E3630((uint64_t)v25, (int)[a3 type], (int)objc_msgSend(a3, "tag"), (uint64_t)v61);
  }

  if ([v56 count])
  {
    v26 = self->fRequester;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_1003E4D40;
    v60[3] = &unk_101836A38;
    v60[4] = v56;
    v60[5] = self;
    v60[6] = a3;
    *(double *)&v60[7] = Current;
    sub_1003E3630((uint64_t)v26, (int)[a3 type], (int)objc_msgSend(a3, "tag"), (uint64_t)v60);
  }

  if ([v58 count]) {
    -[ALSLocationDelegate processScdmaCells:inRange:timeReceived:requestType:tag:]( self,  "processScdmaCells:inRange:timeReceived:requestType:tag:",  v58,  0,  [v58 count],  objc_msgSend(a3, "type"),  objc_msgSend(a3, "tag"),  Current);
  }
  if ([v9 count])
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101836B98);
    }
    v27 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [v9 count];
      *(_DWORD *)buf = 134349056;
      *(void *)&buf[4] = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "AlsCell, gsm, unbatched, %{public}lu",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101836B98);
      }
      uint64_t v49 = qword_101934858;
      id v50 = [v9 count];
      *(_DWORD *)__p = 134349056;
      *(void *)&__p[4] = v50;
      LODWORD(v55) = 12;
      v51 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v49,  2LL,  "AlsCell, gsm, unbatched, %{public}lu",  __p,  v55);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]",  "%s\n",  v51);
      if (v51 != buf) {
        free(v51);
      }
    }

    -[ALSLocationDelegate processCells:inRange:timeReceived:requestType:tag:]( self,  "processCells:inRange:timeReceived:requestType:tag:",  v9,  0,  [v9 count],  objc_msgSend(a3, "type"),  objc_msgSend(a3, "tag"),  Current);
  }

  if ([v57 count])
  {
    memset(__p, 0, 24);
    if (![a3 type] && objc_msgSend(a5, "surroundingWifiBandsCount"))
    {
      for (unint64_t i = 0; i < (unint64_t)[a5 surroundingWifiBandsCount]; ++i)
      {
        unsigned int v32 = [a5 surroundingWifiBandsAtIndex:i];
        unsigned int v33 = v32;
        v34 = *(char **)&__p[8];
        if (*(void *)&__p[8] >= *(void *)&__p[16])
        {
          v36 = *(char **)__p;
          uint64_t v37 = (uint64_t)(*(void *)&__p[8] - *(void *)__p) >> 2;
          unint64_t v38 = v37 + 1;
          uint64_t v39 = *(void *)&__p[16] - *(void *)__p;
          else {
            unint64_t v40 = v38;
          }
          if (v40)
          {
            v41 = (char *)sub_10000956C((uint64_t)&__p[16], v40);
            v36 = *(char **)__p;
            v34 = *(char **)&__p[8];
          }

          else
          {
            v41 = 0LL;
          }

          v42 = (unsigned int *)&v41[4 * v37];
          unsigned int *v42 = v33;
          v35 = v42 + 1;
          while (v34 != v36)
          {
            unsigned int v43 = *((_DWORD *)v34 - 1);
            v34 -= 4;
            *--v42 = v43;
          }

          *(void *)__p = v42;
          *(void *)&__p[8] = v35;
          *(void *)&__p[16] = &v41[4 * v40];
          if (v36) {
            operator delete(v36);
          }
        }

        else
        {
          **(_DWORD **)&__p[8] = v32;
          v35 = v34 + 4;
        }

        *(void *)&__p[8] = v35;
      }
    }

    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101836B98);
    }
    v29 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
    {
      id v30 = [v57 count];
      *(_DWORD *)buf = 134349056;
      *(void *)&buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "AlsWifi, unbatched, %{public}lu", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101836B98);
      }
      uint64_t v52 = qword_101934858;
      id v53 = [v57 count];
      int v63 = 134349056;
      id v64 = v53;
      LODWORD(v55) = 12;
      v54 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v52,  2LL,  "AlsWifi, unbatched, %{public}lu",  &v63,  v55);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]",  "%s\n",  v54);
      if (v54 != buf) {
        free(v54);
      }
    }

    -[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:]( self,  "processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:",  v57,  0,  [v57 count],  objc_msgSend(a3, "type"),  objc_msgSend(a3, "tag"),  __p,  Current);
    if (*(void *)__p)
    {
      *(void *)&__p[8] = *(void *)__p;
      operator delete(*(void **)__p);
    }
  }

- (void)requesterDidFinish:(id)a3
{
  if ((-[NSMutableSet containsObject:](self->fRequestersWithOutstandingRequests, "containsObject:") & 1) != 0)
  {
    sub_1010DDBC0(__p, "requesterDidFinish");
    sub_100987188((uint64_t)&qword_101995698, (uint64_t *)__p, *((_DWORD *)self->fRequester + 118));
    if (v19 < 0) {
      operator delete(*(void **)__p);
    }
    id v5 = [a3 downloadPayloadSize];
    (*(void (**)(uint64_t *))(qword_101995698 + 16))(&qword_101995698);
    dword_1019956C4 += (int)v5;
    (*(void (**)(uint64_t *))(qword_101995698 + 24))(&qword_101995698);
    [a3 setFinished:1];
    -[ALSLocationDelegate finished:](self, "finished:", a3);
    -[NSMutableSet removeObject:](self->fRequestersWithOutstandingRequests, "removeObject:", a3);
    if (qword_101934A30 != -1) {
      dispatch_once(&qword_101934A30, &stru_101836C00);
    }
    uint64_t v6 = (os_log_s *)qword_101934A38;
    if (os_log_type_enabled((os_log_t)qword_101934A38, OS_LOG_TYPE_INFO))
    {
      id v7 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
      *(_DWORD *)__p = 134218240;
      *(void *)&__p[4] = v5;
      __int16 v17 = 2048;
      id v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "AlsRequester, didFinish, payload, %lu, outstanding, %ld",  __p,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_101934A30 != -1) {
        dispatch_once(&qword_101934A30, &stru_101836C00);
      }
      uint64_t v8 = qword_101934A38;
      id v9 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
      int v12 = 134218240;
      id v13 = v5;
      __int16 v14 = 2048;
      id v15 = v9;
      id v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v8,  1LL,  "AlsRequester, didFinish, payload, %lu, outstanding, %ld",  &v12,  22);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[ALSLocationDelegate requesterDidFinish:]", "%s\n", v10);
LABEL_21:
      if (v10 != __p) {
        free(v10);
      }
    }
  }

  else
  {
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101836BE0);
    }
    id v11 = (os_log_s *)qword_101934A48;
    if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "Unknown pbrequester object received in delegate callback",  __p,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_101934A40 != -1) {
        dispatch_once(&qword_101934A40, &stru_101836BE0);
      }
      LOWORD(v12) = 0;
      id v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  qword_101934A48,  17LL,  "Unknown pbrequester object received in delegate callback",  &v12,  2);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[ALSLocationDelegate requesterDidFinish:]", "%s\n", v10);
      goto LABEL_21;
    }
  }

- (void)requester:(id)a3 didFailWithError:(id)a4
{
  if ((-[NSMutableSet containsObject:](self->fRequestersWithOutstandingRequests, "containsObject:") & 1) != 0)
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101836B98);
    }
    id v7 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [a3 tag];
      double Current = CFAbsoluteTimeGetCurrent();
      [a3 timestamp];
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)&buf[4] = v8;
      __int16 v41 = 2050;
      double v42 = Current - v10;
      __int16 v43 = 2050;
      id v44 = [a4 code];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "@AlsFlow, reply, tag, %{public}d, error, rtt, %{public}.1lf, code, %{public}ld",  buf,  0x1Cu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101836B98);
      }
      uint64_t v21 = qword_101934858;
      unsigned int v22 = [a3 tag];
      double v23 = CFAbsoluteTimeGetCurrent();
      [a3 timestamp];
      *(_DWORD *)uint64_t v39 = 67240704;
      *(_DWORD *)&v39[4] = v22;
      *(_WORD *)&v39[8] = 2050;
      *(double *)&v39[10] = v23 - v24;
      *(_WORD *)&v39[18] = 2050;
      *(void *)&v39[20] = [a4 code];
      v25 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v21,  0LL,  "@AlsFlow, reply, tag, %{public}d, error, rtt, %{public}.1lf, code, %{public}ld",  v39,  28);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v25);
    }

    unsigned int v11 = [a3 type];
    if (v11 == 1)
    {
      sub_1003E63D8((uint64_t)self->fRequester, (int)[a3 type], (int)objc_msgSend(a3, "tag"));
    }

    else if (v11)
    {
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_101836C20);
      }
      __int16 v14 = (os_log_s *)qword_101934A78;
      if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_FAULT))
      {
        unsigned int v15 = [a3 tag];
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "query: received error for unknown requester type (tag %{public}d)",  buf,  8u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934A70 != -1) {
          dispatch_once(&qword_101934A70, &stru_101836C20);
        }
        uint64_t v31 = qword_101934A78;
        unsigned int v32 = [a3 tag];
        *(_DWORD *)uint64_t v39 = 67240192;
        *(_DWORD *)&v39[4] = v32;
        LODWORD(v34) = 8;
        unsigned int v33 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v31,  17LL,  "query: received error for unknown requester type (tag %{public}d)",  v39,  v34);
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v33);
      }
    }

    else
    {
      sub_1003E6374((uint64_t)self->fRequester, (int)[a3 type], (int)objc_msgSend(a3, "tag"));
    }

    sub_1010DDBC0(buf, "didFailWithError");
    sub_100987188((uint64_t)&qword_101995698, (uint64_t *)buf, *((_DWORD *)self->fRequester + 118));
    if (SBYTE3(v44) < 0) {
      operator delete(*(void **)buf);
    }
    -[NSMutableSet removeObject:](self->fRequestersWithOutstandingRequests, "removeObject:", a3);
    if (qword_101934A30 != -1) {
      dispatch_once(&qword_101934A30, &stru_101836C00);
    }
    unsigned int v16 = (os_log_s *)qword_101934A38;
    if (os_log_type_enabled((os_log_t)qword_101934A38, OS_LOG_TYPE_INFO))
    {
      sub_1002A6C50((const __CFString *)[a4 domain], (std::string *)buf);
      int v17 = SBYTE3(v44);
      id v18 = *(uint8_t **)buf;
      id v19 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
      signed int v20 = buf;
      if (v17 < 0) {
        signed int v20 = v18;
      }
      *(_DWORD *)uint64_t v39 = 136315394;
      *(void *)&v39[4] = v20;
      *(_WORD *)&v39[12] = 2048;
      *(void *)&v39[14] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "AlsRequester, didFailWithError, code, %s, outstanding, %ld",  v39,  0x16u);
      if (SBYTE3(v44) < 0) {
        operator delete(*(void **)buf);
      }
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A30 != -1) {
        dispatch_once(&qword_101934A30, &stru_101836C00);
      }
      uint64_t v26 = qword_101934A38;
      sub_1002A6C50((const __CFString *)[a4 domain], (std::string *)v39);
      int v27 = v39[23];
      id v28 = *(_BYTE **)v39;
      id v29 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
      id v30 = v39;
      if (v27 < 0) {
        id v30 = v28;
      }
      int v35 = 136315394;
      v36 = v30;
      __int16 v37 = 2048;
      id v38 = v29;
      LODWORD(v34) = 22;
      id v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v26,  1LL,  "AlsRequester, didFailWithError, code, %s, outstanding, %ld",  (const char *)&v35,  v34);
      if ((v39[23] & 0x80000000) != 0) {
        operator delete(*(void **)v39);
      }
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v13);
      if (v13 != (char *)buf) {
LABEL_47:
      }
        free(v13);
    }
  }

  else
  {
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101836BE0);
    }
    int v12 = (os_log_s *)qword_101934A48;
    if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "Unknown pbrequester object received in delegate callback",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A40 != -1) {
        dispatch_once(&qword_101934A40, &stru_101836BE0);
      }
      *(_WORD *)uint64_t v39 = 0;
      id v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  17LL,  "Unknown pbrequester object received in delegate callback",  v39,  2);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v13);
    }
  }

- (void)finished:(id)a3
{
  if (qword_101934A30 != -1) {
    dispatch_once(&qword_101934A30, &stru_101836C00);
  }
  id v5 = (os_log_s *)qword_101934A38;
  if (os_log_type_enabled((os_log_t)qword_101934A38, OS_LOG_TYPE_INFO))
  {
    id v6 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
    *(_DWORD *)buf = 134217984;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "AlsRequester, finished, outstanding, %ld",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A30 != -1) {
      dispatch_once(&qword_101934A30, &stru_101836C00);
    }
    uint64_t v7 = qword_101934A38;
    id v8 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
    int v10 = 134217984;
    id v11 = v8;
    id v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  1LL,  "AlsRequester, finished, outstanding, %ld",  &v10);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[ALSLocationDelegate finished:]", "%s\n", v9);
  }

  if (([a3 processingCellTowers] & 1) == 0
    && ([a3 processingWirelessAPs] & 1) == 0)
  {
  }

- (void)processCells:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101836B98);
    }
    __int16 v14 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      NSUInteger v23 = length;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "AlsCell, gsm, rx, %{public}lu", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101836B98);
      }
      int v20 = 134349056;
      NSUInteger v21 = length;
      unsigned int v16 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  2LL,  "AlsCell, gsm, rx, %{public}lu",  &v20,  12);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[ALSLocationDelegate processCells:inRange:timeReceived:requestType:tag:]",  "%s\n",  v16);
    }

    fRequester = self->fRequester;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1003E68D8;
    v17[3] = &unk_101836A60;
    v17[6] = location;
    v17[7] = length;
    v17[4] = a3;
    v17[5] = self;
    int v18 = a6;
    int v19 = a7;
    *(double *)&v17[8] = a5;
    sub_1003E3630((uint64_t)fRequester, a6, a7, (uint64_t)v17);
  }

- (void)processScdmaCells:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101836B98);
    }
    __int16 v14 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      NSUInteger v23 = length;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "AlsCell, scdma, rx, %{public}lu", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101836B98);
      }
      int v20 = 134349056;
      NSUInteger v21 = length;
      unsigned int v16 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  2LL,  "AlsCell, scdma, rx, %{public}lu",  &v20,  12);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[ALSLocationDelegate processScdmaCells:inRange:timeReceived:requestType:tag:]",  "%s\n",  v16);
    }

    fRequester = self->fRequester;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1003E726C;
    v17[3] = &unk_101836A60;
    v17[6] = location;
    v17[7] = length;
    v17[4] = a3;
    v17[5] = self;
    int v18 = a6;
    int v19 = a7;
    *(double *)&v17[8] = a5;
    sub_1003E3630((uint64_t)fRequester, a6, a7, (uint64_t)v17);
  }

- (void)processWireless:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7 surroundingWifiBands:(const void *)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101836B98);
  }
  id v13 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 134349056;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = length;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "AlsWifi, rx, %{public}lu", (uint8_t *)&buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101836B98);
    }
    *(_DWORD *)__p = 134349056;
    *(void *)&__p[4] = length;
    v117 = (std::string *)_os_log_send_and_compose_impl( 2LL,  0LL,  &buf,  1628LL,  &_mh_execute_header,  qword_101934858,  2LL,  "AlsWifi, rx, %{public}lu",  __p,  12);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:]",  "%s\n",  (const char *)v117);
    if (v117 != &buf) {
      free(v117);
    }
  }

  if (length)
  {
    v133 = 0LL;
    v134 = 0LL;
    v135 = 0LL;
    v130 = 0LL;
    v131 = 0LL;
    v132 = 0LL;
    NSUInteger v125 = location + length;
    if (location < location + length)
    {
      __asm { FMOV            V0.2D, #-1.0 }

      __int128 v124 = _Q0;
      id v122 = a3;
      do
      {
        id v19 = [a3 objectAtIndex:location];
        sub_1002A6C50((const __CFString *)[v19 macID], &buf);
        uint64_t v129 = sub_1007EBE44((uint64_t *)&buf);
        if (![v19 hasLocation]
          || (objc_msgSend(objc_msgSend(v19, "location"), "accuracy") & 0x80000000) != 0)
        {
          uint64_t v21 = v129;
          __int128 v128 = 0uLL;
          memset(&v126, 0, 20);
          memset(v136, 0, 25);
          *(void *)&v159[3] = -1LL;
          *(void *)&v159[11] = -1LL;
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          else {
            unsigned int v23 = 1;
          }
          double v24 = (os_log_s *)qword_101934858;
          if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
          {
            sub_1007EC360((std::string *)__p);
            v25 = __p[23] >= 0 ? __p : *(_BYTE **)__p;
            unsigned int v26 = objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask");
            LODWORD(buf.__r_.__value_.__l.__data_) = 136381443;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v25;
            WORD2(buf.__r_.__value_.__r.__words[1]) = 2050;
            *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = location;
            HIWORD(buf.__r_.__value_.__r.__words[2]) = 1026;
            *(_DWORD *)v161 = v26;
            *(_WORD *)&v161[4] = 1026;
            *(_DWORD *)&v161[6] = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "AlsWifi, unknown, %{private}s, %{public}lu, hasInfoMask, %{public}d, infoMask, 0x%{public}x",  (uint8_t *)&buf,  0x22u);
            if ((__p[23] & 0x80000000) != 0) {
              operator delete(*(void **)__p);
            }
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(&buf, 0x65CuLL);
            uint64_t v96 = qword_101934858;
            sub_1007EC360(&v127);
            if ((v127.__r_.__value_.__s.__size_ & 0x80u) == 0) {
              v97 = &v127;
            }
            else {
              v97 = (std::stringbuf::string_type *)v127.__r_.__value_.__r.__words[0];
            }
            unsigned int v98 = objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask");
            *(_DWORD *)__p = 136381443;
            *(void *)&__p[4] = v97;
            *(_WORD *)&_BYTE __p[12] = 2050;
            *(void *)&__p[14] = location;
            *(_WORD *)&__p[22] = 1026;
            *(_DWORD *)&__p[24] = v98;
            *(_WORD *)&_BYTE __p[28] = 1026;
            *(_DWORD *)&__p[30] = v23;
            LODWORD(v118) = 34;
            v99 = (std::string *)_os_log_send_and_compose_impl( 2LL,  0LL,  &buf,  1628LL,  &_mh_execute_header,  v96,  0LL,  "AlsWifi, unknown, %{private}s, %{public}lu, hasInfoMask, %{public}d, infoMask, 0x%{public}x",  __p,  v118);
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:]",  "%s\n",  (const char *)v99);
            if (v99 != &buf) {
              free(v99);
            }
          }

          int v27 = v131;
          if (v131 >= v132)
          {
            unint64_t v31 = 0xD37A6F4DE9BD37A7LL * ((v131 - (_BYTE *)v130) >> 3);
            unint64_t v32 = v31 + 1;
            if (v31 + 1 > 0x1642C8590B21642LL) {
              sub_100007008();
            }
            if (0xA6F4DE9BD37A6F4ELL * ((v132 - (_BYTE *)v130) >> 3) > v32) {
              unint64_t v32 = 0xA6F4DE9BD37A6F4ELL * ((v132 - (_BYTE *)v130) >> 3);
            }
            if (0xD37A6F4DE9BD37A7LL * ((v132 - (_BYTE *)v130) >> 3) >= 0xB21642C8590B21LL) {
              unint64_t v33 = 0x1642C8590B21642LL;
            }
            else {
              unint64_t v33 = v32;
            }
            if (v33) {
              uint64_t v34 = (char *)sub_1002DF6FC((uint64_t)&v132, v33);
            }
            else {
              uint64_t v34 = 0LL;
            }
            v60 = &v34[184 * v31];
            *(_DWORD *)v60 = 0xFFFF;
            *(_OWORD *)(v60 + 4) = v128;
            *(_OWORD *)(v60 + 20) = xmmword_1012E83C0;
            *(_OWORD *)(v60 + 36) = v124;
            *(_OWORD *)(v60 + 52) = v124;
            *(void *)(v60 + 68) = 0xBFF0000000000000LL;
            *(CFAbsoluteTime *)(v60 + 76) = Current;
            *((_DWORD *)v60 + 21) = 0;
            *((void *)v60 + 11) = 0xBFF0000000000000LL;
            *((_OWORD *)v60 + 6) = *(_OWORD *)&v126.__r_.__value_.__l.__data_;
            *((_DWORD *)v60 + 28) = v126.__r_.__value_.__r.__words[2];
            *(void *)(v60 + 116) = 0xBFF0000000000000LL;
            *((_DWORD *)v60 + 31) = 0x7FFFFFFF;
            __int128 v61 = *(_OWORD *)&v136[9];
            *((_OWORD *)v60 + 8) = *(_OWORD *)v136;
            *(_OWORD *)(v60 + 137) = v61;
            __int128 v62 = *(_OWORD *)v159;
            *((_DWORD *)v60 + 42) = *(_DWORD *)&v159[15];
            *((_DWORD *)v60 + 43) = v23;
            *(_OWORD *)(v60 + 153) = v62;
            *((void *)v60 + 22) = v21;
            id v64 = (char *)v130;
            int v63 = v131;
            v65 = v60;
            if (v131 != v130)
            {
              do
              {
                __int128 v66 = *(_OWORD *)(v63 - 184);
                __int128 v67 = *(_OWORD *)(v63 - 168);
                __int128 v68 = *(_OWORD *)(v63 - 152);
                *(_OWORD *)(v65 - 136) = *(_OWORD *)(v63 - 136);
                *(_OWORD *)(v65 - 152) = v68;
                *(_OWORD *)(v65 - 168) = v67;
                *(_OWORD *)(v65 - 184) = v66;
                __int128 v69 = *(_OWORD *)(v63 - 120);
                __int128 v70 = *(_OWORD *)(v63 - 104);
                __int128 v71 = *(_OWORD *)(v63 - 88);
                *(_OWORD *)(v65 - 72) = *(_OWORD *)(v63 - 72);
                *(_OWORD *)(v65 - 88) = v71;
                *(_OWORD *)(v65 - 104) = v70;
                *(_OWORD *)(v65 - 120) = v69;
                __int128 v72 = *(_OWORD *)(v63 - 56);
                __int128 v73 = *(_OWORD *)(v63 - 40);
                __int128 v74 = *(_OWORD *)(v63 - 24);
                *((void *)v65 - 1) = *((void *)v63 - 1);
                *(_OWORD *)(v65 - 24) = v74;
                *(_OWORD *)(v65 - 40) = v73;
                *(_OWORD *)(v65 - 56) = v72;
                v65 -= 184;
                v63 -= 184;
              }

              while (v63 != v64);
              int v63 = v64;
            }

            id v30 = v60 + 184;
            v130 = v65;
            v131 = v60 + 184;
            v132 = &v34[184 * v33];
            if (v63) {
              operator delete(v63);
            }
          }

          else
          {
            *(_DWORD *)v131 = 0xFFFF;
            *(_OWORD *)(v27 + 4) = v128;
            *(_OWORD *)(v27 + 20) = xmmword_1012E83C0;
            *(_OWORD *)(v27 + 36) = v124;
            *(_OWORD *)(v27 + 52) = v124;
            *(void *)(v27 + 68) = 0xBFF0000000000000LL;
            *(CFAbsoluteTime *)(v27 + 76) = Current;
            *((_DWORD *)v27 + 21) = 0;
            *((void *)v27 + 11) = 0xBFF0000000000000LL;
            *((_OWORD *)v27 + 6) = *(_OWORD *)&v126.__r_.__value_.__l.__data_;
            *((_DWORD *)v27 + 28) = v126.__r_.__value_.__r.__words[2];
            *(void *)(v27 + 116) = 0xBFF0000000000000LL;
            *((_DWORD *)v27 + 31) = 0x7FFFFFFF;
            __int128 v28 = *(_OWORD *)v136;
            *(_OWORD *)(v27 + 137) = *(_OWORD *)&v136[9];
            *((_OWORD *)v27 + 8) = v28;
            __int128 v29 = *(_OWORD *)v159;
            *((_DWORD *)v27 + 42) = *(_DWORD *)&v159[15];
            *((_DWORD *)v27 + 43) = v23;
            *(_OWORD *)(v27 + 153) = v29;
            id v30 = v27 + 184;
            *((void *)v27 + 22) = v21;
          }

          v131 = v30;
        }

        else
        {
          *(void *)&__p[4] = 0LL;
          *(void *)&_BYTE __p[12] = 0LL;
          *(_OWORD *)&__p[36] = v124;
          *(_OWORD *)&__p[52] = v124;
          *(_OWORD *)&__p[68] = v124;
          *(_DWORD *)__p = 0xFFFF;
          *(_DWORD *)&__p[84] = 0;
          *(void *)&__p[88] = 0xBFF0000000000000LL;
          __int128 v154 = 0uLL;
          LODWORD(v155) = 0;
          *(void *)((char *)&v155 + 4) = 0xBFF0000000000000LL;
          *(void *)v157 = 0LL;
          __int128 v156 = 0uLL;
          v157[8] = 0;
          *(void *)&v157[12] = -1LL;
          *(void *)&v157[20] = -1LL;
          HIDWORD(v155) = 0x7FFFFFFF;
          *(_DWORD *)&v157[28] = 0;
          uint64_t v158 = v129;
          *(_OWORD *)&__p[20] = xmmword_1012E83C0;
          else {
            double v20 = (double)(int)objc_msgSend(objc_msgSend(v19, "location"), "accuracy") / 1000000.0;
          }
          *(double *)&__p[20] = v20;
          *(double *)&__p[76] = a5;
          *(double *)&__p[4] = (double)(uint64_t)objc_msgSend(objc_msgSend(v19, "location"), "latitude") / 100000000.0;
          *(double *)&_BYTE __p[12] = (double)(uint64_t)objc_msgSend(objc_msgSend(v19, "location"), "longitude") / 100000000.0;
          DWORD1(v156) = 1;
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasAltitude")
            && objc_msgSend(objc_msgSend(v19, "location"), "hasVerticalAccuracy"))
          {
            *(double *)&_BYTE __p[28] = (double)(int)objc_msgSend(objc_msgSend(v19, "location"), "altitude") / 100.0;
            *(double *)&__p[36] = (double)(int)objc_msgSend(objc_msgSend(v19, "location"), "verticalAccuracy") / 100.0;
          }

          else {
            unsigned int v35 = 50;
          }
          *(_DWORD *)&__p[84] = v35;
          v36 = (os_log_s *)qword_101934858;
          if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
          {
            sub_1007EC360((std::string *)v136);
            if (v136[23] >= 0) {
              __int16 v37 = v136;
            }
            else {
              __int16 v37 = *(_BYTE **)v136;
            }
            sub_1008330C4((uint64_t)__p, &v127);
            if ((v127.__r_.__value_.__s.__size_ & 0x80u) == 0) {
              id v38 = &v127;
            }
            else {
              id v38 = (std::stringbuf::string_type *)v127.__r_.__value_.__r.__words[0];
            }
            int v39 = *(_DWORD *)&v157[12];
            int v40 = *(_DWORD *)&v157[16];
            uint64_t v41 = *(void *)&__p[28];
            int v42 = *(_DWORD *)&v157[20];
            unsigned int v43 = objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask");
            LODWORD(buf.__r_.__value_.__l.__data_) = 136383235;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v37;
            WORD2(buf.__r_.__value_.__r.__words[1]) = 2050;
            *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = location;
            HIWORD(buf.__r_.__value_.__r.__words[2]) = 2081;
            *(void *)v161 = v38;
            *(_WORD *)&v161[8] = 1026;
            int v162 = v39;
            __int16 v163 = 1026;
            int v164 = v40;
            __int16 v165 = 2050;
            uint64_t v166 = v41;
            __int16 v167 = 1026;
            int v168 = v42;
            __int16 v169 = 1026;
            unsigned int v170 = v43;
            __int16 v171 = 1026;
            int v172 = *(_DWORD *)&v157[28];
            __int16 v173 = 1026;
            int v174 = *(_DWORD *)&v157[24];
            __int16 v175 = 1026;
            int v176 = a6;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "AlsWifi, valid, location, %{private}s, %{public}lu, %{private}s, score, %{public}d, channel, %{public}d, a lt, %{public}.2lf, reach, %{public}d, hasInfoMask, %{public}d, infoMask, 0x%{public}x, numHarvestTraces, % {public}d, type, %{public}d",  (uint8_t *)&buf,  0x54u);
            a3 = v122;
            p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
            if ((v136[23] & 0x80000000) != 0) {
              operator delete(*(void **)v136);
            }
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(&buf, 0x65CuLL);
            uint64_t v100 = qword_101934858;
            sub_1007EC360(&v127);
            if ((v127.__r_.__value_.__s.__size_ & 0x80u) == 0) {
              v101 = &v127;
            }
            else {
              v101 = (std::stringbuf::string_type *)v127.__r_.__value_.__r.__words[0];
            }
            sub_1008330C4((uint64_t)__p, &v126);
            if ((v126.__r_.__value_.__s.__size_ & 0x80u) == 0) {
              v102 = &v126;
            }
            else {
              v102 = (std::stringbuf::string_type *)v126.__r_.__value_.__r.__words[0];
            }
            int v103 = *(_DWORD *)&v157[12];
            int v104 = *(_DWORD *)&v157[16];
            uint64_t v105 = *(void *)&__p[28];
            int v106 = *(_DWORD *)&v157[20];
            unsigned int v107 = objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask");
            *(_DWORD *)v136 = 136383235;
            *(void *)&v136[4] = v101;
            *(_WORD *)&v136[12] = 2050;
            *(void *)&v136[14] = location;
            *(_WORD *)&v136[22] = 2081;
            *(void *)&v136[24] = v102;
            __int16 v137 = 1026;
            int v138 = v103;
            __int16 v139 = 1026;
            int v140 = v104;
            __int16 v141 = 2050;
            uint64_t v142 = v105;
            __int16 v143 = 1026;
            int v144 = v106;
            __int16 v145 = 1026;
            unsigned int v146 = v107;
            __int16 v147 = 1026;
            int v148 = *(_DWORD *)&v157[28];
            __int16 v149 = 1026;
            int v150 = *(_DWORD *)&v157[24];
            __int16 v151 = 1026;
            int v152 = a6;
            LODWORD(v118) = 84;
            v108 = (std::string *)_os_log_send_and_compose_impl( 2LL,  0LL,  &buf,  1628LL,  &_mh_execute_header,  v100,  2LL,  "AlsWifi, valid, location, %{private}s, %{public}lu, %{private}s, score, %{public}d, channel, %{public}d, alt, %{public}.2lf, reach, %{public}d, hasInfoMask, %{public}d, infoMask, 0x%{public}x, numHarvestTraces, %{public}d, type, %{public}d",  v136,  v118);
            a3 = v122;
            p_vtable = (void **)(&OBJC_METACLASS___CLPrivacyManager + 24);
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:]",  "%s\n",  (const char *)v108);
            if (v108 != &buf) {
              free(v108);
            }
          }

          id v44 = v134;
          if (v134 >= v135)
          {
            uint64_t v55 = v133;
            unint64_t v56 = 0xD37A6F4DE9BD37A7LL * ((v134 - (_BYTE *)v133) >> 3);
            unint64_t v57 = v56 + 1;
            if (v56 + 1 > 0x1642C8590B21642LL) {
              sub_100007008();
            }
            if (0xA6F4DE9BD37A6F4ELL * ((v135 - (_BYTE *)v133) >> 3) > v57) {
              unint64_t v57 = 0xA6F4DE9BD37A6F4ELL * ((v135 - (_BYTE *)v133) >> 3);
            }
            if (0xD37A6F4DE9BD37A7LL * ((v135 - (_BYTE *)v133) >> 3) >= 0xB21642C8590B21LL) {
              unint64_t v58 = 0x1642C8590B21642LL;
            }
            else {
              unint64_t v58 = v57;
            }
            if (v58)
            {
              v59 = (char *)sub_1002DF6FC((uint64_t)&v135, v58);
              uint64_t v55 = v133;
              id v44 = v134;
            }

            else
            {
              v59 = 0LL;
            }

            v75 = &v59[184 * v56];
            __int128 v76 = *(_OWORD *)__p;
            __int128 v77 = *(_OWORD *)&__p[16];
            __int128 v78 = *(_OWORD *)&__p[48];
            *((_OWORD *)v75 + 2) = *(_OWORD *)&__p[32];
            *((_OWORD *)v75 + 3) = v78;
            *(_OWORD *)v75 = v76;
            *((_OWORD *)v75 + 1) = v77;
            __int128 v79 = *(_OWORD *)&__p[64];
            __int128 v80 = *(_OWORD *)&__p[80];
            __int128 v81 = v155;
            *((_OWORD *)v75 + 6) = v154;
            *((_OWORD *)v75 + 7) = v81;
            *((_OWORD *)v75 + 4) = v79;
            *((_OWORD *)v75 + 5) = v80;
            __int128 v82 = v156;
            __int128 v83 = *(_OWORD *)v157;
            __int128 v84 = *(_OWORD *)&v157[16];
            *((void *)v75 + 22) = v158;
            *((_OWORD *)v75 + 9) = v83;
            *((_OWORD *)v75 + 10) = v84;
            *((_OWORD *)v75 + 8) = v82;
            if (v44 == v55)
            {
              v95 = &v59[184 * v56];
            }

            else
            {
              v85 = &v59[184 * v56];
              do
              {
                __int128 v86 = *(_OWORD *)((char *)v44 - 184);
                __int128 v87 = *(_OWORD *)((char *)v44 - 168);
                __int128 v88 = *(_OWORD *)((char *)v44 - 152);
                *(_OWORD *)(v85 - 136) = *(_OWORD *)((char *)v44 - 136);
                *(_OWORD *)(v85 - 152) = v88;
                *(_OWORD *)(v85 - 168) = v87;
                *(_OWORD *)(v85 - 184) = v86;
                __int128 v89 = *(_OWORD *)((char *)v44 - 120);
                __int128 v90 = *(_OWORD *)((char *)v44 - 104);
                __int128 v91 = *(_OWORD *)((char *)v44 - 88);
                *(_OWORD *)(v85 - 72) = *(_OWORD *)((char *)v44 - 72);
                *(_OWORD *)(v85 - 88) = v91;
                *(_OWORD *)(v85 - 104) = v90;
                *(_OWORD *)(v85 - 120) = v89;
                __int128 v92 = *(_OWORD *)((char *)v44 - 56);
                __int128 v93 = *(_OWORD *)((char *)v44 - 40);
                __int128 v94 = *(_OWORD *)((char *)v44 - 24);
                v95 = v85 - 184;
                *((void *)v85 - 1) = *((void *)v44 - 1);
                *(_OWORD *)(v85 - 24) = v94;
                *(_OWORD *)(v85 - 40) = v93;
                *(_OWORD *)(v85 - 56) = v92;
                id v44 = (_OWORD *)((char *)v44 - 184);
                v85 -= 184;
              }

              while (v44 != v55);
            }

            v54 = v75 + 184;
            v133 = v95;
            v134 = v75 + 184;
            v135 = &v59[184 * v58];
            if (v55) {
              operator delete(v55);
            }
          }

          else
          {
            __int128 v45 = *(_OWORD *)__p;
            __int128 v46 = *(_OWORD *)&__p[16];
            __int128 v47 = *(_OWORD *)&__p[48];
            *((_OWORD *)v134 + 2) = *(_OWORD *)&__p[32];
            v44[3] = v47;
            *id v44 = v45;
            v44[1] = v46;
            __int128 v48 = *(_OWORD *)&__p[64];
            __int128 v49 = *(_OWORD *)&__p[80];
            __int128 v50 = v155;
            v44[6] = v154;
            v44[7] = v50;
            v44[4] = v48;
            v44[5] = v49;
            __int128 v51 = v156;
            __int128 v52 = *(_OWORD *)v157;
            __int128 v53 = *(_OWORD *)&v157[16];
            *((void *)v44 + 22) = v158;
            v44[9] = v52;
            v44[10] = v53;
            v44[8] = v51;
            v54 = (char *)v44 + 184;
          }

          v134 = v54;
        }

        ++location;
      }

      while (location != v125);
    }

    v109 = *(int **)a8;
    v110 = (int *)*((void *)a8 + 1);
    if (*(int **)a8 == v110)
    {
      int v115 = 0;
    }

    else
    {
      char v111 = 0;
      char v112 = 0;
      do
      {
        while (1)
        {
          while (1)
          {
            int v114 = *v109++;
            int v113 = v114;
            if (v114 != 1) {
              break;
            }
            char v111 = 1;
            if (v109 == v110)
            {
              if ((v112 & 1) != 0) {
                int v115 = 3;
              }
              else {
                int v115 = 1;
              }
              goto LABEL_140;
            }
          }

          if (v113 != 2) {
            break;
          }
          char v112 = 1;
          if (v109 == v110)
          {
            if ((v111 & 1) != 0) {
              int v115 = 3;
            }
            else {
              int v115 = 2;
            }
            goto LABEL_140;
          }
        }
      }

      while (v109 != v110);
      if ((v112 & 1) != 0) {
        int v115 = 3;
      }
      else {
        int v115 = 1;
      }
      if ((v112 & 1) != 0) {
        int v116 = 2;
      }
      else {
        int v116 = 0;
      }
      if ((v111 & 1) == 0) {
        int v115 = v116;
      }
    }

- (void)addRequesterWithOutstandingRequest:(id)a3
{
}

@end