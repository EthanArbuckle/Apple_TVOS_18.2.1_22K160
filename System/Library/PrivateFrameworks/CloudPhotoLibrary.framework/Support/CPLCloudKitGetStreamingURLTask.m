@interface CPLCloudKitGetStreamingURLTask
- ($9AC8AD2FEA0B9A5F24CD76D172BBF93B)timeRange;
- (BOOL)shouldRequestEncryptedStream;
- (CPLCloudKitGetStreamingURLTask)initWithController:(id)a3 resource:(id)a4 hints:(id)a5 timeRange:(id *)a6 target:(id)a7 transportScopeMapping:(id)a8 cache:(id)a9 completionHandler:(id)a10;
- (CPLCloudKitSimpleCache)cache;
- (CPLResource)resource;
- (NSDictionary)hints;
- (id)_streamOperationForKey:(id)a3 operationType:(int64_t)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (void)_fetchStreamingURL;
- (void)runOperations;
@end

@implementation CPLCloudKitGetStreamingURLTask

- (CPLCloudKitGetStreamingURLTask)initWithController:(id)a3 resource:(id)a4 hints:(id)a5 timeRange:(id *)a6 target:(id)a7 transportScopeMapping:(id)a8 cache:(id)a9 completionHandler:(id)a10
{
  id v34 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___CPLCloudKitGetStreamingURLTask;
  v22 = -[CPLCloudKitTransportTask initWithController:](&v35, "initWithController:", a3);
  if (v22)
  {
    id v23 = [v21 copy];
    v24 = (void *)*((void *)v22 + 38);
    *((void *)v22 + 38) = v23;

    objc_storeStrong((id *)v22 + 37, a9);
    objc_storeStrong((id *)v22 + 35, a4);
    id v25 = [v17 copy];
    v26 = (void *)*((void *)v22 + 36);
    *((void *)v22 + 36) = v25;

    __int128 v28 = *(_OWORD *)&a6->var0.var3;
    __int128 v27 = *(_OWORD *)&a6->var1.var1;
    *(_OWORD *)(v22 + 312) = *(_OWORD *)&a6->var0.var0;
    *(_OWORD *)(v22 + 328) = v28;
    *(_OWORD *)(v22 + 344) = v27;
    v29 = objc_alloc_init(&OBJC_CLASS___CPLRecordTargetMapping);
    v30 = (void *)*((void *)v22 + 34);
    *((void *)v22 + 34) = v29;

    v31 = (void *)*((void *)v22 + 34);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v18 scopedIdentifier]);
    [v31 setTarget:v18 forRecordWithScopedIdentifier:v32];

    [v22 setTransportScopeMapping:v19];
  }

  return (CPLCloudKitGetStreamingURLTask *)v22;
}

- (id)_streamOperationForKey:(id)a3 operationType:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (-[CPLCloudKitGetStreamingURLTask shouldRequestEncryptedStream](self, "shouldRequestEncryptedStream"))
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_10009C160();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 filename]);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Requesting encrypted video stream for %@/%@",  buf,  0x16u);
      }
    }

    uint64_t v14 = 2LL;
    goto LABEL_10;
  }

  if (!CPLCloudKitUseGateKeeperForOperationType(a4))
  {
    uint64_t v14 = 1LL;
LABEL_10:
    id v23 = objc_alloc(&OBJC_CLASS___CKPublishAssetsOperation);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
    v43 = v24;
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
    id v22 = [v23 initWithRecordIDs:v25];

    [v22 setURLOptions:v14];
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    buf[24] = 0;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10009C1A0;
    v35[3] = &unk_1002422A8;
    v38 = buf;
    id v26 = v9;
    id v37 = v26;
    id v27 = v8;
    id v36 = v27;
    [v22 setAssetPublishedBlock:v35];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10009C428;
    v32[3] = &unk_1002422D0;
    id v34 = buf;
    id v33 = v26;
    [v22 setPublishAssetCompletionBlock:v32];
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 resourceKey]);
    v41 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v27 filename]);
    v42 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));

    [v22 setFileNamesByAssetFieldNames:v30];
    _Block_object_dispose(buf, 8);
    goto LABEL_11;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 resourceKey]);
  uint64_t v17 = CPLCloudKitGateKeeperDefaultDownloadType;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 filename]);
  hints = self->_hints;
  p_timeRange = &self->_timeRange;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10009C0D8;
  v39[3] = &unk_100242280;
  id v40 = v9;
  __int128 v21 = *(_OWORD *)&p_timeRange->start.epoch;
  *(_OWORD *)buf = *(_OWORD *)&p_timeRange->start.value;
  *(_OWORD *)&buf[16] = v21;
  __int128 v45 = *(_OWORD *)&p_timeRange->duration.timescale;
  id v22 = (id)objc_claimAutoreleasedReturnValue( +[CPLCKResourceDownloadOperation streamOperationForRecordID:key:downloadType:filename:timeRange:mediaRequestHints:completionBlock:]( &OBJC_CLASS___CPLCKResourceDownloadOperation,  "streamOperationForRecordID:key:downloadType:filename:timeRange:mediaRequestHints:completionBlock:",  v15,  v16,  v17,  v18,  buf,  hints,  v39));

LABEL_11:
  return v22;
}

- (BOOL)shouldRequestEncryptedStream
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_hints,  "objectForKeyedSubscript:",  CPLLibraryManagerStreamingHintShouldRequestEncryptedStream));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)runOperations
{
  targetMapping = self->_targetMapping;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10009C57C;
  v3[3] = &unk_10023E430;
  v3[4] = self;
  -[CPLCloudKitTransportTask fetchUnknownTargetsInMapping:completionHandler:]( self,  "fetchUnknownTargetsInMapping:completionHandler:",  targetMapping,  v3);
}

- (void)_fetchStreamingURL
{
  id v62 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v62);
  id v4 = v62;
  if ((v3 & 1) != 0)
  {
    if (+[CPLCloudKitFakeDynamicDerivatives isFakeDerivative:]( &OBJC_CLASS___CPLCloudKitFakeDynamicDerivatives,  "isFakeDerivative:",  self->_resource))
    {
      id completionHandler = self->_completionHandler;
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  255LL,  @"Streaming fake derivatives is not supported"));
      (*((void (**)(id, void, void, void, void, void *))completionHandler + 2))( completionHandler,  0LL,  0LL,  0LL,  0LL,  v6);
    }

    else
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[CPLResource itemScopedIdentifier](self->_resource, "itemScopedIdentifier"));
      if (v57)
      {
        id v7 = sub_1000896D4( (uint64_t)&OBJC_CLASS___CPLCloudKitResourceKeys,  (uint64_t)-[CPLResource resourceType](self->_resource, "resourceType"));
        id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        uint64_t v9 = sub_100089C34((uint64_t)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

        if (v10)
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v57));
          v11 = (void *)objc_claimAutoreleasedReturnValue([v55 resourceScopedIdentifier]);
          v12 = (void *)objc_claimAutoreleasedReturnValue([v11 scopeIdentifier]);
          v13 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v12));

          if (v13)
          {
            v53 = v11;
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
            v54 = v13;
            uint64_t v50 = objc_claimAutoreleasedReturnValue([v13 recordIDWithRecordName:v14]);

            -[CPLCloudKitTransportTask setAllowsCellular:]( self,  "setAllowsCellular:",  objc_msgSend( (id)objc_opt_class(self),  "allowsCellularForDownloadOperationOfResource:isForeground:isHighPriority:",  self->_resource,  -[CPLCloudKitTransportTask foreground](self, "foreground"),  1));
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLResource identity](self->_resource, "identity"));
            v16 = (void *)objc_claimAutoreleasedReturnValue([v15 fileURL]);
            uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);

            if (!v17)
            {
              id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLResource itemScopedIdentifier](self->_resource, "itemScopedIdentifier"));
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 safeFilename]);
              uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  v19,  v10));
            }

            id v20 = objc_alloc(&OBJC_CLASS___CPLCloudKitStreamingKey);
            v52 = v15;
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 fingerPrint]);
            id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask operationGroup](self, "operationGroup"));
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);
            unsigned __int8 v24 = -[CPLCloudKitGetStreamingURLTask shouldRequestEncryptedStream](self, "shouldRequestEncryptedStream");
            __int128 v25 = *(_OWORD *)&self->_timeRange.start.epoch;
            *(_OWORD *)buf = *(_OWORD *)&self->_timeRange.start.value;
            __int128 v64 = v25;
            __int128 v65 = *(_OWORD *)&self->_timeRange.duration.timescale;
            LOBYTE(v49) = v24;
            id v26 = (void *)v50;
            v51 = (void *)v17;
            id v27 = -[CPLCloudKitStreamingKey initWithRecordID:resourceKey:fingerPrint:filename:groupName:timeRange:useEncryptedStream:]( v20,  "initWithRecordID:resourceKey:fingerPrint:filename:groupName:timeRange:useEncryptedStream:",  v50,  v10,  v21,  v17,  v23,  buf,  v49);

            cache = self->_cache;
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            id v61 = 0LL;
            v30 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitSimpleCache objectForKey:date:expirationDate:]( cache,  "objectForKey:date:expirationDate:",  v27,  v29,  &v61));
            id v31 = v61;

            if (v30)
            {
              id v32 = self->_completionHandler;
              id v33 = (void *)objc_claimAutoreleasedReturnValue([v30 streamingURL]);
              id v34 = (void *)objc_claimAutoreleasedReturnValue([v30 mediaItemMakerData]);
              (*((void (**)(id, void *, void *, id, void, void))v32 + 2))(v32, v33, v34, v31, 0LL, 0LL);

              id v26 = (void *)v50;
              id v35 = self->_completionHandler;
              self->_id completionHandler = 0LL;
            }

            else
            {
              id v60 = 0LL;
              unsigned __int8 v45 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:]( self,  "shouldRunOperationsWithError:",  &v60);
              id v35 = v60;
              if ((v45 & 1) != 0)
              {
                uint64_t v46 = CPLCloudKitOperationTypeForScope(v54);
                v58[0] = _NSConcreteStackBlock;
                v58[1] = 3221225472LL;
                v58[2] = sub_10009CCB4;
                v58[3] = &unk_100242320;
                v58[4] = self;
                v59 = v27;
                v47 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitGetStreamingURLTask _streamOperationForKey:operationType:completionHandler:]( self,  "_streamOperationForKey:operationType:completionHandler:",  v59,  v46,  v58));
                -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v47,  v46,  0LL);

                id v26 = (void *)v50;
                id v48 = v59;
              }

              else
              {
                (*((void (**)(void))self->_completionHandler + 2))();
                id v48 = self->_completionHandler;
                self->_id completionHandler = 0LL;
              }
            }

            v11 = v53;
            v13 = v54;
          }

          else
          {
            id v44 = self->_completionHandler;
            id v26 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone"));
            (*((void (**)(id, void, void, void, void, void *))v44 + 2))(v44, 0LL, 0LL, 0LL, 0LL, v26);
          }
        }

        else
        {
          if (!_CPLSilentLogging)
          {
            id v40 = sub_10009C160();
            v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              resource = self->_resource;
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = resource;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Tried to publish an unsupported resource type in memory: %@",  buf,  0xCu);
            }
          }

          id v43 = self->_completionHandler;
          v56 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"resourceType"));
          (*((void (**)(id, void, void, void, void))v43 + 2))(v43, 0LL, 0LL, 0LL, 0LL);
        }
      }

      else
      {
        if (!_CPLSilentLogging)
        {
          id v36 = sub_10009C160();
          id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = self->_resource;
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v38;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Tried to get a streaming URL for a resource with no item identifier: %@",  buf,  0xCu);
          }
        }

        id v39 = self->_completionHandler;
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"itemScopedIdentifier"));
        (*((void (**)(id, void, void, void, void, void *))v39 + 2))(v39, 0LL, 0LL, 0LL, 0LL, v10);
      }
    }
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (CPLResource)resource
{
  return self->_resource;
}

- (NSDictionary)hints
{
  return self->_hints;
}

- ($9AC8AD2FEA0B9A5F24CD76D172BBF93B)timeRange
{
  __int128 v3 = *(_OWORD *)&self[6].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[6].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[7].var0.var1;
  return self;
}

- (CPLCloudKitSimpleCache)cache
{
  return self->_cache;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
}

@end