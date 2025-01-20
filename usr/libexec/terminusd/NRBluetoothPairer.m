@interface NRBluetoothPairer
+ (BOOL)hasPairerForNRUUID:(id)a3;
+ (void)removePairerForNRUUID:(id)a3;
- (BOOL)isUnpairRequest;
- (NRBluetoothPairer)initWithNRUUID:(id)a3;
- (NRBluetoothPairerParameters)parameters;
- (NSUUID)nrUUID;
- (OS_dispatch_queue)completionQueue;
- (id)completionBlock;
- (id)description;
- (int64_t)pairingType;
- (unint64_t)identifier;
- (void)dealloc;
- (void)pairWithParameters:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIsUnpairRequest:(BOOL)a3;
- (void)setNrUUID:(id)a3;
- (void)setPairingType:(int64_t)a3;
- (void)setParameters:(id)a3;
- (void)unpairWithCompletionQueue:(id)a3 completionBlock:(id)a4;
@end

@implementation NRBluetoothPairer

- (NRBluetoothPairer)initWithNRUUID:(id)a3
{
  p_class_meths = a3;
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NRBluetoothPairer;
  v6 = -[NRBluetoothPairer init](&v18, "init");
  if (!v6)
  {
    id v11 = sub_100017EDC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v11, 16LL);

    if (IsLevelEnabled)
    {
      id v13 = sub_100017EDC();
      _NRLogWithArgs( v13,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRBluetoothPairer initWithNRUUID:]"",  45);
    }

    id v5 = (id)_os_log_pack_size(12LL);
    v7 = (NRBluetoothPairer *)((char *)&v17 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL));
    v14 = __error();
    uint64_t v15 = _os_log_pack_fill(v7, v5, *v14, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v15 = 136446210;
    *(void *)(v15 + 4) = "-[NRBluetoothPairer initWithNRUUID:]";
    id v16 = sub_100017EDC();
    _NRLogAbortWithPack(v16, v7);
LABEL_15:
    dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    goto LABEL_5;
  }

  v7 = v6;
  if (!_NRIsAppleInternal(v6))
  {
    v9 = 0LL;
    goto LABEL_11;
  }

  do
    unint64_t v8 = __ldxr(&qword_1001DBA58);
  while (__stxr(v8 + 1, &qword_1001DBA58));
  v7->_identifier = v8;
  objc_storeStrong((id *)&v7->_nrUUID, p_class_meths);
  p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
  if (qword_1001DC6B0 != -1) {
    goto LABEL_15;
  }
LABEL_5:
  if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
  {
    if (p_class_meths[214] != -1LL) {
      dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    }
    _NRLogWithArgs( qword_1001DC6A8,  1LL,  "%s%.30s:%-4d created: %@",  ",  "-[NRBluetoothPairer initWithNRUUID:]"",  52LL,  v7);
  }

  v9 = v7;
LABEL_11:

  return v9;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  unint64_t identifier = self->_identifier;
  unsigned int v5 = -[NRBluetoothPairer isUnpairRequest](self, "isUnpairRequest");
  v6 = "pairing";
  if (v5) {
    v6 = "unpairing";
  }
  return  -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"NRBTPairer[%llu %s %@]",  identifier,  v6,  self->_nrUUID);
}

- (void)dealloc
{
  if (qword_1001DC6B0 != -1) {
    dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC6A8, 1LL))
  {
    if (qword_1001DC6B0 != -1) {
      dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    }
    _NRLogWithArgs(qword_1001DC6A8, 1LL, "%s%.30s:%-4d dealloc: %@", ", "-[NRBluetoothPairer dealloc]"", 64LL, self);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRBluetoothPairer;
  -[NRBluetoothPairer dealloc](&v3, "dealloc");
}

- (void)pairWithParameters:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void (**)(void, void, void))v9;
  if (!v8)
  {
    id v13 = sub_100017EDC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v13, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_13;
    }
    id v15 = sub_100017EDC();
    _NRLogWithArgs(v15, 17LL, "%s called with null completionQueue");
LABEL_20:

    goto LABEL_13;
  }

  if (!v9)
  {
    id v16 = sub_100017EDC();
    int v17 = _NRLogIsLevelEnabled(v16, 17LL);

    if (!v17) {
      goto LABEL_13;
    }
    id v15 = sub_100017EDC();
    _NRLogWithArgs(v15, 17LL, "%s called with null completionBlock");
    goto LABEL_20;
  }

  if (!v20)
  {
    id v18 = sub_100017EDC();
    int v19 = _NRLogIsLevelEnabled(v18, 17LL);

    if (!v19) {
      goto LABEL_13;
    }
    id v15 = sub_100017EDC();
    _NRLogWithArgs(v15, 17LL, "%s called with null parameters");
    goto LABEL_20;
  }

  if ([v20 pairingType])
  {
    if (qword_1001DC6B0 != -1) {
      dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC6A8, 16LL))
    {
      if (qword_1001DC6B0 != -1) {
        dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
      }
      id v11 = (id)qword_1001DC6A8;
      _NRLogWithArgs( v11,  16,  "%s%.30s:%-4d pairing type %zd not yet supported",  ",  "-[NRBluetoothPairer pairWithParameters:completionQueue:completionBlock:]",  76,  (size_t)[v20 pairingType]);
    }

    v10[2](v10, 0LL, 0LL);
  }

  else
  {
    -[NRBluetoothPairer setPairingType:](self, "setPairingType:", [v20 pairingType]);
    -[NRBluetoothPairer setParameters:](self, "setParameters:", v20);
    -[NRBluetoothPairer setCompletionQueue:](self, "setCompletionQueue:", v8);
    -[NRBluetoothPairer setCompletionBlock:](self, "setCompletionBlock:", v10);
    id v12 = +[NRBluetoothPairingManager copySharedManager](&OBJC_CLASS___NRBluetoothPairingManager, "copySharedManager");
    [v12 enqueuePairer:self];
  }

- (void)unpairWithCompletionQueue:(id)a3 completionBlock:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (v16)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBluetoothPairer nrUUID](self, "nrUUID"));
      id v8 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, v7);

      if (v8) {
        id v9 = (void *)v8[5];
      }
      else {
        id v9 = 0LL;
      }
      id v10 = v9;

      if (v10)
      {
        -[NRBluetoothPairer setIsUnpairRequest:](self, "setIsUnpairRequest:", 1LL);
        -[NRBluetoothPairer setCompletionQueue:](self, "setCompletionQueue:", v16);
        -[NRBluetoothPairer setCompletionBlock:](self, "setCompletionBlock:", v6);
        id v11 = +[NRBluetoothPairingManager copySharedManager]( &OBJC_CLASS___NRBluetoothPairingManager,  "copySharedManager");
        [v11 enqueuePairer:self];
      }

      else
      {
        if (qword_1001DC6B0 != -1) {
          dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC6A8, 16LL))
        {
          if (qword_1001DC6B0 != -1) {
            dispatch_once(&qword_1001DC6B0, &stru_1001AE320);
          }
          _NRLogWithArgs( qword_1001DC6A8,  16LL,  "%s%.30s:%-4d invalid device to unpair %@",  ",  "-[NRBluetoothPairer unpairWithCompletionQueue:completionBlock:]"",  96LL,  v8);
        }

        (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
      }
    }

    else
    {
      id v14 = sub_100017EDC();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v14, 17LL);

      if (!IsLevelEnabled) {
        goto LABEL_15;
      }
      id v8 = sub_100017EDC();
      _NRLogWithArgs(v8, 17LL, "%s called with null completionBlock");
    }
  }

  else
  {
    id v12 = sub_100017EDC();
    int v13 = _NRLogIsLevelEnabled(v12, 17LL);

    if (!v13) {
      goto LABEL_15;
    }
    id v8 = sub_100017EDC();
    _NRLogWithArgs(v8, 17LL, "%s called with null completionQueue");
  }

LABEL_15:
}

- (NSUUID)nrUUID
{
  return self->_nrUUID;
}

- (void)setNrUUID:(id)a3
{
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (NRBluetoothPairerParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (BOOL)isUnpairRequest
{
  return self->_isUnpairRequest;
}

- (void)setIsUnpairRequest:(BOOL)a3
{
  self->_isUnpairRequest = a3;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)hasPairerForNRUUID:(id)a3
{
  id v3 = a3;
  id v4 = +[NRBluetoothPairingManager copySharedManager](&OBJC_CLASS___NRBluetoothPairingManager, "copySharedManager");
  unsigned __int8 v5 = [v4 hasPairerForNRUUID:v3];

  return v5;
}

+ (void)removePairerForNRUUID:(id)a3
{
  id v3 = a3;
  id v4 = +[NRBluetoothPairingManager copySharedManager](&OBJC_CLASS___NRBluetoothPairingManager, "copySharedManager");
  [v4 removePairerForNRUUID:v3];
}

@end