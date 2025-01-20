@interface MicroPayment
+ (BOOL)responseIsValid:(id)a3;
+ (id)paymentEntityFromContext:(id)a3;
- (BOOL)isEqualToResponse:(id)a3 compareAllFields:(BOOL)a4;
- (BOOL)isReady;
- (BOOL)isTransientFailed;
- (NSString)matchingIdentifier;
- (id)_temporaryIdentifier;
- (id)copyPaymentTransaction;
- (int64_t)_clientStateForServerState:(int64_t)a3;
- (int64_t)_serverStateForClientState:(int64_t)a3;
- (void)_updateDownloadsFromResponse:(id)a3;
- (void)awakeFromInsert;
- (void)dealloc;
- (void)mergeValuesFromResponse:(id)a3;
- (void)setFailedWithError:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setTransientFailed:(BOOL)a3;
- (void)setValuesWithPaymentTransaction:(id)a3;
@end

@implementation MicroPayment

- (void)dealloc
{
  self->_temporaryIdentifier = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MicroPayment;
  -[MicroPayment dealloc](&v3, "dealloc");
}

+ (id)paymentEntityFromContext:(id)a3
{
  return objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"),  "entitiesByName"),  "objectForKey:",  @"MicroPayment");
}

+ (BOOL)responseIsValid:(id)a3
{
  return [a3 objectForKey:@"offer-name"]
      || [a3 objectForKey:@"item-id"] != 0;
}

- (id)copyPaymentTransaction
{
  id v3 = objc_alloc_init((Class)sub_1001468A0());
  objc_msgSend(v3, "setApplicationUsername:", -[MicroPayment applicationUsername](self, "applicationUsername"));
  objc_msgSend(v3, "setPartnerIdentifier:", -[MicroPayment partnerIdentifier](self, "partnerIdentifier"));
  objc_msgSend( v3,  "setPartnerTransactionIdentifier:",  -[MicroPayment partnerTransactionIdentifier](self, "partnerTransactionIdentifier"));
  objc_msgSend(v3, "setProductIdentifier:", -[MicroPayment productIdentifier](self, "productIdentifier"));
  objc_msgSend(v3, "setQuantity:", objc_msgSend(-[MicroPayment quantity](self, "quantity"), "integerValue"));
  objc_msgSend(v3, "setRequestData:", -[MicroPayment requestData](self, "requestData"));
  objc_msgSend( v3,  "setSimulatesAskToBuyInSandbox:",  objc_msgSend(-[MicroPayment simulatesAskToBuyInSandbox](self, "simulatesAskToBuyInSandbox"), "BOOLValue"));
  if (-[MicroPayment discountIdentifier](self, "discountIdentifier"))
  {
    v4 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  -[MicroPayment discountNonceString](self, "discountNonceString"));
    id v5 = objc_msgSend( objc_alloc((Class)sub_1001468AC()),  "initWithIdentifier:keyIdentifier:nonce:signature:timestamp:",  -[MicroPayment discountIdentifier](self, "discountIdentifier"),  -[MicroPayment discountKeyIdentifier](self, "discountKeyIdentifier"),  v4,  -[MicroPayment discountSignature](self, "discountSignature"),  -[MicroPayment discountTimestamp](self, "discountTimestamp"));
    [v3 setPaymentDiscount:v5];
  }

  id v6 = -[MicroPayment actionParams](self, "actionParams");
  if (v6)
  {
    id v7 = +[NSURL copyDictionaryForQueryString:unescapedValues:]( &OBJC_CLASS___NSURL,  "copyDictionaryForQueryString:unescapedValues:",  v6,  1LL);
    [v3 setRequestParameters:v7];
  }

  id v8 = [objc_alloc((Class)sub_1001468C4()) initWithPayment:v3];
  objc_msgSend(v8, "_setError:", sub_10014687C((uint64_t)-[MicroPayment errorData](self, "errorData")));
  objc_msgSend(v8, "_setTransactionDate:", -[MicroPayment purchaseDate](self, "purchaseDate"));
  objc_msgSend(v8, "_setTransactionReceipt:", -[MicroPayment receiptData](self, "receiptData"));
  objc_msgSend( v8,  "_setTransactionState:",  -[MicroPayment _clientStateForServerState:]( self,  "_clientStateForServerState:",  objc_msgSend(-[MicroPayment state](self, "state"), "integerValue")));
  id v9 = -[MicroPayment transactionIdentifier](self, "transactionIdentifier");
  if (v9) {
    [v8 _setTransactionIdentifier:v9];
  }
  else {
    objc_msgSend(v8, "_setTemporaryIdentifier:", -[MicroPayment _temporaryIdentifier](self, "_temporaryIdentifier"));
  }
  id v10 = -[MicroPayment originalTransactionIdentifier](self, "originalTransactionIdentifier");
  if (v10)
  {
    id v11 = v10;
    id v12 = objc_alloc_init((Class)sub_1001468C4());
    objc_msgSend(v12, "_setTransactionDate:", -[MicroPayment originalPurchaseDate](self, "originalPurchaseDate"));
    [v12 _setTransactionIdentifier:v11];
    [v8 _setOriginalTransaction:v12];
  }

  id v13 = -[MicroPayment downloads](self, "downloads");
  if ([v13 count])
  {
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        v18 = 0LL;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v18) copySKDownload];
          if (v19)
          {
            v20 = v19;
            -[NSMutableArray addObject:](v14, "addObject:", v19);
          }

          v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v16);
    }

    [v8 _setDownloads:v14];
  }

  return v8;
}

- (BOOL)isEqualToResponse:(id)a3 compareAllFields:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[MicroPayment productIdentifier](self, "productIdentifier");
  id v8 = [a3 objectForKey:@"offer-name"];
  if (!v8) {
    id v8 = [a3 objectForKey:@"item-id"];
  }
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    id v8 = [v8 stringValue];
  }
  if (v7 == v8) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = [v7 isEqualToString:v8];
  }
  id v11 = -[MicroPayment quantity](self, "quantity");
  id v12 = [a3 objectForKey:@"quantity"];
  if (v10)
  {
    if (v11 == v12) {
      unsigned int v10 = 1;
    }
    else {
      unsigned int v10 = [v11 isEqual:v12];
    }
  }

  id v13 = -[MicroPayment transactionIdentifier](self, "transactionIdentifier");
  id v14 = v13;
  if (v4 || v13 && objc_msgSend(-[MicroPayment state](self, "state"), "integerValue") != (id)8)
  {
    id v15 = [a3 objectForKey:@"transaction-id"];
    if (v10)
    {
      if (v14 == v15) {
        unsigned int v10 = 1;
      }
      else {
        unsigned int v10 = [v14 isEqual:v15];
      }
    }
  }

  id v16 = -[MicroPayment userDSID](self, "userDSID");
  if (v16 || v4)
  {
    id v17 = [a3 objectForKey:@"dsid"];
    if (v10)
    {
      if (v16 != v17) {
        return [v16 isEqual:v17];
      }
      LOBYTE(v10) = 1;
    }
  }

  return v10;
}

- (void)mergeValuesFromResponse:(id)a3
{
  id v5 = [a3 objectForKey:@"offer-name"];
  if (!v5) {
    id v5 = [a3 objectForKey:@"item-id"];
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0) {
      goto LABEL_7;
    }
    id v5 = [v5 stringValue];
  }

  -[MicroPayment setProductIdentifier:](self, "setProductIdentifier:", v5);
LABEL_7:
  id v8 = [a3 objectForKey:@"quantity"];
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    -[MicroPayment setQuantity:](self, "setQuantity:", v8);
  }
  id v10 = [a3 objectForKey:@"receipt-data"];
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
    -[MicroPayment setReceiptData:](self, "setReceiptData:", v10);
  }
  id v12 = [a3 objectForKey:@"request-data"];
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0) {
    -[MicroPayment setRequestData:](self, "setRequestData:", v12);
  }
  id v14 = [a3 objectForKey:@"dsid"];
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
    -[MicroPayment setUserDSID:](self, "setUserDSID:", v14);
  }
  id v16 = [a3 objectForKey:@"applicationUsername"];
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
    -[MicroPayment setApplicationUsername:](self, "setApplicationUsername:", v16);
  }
  id v18 = [a3 objectForKey:@"purchase-date"];
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
    -[MicroPayment setPurchaseDate:](self, "setPurchaseDate:", v18);
  }
  id v20 = [a3 objectForKey:@"original-purchase-date"];
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDate);
  id v22 = [a3 objectForKey:@"transaction-id"];
  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0) {
    -[MicroPayment setTransactionIdentifier:](self, "setTransactionIdentifier:", v22);
  }
  id v24 = [a3 objectForKey:@"original-transaction-id"];
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
  -[MicroPayment _updateDownloadsFromResponse:](self, "_updateDownloadsFromResponse:", a3);
}

- (BOOL)isReady
{
  id v3 = objc_msgSend(-[MicroPayment state](self, "state"), "integerValue");
  return (unint64_t)v3 <= 3 && v3 != (id)2 && !self->_transientFailed;
}

- (NSString)matchingIdentifier
{
  result = (NSString *)-[MicroPayment transactionIdentifier](self, "transactionIdentifier");
  if (!result) {
    return (NSString *)-[MicroPayment _temporaryIdentifier](self, "_temporaryIdentifier");
  }
  return result;
}

- (void)setFailedWithError:(id)a3
{
  if (ISErrorIsEqual(a3, SSErrorDomain, 134LL))
  {
    id v5 = [a3 userInfo];
    -[MicroPayment setAskPermissionRequestIdentifier:]( self,  "setAskPermissionRequestIdentifier:",  [v5 objectForKey:SSErrorAskPermissionRequestIdentifier]);
    uint64_t v6 = &off_10036D620;
  }

  else
  {
    uint64_t v7 = sub_1000423B4(a3);
    -[MicroPayment setErrorData:](self, "setErrorData:", sub_100146878(v7));
    uint64_t v6 = &off_10036D638;
  }

  -[MicroPayment setState:](self, "setState:", v6);
  -[MicroPayment setTransactionIdentifier:]( self,  "setTransactionIdentifier:",  -[MicroPayment matchingIdentifier](self, "matchingIdentifier"));
}

- (void)awakeFromInsert
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MicroPayment;
  -[MicroPayment awakeFromInsert](&v3, "awakeFromInsert");
  -[MicroPayment setInsertDate:](self, "setInsertDate:", +[NSDate date](&OBJC_CLASS___NSDate, "date"));
}

- (void)setTransactionIdentifier:(id)a3
{
  id v4 = a3;
  if (a3)
  {

    self->_temporaryIdentifier = 0LL;
  }

  -[MicroPayment willChangeValueForKey:](self, "willChangeValueForKey:", @"transactionIdentifier");
  -[MicroPayment setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", a3, @"transactionIdentifier");
  -[MicroPayment didChangeValueForKey:](self, "didChangeValueForKey:", @"transactionIdentifier");
}

- (void)setValuesWithPaymentTransaction:(id)a3
{
  id v5 = [a3 payment];
  id v6 = [a3 error];
  if (v6)
  {
    -[MicroPayment setFailedWithError:](self, "setFailedWithError:", v6);
  }

  else
  {
    -[MicroPayment setErrorData:](self, "setErrorData:");
    -[MicroPayment setState:]( self,  "setState:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  -[MicroPayment _serverStateForClientState:]( self,  "_serverStateForClientState:",  [a3 transactionState])));
  }

  -[MicroPayment setApplicationUsername:](self, "setApplicationUsername:", [v5 applicationUsername]);
  -[MicroPayment setPartnerIdentifier:](self, "setPartnerIdentifier:", [v5 partnerIdentifier]);
  -[MicroPayment setPartnerTransactionIdentifier:]( self,  "setPartnerTransactionIdentifier:",  [v5 partnerTransactionIdentifier]);
  -[MicroPayment setProductIdentifier:](self, "setProductIdentifier:", [v5 productIdentifier]);
  -[MicroPayment setPurchaseDate:](self, "setPurchaseDate:", [a3 transactionDate]);
  -[MicroPayment setQuantity:]( self,  "setQuantity:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 quantity]));
  -[MicroPayment setReceiptData:](self, "setReceiptData:", [a3 transactionReceipt]);
  -[MicroPayment setRequestData:](self, "setRequestData:", [v5 requestData]);
  -[MicroPayment setTransactionIdentifier:]( self,  "setTransactionIdentifier:",  [a3 transactionIdentifier]);
  -[MicroPayment setSimulatesAskToBuyInSandbox:]( self,  "setSimulatesAskToBuyInSandbox:",  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 simulatesAskToBuyInSandbox]));
  -[MicroPayment setDiscountIdentifier:]( self,  "setDiscountIdentifier:",  objc_msgSend(objc_msgSend(v5, "paymentDiscount"), "identifier"));
  -[MicroPayment setDiscountKeyIdentifier:]( self,  "setDiscountKeyIdentifier:",  objc_msgSend(objc_msgSend(v5, "paymentDiscount"), "keyIdentifier"));
  -[MicroPayment setDiscountNonceString:]( self,  "setDiscountNonceString:",  objc_msgSend( objc_msgSend(objc_msgSend(objc_msgSend(v5, "paymentDiscount"), "nonce"), "UUIDString"),  "lowercaseString"));
  -[MicroPayment setDiscountSignature:]( self,  "setDiscountSignature:",  objc_msgSend(objc_msgSend(v5, "paymentDiscount"), "signature"));
  -[MicroPayment setDiscountTimestamp:]( self,  "setDiscountTimestamp:",  objc_msgSend(objc_msgSend(v5, "paymentDiscount"), "timestamp"));
  uint64_t v7 = (NSMutableDictionary *)objc_msgSend(objc_msgSend(v5, "requestParameters"), "mutableCopy");
  if ([v5 isStoreOriginated])
  {
    if (!v7) {
      uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", &__kCFBooleanTrue, @"isStoreOriginated");
  }

  if (v7)
  {
    -[MicroPayment setActionParams:]( self,  "setActionParams:",  +[NSURL queryStringForDictionary:escapedValues:]( &OBJC_CLASS___NSURL,  "queryStringForDictionary:escapedValues:",  v7,  1LL));
  }

  id v8 = [a3 originalTransaction];
  -[MicroPayment setOriginalPurchaseDate:](self, "setOriginalPurchaseDate:", [v8 transactionDate]);
  -[MicroPayment setOriginalTransactionIdentifier:]( self,  "setOriginalTransactionIdentifier:",  [v8 transactionIdentifier]);
}

- (int64_t)_clientStateForServerState:(int64_t)a3
{
  int64_t result = 0LL;
  switch(a3)
  {
    case 2LL:
      int64_t result = 1LL;
      break;
    case 5LL:
      int64_t result = 2LL;
      break;
    case 6LL:
      int64_t result = 3LL;
      break;
    case 7LL:
      int64_t result = 10000LL;
      break;
    case 8LL:
      if (objc_msgSend( -[MicroPayment supportsDeferredPayment](self, "supportsDeferredPayment", v3, v4),  "BOOLValue")) {
        int64_t result = 4LL;
      }
      else {
        int64_t result = 0LL;
      }
      break;
    default:
      return result;
  }

  return result;
}

- (int64_t)_serverStateForClientState:(int64_t)a3
{
  switch(a3)
  {
    case 1LL:
      int64_t result = 2LL;
      break;
    case 2LL:
      int64_t result = 5LL;
      break;
    case 3LL:
      int64_t result = 6LL;
      break;
    case 4LL:
      int64_t result = 8LL;
      break;
    default:
      if (a3 == 10000) {
        int64_t result = 7LL;
      }
      else {
        int64_t result = 1LL;
      }
      break;
  }

  return result;
}

- (id)_temporaryIdentifier
{
  if (!self->_temporaryIdentifier)
  {
    uint64_t v3 = CFUUIDCreate(0LL);
    if (v3)
    {
      uint64_t v4 = v3;
      self->_temporaryIdentifier = (NSString *)CFUUIDCreateString(0LL, v3);
      CFRelease(v4);
    }
  }

  return self->_temporaryIdentifier;
}

- (void)_updateDownloadsFromResponse:(id)a3
{
  id v4 = [a3 objectForKey:@"assetList"];
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  id obj = v4;
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v26 = -[MicroPayment managedObjectContext](self, "managedObjectContext");
    id v25 = +[MicroPaymentDownload downloadEntityFromContext:]( &OBJC_CLASS___MicroPaymentDownload,  "downloadEntityFromContext:");
    id v6 = -[MicroPayment downloads](self, "downloads");
    if ([v6 count] == (id)1 && (unint64_t)objc_msgSend(v4, "count") <= 1)
    {
      if ([v4 count] == (id)1)
      {
        id v7 = [v6 anyObject];
        objc_msgSend(v7, "setValuesWithAssetDictionary:", objc_msgSend(v4, "objectAtIndex:", 0));
        [v7 setPayment:self];
        -[NSMutableSet addObject:](v28, "addObject:", v7);
      }
    }

    else
    {
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      id v8 = [v4 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v35;
        uint64_t v11 = &ACSLocateCachingServer_ptr;
        uint64_t v27 = *(void *)v35;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v35 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
            uint64_t v14 = objc_opt_class(v11[360]);
            if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
            {
              id v15 = [v13 objectForKey:@"URL"];
              if (v15)
              {
                id v16 = v15;
                uint64_t v17 = self;
                __int128 v32 = 0u;
                __int128 v33 = 0u;
                __int128 v30 = 0u;
                __int128 v31 = 0u;
                id v18 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
                if (v18)
                {
                  id v19 = v18;
                  uint64_t v20 = *(void *)v31;
LABEL_16:
                  uint64_t v21 = 0LL;
                  while (1)
                  {
                    if (*(void *)v31 != v20) {
                      objc_enumerationMutation(v6);
                    }
                    id v22 = *(void **)(*((void *)&v30 + 1) + 8 * v21);
                    if (v19 == (id)++v21)
                    {
                      id v19 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
                      if (v19) {
                        goto LABEL_16;
                      }
                      goto LABEL_25;
                    }
                  }

                  uint64_t v23 = v22;
                  if (!v23) {
                    goto LABEL_25;
                  }
                  id v24 = v23;
                  -[MicroPaymentDownload setValuesWithAssetDictionary:](v23, "setValuesWithAssetDictionary:", v13);
                  self = v17;
                  -[MicroPaymentDownload setPayment:](v24, "setPayment:", v17);
                }

                else
                {
LABEL_25:
                  id v24 = -[MicroPaymentDownload initWithEntity:insertIntoManagedObjectContext:]( objc_alloc(&OBJC_CLASS___MicroPaymentDownload),  "initWithEntity:insertIntoManagedObjectContext:",  v25,  v26);
                  self = v17;
                  -[MicroPaymentDownload setPayment:](v24, "setPayment:", v17);
                  -[MicroPaymentDownload setValuesWithAssetDictionary:](v24, "setValuesWithAssetDictionary:", v13);
                }

                -[NSMutableSet addObject:](v28, "addObject:", v24);

                uint64_t v10 = v27;
                uint64_t v11 = &ACSLocateCachingServer_ptr;
              }
            }
          }

          id v9 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        }

        while (v9);
      }
    }

    -[MicroPayment setDownloads:](self, "setDownloads:", v28);
  }

  else
  {
    -[MicroPayment setDownloads:](self, "setDownloads:", 0LL);
  }

- (BOOL)isTransientFailed
{
  return self->_transientFailed;
}

- (void)setTransientFailed:(BOOL)a3
{
  self->_transientFailed = a3;
}

@end