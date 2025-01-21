@interface CBStackBLEAdvertiserBTStack
- (BOOL)advertiseEnableEPA;
- (BOOL)shouldAdvertiseSafetyAlerts:(unsigned __int8)a3 advData:(void *)a4;
- (CBStackBLEAdvertiserBTStack)init;
- (NSArray)saAddressDataArray;
- (NSArray)saServiceDataArray;
- (NSArray)serviceDataArray;
- (NSData)nearbyActionData;
- (NSData)selfAuthTag;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)advertiseRate;
- (void)_updateConnectable;
- (void)_updateNonConnectable;
- (void)_updateNonConnectableContact;
- (void)_updateNonConnectableObjectDiscovery;
- (void)activate;
- (void)invalidate;
- (void)setAdvertiseEnableEPA:(BOOL)a3;
- (void)setAdvertiseRate:(int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setNearbyActionData:(id)a3;
- (void)setSaAddressDataArray:(id)a3;
- (void)setSaServiceDataArray:(id)a3;
- (void)setSelfAuthTag:(id)a3;
- (void)setServiceDataArray:(id)a3;
@end

@implementation CBStackBLEAdvertiserBTStack

- (CBStackBLEAdvertiserBTStack)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CBStackBLEAdvertiserBTStack;
  v2 = -[CBStackBLEAdvertiserBTStack init](&v5, "init");
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3 = v2;
  }

  return v2;
}

- (id)description
{
  return -[CBStackBLEAdvertiserBTStack descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0) {
    int v3 = 8;
  }
  else {
    int v3 = 12;
  }
  int v79 = v3;
  v52 = self;
  if ((a3 & 0x8000000) != 0)
  {
    id v6 = 0LL;
  }

  else
  {
    id v78 = 0LL;
    id v4 = [(id)objc_opt_class(self) description];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    CUAppendF(&v78, &v79, "%@", v5);
    id v6 = v78;

    self = v52;
  }

  id v77 = v6;
  CUAppendF(&v77, &v79, "CID: 0x%X", self->_clientID);
  id v7 = v77;

  id v76 = v7;
  CUAppendF(&v76, &v79, "enableEPA: %d", v52->_advertiseEnableEPA);
  id v8 = v76;

  id v75 = v8;
  int advertiseRate = v52->_advertiseRate;
  if (advertiseRate <= 39)
  {
    if (advertiseRate > 19)
    {
      if (advertiseRate != 20)
      {
LABEL_21:
        v10 = "270 ms";
        goto LABEL_27;
      }

      v10 = "350 ms";
    }

    else
    {
      if (advertiseRate != 10)
      {
        if (advertiseRate == 15)
        {
          v10 = "1022.5 ms";
          goto LABEL_27;
        }

        goto LABEL_21;
      }

      v10 = "2 seconds";
    }
  }

  else if (advertiseRate <= 44)
  {
    if (advertiseRate != 40)
    {
      if (advertiseRate == 42)
      {
        v10 = "120 ms";
        goto LABEL_27;
      }

      goto LABEL_21;
    }

    v10 = "181.25 ms";
  }

  else
  {
    switch(advertiseRate)
    {
      case '-':
        v10 = "60 ms";
        break;
      case '2':
        v10 = "30 ms";
        break;
      case '<':
        v10 = "20 ms";
        break;
      default:
        goto LABEL_21;
    }
  }

- (void)activate
{
  if (dword_1008D61B0 <= 30 && (dword_1008D61B0 != -1 || _LogCategory_Initialize(&dword_1008D61B0, 30LL)))
  {
    uint64_t v3 = CUDescriptionWithLevel(self, 134217778LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF_safe(&dword_1008D61B0, "-[CBStackBLEAdvertiserBTStack activate]", 30LL, "Activate: %@", v4);
  }

  -[CBStackBLEAdvertiserBTStack _updateConnectable](self, "_updateConnectable");
  -[CBStackBLEAdvertiserBTStack _updateNonConnectable](self, "_updateNonConnectable");
  -[CBStackBLEAdvertiserBTStack _updateNonConnectableContact](self, "_updateNonConnectableContact");
  -[CBStackBLEAdvertiserBTStack _updateNonConnectableObjectDiscovery](self, "_updateNonConnectableObjectDiscovery");
}

- (void)invalidate
{
  if (dword_1008D61B0 <= 30 && (dword_1008D61B0 != -1 || _LogCategory_Initialize(&dword_1008D61B0, 30LL)))
  {
    uint64_t v3 = CUDescriptionWithLevel(self, 134217778LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    LogPrintF_safe(&dword_1008D61B0, "-[CBStackBLEAdvertiserBTStack invalidate]", 30LL, "Invalidate: %@", v4);
  }

  btSessionPtrConnectable = self->_btSessionPtrConnectable;
  BOOL advertisingStartedConnectable = self->_advertisingStartedConnectable;
  btSessionPtrNonConnectable = self->_btSessionPtrNonConnectable;
  BOOL advertisingStartedNonConnectable = self->_advertisingStartedNonConnectable;
  btSessionPtrNonConnectableContact = self->_btSessionPtrNonConnectableContact;
  BOOL advertisingStartedNonConnectableContact = self->_advertisingStartedNonConnectableContact;
  btSessionPtrNonConnectableObjectDiscovery = self->_btSessionPtrNonConnectableObjectDiscovery;
  BOOL advertisingStartedNonConnectableObjectDiscovery = self->_advertisingStartedNonConnectableObjectDiscovery;
  if (btSessionPtrNonConnectable) {
    BOOL v13 = !advertisingStartedNonConnectable;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = v13;
  if (btSessionPtrNonConnectableContact) {
    BOOL v15 = !advertisingStartedNonConnectableContact;
  }
  else {
    BOOL v15 = 1;
  }
  int v16 = v15;
  if (btSessionPtrNonConnectableObjectDiscovery) {
    BOOL v17 = !advertisingStartedNonConnectableObjectDiscovery;
  }
  else {
    BOOL v17 = 1;
  }
  char v18 = v17;
  BOOL v21 = self->_advertisingStartedConnectable && btSessionPtrConnectable != 0LL || v14 == 0 || v16 == 0;
  if (v21 || (v18 & 1) == 0)
  {
    uint64_t v22 = sub_100404FE8();
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10002C26C;
    v31[3] = &unk_10087FA28;
    BOOL v32 = advertisingStartedConnectable;
    BOOL v33 = advertisingStartedNonConnectable;
    v31[6] = btSessionPtrNonConnectable;
    v31[7] = btSessionPtrNonConnectableContact;
    BOOL v34 = advertisingStartedNonConnectableContact;
    v31[8] = btSessionPtrNonConnectableObjectDiscovery;
    BOOL v35 = advertisingStartedNonConnectableObjectDiscovery;
    v31[4] = self;
    v31[5] = btSessionPtrConnectable;
    sub_100405384(v22, v31);
  }

  btSessionHandleConnectable = self->_btSessionHandleConnectable;
  p_btSessionHandleConnectable = &self->_btSessionHandleConnectable;
  uint64_t v24 = btSessionHandleConnectable;
  *((_BYTE *)p_btSessionHandleConnectable - 8) = 0;
  *((_BYTE *)p_btSessionHandleConnectable + 16) = 0;
  *((_BYTE *)p_btSessionHandleConnectable + 40) = 0;
  *((_BYTE *)p_btSessionHandleConnectable + 64) = 0;
  uint64_t v26 = p_btSessionHandleConnectable[3];
  v27 = p_btSessionHandleConnectable[6];
  BOOL v28 = p_btSessionHandleConnectable[9];
  if (btSessionHandleConnectable || v26 || v27 || v28)
  {
    uint64_t v29 = sub_100404FE8();
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10002C5F0;
    v30[3] = &unk_10087FA48;
    v30[4] = v24;
    v30[5] = v26;
    v30[6] = v27;
    v30[7] = v28;
    sub_100405384(v29, v30);
  }

  *p_btSessionHandleConnectable = 0LL;
  p_btSessionHandleConnectable[1] = 0LL;
  p_btSessionHandleConnectable[3] = 0LL;
  p_btSessionHandleConnectable[4] = 0LL;
  p_btSessionHandleConnectable[6] = 0LL;
  p_btSessionHandleConnectable[7] = 0LL;
  p_btSessionHandleConnectable[9] = 0LL;
  p_btSessionHandleConnectable[10] = 0LL;
}

- (BOOL)shouldAdvertiseSafetyAlerts:(unsigned __int8)a3 advData:(void *)a4
{
  uint64_t v5 = a3;
  id v7 = self->_saAddressDataArray;
  id v8 = self->_saServiceDataArray;
  if (-[NSArray count](v7, "count") <= v5 || -[NSArray count](v8, "count") <= v5)
  {
    BOOL v22 = 0;
  }

  else
  {
    id v40 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v5));
    if ([v40 length] == (id)6)
    {
      v44 = 0LL;
      v45 = 0LL;
      id v9 = v40;
      sub_10056AB04(&v44, [v9 bytes], (size_t)[v9 length]);
      uint64_t v10 = sub_10056AE48((uint64_t)&v44, 0LL);
      uint64_t v11 = sub_10056AE48((uint64_t)&v44, 1uLL);
      unsigned int v12 = sub_10056AE48((uint64_t)&v44, 2uLL);
      unsigned int v13 = sub_10056AE48((uint64_t)&v44, 3uLL);
      unsigned int v14 = sub_10056AE48((uint64_t)&v44, 4uLL);
      unint64_t v15 = sub_10056AE48((uint64_t)&v44, 5uLL) | ((unint64_t)v14 << 8) | ((unint64_t)v12 << 24) | ((unint64_t)v13 << 16) | (v10 << 40) | (v11 << 32) | 0x1000000000000LL;
      if ((v10 & 0xC0) == 0x80)
      {
        if (dword_1008D61B0 <= 90
          && (dword_1008D61B0 != -1 || _LogCategory_Initialize(&dword_1008D61B0, 90LL)))
        {
          sub_10056B0A4((uint64_t)&v44, &__p);
          int size = (char)__p.__r_.__value_.__s.__size_;
          std::string::size_type v17 = __p.__r_.__value_.__r.__words[0];
          id v18 = sub_1005BFB9C(v15);
          uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
          id v20 = (void *)v19;
          p_p = &__p;
          if (size < 0) {
            p_p = (std::stringbuf::string_type *)v17;
          }
          LogPrintF_safe( &dword_1008D61B0,  "-[CBStackBLEAdvertiserBTStack shouldAdvertiseSafetyAlerts:advData:]",  90LL,  "### Overriding address #%d with Invalid address data %s (%@)",  v5,  p_p,  v19);
        }

        BOOL v22 = 0;
      }

      else
      {
        if (dword_1008D61B0 <= 30
          && (dword_1008D61B0 != -1 || _LogCategory_Initialize(&dword_1008D61B0, 30LL)))
        {
          sub_10056B0A4((uint64_t)&v44, &__p);
          int v23 = (char)__p.__r_.__value_.__s.__size_;
          std::string::size_type v24 = __p.__r_.__value_.__r.__words[0];
          id v25 = sub_1005BFB9C(v15);
          uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
          v27 = (void *)v26;
          BOOL v28 = &__p;
          if (v23 < 0) {
            BOOL v28 = (std::stringbuf::string_type *)v24;
          }
          LogPrintF_safe( &dword_1008D61B0,  "-[CBStackBLEAdvertiserBTStack shouldAdvertiseSafetyAlerts:advData:]",  30LL,  "### Overriding address #%d with address data %s (%@)",  v5,  v28,  v26);
        }

        uint64_t v29 = *((void *)a4 + 1);
        *(void *)(v29 + 256) = v15;
        *(_BYTE *)(v29 + 464) = 1;
        char v43 = 0;
        sub_100242CA4(&v43);
        sub_1001BDD20(1u);
        sub_100242CD0(&v43);
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v5));
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 serviceData]);
        id v32 = [v31 length];
        BOOL v22 = (unint64_t)v32 < 0x1C;
        if ((unint64_t)v32 < 0x1C)
        {
          id v41 = 0LL;
          uint64_t v42 = 0LL;
          id v33 = v31;
          BOOL v34 = (const char *)[v33 bytes];
          id v35 = [v33 length];
          uint64_t v36 = v34 ? (char *)v34 : "";
          sub_10056AB04(&v41, v36, (size_t)v35);
          uint64_t v37 = *((void *)a4 + 1);
          sub_100634348((uint64_t)&__p, (__int16)[v30 serviceUUID16]);
          id v46 = &__p;
          uint64_t v38 = sub_10002E92C( (uint64_t **)(v37 + 112),  (unsigned __int8 *)&__p,  (uint64_t)&unk_1006BA9E8,  (_OWORD **)&v46);
          sub_10002EAC8((uint64_t)v38 + 56, (uint64_t)&v41);
          id v41 = &off_10087FAA8;
          if (v42) {
            sub_1002CD254(v42);
          }
        }

        sub_100242CD8(&v43);
      }

      v44 = &off_10087FAA8;
      if (v45) {
        sub_1002CD254(v45);
      }
    }

    else
    {
      BOOL v22 = 0;
    }
  }

  return v22;
}

- (void)_updateConnectable
{
  p_btSessionHandleConnectable = (unint64_t *)&self->_btSessionHandleConnectable;
  if (self->_btSessionHandleConnectable) {
    goto LABEL_18;
  }
  uint64_t v3 = self;
  id v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"CBStackAdvertiserCA-0x%X",  self->_clientID);
  if (qword_1008D61A8 != -1) {
    dispatch_once(&qword_1008D61A8, &stru_10087FAB8);
  }
  uint64_t v5 = qword_1008D61A0;
  id v6 = v4;
  sub_10002418C(&v47, (char *)-[NSString UTF8String](v6, "UTF8String"));
  int v7 = sub_100496120(v5, (uint64_t)&v47, p_btSessionHandleConnectable, 2LL);
  int v8 = v7;
  if ((v49 & 0x80000000) == 0)
  {
    if (!v7) {
      goto LABEL_13;
    }
LABEL_8:
    uint64_t v9 = (v8 + 310000);
    if ((_DWORD)v9
      && dword_1008D61B0 <= 90
      && (dword_1008D61B0 != -1 || _LogCategory_Initialize(&dword_1008D61B0, 90LL)))
    {
      uint64_t v10 = CUPrintErrorCode(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      LogPrintF_safe( &dword_1008D61B0,  "-[CBStackBLEAdvertiserBTStack _updateConnectable]",  90LL,  "### Attach session failed: %@",  v11);

      uint64_t v3 = self;
    }

    goto LABEL_13;
  }

  operator delete(v47);
  if (v8) {
    goto LABEL_8;
  }
LABEL_13:
  if (*p_btSessionHandleConnectable)
  {
    if (qword_1008D61A8 != -1) {
      dispatch_once(&qword_1008D61A8, &stru_10087FAB8);
    }
    v3->_btSessionPtrConnectable = (void *)sub_100496954((void *)qword_1008D61A0, *p_btSessionHandleConnectable);
  }

LABEL_18:
  id v33 = (uint64_t **)operator new(0x1E0uLL);
  sub_10056B368((uint64_t)v33);
  id v32 = self->_nearbyActionData;
  unsigned int v12 = -[NSData length](v32, "length");
  BOOL v13 = (unint64_t)(v12 - 1) < 0x1C;
  if ((unint64_t)(v12 - 1) <= 0x1B)
  {
    LOBYTE(v39) = (_BYTE)v12 + 5;
    *(_DWORD *)((char *)&v39 + 1) = 251677951;
    BYTE5(v39) = (_BYTE)v12;
    unsigned int v14 = -[NSMutableData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithBytes:length:",  &v39,  6LL);
    -[NSMutableData appendData:](v14, "appendData:", v32);
    uint64_t v47 = 0LL;
    v48 = 0LL;
    unint64_t v15 = v14;
    sub_10056AB04(&v47, -[NSMutableData bytes](v15, "bytes"), -[NSMutableData length](v15, "length"));
    sub_10002EAC8((uint64_t)(v33 + 6), (uint64_t)&v47);
    uint64_t v47 = &off_10087FAA8;
    if (v48) {
      sub_1002CD254(v48);
    }
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  int v16 = self->_serviceDataArray;
  id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v41,  v46,  16LL);
  if (v17)
  {
    uint64_t v18 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v16);
        }
        id v20 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        if ([v20 connectable])
        {
          BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v20 serviceData]);
          v39 = 0LL;
          id v40 = 0LL;
          id v22 = v21;
          int v23 = (const char *)[v22 bytes];
          id v24 = [v22 length];
          if (v23) {
            id v25 = v23;
          }
          else {
            id v25 = "";
          }
          sub_10056AB04(&v39, v25, (size_t)v24);
          sub_100634348((uint64_t)&v47, (__int16)[v20 serviceUUID16]);
          v45 = &v47;
          uint64_t v26 = sub_10002E92C(v33 + 14, (unsigned __int8 *)&v47, (uint64_t)&unk_1006BA9E8, (_OWORD **)&v45);
          sub_10002EAC8((uint64_t)v26 + 56, (uint64_t)&v39);
          v39 = &off_10087FAA8;
          if (v40) {
            sub_1002CD254(v40);
          }

          BOOL v13 = 1;
        }
      }

      id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v41,  v46,  16LL);
    }

    while (v17);
  }

  btSessionPtrConnectable = self->_btSessionPtrConnectable;
  if (self->_advertisingStartedConnectable && btSessionPtrConnectable)
  {
    uint64_t v28 = sub_100404FE8();
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10002D4B4;
    v38[3] = &unk_10087EB20;
    v38[4] = btSessionPtrConnectable;
    sub_100405384(v28, v38);
  }

  self->_BOOL advertisingStartedConnectable = 0;
  if (v13)
  {
    *((_DWORD *)v33 + 66) = 0;
    int advertiseRate = self->_advertiseRate;
    if (advertiseRate <= 39)
    {
      if (advertiseRate > 19)
      {
        if (advertiseRate != 20)
        {
LABEL_54:
          __int16 v30 = 432;
          goto LABEL_60;
        }

        __int16 v30 = 560;
      }

      else
      {
        if (advertiseRate != 10)
        {
          if (advertiseRate == 15)
          {
            __int16 v30 = 1636;
            goto LABEL_60;
          }

          goto LABEL_54;
        }

        __int16 v30 = 3200;
      }
    }

    else if (advertiseRate <= 44)
    {
      if (advertiseRate != 40)
      {
        if (advertiseRate == 42)
        {
          __int16 v30 = 192;
          goto LABEL_60;
        }

        goto LABEL_54;
      }

      __int16 v30 = 290;
    }

    else
    {
      switch(advertiseRate)
      {
        case '-':
          __int16 v30 = 96;
          break;
        case '2':
          __int16 v30 = 48;
          break;
        case '<':
          __int16 v30 = 32;
          break;
        default:
          goto LABEL_54;
      }
    }

- (void)_updateNonConnectable
{
  p_btSessionHandleNonConnectable = (unint64_t *)&self->_btSessionHandleNonConnectable;
  if (self->_btSessionHandleNonConnectable) {
    goto LABEL_18;
  }
  uint64_t v3 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"CBStackAdvertiserNC-0x%X",  self->_clientID);
  if (qword_1008D61A8 != -1) {
    dispatch_once(&qword_1008D61A8, &stru_10087FAB8);
  }
  uint64_t v4 = qword_1008D61A0;
  uint64_t v5 = v3;
  sub_10002418C(v47, (char *)-[NSString UTF8String](v5, "UTF8String"));
  int v6 = sub_100496120(v4, (uint64_t)v47, p_btSessionHandleNonConnectable, 2LL);
  int v7 = v6;
  if ((v48 & 0x80000000) == 0)
  {
    if (!v6) {
      goto LABEL_13;
    }
LABEL_8:
    uint64_t v8 = (v7 + 310000);
    if ((_DWORD)v8
      && dword_1008D61B0 <= 90
      && (dword_1008D61B0 != -1 || _LogCategory_Initialize(&dword_1008D61B0, 90LL)))
    {
      uint64_t v9 = CUPrintErrorCode(v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      LogPrintF_safe( &dword_1008D61B0,  "-[CBStackBLEAdvertiserBTStack _updateNonConnectable]",  90LL,  "### Attach NC session failed: %@",  v10);
    }

    goto LABEL_13;
  }

  operator delete(v47[0]);
  if (v7) {
    goto LABEL_8;
  }
LABEL_13:
  if (*p_btSessionHandleNonConnectable)
  {
    if (qword_1008D61A8 != -1) {
      dispatch_once(&qword_1008D61A8, &stru_10087FAB8);
    }
    self->_btSessionPtrNonConnectable = (void *)sub_100496954( (void *)qword_1008D61A0,  *p_btSessionHandleNonConnectable);
  }

LABEL_18:
  uint64_t v11 = (unsigned int *)operator new(0x1E0uLL);
  sub_10056B368((uint64_t)v11);
  __int128 v43 = &off_10087FAE8;
  __int128 v44 = v11;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  unsigned int v12 = self->_serviceDataArray;
  id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v39,  v46,  16LL);
  if (!v13)
  {

LABEL_35:
    unsigned int v25 = -[CBStackBLEAdvertiserBTStack shouldAdvertiseSafetyAlerts:advData:]( self,  "shouldAdvertiseSafetyAlerts:advData:",  0LL,  &v43);
    goto LABEL_36;
  }

  char v14 = 0;
  uint64_t v15 = *(void *)v40;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v40 != v15) {
        objc_enumerationMutation(v12);
      }
      id v17 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
      if (([v17 connectable] & 1) == 0)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 serviceData]);
        uint64_t v37 = 0LL;
        uint64_t v38 = 0LL;
        id v19 = v18;
        id v20 = (const char *)[v19 bytes];
        id v21 = [v19 length];
        if (v20) {
          id v22 = v20;
        }
        else {
          id v22 = "";
        }
        sub_10056AB04(&v37, v22, (size_t)v21);
        int v23 = v44;
        sub_100634348((uint64_t)v47, (__int16)[v17 serviceUUID16]);
        v45 = v47;
        id v24 = sub_10002E92C((uint64_t **)v23 + 14, (unsigned __int8 *)v47, (uint64_t)&unk_1006BA9E8, (_OWORD **)&v45);
        sub_10002EAC8((uint64_t)v24 + 56, (uint64_t)&v37);
        uint64_t v37 = &off_10087FAA8;
        if (v38) {
          sub_1002CD254(v38);
        }

        char v14 = 1;
      }
    }

    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v39,  v46,  16LL);
  }

  while (v13);

  if ((v14 & 1) == 0) {
    goto LABEL_35;
  }
  unsigned int v25 = 1;
LABEL_36:
  btSessionPtrNonConnectable = self->_btSessionPtrNonConnectable;
  if (self->_advertisingStartedNonConnectable && btSessionPtrNonConnectable)
  {
    uint64_t v27 = sub_100404FE8();
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10002DD10;
    v36[3] = &unk_10087EB20;
    v36[4] = btSessionPtrNonConnectable;
    sub_100405384(v27, v36);
  }

  self->_BOOL advertisingStartedNonConnectable = 0;
  if (v25)
  {
    uint64_t v28 = v44;
    v44[66] = 1;
    int advertiseRate = self->_advertiseRate;
    if (advertiseRate <= 39)
    {
      if (advertiseRate > 19)
      {
        if (advertiseRate == 20)
        {
          __int16 v30 = 560;
          goto LABEL_60;
        }
      }

      else
      {
        if (advertiseRate == 10)
        {
          __int16 v30 = 3200;
          goto LABEL_60;
        }

        if (advertiseRate == 15)
        {
          __int16 v30 = 1636;
          goto LABEL_60;
        }
      }
    }

    else if (advertiseRate <= 44)
    {
      if (advertiseRate == 40)
      {
        __int16 v30 = 290;
        goto LABEL_60;
      }

      if (advertiseRate == 42)
      {
        __int16 v30 = 192;
        goto LABEL_60;
      }
    }

    else
    {
      switch(advertiseRate)
      {
        case '-':
          __int16 v30 = 96;
          goto LABEL_60;
        case '2':
          __int16 v30 = 48;
          goto LABEL_60;
        case '<':
          __int16 v30 = 32;
LABEL_60:
          *((_WORD *)v28 + 111) = v30;
          *((_BYTE *)v28 + 12) = 0;
          *((_BYTE *)v28 + 307) = 0;
          *((_BYTE *)v28 + 409) = self->_advertiseEnableEPA;
          uint64_t v31 = sub_100404FE8();
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3321888768LL;
          v33[2] = sub_10002DE04;
          v33[3] = &unk_10087FA68;
          v33[4] = btSessionPtrNonConnectable;
          BOOL v34 = &off_10087FAE8;
          id v35 = v44;
          if (v44) {
            sub_1002CD1E0((uint64_t)v44);
          }
          sub_100405384(v31, v33);
          self->_BOOL advertisingStartedNonConnectable = 1;
          BOOL v34 = &off_10087FAE8;
          if (v35) {
            sub_1002CD254(v35);
          }
          goto LABEL_64;
      }
    }

    __int16 v30 = 432;
    goto LABEL_60;
  }

- (void)_updateNonConnectableContact
{
  p_btSessionHandleNonConnectableContact = (unint64_t *)&self->_btSessionHandleNonConnectableContact;
  if (self->_btSessionHandleNonConnectableContact) {
    goto LABEL_18;
  }
  uint64_t v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"CBStackAdvertiserNC1-0x%X",  self->_clientID);
  if (qword_1008D61A8 != -1) {
    dispatch_once(&qword_1008D61A8, &stru_10087FAB8);
  }
  uint64_t v5 = qword_1008D61A0;
  int v6 = v4;
  sub_10002418C(&v25, (char *)-[NSString UTF8String](v6, "UTF8String"));
  int v7 = sub_100496120(v5, (uint64_t)&v25, p_btSessionHandleNonConnectableContact, 2LL);
  int v8 = v7;
  if ((v27 & 0x80000000) == 0)
  {
    if (!v7) {
      goto LABEL_13;
    }
LABEL_8:
    uint64_t v9 = (v8 + 310000);
    if ((_DWORD)v9
      && dword_1008D61B0 <= 90
      && (dword_1008D61B0 != -1 || _LogCategory_Initialize(&dword_1008D61B0, 90LL)))
    {
      uint64_t v10 = CUPrintErrorCode(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      LogPrintF_safe( &dword_1008D61B0,  "-[CBStackBLEAdvertiserBTStack _updateNonConnectableContact]",  90LL,  "### Attach NC 1 session failed: %@",  v11);
    }

    goto LABEL_13;
  }

  operator delete(v25);
  if (v8) {
    goto LABEL_8;
  }
LABEL_13:
  if (*p_btSessionHandleNonConnectableContact)
  {
    if (qword_1008D61A8 != -1) {
      dispatch_once(&qword_1008D61A8, &stru_10087FAB8);
    }
    self->_btSessionPtrNonConnectableContact = (void *)sub_100496954( (void *)qword_1008D61A0,  *p_btSessionHandleNonConnectableContact);
  }

LABEL_18:
  unsigned int v25 = 0LL;
  uint64_t v26 = 0LL;
  unsigned int v12 = (unsigned int *)operator new(0x1E0uLL);
  double v13 = sub_10056B368((uint64_t)v12);
  unsigned int v25 = &off_10087FAE8;
  uint64_t v26 = v12;
  unsigned int v14 = -[CBStackBLEAdvertiserBTStack shouldAdvertiseSafetyAlerts:advData:]( self,  "shouldAdvertiseSafetyAlerts:advData:",  1LL,  &v25,  v13);
  btSessionPtrNonConnectableContact = self->_btSessionPtrNonConnectableContact;
  if (self->_advertisingStartedNonConnectableContact && btSessionPtrNonConnectableContact)
  {
    uint64_t v16 = sub_100404FE8();
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10002E2DC;
    v24[3] = &unk_10087EB20;
    v24[4] = btSessionPtrNonConnectableContact;
    sub_100405384(v16, v24);
  }

  self->_BOOL advertisingStartedNonConnectableContact = 0;
  if (v14)
  {
    id v17 = v26;
    v26[66] = 2;
    int advertiseRate = self->_advertiseRate;
    if (advertiseRate <= 39)
    {
      if (advertiseRate > 19)
      {
        if (advertiseRate == 20)
        {
          __int16 v19 = 560;
          goto LABEL_42;
        }
      }

      else
      {
        if (advertiseRate == 10)
        {
          __int16 v19 = 3200;
          goto LABEL_42;
        }

        if (advertiseRate == 15)
        {
          __int16 v19 = 1636;
          goto LABEL_42;
        }
      }
    }

    else if (advertiseRate <= 44)
    {
      if (advertiseRate == 40)
      {
        __int16 v19 = 290;
        goto LABEL_42;
      }

      if (advertiseRate == 42)
      {
        __int16 v19 = 192;
        goto LABEL_42;
      }
    }

    else
    {
      switch(advertiseRate)
      {
        case '-':
          __int16 v19 = 96;
          goto LABEL_42;
        case '2':
          __int16 v19 = 48;
          goto LABEL_42;
        case '<':
          __int16 v19 = 32;
LABEL_42:
          *((_WORD *)v17 + 111) = v19;
          *((_BYTE *)v17 + 12) = 0;
          *((_BYTE *)v17 + 307) = 0;
          *((_BYTE *)v17 + 409) = self->_advertiseEnableEPA;
          uint64_t v20 = sub_100404FE8();
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3321888768LL;
          v21[2] = sub_10002E3D0;
          v21[3] = &unk_10087FA68;
          v21[4] = btSessionPtrNonConnectableContact;
          id v22 = &off_10087FAE8;
          int v23 = v26;
          if (v26) {
            sub_1002CD1E0((uint64_t)v26);
          }
          sub_100405384(v20, v21);
          self->_BOOL advertisingStartedNonConnectableContact = 1;
          id v22 = &off_10087FAE8;
          if (v23) {
            sub_1002CD254(v23);
          }
          goto LABEL_46;
      }
    }

    __int16 v19 = 432;
    goto LABEL_42;
  }

- (void)_updateNonConnectableObjectDiscovery
{
  p_btSessionHandleNonConnectableObjectDiscovery = (unint64_t *)&self->_btSessionHandleNonConnectableObjectDiscovery;
  if (self->_btSessionHandleNonConnectableObjectDiscovery) {
    goto LABEL_18;
  }
  uint64_t v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"CBStackAdvertiserNCObjectDiscovery-0x%X",  self->_clientID);
  if (qword_1008D61A8 != -1) {
    dispatch_once(&qword_1008D61A8, &stru_10087FAB8);
  }
  uint64_t v5 = qword_1008D61A0;
  int v6 = v4;
  sub_10002418C(&__p, (char *)-[NSString UTF8String](v6, "UTF8String"));
  int v7 = sub_100496120(v5, (uint64_t)&__p, p_btSessionHandleNonConnectableObjectDiscovery, 2LL);
  int v8 = v7;
  if ((v19 & 0x80000000) == 0)
  {
    if (!v7) {
      goto LABEL_13;
    }
LABEL_8:
    uint64_t v9 = (v8 + 310000);
    if ((_DWORD)v9
      && dword_1008D61B0 <= 90
      && (dword_1008D61B0 != -1 || _LogCategory_Initialize(&dword_1008D61B0, 90LL)))
    {
      uint64_t v10 = CUPrintErrorCode(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      LogPrintF_safe( &dword_1008D61B0,  "-[CBStackBLEAdvertiserBTStack _updateNonConnectableObjectDiscovery]",  90LL,  "### Attach NC ObjectDiscovery session failed: %@",  v11);
    }

    goto LABEL_13;
  }

  operator delete(__p);
  if (v8) {
    goto LABEL_8;
  }
LABEL_13:
  if (*p_btSessionHandleNonConnectableObjectDiscovery)
  {
    if (qword_1008D61A8 != -1) {
      dispatch_once(&qword_1008D61A8, &stru_10087FAB8);
    }
    self->_btSessionPtrNonConnectableObjectDiscovery = (void *)sub_100496954( (void *)qword_1008D61A0,  *p_btSessionHandleNonConnectableObjectDiscovery);
  }

LABEL_18:
  unsigned int v12 = (unsigned int *)operator new(0x1E0uLL);
  double v13 = sub_10056B368((uint64_t)v12);
  std::stringbuf::string_type __p = &off_10087FAE8;
  uint64_t v18 = v12;
  -[CBStackBLEAdvertiserBTStack shouldAdvertiseSafetyAlerts:advData:]( self,  "shouldAdvertiseSafetyAlerts:advData:",  2LL,  &__p,  v13);
  if (self->_advertisingStartedNonConnectableObjectDiscovery)
  {
    btSessionPtrNonConnectableObjectDiscovery = self->_btSessionPtrNonConnectableObjectDiscovery;
    if (btSessionPtrNonConnectableObjectDiscovery)
    {
      uint64_t v15 = sub_100404FE8();
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10002E754;
      v16[3] = &unk_10087EB20;
      v16[4] = btSessionPtrNonConnectableObjectDiscovery;
      sub_100405384(v15, v16);
    }
  }

  self->_BOOL advertisingStartedNonConnectableObjectDiscovery = 0;
  std::stringbuf::string_type __p = &off_10087FAE8;
  if (v18) {
    sub_1002CD254(v18);
  }
}

- (int)advertiseRate
{
  return self->_advertiseRate;
}

- (void)setAdvertiseRate:(int)a3
{
  self->_int advertiseRate = a3;
}

- (BOOL)advertiseEnableEPA
{
  return self->_advertiseEnableEPA;
}

- (void)setAdvertiseEnableEPA:(BOOL)a3
{
  self->_advertiseEnableEPA = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSData)nearbyActionData
{
  return self->_nearbyActionData;
}

- (void)setNearbyActionData:(id)a3
{
}

- (NSArray)saAddressDataArray
{
  return self->_saAddressDataArray;
}

- (void)setSaAddressDataArray:(id)a3
{
}

- (NSArray)saServiceDataArray
{
  return self->_saServiceDataArray;
}

- (void)setSaServiceDataArray:(id)a3
{
}

- (NSData)selfAuthTag
{
  return self->_selfAuthTag;
}

- (void)setSelfAuthTag:(id)a3
{
}

- (NSArray)serviceDataArray
{
  return self->_serviceDataArray;
}

- (void)setServiceDataArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end