@interface _GEOResourceRequestHelper
+ (id)helperForHandler:(id)a3 queue:(id)a4 resources:(id)a5 wantsUnpacked:(BOOL)a6 signpost:(unint64_t)a7;
- (BOOL)finishedResource:(id)a3 withResult:(id)a4 error:(id)a5;
- (BOOL)wantsUnpacked:(id)a3;
- (id)description;
- (void)_callResultHandlerWith:(id)a3 paths:(id)a4 error:(id)a5;
- (void)failAllRemainingRequests;
@end

@implementation _GEOResourceRequestHelper

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = objc_retainBlock(self->_resultHandler);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_orderMap, "allKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p handler %p resources %@ remaning %@ results.count: %d",  v5,  self,  v6,  v7,  self->_remaining,  -[NSMutableArray count](self->_resultNames, "count")));

  return v8;
}

+ (id)helperForHandler:(id)a3 queue:(id)a4 resources:(id)a5 wantsUnpacked:(BOOL)a6 signpost:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = objc_alloc_init(&OBJC_CLASS____GEOResourceRequestHelper);
  if (v14)
  {
    id v15 = [v11 copy];
    id resultHandler = v14->_resultHandler;
    v14->_id resultHandler = v15;

    objc_storeStrong((id *)&v14->_resultQueue, a4);
    uint64_t v17 = voucher_copy();
    voucher = v14->_voucher;
    v14->_voucher = (OS_voucher *)v17;

    v14->_qos = qos_class_self();
    v14->_signpost = a7;
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v13));
    remaining = v14->_remaining;
    v14->_remaining = (NSMutableSet *)v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v13 count]));
    resultNames = v14->_resultNames;
    v14->_resultNames = (NSMutableArray *)v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v13 count]));
    resultPaths = v14->_resultPaths;
    v14->_resultPaths = (NSMutableArray *)v23;

    v14->_wantsUnpacked = a6;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v13 count]));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10002D11C;
    v33[3] = &unk_10005A578;
    v27 = v14;
    v34 = v27;
    id v35 = v26;
    id v36 = v25;
    id v28 = v25;
    id v29 = v26;
    [v13 enumerateObjectsUsingBlock:v33];
    v30 = (NSDictionary *)[v28 copy];
    orderMap = v27->_orderMap;
    v27->_orderMap = v30;
  }

  return v14;
}

- (BOOL)wantsUnpacked:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_orderMap, "objectForKeyedSubscript:", a3));
  if (v4) {
    BOOL wantsUnpacked = self->_wantsUnpacked;
  }
  else {
    BOOL wantsUnpacked = 0;
  }

  return wantsUnpacked;
}

- (BOOL)finishedResource:(id)a3 withResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[NSMutableSet removeObject:](self->_remaining, "removeObject:", v8);
  if (v9 && self->_resultNames)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_orderMap, "objectForKeyedSubscript:", v8));
    if (!v11)
    {
      BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v15) {
        sub_10003AED4(v15, v16, v17, v18, v19, v20, v21, v22);
      }
      goto LABEL_6;
    }

    id v12 = (void *)v11;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10002D344;
    v23[3] = &unk_10005A5A0;
    v23[4] = self;
    id v24 = v8;
    id v25 = v9;
    [v12 enumerateIndexesUsingBlock:v23];
  }

  if (!-[NSMutableSet count](self->_remaining, "count"))
  {
    -[_GEOResourceRequestHelper _callResultHandlerWith:paths:error:]( self,  "_callResultHandlerWith:paths:error:",  self->_resultNames,  self->_resultPaths,  v10);
    BOOL v13 = 1;
    goto LABEL_8;
  }

- (void)failAllRemainingRequests
{
  if (-[NSMutableSet count](self->_remaining, "count"))
  {
    id v3 = sub_10002D55C();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_remaining, "allObjects"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", @", "));
      int v13 = 138543362;
      v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Server error fetching resources: %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    id v7 = sub_10002D55C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "Assertion failed: [_remaining count] > 0",  (uint8_t *)&v13,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -19LL,  @"timed-out waiting for requested resources"));
    id v10 = sub_10002D55C();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = -[NSMutableSet count](self->_remaining, "count");
      int v13 = 67109120;
      LODWORD(v14) = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failing %d requests due to timeout",  (uint8_t *)&v13,  8u);
    }

    -[_GEOResourceRequestHelper _callResultHandlerWith:paths:error:]( self,  "_callResultHandlerWith:paths:error:",  self->_resultNames,  self->_resultPaths,  v9);
    -[NSMutableSet removeAllObjects](self->_remaining, "removeAllObjects");
  }

- (void)_callResultHandlerWith:(id)a3 paths:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_retainBlock(self->_resultHandler);
  id resultHandler = self->_resultHandler;
  self->_id resultHandler = 0LL;

  if (v11)
  {
    if (!self->_signpost)
    {
LABEL_14:
      resultQueue = (dispatch_queue_s *)self->_resultQueue;
      voucher = self->_voucher;
      uint64_t qos = self->_qos;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10002D7FC;
      v27[3] = &unk_10005A5C8;
      v31 = (os_log_s *)v11;
      id v28 = v10;
      id v29 = v8;
      id v30 = v9;
      v26 = (void *)dispatch_block_create_with_voucher_and_qos_class(32LL, voucher, qos, 0LL, v27);
      dispatch_async(resultQueue, v26);

      uint64_t v22 = v31;
      goto LABEL_15;
    }

    id v13 = sub_10002D55C();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = v14;
    unint64_t signpost = self->_signpost;
    if (v10)
    {
      if (signpost - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      uint64_t v17 = "Result=Error";
      uint64_t v18 = v15;
      os_signpost_id_t v19 = signpost;
      uint32_t v20 = 2;
    }

    else
    {
      if (signpost - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 67109120;
      unsigned int v33 = [v9 count];
      uint64_t v17 = "Result=Success Count=%d";
      uint64_t v18 = v15;
      os_signpost_id_t v19 = signpost;
      uint32_t v20 = 8;
    }

    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_END,  v19,  "FetchResources",  v17,  buf,  v20);
LABEL_13:

    goto LABEL_14;
  }

  id v21 = sub_10002D55C();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Tried to call resource handler twice", buf, 2u);
  }

- (void).cxx_destruct
{
}

@end