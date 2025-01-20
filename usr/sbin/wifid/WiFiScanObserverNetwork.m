@interface WiFiScanObserverNetwork
- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3;
- (BOOL)matched;
- (NSArray)essMembers;
- (NSDictionary)scanProperties;
- (NSSet)accessPoints;
- (NSSet)attributes;
- (NSString)BSSID;
- (NSString)SSID;
- (NSString)description;
- (NSString)password;
- (TBScore)popularityScore;
- (TBScore)qualityScore;
- (WiFiScanObserverNetwork)initWithWiFiNetworkRef:(__WiFiNetwork *)a3;
- (int64_t)RSSI;
- (int64_t)source;
- (unint64_t)type;
- (unint64_t)venueGroup;
- (unsigned)venueType;
- (void)dealloc;
- (void)setBSSID:(id)a3;
- (void)setEssMembers:(id)a3;
- (void)setMatched:(BOOL)a3;
- (void)setRSSI:(int64_t)a3;
- (void)setSSID:(id)a3;
- (void)setScanProperties:(id)a3;
@end

@implementation WiFiScanObserverNetwork

- (WiFiScanObserverNetwork)initWithWiFiNetworkRef:(__WiFiNetwork *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___WiFiScanObserverNetwork;
  v4 = -[WiFiScanObserverNetwork init](&v22, "init");
  result = 0LL;
  if (a3)
  {
    if (v4)
    {
      result = (WiFiScanObserverNetwork *)sub_100095BC8(a3);
      v4->_SSID = (NSString *)&result->super.isa;
      if (result)
      {
        v6 = result;
        v7 = sub_100096968((const __CFArray *)a3);
        v8 = sub_100013210(v7);
        if (v8) {
          v4->_BSSID = v8;
        }
        v4->_scanProperties = (NSDictionary *)sub_100012CEC((uint64_t)a3);
        v9 = (void *)sub_1000969E4(a3);
        if (v9)
        {
          v10 = v9;
          if ([v9 count])
          {
            __int128 v20 = 0u;
            __int128 v21 = 0u;
            __int128 v18 = 0u;
            __int128 v19 = 0u;
            id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
            if (v11)
            {
              id v12 = v11;
              v13 = 0LL;
              uint64_t v14 = *(void *)v19;
              do
              {
                for (i = 0LL; i != v12; i = (char *)i + 1)
                {
                  if (*(void *)v19 != v14) {
                    objc_enumerationMutation(v10);
                  }
                  v16 = sub_100013210(*(void **)(*((void *)&v18 + 1) + 8LL * (void)i));
                  if (v16)
                  {
                    v17 = v16;
                    if (!-[NSString isEqualToString:](v4->_BSSID, "isEqualToString:", v16))
                    {
                      if (!v13) {
                        v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                      }
                      -[NSMutableArray addObject:](v13, "addObject:", v17);
                    }
                  }
                }

                id v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
              }

              while (v12);
            }

            else
            {
              v13 = 0LL;
            }

            if (-[NSMutableArray count](v13, "count")) {
              v4->_essMembers = &v13->super;
            }
            else {
          }
            }
        }

        v4->_RSSI = (int)sub_100096BD0((const __CFNumber *)a3);
        return v4;
      }
    }
  }

  return result;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ : %p ",  NSStringFromClass(v3),  self);
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"SSID='%@' ",  -[WiFiScanObserverNetwork SSID](self, "SSID"));
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"BSSID='%@' ",  -[WiFiScanObserverNetwork BSSID](self, "BSSID"));
  -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"RSSI=%ld",  -[WiFiScanObserverNetwork RSSI](self, "RSSI"));
  -[NSMutableString appendString:](v4, "appendString:", @">");
  return &v4->super;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiScanObserverNetwork;
  -[WiFiScanObserverNetwork dealloc](&v3, "dealloc");
}

- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3
{
  return 0;
}

- (NSString)password
{
  return self->password;
}

- (int64_t)source
{
  return self->source;
}

- (NSSet)accessPoints
{
  return self->accessPoints;
}

- (NSSet)attributes
{
  return self->attributes;
}

- (TBScore)popularityScore
{
  return self->popularityScore;
}

- (TBScore)qualityScore
{
  return self->qualityScore;
}

- (BOOL)matched
{
  return self->matched;
}

- (void)setMatched:(BOOL)a3
{
  self->matched = a3;
}

- (unint64_t)type
{
  return self->type;
}

- (unint64_t)venueGroup
{
  return self->venueGroup;
}

- (unsigned)venueType
{
  return self->venueType;
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int64_t)a3
{
  self->_RSSI = a3;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
}

- (NSDictionary)scanProperties
{
  return self->_scanProperties;
}

- (void)setScanProperties:(id)a3
{
}

- (NSArray)essMembers
{
  return self->_essMembers;
}

- (void)setEssMembers:(id)a3
{
}

@end