@interface LogEntry
+ (id)descriptor;
- (KTOptInManagerServer)optInServer;
- (NSDictionary)metadata;
- (TransparencyFollowUpProtocol)followUp;
- (TransparencyLogEntryVerifier)verifier;
- (TransparencyManagedDataStore)dataStore;
- (id)diagnosticsJsonDictionary;
- (unint64_t)setInclusionResult:(unint64_t)a3 signedLogHead:(id)a4 error:(id *)a5;
- (unint64_t)verifyTLTEntryForPerApplicationLogHead:(id)a3 error:(id *)a4;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setOptInServer:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation LogEntry

+ (id)descriptor
{
  id v2 = (id)qword_1002EE960;
  if (!qword_1002EE960)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___LogEntry,  @"LogEntry",  &unk_1002E4B60,  &off_1002E4D58,  6LL,  48LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C428];
    qword_1002EE960 = (uint64_t)v2;
  }

  return v2;
}

- (TransparencyLogEntryVerifier)verifier
{
  return (TransparencyLogEntryVerifier *)objc_getAssociatedObject(self, @"verifierKey");
}

- (void)setVerifier:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, @"dataStoreKey");
}

- (void)setDataStore:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, @"metadata");
}

- (void)setMetadata:(id)a3
{
}

- (KTOptInManagerServer)optInServer
{
  return (KTOptInManagerServer *)objc_getAssociatedObject(self, @"optInServerKey");
}

- (void)setOptInServer:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(self, @"optInServerKey", a3, (void *)1);
  }
}

- (TransparencyFollowUpProtocol)followUp
{
  return (TransparencyFollowUpProtocol *)objc_getAssociatedObject(self, @"followUpKey");
}

- (void)setFollowUp:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(self, @"followUpKey", a3, (void *)1);
  }
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry metadata](self, "metadata"));
    v8 = (NSMutableDictionary *)[v7 mutableCopy];

    if (!v8) {
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v6);
    -[LogEntry setMetadata:](self, "setMetadata:", v8);
  }
}

- (id)diagnosticsJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unint64_t v4 = LogType_EnumDescriptor();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textFormatNameForValue:", -[LogEntry logType](self, "logType")));
  [v3 setObject:v6 forKeyedSubscript:@"logType"];

  unint64_t v7 = NodeType_EnumDescriptor();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textFormatNameForValue:", -[LogEntry nodeType](self, "nodeType")));
  [v3 setObject:v9 forKeyedSubscript:@"nodeType"];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[LogEntry nodePosition](self, "nodePosition")));
  [v3 setObject:v10 forKeyedSubscript:@"nodePosition"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry nodeBytes](self, "nodeBytes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
  [v3 setObject:v12 forKeyedSubscript:@"nodeBytes"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray", 0LL));
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)v18), "kt_hexString"));
        [v13 addObject:v19];

        v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v16);
  }

  [v3 setObject:v13 forKeyedSubscript:@"hashesOfPeersInPathToRoot"];
  if (-[LogEntry hasSlh](self, "hasSlh"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry slh](self, "slh"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](&OBJC_CLASS___SignedLogHead, "signedTypeWithObject:", v20));

    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 diagnosticsJsonDictionary]);
    [v3 setObject:v22 forKeyedSubscript:@"slh"];
  }

  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  if (!-[LogEntry hasSlh](self, "hasSlh")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry slh](self, "slh")), v5, !v5))
  {
    uint64_t v13 = -18LL;
    if (!a3)
    {
LABEL_12:
      if (qword_1002EEE70 != -1) {
        dispatch_once(&qword_1002EEE70, &stru_100289638);
      }
      v14 = (os_log_s *)qword_1002EEE78;
      if (os_log_type_enabled((os_log_t)qword_1002EEE78, OS_LOG_TYPE_ERROR))
      {
        int v27 = 134217984;
        uint64_t v28 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "log entry missing data required for verification: %ld",  (uint8_t *)&v27,  0xCu);
      }

      return 0LL;
    }

- (unint64_t)setInclusionResult:(unint64_t)a3 signedLogHead:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  unint64_t v31 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry dataStore](self, "dataStore"));
  [v8 setDataStore:v9];

  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_1001C1438;
  __int128 v26 = sub_1001C1448;
  id v27 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[LogEntry dataStore](self, "dataStore"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001C1450;
  v15[3] = &unk_1002896C0;
  id v11 = v8;
  v18 = &v28;
  v19 = &v22;
  id v16 = v11;
  uint64_t v17 = self;
  unint64_t v20 = a3;
  v21 = a5;
  [v10 performBlockAndWait:v15];

  if (a5)
  {
    id v12 = (void *)v23[5];
    if (v12) {
      *a5 = v12;
    }
  }

  unint64_t v13 = v29[3];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (unint64_t)verifyTLTEntryForPerApplicationLogHead:(id)a3 error:(id *)a4
{
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_1001C1ABC;
  id v12 = &unk_100289748;
  unint64_t v13 = self;
  id v14 = a3;
  id v5 = v14;
  uint64_t v6 = objc_retainBlock(&v9);
  id v7 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:]( &OBJC_CLASS___TransparencyAnalytics,  "doKTResultWithAnalyticsForEventName:validateType:error:block:",  @"ktTLTVerifyInclusionProofEvent",  3LL,  a4,  v6,  v9,  v10,  v11,  v12,  v13);

  return (unint64_t)v7;
}

@end