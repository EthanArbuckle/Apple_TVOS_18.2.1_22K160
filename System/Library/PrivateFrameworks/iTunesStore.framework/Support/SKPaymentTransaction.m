@interface SKPaymentTransaction
- (BOOL)canMergeWithTransaction:(id)a3;
- (BOOL)mergeWithServerTransaction:(id)a3;
- (BOOL)mergeWithTransaction:(id)a3;
- (NSArray)downloads;
- (NSData)transactionReceipt;
- (NSDate)transactionDate;
- (NSError)error;
- (NSString)_transactionIdentifier;
- (NSString)matchingIdentifier;
- (NSString)transactionIdentifier;
- (SKPayment)payment;
- (SKPaymentTransaction)init;
- (SKPaymentTransaction)initWithPayment:(id)a3;
- (SKPaymentTransaction)initWithServerTransaction:(id)a3;
- (SKPaymentTransaction)initWithXPCEncoding:(id)a3;
- (SKPaymentTransaction)originalTransaction;
- (SKPaymentTransactionState)transactionState;
- (id)UUID;
- (id)copyXPCEncoding;
- (id)getPaymentDiscountFromTransactionXPCEncoding:(id)a3;
- (void)_setDownloads:(id)a3;
- (void)_setError:(id)a3;
- (void)_setOriginalTransaction:(id)a3;
- (void)_setTemporaryIdentifier:(id)a3;
- (void)_setTransactionDate:(id)a3;
- (void)_setTransactionIdentifier:(id)a3;
- (void)_setTransactionReceipt:(id)a3;
- (void)_setTransactionState:(int64_t)a3;
@end

@implementation SKPaymentTransaction

- (SKPaymentTransaction)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKPaymentTransaction;
  v2 = -[SKPaymentTransaction init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SKPaymentTransactionInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }

  return v2;
}

- (SKPaymentTransaction)initWithPayment:(id)a3
{
  id v4 = a3;
  v5 = -[SKPaymentTransaction init](self, "init");
  objc_super v6 = v5;
  if (v5)
  {
    v7 = v5->_internal;
    id v8 = [v4 copy];
    v9 = (void *)v7[5];
    v7[5] = v8;
  }

  return v6;
}

- (NSArray)downloads
{
  return (NSArray *)*((id *)self->_internal + 2);
}

- (NSError)error
{
  return (NSError *)*((id *)self->_internal + 3);
}

- (SKPaymentTransaction)originalTransaction
{
  return (SKPaymentTransaction *)*((id *)self->_internal + 4);
}

- (SKPayment)payment
{
  return (SKPayment *)*((id *)self->_internal + 5);
}

- (NSDate)transactionDate
{
  return (NSDate *)*((id *)self->_internal + 7);
}

- (NSString)transactionIdentifier
{
  return (NSString *)*((id *)self->_internal + 8);
}

- (NSData)transactionReceipt
{
  return (NSData *)*((id *)self->_internal + 9);
}

- (SKPaymentTransactionState)transactionState
{
  return *((void *)self->_internal + 10);
}

- (id)UUID
{
  return *((id *)self->_internal + 1);
}

- (BOOL)canMergeWithTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);
  id v7 = *((id *)self->_internal + 5);
  id v8 = *(id *)(v4[1] + 40LL);
  v9 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    if (v7 == v8) {
      unsigned int v10 = 1;
    }
    else {
      unsigned int v10 = [v7 isEqual:v8];
    }
  }

  else
  {
    unsigned int v10 = 0;
  }

  id v11 = *((id *)self->_internal + 8);

  if (v11)
  {
    id v12 = *(id *)(v4[1] + 64LL);

    if (v10)
    {
      if (v11 == v12)
      {
        LOBYTE(v10) = 1;
        id v12 = v11;
      }

      else
      {
        LOBYTE(v10) = [v11 isEqualToString:v12];
      }
    }
  }

  else
  {
    id v12 = v9;
  }

  return v10;
}

- (NSString)matchingIdentifier
{
  id v3 = *((id *)self->_internal + 8);
  if (!v3) {
    id v3 = *((id *)self->_internal + 6);
  }
  return (NSString *)v3;
}

- (BOOL)mergeWithTransaction:(id)a3
{
  id v4 = (id *)a3;
  uint64_t v5 = (id *)self->_internal;
  objc_super v6 = v4[1];
  id v7 = (id)v6[3];
  if (v5[3] != v7) {
    objc_storeStrong(v5 + 3, v7);
  }
  id v8 = v5[10];
  id v9 = (id)v6[10];
  BOOL v10 = v8 != v9;
  if (v8 != v9) {
    v5[10] = v9;
  }
  id v11 = (id)v6[4];
  if (v5[4] != v11) {
    objc_storeStrong(v5 + 4, v11);
  }
  id v12 = (id)v6[7];
  if (v5[7] != v12) {
    objc_storeStrong(v5 + 7, v12);
  }
  id v13 = (id)v6[8];
  if (v5[8] != v13)
  {
    id v14 = [v13 copy];
    id v15 = v5[8];
    v5[8] = v14;
  }

  id v16 = (id)v6[6];
  if (v5[6] != v16)
  {
    id v17 = [v16 copy];
    id v18 = v5[6];
    v5[6] = v17;
  }

  id v19 = (id)v6[9];
  if (v5[9] != v19) {
    objc_storeStrong(v5 + 9, v19);
  }
  id v20 = v5[2];
  if (v20 != (id)v6[2] && (objc_msgSend(v20, "isEqualToArray:") & 1) == 0)
  {
    -[SKPaymentTransaction _setDownloads:](self, "_setDownloads:", v6[2]);
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_setDownloads:(id)a3
{
  id internal = (id *)self->_internal;
  id v4 = internal[2];
  if (v4 != a3)
  {
    BOOL v10 = internal;
    id v7 = a3;
    [v4 makeObjectsPerformSelector:"_setTransaction:" withObject:0];
    id v8 = [v7 copy];

    id v9 = internal[2];
    internal[2] = v8;

    [internal[2] makeObjectsPerformSelector:"_setTransaction:" withObject:self];
  }

- (void)_setError:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 3);
  id v7 = (id *)(internal + 24);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }
}

- (void)_setOriginalTransaction:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 4);
  id v7 = (id *)(internal + 32);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }
}

- (void)_setTemporaryIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[6] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    objc_super v6 = (void *)internal[6];
    internal[6] = v5;
  }

- (void)_setTransactionDate:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 7);
  id v7 = (id *)(internal + 56);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }
}

- (void)_setTransactionIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[8] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    objc_super v6 = (void *)internal[8];
    internal[8] = v5;
  }

- (void)_setTransactionReceipt:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[9] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    objc_super v6 = (void *)internal[9];
    internal[9] = v5;
  }

- (void)_setTransactionState:(int64_t)a3
{
  *((void *)self->_internal + 10) = a3;
}

- (NSString)_transactionIdentifier
{
  return (NSString *)*((id *)self->_internal + 8);
}

- (SKPaymentTransaction)initWithServerTransaction:(id)a3
{
  id v4 = a3;
  id v5 = -[SKPaymentTransaction init](self, "init");
  objc_super v6 = v5;
  if (v5) {
    -[SKPaymentTransaction mergeWithServerTransaction:](v5, "mergeWithServerTransaction:", v4);
  }

  return v6;
}

- (BOOL)mergeWithServerTransaction:(id)a3
{
  id v4 = a3;
  id v5 = (id *)self->_internal;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"uuid"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    objc_storeStrong(v5 + 1, v6);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"tid"]);

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    objc_storeStrong(v5 + 8, v8);
  }
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"state"]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"assets"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    v56 = v11;
    v57 = self;
    id v58 = v4;
    id v13 = v11;
    v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v13 count]));
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id obj = v13;
    id v14 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v62;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v62 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
          id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", @"hosted-id", v56));
          uint64_t v20 = objc_claimAutoreleasedReturnValue([v5[5] productIdentifier]);
          v21 = (void *)v20;
          if (v19) {
            BOOL v22 = v20 == 0;
          }
          else {
            BOOL v22 = 1;
          }
          if (!v22)
          {
            v23 = v5;
            v24 = objc_alloc_init(&OBJC_CLASS___SKDownload);
            -[SKDownload _setDownloadID:](v24, "_setDownloadID:", v19);
            -[SKDownload _setContentIdentifier:](v24, "_setContentIdentifier:", v21);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"hosted-content-length"]);
            -[SKDownload _setContentLength:](v24, "_setContentLength:", v25);

            v26 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"hosted-version"]);
            -[SKDownload _setVersion:](v24, "_setVersion:", v26);

            [v59 addObject:v24];
            id v5 = v23;
          }
        }

        id v15 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      }

      while (v15);
    }

    -[SKPaymentTransaction _setDownloads:](v57, "_setDownloads:", v59);
    id v4 = v58;
    id v11 = v56;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", @"error", v56));

  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSError);
  if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
  {
    id v29 = sub_1000CFE9C(v27);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
    id v31 = v5[3];
    v5[3] = (id)v30;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"odate"]);

  uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0) {
    objc_storeStrong(v5 + 7, v32);
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"rcpt"]);

  uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0) {
    objc_storeStrong(v5 + 9, v34);
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"date"]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"otid"]);
  uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v36, v38) & 1) != 0
    && (uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v37, v39) & 1) != 0))
  {
    v40 = objc_alloc_init(&OBJC_CLASS___SKPaymentTransaction);
    id internal = v40->_internal;
    id v42 = v36;
    v43 = (void *)internal[7];
    internal[7] = v42;
    v44 = internal;

    id v45 = [v37 copy];
    v46 = (void *)v44[8];
    v44[8] = v45;

    v44[10] = 1LL;
  }

  else
  {
    v40 = 0LL;
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"id"]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"qty"]);
  uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v47, v49) & 1) != 0 && (objc_opt_respondsToSelector(v48, "integerValue") & 1) != 0)
  {
    v50 = v4;
    v51 = objc_alloc_init(&OBJC_CLASS___SKMutablePayment);
    -[SKMutablePayment setProductIdentifier:](v51, "setProductIdentifier:", v47);
    -[SKMutablePayment setQuantity:](v51, "setQuantity:", [v48 integerValue]);
    v52 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:@"rdata"]);

    uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v52, v53) & 1) != 0) {
      -[SKMutablePayment setRequestData:](v51, "setRequestData:", v52);
    }
    objc_storeStrong(v5 + 5, v51);
    if (v40) {
      objc_storeStrong((id *)v40->_internal + 5, v51);
    }

    id v4 = v50;
  }

  else
  {
    v52 = v34;
  }

  id v54 = v5[4];
  v5[4] = v40;

  return 1;
}

- (SKPaymentTransaction)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v8 = -[SKPaymentTransaction init](self, "init");
    objc_super v6 = v8;
    if (!v8) {
      goto LABEL_5;
    }
    self = (SKPaymentTransaction *)v8->_internal;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData);
    CFDictionaryRef v10 = sub_1000E358C(v5, "2", v9);
    CFDictionaryRef v11 = v10;
    if (v10)
    {
      id v12 = sub_1000E2D24((uint64_t)v10);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      id internal = self[1]._internal;
      self[1]._id internal = v13;
    }

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDate);
    CFDictionaryRef v16 = sub_1000E358C(v5, "6", v15);

    if (v16) {
      objc_storeStrong(&self[3]._internal, v16);
    }
    CFDictionaryRef v17 = sub_1000E3558(v5, "11");

    if ((objc_opt_respondsToSelector(v17, "integerValue") & 1) != 0)
    {
      id v18 = (objc_class *)-[__CFDictionary integerValue](v17, "integerValue");
      self[5].super.Class isa = v18;
      if (v18 == (objc_class *)10000)
      {
        int v19 = _CFExecutableLinkedOnOrAfter(1010LL);
        uint64_t v20 = 3LL;
        if (v19) {
          uint64_t v20 = 1LL;
        }
        self[5].super.Class isa = (Class)v20;
      }
    }

    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
    CFDictionaryRef v22 = sub_1000E358C(v5, "13", v21);

    if (v22)
    {
      v23 = v22;
      Class isa = self[4].super.isa;
      self[4].super.Class isa = v23;
    }

    else
    {
      uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
      CFDictionaryRef v26 = sub_1000E358C(v5, "12", v25);
      if (!v26)
      {
        v23 = 0LL;
        goto LABEL_21;
      }

      v23 = v26;
      Class isa = self[3].super.isa;
      self[3].super.Class isa = v23;
    }

LABEL_21:
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSData);
    CFDictionaryRef v28 = sub_1000E358C(v5, "8", v27);

    if (v28) {
      objc_storeStrong(&self[4]._internal, v28);
    }
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDate);
    CFDictionaryRef v30 = sub_1000E358C(v5, "4", v29);
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSString);
    CFDictionaryRef v32 = sub_1000E358C(v5, "5", v31);
    CFDictionaryRef v33 = v32;
    v34 = 0LL;
    CFDictionaryRef v66 = v30;
    if (v30 && v32)
    {
      v34 = objc_alloc_init(&OBJC_CLASS___SKPaymentTransaction);
      CFDictionaryRef v35 = v33;
      v36 = v34->_internal;
      v37 = v66;
      uint64_t v38 = (void *)v36[7];
      v36[7] = v37;
      uint64_t v39 = v36;

      id v40 = -[__CFDictionary copy](v35, "copy");
      v41 = (void *)v39[8];
      v39[8] = v40;

      v39[10] = 1LL;
      CFDictionaryRef v33 = v35;
    }

    uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString);
    CFDictionaryRef v43 = sub_1000E358C(v5, "3", v42);
    CFDictionaryRef v44 = sub_1000E3558(v5, "7");
    uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v43, v45) & 1) != 0 && (objc_opt_respondsToSelector(v44, "integerValue") & 1) != 0)
    {
      v65 = v33;
      v46 = objc_alloc_init(&OBJC_CLASS___SKMutablePayment);
      -[SKMutablePayment setProductIdentifier:](v46, "setProductIdentifier:", v43);
      -[SKMutablePayment setQuantity:](v46, "setQuantity:", -[__CFDictionary integerValue](v44, "integerValue"));
      uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSData);
      CFDictionaryRef v48 = sub_1000E358C(v5, "9", v47);

      if (v48) {
        -[SKMutablePayment setRequestData:](v46, "setRequestData:", v48);
      }
      uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      CFDictionaryRef v50 = sub_1000E358C(v5, "10", v49);

      if (v50) {
        -[SKMutablePayment setRequestParameters:](v46, "setRequestParameters:", v50);
      }
      uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSString);
      CFDictionaryRef v52 = sub_1000E358C(v5, "0", v51);

      if (v52) {
        -[SKMutablePayment setApplicationUsername:](v46, "setApplicationUsername:", v52);
      }
      uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSString);
      CFDictionaryRef v54 = sub_1000E358C(v5, "14", v53);

      if (v54) {
        -[SKMutablePayment setPartnerIdentifier:](v46, "setPartnerIdentifier:", v54);
      }
      uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSString);
      CFDictionaryRef v56 = sub_1000E358C(v5, "15", v55);

      if (v56) {
        -[SKMutablePayment setPartnerTransactionIdentifier:](v46, "setPartnerTransactionIdentifier:", v56);
      }
      CFDictionaryRef v28 = sub_1000E3558(v5, "16");

      if ((objc_opt_respondsToSelector(v28, "BOOLValue") & 1) != 0) {
        -[SKMutablePayment setSimulatesAskToBuyInSandbox:]( v46,  "setSimulatesAskToBuyInSandbox:",  -[__CFDictionary BOOLValue](v28, "BOOLValue"));
      }
      -[SKMutablePayment setIsStoreOriginated:](v46, "setIsStoreOriginated:", xpc_dictionary_get_BOOL(v5, "17"));
      v57 = (void *)objc_claimAutoreleasedReturnValue( -[SKPaymentTransaction getPaymentDiscountFromTransactionXPCEncoding:]( v6,  "getPaymentDiscountFromTransactionXPCEncoding:",  v5));
      -[SKMutablePayment setPaymentDiscount:](v46, "setPaymentDiscount:", v57);
      id v58 = -[SKMutablePayment copy](v46, "copy");
      objc_storeStrong(&self[2]._internal, v58);
      if (v34) {
        objc_storeStrong((id *)v34->_internal + 5, v58);
      }

      CFDictionaryRef v33 = v65;
    }

    objc_storeStrong((id *)&self[2].super.isa, v34);
    xpc_object_t value = xpc_dictionary_get_value(v5, "1");
    v60 = (void *)objc_claimAutoreleasedReturnValue(value);
    __int128 v61 = v60;
    if (v60 && xpc_get_type(v60) == (xpc_type_t)&_xpc_type_array)
    {
      __int128 v62 = v44;
      __int128 v63 = v33;
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472LL;
      applier[2] = sub_100038B40;
      applier[3] = &unk_10034BBD0;
      __int128 v64 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v68 = v64;
      xpc_array_apply(v61, applier);
      if (-[NSMutableArray count](v64, "count")) {
        -[SKPaymentTransaction _setDownloads:](v6, "_setDownloads:", v64);
      }

      CFDictionaryRef v33 = v63;
      CFDictionaryRef v44 = v62;
    }

    goto LABEL_4;
  }

  objc_super v6 = 0LL;
LABEL_4:

LABEL_5:
  return v6;
}

- (id)getPaymentDiscountFromTransactionXPCEncoding:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  CFDictionaryRef v5 = sub_1000E358C(v3, "18", v4);
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    CFDictionaryRef v7 = sub_1000E358C(v3, "19", v6);
    if (v7)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
      CFDictionaryRef v9 = sub_1000E358C(v3, "20", v8);
      CFDictionaryRef v10 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v9);
      if (v10)
      {
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
        CFDictionaryRef v12 = sub_1000E358C(v3, "21", v11);
        if (v12)
        {
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
          CFDictionaryRef v14 = sub_1000E358C(v3, "22", v13);
          if (v14) {
            uint64_t v15 = -[SKPaymentDiscount initWithIdentifier:keyIdentifier:nonce:signature:timestamp:]( objc_alloc(&OBJC_CLASS___SKPaymentDiscount),  "initWithIdentifier:keyIdentifier:nonce:signature:timestamp:",  v5,  v7,  v10,  v12,  v14);
          }
          else {
            uint64_t v15 = 0LL;
          }
        }

        else
        {
          uint64_t v15 = 0LL;
        }
      }

      else
      {
        uint64_t v15 = 0LL;
      }
    }

    else
    {
      uint64_t v15 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id internal = (id *)self->_internal;
  id v5 = internal[5];
  uint64_t v6 = internal;
  sub_1000E35D4(v3, "0", (__CFString *)[v5 applicationUsername]);
  sub_1000E35D4(v3, "1", (__CFString *)v6[2]);
  CFDictionaryRef v7 = (__CFString *)sub_1000E283C((uint64_t)v6[3]);
  sub_1000E35D4(v3, "2", v7);
  sub_1000E35D4(v3, "3", (__CFString *)[internal[5] productIdentifier]);
  sub_1000E35D4(v3, "4", (__CFString *)[v6[4] transactionDate]);
  sub_1000E35D4(v3, "5", (__CFString *)[v6[4] transactionIdentifier]);
  sub_1000E35D4(v3, "14", (__CFString *)[internal[5] partnerIdentifier]);
  sub_1000E35D4(v3, "15", (__CFString *)[internal[5] partnerTransactionIdentifier]);
  sub_1000E35D4(v3, "6", (__CFString *)v6[7]);
  xpc_dictionary_set_int64(v3, "7", (int64_t)[internal[5] quantity]);
  sub_1000E35D4(v3, "8", (__CFString *)v6[9]);
  sub_1000E35D4(v3, "9", (__CFString *)[internal[5] requestData]);
  sub_1000E35D4(v3, "10", (__CFString *)[internal[5] requestParameters]);
  xpc_dictionary_set_int64(v3, "11", (int64_t)v6[10]);
  sub_1000E35D4(v3, "12", (__CFString *)v6[6]);
  sub_1000E35D4(v3, "13", (__CFString *)v6[8]);
  xpc_dictionary_set_BOOL(v3, "16", (BOOL)[internal[5] simulatesAskToBuyInSandbox]);
  xpc_dictionary_set_BOOL(v3, "17", (BOOL)[internal[5] isStoreOriginated]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([internal[5] paymentDiscount]);

  sub_1000E35D4(v3, "18", (__CFString *)[v8 identifier]);
  sub_1000E35D4(v3, "19", (__CFString *)[v8 keyIdentifier]);
  CFDictionaryRef v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nonce]);
  CFDictionaryRef v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  sub_1000E35D4(v3, "20", (__CFString *)[v10 lowercaseString]);

  sub_1000E35D4(v3, "21", (__CFString *)[v8 signature]);
  sub_1000E35D4(v3, "22", (__CFString *)[v8 timestamp]);

  return v3;
}

- (void).cxx_destruct
{
}

@end