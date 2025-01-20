@interface CKKSDeviceStateEntry
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (id)allInZone:(id)a3 error:(id *)a4;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)intransactionCreateDeviceStateForView:(id)a3 accountTracker:(id)a4 lockStateTracker:(id)a5 error:(id *)a6;
+ (id)nameFromCKRecordID:(id)a3;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)tryFromDatabaseFromCKRecordID:(id)a3 contextID:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesCKRecord:(id)a3;
- (NSDate)lastUnlockTime;
- (NSString)circlePeerID;
- (NSString)currentClassAUUID;
- (NSString)currentClassCUUID;
- (NSString)currentTLKUUID;
- (NSString)device;
- (NSString)octagonPeerID;
- (NSString)osVersion;
- (OTCliqueStatusWrapper)octagonStatus;
- (OctagonStateString)keyState;
- (id)CKRecordName;
- (id)cktypeToOTCliqueStatusWrapper:(id)a3;
- (id)cliqueStatusToCKType:(id)a3;
- (id)description;
- (id)initForDevice:(id)a3 contextID:(id)a4 osVersion:(id)a5 lastUnlockTime:(id)a6 octagonPeerID:(id)a7 octagonStatus:(id)a8 circlePeerID:(id)a9 circleStatus:(int)a10 keyState:(id)a11 currentTLKUUID:(id)a12 currentClassAUUID:(id)a13 currentClassCUUID:(id)a14 zoneID:(id)a15 encodedCKRecord:(id)a16;
- (id)sosCCStatusToCKType:(int)a3;
- (id)sqlValues;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (int)circleStatus;
- (int)cktypeToSOSCCStatus:(id)a3;
- (void)setCirclePeerID:(id)a3;
- (void)setCircleStatus:(int)a3;
- (void)setCurrentClassAUUID:(id)a3;
- (void)setCurrentClassCUUID:(id)a3;
- (void)setCurrentTLKUUID:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setKeyState:(id)a3;
- (void)setLastUnlockTime:(id)a3;
- (void)setOctagonPeerID:(id)a3;
- (void)setOctagonStatus:(id)a3;
- (void)setOsVersion:(id)a3;
@end

@implementation CKKSDeviceStateEntry

- (id)initForDevice:(id)a3 contextID:(id)a4 osVersion:(id)a5 lastUnlockTime:(id)a6 octagonPeerID:(id)a7 octagonStatus:(id)a8 circlePeerID:(id)a9 circleStatus:(int)a10 keyState:(id)a11 currentTLKUUID:(id)a12 currentClassAUUID:(id)a13 currentClassCUUID:(id)a14 zoneID:(id)a15 encodedCKRecord:(id)a16
{
  id v36 = a3;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v28 = a8;
  id v32 = a8;
  id v31 = a9;
  id v30 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___CKKSDeviceStateEntry;
  v24 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:]( &v37,  "initWithCKRecordType:encodedCKRecord:contextID:zoneID:",  @"devicestate",  a16,  a4,  a15);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_device, a3);
    objc_storeStrong((id *)&v25->_osVersion, a5);
    objc_storeStrong((id *)&v25->_lastUnlockTime, a6);
    objc_storeStrong((id *)&v25->_octagonPeerID, a7);
    objc_storeStrong((id *)&v25->_octagonStatus, v28);
    v25->_circleStatus = a10;
    objc_storeStrong((id *)&v25->_keyState, a11);
    objc_storeStrong((id *)&v25->_circlePeerID, a9);
    objc_storeStrong((id *)&v25->_currentTLKUUID, a12);
    objc_storeStrong((id *)&v25->_currentClassAUUID, a13);
    objc_storeStrong((id *)&v25->_currentClassCUUID, a14);
  }

  return v25;
}

- (id)sosCCStatusToCKType:(int)a3
{
  if (a3 == -1) {
    *(void *)&a3 = 111LL;
  }
  else {
    *(void *)&a3 = a3;
  }
  return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *(void *)&a3));
}

- (int)cktypeToSOSCCStatus:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
LABEL_7:
    int v6 = -1;
    goto LABEL_8;
  }

  unsigned int v5 = [v3 unsignedIntValue];
  int v6 = v5;
  if (v5 + 1 >= 5)
  {
    if (v5 != 111)
    {
      id v7 = sub_1000AA6AC(@"ckks", 0LL);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10[0] = 67109120;
        v10[1] = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%d is not an SOSCCStatus?",  (uint8_t *)v10,  8u);
      }
    }

    goto LABEL_7;
  }

- (id)cliqueStatusToCKType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 status] == (id)-1) {
      uint64_t v5 = 111LL;
    }
    else {
      uint64_t v5 = (uint64_t)[v4 status];
    }
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)cktypeToOTCliqueStatusWrapper:(id)a3
{
  id v3 = a3;
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
  {
    unsigned int v5 = [v3 unsignedIntValue];
    unsigned int v6 = v5;
    switch(v5)
    {
      case 0u:
        id v7 = objc_alloc(&OBJC_CLASS___OTCliqueStatusWrapper);
        uint64_t v8 = 0LL;
        break;
      case 1u:
        id v7 = objc_alloc(&OBJC_CLASS___OTCliqueStatusWrapper);
        uint64_t v8 = 1LL;
        break;
      case 2u:
        id v7 = objc_alloc(&OBJC_CLASS___OTCliqueStatusWrapper);
        uint64_t v8 = 2LL;
        break;
      case 3u:
        id v7 = objc_alloc(&OBJC_CLASS___OTCliqueStatusWrapper);
        uint64_t v8 = 3LL;
        break;
      case 4u:
        id v7 = objc_alloc(&OBJC_CLASS___OTCliqueStatusWrapper);
        uint64_t v8 = 4LL;
        break;
      default:
        if (v5 != 111)
        {
          id v10 = sub_1000AA6AC(@"ckks", 0LL);
          v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v13[0] = 67109120;
            v13[1] = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%d is not an OTCliqueStatus?",  (uint8_t *)v13,  8u);
          }
        }

        id v7 = objc_alloc(&OBJC_CLASS___OTCliqueStatusWrapper);
        uint64_t v8 = -1LL;
        break;
    }

    v9 = -[OTCliqueStatusWrapper initWithStatus:](v7, "initWithStatus:", v8);
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 modificationDate]);

  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
  unsigned int v7 = -[CKKSDeviceStateEntry circleStatus](self, "circleStatus") + 1;
  id v21 = (void *)v4;
  if (v7 > 4) {
    uint64_t v8 = @"kSOSCCError";
  }
  else {
    uint64_t v8 = off_100291C60[v7];
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
  if (v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
    uint64_t v10 = OTCliqueStatusToString([v20 status]);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
  }

  else
  {
    v11 = @"CliqueMissing";
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
  uint64_t v15 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
  v16 = (void *)v15;
  v17 = @"unknown";
  if (v27) {
    v17 = v27;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSDeviceStateEntry[%@](%@,%@,%@,%@,%@,%@): %@ %@ %@ %@ %@ %@ upd:%@>",  v21,  v26,  v25,  v24,  v23,  v22,  v6,  v8,  v11,  v12,  v13,  v14,  v15,  v17));

  if (v9)
  {
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKKSDeviceStateEntry);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    id v106 = (id)objc_claimAutoreleasedReturnValue([v6 zoneID]);
    id v107 = v7;
    unsigned int v105 = [v7 isEqual:v106];
    if (!v105)
    {
      int v13 = 0;
      uint64_t v104 = 0LL;
      memset(v101, 0, sizeof(v101));
      __int128 v103 = 0uLL;
      int v11 = 0;
      memset(v102, 0, sizeof(v102));
      int v12 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      int v19 = 0;
      BOOL v20 = 0;
      goto LABEL_9;
    }

    v100 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
    HIDWORD(v104) = v100 == 0LL;
    if (v100 || (v94 = (void *)objc_claimAutoreleasedReturnValue([v6 device])) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
      v96 = (void *)objc_claimAutoreleasedReturnValue([v6 device]);
      v97 = v9;
      int v10 = 1;
      if (!objc_msgSend(v9, "isEqual:"))
      {
        LODWORD(v104) = 1;
        memset(v101, 0, sizeof(v101));
        __int128 v103 = 0uLL;
        int v11 = 0;
        memset(v102, 0, sizeof(v102));
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        BOOL v18 = 0;
        int v19 = 0;
        BOOL v20 = 0;
        goto LABEL_9;
      }
    }

    else
    {
      v94 = 0LL;
      int v10 = 0;
    }

    uint64_t v33 = objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
    HIDWORD(v103) = v33 == 0;
    LODWORD(v104) = v10;
    v95 = (void *)v33;
    if (v33 || (v90 = (void *)objc_claimAutoreleasedReturnValue([v6 contextID])) != 0)
    {
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
      v92 = (void *)objc_claimAutoreleasedReturnValue([v6 contextID]);
      if (!objc_msgSend(v93, "isEqual:"))
      {
        *(_OWORD *)&v101[12] = 1uLL;
        *(void *)&v101[4] = 0LL;
        *(void *)((char *)&v103 + 4) = 0LL;
        int v11 = 0;
        memset(v102, 0, sizeof(v102));
        *(_DWORD *)v101 = 0;
        int v12 = 0;
        int v13 = 0;
        *(void *)&v101[28] = 0LL;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        BOOL v18 = 0;
        int v19 = 0;
        BOOL v20 = 0;
        LODWORD(v103) = 1;
        goto LABEL_9;
      }

      LODWORD(v103) = 1;
    }

    else
    {
      v90 = 0LL;
      LODWORD(v103) = 0;
    }

    uint64_t v34 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
    DWORD2(v103) = v34 == 0;
    v91 = (void *)v34;
    if (v34 || (v86 = (void *)objc_claimAutoreleasedReturnValue([v6 osVersion])) != 0)
    {
      id v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
      v88 = (void *)objc_claimAutoreleasedReturnValue([v6 osVersion]);
      v89 = v35;
      if (!objc_msgSend(v35, "isEqual:"))
      {
        *(void *)&v101[12] = 1LL;
        *(void *)v101 = 0LL;
        int v11 = 0;
        memset(v102, 0, sizeof(v102));
        int v12 = 0;
        int v13 = 0;
        *(void *)&v101[28] = 0LL;
        *(void *)&v101[20] = 0LL;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        BOOL v18 = 0;
        int v19 = 0;
        BOOL v20 = 0;
        *(_DWORD *)&v101[8] = 1;
        DWORD1(v103) = 1;
        goto LABEL_9;
      }

      DWORD1(v103) = 1;
    }

    else
    {
      v86 = 0LL;
      DWORD1(v103) = 0;
    }

    uint64_t v36 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
    HIDWORD(v102[3]) = v36 == 0;
    v87 = (void *)v36;
    if (v36 || (v82 = (void *)objc_claimAutoreleasedReturnValue([v6 lastUnlockTime])) != 0)
    {
      objc_super v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
      v84 = (void *)objc_claimAutoreleasedReturnValue([v6 lastUnlockTime]);
      v85 = v37;
      if (!objc_msgSend(v37, "isEqual:"))
      {
        *(void *)&v101[12] = 1LL;
        int v11 = 0;
        memset(v102, 0, 20);
        int v12 = 0;
        int v13 = 0;
        *(void *)&v101[28] = 0LL;
        *(void *)&v101[20] = 0LL;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        BOOL v18 = 0;
        int v19 = 0;
        BOOL v20 = 0;
        *(_DWORD *)&v101[8] = 1;
        *(void *)v101 = 0x100000000LL;
        *(void *)((char *)&v102[2] + 4) = 1LL;
        goto LABEL_9;
      }

      HIDWORD(v102[2]) = 1;
    }

    else
    {
      v82 = 0LL;
      HIDWORD(v102[2]) = 0;
    }

    uint64_t v38 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
    LODWORD(v102[3]) = v38 == 0;
    v83 = (void *)v38;
    if (v38 || (v78 = (void *)objc_claimAutoreleasedReturnValue([v6 octagonPeerID])) != 0)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
      v80 = (void *)objc_claimAutoreleasedReturnValue([v6 octagonPeerID]);
      v81 = v39;
      if (!objc_msgSend(v39, "isEqual:"))
      {
        *(void *)&v101[12] = 1LL;
        *(void *)((char *)v102 + 4) = 0LL;
        *(void *)((char *)&v102[1] + 4) = 0LL;
        int v12 = 0;
        int v13 = 0;
        *(void *)&v101[28] = 0LL;
        *(void *)&v101[20] = 0LL;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        BOOL v18 = 0;
        int v19 = 0;
        BOOL v20 = 0;
        *(_DWORD *)&v101[8] = 1;
        *(_DWORD *)v101 = 0;
        *(_DWORD *)&v101[4] = 1;
        int v11 = 1;
        LODWORD(v102[0]) = 1;
        goto LABEL_9;
      }

      LODWORD(v102[0]) = 1;
    }

    else
    {
      v78 = 0LL;
      LODWORD(v102[0]) = 0;
    }

    uint64_t v40 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
    LODWORD(v102[2]) = v40 == 0;
    v79 = (void *)v40;
    if (v40 || (v74 = (void *)objc_claimAutoreleasedReturnValue([v6 octagonStatus])) != 0)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
      v76 = (void *)objc_claimAutoreleasedReturnValue([v6 octagonStatus]);
      v77 = v41;
      if (!objc_msgSend(v41, "isEqual:"))
      {
        *(void *)&v101[12] = 1LL;
        int v12 = 0;
        HIDWORD(v102[0]) = 0;
        int v13 = 0;
        *(void *)&v101[28] = 0LL;
        *(void *)&v101[20] = 0LL;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        BOOL v18 = 0;
        int v19 = 0;
        BOOL v20 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        int v11 = 1;
        *(_DWORD *)v101 = 1;
        v102[1] = 1LL;
        goto LABEL_9;
      }

      LODWORD(v102[1]) = 1;
    }

    else
    {
      v74 = 0LL;
      LODWORD(v102[1]) = 0;
    }

    uint64_t v42 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
    HIDWORD(v102[1]) = v42 == 0;
    v75 = (void *)v42;
    if (v42 || (v71 = (void *)objc_claimAutoreleasedReturnValue([v6 circlePeerID])) != 0)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
      v72 = (void *)objc_claimAutoreleasedReturnValue([v6 circlePeerID]);
      v73 = v43;
      if (!objc_msgSend(v43, "isEqual:"))
      {
        *(void *)&v101[12] = 1LL;
        int v13 = 0;
        *(void *)&v101[28] = 0LL;
        *(void *)&v101[20] = 0LL;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        BOOL v18 = 0;
        int v19 = 0;
        BOOL v20 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        int v11 = 1;
        *(_DWORD *)v101 = 1;
        int v12 = 1;
        HIDWORD(v102[0]) = 1;
        goto LABEL_9;
      }

      HIDWORD(v102[0]) = 1;
    }

    else
    {
      v71 = 0LL;
      HIDWORD(v102[0]) = 0;
    }

    unsigned int v44 = -[CKKSDeviceStateEntry circleStatus](self, "circleStatus");
    if (v44 != [v6 circleStatus])
    {
      int v13 = 0;
      *(void *)&v101[28] = 0LL;
      *(void *)&v101[20] = 0LL;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      int v19 = 0;
      BOOL v20 = 0;
      *(void *)&v101[12] = 1LL;
      *(_DWORD *)&v101[4] = 1;
      *(_DWORD *)&v101[8] = 1;
      int v11 = 1;
      *(_DWORD *)v101 = 1;
      int v12 = 1;
      goto LABEL_9;
    }

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
    *(_DWORD *)&v101[32] = v70 == 0LL;
    if (v70 || (v66 = (void *)objc_claimAutoreleasedReturnValue([v6 keyState])) != 0)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
      v68 = (void *)objc_claimAutoreleasedReturnValue([v6 keyState]);
      v69 = v45;
      if (!objc_msgSend(v45, "isEqual:"))
      {
        *(_DWORD *)&v101[12] = 1;
        int v14 = 0;
        *(void *)&v101[16] = 0LL;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        BOOL v18 = 0;
        int v19 = 0;
        BOOL v20 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        int v11 = 1;
        *(_DWORD *)v101 = 1;
        int v12 = 1;
        int v13 = 1;
        *(void *)&v101[24] = 1LL;
        goto LABEL_9;
      }

      *(_DWORD *)&v101[24] = 1;
    }

    else
    {
      v66 = 0LL;
      *(_DWORD *)&v101[24] = 0;
    }

    uint64_t v46 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
    *(_DWORD *)&v101[28] = v46 == 0;
    v67 = (void *)v46;
    if (v46 || (v62 = (void *)objc_claimAutoreleasedReturnValue([v6 currentTLKUUID])) != 0)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
      v64 = (void *)objc_claimAutoreleasedReturnValue([v6 currentTLKUUID]);
      v65 = v47;
      if (!objc_msgSend(v47, "isEqual:"))
      {
        uint64_t v8 = 1LL;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        BOOL v18 = 0;
        int v19 = 0;
        BOOL v20 = 0;
        *(_DWORD *)&v101[8] = 1;
        *(_DWORD *)&v101[12] = 1;
        *(_DWORD *)v101 = 1;
        *(_DWORD *)&v101[4] = 1;
        int v11 = 1;
        int v12 = 1;
        int v13 = 1;
        int v14 = 1;
        *(void *)&v101[16] = 1LL;
        goto LABEL_9;
      }

      int v48 = 1;
    }

    else
    {
      v62 = 0LL;
      int v48 = 0;
    }

    uint64_t v49 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
    *(_DWORD *)&v101[20] = v49 == 0;
    v63 = (void *)v49;
    *(_DWORD *)&v101[16] = v48;
    if (v49 || (v58 = (void *)objc_claimAutoreleasedReturnValue([v6 currentClassAUUID])) != 0)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
      v60 = (void *)objc_claimAutoreleasedReturnValue([v6 currentClassAUUID]);
      v61 = v50;
      if (!objc_msgSend(v50, "isEqual:"))
      {
        *(_DWORD *)&v101[12] = 1;
        int v17 = 0;
        BOOL v18 = 0;
        int v19 = 0;
        BOOL v20 = 0;
        *(_DWORD *)&v101[4] = 1;
        *(_DWORD *)&v101[8] = 1;
        int v11 = 1;
        *(_DWORD *)v101 = 1;
        int v12 = 1;
        int v13 = 1;
        int v14 = 1;
        int v15 = 1;
        int v16 = 1;
        goto LABEL_9;
      }

      int v55 = 1;
    }

    else
    {
      v58 = 0LL;
      int v55 = 0;
    }

    uint64_t v51 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
    BOOL v99 = v51 == 0;
    v59 = (void *)v51;
    if (v51 || (v56 = (void *)objc_claimAutoreleasedReturnValue([v6 currentClassCUUID])) != 0)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
      uint64_t v54 = objc_claimAutoreleasedReturnValue([v6 currentClassCUUID]);
      unsigned int v53 = objc_msgSend(v52, "isEqual:");
      int v19 = 1;
      v57 = v52;
      if (!v53)
      {
        *(_DWORD *)&v101[8] = 1;
        *(_DWORD *)&v101[12] = 1;
        BOOL v20 = 0;
        *(void *)v101 = 0x100000001LL;
        int v11 = 1;
        int v12 = 1;
        int v13 = 1;
        int v14 = 1;
        int v15 = 1;
        int v17 = 1;
LABEL_142:
        BOOL v18 = v99;
        int v16 = v55;
        uint64_t v8 = v54;
LABEL_9:
        if (v19)
        {
          id v98 = v4;
          BOOL v21 = v20;
          int v22 = v12;
          int v23 = v15;
          id v24 = v6;
          int v25 = v14;
          int v26 = v17;
          int v27 = v13;
          int v28 = v11;
          int v29 = v16;
          BOOL v30 = v18;

          BOOL v31 = v30;
          int v16 = v29;
          int v11 = v28;
          int v13 = v27;
          int v17 = v26;
          int v14 = v25;
          id v6 = v24;
          int v15 = v23;
          int v12 = v22;
          BOOL v20 = v21;
          id v4 = v98;
          if (!v31) {
            goto LABEL_11;
          }
        }

        else if (!v18)
        {
LABEL_11:
          if (v17) {
            goto LABEL_12;
          }
          goto LABEL_16;
        }

        if (v17)
        {
LABEL_12:

          if (!v16)
          {
LABEL_18:
            if (*(_DWORD *)&v101[20]) {

            }
            if (v15) {
            if (*(_DWORD *)&v101[16])
            }
            {
            }

            if (*(_DWORD *)&v101[28]) {

            }
            if (v14) {
            if (*(_DWORD *)&v101[24])
            }
            {
            }

            if (*(_DWORD *)&v101[32]) {

            }
            if (v13) {
            if (HIDWORD(v102[0]))
            }
            {
            }

            if (HIDWORD(v102[1])) {

            }
            if (v12) {
            if (LODWORD(v102[1]))
            }
            {
            }

            if (LODWORD(v102[2])) {

            }
            if (*(_DWORD *)v101) {
            if (LODWORD(v102[0]))
            }
            {
            }

            if (LODWORD(v102[3])) {

            }
            if (v11) {
            if (HIDWORD(v102[2]))
            }
            {
            }

            if (HIDWORD(v102[3])) {

            }
            if (*(_DWORD *)&v101[4]) {
            if (DWORD1(v103))
            }
            {
            }

            if (DWORD2(v103)) {

            }
            if (*(_DWORD *)&v101[8]) {
            if ((_DWORD)v103)
            }
            {
            }

            if (HIDWORD(v103)) {

            }
            if (*(_DWORD *)&v101[12])
            {

              if (!(_DWORD)v104) {
                goto LABEL_70;
              }
            }

            else if (!(_DWORD)v104)
            {
LABEL_70:
              if (HIDWORD(v104)) {
                goto LABEL_71;
              }
              goto LABEL_75;
            }

            if (HIDWORD(v104))
            {
LABEL_71:

              if (!v105) {
                goto LABEL_77;
              }
              goto LABEL_76;
            }

- (id)CKRecordName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ckid-%@", v2));

  return v3;
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry CKRecordName](self, "CKRecordName"));
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue([v52 recordName]);
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry CKRecordName](self, "CKRecordName"));
    int v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecord name (%@) was not %@",  v53,  v54));
    id v56 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordNameException",  v55,  0LL));

LABEL_21:
    objc_exception_throw(v56);
    return (id)-[CKKSDeviceStateEntry matchesCKRecord:](v58, v59, v60);
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
  unsigned __int8 v13 = [v12 isEqualToString:@"devicestate"];

  if ((v13 & 1) == 0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v52,  @"devicestate"));
    id v56 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v57,  0LL));

    goto LABEL_21;
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
  [v6 setObject:v14 forKeyedSubscript:@"osver"];

  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
  [v6 setObject:v15 forKeyedSubscript:@"lastunlock"];

  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
  [v6 setObject:v16 forKeyedSubscript:@"octagonpeerid"];

  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry cliqueStatusToCKType:](self, "cliqueStatusToCKType:", v17));
  [v6 setObject:v18 forKeyedSubscript:@"octagonstatus"];

  int v19 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSDeviceStateEntry sosCCStatusToCKType:]( self,  "sosCCStatusToCKType:",  -[CKKSDeviceStateEntry circleStatus](self, "circleStatus")));
  [v6 setObject:v19 forKeyedSubscript:@"circle"];

  id v20 = (id)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
  id v21 = sub_100097F3C();
  int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  int v23 = v22;
  if (v20)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v20]);

    if (!v24)
    {
      id v27 = sub_100097F3C();
      int v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      int v26 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"error"]);

      int v23 = 0LL;
      goto LABEL_9;
    }

    id v25 = v24;
    int v23 = v25;
  }

  else
  {
    id v25 = (id)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"error"]);
  }

  int v26 = v25;
LABEL_9:

  [v6 setObject:v26 forKeyedSubscript:@"keystate"];
  int v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
  [v6 setObject:v29 forKeyedSubscript:@"peerid"];

  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  if (v30)
  {
    BOOL v31 = objc_alloc(&OBJC_CLASS___CKReference);
    id v32 = objc_alloc(&OBJC_CLASS___CKRecordID);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    id v35 = -[CKRecordID initWithRecordName:zoneID:](v32, "initWithRecordName:zoneID:", v33, v34);
    uint64_t v36 = -[CKReference initWithRecordID:action:](v31, "initWithRecordID:action:", v35, 0LL);
    [v6 setObject:v36 forKeyedSubscript:@"currentTLK"];
  }

  else
  {
    [v6 setObject:0 forKeyedSubscript:@"currentTLK"];
  }

  objc_super v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
  if (v37)
  {
    uint64_t v38 = objc_alloc(&OBJC_CLASS___CKReference);
    v39 = objc_alloc(&OBJC_CLASS___CKRecordID);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    uint64_t v42 = -[CKRecordID initWithRecordName:zoneID:](v39, "initWithRecordName:zoneID:", v40, v41);
    v43 = -[CKReference initWithRecordID:action:](v38, "initWithRecordID:action:", v42, 0LL);
    [v6 setObject:v43 forKeyedSubscript:@"currentClassA"];
  }

  else
  {
    [v6 setObject:0 forKeyedSubscript:@"currentClassA"];
  }

  unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
  if (v44)
  {
    v45 = objc_alloc(&OBJC_CLASS___CKReference);
    uint64_t v46 = objc_alloc(&OBJC_CLASS___CKRecordID);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
    int v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    uint64_t v49 = -[CKRecordID initWithRecordName:zoneID:](v46, "initWithRecordName:zoneID:", v47, v48);
    v50 = -[CKReference initWithRecordID:action:](v45, "initWithRecordID:action:", v49, 0LL);
    [v6 setObject:v50 forKeyedSubscript:@"currentClassC"];
  }

  else
  {
    [v6 setObject:0 forKeyedSubscript:@"currentClassC"];
  }

  return v6;
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v6 = [v5 isEqualToString:@"devicestate"];

  if (!v6) {
    goto LABEL_38;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry CKRecordName](self, "CKRecordName"));
  unsigned int v10 = [v8 isEqualToString:v9];

  if (!v10) {
    goto LABEL_38;
  }
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
  if (v11
    || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"lastunlock"])) != 0)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"lastunlock"]);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
    unsigned int v14 = [v12 isEqual:v13];

    if (v11)
    {

      if (!v14) {
        goto LABEL_38;
      }
    }

    else
    {

      if ((v14 & 1) == 0) {
        goto LABEL_38;
      }
    }
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
  if (v15
    || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"osver"])) != 0)
  {
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"osver"]);
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
    unsigned int v18 = [v16 isEqualToString:v17];

    if (v15)
    {

      if (!v18) {
        goto LABEL_38;
      }
    }

    else
    {

      if ((v18 & 1) == 0) {
        goto LABEL_38;
      }
    }
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
  if (v19
    || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"peerid"])) != 0)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"peerid"]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
    unsigned int v22 = [v20 isEqualToString:v21];

    if (v19)
    {

      if (!v22) {
        goto LABEL_38;
      }
    }

    else
    {

      if ((v22 & 1) == 0) {
        goto LABEL_38;
      }
    }
  }

  int v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
  if (v23
    || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"octagonpeerid"])) != 0)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"octagonpeerid"]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
    unsigned int v26 = [v24 isEqualToString:v25];

    if (v23)
    {

      if (!v26) {
        goto LABEL_38;
      }
    }

    else
    {

      if ((v26 & 1) == 0) {
        goto LABEL_38;
      }
    }
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
  if (!v27)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"octagonstatus"]);
    if (!v8) {
      goto LABEL_33;
    }
  }

  int v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
  int v29 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"octagonstatus"]);
  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry cktypeToOTCliqueStatusWrapper:](self, "cktypeToOTCliqueStatusWrapper:", v29));
  unsigned __int8 v31 = [v28 isEqual:v30];

  if (!v27)
  {

    if ((v31 & 1) == 0) {
      goto LABEL_33;
    }
LABEL_38:
    unsigned __int8 v54 = 0;
    goto LABEL_39;
  }

  if ((v31 & 1) != 0) {
    goto LABEL_38;
  }
LABEL_33:
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"circle"]);
  unsigned int v33 = -[CKKSDeviceStateEntry cktypeToSOSCCStatus:](self, "cktypeToSOSCCStatus:", v32);
  unsigned int v34 = -[CKKSDeviceStateEntry circleStatus](self, "circleStatus");

  if (v33 != v34) {
    goto LABEL_38;
  }
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"keystate"]);
  uint64_t v36 = sub_10009832C(v35);
  objc_super v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
  unsigned int v39 = [v37 isEqualToString:v38];

  if (!v39) {
    goto LABEL_38;
  }
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"currentTLK"]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 recordID]);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 recordName]);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  unsigned int v44 = [v42 isEqualToString:v43];

  if (!v44) {
    goto LABEL_38;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"currentClassA"]);
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 recordID]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v46 recordName]);
  int v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  unsigned int v49 = [v47 isEqualToString:v48];

  if (!v49) {
    goto LABEL_38;
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"currentClassC"]);
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 recordID]);
  v52 = (void *)objc_claimAutoreleasedReturnValue([v51 recordName]);
  unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  unsigned __int8 v54 = [v52 isEqualToString:v53];

LABEL_39:
  return v54;
}

- (void)setFromCKRecord:(id)a3
{
  id v32 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v32 recordType]);
  unsigned __int8 v5 = [v4 isEqualToString:@"devicestate"];

  if ((v5 & 1) != 0)
  {
    -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v32);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"osver"]);
    -[CKKSDeviceStateEntry setOsVersion:](self, "setOsVersion:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"lastunlock"]);
    -[CKKSDeviceStateEntry setLastUnlockTime:](self, "setLastUnlockTime:", v7);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v32 recordID]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSDeviceStateEntry nameFromCKRecordID:]( &OBJC_CLASS___CKKSDeviceStateEntry,  "nameFromCKRecordID:",  v8));
    -[CKKSDeviceStateEntry setDevice:](self, "setDevice:", v9);

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"octagonpeerid"]);
    -[CKKSDeviceStateEntry setOctagonPeerID:](self, "setOctagonPeerID:", v10);

    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"octagonstatus"]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry cktypeToOTCliqueStatusWrapper:](self, "cktypeToOTCliqueStatusWrapper:", v11));
    -[CKKSDeviceStateEntry setOctagonStatus:](self, "setOctagonStatus:", v12);

    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"peerid"]);
    -[CKKSDeviceStateEntry setCirclePeerID:](self, "setCirclePeerID:", v13);

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"circle"]);
    -[CKKSDeviceStateEntry setCircleStatus:]( self,  "setCircleStatus:",  -[CKKSDeviceStateEntry cktypeToSOSCCStatus:](self, "cktypeToSOSCCStatus:", v14));

    int v15 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"keystate"]);
    int v16 = sub_10009832C(v15);
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[CKKSDeviceStateEntry setKeyState:](self, "setKeyState:", v17);

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"currentTLK"]);
    int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 recordID]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 recordName]);
    -[CKKSDeviceStateEntry setCurrentTLKUUID:](self, "setCurrentTLKUUID:", v20);

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"currentClassA"]);
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 recordID]);
    int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 recordName]);
    -[CKKSDeviceStateEntry setCurrentClassAUUID:](self, "setCurrentClassAUUID:", v23);

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"currentClassC"]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 recordID]);
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 recordName]);
    -[CKKSDeviceStateEntry setCurrentClassCUUID:](self, "setCurrentClassCUUID:", v26);
  }

  else
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v32 recordType]);
    int v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v27,  @"devicestate"));
    id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v28,  0LL));

    objc_exception_throw(v29);
    -[CKKSDeviceStateEntry whereClauseToFindSelf](v30, v31);
  }

- (id)whereClauseToFindSelf
{
  v9[0] = @"contextID";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v10[0] = v3;
  v9[1] = @"device";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
  v10[1] = v4;
  v9[2] = @"ckzone";
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
  _DWORD v10[2] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  return v7;
}

- (id)sqlValues
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  v58[0] = @"contextID";
  id v56 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v59[0] = v56;
  v58[1] = @"device";
  int v55 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry device](self, "device"));
  v59[1] = v55;
  v58[2] = @"ckzone";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v7 = v6;

  v59[2] = v7;
  v58[3] = @"osversion";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry osVersion](self, "osVersion"));
  v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  unsigned __int8 v11 = v10;

  v59[3] = v11;
  v58[4] = @"lastunlock";
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime"));
  if (!v12
    || (unsigned __int8 v13 = (void *)v12,
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry lastUnlockTime](self, "lastUnlockTime")),
        int v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v3, "stringFromDate:", v14)),
        v14,
        v13,
        !v15))
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }

  v59[4] = v15;
  v58[5] = @"peerid";
  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry circlePeerID](self, "circlePeerID"));
  int v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v19 = v18;

  v59[5] = v19;
  v58[6] = @"circlestatus";
  unsigned int v20 = -[CKKSDeviceStateEntry circleStatus](self, "circleStatus") + 1;
  if (v20 > 4) {
    id v21 = @"kSOSCCError";
  }
  else {
    id v21 = off_100291C60[v20];
  }
  v59[6] = v21;
  v58[7] = @"octagonpeerid";
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonPeerID](self, "octagonPeerID"));
  int v23 = v22;
  unsigned int v53 = v19;
  if (v22) {
    id v24 = v22;
  }
  else {
    id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v25 = v24;

  v59[7] = v25;
  v58[8] = @"octagonstatus";
  uint64_t v26 = objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus"));
  if (!v26
    || (id v27 = (void *)v26,
        int v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry octagonStatus](self, "octagonStatus")),
        uint64_t v29 = OTCliqueStatusToString([v28 status]),
        BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(v29),
        v28,
        v27,
        !v30))
  {
    BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }

  v59[8] = v30;
  v58[9] = @"keystate";
  SEL v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry keyState](self, "keyState"));
  id v32 = v31;
  v57 = v3;
  if (v31) {
    id v33 = v31;
  }
  else {
    id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  unsigned int v34 = v33;

  v59[9] = v34;
  v58[10] = @"currentTLK";
  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentTLKUUID](self, "currentTLKUUID"));
  uint64_t v36 = v35;
  unsigned __int8 v54 = v7;
  if (v35) {
    id v37 = v35;
  }
  else {
    id v37 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  uint64_t v38 = v37;

  v59[10] = v38;
  v58[11] = @"currentClassA";
  unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassAUUID](self, "currentClassAUUID"));
  uint64_t v40 = v39;
  if (v39) {
    id v41 = v39;
  }
  else {
    id v41 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  uint64_t v42 = v41;

  v59[11] = v42;
  v58[12] = @"currentClassC";
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry currentClassCUUID](self, "currentClassCUUID"));
  unsigned int v44 = v43;
  if (v43) {
    id v45 = v43;
  }
  else {
    id v45 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  uint64_t v46 = v45;

  v59[12] = v46;
  v58[13] = @"ckrecord";
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  int v48 = (void *)objc_claimAutoreleasedReturnValue([v47 base64EncodedStringWithOptions:0]);

  if (v48) {
    id v49 = v48;
  }
  else {
    id v49 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v50 = v49;

  v59[13] = v50;
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  14LL));

  return v51;
}

- (NSString)device
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDevice:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSDate)lastUnlockTime
{
  return (NSDate *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setLastUnlockTime:(id)a3
{
}

- (NSString)circlePeerID
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCirclePeerID:(id)a3
{
}

- (NSString)octagonPeerID
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setOctagonPeerID:(id)a3
{
}

- (int)circleStatus
{
  return self->_circleStatus;
}

- (void)setCircleStatus:(int)a3
{
  self->_circleStatus = a3;
}

- (OTCliqueStatusWrapper)octagonStatus
{
  return (OTCliqueStatusWrapper *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setOctagonStatus:(id)a3
{
}

- (OctagonStateString)keyState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setKeyState:(id)a3
{
}

- (NSString)currentTLKUUID
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setCurrentTLKUUID:(id)a3
{
}

- (NSString)currentClassAUUID
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setCurrentClassAUUID:(id)a3
{
}

- (NSString)currentClassCUUID
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setCurrentClassCUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)nameFromCKRecordID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 recordName]);
  if ([v3 hasPrefix:@"ckid-"])
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(@"ckid-", "length")));

    id v3 = (void *)v4;
  }

  return v3;
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"device";
  id v13 = v10;
  unsigned int v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  int v16 = v15;

  v29[0] = v16;
  v28[1] = @"contextID";
  id v17 = v11;
  id v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  unsigned int v20 = v19;

  v29[1] = v20;
  v28[2] = @"ckzone";
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  unsigned int v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v24 = v23;

  v29[2] = v24;
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([a1 fromDatabaseWhere:v25 error:a6]);

  return v26;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"device";
  id v13 = v10;
  unsigned int v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  int v16 = v15;

  v29[0] = v16;
  v28[1] = @"contextID";
  id v17 = v11;
  id v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  unsigned int v20 = v19;

  v29[1] = v20;
  v28[2] = @"ckzone";
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  unsigned int v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v24 = v23;

  v29[2] = v24;
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v25 error:a6]);

  return v26;
}

+ (id)tryFromDatabaseFromCKRecordID:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v25[0] = @"device";
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 nameFromCKRecordID:v9]);
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v13 = v12;

  v26[0] = v13;
  v25[1] = @"contextID";
  id v14 = v8;
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = v16;

  v26[1] = v17;
  v25[2] = @"ckzone";
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 zoneName]);
  if (v19) {
    id v20 = v19;
  }
  else {
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v21 = v20;

  v26[2] = v21;
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v22 error:a5]);

  return v23;
}

+ (id)allInZone:(id)a3 error:(id *)a4
{
  id v13 = @"ckzone";
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v9 = v8;

  id v14 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v10 error:a4]);

  return v11;
}

+ (id)sqlTable
{
  return @"ckdevicestate";
}

+ (id)sqlColumns
{
  return &off_1002AE700;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"octagonstatus"]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 asString]);

  if (v5) {
    id v6 = -[OTCliqueStatusWrapper initWithStatus:]( objc_alloc(&OBJC_CLASS___OTCliqueStatusWrapper),  "initWithStatus:",  OTCliqueStatusFromString(v5));
  }
  else {
    id v6 = 0LL;
  }
  uint64_t v36 = objc_alloc(&OBJC_CLASS___CKKSDeviceStateEntry);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"device"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 asString]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"contextID"]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 asString]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"osversion"]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 asString]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"lastunlock"]);
  unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue([v13 asISO8601Date]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"octagonpeerid"]);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v43 asString]);
  id v41 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"peerid"]);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v41 asString]);
  unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"circlestatus"]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v39 asString]);
  int v48 = v7;
  id v49 = (void *)v5;
  uint64_t v51 = (void *)v10;
  v52 = v6;
  uint64_t v46 = v11;
  v47 = v9;
  v50 = (void *)v12;
  id v45 = v13;
  uint64_t v38 = v14;
  if (!v14)
  {
    int v16 = -1;
LABEL_9:
    int v33 = v16;
    goto LABEL_10;
  }

  id v15 = v14;
  if (CFEqual(v14, @"kSOSCCInCircle") || CFEqual(v15, @"kSOSCCInCircle"))
  {
    int v33 = 0;
LABEL_10:
    id v17 = v36;
    goto LABEL_11;
  }

  if (CFEqual(v15, @"kSOSCCNotInCircle"))
  {
    int v16 = 1;
    goto LABEL_9;
  }

  if (CFEqual(v15, @"kSOSCCRequestPending"))
  {
    int v16 = 2;
    goto LABEL_9;
  }

  id v17 = v36;
  if (CFEqual(v15, @"kSOSCCCircleAbsent"))
  {
    int v27 = 3;
  }

  else
  {
    CFEqual(v15, @"kSOSCCError");
    int v27 = -1;
  }

  int v33 = v27;
LABEL_11:
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"keystate"]);
  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v37 asString]);
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"currentTLK"]);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v35 asString]);
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"currentClassA"]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v32 asString]);
  SEL v31 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"currentClassC"]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v31 asString]);
  id v20 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckzone"]);
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 asString]);
  id v23 = -[CKRecordZoneID initWithZoneName:ownerName:](v20, "initWithZoneName:ownerName:", v22, CKCurrentUserDefaultName);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckrecord"]);

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 asBase64DecodedData]);
  LODWORD(v28) = v33;
  id v34 = -[CKKSDeviceStateEntry initForDevice:contextID:osVersion:lastUnlockTime:octagonPeerID:octagonStatus:circlePeerID:circleStatus:keyState:currentTLKUUID:currentClassAUUID:currentClassCUUID:zoneID:encodedCKRecord:]( v17,  "initForDevice:contextID:osVersion:lastUnlockTime:octagonPeerID:octagonStatus:circlePeerID:circleStatus:keyStat e:currentTLKUUID:currentClassAUUID:currentClassCUUID:zoneID:encodedCKRecord:",  v8,  v51,  v50,  v44,  v42,  v52,  v40,  v28,  v30,  v29,  v18,  v19,  v23,  v25);

  return v34;
}

+ (id)intransactionCreateDeviceStateForView:(id)a3 accountTracker:(id)a4 lockStateTracker:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 contextID]);
  id v13 = [v10 cdpCapableiCloudAccountStatus];
  if (v13 == (id)1)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 currentCKAccountInfo]);
    id v15 = [v14 accountStatus];

    if (v15 == (id)1)
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v10 ckdeviceID]);
      if (!v16)
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
        id v33 = sub_1000AA6AC(@"ckksdevice", v32);
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);

        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "No CK device ID available; cannot make device state entry",
            buf,
            2u);
        }

        NSErrorUserInfoKey v144 = NSLocalizedDescriptionKey;
        id v35 = (void *)objc_claimAutoreleasedReturnValue([v10 currentCKAccountInfo]);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No CK device ID: %@",  v35));
        v145 = v36;
        id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v145,  &v144,  1LL));
        id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSErrorDomain",  10LL,  v37));

        if (a6)
        {
          id v18 = v18;
          id v22 = 0LL;
          *a6 = v18;
        }

        else
        {
          id v22 = 0LL;
        }

        int v16 = 0LL;
        goto LABEL_82;
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
      id v143 = 0LL;
      v133 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSDeviceStateEntry tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSDeviceStateEntry,  "tryFromDatabase:contextID:zoneID:error:",  v16,  v12,  v17,  &v143));
      id v18 = v143;

      if (v18)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
        id v20 = sub_1000AA6AC(@"ckksdevice", v19);
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v149 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Couldn't read old CKKSDeviceStateEntry from database: %@",  buf,  0xCu);
        }

        if (a6)
        {
          id v18 = v18;
          id v22 = 0LL;
          *a6 = v18;
        }

        else
        {
          id v22 = 0LL;
        }

        v57 = v133;
        goto LABEL_81;
      }

      v132 = v16;
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v9 contextID]);
      unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
      id v142 = 0LL;
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "tryFromDatabase:contextID:zoneID:error:",  @"tlk",  v38,  v39,  &v142));
      id v41 = v142;

      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v9 contextID]);
      v43 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
      id v141 = v41;
      v127 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "tryFromDatabase:contextID:zoneID:error:",  @"classA",  v42,  v43,  &v141));
      id v44 = v141;

      id v45 = (void *)objc_claimAutoreleasedReturnValue([v9 contextID]);
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
      id v140 = v44;
      v126 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "tryFromDatabase:contextID:zoneID:error:",  @"classC",  v45,  v46,  &v140));
      id v47 = v140;

      if (v47)
      {
        int v48 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
        id v49 = sub_1000AA6AC(@"ckksdevice", v48);
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);

        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v149 = v47;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "Couldn't read current key pointers from database: %@; proceeding",
            buf,
            0xCu);
        }
      }

      v128 = v11;
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v40 currentKeyUUID]);
      v120 = v40;
      if (v51)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue([v40 currentKeyUUID]);
        unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue([v9 contextID]);
        unsigned __int8 v54 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
        id v139 = 0LL;
        int v55 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabase:contextID:zoneID:error:",  v52,  v53,  v54,  &v139));
        id v56 = v139;
      }

      else
      {
        int v55 = 0LL;
        id v56 = 0LL;
      }

      v58 = (void *)objc_claimAutoreleasedReturnValue([v127 currentKeyUUID]);
      if (v58)
      {
        SEL v59 = (void *)objc_claimAutoreleasedReturnValue([v127 currentKeyUUID]);
        id v60 = (void *)objc_claimAutoreleasedReturnValue([v9 contextID]);
        v61 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
        id v138 = v56;
        v131 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabase:contextID:zoneID:error:",  v59,  v60,  v61,  &v138));
        id v62 = v138;

        id v56 = v62;
      }

      else
      {
        v131 = 0LL;
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue([v126 currentKeyUUID]);
      if (v63)
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue([v126 currentKeyUUID]);
        v65 = (void *)objc_claimAutoreleasedReturnValue([v9 contextID]);
        v66 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
        id v137 = v56;
        uint64_t v129 = objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabase:contextID:zoneID:error:",  v64,  v65,  v66,  &v137));
        id v67 = v137;

        id v56 = v67;
      }

      else
      {
        uint64_t v129 = 0LL;
      }

      if (v56)
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
        id v69 = sub_1000AA6AC(@"ckksdevice", v68);
        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);

        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v149 = v56;
          _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_ERROR,  "Couldn't read keys from database: %@; proceeding",
            buf,
            0xCu);
        }
      }

      id v136 = 0LL;
      id v71 = [v55 ensureKeyLoadedForContextID:v12 cache:0 error:&v136];
      id v72 = v136;
      if (v72)
      {
        unsigned int v73 = [v128 isLockedError:v72];
        v74 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
        id v75 = sub_1000AA6AC(@"ckksdevice", v74);
        v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);

        BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_ERROR);
        if (v73)
        {
          if (v77)
          {
            *(_DWORD *)buf = 138412290;
            id v149 = v72;
            _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_ERROR,  "Device is locked; couldn't read TLK from keychain. Assuming it is present and continuing; error was %@",
              buf,
              0xCu);
          }

          v78 = v72;
          id v72 = 0LL;
        }

        else
        {
          if (v77)
          {
            *(_DWORD *)buf = 138412290;
            id v149 = v72;
            _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_ERROR,  "Couldn't read TLK from keychain. We do not have a current TLK. Error was %@",  buf,  0xCu);
          }

          v78 = v55;
          int v55 = 0LL;
        }
      }

      id v135 = v72;
      id v79 = [v131 ensureKeyLoadedForContextID:v12 cache:0 error:&v135];
      id v80 = v135;

      if (v80)
      {
        unsigned int v81 = [v128 isLockedError:v80];
        v82 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
        id v83 = sub_1000AA6AC(@"ckksdevice", v82);
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);

        BOOL v85 = os_log_type_enabled(v84, OS_LOG_TYPE_ERROR);
        if (v81)
        {
          if (v85)
          {
            *(_DWORD *)buf = 138412290;
            id v149 = v80;
            _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_ERROR,  "Device is locked; couldn't read ClassA key from keychain. Assuming it is present and continuing; error was %@",
              buf,
              0xCu);
          }

          v86 = v80;
          id v80 = 0LL;
        }

        else
        {
          if (v85)
          {
            *(_DWORD *)buf = 138412290;
            id v149 = v80;
            _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_ERROR,  "Couldn't read ClassA key from keychain. We do not have a current ClassA key. Error was %@",  buf,  0xCu);
          }

          v86 = v131;
          v131 = 0LL;
        }

        v87 = (void *)v129;
      }

      else
      {
        v87 = (void *)v129;
      }

      id v134 = v80;
      id v88 = [v87 ensureKeyLoadedForContextID:v12 cache:0 error:&v134];
      id v18 = v134;

      if (v18)
      {
        v91 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
        id v92 = sub_1000AA6AC(@"ckksdevice", v91);
        v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);

        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v149 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_ERROR,  "Couldn't read ClassC key from keychain. We do not have a current ClassC key. Error was %@",  buf,  0xCu);
        }

        v87 = 0LL;
      }

      if (-[OTSOSActualAdapter sosEnabled]_0(v89, v90))
      {
        v94 = (void *)objc_claimAutoreleasedReturnValue([v10 accountCirclePeerIDInitialized]);
        if ([v94 wait:500000000])
        {
          v95 = (void *)objc_claimAutoreleasedReturnValue([v10 accountCirclePeerID]);

          if (v95) {
            goto LABEL_72;
          }
          v96 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
          id v97 = sub_1000AA6AC(@"ckksdevice", v96);
          v94 = (void *)objc_claimAutoreleasedReturnValue(v97);

          if (os_log_type_enabled((os_log_t)v94, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v94,  OS_LOG_TYPE_ERROR,  "No SOS peer ID available",  buf,  2u);
          }
        }
      }

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = (CKKSDeviceStateEntry *)a3;
  id v10 = a4;
  if (v7)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 recordName]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
    id v40 = 0LL;
    id v15 = (CKKSDeviceStateEntry *)objc_claimAutoreleasedReturnValue( +[CKKSDeviceStateEntry tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSDeviceStateEntry,  "tryFromDatabase:contextID:zoneID:error:",  v12,  v10,  v14,  &v40));
    int v16 = (CKKSDeviceStateEntry *)v40;

    if (v16)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneID]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 zoneName]);
      id v20 = sub_1000AA6AC(@"ckksresync", v19);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v16;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "error loading cdse: %@", buf, 0xCu);
      }
    }

    if (v15)
    {
      unsigned __int8 v22 = -[CKKSDeviceStateEntry matchesCKRecord:](v15, "matchesCKRecord:", v9);
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneID]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneName]);
      id v26 = sub_1000AA6AC(@"ckksresync", v25);
      int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);

      if ((v22 & 1) != 0)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v42 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Already know about this current item pointer, skipping update: %@",  buf,  0xCu);
        }

        unsigned __int8 v28 = 1;
        goto LABEL_23;
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v42 = v15;
        __int16 v43 = 2112;
        id v44 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "BUG: Local current device state entry doesn't match resynced CloudKit record(s): %@ %@",  buf,  0x16u);
      }
    }

    else
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
      BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneID]);
      SEL v31 = (void *)objc_claimAutoreleasedReturnValue([v30 zoneName]);
      id v32 = sub_1000AA6AC(@"ckksresync", v31);
      int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);

      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "BUG: No current device state entry matching resynced CloudKit record: %@",  buf,  0xCu);
      }
    }
  }

  id v15 = -[CKKSCKRecordHolder initWithCKRecord:contextID:]( objc_alloc(&OBJC_CLASS___CKKSDeviceStateEntry),  "initWithCKRecord:contextID:",  v9,  v10);
  id v39 = 0LL;
  unsigned __int8 v28 = -[CKKSSQLDatabaseObject saveToDatabase:](v15, "saveToDatabase:", &v39);
  int v16 = (CKKSDeviceStateEntry *)v39;
  if (v16) {
    unsigned __int8 v28 = 0;
  }
  if ((v28 & 1) == 0)
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeviceStateEntry recordID](v9, "recordID"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneID]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 zoneName]);
    id v36 = sub_1000AA6AC(@"ckksdevice", v35);
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = v15;
      __int16 v43 = 2112;
      id v44 = v16;
      __int16 v45 = 2112;
      uint64_t v46 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Failed to save device record to database: %@: %@ %@",  buf,  0x20u);
    }

    if (a6) {
      *a6 = v16;
    }
  }

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  id v12 = sub_1000AA6AC(@"ckksdevice", v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = @"devicestate";
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "CloudKit notification: deleted device state record(%@): %@",  buf,  0x16u);
  }

  id v23 = 0LL;
  id v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[CKKSDeviceStateEntry tryFromDatabaseFromCKRecordID:contextID:error:]( &OBJC_CLASS___CKKSDeviceStateEntry,  "tryFromDatabaseFromCKRecordID:contextID:error:",  v8,  v9,  &v23));

  id v15 = v23;
  id v22 = v15;
  -[__CFString deleteFromDatabase:](v14, "deleteFromDatabase:", &v22);
  id v16 = v22;

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
  id v19 = sub_1000AA6AC(@"ckksdevice", v18);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v14;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v16;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "CKKSDeviceStateEntry(%@) was deleted: %@ error: %@",  buf,  0x20u);
  }

  if (a6 && v16) {
    *a6 = v16;
  }

  return v16 == 0LL;
}

@end