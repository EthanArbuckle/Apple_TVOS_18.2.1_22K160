id sub_1000041DC()
{
  if (qword_10000CC60 != -1) {
    dispatch_once(&qword_10000CC60, &stru_1000082D0);
  }
  return (id)qword_10000CC58;
}

void sub_10000421C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MapKit", "Snapshot");
  v2 = (void *)qword_10000CC58;
  qword_10000CC58 = (uint64_t)v1;
}

void sub_1000043FC(_Unwind_Exception *a1)
{
}

void sub_10000442C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(*(void *)(a1 + 32) + 8) cancelSnapshotForConnection:WeakRetained];
    id WeakRetained = v3;
  }
}

void sub_100004478(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(*(void *)(a1 + 32) + 8) cancelSnapshotForConnection:WeakRetained];
    id WeakRetained = v3;
  }
}

uint64_t start()
{
  v0 = objc_alloc_init(&OBJC_CLASS___ServiceDelegate);
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v1 setDelegate:v0];
  [v1 resume];

  return 0LL;
}

uint64_t sub_100004528()
{
  v4 = 0LL;
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v0 = qword_10000CC68;
  uint64_t v8 = qword_10000CC68;
  if (!qword_10000CC68)
  {
    v9[0] = *(_OWORD *)off_100008318;
    v9[1] = *(_OWORD *)&off_100008328;
    uint64_t v1 = _sl_dlopen(v9, &v4);
    v6[3] = v1;
    qword_10000CC68 = v1;
    uint64_t v0 = v1;
  }

  _Block_object_dispose(&v5, 8);
  v2 = v4;
  if (!v0)
  {
    v2 = (void *)abort_report_np("%s", (const char *)v4);
    __break(1u);
    goto LABEL_7;
  }

  if (v4) {
LABEL_7:
  }
    free(v2);
  return v0;
}

void sub_100004600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void sub_1000049C8(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)]);
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  if (v2) {
    [*(id *)(a1 + 32) _cleanupForRequest:v2];
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v2 requestId]));
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v3]);
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:v3];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:v2];
  [*(id *)(*(void *)(a1 + 32) + 8) unlock];
  [v4 cancel];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(dispatch_queue_s **)(v5 + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004C08;
  block[3] = &unk_100008368;
  block[4] = v5;
  dispatch_async(v6, block);
  id v7 = sub_1000041DC();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v2 requestId];
    unsigned int v10 = [v2 processIdentifier];
    *(_DWORD *)buf = 134349312;
    id v17 = v9;
    __int16 v18 = 1024;
    unsigned int v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Canceled request %{public}llu for process %d",  buf,  0x12u);
  }

  id v11 = sub_1000041DC();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v2 options]);
  v14 = (char *)[v13 signpostId];

  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v14,  "RequestSnapshotWithOptions",  (const char *)&unk_100007C06,  buf,  2u);
  }
}

id sub_100004C08(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startNextSnapshotterIfPossible:0];
}

void sub_100004E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
}

LABEL_42:
        goto LABEL_43;
      }

      uint64_t v8 = -[SnapshotService pixelsForRequest:](self, "pixelsForRequest:", v7);
      if (-[NSMutableDictionary count](self->_requestIdToSnapshotter, "count")
        && !-[SnapshotService hasEnoughPixelsForRequest:](self, "hasEnoughPixelsForRequest:", v8))
      {
        v51 = sub_1000041DC();
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v52 = [v7 requestId];
          *(_DWORD *)buf = 134349056;
          *(void *)&uint8_t buf[4] = v52;
          v47 = "Not enough memory to take snapshot for request %{public}llu. Trying again as soon as the current snapsho"
                "t(s) are finished.";
          v48 = v46;
          v49 = OS_LOG_TYPE_ERROR;
          v50 = 12;
LABEL_41:
          _os_log_impl((void *)&_mh_execute_header, v48, v49, v47, buf, v50);
        }

        goto LABEL_42;
      }

      id v9 = sub_1000041DC();
      unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [v7 requestId];
        v12 = [v7 processIdentifier];
        *(_DWORD *)buf = 134349312;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Starting snapshot request %{public}llu for process %d",  buf,  0x12u);
      }

      -[NSMutableArray removeObject:](self->_pendingSnapshotRequests, "removeObject:", v7);
      self->_lastRequestPID = [v7 processIdentifier];
      self->_usedPixels += v8;
      proccessIdToPendingSerialSnapshot = self->_proccessIdToPendingSerialSnapshot;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 requestId]));
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v7 processIdentifier]));
      -[NSMutableDictionary setObject:forKey:](proccessIdToPendingSerialSnapshot, "setObject:forKey:", v14, v15);

      v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v7 completionHandler]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 connection]);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v7 options]);
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 _auditToken]);

      if (!v19) {
        goto LABEL_18;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue([v17 valueForEntitlement:@"com.apple.private.network.socket-delegate"]);
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue([v7 options]);
      v23 = (id)objc_claimAutoreleasedReturnValue([v22 _auditToken]);

      if (!v23) {
        goto LABEL_18;
      }
LABEL_22:
      v25 = objc_alloc(&OBJC_CLASS___VKMapSnapshotCreator);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v7 options]);
      v27 = [v25 initWithSnapshotOptions:v26 homeQueue:self->_homeQueue auditToken:v23];

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v7 options]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 _customFeatureAnnotations]);
        v30 = [v29 count] == 0;

        if (!v30)
        {
          v31 = objc_alloc_init(NSClassFromString(@"_MKCustomFeatureStore"));
          v32 = (void *)objc_claimAutoreleasedReturnValue([v7 options]);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 _customFeatureAnnotations]);
          [v31 addAnnotations:v33];

          [v27 addCustomFeatureDataSource:v31];
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 requestId]));
        -[NSMutableDictionary setObject:forKey:](self->_requestIdToSnapshotter, "setObject:forKey:", v27, v34);
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        *(void *)&buf[24] = sub_1000056F4;
        v63 = sub_100005704;
        v64 = v27;
        [v64 setClearFontCache:1];
        v35 = *(void **)(*(void *)&buf[8] + 40LL);
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472LL;
        v56[2] = sub_10000570C;
        v56[3] = &unk_1000083B8;
        v56[4] = self;
        v57 = v17;
        v36 = v34;
        v58 = v36;
        v59 = v7;
        v61 = buf;
        v60 = v16;
        [v35 renderSnapshot:v56];

        _Block_object_dispose(buf, 8);
      }

      else
      {
        v37 = sub_1000041DC();
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_FAULT, "Invalid MKMapSnapshotOptions", buf, 2u);
        }

        if (v16)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v7 options]);
          v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid MKMapSnapshotOptions: %@.",  v39));

          Log = GEOFindOrCreateLog(v54, "SnapshotService");
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v40;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }

          v65 = NSLocalizedFailureReasonErrorKey;
          v66 = v40;
          v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL));
          v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MKErrorDomain",  1LL,  v43));
          ((void (**)(void, void, void *))v16)[2](v16, 0LL, v44);
          if (v17) {
            -[NSMapTable removeObjectForKey:](self->_connectionToSnapshotRequest, "removeObjectForKey:", v17);
          }
        }

        -[SnapshotService _cleanupForRequest:](self, "_cleanupForRequest:", v7);
      }

      if (!-[NSMutableArray count](self->_pendingSnapshotRequests, "count")) {
        goto LABEL_43;
      }
    }

LABEL_18:
    if (v17) {
      [v17 auditToken];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 32LL));
    v23 = [[GEOApplicationAuditToken alloc] initWithAuditTokenData:v24];

    goto LABEL_22;
  }

LABEL_43:
  -[NSLock unlock](self->_lock, "unlock");
}

void sub_1000056D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_1000056F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005704(uint64_t a1)
{
}

void sub_10000570C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v6 = a3;
  id v7 = a2;
  [v5 lock];
  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObjectForKey:");
  }
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _cleanupForRequest:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 8) unlock];
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0LL;

  unsigned int v10 = (void *)os_transaction_create("com.apple.MapKit.SnapshotServiceCompletion");
  id v11 = sub_1000041DC();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v6)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v14 = [*(id *)(a1 + 56) requestId];
      unsigned int v15 = [*(id *)(a1 + 56) processIdentifier];
      *(_DWORD *)buf = 134349312;
      id v31 = v14;
      __int16 v32 = 1024;
      unsigned int v33 = v15;
      v16 = "Failed to render snapshot for request %{public}llu for process %d";
      id v17 = v13;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, 0x12u);
    }
  }

  else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v19 = [*(id *)(a1 + 56) requestId];
    unsigned int v20 = [*(id *)(a1 + 56) processIdentifier];
    *(_DWORD *)buf = 134349312;
    id v31 = v19;
    __int16 v32 = 1024;
    unsigned int v33 = v20;
    v16 = "Finished rendering snapshot for request %{public}llu for process %d";
    id v17 = v13;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    goto LABEL_8;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  id v21 = sub_1000041DC();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) options]);
  v24 = (char *)[v23 signpostId];

  if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v24,  "RequestSnapshotWithOptions",  (const char *)&unk_100007C06,  buf,  2u);
  }

  uint64_t v25 = *(void *)(a1 + 32);
  v26 = *(dispatch_queue_s **)(v25 + 48);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000059AC;
  v28[3] = &unk_100008390;
  v28[4] = v25;
  id v29 = v10;
  id v27 = v10;
  dispatch_async(v26, v28);
}

id sub_1000059AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startNextSnapshotterIfPossible:*(void *)(a1 + 40)];
}

void sub_100005AFC(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS____SnapshotRequest);
  -[_SnapshotRequest setRequestId:](v2, "setRequestId:", (*(void *)(*(void *)(a1 + 32) + 16LL))++);
  -[_SnapshotRequest setConnection:](v2, "setConnection:", *(void *)(a1 + 40));
  -[_SnapshotRequest setProcessIdentifier:]( v2,  "setProcessIdentifier:",  [*(id *)(a1 + 40) processIdentifier]);
  -[_SnapshotRequest setOptions:](v2, "setOptions:", *(void *)(a1 + 48));
  -[_SnapshotRequest setCompletionHandler:](v2, "setCompletionHandler:", *(void *)(a1 + 56));
  id v3 = sub_1000041DC();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134349312;
    unint64_t v9 = -[_SnapshotRequest requestId](v2, "requestId");
    __int16 v10 = 1024;
    unsigned int v11 = -[_SnapshotRequest processIdentifier](v2, "processIdentifier");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Enqueuing snapshot request: %{public}llu for process %d",  (uint8_t *)&v8,  0x12u);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) lock];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v2 forKey:*(void *)(a1 + 40)];
  int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 64LL);
  unsigned int v6 = -[_SnapshotRequest processIdentifier](v2, "processIdentifier");
  id v7 = *(void **)(*(void *)(a1 + 32) + 32LL);
  if (v5 == v6) {
    [v7 addObject:v2];
  }
  else {
    [v7 insertObject:v2 atIndex:0];
  }
  [*(id *)(*(void *)(a1 + 32) + 8) unlock];
  [*(id *)(a1 + 32) _startNextSnapshotterIfPossible:0];
}

void sub_100005E44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_100005EBC(uint64_t a1)
{
  int v5 = 0LL;
  v2 = (const char *)&OBJC_INSTANCE_METHODS_MKSnapshotServiceProtocol;
  if (!qword_10000CC90)
  {
    __int128 v6 = off_100008400;
    uint64_t v7 = 0LL;
    qword_10000CC90 = _sl_dlopen(&v6, &v5);
    id v3 = v5;
    if (!qword_10000CC90)
    {
      abort_report_np("%s", v5);
      goto LABEL_7;
    }

    if (v5) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    v2 = "UIImage";
    Class result = objc_getClass("UIImage");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    id v3 = (char *)abort_report_np("Unable to find class %s", v2);
LABEL_8:
    free(v3);
  }

  qword_10000CC88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

id objc_msgSend_imageForStyleAttributes_withStylesheetName_contentScale_sizeGroup_modifiers_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}