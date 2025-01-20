@interface SDAirDropReceiveManager
- (NSString)description;
- (SDAirDropAlertManagerProtocol)alertManager;
- (SDAirDropReceiveManager)init;
- (void)alertManager:(id)a3 acceptingTransferWithRecordID:(id)a4 withDestinationURL:(id)a5 shouldExtractMediaFromPhotosBundlesForRecordID:(BOOL)a6;
- (void)alertManager:(id)a3 cancelingTransferWithRecordID:(id)a4 withFailureReason:(unint64_t)a5;
- (void)listener:(id)a3 didReceiveError:(id)a4;
- (void)listener:(id)a3 didReceiveNewRequest:(id)a4;
- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)setAlertManager:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropReceiveManager

- (SDAirDropReceiveManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAirDropReceiveManager;
  v2 = -[SDAirDropReceiveManager init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    listener = v2->_listener;
    v2->_listener = 0LL;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    transferIdentifierToNetworkOperation = v3->_transferIdentifierToNetworkOperation;
    v3->_transferIdentifierToNetworkOperation = v5;
  }

  return v3;
}

- (void)start
{
  if (!self->_listener)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SDAirDropListener);
    listener = self->_listener;
    self->_listener = v3;

    -[SDAirDropListener setDelegate:](self->_listener, "setDelegate:", self);
    -[SDAirDropListener start](self->_listener, "start");
  }

- (void)stop
{
  listener = self->_listener;
  if (listener)
  {
    -[SDAirDropListener setDelegate:](listener, "setDelegate:", 0LL);
    -[SDAirDropListener stop](self->_listener, "stop");
    v4 = self->_listener;
    self->_listener = 0LL;
  }

- (void)listener:(id)a3 didReceiveNewRequest:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectKey]);
  uint64_t v7 = airdrop_log(v6);
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000883AC();
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_transferIdentifierToNetworkOperation,  "setObject:forKeyedSubscript:",  v5,  v6);
  [v5 setDelegate:self];
  [v5 resume];
}

- (void)listener:(id)a3 didReceiveError:(id)a4
{
  id v4 = a4;
  uint64_t v5 = airdrop_log(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100088428((uint64_t)v4, v6);
  }
}

- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectKey]);
  v11 = (void *)v10;
  if (a4 == 7)
  {
LABEL_2:
    uint64_t v12 = airdrop_log(v10);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10008849C((uint64_t)v11, v9, v13);
    }

    -[SDAirDropAlertManagerProtocol progressEventForRecordID:withResults:]( self->_alertManager,  "progressEventForRecordID:withResults:",  v11,  v9);
  }

  else
  {
    uint64_t v14 = airdrop_log(v10);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      else {
        v16 = *(&off_1005CCCA0 + a4 - 1);
      }
      int v25 = 138412546;
      v26 = v16;
      __int16 v27 = 2112;
      v28 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "SDAirDropReceiveManager: Received event %@ for transfer %@",  (uint8_t *)&v25,  0x16u);
    }

    switch(a4)
    {
      case 2LL:
        -[SDAirDropAlertManagerProtocol askEventForRecordID:withResults:]( self->_alertManager,  "askEventForRecordID:withResults:",  v11,  v9);
        break;
      case 4LL:
        -[SDAirDropAlertManagerProtocol cancelEventForRecordID:withResults:]( self->_alertManager,  "cancelEventForRecordID:withResults:",  v11,  v9);
        -[NSMutableDictionary removeObjectForKey:]( self->_transferIdentifierToNetworkOperation,  "removeObjectForKey:",  v11);
        [v8 invalidate];
        break;
      case 5LL:
      case 6LL:
      case 8LL:
      case 13LL:
        break;
      case 7LL:
        goto LABEL_2;
      case 9LL:
        -[SDAirDropAlertManagerProtocol finishedEventForRecordID:withResults:]( self->_alertManager,  "finishedEventForRecordID:withResults:",  v11,  v9);
        -[NSMutableDictionary removeObjectForKey:]( self->_transferIdentifierToNetworkOperation,  "removeObjectForKey:",  v11);
        break;
      case 10LL:
        v19 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSFOperationErrorKey]);
        id v20 = [v19 code];
        v21 = (void *)objc_claimAutoreleasedReturnValue([v19 domain]);
        if (![v21 isEqual:NSPOSIXErrorDomain] || v20 != (id)89)
        {
          id v22 = [v21 isEqual:NSOSStatusErrorDomain];
          if (!(_DWORD)v22 || v20 != (id)-128LL)
          {
            uint64_t v23 = airdrop_log(v22);
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              sub_100088650();
            }

            -[SDAirDropAlertManagerProtocol errorEventForRecordID:withResults:]( self->_alertManager,  "errorEventForRecordID:withResults:",  v11,  v9);
          }
        }

        -[NSMutableDictionary removeObjectForKey:]( self->_transferIdentifierToNetworkOperation,  "removeObjectForKey:",  v11);
        [v8 invalidate];

        break;
      default:
        uint64_t v17 = airdrop_log(v10);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1000885A0(a4, (uint64_t)v9, v18);
        }

        break;
    }
  }
}

- (void)alertManager:(id)a3 acceptingTransferWithRecordID:(id)a4 withDestinationURL:(id)a5 shouldExtractMediaFromPhotosBundlesForRecordID:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_transferIdentifierToNetworkOperation,  "objectForKeyedSubscript:",  a4));
  if (v10)
  {
    if (v9)
    {
      uint64_t v11 = kSFOperationDestinationURLKey;
      v16[0] = kSFOperationDestinationURLKey;
      v17[0] = v9;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);
      v16[1] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v17[1] = v13;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));

      [v10 setProperty:v14 forKey:v11];
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
    [v10 setProperty:v15 forKey:kSFOperationExtractPhotosBundleMediaKey];

    [v10 resume];
  }
}

- (void)alertManager:(id)a3 cancelingTransferWithRecordID:(id)a4 withFailureReason:(unint64_t)a5
{
  id v7 = a4;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_transferIdentifierToNetworkOperation,  "objectForKeyedSubscript:"));
  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_transferIdentifierToNetworkOperation, "removeObjectForKey:", v7);
    [v6 invalidate];
  }
}

- (NSString)description
{
  listener = self->_listener;
  if (!listener) {
    return (NSString *)0LL;
  }
  id v6 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropListener description](listener, "description"));
  NSAppendPrintF(&v6, "%@\n", v3);
  id v4 = v6;

  return (NSString *)v4;
}

- (SDAirDropAlertManagerProtocol)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end