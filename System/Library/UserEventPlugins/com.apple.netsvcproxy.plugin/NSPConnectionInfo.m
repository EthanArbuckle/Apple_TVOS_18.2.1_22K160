@interface NSPConnectionInfo
+ (BOOL)shouldMoveToNextEdgeForFallbackReason:(int64_t)a3;
+ (BOOL)shouldResolveForFallbackReason:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)getFallbackReasonDescription:(int64_t)a3;
+ (int)fallbackReasonToErrno:(int64_t)a3;
- (BOOL)TFOSucceeded;
- (BOOL)isMultipath;
- (BOOL)isTFOProbeSucceeded;
- (NSArray)timingIntervals;
- (NSDate)firstTxByteTimeStamp;
- (NSDictionary)TCPInfo;
- (NSDictionary)exceptions;
- (NSDictionary)multipathSubflowSwitchCounts;
- (NSPConnectionInfo)initWithCoder:(id)a3;
- (NSString)edgeAddress;
- (NSString)interfaceName;
- (double)connectionDelay;
- (double)fallbackDelay;
- (double)firstTxByteDelay;
- (double)timeIntervalSinceLastUsage;
- (double)timeToFirstByte;
- (id)copyDictionary;
- (id)timingIntervalAtIndex:(unint64_t)a3 forKey:(id)a4;
- (int64_t)IPType;
- (int64_t)edgeType;
- (int64_t)fallbackReason;
- (int64_t)fallbackReasonCategory;
- (int64_t)interfaceType;
- (int64_t)pathType;
- (int64_t)tunnelConnectionError;
- (unint64_t)initialBytesLeftOver;
- (unint64_t)minimumRTT;
- (unint64_t)multipathConnectedSubflowCount;
- (unint64_t)multipathPrimarySubflowInterfaceIndex;
- (unint64_t)multipathSubflowCount;
- (void)encodeWithCoder:(id)a3;
- (void)setConnectionDelay:(double)a3;
- (void)setEdgeAddress:(id)a3;
- (void)setEdgeType:(int64_t)a3;
- (void)setExceptions:(id)a3;
- (void)setFallbackDelay:(double)a3;
- (void)setFallbackReason:(int64_t)a3;
- (void)setFirstTxByteDelay:(double)a3;
- (void)setFirstTxByteTimeStamp:(id)a3;
- (void)setIPType:(int64_t)a3;
- (void)setInitialBytesLeftOver:(unint64_t)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInterfaceType:(int64_t)a3;
- (void)setIsMultipath:(BOOL)a3;
- (void)setIsTFOProbeSucceeded:(BOOL)a3;
- (void)setMinimumRTT:(unint64_t)a3;
- (void)setMultipathConnectedSubflowCount:(unint64_t)a3;
- (void)setMultipathPrimarySubflowInterfaceIndex:(unint64_t)a3;
- (void)setMultipathSubflowCount:(unint64_t)a3;
- (void)setMultipathSubflowSwitchCounts:(id)a3;
- (void)setPathType:(int64_t)a3;
- (void)setTCPInfo:(id)a3;
- (void)setTFOSucceeded:(BOOL)a3;
- (void)setTimeIntervalSinceLastUsage:(double)a3;
- (void)setTimeToFirstByte:(double)a3;
- (void)setTimingIntervals:(id)a3;
- (void)setTunnelConnectionError:(int64_t)a3;
@end

@implementation NSPConnectionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPConnectionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NSPConnectionInfo;
  v5 = -[NSPConnectionInfo init](&v29, "init");
  if (v5)
  {
    v5->_pathType = (int64_t)[v4 decodeIntegerForKey:@"pathType"];
    v5->_fallbackReason = (int64_t)[v4 decodeIntegerForKey:@"fallbackReason"];
    v5->_fallbackReasonCategory = (int64_t)[v4 decodeIntegerForKey:@"fallbackCategory"];
    [v4 decodeDoubleForKey:@"fallbackDelay"];
    v5->_fallbackDelay = v6;
    v5->_edgeType = (int64_t)[v4 decodeIntegerForKey:@"edgeType"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"edgeAddress"];
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    edgeAddress = v5->_edgeAddress;
    v5->_edgeAddress = (NSString *)v8;

    v5->_isMultipath = [v4 decodeBoolForKey:@"isMultipath"];
    v5->_multipathSubflowCount = (unint64_t)[v4 decodeIntegerForKey:@"multipathSubflowCountKey"];
    v5->_multipathConnectedSubflowCount = (unint64_t)[v4 decodeIntegerForKey:@"multipathConnectedSubflowCountKey"];
    v5->_multipathPrimarySubflowInterfaceIndex = (unint64_t)[v4 decodeIntegerForKey:@"multipathPrimarySubflowInterfaceIndex"];
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
    v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  v11,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v13 forKey:@"multipathSubflowSwitchCounts"]);
    multipathSubflowSwitchCounts = v5->_multipathSubflowSwitchCounts;
    v5->_multipathSubflowSwitchCounts = (NSDictionary *)v14;

    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
    v18 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v16,  v17,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v19 forKey:@"TCPInfo"]);
    TCPInfo = v5->_TCPInfo;
    v5->_TCPInfo = (NSDictionary *)v20;

    id v22 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"firstTxByteTimeStamp"];
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
    firstTxByteTimeStamp = v5->_firstTxByteTimeStamp;
    v5->_firstTxByteTimeStamp = (NSDate *)v23;

    [v4 decodeDoubleForKey:@"firstTxByteDelay"];
    v5->_firstTxByteDelay = v25;
    [v4 decodeDoubleForKey:@"connectionDelay"];
    v5->_connectionDelay = v26;
    v5->_TFOSucceeded = [v4 decodeBoolForKey:@"TFOSucceeded"];
    v5->_IPType = (int64_t)[v4 decodeIntegerForKey:@"IPType"];
    v5->_interfaceType = (int64_t)[v4 decodeIntegerForKey:@"interfaceType"];
    [v4 decodeDoubleForKey:@"timeIntervalSinceLastUsage"];
    v5->_timeIntervalSinceLastUsage = v27;
    v5->_timeToFirstByte = (double)(uint64_t)[v4 decodeIntegerForKey:@"timeToFirstByte"];
    v5->_tunnelConnectionError = (int64_t)[v4 decodeIntegerForKey:@"tunnelConnectionError"];
    v5->_isTFOProbeSucceeded = [v4 decodeBoolForKey:@"isTFOProbeSucceeded"];
    v5->_initialBytesLeftOver = (unint64_t)[v4 decodeIntegerForKey:@"initialBytesLeftOver"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo pathType](self, "pathType"), @"pathType");
  objc_msgSend( v8,  "encodeInteger:forKey:",  -[NSPConnectionInfo fallbackReason](self, "fallbackReason"),  @"fallbackReason");
  objc_msgSend( v8,  "encodeInteger:forKey:",  -[NSPConnectionInfo fallbackReasonCategory](self, "fallbackReasonCategory"),  @"fallbackCategory");
  -[NSPConnectionInfo fallbackDelay](self, "fallbackDelay");
  objc_msgSend(v8, "encodeDouble:forKey:", @"fallbackDelay");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo edgeType](self, "edgeType"), @"edgeType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo edgeAddress](self, "edgeAddress"));
  [v8 encodeObject:v4 forKey:@"edgeAddress"];

  objc_msgSend(v8, "encodeBool:forKey:", -[NSPConnectionInfo isMultipath](self, "isMultipath"), @"isMultipath");
  objc_msgSend( v8,  "encodeInteger:forKey:",  -[NSPConnectionInfo multipathSubflowCount](self, "multipathSubflowCount"),  @"multipathSubflowCountKey");
  objc_msgSend( v8,  "encodeInteger:forKey:",  -[NSPConnectionInfo multipathConnectedSubflowCount](self, "multipathConnectedSubflowCount"),  @"multipathConnectedSubflowCountKey");
  objc_msgSend( v8,  "encodeInteger:forKey:",  -[NSPConnectionInfo multipathPrimarySubflowInterfaceIndex](self, "multipathPrimarySubflowInterfaceIndex"),  @"multipathPrimarySubflowInterfaceIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo multipathSubflowSwitchCounts](self, "multipathSubflowSwitchCounts"));
  [v8 encodeObject:v5 forKey:@"multipathSubflowSwitchCounts"];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo TCPInfo](self, "TCPInfo"));
  [v8 encodeObject:v6 forKey:@"TCPInfo"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo firstTxByteTimeStamp](self, "firstTxByteTimeStamp"));
  [v8 encodeObject:v7 forKey:@"firstTxByteTimeStamp"];

  -[NSPConnectionInfo firstTxByteDelay](self, "firstTxByteDelay");
  objc_msgSend(v8, "encodeDouble:forKey:", @"firstTxByteDelay");
  -[NSPConnectionInfo connectionDelay](self, "connectionDelay");
  objc_msgSend(v8, "encodeDouble:forKey:", @"connectionDelay");
  objc_msgSend(v8, "encodeBool:forKey:", -[NSPConnectionInfo TFOSucceeded](self, "TFOSucceeded"), @"TFOSucceeded");
  objc_msgSend(v8, "encodeInteger:forKey:", -[NSPConnectionInfo IPType](self, "IPType"), @"IPType");
  objc_msgSend( v8,  "encodeInteger:forKey:",  -[NSPConnectionInfo interfaceType](self, "interfaceType"),  @"interfaceType");
  -[NSPConnectionInfo timeIntervalSinceLastUsage](self, "timeIntervalSinceLastUsage");
  objc_msgSend(v8, "encodeDouble:forKey:", @"timeIntervalSinceLastUsage");
  -[NSPConnectionInfo timeToFirstByte](self, "timeToFirstByte");
  objc_msgSend(v8, "encodeDouble:forKey:", @"timeToFirstByte");
  objc_msgSend( v8,  "encodeInteger:forKey:",  -[NSPConnectionInfo tunnelConnectionError](self, "tunnelConnectionError"),  @"tunnelConnectionError");
  objc_msgSend( v8,  "encodeBool:forKey:",  -[NSPConnectionInfo isTFOProbeSucceeded](self, "isTFOProbeSucceeded"),  @"isTFOProbeSucceeded");
  objc_msgSend( v8,  "encodeInteger:forKey:",  -[NSPConnectionInfo initialBytesLeftOver](self, "initialBytesLeftOver"),  @"initialBytesLeftOver");
}

- (id)copyDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  -[NSPConnectionInfo pathType](self, "pathType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"pathType");

  v5 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  -[NSPConnectionInfo fallbackReason](self, "fallbackReason"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"fallbackReason");

  double v6 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  -[NSPConnectionInfo fallbackReasonCategory](self, "fallbackReasonCategory"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"fallbackCategory");

  id v7 = objc_alloc(&OBJC_CLASS___NSNumber);
  -[NSPConnectionInfo fallbackDelay](self, "fallbackDelay");
  id v8 = -[NSNumber initWithDouble:](v7, "initWithDouble:");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"fallbackDelay");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo edgeAddress](self, "edgeAddress"));
  if (v9)
  {
    uint64_t v10 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  -[NSPConnectionInfo edgeType](self, "edgeType"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, @"edgeType");

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo edgeAddress](self, "edgeAddress"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"edgeAddress");
  }

  if (-[NSPConnectionInfo isMultipath](self, "isMultipath"))
  {
    v12 = -[NSNumber initWithBool:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithBool:",  -[NSPConnectionInfo isMultipath](self, "isMultipath"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, @"isMultipath");

    v13 = -[NSNumber initWithUnsignedInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInteger:",  -[NSPConnectionInfo multipathSubflowCount](self, "multipathSubflowCount"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v13,  @"multipathSubflowCountKey");

    uint64_t v14 = -[NSNumber initWithUnsignedInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInteger:",  -[NSPConnectionInfo multipathConnectedSubflowCount](self, "multipathConnectedSubflowCount"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  @"multipathConnectedSubflowCountKey");

    v15 = -[NSNumber initWithUnsignedInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInteger:",  -[NSPConnectionInfo multipathPrimarySubflowInterfaceIndex](self, "multipathPrimarySubflowInterfaceIndex"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v15,  @"multipathPrimarySubflowInterfaceIndex");

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo multipathSubflowSwitchCounts](self, "multipathSubflowSwitchCounts"));
    id v17 = [v16 count];

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo multipathSubflowSwitchCounts](self, "multipathSubflowSwitchCounts"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v18,  @"multipathSubflowSwitchCounts");
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo TCPInfo](self, "TCPInfo"));
  id v20 = [v19 count];

  if (v20)
  {
    v57 = self;
    v58 = v3;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo TCPInfo](self, "TCPInfo"));
    id v22 = [v21 mutableCopy];

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v23 = v22;
    id v24 = [v23 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v60 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)i);
          objc_super v29 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v28]);
          if ([v29 length] == &stru_158.flags)
          {
            v30 = (char *)[v29 bytes];
            v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            v32 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  *(void *)(v30 + 100));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v32,  @"rxPackets");

            v33 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  *(void *)(v30 + 108));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v33,  @"rxBytes");

            v34 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  *(void *)(v30 + 68));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v34,  @"txPackets");

            v35 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  *(void *)(v30 + 76));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v35,  @"txBytes");

            v36 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  *(void *)(v30 + 84));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v36,  @"retransmitBytes");

            v37 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  *(void *)(v30 + 284));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v37,  @"retransmitPackets");

            v38 = -[NSDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:",  v31);
            [v23 setObject:v38 forKeyedSubscript:v28];
          }
        }

        id v25 = [v23 countByEnumeratingWithState:&v59 objects:v63 count:16];
      }

      while (v25);
    }

    v39 = -[NSDictionary initWithDictionary:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithDictionary:", v23);
    v3 = v58;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", v39, @"TCPInfo");

    self = v57;
  }

  v40 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  -[NSPConnectionInfo interfaceType](self, "interfaceType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v40, @"interfaceType");

  v41 = -[NSNumber initWithBool:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithBool:",  -[NSPConnectionInfo isTFOProbeSucceeded](self, "isTFOProbeSucceeded"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v41,  @"isTFOProbeSucceeded");

  v42 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  -[NSPConnectionInfo tunnelConnectionError](self, "tunnelConnectionError"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v42,  @"tunnelConnectionError");

  if ((char *)-[NSPConnectionInfo pathType](self, "pathType") == (char *)&dword_0 + 1)
  {
    v43 = objc_alloc(&OBJC_CLASS___NSNumber);
    -[NSPConnectionInfo firstTxByteDelay](self, "firstTxByteDelay");
    v44 = -[NSNumber initWithDouble:](v43, "initWithDouble:");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v44,  @"firstTxByteDelay");

    v45 = objc_alloc(&OBJC_CLASS___NSNumber);
    -[NSPConnectionInfo connectionDelay](self, "connectionDelay");
    v46 = -[NSNumber initWithDouble:](v45, "initWithDouble:");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v46,  @"connectionDelay");

    v47 = -[NSNumber initWithBool:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithBool:",  -[NSPConnectionInfo TFOSucceeded](self, "TFOSucceeded"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v47, @"TFOSucceeded");

    v48 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  -[NSPConnectionInfo IPType](self, "IPType"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v48, @"IPType");

    v49 = -[NSNumber initWithUnsignedInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInteger:",  -[NSPConnectionInfo minimumRTT](self, "minimumRTT"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v49, @"minimumRTT");

    v50 = objc_alloc(&OBJC_CLASS___NSNumber);
    -[NSPConnectionInfo timeIntervalSinceLastUsage](self, "timeIntervalSinceLastUsage");
    v51 = -[NSNumber initWithDouble:](v50, "initWithDouble:");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v51,  @"timeIntervalSinceLastUsage");

    v52 = objc_alloc(&OBJC_CLASS___NSNumber);
    -[NSPConnectionInfo timeToFirstByte](self, "timeToFirstByte");
    v53 = -[NSNumber initWithDouble:](v52, "initWithDouble:");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v53,  @"timeToFirstByte");

    v54 = -[NSNumber initWithUnsignedInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInteger:",  -[NSPConnectionInfo initialBytesLeftOver](self, "initialBytesLeftOver"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v54,  @"initialBytesLeftOver");
  }

  v55 = -[NSDictionary initWithDictionary:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithDictionary:", v3);

  return v55;
}

+ (id)getFallbackReasonDescription:(int64_t)a3
{
  else {
    return *(&off_145E8 + a3);
  }
}

+ (int)fallbackReasonToErrno:(int64_t)a3
{
  else {
    return *(_DWORD *)&::a3[4 * a3 - 4];
  }
}

- (void)setFallbackReason:(int64_t)a3
{
  self->_fallbackReason = a3;
}

- (int64_t)fallbackReason
{
  return self->_fallbackReason;
}

+ (BOOL)shouldMoveToNextEdgeForFallbackReason:(int64_t)a3
{
  return ((unint64_t)a3 < 0x24) & (0x808C00026uLL >> a3);
}

+ (BOOL)shouldResolveForFallbackReason:(int64_t)a3
{
  BOOL result = +[NSPConnectionInfo shouldMoveToNextEdgeForFallbackReason:]( &OBJC_CLASS___NSPConnectionInfo,  "shouldMoveToNextEdgeForFallbackReason:");
  if (a3 == 4) {
    return 1;
  }
  return result;
}

- (id)timingIntervalAtIndex:(unint64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo timingIntervals](self, "timingIntervals"));
  id v8 = [v7 count];

  if ((unint64_t)v8 <= a3)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConnectionInfo timingIntervals](self, "timingIntervals"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:a3]);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v6]);
  }

  return v11;
}

- (int64_t)pathType
{
  return self->_pathType;
}

- (void)setPathType:(int64_t)a3
{
  self->_pathType = a3;
}

- (int64_t)fallbackReasonCategory
{
  return self->_fallbackReasonCategory;
}

- (double)fallbackDelay
{
  return self->_fallbackDelay;
}

- (void)setFallbackDelay:(double)a3
{
  self->_fallbackDelay = a3;
}

- (int64_t)edgeType
{
  return self->_edgeType;
}

- (void)setEdgeType:(int64_t)a3
{
  self->_edgeType = a3;
}

- (NSString)edgeAddress
{
  return self->_edgeAddress;
}

- (void)setEdgeAddress:(id)a3
{
}

- (BOOL)isMultipath
{
  return self->_isMultipath;
}

- (void)setIsMultipath:(BOOL)a3
{
  self->_isMultipath = a3;
}

- (unint64_t)multipathSubflowCount
{
  return self->_multipathSubflowCount;
}

- (void)setMultipathSubflowCount:(unint64_t)a3
{
  self->_multipathSubflowCount = a3;
}

- (unint64_t)multipathConnectedSubflowCount
{
  return self->_multipathConnectedSubflowCount;
}

- (void)setMultipathConnectedSubflowCount:(unint64_t)a3
{
  self->_multipathConnectedSubflowCount = a3;
}

- (unint64_t)multipathPrimarySubflowInterfaceIndex
{
  return self->_multipathPrimarySubflowInterfaceIndex;
}

- (void)setMultipathPrimarySubflowInterfaceIndex:(unint64_t)a3
{
  self->_multipathPrimarySubflowInterfaceIndex = a3;
}

- (NSDictionary)multipathSubflowSwitchCounts
{
  return self->_multipathSubflowSwitchCounts;
}

- (void)setMultipathSubflowSwitchCounts:(id)a3
{
}

- (NSDictionary)TCPInfo
{
  return self->_TCPInfo;
}

- (void)setTCPInfo:(id)a3
{
}

- (NSDate)firstTxByteTimeStamp
{
  return self->_firstTxByteTimeStamp;
}

- (void)setFirstTxByteTimeStamp:(id)a3
{
}

- (double)firstTxByteDelay
{
  return self->_firstTxByteDelay;
}

- (void)setFirstTxByteDelay:(double)a3
{
  self->_firstTxByteDelay = a3;
}

- (double)connectionDelay
{
  return self->_connectionDelay;
}

- (void)setConnectionDelay:(double)a3
{
  self->_connectionDelay = a3;
}

- (BOOL)TFOSucceeded
{
  return self->_TFOSucceeded;
}

- (void)setTFOSucceeded:(BOOL)a3
{
  self->_TFOSucceeded = a3;
}

- (int64_t)IPType
{
  return self->_IPType;
}

- (void)setIPType:(int64_t)a3
{
  self->_IPType = a3;
}

- (int64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(int64_t)a3
{
  self->_interfaceType = a3;
}

- (unint64_t)minimumRTT
{
  return self->_minimumRTT;
}

- (void)setMinimumRTT:(unint64_t)a3
{
  self->_minimumRTT = a3;
}

- (double)timeIntervalSinceLastUsage
{
  return self->_timeIntervalSinceLastUsage;
}

- (void)setTimeIntervalSinceLastUsage:(double)a3
{
  self->_timeIntervalSinceLastUsage = a3;
}

- (double)timeToFirstByte
{
  return self->_timeToFirstByte;
}

- (void)setTimeToFirstByte:(double)a3
{
  self->_timeToFirstByte = a3;
}

- (int64_t)tunnelConnectionError
{
  return self->_tunnelConnectionError;
}

- (void)setTunnelConnectionError:(int64_t)a3
{
  self->_tunnelConnectionError = a3;
}

- (BOOL)isTFOProbeSucceeded
{
  return self->_isTFOProbeSucceeded;
}

- (void)setIsTFOProbeSucceeded:(BOOL)a3
{
  self->_isTFOProbeSucceeded = a3;
}

- (unint64_t)initialBytesLeftOver
{
  return self->_initialBytesLeftOver;
}

- (void)setInitialBytesLeftOver:(unint64_t)a3
{
  self->_initialBytesLeftOver = a3;
}

- (NSDictionary)exceptions
{
  return self->_exceptions;
}

- (void)setExceptions:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSArray)timingIntervals
{
  return self->_timingIntervals;
}

- (void)setTimingIntervals:(id)a3
{
}

- (void).cxx_destruct
{
}

@end