@interface KTTransparentData
+ (BOOL)supportsSecureCoding;
+ (void)addResult:(unint64_t)a3 failure:(id)a4 toLoggableDatas:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)optInAfter:(id)a3 accountKey:(id)a4;
- (BOOL)staticKeyEnforced;
- (BOOL)updateWithMapLeaf:(id)a3 error:(id *)a4;
- (BOOL)updateWithMutation:(id)a3 error:(id *)a4;
- (BOOL)updateWithSMTs:(id)a3 error:(id *)a4;
- (BOOL)validateActiveClientDatas:(id)a3 at:(id)a4 error:(id *)a5;
- (BOOL)validateAndUpdateWithServerLoggableDatas:(id)a3 accountKey:(id)a4 idsResponseTime:(double)a5 error:(id *)a6;
- (BOOL)validateAndUpdateWithSyncedLoggableDatas:(id)a3 accountKey:(id)a4 cloudDevices:(id)a5 requestDate:(id)a6 error:(id *)a7;
- (BOOL)validateOptInHistory:(id)a3 accountKey:(id)a4 responseTime:(id)a5 error:(id *)a6;
- (BOOL)validateOtherAccountsInactiveForAccount:(id)a3 at:(id)a4 error:(id *)a5;
- (BOOL)verifyServerInvariantsAt:(id)a3 error:(id *)a4;
- (KTTransparentData)initWithCoder:(id)a3;
- (KTTransparentData)initWithUriVRFOutput:(id)a3;
- (KTTransparentData)initWithUriVRFOutput:(id)a3 mapLeaf:(id)a4 pendingSMTs:(id)a5 error:(id *)a6;
- (NSArray)optInOutHistoryDescription;
- (NSData)uriVRFOutput;
- (NSDate)currentTreeEpochBeginDate;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSMutableArray)accounts;
- (id)accountForAccountKey:(id)a3;
- (id)accountForAccountKeyHash:(id)a3;
- (id)accountOptInHistory:(id)a3;
- (id)accountOptInRecord:(id)a3;
- (id)copy;
- (id)currentPublicID;
- (id)debugDescription;
- (id)earliestAddedDate:(id)a3;
- (id)expectedSelfResolutionDate:(id)a3 requestDate:(id)a4;
- (id)failedRecordsForSyncedLoggableDatas:(id)a3 accountKey:(id)a4 cloudDevices:(id)a5 requestDate:(id)a6 error:(id *)a7;
- (id)failedServerLoggableDatas:(id)a3 accountKey:(id)a4 idsResponseTime:(double)a5 error:(id *)a6;
- (id)failureResult:(id)a3 loggableData:(id)a4;
- (id)filterLoggableDatas:(id)a3 clientDataHash:(id)a4;
- (id)filterLoggableDatas:(id)a3 deviceIdHash:(id)a4;
- (id)getLogDataForAccountKey:(id)a3 uri:(id)a4;
- (id)mutationsFromSMTs:(id)a3 error:(id *)a4;
- (id)serialize;
- (id)sortMutationsByTimestamp:(id)a3 error:(id *)a4;
- (unint64_t)accountEverOptedIn:(id)a3;
- (unint64_t)accountOptInState:(id)a3;
- (unint64_t)accountRecentlyOptedIn:(id)a3;
- (unint64_t)currentAccountOptInState;
- (unint64_t)staticKeyStatus;
- (unint64_t)verifiedAccountOptInState;
- (void)addAccountsObject:(id)a3;
- (void)cleanupAccounts;
- (void)deleteMarkedEntries:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)markAccountsWithMutationMs:(unint64_t)a3 except:(id)a4;
- (void)removeAccountsObject:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setCurrentTreeEpochBeginDate:(id)a3;
- (void)setStaticKeyEnforced:(BOOL)a3;
- (void)setStaticKeyStatus:(unint64_t)a3;
- (void)setUriVRFOutput:(id)a3;
- (void)updateWithAddMutation:(id)a3 error:(id *)a4;
- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4;
- (void)updateWithOptInOutMutation:(id)a3 error:(id *)a4;
@end

@implementation KTTransparentData

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"[\n"));
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  v35 = self;
  obj = self->_accounts;
  id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v54,  v60,  16LL);
  if (v39)
  {
    uint64_t v37 = *(void *)v55;
    v38 = v3;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v55 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v4;
        v5 = *(void **)(*((void *)&v54 + 1) + 8 * v4);
        [v3 appendFormat:@"   {\n"];
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountKey]);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
        [v3 appendFormat:@"    accountKey:%@\n", v7];

        v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accountKeyHash]);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
        [v3 appendFormat:@"    accountKeyHash:%@\n", v9];

        v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"[\n"));
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        id v41 = (id)objc_claimAutoreleasedReturnValue([v5 devices]);
        id v44 = [v41 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v44)
        {
          uint64_t v42 = *(void *)v51;
          v43 = v10;
          do
          {
            uint64_t v11 = 0LL;
            do
            {
              if (*(void *)v51 != v42) {
                objc_enumerationMutation(v41);
              }
              uint64_t v45 = v11;
              v12 = *(void **)(*((void *)&v50 + 1) + 8 * v11);
              [v10 appendFormat:@"     {\n"];
              v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceID]);
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_hexString"));
              [v10 appendFormat:@"      deviceID:%@\n", v14];

              v15 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceIDHash]);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_hexString"));
              [v10 appendFormat:@"      deviceIDHash: %@\n", v16];

              v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"[\n"));
              __int128 v46 = 0u;
              __int128 v47 = 0u;
              __int128 v48 = 0u;
              __int128 v49 = 0u;
              v18 = (void *)objc_claimAutoreleasedReturnValue([v12 clientDatas]);
              id v19 = [v18 countByEnumeratingWithState:&v46 objects:v58 count:16];
              if (v19)
              {
                id v20 = v19;
                uint64_t v21 = *(void *)v47;
                do
                {
                  v22 = 0LL;
                  do
                  {
                    if (*(void *)v47 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    v23 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v22);
                    [v17 appendFormat:@"       {\n"];
                    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 clientData]);
                    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "kt_hexString"));
                    [v17 appendFormat:@"        clientData:%@\n", v25];

                    v26 = (void *)objc_claimAutoreleasedReturnValue([v23 clientDataHash]);
                    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "kt_hexString"));
                    [v17 appendFormat:@"        clientDataHash:%@\n", v27];

                    objc_msgSend( v17,  "appendFormat:",  @"        appVersion:%lu\n",  objc_msgSend(v23, "applicationVersion"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue([v23 addedDate]);
                    v29 = (void *)objc_claimAutoreleasedReturnValue([v23 markedForDeletion]);
                    v30 = (void *)objc_claimAutoreleasedReturnValue([v23 expiry]);
                    v31 = (void *)objc_claimAutoreleasedReturnValue([v23 escrowExpiry]);
                    objc_msgSend( v17,  "appendFormat:",  @"        addedDate:%@ markDate:%@; expiryDate:%@; escrowDate:%@\n",
                      v28,
                      v29,
                      v30,
                      v31);

                    [v17 appendFormat:@"       },\n"];
                    v22 = (char *)v22 + 1;
                  }

                  while (v20 != v22);
                  id v20 = [v18 countByEnumeratingWithState:&v46 objects:v58 count:16];
                }

                while (v20);
              }

              [v17 appendFormat:@"      ]"];
              v10 = v43;
              [v43 appendFormat:@"      clientDatas: %@\n", v17];
              [v43 appendFormat:@"     },\n"];

              uint64_t v11 = v45 + 1;
            }

            while ((id)(v45 + 1) != v44);
            id v44 = [v41 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }

          while (v44);
        }

        [v10 appendFormat:@"    ]"];
        v3 = v38;
        [v38 appendFormat:@"    devices: %@\n", v10];
        [v38 appendFormat:@"   },\n"];

        uint64_t v4 = v40 + 1;
      }

      while ((id)(v40 + 1) != v39);
      id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v54,  v60,  16LL);
    }

    while (v39);
  }

  [v3 appendFormat:@"  ]"];
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](v35->_uriVRFOutput, "kt_hexString"));
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\n  uriVRFOutput: %@\n  accounts: %@\n}",  v32,  v3));

  return v33;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  [v3 setObject:v5 forKeyedSubscript:@"uriVRFOutput"];

  uint64_t String = KTStaticKeyPeerValidateResultGetString(-[KTTransparentData staticKeyStatus](self, "staticKeyStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(String);
  [v3 setObject:v7 forKeyedSubscript:@"staticKeyStatus"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)v13) diagnosticsJsonDictionary]);
        [v8 addObject:v14];

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v11);
  }

  [v3 setObject:v8 forKeyedSubscript:@"accounts"];
  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
  [v4 encodeObject:v5 forKey:@"accounts"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
  [v4 encodeObject:v6 forKey:@"uriVRFOutput"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[KTTransparentData currentTreeEpochBeginDate](self, "currentTreeEpochBeginDate"));
  [v4 encodeObject:v7 forKey:@"currentTreeEpoch"];
}

- (KTTransparentData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
  v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___KTAccount, v7),  0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"accounts"]);
  id v12 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v11),  @"uriVRFOutput");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v14),  @"currentTreeEpoch");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  __int128 v17 = objc_alloc_init(&OBJC_CLASS___KTTransparentData);
  if (v17)
  {
    id v18 = [v10 mutableCopy];
    -[KTTransparentData setAccounts:](v17, "setAccounts:", v18);

    -[KTTransparentData setUriVRFOutput:](v17, "setUriVRFOutput:", v13);
    -[KTTransparentData setCurrentTreeEpochBeginDate:](v17, "setCurrentTreeEpochBeginDate:", v16);
  }

  return v17;
}

- (KTTransparentData)initWithUriVRFOutput:(id)a3 mapLeaf:(id)a4 pendingSMTs:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___KTTransparentData;
  uint64_t v14 = -[KTTransparentData init](&v20, "init");
  id v15 = v14;
  if (v14
    && ((objc_storeStrong((id *)&v14->_uriVRFOutput, a3),
         uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array")),
         accounts = v15->_accounts,
         v15->_accounts = (NSMutableArray *)v16,
         accounts,
         -[KTTransparentData setStaticKeyStatus:](v15, "setStaticKeyStatus:", 3LL),
         v12)
     && !-[KTTransparentData updateWithMapLeaf:error:](v15, "updateWithMapLeaf:error:", v12, a6)
     || v13 && !-[KTTransparentData updateWithSMTs:error:](v15, "updateWithSMTs:error:", v13, a6)))
  {
    id v18 = 0LL;
  }

  else
  {
    id v18 = v15;
  }

  return v18;
}

- (KTTransparentData)initWithUriVRFOutput:(id)a3
{
  return -[KTTransparentData initWithUriVRFOutput:mapLeaf:pendingSMTs:error:]( self,  "initWithUriVRFOutput:mapLeaf:pendingSMTs:error:",  a3,  0LL,  0LL,  0LL);
}

- (id)copy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  0LL));
  id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___KTTransparentData, v3),  v2,  0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)serialize
{
  uint64_t v3 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSKeyedArchiver encodeObject:forKey:](v3, "encodeObject:forKey:", self, @"kTransparentData");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v3, "encodedData"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (KTTransparentData *)a3;
  if (self == v5)
  {
    BOOL v14 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___KTTransparentData, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      uint64_t v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](v7, "uriVRFOutput"));
      if (v8 == (void *)v9)
      {
      }

      else
      {
        id v10 = (void *)v9;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](v7, "uriVRFOutput"));
        unsigned int v13 = [v11 isEqualToData:v12];

        if (!v13) {
          goto LABEL_15;
        }
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](v7, "accounts"));
      if (v15 == (void *)v16)
      {
      }

      else
      {
        __int128 v17 = (void *)v16;
        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](v7, "accounts"));
        unsigned int v20 = [v18 isEqual:v19];

        if (!v20) {
          goto LABEL_15;
        }
      }

      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData currentTreeEpochBeginDate](self, "currentTreeEpochBeginDate"));
      uint64_t v22 = objc_claimAutoreleasedReturnValue(-[KTTransparentData currentTreeEpochBeginDate](v7, "currentTreeEpochBeginDate"));
      if (v21 == (void *)v22)
      {
      }

      else
      {
        v23 = (void *)v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData currentTreeEpochBeginDate](self, "currentTreeEpochBeginDate"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData currentTreeEpochBeginDate](v7, "currentTreeEpochBeginDate"));
        unsigned __int8 v26 = objc_msgSend(v24, "kt_isEqualWithinOneMillisecond:", v25);

        if ((v26 & 1) == 0)
        {
LABEL_15:
          BOOL v14 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }

      BOOL v14 = 1;
      goto LABEL_18;
    }

    BOOL v14 = 0;
  }

- (id)accountForAccountKeyHash:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v5 = self->_accounts;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountKeyHash", (void)v13));
        unsigned __int8 v11 = [v10 isEqualToData:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)accountForAccountKey:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v5 = self->_accounts;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountKey", (void)v17));
        unsigned __int8 v12 = [v11 isEqualToData:v4];

        if ((v12 & 1) != 0)
        {
          id v15 = v10;
          goto LABEL_12;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
  uint64_t v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_sha256WithSalt:", v13));

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKeyHash:](self, "accountForAccountKeyHash:", v5));
  id v15 = v14;
  if (v14) {
    [v14 setAccountKey:v4];
  }
LABEL_12:

  return v15;
}

- (void)removeAccountsObject:(id)a3
{
}

- (void)addAccountsObject:(id)a3
{
}

- (BOOL)updateWithMapLeaf:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 verifyWithError:a4];
  if (v7 == (id)1)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[KTTransparentData setAccounts:](self, "setAccounts:", v8);

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountsArray", 0));
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          __int128 v14 = -[KTAccount initWithIdsAccount:]( objc_alloc(&OBJC_CLASS___KTAccount),  "initWithIdsAccount:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)i));
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
          [v15 addObject:v14];
        }

        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v11);
    }

    -[KTTransparentData cleanupAccounts](self, "cleanupAccounts");
  }

  return v7 == (id)1;
}

- (id)sortMutationsByTimestamp:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v13 = 0LL;
  __int128 v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10014354C;
  v12[3] = &unk_100283AC0;
  v12[4] = &v13;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingComparator:v12]);
  id v7 = v6;
  if (*((_BYTE *)v14 + 24))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -332LL,  @"error sorting SMTs due to multiple conflicting SMTs with the same timestamp"));
    uint64_t v9 = v8;
    if (a4 && v8) {
      *a4 = v8;
    }

    id v10 = 0LL;
  }

  else
  {
    id v10 = v6;
  }

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)mutationsFromSMTs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SignedMutationTimestamp signedTypeWithObject:]( &OBJC_CLASS___SignedMutationTimestamp,  "signedTypeWithObject:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v11),  (void)v17));
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 parsedMutationWithError:a4]);
        if (!v13)
        {

          id v15 = 0LL;
          goto LABEL_11;
        }

        __int128 v14 = (void *)v13;
        [v6 addObject:v13];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = v6;
LABEL_11:

  return v15;
}

- (void)markAccountsWithMutationMs:(unint64_t)a3 except:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)a3 / 1000.0));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
  id v8 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v39;
    uint64_t v24 = *(void *)v39;
    id v25 = v6;
    do
    {
      id v11 = 0LL;
      id v26 = v9;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v11);
        if ((!v6
           || ([*(id *)(*((void *)&v38 + 1) + 8 * (void)v11) isEqual:v6] & 1) == 0)
          && objc_msgSend(v12, "active:", v7, v24, v25))
        {
          v28 = v11;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          id v29 = (id)objc_claimAutoreleasedReturnValue([v12 devices]);
          id v13 = [v29 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v35;
            do
            {
              for (i = 0LL; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v35 != v15) {
                  objc_enumerationMutation(v29);
                }
                __int128 v17 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
                if ([v17 active:v7])
                {
                  __int128 v32 = 0u;
                  __int128 v33 = 0u;
                  __int128 v30 = 0u;
                  __int128 v31 = 0u;
                  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 clientDatas]);
                  id v19 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
                  if (v19)
                  {
                    id v20 = v19;
                    uint64_t v21 = *(void *)v31;
                    do
                    {
                      for (j = 0LL; j != v20; j = (char *)j + 1)
                      {
                        if (*(void *)v31 != v21) {
                          objc_enumerationMutation(v18);
                        }
                        v23 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)j);
                      }

                      id v20 = [v18 countByEnumeratingWithState:&v30 objects:v42 count:16];
                    }

                    while (v20);
                  }
                }
              }

              id v14 = [v29 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }

            while (v14);
          }

          uint64_t v10 = v24;
          id v6 = v25;
          id v9 = v26;
          id v11 = v28;
        }

        id v11 = (char *)v11 + 1;
      }

      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }

    while (v9);
  }
}

- (void)updateWithOptInOutMutation:(id)a3 error:(id *)a4
{
  id v9 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 accountKeyHash]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKeyHash:](self, "accountForAccountKeyHash:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v9 timestampMs] / 1000.0));
}

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  id v9 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 accountKeyHash]);
  id v7 = (KTAccount *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKeyHash:](self, "accountForAccountKeyHash:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 idsMutation]);
  -[KTTransparentData markAccountsWithMutationMs:except:]( self,  "markAccountsWithMutationMs:except:",  [v8 mutationMs],  v7);

  if (v7)
  {
    -[KTAccount updateWithAddMutation:error:](v7, "updateWithAddMutation:error:", v9, a4);
  }

  else
  {
    id v7 = -[KTAccount initWithMutation:](objc_alloc(&OBJC_CLASS___KTAccount), "initWithMutation:", v9);
    -[KTTransparentData addAccountsObject:](self, "addAccountsObject:", v7);
  }
}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  id v8 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 accountKeyHash]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKeyHash:](self, "accountForAccountKeyHash:", v6));

  if (v7) {
    [v7 updateWithMarkDeleteMutation:v8 error:a4];
  }
}

- (void)cleanupAccounts
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v3));

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        objc_msgSend(v10, "cleanupDevices", (void)v11);
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)deleteMarkedEntries:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)a3 / 1000.0));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        [v12 deleteMarkedEntries:v4];
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (BOOL)updateWithMutation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uriVRFOutput]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
  unsigned __int8 v9 = [v7 isEqualToData:v8];

  if ((v9 & 1) != 0)
  {
    switch([v6 mutationType])
    {
      case 1u:
      case 4u:
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDeviceMutation]);

        if (v10)
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDeviceMutation]);
          -[KTTransparentData updateWithAddMutation:error:](self, "updateWithAddMutation:error:", v11, a4);
          goto LABEL_25;
        }

        if (qword_1002EE8E8 != -1) {
          dispatch_once(&qword_1002EE8E8, &stru_100283B00);
        }
        __int128 v12 = (os_log_s *)qword_1002EE8F0;
        if (!os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR)) {
          break;
        }
        LOWORD(v21[0]) = 0;
        __int128 v13 = "Add mutation doesn't have idsDeviceMutation object";
        goto LABEL_11;
      case 2u:
      case 5u:
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDeviceMutation]);

        if (v15)
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 idsDeviceMutation]);
          -[KTTransparentData updateWithMarkDeleteMutation:error:](self, "updateWithMarkDeleteMutation:error:", v11, a4);
          goto LABEL_25;
        }

        if (qword_1002EE8E8 != -1) {
          dispatch_once(&qword_1002EE8E8, &stru_100283B20);
        }
        __int128 v12 = (os_log_s *)qword_1002EE8F0;
        if (!os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR)) {
          break;
        }
        LOWORD(v21[0]) = 0;
        __int128 v13 = "Mark mutation doesn't have idsDeviceMutation object";
        goto LABEL_11;
      case 3u:
        if (qword_1002EE8E8 != -1) {
          dispatch_once(&qword_1002EE8E8, &stru_100283B40);
        }
        __int128 v18 = (os_log_s *)qword_1002EE8F0;
        if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "WARNING: Skipping deprecated mutation type OPT_IN_OUT_MUTATION",  (uint8_t *)v21,  2u);
        }

        goto LABEL_26;
      case 6u:
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 optInOutMutation]);

        if (v19)
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 optInOutMutation]);
          -[KTTransparentData updateWithOptInOutMutation:error:](self, "updateWithOptInOutMutation:error:", v11, a4);
LABEL_25:

LABEL_26:
          -[KTTransparentData cleanupAccounts](self, "cleanupAccounts");
          BOOL v14 = 1;
          goto LABEL_27;
        }

        if (qword_1002EE8E8 != -1) {
          dispatch_once(&qword_1002EE8E8, &stru_100283B60);
        }
        __int128 v12 = (os_log_s *)qword_1002EE8F0;
        if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21[0]) = 0;
          __int128 v13 = "optInOutWithSync mutation doesn't have OptInOutMutation object";
          goto LABEL_11;
        }

        break;
      default:
        if (qword_1002EE8E8 != -1) {
          dispatch_once(&qword_1002EE8E8, &stru_100283B80);
        }
        __int128 v16 = (void *)qword_1002EE8F0;
        if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
        {
          __int128 v17 = v16;
          v21[0] = 67109120;
          v21[1] = [v6 mutationType];
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "unknown mutation type %d, continuing anyway",  (uint8_t *)v21,  8u);
        }

        goto LABEL_26;
    }
  }

  else
  {
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -86LL,  @"smt has different URI VRF output than computed in witness"));
    }
    if (qword_1002EE8E8 != -1) {
      dispatch_once(&qword_1002EE8E8, &stru_100283AE0);
    }
    __int128 v12 = (os_log_s *)qword_1002EE8F0;
    if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21[0]) = 0;
      __int128 v13 = "smt has different URI VRF output than computed in witness";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)v21, 2u);
    }
  }

  BOOL v14 = 0;
LABEL_27:

  return v14;
}

- (BOOL)updateWithSMTs:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData mutationsFromSMTs:error:](self, "mutationsFromSMTs:error:", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData sortMutationsByTimestamp:error:](self, "sortMutationsByTimestamp:error:", v6, a4));

  if (v7)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (!-[KTTransparentData updateWithMutation:error:]( self,  "updateWithMutation:error:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i),  a4,  (void)v15))
          {
            BOOL v13 = 0;
            goto LABEL_12;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v13 = 1;
LABEL_12:
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)filterLoggableDatas:(id)a3 deviceIdHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceIdHash", (void)v21));

        if (!v15)
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
          [v14 computeHashesForSalt:v16];
        }

        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceIdHash]);
        unsigned int v18 = [v17 isEqualToData:v7];

        if (v18) {
          [v8 addObject:v14];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v11);
  }

  if ([v8 count]) {
    id v19 = v8;
  }
  else {
    id v19 = 0LL;
  }

  return v19;
}

- (id)filterLoggableDatas:(id)a3 clientDataHash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "clientDataHash", (void)v21));

        if (!v15)
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
          [v14 computeHashesForSalt:v16];
        }

        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 clientDataHash]);
        unsigned int v18 = [v17 isEqualToData:v7];

        if (v18) {
          [v8 addObject:v14];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v11);
  }

  if ([v8 count]) {
    id v19 = v8;
  }
  else {
    id v19 = 0LL;
  }

  return v19;
}

- (id)failedRecordsForSyncedLoggableDatas:(id)a3 accountKey:(id)a4 cloudDevices:(id)a5 requestDate:(id)a6 error:(id *)a7
{
  id v90 = a3;
  id v12 = a4;
  id v100 = a5;
  id v95 = a6;
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", v12));
  v88 = v13;
  if (v13)
  {
    v96 = a7;
    __int128 v110 = 0u;
    __int128 v111 = 0u;
    __int128 v108 = 0u;
    __int128 v109 = 0u;
    id obj = (__CFString *)objc_claimAutoreleasedReturnValue([v13 devices]);
    id v94 = -[__CFString countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v108,  v125,  16LL);
    if (v94)
    {
      id v87 = v12;
      uint64_t v93 = *(void *)v109;
      v101 = self;
      while (1)
      {
        BOOL v14 = 0LL;
        do
        {
          if (*(void *)v109 != v93) {
            objc_enumerationMutation(obj);
          }
          __int128 v15 = *(void **)(*((void *)&v108 + 1) + 8LL * (void)v14);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          v102 = v15;
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceIDHash]);
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v100 fetchSyncedLoggableDataByDeviceIdHash:v17]);

          if (v18)
          {
            if (qword_1002EE8E8 != -1) {
              dispatch_once(&qword_1002EE8E8, &stru_100283BC0);
            }
            id v19 = (void *)qword_1002EE8F0;
            if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_DEBUG))
            {
              id v20 = v19;
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
              __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 deviceID]);
              v97 = v14;
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "kt_hexString"));
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v102 deviceIDHash]);
              id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "kt_hexString"));
              unsigned int v26 = [v18 count];
              *(_DWORD *)buf = 138412802;
              uint64_t v115 = (uint64_t)v23;
              __int16 v116 = 2112;
              v117 = v25;
              __int16 v118 = 1024;
              LODWORD(v119) = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "CloudDevices: found device %@ with deviceIDHash: %@: %d",  buf,  0x1Cu);

              self = v101;
              BOOL v14 = v97;
            }

            [v16 addObjectsFromArray:v18];
          }

          if (([v100 disableKTSyncabledKVSStore] & 1) == 0)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue([v102 deviceIDHash]);
            v28 = (void *)objc_claimAutoreleasedReturnValue( -[KTTransparentData filterLoggableDatas:deviceIdHash:]( self,  "filterLoggableDatas:deviceIdHash:",  v90,  v27));

            if (v28)
            {
              if (qword_1002EE8E8 != -1) {
                dispatch_once(&qword_1002EE8E8, &stru_100283BE0);
              }
              id v29 = (void *)qword_1002EE8F0;
              if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_DEBUG))
              {
                __int128 v30 = v29;
                __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v28 firstObject]);
                v98 = v14;
                __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 deviceID]);
                __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "kt_hexString"));
                __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v102 deviceIDHash]);
                __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "kt_hexString"));
                unsigned int v36 = [v28 count];
                *(_DWORD *)buf = 138412802;
                uint64_t v115 = (uint64_t)v33;
                __int16 v116 = 2112;
                v117 = v35;
                __int16 v118 = 1024;
                LODWORD(v119) = v36;
                _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "KVS: found device %@ with deviceIDHash: %@: %d",  buf,  0x1Cu);

                BOOL v14 = v98;
                self = v101;
              }

              [v16 addObjectsFromArray:v28];
            }
          }

          v103 = v16;
          if (![v16 count])
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue([v102 deviceIDHash]);
            uint64_t v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "kt_hexString"));

            v61 = (void *)objc_claimAutoreleasedReturnValue([v102 addedDate]);
            id v62 = [v61 compare:v95];

            if (v62 == (id)1)
            {
              __int128 v41 = (void *)v60;
              if (qword_1002EE8E8 != -1) {
                dispatch_once(&qword_1002EE8E8, &stru_100283C00);
              }
              v63 = (void *)qword_1002EE8F0;
              if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_DEBUG))
              {
                v64 = v63;
                v65 = (void *)objc_claimAutoreleasedReturnValue([v102 addedDate]);
                *(_DWORD *)buf = 138412802;
                uint64_t v115 = v60;
                __int16 v116 = 2112;
                v117 = v65;
                __int16 v118 = 2112;
                id v119 = v95;
                _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEBUG,  "skipping device (%@) added %@ after request time %@",  buf,  0x20u);
              }

              int v58 = 3;
              goto LABEL_69;
            }

            v72 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -99LL,  *v96,  @"Unknown device in Transparent Data with deviceIdHash %@",  v60));
            if ([v102 marked:v95])
            {
              __int128 v41 = (void *)v60;
              v73 = +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -107LL,  *v96,  @"Unknown marked device in Transparent Data with deviceIdHash %@",  v60);
              goto LABEL_61;
            }

            __int128 v41 = (void *)v60;
            if ([v102 expired:v95])
            {
              v73 = +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -161LL,  *v96,  @"Unknown expired device in Transparent Data with deviceIdHash %@",  v60);
LABEL_61:
              uint64_t v76 = objc_claimAutoreleasedReturnValue(v73);

              v72 = (void *)v76;
            }

            if (qword_1002EE8E8 != -1) {
              dispatch_once(&qword_1002EE8E8, &stru_100283C20);
            }
            v77 = (os_log_s *)qword_1002EE8F0;
            if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v115 = (uint64_t)v41;
              _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Unknown device in Transparent Data with deviceIdHash %{public}@",  buf,  0xCu);
            }

            if (v72) {
              id *v96 = v72;
            }
            v123 = @"failedDeviceIdHash";
            v124 = v41;
            int v58 = 1;
            uint64_t v89 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v124,  &v123,  1LL));

            goto LABEL_69;
          }

          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:0]);
          __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 deviceID]);
          [v102 setDeviceID:v38];

          __int128 v106 = 0u;
          __int128 v107 = 0u;
          __int128 v104 = 0u;
          __int128 v105 = 0u;
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v102 clientDatas]);
          id v40 = [v39 countByEnumeratingWithState:&v104 objects:v122 count:16];
          __int128 v41 = v39;
          if (!v40)
          {
            int v58 = 0;
            goto LABEL_69;
          }

          id v42 = v40;
          v92 = v18;
          v99 = v14;
          uint64_t v43 = *(void *)v105;
          while (2)
          {
            id v44 = 0LL;
            do
            {
              if (*(void *)v105 != v43) {
                objc_enumerationMutation(v39);
              }
              uint64_t v45 = *(void **)(*((void *)&v104 + 1) + 8LL * (void)v44);
              __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 clientDataHash]);
              __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( -[KTTransparentData filterLoggableDatas:clientDataHash:]( self,  "filterLoggableDatas:clientDataHash:",  v103,  v46));

              if (v47)
              {
                __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectAtIndexedSubscript:0]);
                __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v48 clientData]);
                [v45 setClientData:v49];

                [v45 setSynced:1];
              }

              else
              {
                __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v102 deviceID]);
                __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "kt_hexString"));

                __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v45 clientDataHash]);
                __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "kt_hexString"));

                __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v45 addedDate]);
                id v54 = [v53 compare:v95];

                if (v54 != (id)1)
                {
                  v66 = (void *)objc_claimAutoreleasedReturnValue([v45 addedDate]);
                  v67 = (void *)objc_claimAutoreleasedReturnValue([v45 markedForDeletion]);
                  v68 = (void *)objc_claimAutoreleasedReturnValue([v45 expiry]);
                  v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown client data in Transparent Data for device {%@, %@, %@, %@, %@}",  v47,  v52,  v66,  v67,  v68));

                  v70 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -100LL,  *v96,  @"%@",  v69));
                  if ([v45 marked:v95])
                  {
                    uint64_t v71 = -108LL;
                    self = v101;
                    goto LABEL_50;
                  }

                  self = v101;
                  if ([v45 expired:v95])
                  {
                    uint64_t v71 = -162LL;
LABEL_50:
                    uint64_t v74 = objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  v71,  *v96,  @"%@",  v69));

                    v70 = (void *)v74;
                  }

                  if (qword_1002EE8E8 != -1) {
                    dispatch_once(&qword_1002EE8E8, &stru_100283C60);
                  }
                  v75 = (os_log_s *)qword_1002EE8F0;
                  if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v115 = (uint64_t)v69;
                    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                  }

                  if (v70) {
                    id *v96 = v70;
                  }
                  v112[0] = @"failedDeviceId";
                  v112[1] = @"failedClientDataHash";
                  v113[0] = v47;
                  v113[1] = v52;
                  uint64_t v89 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v113,  v112,  2LL));

                  int v58 = 1;
                  goto LABEL_58;
                }

                if (qword_1002EE8E8 != -1) {
                  dispatch_once(&qword_1002EE8E8, &stru_100283C40);
                }
                __int128 v55 = (void *)qword_1002EE8F0;
                if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_DEBUG))
                {
                  __int128 v56 = v55;
                  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v45 addedDate]);
                  *(_DWORD *)buf = 138413058;
                  uint64_t v115 = (uint64_t)v47;
                  __int16 v116 = 2112;
                  v117 = v52;
                  __int16 v118 = 2112;
                  id v119 = v57;
                  __int16 v120 = 2112;
                  id v121 = v95;
                  _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEBUG,  "skipping client data (%@,%@) added %@ after request time %@",  buf,  0x2Au);
                }

                self = v101;
              }

              id v44 = (char *)v44 + 1;
              __int128 v39 = v41;
            }

            while (v42 != v44);
            id v42 = [v41 countByEnumeratingWithState:&v104 objects:v122 count:16];
            if (v42) {
              continue;
            }
            break;
          }

          int v58 = 0;
LABEL_58:
          BOOL v14 = v99;
          unsigned int v18 = v92;
LABEL_69:

          if (v58 != 3 && v58)
          {
            id v12 = v87;
            v78 = (void *)v89;
            goto LABEL_86;
          }

          BOOL v14 = (char *)v14 + 1;
        }

        while (v14 != v94);
        id v94 = -[__CFString countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v108,  v125,  16LL);
        if (!v94)
        {
          v78 = 0LL;
          id v12 = v87;
          goto LABEL_86;
        }
      }
    }

    v78 = 0LL;
    goto LABEL_86;
  }

  if (a7)
  {
    id v79 = *a7;
    v80 = a7;
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_hexString"));
    id *v80 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -98LL,  v79,  @"No transparent data for accountKey %@",  v81));
  }

  if (qword_1002EE8E8 != -1) {
    dispatch_once(&qword_1002EE8E8, &stru_100283BA0);
  }
  v82 = (void *)qword_1002EE8F0;
  if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
  {
    v83 = v82;
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_hexString"));
    *(_DWORD *)buf = 138412290;
    uint64_t v115 = (uint64_t)v84;
    _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_ERROR,  "No transparent data for accountKey %@",  buf,  0xCu);
  }

  v126 = @"failedAccountKey";
  if (v12) {
    v85 = (const __CFString *)objc_claimAutoreleasedReturnValue([v12 base64EncodedStringWithOptions:0]);
  }
  else {
    v85 = @"NULL";
  }
  id obj = (__CFString *)v85;
  v127 = v85;
  v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v127,  &v126,  1LL));
  if (v12) {
LABEL_86:
  }

  return v78;
}

- (BOOL)validateAndUpdateWithSyncedLoggableDatas:(id)a3 accountKey:(id)a4 cloudDevices:(id)a5 requestDate:(id)a6 error:(id *)a7
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[KTTransparentData failedRecordsForSyncedLoggableDatas:accountKey:cloudDevices:requestDate:error:]( self,  "failedRecordsForSyncedLoggableDatas:accountKey:cloudDevices:requestDate:error:",  a3,  a4,  a5,  a6,  a7));
  BOOL v8 = v7 == 0LL;

  return v8;
}

- (BOOL)validateOtherAccountsInactiveForAccount:(id)a3 at:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v10 = self->_accounts;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v30;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        if (([v15 isEqual:v8] & 1) == 0
          && [v15 active:v9])
        {
          if (a5)
          {
            v28 = a5;
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 accountKeyHash]);
            unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_hexString"));
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 accountKeyHash]);
            id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "kt_hexString"));
            id *v28 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -91LL,  @"verifying (%@), other accountKey (%@) has active records",  v18,  v20));
          }

          if (qword_1002EE8E8 != -1) {
            dispatch_once(&qword_1002EE8E8, &stru_100283C80);
          }
          __int128 v21 = (void *)qword_1002EE8F0;
          if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
          {
            __int128 v22 = v21;
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v8 accountKeyHash]);
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "kt_hexString"));
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 accountKeyHash]);
            unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "kt_hexString"));
            *(_DWORD *)buf = 138412546;
            __int128 v34 = v24;
            __int16 v35 = 2112;
            unsigned int v36 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "verifying (%@), other accountKey (%@) has active records",  buf,  0x16u);
          }

          BOOL v16 = 0;
          goto LABEL_18;
        }
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
      if (v12) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 1;
LABEL_18:

  return v16;
}

- (BOOL)validateActiveClientDatas:(id)a3 at:(id)a4 error:(id *)a5
{
  id v6 = a4;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 devices]);
  id v30 = [v7 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v30)
  {
    uint64_t v8 = *(void *)v40;
    id v9 = off_100275000;
    __int128 v34 = v7;
    uint64_t v29 = *(void *)v40;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v7);
        }
        uint64_t v31 = v10;
        id v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class array](v9[64], "array"));
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v33 = v11;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 clientDatas]);
        id v14 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v36;
          while (2)
          {
            for (i = 0LL; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(v13);
              }
              unsigned int v18 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
              if ([v18 active:v6])
              {
                id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v18 applicationVersion]));
                unsigned int v20 = [v12 containsObject:v19];

                if (v20)
                {
                  if (a5)
                  {
                    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v33 deviceIDHash]);
                    *a5 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -92,  @"muliple active client datas for deviceIdHash %@ appVersion %lu",  v23,  [v18 applicationVersion]));
                  }

                  if (qword_1002EE8E8 != -1) {
                    dispatch_once(&qword_1002EE8E8, &stru_100283CA0);
                  }
                  __int128 v24 = (void *)qword_1002EE8F0;
                  if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
                  {
                    id v25 = v24;
                    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v33 deviceIDHash]);
                    id v27 = [v18 applicationVersion];
                    *(_DWORD *)buf = 138412546;
                    id v44 = v26;
                    __int16 v45 = 2048;
                    id v46 = v27;
                    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "muliple active client datas for deviceIdHash %@ appVersion %lu",  buf,  0x16u);
                  }

                  BOOL v22 = 0;
                  id v7 = v34;
                  goto LABEL_27;
                }

                __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v18 applicationVersion]));
                [v12 addObject:v21];
              }
            }

            id v15 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        uint64_t v10 = v31 + 1;
        id v7 = v34;
        uint64_t v8 = v29;
        id v9 = off_100275000;
      }

      while ((id)(v31 + 1) != v30);
      BOOL v22 = 1;
      id v30 = [v34 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }

    while (v30);
  }

  else
  {
    BOOL v22 = 1;
  }

- (BOOL)verifyServerInvariantsAt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  }
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ([v12 active:v6]
          && !-[KTTransparentData validateOtherAccountsInactiveForAccount:at:error:]( self,  "validateOtherAccountsInactiveForAccount:at:error:",  v12,  v6,  a4)
          || !-[KTTransparentData validateActiveClientDatas:at:error:]( self,  "validateActiveClientDatas:at:error:",  v12,  v6,  a4))
        {
          BOOL v13 = 0;
          goto LABEL_15;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 1;
LABEL_15:

  return v13;
}

+ (void)addResult:(unint64_t)a3 failure:(id)a4 toLoggableDatas:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        [v13 setResult:a3];
        [v13 setFailure:v7];
      }

      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }
}

- (id)failureResult:(id)a3 loggableData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 base64EncodedStringWithOptions:0]);
    [v7 setObject:v8 forKeyedSubscript:@"failedAccountKey"];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceID]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceID]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 base64EncodedStringWithOptions:0]);
    [v7 setObject:v11 forKeyedSubscript:@"failedDeviceId"];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 clientData]);

  if (v12)
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v6 clientData]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 base64EncodedStringWithOptions:0]);
    [v7 setObject:v14 forKeyedSubscript:@"failedClientData"];
  }

  return v7;
}

- (id)failedServerLoggableDatas:(id)a3 accountKey:(id)a4 idsResponseTime:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  __int128 v111 = self;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", v11));
  __int128 v110 = a6;
  if (v12)
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v118 = 0u;
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    id v99 = v10;
    id obj = v10;
    id v103 = [obj countByEnumeratingWithState:&v118 objects:v131 count:16];
    id v14 = 0LL;
    if (!v103) {
      goto LABEL_58;
    }
    uint64_t v102 = *(void *)v119;
    __int128 v15 = off_100275000;
    id v108 = v11;
    __int128 v109 = v13;
    v101 = v12;
    while (1)
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v119 != v102) {
          objc_enumerationMutation(obj);
        }
        __int128 v106 = (char *)v16;
        __int128 v17 = *(void **)(*((void *)&v118 + 1) + 8LL * (void)v16);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceIdHash]);

        if (!v18)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](v111, "uriVRFOutput"));
          [v17 computeHashesForSalt:v19];
        }

        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceIdHash]);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceForDeviceIdHash:v20]);

        if (v21)
        {
          BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceID]);
          [v21 setDeviceID:v22];

          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v21 deviceID]);
          uint64_t v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "kt_hexString"));

          id v25 = (void *)objc_claimAutoreleasedReturnValue([v17 clientDataHash]);
          __int128 v105 = v21;
          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v21 clientRecordsForHash:v25]);

          __int128 v104 = v26;
          if (v26)
          {
            v113 = (void *)v24;
            __int128 v116 = 0u;
            __int128 v117 = 0u;
            __int128 v114 = 0u;
            __int128 v115 = 0u;
            id v107 = v26;
            id v27 = [v107 countByEnumeratingWithState:&v114 objects:v130 count:16];
            if (!v27) {
              goto LABEL_37;
            }
            id v28 = v27;
            uint64_t v112 = *(void *)v115;
            while (1)
            {
              uint64_t v29 = 0LL;
              do
              {
                if (*(void *)v115 != v112) {
                  objc_enumerationMutation(v107);
                }
                id v30 = *(void **)(*((void *)&v114 + 1) + 8LL * (void)v29);
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[__objc2_class dateWithTimeIntervalSinceReferenceDate:]( v15[45],  "dateWithTimeIntervalSinceReferenceDate:",  a5));
                unsigned int v32 = [v30 marked:v31];

                if (v32)
                {
                  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v30 markedForDeletion]);
                  [v33 timeIntervalSinceReferenceDate];
                  double v35 = a5 - v34;

                  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
                  [v36 setObject:v37 forKeyedSubscript:@"idsResponseTime"];

                  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v30 markedForDeletion]);
                  [v38 timeIntervalSinceReferenceDate];
                  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
                  [v36 setObject:v39 forKeyedSubscript:@"markedForDeletion"];

                  [v36 setObject:v11 forKeyedSubscript:@"accountKey"];
                  [v36 setObject:v113 forKeyedSubscript:@"deviceID"];
                  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v17 clientData]);
                  [v36 setObject:v40 forKeyedSubscript:@"clientData"];

                  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v35));
                  [v36 setObject:v41 forKeyedSubscript:@"since"];

                  float v42 = v35;
                  double v43 = v42;
                  id v44 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:",  @"TransparencyErrorVerify",  -96LL,  2LL,  0LL,  v36,  @"Transparent data is marked for deletion since %.2f",  v42));

                  if (qword_1002EE8E8 != -1) {
                    dispatch_once(&qword_1002EE8E8, &stru_100283D20);
                  }
                  __int16 v45 = (void *)qword_1002EE8F0;
                  if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
                  {
                    id v46 = v45;
                    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
                    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v17 clientData]);
                    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "kt_hexString"));
                    *(_DWORD *)buf = 138544130;
                    v123 = v47;
                    __int16 v124 = 2114;
                    uint64_t v125 = (uint64_t)v113;
                    __int16 v126 = 2112;
                    v127 = v49;
                    __int16 v128 = 2048;
                    double v129 = v43;
                    _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "Transparent data for accountKey %{public}@ and deviceId %{public}@ and clientData %@ is marked since %.2f",  buf,  0x2Au);

                    id v11 = v108;
                  }

                  __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( -[KTTransparentData failureResult:loggableData:]( v111,  "failureResult:loggableData:",  v11,  v17));
                  [v109 addObject:v50];

                  [v17 setResult:0];
                  [v17 setFailure:v44];
                  [v17 setMarked:1];
                  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v30 escrowExpiry]);
                  [v17 setMarkExpiryDate:v51];

                  __int128 v52 = v110;
                  __int128 v15 = off_100275000;
                  if (!v110) {
                    goto LABEL_31;
                  }
                  goto LABEL_29;
                }

                __int128 v53 = (void *)objc_claimAutoreleasedReturnValue( -[__objc2_class dateWithTimeIntervalSinceReferenceDate:]( v15[45],  "dateWithTimeIntervalSinceReferenceDate:",  a5));
                unsigned int v54 = [v30 expired:v53];

                if (v54)
                {
                  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                  __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
                  [v36 setObject:v55 forKeyedSubscript:@"idsResponseTime"];

                  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v30 expiry]);
                  [v56 timeIntervalSinceReferenceDate];
                  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
                  [v36 setObject:v57 forKeyedSubscript:@"expire"];

                  [v36 setObject:v11 forKeyedSubscript:@"accountKey"];
                  [v36 setObject:v113 forKeyedSubscript:@"deviceID"];
                  int v58 = (void *)objc_claimAutoreleasedReturnValue([v17 clientData]);
                  [v36 setObject:v58 forKeyedSubscript:@"clientData"];

                  v59 = (void *)objc_claimAutoreleasedReturnValue([v30 expiry]);
                  id v44 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:",  @"TransparencyErrorVerify",  -238LL,  2LL,  0LL,  v36,  @"Transparent data for accountKey is expired since %@",  v59));

                  if (qword_1002EE8E8 != -1) {
                    dispatch_once(&qword_1002EE8E8, &stru_100283D40);
                  }
                  uint64_t v60 = (void *)qword_1002EE8F0;
                  if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
                  {
                    v61 = v60;
                    id v62 = (void *)objc_claimAutoreleasedReturnValue([v17 clientData]);
                    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "kt_hexString"));
                    v64 = (void *)objc_claimAutoreleasedReturnValue([v30 expiry]);
                    *(_DWORD *)buf = 138544130;
                    v123 = v108;
                    __int16 v124 = 2114;
                    uint64_t v125 = (uint64_t)v113;
                    __int16 v126 = 2112;
                    v127 = v63;
                    __int16 v128 = 2112;
                    double v129 = *(double *)&v64;
                    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_ERROR,  "Transparent data for accountKey %{public}@ and deviceId %{public}@ and clientData %@ is expired since %@",  buf,  0x2Au);
                  }

                  id v11 = v108;
                  v65 = (void *)objc_claimAutoreleasedReturnValue( -[KTTransparentData failureResult:loggableData:]( v111,  "failureResult:loggableData:",  v108,  v17));
                  [v109 addObject:v65];

                  [v17 setResult:0];
                  [v17 setFailure:v44];
                  __int128 v52 = v110;
                  if (!v110) {
                    goto LABEL_31;
                  }
LABEL_29:
                  if (v44) {
                    *__int128 v52 = v44;
                  }
LABEL_31:

                  id v14 = v44;
                  goto LABEL_32;
                }

                v66 = (void *)objc_claimAutoreleasedReturnValue([v17 clientData]);
                [v30 setClientData:v66];

                [v30 setVerified:1];
                if ([v17 result] == (id)2) {
                  [v17 setResult:1];
                }
LABEL_32:
                uint64_t v29 = (char *)v29 + 1;
              }

              while (v28 != v29);
              id v67 = [v107 countByEnumeratingWithState:&v114 objects:v130 count:16];
              id v28 = v67;
              if (!v67)
              {
LABEL_37:

                id v68 = v14;
                id v12 = v101;
                BOOL v13 = v109;
                v69 = v105;
                v70 = v106;
                uint64_t v71 = v113;
                goto LABEL_54;
              }
            }
          }

          v83 = v13;
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
          v85 = (void *)objc_claimAutoreleasedReturnValue([v17 clientData]);
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "kt_hexString"));
          uint64_t v71 = (void *)v24;
          id v68 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -95LL,  @"No transparent data for accountKey %@ and deviceId %@ and clientData %@",  v84,  v24,  v86));

          if (qword_1002EE8E8 != -1) {
            dispatch_once(&qword_1002EE8E8, &stru_100283D00);
          }
          id v87 = (void *)qword_1002EE8F0;
          if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
          {
            v88 = v87;
            uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
            id v90 = (void *)objc_claimAutoreleasedReturnValue([v17 clientData]);
            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "kt_hexString"));
            *(_DWORD *)buf = 138543874;
            v123 = v89;
            __int16 v124 = 2114;
            uint64_t v125 = v24;
            __int16 v126 = 2112;
            v127 = v91;
            _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_ERROR,  "No transparent data for accountKey %{public}@ and deviceId %{public}@ and clientData %@",  buf,  0x20u);
          }

          v92 = (void *)objc_claimAutoreleasedReturnValue( -[KTTransparentData failureResult:loggableData:]( v111,  "failureResult:loggableData:",  v11,  v17));
          BOOL v13 = v83;
          [v83 addObject:v92];

          [v17 setResult:0];
          [v17 setFailure:v68];
          __int128 v15 = off_100275000;
          if (v110)
          {
            v69 = v105;
            v70 = v106;
            id v12 = v101;
            if (v68)
            {
              id v68 = v68;
              *__int128 v110 = v68;
            }
          }

          else
          {
            v69 = v105;
            v70 = v106;
            id v12 = v101;
          }

- (BOOL)validateAndUpdateWithServerLoggableDatas:(id)a3 accountKey:(id)a4 idsResponseTime:(double)a5 error:(id *)a6
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[KTTransparentData failedServerLoggableDatas:accountKey:idsResponseTime:error:]( self,  "failedServerLoggableDatas:accountKey:idsResponseTime:error:",  a3,  a4,  a6,  a5));
  BOOL v7 = v6 == 0LL;

  return v7;
}

- (BOOL)validateOptInHistory:(id)a3 accountKey:(id)a4 responseTime:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a4));
  LOBYTE(a6) = [v12 validateOptInHistory:v11 responseTime:v10 error:a6];

  return (char)a6;
}

- (id)earliestAddedDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  9.22337204e18));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", v4));
  BOOL v7 = v6;
  if (v6)
  {
    __int128 v23 = v6;
    id v24 = v4;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v6 devices]);
    id v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 clientDatas]);
          id v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v29;
            do
            {
              for (j = 0LL; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v29 != v13) {
                  objc_enumerationMutation(v10);
                }
                __int128 v15 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)j);
                uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 addedDate]);
                if (v16)
                {
                  __int128 v17 = (void *)v16;
                  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v15 addedDate]);
                  id v19 = [v18 compare:v5];

                  if (v19 == (id)-1LL)
                  {
                    uint64_t v20 = objc_claimAutoreleasedReturnValue([v15 addedDate]);

                    id v5 = (void *)v20;
                  }
                }
              }

              id v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }

            while (v12);
          }
        }

        id v27 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }

      while (v27);
    }

    BOOL v7 = v23;
    id v4 = v24;
  }

  id v21 = v5;

  return v21;
}

- (unint64_t)accountOptInState:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a3));
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 optInState];
  }
  else {
    unint64_t v5 = 2LL;
  }

  return v5;
}

- (id)accountOptInRecord:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a3));
  id v4 = v3;
  if (v3) {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 optInRecord]);
  }
  else {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (id)accountOptInHistory:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a3));
  id v4 = v3;
  if (v3) {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 optInHistory]);
  }
  else {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (unint64_t)accountEverOptedIn:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a3));
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 everOptedIn];
  }
  else {
    unint64_t v5 = 2LL;
  }

  return v5;
}

- (unint64_t)accountRecentlyOptedIn:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a3));
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 recentlyOptedIn];
  }
  else {
    unint64_t v5 = 2LL;
  }

  return v5;
}

- (unint64_t)verifiedAccountOptInState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData currentPublicID](self, "currentPublicID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 publicKeyInfo]);

  unint64_t v5 = -[KTTransparentData accountOptInState:](self, "accountOptInState:", v4);
  return v5;
}

- (unint64_t)currentAccountOptInState
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    unint64_t v6 = 2LL;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        unsigned __int8 v10 = [v8 active:v9];

        if ((v10 & 1) != 0)
        {
          unint64_t v6 = [v8 optInState];
          goto LABEL_12;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  else
  {
    unint64_t v6 = 2LL;
  }

- (id)currentPublicID
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = self->_accounts;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountKey", (void)v10));

        if (v7)
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountKey]);
          id v3 = (id)objc_claimAutoreleasedReturnValue( +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:]( &OBJC_CLASS___KTAccountPublicID,  "ktAccountPublicIDWithPublicKeyInfo:error:",  v8,  0LL));

          goto LABEL_11;
        }
      }

      id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)optInAfter:(id)a3 accountKey:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountOptInRecord:](self, "accountOptInRecord:", a4));
  id v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v8 timestampMs] / 1000.0));
  if (qword_1002EE8E8 != -1) {
    dispatch_once(&qword_1002EE8E8, &stru_100283D60);
  }
  __int128 v10 = (os_log_s *)qword_1002EE8F0;
  if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    __int128 v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "opted-in peer verification failure ids(%@) optin(%@)",  (uint8_t *)&v14,  0x16u);
  }

  id v11 = [v6 compare:v9];

  if (v11 == (id)-1LL) {
    BOOL v12 = 1;
  }
  else {
LABEL_8:
  }
    BOOL v12 = 0;

  return v12;
}

- (id)expectedSelfResolutionDate:(id)a3 requestDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", v6));
  id v9 = v8;
  if (v8)
  {
    __int128 v28 = v8;
    id v29 = v6;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v8 devices]);
    id v32 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    __int128 v10 = 0LL;
    if (v32)
    {
      uint64_t v31 = *(void *)v39;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v11;
          BOOL v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 clientDatas]);
          id v14 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v35;
            do
            {
              for (i = 0LL; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v35 != v16) {
                  objc_enumerationMutation(v13);
                }
                __int128 v18 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
                id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 addedDate]);
                id v20 = [v7 compare:v19];

                if (v20 != (id)-1 && ([v18 synced] & 1) == 0)
                {
                  if (!v10
                    || (uint64_t v21 = objc_claimAutoreleasedReturnValue([v18 escrowExpiry])) != 0
                    && (BOOL v22 = (void *)v21,
                        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v18 escrowExpiry]),
                        id v24 = [v10 compare:v23],
                        v23,
                        v22,
                        v24 == (id)-1LL))
                  {
                    uint64_t v25 = objc_claimAutoreleasedReturnValue([v18 escrowExpiry]);

                    __int128 v10 = (void *)v25;
                  }
                }
              }

              id v15 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }

            while (v15);
          }

          uint64_t v11 = v33 + 1;
        }

        while ((id)(v33 + 1) != v32);
        id v32 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      }

      while (v32);
    }

    id v9 = v28;
    id v6 = v29;
  }

  else
  {
    if (qword_1002EE8E8 != -1) {
      dispatch_once(&qword_1002EE8E8, &stru_100283D80);
    }
    uint64_t v26 = (os_log_s *)qword_1002EE8F0;
    if (os_log_type_enabled((os_log_t)qword_1002EE8F0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "no account record for account key, so no expected resolution date",  buf,  2u);
    }

    __int128 v10 = 0LL;
  }

  return v10;
}

- (id)getLogDataForAccountKey:(id)a3 uri:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountOptInHistory:](self, "accountOptInHistory:", v6));
  __int128 v10 = v9;
  if (v9 && [v9 count])
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id obj = v10;
    id v11 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v15 timestampMs] / 1000.0));
          id v17 = objc_msgSend( [KTOptIOLogState alloc],  "initWithURI:smtTimestamp:optIn:",  v7,  v16,  objc_msgSend(v15, "optIn"));
          [v8 addObject:v17];
        }

        id v12 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }

      while (v12);
    }

    id v25 = v7;
    uint64_t v26 = v8;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  }

  else
  {
    __int128 v18 = 0LL;
  }

  return v18;
}

- (NSMutableArray)accounts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAccounts:(id)a3
{
}

- (NSData)uriVRFOutput
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUriVRFOutput:(id)a3
{
}

- (NSDate)currentTreeEpochBeginDate
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCurrentTreeEpochBeginDate:(id)a3
{
}

- (BOOL)staticKeyEnforced
{
  return self->_staticKeyEnforced;
}

- (void)setStaticKeyEnforced:(BOOL)a3
{
  self->_staticKeyEnforced = a3;
}

- (NSArray)optInOutHistoryDescription
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (unint64_t)staticKeyStatus
{
  return self->_staticKeyStatus;
}

- (void)setStaticKeyStatus:(unint64_t)a3
{
  self->_staticKeyStatus = a3;
}

- (void).cxx_destruct
{
}

@end