@interface IAPInfoDAAPResponseDecoder
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4;
- (void)parser:(id)a3 didFailWithError:(id)a4;
- (void)parser:(id)a3 didFinishWithState:(int64_t)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
- (void)parserDidCancel:(id)a3;
- (void)parserDidStart:(id)a3;
@end

@implementation IAPInfoDAAPResponseDecoder

- (void)parserDidStart:(id)a3
{
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  items = self->_items;
  self->_items = v4;

  v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  deletedItems = self->_deletedItems;
  self->_deletedItems = v6;

  v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  currentItemsArray = self->_currentItemsArray;
  self->_currentItemsArray = v8;
}

- (void)parser:(id)a3 didFinishWithState:(int64_t)a4
{
  if (a4 != 2)
  {
    self->_success = 0;
    v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    items = self->_items;
    self->_items = v19;

    v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    deletedItems = self->_deletedItems;
    self->_deletedItems = v21;

    uint64_t v23 = ASDLogHandleForCategory(14LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    int v25 = 138412290;
    id v26 = (id)objc_opt_class(self, v24);
    id v18 = v26;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[%@]: Failed to decode response",  (uint8_t *)&v25,  0xCu);
    goto LABEL_4;
  }

  self->_success = 1;
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", self->_items));
  addedIAPs = self->_addedIAPs;
  self->_addedIAPs = v5;

  v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", self->_deletedItems));
  removedIAPs = self->_removedIAPs;
  self->_removedIAPs = v7;

  uint64_t v9 = ASDLogHandleForCategory(14LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_opt_class(self, v11);
    unsigned int status = self->_status;
    BOOL update = self->_update;
    serverRevision = self->_serverRevision;
    v16 = self->_addedIAPs;
    v17 = self->_removedIAPs;
    int v25 = 138413570;
    id v26 = v12;
    __int16 v27 = 1024;
    unsigned int v28 = status;
    __int16 v29 = 1024;
    BOOL v30 = update;
    __int16 v31 = 2112;
    v32 = serverRevision;
    __int16 v33 = 2112;
    v34 = v16;
    __int16 v35 = 2112;
    v36 = v17;
    id v18 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[%@]: Parsed response\nstatus: %i\nisUpdate: %{BOOL}d\nserverRevision: %@\niaps: %@\ndeletedIaps: %@",  (uint8_t *)&v25,  0x36u);
LABEL_4:
  }

- (void)parserDidCancel:(id)a3
{
  self->_success = 0;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  items = self->_items;
  self->_items = v4;

  v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  deletedItems = self->_deletedItems;
  self->_deletedItems = v6;
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  self->_success = 0;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  items = self->_items;
  self->_items = v5;

  v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  deletedItems = self->_deletedItems;
  self->_deletedItems = v7;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1835625315)
  {
    if ((int)a4 <= 1836213102)
    {
      if ((int)a4 > 1835819883)
      {
        if (a4 == 1835819884) {
          return result;
        }
        int v5 = 1835821428;
      }

      else
      {
        if (a4 == 1835625316) {
          return result;
        }
        int v5 = 1835625572;
      }

      goto LABEL_22;
    }

    if ((int)a4 <= 1836344174)
    {
      if (a4 == 1836213103) {
        return result;
      }
      int v5 = 1836282996;
      goto LABEL_22;
    }

    if (a4 != 1836344175 && a4 != 1836413810)
    {
      int v5 = 1836414073;
      goto LABEL_22;
    }
  }

  else
  {
    if ((int)a4 > 1634368096)
    {
      if (a4 - 1634368097 <= 0x13 && ((1 << (a4 - 97)) & 0xE4011) != 0) {
        return result;
      }
      int v5 = 1634952301;
LABEL_22:
      if (a4 != v5) {
        return 0;
      }
      return result;
    }

    if (a4 != 1633968755 && a4 != 1634025833)
    {
      int v5 = 1634038895;
      goto LABEL_22;
    }
  }

  return result;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835819884 || a4 == 1835821428;
  return a4 == 1633968755 || v4;
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  id v7 = a3;
  switch(a4)
  {
    case 0x6D75646Cu:
      id v12 = v7;
      deletedItems = self->_deletedItems;
      goto LABEL_6;
    case 0x6D6C6974u:
      id v12 = v7;
      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___ASDMutableIAPInfo);
      currentItem = self->_currentItem;
      self->_currentItem = v11;
      goto LABEL_8;
    case 0x6D6C636Cu:
      id v12 = v7;
      deletedItems = self->_items;
LABEL_6:
      uint64_t v9 = deletedItems;
      currentItem = self->_currentItemsArray;
      self->_currentItemsArray = v9;
LABEL_8:

      id v7 = v12;
      break;
  }
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  if ((int)a4 <= 1634368110)
  {
    if ((int)a4 > 1634368096)
    {
      if (a4 == 1634368097)
      {
        currentItem = self->_currentItem;
        id v17 = v10;
        id v12 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))
                            + a5[7]));
        -[ASDMutableIAPInfo setAppAdamId:](currentItem, "setAppAdamId:", v12);
      }

      else
      {
        if (a4 != 1634368101) {
          goto LABEL_28;
        }
        id v17 = v10;
        id v12 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)bswap32(*(_DWORD *)a5)));
        -[ASDMutableIAPInfo setExpirationDate:](self->_currentItem, "setExpirationDate:", v12);
      }
    }

    else if (a4 == 1634025833)
    {
      v13 = self->_currentItem;
      id v17 = v10;
      id v12 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))
                          + a5[7]));
      -[ASDMutableIAPInfo setAdamId:](v13, "setAdamId:", v12);
    }

    else
    {
      if (a4 != 1634038895) {
        goto LABEL_28;
      }
      id v17 = v10;
      id v12 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)bswap32(*(_DWORD *)a5)));
      -[ASDMutableIAPInfo setPurchaseDate:](self->_currentItem, "setPurchaseDate:", v12);
    }

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1835821428)
  {
    if (self->_errorParsingItem)
    {
      uint64_t v7 = ASDLogHandleForCategory(9LL);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        currentItem = self->_currentItem;
        int v12 = 138412290;
        v13 = currentItem;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[IAPInfoItemsResponseParserDelegate]: Error parsing item: %@",  (uint8_t *)&v12,  0xCu);
      }

      self->_errorParsingItem = 0;
    }

    else
    {
      currentItemsArray = self->_currentItemsArray;
      id v10 = -[ASDMutableIAPInfo copy](self->_currentItem, "copy");
      -[NSMutableArray addObject:](currentItemsArray, "addObject:", v10);
    }
  }
}

- (void).cxx_destruct
{
}

@end