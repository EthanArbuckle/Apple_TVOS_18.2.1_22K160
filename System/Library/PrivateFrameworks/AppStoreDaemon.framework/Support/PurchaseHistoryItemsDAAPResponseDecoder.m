@interface PurchaseHistoryItemsDAAPResponseDecoder
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

@implementation PurchaseHistoryItemsDAAPResponseDecoder

- (void)parserDidStart:(id)a3
{
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  currentBatchAdded = self->_currentBatchAdded;
  self->_currentBatchAdded = v4;

  v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  currentBatchRemoved = self->_currentBatchRemoved;
  self->_currentBatchRemoved = v6;

  v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  currentRequiredCapabilities = self->_currentRequiredCapabilities;
  self->_currentRequiredCapabilities = v8;
}

- (void)parser:(id)a3 didFinishWithState:(int64_t)a4
{
  self->_doneParsing = 1;
  if (a4 != 2)
  {
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    currentBatchAdded = self->_currentBatchAdded;
    self->_currentBatchAdded = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    currentBatchRemoved = self->_currentBatchRemoved;
    self->_currentBatchRemoved = v7;

    uint64_t v9 = ASDLogHandleForCategory(14LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v13 = 138412290;
      *(void *)&v13[4] = objc_opt_class(self, v11);
      id v12 = *(id *)&v13[4];
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[%@]: Error decoding response",  v13,  0xCu);
    }
  }

  -[NSConditionLock unlockWithCondition:](self->_parsingLock, "unlockWithCondition:", 2LL, *(_OWORD *)v13);
}

- (void)parserDidCancel:(id)a3
{
  self->_doneParsing = 1;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  currentBatchAdded = self->_currentBatchAdded;
  self->_currentBatchAdded = v4;

  v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  currentBatchRemoved = self->_currentBatchRemoved;
  self->_currentBatchRemoved = v6;

  -[NSConditionLock unlockWithCondition:](self->_parsingLock, "unlockWithCondition:", 2LL);
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  self->_doneParsing = 1;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  currentBatchAdded = self->_currentBatchAdded;
  self->_currentBatchAdded = v5;

  v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  currentBatchRemoved = self->_currentBatchRemoved;
  self->_currentBatchRemoved = v7;

  -[NSConditionLock unlockWithCondition:](self->_parsingLock, "unlockWithCondition:", 2LL);
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1634362225)
  {
    if ((int)a4 > 1634952303)
    {
      if ((int)a4 > 1835819883)
      {
        if ((int)a4 <= 2002871400)
        {
          if (a4 != 1835819884 && a4 != 1835821428)
          {
            int v6 = 1836409964;
            goto LABEL_60;
          }

          return result;
        }

        if (a4 == 2002871401 || a4 == 2002874985) {
          return result;
        }
        int v6 = 2002876271;
LABEL_60:
        if (a4 != v6) {
          return 0;
        }
        return result;
      }

      if ((int)a4 > 1835624552)
      {
        if (a4 != 1835624553 && a4 != 1835625572)
        {
          int v6 = 1835626093;
          goto LABEL_60;
        }

        return result;
      }

      if (a4 == 1634952304) {
        return result;
      }
      unsigned __int16 v8 = 26478;
    }

    else
    {
      if ((int)a4 <= 1634364740)
      {
        if ((a4 - 1634363493 > 0xA || ((1 << (a4 - 101)) & 0x421) == 0) && a4 != 1634362226)
        {
          unsigned __int16 v5 = 26992;
          goto LABEL_43;
        }

        return result;
      }

      if ((int)a4 <= 1634366050)
      {
        if (a4 != 1634364741 && a4 != 1634364773)
        {
          unsigned __int16 v5 = 28789;
LABEL_43:
          int v6 = v5 | 0x616A0000;
          goto LABEL_60;
        }

        return result;
      }

      if (a4 == 1634366051 || a4 == 1634366060) {
        return result;
      }
      unsigned __int16 v8 = 24946;
    }

    int v6 = v8 | 0x61730000;
    goto LABEL_60;
  }

  if ((int)a4 <= 1634035307)
  {
    if ((int)a4 > 1634030191)
    {
      if ((int)a4 <= 1634030418)
      {
        if (a4 == 1634030192) {
          return result;
        }
        unsigned __int16 v7 = 21321;
      }

      else
      {
        if (a4 == 1634030419 || a4 == 1634034497) {
          return result;
        }
        unsigned __int16 v7 = 25430;
      }
    }

    else if ((int)a4 <= 1634027336)
    {
      if (a4 == 1633968755) {
        return result;
      }
      unsigned __int16 v7 = 16969;
    }

    else
    {
      if (a4 == 1634027337 || a4 == 1634028622) {
        return result;
      }
      unsigned __int16 v7 = 19819;
    }

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1835819883)
  {
    if (a4 != 1835819884 && a4 != 1835821428)
    {
      int v5 = 1836409964;
LABEL_8:
      if (a4 != v5) {
        return 0;
      }
    }
  }

  else if (a4 != 1633968755 && a4 != 1634035308)
  {
    int v5 = 1634366060;
    goto LABEL_8;
  }

  return result;
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1835821428)
  {
    unsigned __int16 v7 = objc_alloc_init(&OBJC_CLASS___ASDPurchaseHistoryApp);
    currentItem = self->_currentItem;
    self->_currentItem = v7;
  }

  self->_currentContainerCode = a4;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v19 = a3;
  if ((int)a4 <= 1634362225)
  {
    if ((int)a4 <= 1634036840)
    {
      if ((int)a4 <= 1634030191)
      {
        if ((int)a4 > 1634028621)
        {
          if (a4 == 1634028622)
          {
            v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
            -[ASDPurchaseHistoryApp setLongTitle:](self->_currentItem, "setLongTitle:", v10);
            goto LABEL_98;
          }

          if (a4 == 1634028907)
          {
            uint64_t v11 = bswap32(*(_DWORD *)a5);
            -[ASDPurchaseHistoryApp setMediaKind:](self->_currentItem, "setMediaKind:", v11);
            if ((_DWORD)v11 == 0x4000000) {
              -[ASDPurchaseHistoryApp setSupportsMac:](self->_currentItem, "setSupportsMac:", 1LL);
            }
          }
        }

        else
        {
          if (a4 == 1634026057)
          {
            v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
            -[ASDPurchaseHistoryApp setBundleID:](self->_currentItem, "setBundleID:", v10);
            goto LABEL_98;
          }

          if (a4 == 1634027337) {
            -[ASDPurchaseHistoryApp setGenreID:](self->_currentItem, "setGenreID:", bswap32(*(_DWORD *)a5));
          }
        }
      }

      else if ((int)a4 <= 1634030418)
      {
        if (a4 == 1634030192)
        {
          v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
          -[ASDPurchaseHistoryApp setRedownloadParams:](self->_currentItem, "setRedownloadParams:", v10);
          goto LABEL_98;
        }

        if (a4 == 1634030409) {
          -[ASDPurchaseHistoryApp setStoreItemID:]( self->_currentItem,  "setStoreItemID:",  (((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))
        }
          + a5[7]);
      }

      else
      {
        switch(a4)
        {
          case 0x61655353u:
            char v17 = a5[1];
            if ((v17 & 2) != 0) {
              -[ASDPurchaseHistoryApp setSupportsIPad:](self->_currentItem, "setSupportsIPad:", 1LL);
            }
            if ((v17 & 5) != 0) {
              -[ASDPurchaseHistoryApp setSupportsIPhone:](self->_currentItem, "setSupportsIPhone:", 1LL);
            }
            if ((v17 & 8) != 0) {
              -[ASDPurchaseHistoryApp setSupportsMac:](self->_currentItem, "setSupportsMac:", 1LL);
            }
            if ((v17 & 0x10) != 0) {
              -[ASDPurchaseHistoryApp setSupportsRealityDevice:](self->_currentItem, "setSupportsRealityDevice:", 1LL);
            }
            break;
          case 0x61656341u:
            v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
            -[ASDPurchaseHistoryApp setIconURLString:](self->_currentItem, "setIconURLString:", v10);
            goto LABEL_98;
          case 0x61656356u:
            v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
            -[ASDPurchaseHistoryApp setCircularIconURLString:](self->_currentItem, "setCircularIconURLString:", v10);
LABEL_98:

            goto LABEL_99;
        }
      }

      goto LABEL_99;
    }

    if ((int)a4 <= 1634354770)
    {
      if ((int)a4 > 1634038894)
      {
        if (a4 == 1634038895)
        {
          -[ASDPurchaseHistoryApp setPurchaseToken:](self->_currentItem, "setPurchaseToken:", bswap32(*(_DWORD *)a5));
        }

        else if (a4 == 1634354768)
        {
          -[ASDPurchaseHistoryApp setFirstParty:](self->_currentItem, "setFirstParty:", *a5 != 0);
        }
      }

      else if (a4 == 1634036841)
      {
        -[ASDPurchaseHistoryApp setSupportsLayeredImage:](self->_currentItem, "setSupportsLayeredImage:", *a5 != 0);
      }

      else if (a4 == 1634037811)
      {
        -[ASDPurchaseHistoryApp setHasP3:](self->_currentItem, "setHasP3:", *a5 != 0);
      }

      goto LABEL_99;
    }

    if ((int)a4 <= 1634357332)
    {
      if (a4 == 1634354771)
      {
        -[ASDPurchaseHistoryApp setFamilyShared:](self->_currentItem, "setFamilyShared:", *a5 != 0);
      }

      else if (a4 == 1634355570)
      {
        -[ASDPurchaseHistoryApp setOptedInForXROSEligibility:]( self->_currentItem,  "setOptedInForXROSEligibility:",  *a5 != 0);
      }

      goto LABEL_99;
    }

    if (a4 != 1634357333)
    {
      if (a4 == 1634358083)
      {
        -[ASDPurchaseHistoryApp setContentRatingFlags:]( self->_currentItem,  "setContentRatingFlags:",  __rev16(*(unsigned __int16 *)a5));
      }

      else if (a4 == 1634358114)
      {
        -[ASDPurchaseHistoryApp setIs32BitOnly:](self->_currentItem, "setIs32BitOnly:", *a5 != 0);
      }

      goto LABEL_99;
    }

    v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
    currentItem = self->_currentItem;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
    -[ASDPurchaseHistoryApp setProductURL:](currentItem, "setProductURL:", v13);
LABEL_97:

    goto LABEL_98;
  }

  if ((int)a4 <= 1634951537)
  {
    if ((int)a4 <= 1634363759)
    {
      if ((int)a4 > 1634363497)
      {
        if (a4 == 1634363498)
        {
          -[ASDPurchaseHistoryApp setHiddenFromSpringboard:](self->_currentItem, "setHiddenFromSpringboard:", *a5 != 0);
        }

        else if (a4 == 1634363503)
        {
          v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
          -[ASDPurchaseHistoryApp setOvalIconURLString:](self->_currentItem, "setOvalIconURLString:", v10);
          goto LABEL_98;
        }
      }

      else if (a4 == 1634362226)
      {
        -[ASDPurchaseHistoryApp setCurrentlyOptedInForXROSEligibility:]( self->_currentItem,  "setCurrentlyOptedInForXROSEligibility:",  *a5 != 0);
      }

      else if (a4 == 1634363493)
      {
        -[ASDPurchaseHistoryApp setHasMessagesExtension:](self->_currentItem, "setHasMessagesExtension:", *a5 != 0);
      }

      goto LABEL_99;
    }

    if ((int)a4 <= 1634364772)
    {
      if (a4 == 1634363760)
      {
        -[ASDPurchaseHistoryApp setIsPreorder:](self->_currentItem, "setIsPreorder:", *a5 != 0);
      }

      else if (a4 == 1634364741)
      {
        -[ASDPurchaseHistoryApp setCurrentlyOptedInForMacOSEligibility:]( self->_currentItem,  "setCurrentlyOptedInForMacOSEligibility:",  *a5 != 0);
      }

      goto LABEL_99;
    }

    if (a4 == 1634364773)
    {
      -[ASDPurchaseHistoryApp setOptedInForMacOSEligibility:]( self->_currentItem,  "setOptedInForMacOSEligibility:",  *a5 != 0);
      goto LABEL_99;
    }

    if (a4 != 1634365557)
    {
      if (a4 == 1634366051)
      {
        v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
        if (self->_currentContainerCode == 1634366060) {
          -[NSMutableArray addObject:](self->_currentRequiredCapabilities, "addObject:", v10);
        }
        goto LABEL_98;
      }

      goto LABEL_99;
    }

    v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
    id v12 = self->_currentItem;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
    -[ASDPurchaseHistoryApp setPreflightPackageURL:](v12, "setPreflightPackageURL:", v13);
    goto LABEL_97;
  }

  if ((int)a4 <= 1835625571)
  {
    if ((int)a4 > 1634953069)
    {
      if (a4 == 1634953070)
      {
        v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
        -[ASDPurchaseHistoryApp setGenreName:](self->_currentItem, "setGenreName:", v10);
        goto LABEL_98;
      }

      if (a4 == 1835624553) {
        -[ASDPurchaseHistoryApp setHidden:](self->_currentItem, "setHidden:", *a5 != 0);
      }
    }

    else
    {
      if (a4 == 1634951538)
      {
        v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
        -[ASDPurchaseHistoryApp setDeveloperName:](self->_currentItem, "setDeveloperName:", v10);
        goto LABEL_98;
      }

      if (a4 == 1634952304)
      {
        v10 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)bswap32(*(_DWORD *)a5)));
        -[ASDPurchaseHistoryApp setDatePurchased:](self->_currentItem, "setDatePurchased:", v10);
        goto LABEL_98;
      }
    }
  }

  else if ((int)a4 <= 2002871400)
  {
    if (a4 == 1835625572)
    {
      if (self->_currentContainerCode == 1836409964)
      {
        currentBatchRemoved = self->_currentBatchRemoved;
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v14));
        -[NSMutableArray addObject:](currentBatchRemoved, "addObject:", v16);

        sub_1002B3D20(self);
      }

      else
      {
        -[ASDPurchaseHistoryApp setLockerItemID:](self->_currentItem, "setLockerItemID:", v14);
      }
    }

    else if (a4 == 1835626093)
    {
      v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
      -[ASDPurchaseHistoryApp setTitle:](self->_currentItem, "setTitle:", v10);
      goto LABEL_98;
    }
  }

  else
  {
    switch(a4)
    {
      case 0x77616469u:
        -[ASDPurchaseHistoryApp setWatchAppDeliveredIniOSApp:]( self->_currentItem,  "setWatchAppDeliveredIniOSApp:",  *a5 != 0);
        break;
      case 0x77617269u:
        -[ASDPurchaseHistoryApp setWatchAppRunsIndependently:]( self->_currentItem,  "setWatchAppRunsIndependently:",  *a5 != 0);
        break;
      case 0x7761776Fu:
        -[ASDPurchaseHistoryApp setWatchOnly:](self->_currentItem, "setWatchOnly:", *a5 != 0);
        break;
    }
  }

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1634366060)
  {
    -[ASDPurchaseHistoryApp setRequiredCapabilities:]( self->_currentItem,  "setRequiredCapabilities:",  self->_currentRequiredCapabilities);
    v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    currentRequiredCapabilities = self->_currentRequiredCapabilities;
    self->_currentRequiredCapabilities = v10;
  }

  else if (a4 == 1835821428)
  {
    if (self->_errorParsingItem)
    {
      uint64_t v7 = ASDLogHandleForCategory(14LL);
      unsigned __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v14 = (void *)objc_opt_class(self, v9);
        currentItem = self->_currentItem;
        int v17 = 138412546;
        v18 = v14;
        __int16 v19 = 2112;
        v20 = currentItem;
        id v16 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[%@]: Error parsing item: %@",  (uint8_t *)&v17,  0x16u);
      }

      self->_errorParsingItem = 0;
    }

    else
    {
      -[NSMutableArray addObject:](self->_currentBatchAdded, "addObject:", self->_currentItem);
      unint64_t batchSize = self->_batchSize;
      unint64_t v13 = self->_currentBatchCount + 1;
      self->_currentBatchCount = v13;
      if (v13 >= batchSize)
      {
        -[NSConditionLock unlockWithCondition:](self->_parsingLock, "unlockWithCondition:", 2LL);
        -[NSConditionLock lockWhenCondition:](self->_parsingLock, "lockWhenCondition:", 1LL);
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end