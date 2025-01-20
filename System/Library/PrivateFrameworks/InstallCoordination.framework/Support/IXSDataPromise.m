@interface IXSDataPromise
+ (BOOL)supportsSecureCoding;
- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)didAwake;
- (BOOL)hasBegun;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTracked;
- (IXDataPromiseSeed)clientSeed;
- (IXDataPromiseSeed)seed;
- (IXSDataPromise)initWithCoder:(id)a3;
- (IXSDataPromise)initWithSeed:(id)a3 error:(id *)a4;
- (IXSDataPromiseDelegate)delegate;
- (NSError)error;
- (NSSet)subPromiseUUIDs;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)delegateDeliveryQueue;
- (double)lastSavedPercentComplete;
- (double)percentComplete;
- (id)description;
- (unint64_t)bytesConsumedOnDisk;
- (unint64_t)creatorIdentifier;
- (unint64_t)errorSourceIdentifier;
- (unint64_t)hash;
- (unint64_t)totalBytesForProgress;
- (unint64_t)totalBytesNeededOnDisk;
- (void)_internalInitWithUniqueIdentifier:(id)a3;
- (void)_remote_cancelForReason:(id)a3 client:(unint64_t)a4 completion:(id)a5;
- (void)_remote_getErrorInfo:(id)a3;
- (void)_remote_getIsComplete:(id)a3;
- (void)_remote_getPercentComplete:(id)a3;
- (void)_remote_preflightWithCompletion:(id)a3;
- (void)_remote_resetWithCompletion:(id)a3;
- (void)_remote_setIsComplete:(id)a3;
- (void)_remote_setPercentComplete:(double)a3;
- (void)_removeSavedState;
- (void)_setPercentComplete:(double)a3 saveStateIfNeeded:(BOOL)a4;
- (void)decommission;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)saveState;
- (void)setComplete:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAwake:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setErrorSourceIdentifier:(unint64_t)a3;
- (void)setIsTracked:(BOOL)a3;
- (void)setLastSavedPercentComplete:(double)a3;
- (void)setPercentComplete:(double)a3;
- (void)setSeed:(id)a3;
- (void)supersede;
@end

@implementation IXSDataPromise

- (void)_internalInitWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.installcoordinationd.promise_%@", v4));
  v6 = (const char *)[v5 UTF8String];
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (OS_dispatch_queue *)dispatch_queue_create(v6, v8);
  accessQueue = self->_accessQueue;
  self->_accessQueue = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.installcoordinationd.promise_delegate_%@",  v4));
  id v17 = v11;
  v12 = (const char *)[v17 UTF8String];
  dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (OS_dispatch_queue *)dispatch_queue_create(v12, v14);
  delegateDeliveryQueue = self->_delegateDeliveryQueue;
  self->_delegateDeliveryQueue = v15;
}

- (IXSDataPromise)initWithSeed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IXSDataPromise;
  v6 = -[IXSDataPromise init](&v14, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = objc_opt_new(&OBJC_CLASS___NSUUID);
    [v5 setUniqueIdentifier:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
    -[IXSDataPromise _internalInitWithUniqueIdentifier:](v6, "_internalInitWithUniqueIdentifier:", v8);

    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v6, "accessQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100074E78;
    v11[3] = &unk_1000CCCB8;
    v12 = v6;
    id v13 = v5;
    dispatch_sync(v9, v11);
  }

  return v6;
}

- (IXDataPromiseSeed)clientSeed
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v5 = [v4 copy];

  return (IXDataPromiseSeed *)v5;
}

- (IXSDataPromise)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IXSDataPromise;
  id v5 = -[IXSDataPromise init](&v20, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(IXDataPromiseSeed) forKey:@"seed"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    seed = v5->_seed;
    v5->_seed = (IXDataPromiseSeed *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataPromiseSeed uniqueIdentifier](v5->_seed, "uniqueIdentifier"));
    -[IXSDataPromise _internalInitWithUniqueIdentifier:](v5, "_internalInitWithUniqueIdentifier:", v9);

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"error"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    error = v5->_error;
    v5->_error = (NSError *)v11;

    id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"errorSourceIdentifier"];
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v5->_errorSourceIdentifier = (unint64_t)[v14 unsignedLongLongValue];

    v5->_isTracked = [v4 decodeBoolForKey:@"isTracked"];
    [v4 decodeDoubleForKey:@"percentComplete"];
    v5->_percentComplete = v15;
    v5->_complete = [v4 decodeBoolForKey:@"complete"];
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v5, "accessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000750B0;
    block[3] = &unk_1000CCE58;
    v19 = v5;
    dispatch_sync(v16, block);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  [v4 encodeObject:v6 forKey:@"seed"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise error](self, "error"));
  [v4 encodeObject:v7 forKey:@"error"];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSDataPromise errorSourceIdentifier](self, "errorSourceIdentifier")));
  [v4 encodeObject:v8 forKey:@"errorSourceIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSDataPromise isTracked](self, "isTracked"), @"isTracked");
  -[IXSDataPromise percentComplete](self, "percentComplete");
  objc_msgSend(v4, "encodeDouble:forKey:", @"percentComplete");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXSDataPromise isComplete](self, "isComplete"), @"complete");

  -[IXSDataPromise percentComplete](self, "percentComplete");
  -[IXSDataPromise setLastSavedPercentComplete:](self, "setLastSavedPercentComplete:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXSDataPromise *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
    goto LABEL_7;
  }

  uint64_t v6 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](self, "uniqueIdentifier"));
    unsigned __int8 v9 = [v7 isEqual:v8];
  }

  else
  {
LABEL_5:
    unsigned __int8 v9 = 0;
  }

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](self, "uniqueIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)reset
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise error](self, "error"));
  if (v4)
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[IXSDataPromise reset]";
      uint64_t v7 = "%s: Ignoring reset request for promise that hit error";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    }
  }

  else
  {
    unsigned int v8 = -[IXSDataPromise isComplete](self, "isComplete");
    unsigned __int8 v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v10 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 136315138;
        id v17 = "-[IXSDataPromise reset]";
        uint64_t v7 = "%s: Ignoring reset request for complete promise";
        goto LABEL_7;
      }
    }

    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 136315394;
        id v17 = "-[IXSDataPromise reset]";
        __int16 v18 = 2112;
        v19 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Resetting data promise %@", buf, 0x16u);
      }

      -[IXSDataPromise setComplete:](self, "setComplete:", 0LL);
      -[IXSDataPromise setPercentComplete:](self, "setPercentComplete:", 0.0);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegate](self, "delegate"));
      uint64_t v6 = (os_log_s *)v11;
      if (v11 && (objc_opt_respondsToSelector(v11, "promiseDidReset:") & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegateDeliveryQueue](self, "delegateDeliveryQueue"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_100075530;
        v13[3] = &unk_1000CCCB8;
        uint64_t v6 = v6;
        objc_super v14 = v6;
        double v15 = self;
        sub_10005A8F0(v12, v13);
      }
    }
  }
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned __int8 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v9);

  if (!v8)
  {
    objc_super v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
    double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000860B4();
    }

    id v17 = @"Reason passed to -[IXSDataPromise cancelForReason:client:] was nil";
    uint64_t v18 = 177LL;
    goto LABEL_12;
  }

  if (!a4)
  {
    v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
    objc_super v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100086124();
    }

    id v17 = @"Client passed to -[IXSDataPromise cancelForReason:client:] was IXClientNone (0)";
    uint64_t v18 = 182LL;
LABEL_12:
    id v21 = sub_10003556C( (uint64_t)"-[IXSDataPromise cancelForReason:client:error:]",  v18,  @"IXErrorDomain",  0x35uLL,  0LL,  0LL,  v17,  v16,  v28);
    id v22 = (id)objc_claimAutoreleasedReturnValue(v21);
    if (a5)
    {
      id v22 = v22;
      BOOL v23 = 0;
      *a5 = v22;
    }

    else
    {
      BOOL v23 = 0;
    }

    goto LABEL_22;
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise error](self, "error"));

  uint64_t v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315650;
      v38 = "-[IXSDataPromise cancelForReason:client:error:]";
      __int16 v39 = 2112;
      v40 = self;
      __int16 v41 = 2112;
      unint64_t v42 = (unint64_t)v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : ignoring cancel request for reason %@ after promise was already canceled",  buf,  0x20u);
    }
  }

  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315906;
      v38 = "-[IXSDataPromise cancelForReason:client:error:]";
      __int16 v39 = 2112;
      v40 = self;
      __int16 v41 = 2048;
      unint64_t v42 = a4;
      __int16 v43 = 2112;
      id v44 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : canceled by client %lu for reason %@",  buf,  0x2Au);
    }

    -[IXSDataPromise setError:](self, "setError:", v8);
    -[IXSDataPromise setErrorSourceIdentifier:](self, "setErrorSourceIdentifier:", a4);
    self->_complete = 0;
    self->_percentComplete = 0.0;
    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegate](self, "delegate"));
    v12 = (os_log_s *)v24;
    if (v24 && (objc_opt_respondsToSelector(v24, "promise:didCancelForReason:client:") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegateDeliveryQueue](self, "delegateDeliveryQueue"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_1000758D0;
      v32[3] = &unk_1000CD1C8;
      v33 = v12;
      v34 = self;
      id v35 = v8;
      unint64_t v36 = a4;
      sub_10005A8F0(v25, v32);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegateDeliveryQueue](self, "delegateDeliveryQueue"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000758E0;
    v29[3] = &unk_1000CD358;
    v29[4] = self;
    id v30 = v8;
    unint64_t v31 = a4;
    sub_10005A8F0(v26, v29);

    -[IXSDataPromise decommission](self, "decommission");
  }

  id v22 = 0LL;
  BOOL v23 = 1;
LABEL_22:

  return v23;
}

- (NSError)error
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_error;
}

- (unint64_t)errorSourceIdentifier
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_errorSourceIdentifier;
}

- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue", a3, a4));
  dispatch_assert_queue_V2(v5);

  if (!-[IXSDataPromise didAwake](self, "didAwake")) {
    -[IXSDataPromise setDidAwake:](self, "setDidAwake:", 1LL);
  }
  return 1;
}

- (void)saveState
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[IXSDataPromise isTracked](self, "isTracked"))
  {
    id v4 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    -[NSKeyedArchiver encodeObject:forKey:](v4, "encodeObject:forKey:", self, NSKeyedArchiveRootObjectKey);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v4, "encodedData"));

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[IXSDataPromiseManager savePathForPromise:]( &OBJC_CLASS___IXSDataPromiseManager,  "savePathForPromise:",  self));
    id v14 = 0LL;
    unsigned __int8 v7 = [v5 writeToURL:v6 options:268435457 error:&v14];
    id v8 = v14;
    if ((v7 & 1) == 0)
    {
      unsigned __int8 v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
      BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = "-[IXSDataPromise saveState]";
        __int16 v17 = 2112;
        uint64_t v18 = self;
        __int16 v19 = 2112;
        objc_super v20 = v11;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to write promise %@ to disk at %@: %@",  buf,  0x2Au);
      }
    }
  }

  else
  {
    v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[IXSDataPromise saveState]";
      __int16 v17 = 2112;
      uint64_t v18 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Not saving %@ because it's not tracked",  buf,  0x16u);
    }
  }

- (void)_removeSavedState
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IXSDataPromiseManager savePathForPromise:]( &OBJC_CLASS___IXSDataPromiseManager,  "savePathForPromise:",  self));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v11 = 0LL;
  unsigned __int8 v6 = [v5 removeItemAtURL:v4 error:&v11];
  id v7 = v11;

  if ((v6 & 1) == 0)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
      *(_DWORD *)buf = 136315906;
      BOOL v13 = "-[IXSDataPromise _removeSavedState]";
      __int16 v14 = 2112;
      double v15 = self;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: Failed to remove saved promise %@ at %@ : %@",  buf,  0x2Au);
    }
  }
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  if (a3)
  {
    self->_isTracked = a3;
    -[IXSDataPromise saveState](self, "saveState");
  }

  else
  {
    -[IXSDataPromise _removeSavedState](self, "_removeSavedState");
    self->_isTracked = a3;
  }

- (NSString)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return (NSString *)v3;
}

- (unint64_t)creatorIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v3 = [v2 creatorIdentifier];

  return (unint64_t)v3;
}

- (NSUUID)uniqueIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uniqueIdentifier]);

  return (NSUUID *)v3;
}

- (unint64_t)totalBytesNeededOnDisk
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v5 = [v4 totalBytesNeededOnDisk];

  return (unint64_t)v5;
}

- (unint64_t)totalBytesForProgress
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  return -[IXSDataPromise totalBytesNeededOnDisk](self, "totalBytesNeededOnDisk");
}

- (unint64_t)bytesConsumedOnDisk
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  -[IXSDataPromise percentComplete](self, "percentComplete");
  return (unint64_t)(v4 * (double)-[IXSDataPromise totalBytesNeededOnDisk](self, "totalBytesNeededOnDisk"));
}

- (NSSet)subPromiseUUIDs
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v2);

  return +[NSSet set](&OBJC_CLASS___NSSet, "set");
}

- (BOOL)isComplete
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  if (self->_complete != v3)
  {
    if (!self->_complete || v3)
    {
      if (!v3) {
        return;
      }
      -[IXSDataPromise percentComplete](self, "percentComplete");
      if (v8 < 1.0) {
        -[IXSDataPromise _setPercentComplete:saveStateIfNeeded:]( self,  "_setPercentComplete:saveStateIfNeeded:",  0LL,  1.0);
      }
      self->_complete = v3;
      -[IXSDataPromise saveState](self, "saveState");
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegate](self, "delegate"));
      id v7 = (void *)v9;
      if (v9 && (objc_opt_respondsToSelector(v9, "promiseDidComplete:") & 1) != 0)
      {
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegateDeliveryQueue](self, "delegateDeliveryQueue"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_10007627C;
        v13[3] = &unk_1000CCCB8;
        id v14 = v7;
        double v15 = self;
        sub_10005A8F0(v10, v13);
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegateDeliveryQueue](self, "delegateDeliveryQueue"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100076288;
      v12[3] = &unk_1000CCE58;
      v12[4] = self;
      sub_10005A8F0(v11, v12);
    }

    else
    {
      unsigned __int8 v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v17 = "-[IXSDataPromise setComplete:]";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "%s: Ignoring attempt to set a complete promise to not complete",  buf,  0xCu);
      }
    }
  }

- (double)percentComplete
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_percentComplete;
}

- (void)_setPercentComplete:(double)a3 saveStateIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v7);

  if (-[IXSDataPromise isComplete](self, "isComplete"))
  {
    double v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "-[IXSDataPromise _setPercentComplete:saveStateIfNeeded:]";
      __int16 v27 = 2048;
      double v28 = a3;
      __int16 v29 = 2112;
      id v30 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Ignoring attempt to set percent complete to %f for %@ when it was already complete.",  buf,  0x20u);
    }
  }

  else
  {
    if (a3 < 0.0) {
      return;
    }
    if (a3 > 1.0) {
      a3 = 1.0;
    }
    BOOL v10 = self->_percentComplete == 0.0 && a3 > 0.0;
    self->_percentComplete = a3;
    -[IXSDataPromise lastSavedPercentComplete](self, "lastSavedPercentComplete");
    if (v11 == 0.0
      || (-[IXSDataPromise lastSavedPercentComplete](self, "lastSavedPercentComplete"), a3 - v12 >= 0.100000001))
    {
      BOOL v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[IXSDataPromise _setPercentComplete:saveStateIfNeeded:]";
        __int16 v27 = 2112;
        double v28 = *(double *)&self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Progress: %@", buf, 0x16u);
      }

      if (v4) {
        -[IXSDataPromise saveState](self, "saveState");
      }
    }

    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegate](self, "delegate"));
    uint64_t v9 = (os_log_s *)v15;
    if (v15)
    {
      if (v10 && (objc_opt_respondsToSelector(v15, "promiseDidBegin:") & 1) != 0)
      {
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegateDeliveryQueue](self, "delegateDeliveryQueue"));
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000765DC;
        v22[3] = &unk_1000CCCB8;
        BOOL v23 = v9;
        uint64_t v24 = self;
        sub_10005A8F0(v16, v22);
      }

      if ((objc_opt_respondsToSelector(v9, "promise:didUpdateProgress:") & 1) != 0)
      {
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegateDeliveryQueue](self, "delegateDeliveryQueue"));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_1000765E8;
        v18[3] = &unk_1000CD358;
        uint64_t v9 = v9;
        id v19 = v9;
        objc_super v20 = self;
        double v21 = a3;
        sub_10005A8F0(v17, v18);
      }
    }
  }
}

- (void)setPercentComplete:(double)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  -[IXSDataPromise _setPercentComplete:saveStateIfNeeded:](self, "_setPercentComplete:saveStateIfNeeded:", 1LL, a3);
}

- (BOOL)hasBegun
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  -[IXSDataPromise percentComplete](self, "percentComplete");
  return v4 > 0.0;
}

- (BOOL)didAwake
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_didAwake;
}

- (void)setDidAwake:(BOOL)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  self->_didAwake = a3;
}

- (IXSDataPromiseDelegate)delegate
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  return (IXSDataPromiseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v5);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    if (v4)
    {
      if (-[IXSDataPromise hasBegun](self, "hasBegun"))
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegateDeliveryQueue](self, "delegateDeliveryQueue"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_1000768E4;
        v20[3] = &unk_1000CCCB8;
        id v21 = v4;
        id v22 = self;
        sub_10005A8F0(v7, v20);
      }

      -[IXSDataPromise percentComplete](self, "percentComplete");
      if (v8 > 0.0)
      {
        -[IXSDataPromise percentComplete](self, "percentComplete");
        uint64_t v10 = v9;
        double v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegateDeliveryQueue](self, "delegateDeliveryQueue"));
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_1000768F0;
        v16[3] = &unk_1000CD358;
        id v17 = v4;
        __int16 v18 = self;
        uint64_t v19 = v10;
        sub_10005A8F0(v11, v16);
      }

      if (-[IXSDataPromise isComplete](self, "isComplete"))
      {
        double v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise delegateDeliveryQueue](self, "delegateDeliveryQueue"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_100076900;
        v13[3] = &unk_1000CCCB8;
        id v14 = v4;
        uint64_t v15 = self;
        sub_10005A8F0(v12, v13);
      }
    }
  }
}

- (void)decommission
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    double v8 = "-[IXSDataPromise decommission]";
    __int16 v9 = 2112;
    uint64_t v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Decommissioning %@", (uint8_t *)&v7, 0x16u);
  }

  -[IXSDataPromise setDelegate:](self, "setDelegate:", 0LL);
  -[IXSDataPromise setIsTracked:](self, "setIsTracked:", 0LL);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  [v6 decommissionPromise:self];
}

- (void)supersede
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  -[IXSDataPromise setDelegate:](self, "setDelegate:", 0LL);
  id v5 = sub_10003556C( (uint64_t)"-[IXSDataPromise supersede]",  561LL,  @"IXErrorDomain",  7uLL,  0LL,  0LL,  @"Data promise was superseded by a new promise being set.",  v4,  v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  -[IXSDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v7, 15LL, 0LL);
}

- (id)description
{
  BOOL v3 = (objc_class *)objc_opt_class(self);
  uint64_t v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise name](self, "name"));
  id v7 = IXStringForClientID(-[IXSDataPromise creatorIdentifier](self, "creatorIdentifier"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](self, "uniqueIdentifier"));
  double percentComplete = self->_percentComplete;
  BOOL complete = self->_complete;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise seed](self, "seed"));
  id v13 = [v12 totalBytesNeededOnDisk];
  uint64_t v14 = 89LL;
  if (!complete) {
    uint64_t v14 = 78LL;
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@(%p) Name:%@ Creator:%@ UUID:%@ PercentComplete:%f IsComplete:%c DiskUsageBytes:%llu>",  v5,  self,  v6,  v8,  v9,  *(void *)&percentComplete,  v14,  v13));

  return v15;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setError:(id)a3
{
}

- (void)setErrorSourceIdentifier:(unint64_t)a3
{
  self->_errorSourceIdentifier = a3;
}

- (OS_dispatch_queue)delegateDeliveryQueue
{
  return self->_delegateDeliveryQueue;
}

- (IXDataPromiseSeed)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
}

- (double)lastSavedPercentComplete
{
  return self->_lastSavedPercentComplete;
}

- (void)setLastSavedPercentComplete:(double)a3
{
  self->_lastSavedPercentComplete = a3;
}

- (void).cxx_destruct
{
}

- (void)_remote_getPercentComplete:(id)a3
{
  uint64_t v4 = (void (**)(id, void, double))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  __int16 v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0LL;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100076D34;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, 0LL, v9[3]);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setPercentComplete:(double)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100076DF8;
  v7[3] = &unk_1000CCBD8;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  dispatch_sync(v6, v7);
}

- (void)_remote_getIsComplete:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0LL;
  __int16 v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100076EF4;
  v7[3] = &unk_1000CCEF8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0LL);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setIsComplete:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](self, "uniqueIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  BOOL v8 = sub_100031BB0(v7, 9LL);

  if (v8) {
    exit(1);
  }
  uint64_t v11 = 0LL;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = sub_100077070;
  uint64_t v15 = sub_100077080;
  id v16 = 0LL;
  __int16 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100077088;
  v10[3] = &unk_1000CCEF8;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v9, v10);

  v4[2](v4, v12[5]);
  _Block_object_dispose(&v11, 8);
}

- (void)_remote_cancelForReason:(id)a3 client:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  __int16 v9 = (void (**)(id, void))a5;
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v10);

  uint64_t v17 = 0LL;
  __int16 v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  objc_super v20 = sub_100077070;
  id v21 = sub_100077080;
  id v22 = 0LL;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100077228;
  v13[3] = &unk_1000CF0B8;
  void v13[4] = self;
  id v12 = v8;
  uint64_t v15 = &v17;
  unint64_t v16 = a4;
  id v14 = v12;
  dispatch_sync(v11, v13);

  v9[2](v9, v18[5]);
  _Block_object_dispose(&v17, 8);
}

- (void)_remote_resetWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v22 = 0LL;
  v23[0] = &v22;
  v23[1] = 0x3032000000LL;
  v23[2] = sub_100077070;
  v23[3] = sub_100077080;
  id v24 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100077514;
  block[3] = &unk_1000CD330;
  void block[4] = self;
  block[5] = &v22;
  block[6] = &v18;
  dispatch_sync(v6, block);

  if (*(void *)(v23[0] + 40LL))
  {
    id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100086204((uint64_t)v23, v8);
    }

    id v10 = sub_10003556C( (uint64_t)"-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_resetWithCompletion:]",  654LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Attempt made to reset a canceled promise (promise canceled with error %@)",  v9,  *(void *)(v23[0] + 40LL));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v4[2](v4, v11);
  }

  else
  {
    if (!*((_BYTE *)v19 + 24))
    {
      v4[2](v4, 0LL);
      goto LABEL_10;
    }

    id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100086194();
    }

    id v15 = sub_10003556C( (uint64_t)"-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_resetWithCompletion:]",  657LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Attempt made to reset a completed promise",  v14,  v16);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v4[2](v4, v11);
  }

LABEL_10:
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

- (void)_remote_getErrorInfo:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_100077070;
  uint64_t v16 = sub_100077080;
  id v17 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0LL;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000776E0;
  block[3] = &unk_1000CD330;
  void block[4] = self;
  block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(v6, block);

  v4[2](v4, v9[3], v13[5]);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

- (void)_remote_preflightWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v59 = 0LL;
  v60 = &v59;
  uint64_t v61 = 0x2020000000LL;
  uint64_t v62 = 0LL;
  uint64_t v55 = 0LL;
  v56 = &v55;
  uint64_t v57 = 0x2020000000LL;
  uint64_t v58 = 0LL;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100077F88;
  block[3] = &unk_1000CD330;
  void block[4] = self;
  block[5] = &v59;
  block[6] = &v55;
  dispatch_sync(v6, block);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userVolumeURL]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);

  bzero(&v81, 0x878uLL);
  id v10 = v9;
  if (statfs((const char *)[v10 fileSystemRepresentation], &v81))
  {
    uint64_t v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = __error();
      uint64_t v14 = strerror(*v13);
      *(_DWORD *)buf = 136315650;
      v66 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
      __int16 v67 = 2112;
      v68 = self;
      __int16 v69 = 2080;
      v70 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to get available space on device for promise %@: %s",  buf,  0x20u);
    }

    goto LABEL_4;
  }

  uint64_t v15 = v81.f_bavail * v81.f_bsize;
  if (v15 >> 23 <= 0x18) {
    uint64_t v16 = 0LL;
  }
  else {
    uint64_t v16 = v15 - 209715200;
  }
  unint64_t v17 = v60[3];
  unint64_t v18 = v56[3];
  uint64_t v19 = (char *)(v17 - v18);
  if (v17 < v18)
  {
    uint64_t v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v21 = (char *)v60[3];
      uint64_t v22 = (char *)v56[3];
      *(_DWORD *)buf = 136315906;
      v66 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
      __int16 v67 = 2112;
      v68 = self;
      __int16 v69 = 2048;
      v70 = v21;
      __int16 v71 = 2048;
      v72 = v22;
      BOOL v23 = "%s: Promise %@: bytes consumed (%llu) greater than total bytes needed (%llu): space needed cannot be determined.";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v23, buf, 0x2Au);
      goto LABEL_4;
    }

    goto LABEL_4;
  }

  if ((unint64_t)v19 <= v16)
  {
    v34 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v66 = "-[IXSDataPromise(IXSDataPromiseIPCMethods) _remote_preflightWithCompletion:]";
      __int16 v67 = 2112;
      v68 = self;
      __int16 v69 = 2048;
      v70 = v19;
      __int16 v71 = 2048;
      v72 = (char *)v16;
      BOOL v23 = "%s: Promise %@: %llu bytes needed, %llu bytes available.";
      goto LABEL_20;
    }

@end