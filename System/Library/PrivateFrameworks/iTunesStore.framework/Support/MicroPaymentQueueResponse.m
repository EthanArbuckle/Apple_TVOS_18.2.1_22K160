@interface MicroPaymentQueueResponse
- (BOOL)_ntsLoadFromPropertyList:(id)a3;
- (BOOL)loadFromPropertyList:(id)a3;
- (BOOL)shouldTriggerQueueCheck;
- (MicroPaymentQueueResponse)initWithRequestType:(int64_t)a3;
- (NSArray)payments;
- (NSArray)rangesToLoad;
- (NSData)appReceipt;
- (NSNumber)userIdentifier;
- (id)_copyAppReceiptFromDictionary:(id)a3;
- (id)_copyPaymentsFromDictionary:(id)a3;
- (id)_dsidFromDictionary:(id)a3;
- (int64_t)requestType;
- (int64_t)serverPaymentCount;
- (void)appendResponse:(id)a3;
- (void)dealloc;
- (void)setPayments:(id)a3;
- (void)setRangesToLoad:(id)a3;
- (void)setServerPaymentCount:(int64_t)a3;
- (void)setShouldTriggerQueueCheck:(BOOL)a3;
- (void)setUserIdentifier:(id)a3;
@end

@implementation MicroPaymentQueueResponse

- (MicroPaymentQueueResponse)initWithRequestType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MicroPaymentQueueResponse;
  result = -[MicroPaymentQueueResponse init](&v5, "init");
  if (result) {
    result->_requestType = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MicroPaymentQueueResponse;
  -[MicroPaymentQueueResponse dealloc](&v3, "dealloc");
}

- (void)appendResponse:(id)a3
{
  if (a3)
  {
    [*((id *)a3 + 2) lock];
    -[NSLock lock](self->_lock, "lock");
    if ([*((id *)a3 + 3) count])
    {
      payments = self->_payments;
      if (payments) {
        -[NSMutableArray addObjectsFromArray:](payments, "addObjectsFromArray:", *((void *)a3 + 3));
      }
      else {
        self->_payments = (NSMutableArray *)[*((id *)a3 + 3) mutableCopy];
      }
    }

    if ([*((id *)a3 + 4) count])
    {
      rangesToLoad = self->_rangesToLoad;
      if (rangesToLoad) {
        -[NSMutableArray addObjectsFromArray:](rangesToLoad, "addObjectsFromArray:", *((void *)a3 + 4));
      }
      else {
        self->_rangesToLoad = (NSMutableArray *)[*((id *)a3 + 4) mutableCopy];
      }
    }

    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      uint64_t v11 = objc_opt_class(self);
      NSUInteger v12 = -[NSData length](self->_appReceipt, "length");
      int v19 = 138412802;
      uint64_t v20 = v11;
      __int16 v21 = 2048;
      NSUInteger v22 = v12;
      __int16 v23 = 2048;
      id v24 = objc_msgSend(objc_msgSend(a3, "appReceipt"), "length");
      uint64_t v13 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  2LL,  "[%@] Deciding to append receipt: [Current: %ld bytes] [New: %ld bytes]",  &v19,  32);
      if (v13)
      {
        v14 = (void *)v13;
        v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        v18 = v15;
        SSFileLog(v7, @"%@");
      }
    }

    if (objc_msgSend(objc_msgSend(a3, "appReceipt", v18), "length"))
    {
      appReceipt = self->_appReceipt;
      if (appReceipt != [a3 appReceipt])
      {

        self->_appReceipt = (NSData *)[a3 appReceipt];
      }
    }

    self->_serverPaymentCount += *((void *)a3 + 6);
    BOOL v17 = self->_shouldTriggerQueueCheck || *((_BYTE *)a3 + 56) != 0;
    self->_shouldTriggerQueueCheck = v17;
    -[NSLock unlock](self->_lock, "unlock");
    [*((id *)a3 + 2) unlock];
  }

- (BOOL)loadFromPropertyList:(id)a3
{
  LOBYTE(a3) = -[MicroPaymentQueueResponse _ntsLoadFromPropertyList:](self, "_ntsLoadFromPropertyList:", a3);
  -[NSLock unlock](self->_lock, "unlock");
  return (char)a3;
}

- (NSData)appReceipt
{
  objc_super v3 = self->_appReceipt;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSArray)payments
{
  objc_super v3 = self->_payments;
  -[NSLock unlock](self->_lock, "unlock");
  return &v3->super;
}

- (NSArray)rangesToLoad
{
  objc_super v3 = self->_rangesToLoad;
  -[NSLock unlock](self->_lock, "unlock");
  return &v3->super;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (int64_t)serverPaymentCount
{
  int64_t serverPaymentCount = self->_serverPaymentCount;
  -[NSLock unlock](self->_lock, "unlock");
  return serverPaymentCount;
}

- (void)setServerPaymentCount:(int64_t)a3
{
  self->_int64_t serverPaymentCount = a3;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setPayments:(id)a3
{
  payments = self->_payments;
  if (payments != a3)
  {

    self->_payments = (NSMutableArray *)[a3 mutableCopy];
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setRangesToLoad:(id)a3
{
  rangesToLoad = self->_rangesToLoad;
  if (rangesToLoad != a3)
  {

    self->_rangesToLoad = (NSMutableArray *)[a3 mutableCopy];
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setShouldTriggerQueueCheck:(BOOL)a3
{
  self->_shouldTriggerQueueCheck = a3;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setUserIdentifier:(id)a3
{
  userIdentifier = self->_userIdentifier;
  if (userIdentifier != a3)
  {

    self->_userIdentifier = (NSNumber *)[a3 copy];
  }

  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)shouldTriggerQueueCheck
{
  BOOL shouldTriggerQueueCheck = self->_shouldTriggerQueueCheck;
  -[NSLock unlock](self->_lock, "unlock");
  return shouldTriggerQueueCheck;
}

- (NSNumber)userIdentifier
{
  objc_super v3 = self->_userIdentifier;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)_copyAppReceiptFromDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"receipt-data"];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0) {
    return 0LL;
  }
  id v5 = v3;
  return v3;
}

- (id)_copyPaymentsFromDictionary:(id)a3
{
  id v5 = -[MicroPaymentQueueResponse _dsidFromDictionary:](self, "_dsidFromDictionary:");
  if (!v5) {
    id v5 = -[MicroPaymentQueueResponse userIdentifier](self, "userIdentifier");
  }
  id v6 = [a3 objectForKey:@"app-list"];
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0) {
    return 0LL;
  }
  unsigned int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (+[MicroPayment responseIsValid:](&OBJC_CLASS___MicroPayment, "responseIsValid:", v13))
        {
          if (v5)
          {
            id v14 = [v13 mutableCopy];
            [v14 setObject:v5 forKey:@"dsid"];
            -[NSMutableArray addObject:](v8, "addObject:", v14);
          }

          else
          {
            -[NSMutableArray addObject:](v8, "addObject:", v13);
          }
        }
      }

      id v10 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  return v8;
}

- (id)_dsidFromDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"dsid"];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    {
      unint64_t v6 = strtoull((const char *)[v3 UTF8String], 0, 10);
      if (v6) {
        return +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v6);
      }
    }

    return 0LL;
  }

  return v3;
}

- (BOOL)_ntsLoadFromPropertyList:(id)a3
{
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    unint64_t v6 = -[MicroPaymentQueueResponse _copyPaymentsFromDictionary:](self, "_copyPaymentsFromDictionary:", a3);
    uint64_t v7 = -[MicroPaymentQueueResponse _copyAppReceiptFromDictionary:](self, "_copyAppReceiptFromDictionary:", a3);
    id v8 = [a3 objectForKey:kISTriggerDownloadQueueKey];
    if ((objc_opt_respondsToSelector(v8, "BOOLValue") & 1) != 0) {
      self->_BOOL shouldTriggerQueueCheck = [v8 BOOLValue];
    }
    id v9 = [a3 objectForKey:@"more"];
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {

      self->_rangesToLoad = (NSMutableArray *)ISCopyLoadMoreRangesFromArray(v9);
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    unint64_t v6 = 0LL;
  }

  self->_payments = v6;
  self->_appReceipt = v7;
  return self->_payments != 0LL;
}

@end