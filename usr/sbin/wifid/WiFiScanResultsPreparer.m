@interface WiFiScanResultsPreparer
+ (BOOL)wifiNetworkShouldBeProminentlyDisplayed:(__WiFiNetwork *)a3;
- (BOOL)disableProminentFiltering;
- (NSArray)blacklistedSSIDs;
- (NSArray)preparedScanResults;
- (WiFiAvailabilityEngine)engine;
- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5;
- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5 disableProminentFiltering:(BOOL)a6;
- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5 disableProminentFiltering:(BOOL)a6 blacklistedSSIDs:(id)a7;
- (__WiFiDeviceManager)manager;
- (id)topRecommendableNetwork;
- (unint64_t)prominentScanResultsCount;
- (void)_prepareScanResults:(id)a3;
- (void)dealloc;
- (void)setBlacklistedSSIDs:(id)a3;
- (void)setDisableProminentFiltering:(BOOL)a3;
- (void)setEngine:(id)a3;
- (void)setManager:(__WiFiDeviceManager *)a3;
- (void)setPreparedScanResults:(id)a3;
- (void)setProminentScanResultsCount:(unint64_t)a3;
@end

@implementation WiFiScanResultsPreparer

- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5 disableProminentFiltering:(BOOL)a6
{
  return -[WiFiScanResultsPreparer initWithManager:availabilityEngine:scanResults:disableProminentFiltering:blacklistedSSIDs:]( self,  "initWithManager:availabilityEngine:scanResults:disableProminentFiltering:blacklistedSSIDs:",  a3,  a4,  a5,  a6,  0LL);
}

- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5
{
  return -[WiFiScanResultsPreparer initWithManager:availabilityEngine:scanResults:disableProminentFiltering:]( self,  "initWithManager:availabilityEngine:scanResults:disableProminentFiltering:",  a3,  a4,  a5,  0LL);
}

- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5 disableProminentFiltering:(BOOL)a6 blacklistedSSIDs:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___WiFiScanResultsPreparer;
  v12 = -[WiFiScanResultsPreparer init](&v15, "init");
  v13 = v12;
  if (!a3 || !v12)
  {
    if (!v12) {
      return v13;
    }
LABEL_7:
    CFRelease(v13);
    return 0LL;
  }

  v12->_manager = a3;
  CFRetain(a3);
  if (!a4) {
    goto LABEL_7;
  }
  v13->_engine = (WiFiAvailabilityEngine *)a4;
  v13->_disableProminentFiltering = a6;
  v13->_blacklistedSSIDs = (NSArray *)a7;
  -[WiFiScanResultsPreparer _prepareScanResults:](v13, "_prepareScanResults:", a5);
  return v13;
}

- (void)dealloc
{
  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiScanResultsPreparer;
  -[WiFiScanResultsPreparer dealloc](&v4, "dealloc");
}

- (void)_prepareScanResults:(id)a3
{
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)os_transaction_create("com.apple.wifid.WiFiScanResultsPreparer");
  if (a3 && [a3 count])
  {
    v29 = v6;
    v30 = v5;
    id v7 = [a3 mutableCopy];
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Find recommendations for %lu networks (disableProminentFiltering: %d)",  "-[WiFiScanResultsPreparer _prepareScanResults:]",  objc_msgSend(v7, "count"),  -[WiFiScanResultsPreparer disableProminentFiltering](self, "disableProminentFiltering"));
    }
    objc_autoreleasePoolPop(v8);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v34 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v34)
    {
      uint64_t v9 = *(void *)v43;
      id v32 = v7;
      v33 = self;
      uint64_t v31 = *(void *)v43;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v43 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v35 = v10;
          v11 = *(const void **)(*((void *)&v42 + 1) + 8 * v10);
          if (v11)
          {
            if (sub_1000D33E4(-[WiFiScanResultsPreparer manager](self, "manager"), v11)) {
              sub_10009582C((uint64_t)v11, @"WiFiNetworkAttributeIsKnown", kCFBooleanTrue);
            }
            if (!sub_1000971F8(v11))
            {
              v12 = -[WiFiScanObserverNetwork initWithWiFiNetworkRef:]( objc_alloc(&OBJC_CLASS___WiFiScanObserverNetwork),  "initWithWiFiNetworkRef:",  v11);
              if (v12)
              {
                v36 = v12;
                id v13 = -[WiFiAvailabilityEngine findRecommendationForScannedNetwork:]( -[WiFiScanResultsPreparer engine](self, "engine"),  "findRecommendationForScannedNetwork:",  v12);
                if (v13)
                {
                  v14 = v13;
                  objc_super v15 = objc_autoreleasePoolPush();
                  if (qword_100219F60) {
                    [(id)qword_100219F60 WFLog:3, "%s: recommendation for %@ (network %@)", "-[WiFiScanResultsPreparer _prepareScanResults:]", objc_msgSend(v14, "scannedNetwork"), objc_msgSend(v14, "network") message];
                  }
                  objc_autoreleasePoolPop(v15);
                  if ([v14 unwantedNetworkName])
                  {
                    v16 = objc_autoreleasePoolPush();
                    if (qword_100219F60) {
                      [(id)qword_100219F60 WFLog:3, "%s: %@ contains unwantedNetworkName", "-[WiFiScanResultsPreparer _prepareScanResults:]", -[WiFiScanObserverNetwork SSID](v36, "SSID") message];
                    }
                    objc_autoreleasePoolPop(v16);
                  }

                  if (objc_msgSend(objc_msgSend(v14, "network"), "attributes"))
                  {
                    __int128 v40 = 0u;
                    __int128 v41 = 0u;
                    __int128 v38 = 0u;
                    __int128 v39 = 0u;
                    id v17 = objc_msgSend(objc_msgSend(v14, "network"), "attributes");
                    id v18 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
                    if (v18)
                    {
                      id v19 = v18;
                      uint64_t v20 = *(void *)v39;
                      v37 = v11;
LABEL_25:
                      uint64_t v21 = 0LL;
                      while (2)
                      {
                        if (*(void *)v39 != v20) {
                          objc_enumerationMutation(v17);
                        }
                        switch([*(id *)(*((void *)&v38 + 1) + 8 * v21) intValue])
                        {
                          case 1u:
                            uint64_t v22 = (uint64_t)v11;
                            v23 = @"WiFiNetworkAttributeIsPotentiallyCaptive";
                            goto LABEL_39;
                          case 2u:
                            uint64_t v22 = (uint64_t)v11;
                            v23 = @"WiFiNetworkAttributeIsSuspicious";
                            goto LABEL_39;
                          case 4u:
                            uint64_t v22 = (uint64_t)v11;
                            v23 = @"WiFiNetworkAttributeIsTCPGood";
                            goto LABEL_39;
                          case 5u:
                            uint64_t v22 = (uint64_t)v11;
                            v23 = @"WiFiNetworkAttributeIsPotentiallyMoving";
                            goto LABEL_39;
                          case 6u:
                            if ([v14 unwantedNetworkName])
                            {
                              v24 = objc_autoreleasePoolPush();
                              if (qword_100219F60) {
                                [(id)qword_100219F60 WFLog:3, "%s: %@ contains unwantedNetworkName, discarding public flag", "-[WiFiScanResultsPreparer _prepareScanResults:]", -[WiFiScanObserverNetwork SSID](v36, "SSID") message];
                              }
                              objc_autoreleasePoolPop(v24);
                              v11 = v37;
                            }

                            else
                            {
                              uint64_t v22 = (uint64_t)v11;
                              v23 = @"WiFiNetworkAttributeIsPublic";
LABEL_39:
                              sub_10009582C(v22, v23, kCFBooleanTrue);
                            }

+ (BOOL)wifiNetworkShouldBeProminentlyDisplayed:(__WiFiNetwork *)a3
{
  if (sub_1000951FC((uint64_t)a3, @"WiFiNetworkAttributeIsKnown")
    || sub_1000951FC((uint64_t)a3, @"WiFiNetworkAttributeIsPublic"))
  {
    goto LABEL_9;
  }

  if (sub_1000951FC((uint64_t)a3, @"WiFiNetworkAttributeLowPopularity")
    || sub_1000951FC((uint64_t)a3, @"WiFiNetworkAttributeIsSuspicious"))
  {
    goto LABEL_12;
  }

  if (sub_1000951FC((uint64_t)a3, @"WiFiNetworkAttributeHighQuality"))
  {
LABEL_9:
    LOBYTE(v4) = 1;
    return (char)v4;
  }

  if (sub_10009F494((uint64_t)a3) == 1)
  {
LABEL_12:
    LOBYTE(v4) = 0;
    return (char)v4;
  }

  LODWORD(v4) = sub_100098EA8((uint64_t)a3);
  if ((_DWORD)v4)
  {
    objc_super v4 = sub_1000951FC((uint64_t)a3, @"WiFiNetworkAttributeLowPopularity");
    if (v4) {
      goto LABEL_9;
    }
  }

  return (char)v4;
}

- (id)topRecommendableNetwork
{
  if (!-[WiFiScanResultsPreparer prominentScanResultsCount](self, "prominentScanResultsCount")) {
    return 0LL;
  }
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  v3 = -[WiFiScanResultsPreparer preparedScanResults](self, "preparedScanResults");
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v43,  v48,  16LL);
  if (!v4) {
    goto LABEL_58;
  }
  id v5 = v4;
  v36 = self;
  v37 = 0LL;
  __int128 v38 = 0LL;
  uint64_t v6 = *(void *)v44;
  do
  {
    id v7 = 0LL;
    do
    {
      if (*(void *)v44 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(const void **)(*((void *)&v43 + 1) + 8LL * (void)v7);
      if (v8)
      {
        if (!sub_100098EA8(*(void *)(*((void *)&v43 + 1) + 8LL * (void)v7))
          && (int)sub_100096BF4((uint64_t)v8, @"RSSI") >= -75
          && !sub_10009E558((uint64_t)v8))
        {
          if (sub_1000951FC((uint64_t)v8, @"WiFiNetworkAttributeProminentDisplay"))
          {
            if (!sub_1000951FC((uint64_t)v8, @"WiFiNetworkAttributeIsKnown")
              && !sub_1000951FC((uint64_t)v8, @"WiFiNetworkAttributeIsNotRecommendable"))
            {
              uint64_t v9 = sub_100096BF4((uint64_t)v8, @"WiFiNetworkAttributeSource");
              if (v9)
              {
                uint64_t v10 = v9;
                v11 = sub_100095BC8(v8);
                if (v11
                  && (v12 = v11,
                      -[NSArray containsObject:]( -[WiFiScanResultsPreparer blacklistedSSIDs](v36, "blacklistedSSIDs"),  "containsObject:",  v11)))
                {
                  id v13 = objc_autoreleasePoolPush();
                  if (qword_100219F60) {
                    [(id)qword_100219F60 WFLog:3, "%s: skipping %@ as it's blacklisted from recommendation", "-[WiFiScanResultsPreparer topRecommendableNetwork]", v12 message];
                  }
                  objc_autoreleasePoolPop(v13);
                }

                else if (v10 == (const __CFNumber *)1)
                {
                  if (!v38) {
                    goto LABEL_37;
                  }
                  v14 = sub_100096BF4((uint64_t)v38, @"RSSI");
                }

                else
                {
                  objc_super v15 = sub_100096BF4((uint64_t)v8, @"WiFiNetworkAttributePopularityScore");
                  if ((uint64_t)v15 >= (uint64_t)v37)
                  {
                    if ((v16 = v15, !v38)
                      || !v37
                      || v15 != v37
                      || (sub_100098EA8((uint64_t)v38)
                       || sub_100098EA8((uint64_t)v8)
                       || (uint64_t v35 = sub_100096BF4((uint64_t)v38, @"RSSI"),
                           (uint64_t)v35 <= (uint64_t)sub_100096BF4((uint64_t)v8, @"RSSI")))
                      && (sub_100098EA8((uint64_t)v38) || !sub_100098EA8((uint64_t)v8)))
                    {
                      v37 = v16;
LABEL_37:
                      __int128 v38 = v8;
                    }
                  }
                }
              }
            }
          }
        }
      }

      id v7 = (char *)v7 + 1;
    }

    while (v5 != v7);
    id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v43,  v48,  16LL);
    id v5 = v17;
  }

  while (v17);
  if (!v38)
  {
LABEL_58:
    v27 = objc_autoreleasePoolPush();
    v28 = (void *)qword_100219F60;
    if (!qword_100219F60)
    {
LABEL_61:
      objc_autoreleasePoolPop(v27);
      return 0LL;
    }

    v29 = "%s: no prominent network found";
LABEL_60:
    objc_msgSend(v28, "WFLog:message:", 3, v29, "-[WiFiScanResultsPreparer topRecommendableNetwork]", v33, v34);
    goto LABEL_61;
  }

  if (sub_100098EA8((uint64_t)v38))
  {
    v27 = objc_autoreleasePoolPush();
    uint64_t v32 = qword_100219F60;
    if (!qword_100219F60) {
      goto LABEL_61;
    }
    v33 = sub_100095BC8(v38);
    id v34 = v37;
    v29 = "%s: prominent network (%@) is not open (score %ld)";
    goto LABEL_79;
  }

  if (!v37)
  {
    v27 = objc_autoreleasePoolPush();
    uint64_t v32 = qword_100219F60;
    if (!qword_100219F60) {
      goto LABEL_61;
    }
    v33 = sub_100095BC8(v38);
    id v34 = 0LL;
    v29 = "%s: prominent network (%@) has no popularity score (score %ld)";
LABEL_79:
    v28 = (void *)v32;
    goto LABEL_60;
  }

- (__WiFiDeviceManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiDeviceManager *)a3
{
  self->_manager = a3;
}

- (NSArray)preparedScanResults
{
  return self->_preparedScanResults;
}

- (void)setPreparedScanResults:(id)a3
{
}

- (unint64_t)prominentScanResultsCount
{
  return self->_prominentScanResultsCount;
}

- (void)setProminentScanResultsCount:(unint64_t)a3
{
  self->_prominentScanResultsCount = a3;
}

- (NSArray)blacklistedSSIDs
{
  return self->_blacklistedSSIDs;
}

- (void)setBlacklistedSSIDs:(id)a3
{
}

- (WiFiAvailabilityEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (BOOL)disableProminentFiltering
{
  return self->_disableProminentFiltering;
}

- (void)setDisableProminentFiltering:(BOOL)a3
{
  self->_disableProminentFiltering = a3;
}

@end