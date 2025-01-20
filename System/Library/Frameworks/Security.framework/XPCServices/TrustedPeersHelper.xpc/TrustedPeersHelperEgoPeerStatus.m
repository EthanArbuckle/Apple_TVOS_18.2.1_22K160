@interface TrustedPeersHelperEgoPeerStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isExcluded;
- (BOOL)isLocked;
- (NSDictionary)peerCountsByMachineID;
- (NSDictionary)viablePeerCountsByModelID;
- (NSString)egoPeerID;
- (NSString)egoPeerMachineID;
- (TrustedPeersHelperEgoPeerStatus)initWithCoder:(id)a3;
- (TrustedPeersHelperEgoPeerStatus)initWithEgoPeerID:(id)a3 egoPeerMachineID:(id)a4 status:(unint64_t)a5 viablePeerCountsByModelID:(id)a6 peerCountsByMachineID:(id)a7 isExcluded:(BOOL)a8 isLocked:(BOOL)a9;
- (id)description;
- (unint64_t)egoStatus;
- (unint64_t)numberOfPeersInOctagon;
- (void)encodeWithCoder:(id)a3;
- (void)setEgoPeerID:(id)a3;
- (void)setEgoPeerMachineID:(id)a3;
- (void)setEgoStatus:(unint64_t)a3;
- (void)setIsExcluded:(BOOL)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setNumberOfPeersInOctagon:(unint64_t)a3;
- (void)setPeerCountsByMachineID:(id)a3;
- (void)setViablePeerCountsByModelID:(id)a3;
@end

@implementation TrustedPeersHelperEgoPeerStatus

- (TrustedPeersHelperEgoPeerStatus)initWithEgoPeerID:(id)a3 egoPeerMachineID:(id)a4 status:(unint64_t)a5 viablePeerCountsByModelID:(id)a6 peerCountsByMachineID:(id)a7 isExcluded:(BOOL)a8 isLocked:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperEgoPeerStatus;
  v19 = -[TrustedPeersHelperEgoPeerStatus init](&v32, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_egoPeerID, a3);
    objc_storeStrong((id *)&v20->_egoPeerMachineID, a4);
    v20->_egoStatus = a5;
    objc_storeStrong((id *)&v20->_viablePeerCountsByModelID, a6);
    objc_storeStrong((id *)&v20->_peerCountsByMachineID, a7);
    v20->_numberOfPeersInOctagon = 0LL;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v17 allValues]);
    id v22 = [v21 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          v20->_numberOfPeersInOctagon += (unint64_t)[*(id *)(*((void *)&v28 + 1) + 8 * (void)i) unsignedIntegerValue];
        }

        id v23 = [v21 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }

      while (v23);
    }

    v20->_isExcluded = a8;
    v20->_isLocked = a9;
  }

  return v20;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus egoPeerID](self, "egoPeerID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus egoPeerMachineID](self, "egoPeerMachineID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<TPHEgoPeerState: %@ (mid:%@)>",  v3,  v4));

  return v5;
}

- (TrustedPeersHelperEgoPeerStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperEgoPeerStatus;
  v5 = -[TrustedPeersHelperEgoPeerStatus init](&v30, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"peerID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    egoPeerID = v5->_egoPeerID;
    v5->_egoPeerID = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"mID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    egoPeerMachineID = v5->_egoPeerMachineID;
    v5->_egoPeerMachineID = (NSString *)v10;

    v5->_egoStatus = (unint64_t)[v4 decodeInt64ForKey:@"egoStatus"];
    v33[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v33[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v33[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 3LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v12));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v13 forKey:@"viablePeerCountsByModelID"]);
    viablePeerCountsByModelID = v5->_viablePeerCountsByModelID;
    v5->_viablePeerCountsByModelID = (NSDictionary *)v14;

    v5->_numberOfPeersInOctagon = 0LL;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](v5->_viablePeerCountsByModelID, "allValues", 0LL));
    id v17 = [v16 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        v20 = 0LL;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          v5->_numberOfPeersInOctagon += (unint64_t)[*(id *)(*((void *)&v26 + 1) + 8 * (void)v20) unsignedIntegerValue];
          v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }

      while (v18);
    }

    v31[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v31[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v31[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 3LL));
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v21));
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v22 forKey:@"peerCountsByMachineID"]);
    peerCountsByMachineID = v5->_peerCountsByMachineID;
    v5->_peerCountsByMachineID = (NSDictionary *)v23;

    v5->_isExcluded = [v4 decodeBoolForKey:@"isExcluded"];
    v5->_isLocked = [v4 decodeBoolForKey:@"isLocked"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus egoPeerID](self, "egoPeerID"));
  [v8 encodeObject:v4 forKey:@"peerID"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus egoPeerMachineID](self, "egoPeerMachineID"));
  [v8 encodeObject:v5 forKey:@"mID"];

  objc_msgSend( v8,  "encodeInt64:forKey:",  -[TrustedPeersHelperEgoPeerStatus egoStatus](self, "egoStatus"),  @"egoStatus");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus viablePeerCountsByModelID](self, "viablePeerCountsByModelID"));
  [v8 encodeObject:v6 forKey:@"viablePeerCountsByModelID"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperEgoPeerStatus peerCountsByMachineID](self, "peerCountsByMachineID"));
  [v8 encodeObject:v7 forKey:@"peerCountsByMachineID"];

  objc_msgSend( v8,  "encodeBool:forKey:",  -[TrustedPeersHelperEgoPeerStatus isExcluded](self, "isExcluded"),  @"isExcluded");
  objc_msgSend( v8,  "encodeBool:forKey:",  -[TrustedPeersHelperEgoPeerStatus isLocked](self, "isLocked"),  @"isLocked");
}

- (unint64_t)egoStatus
{
  return self->_egoStatus;
}

- (void)setEgoStatus:(unint64_t)a3
{
  self->_egoStatus = a3;
}

- (NSString)egoPeerID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEgoPeerID:(id)a3
{
}

- (NSString)egoPeerMachineID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setEgoPeerMachineID:(id)a3
{
}

- (unint64_t)numberOfPeersInOctagon
{
  return self->_numberOfPeersInOctagon;
}

- (void)setNumberOfPeersInOctagon:(unint64_t)a3
{
  self->_numberOfPeersInOctagon = a3;
}

- (NSDictionary)viablePeerCountsByModelID
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setViablePeerCountsByModelID:(id)a3
{
}

- (NSDictionary)peerCountsByMachineID
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPeerCountsByMachineID:(id)a3
{
}

- (BOOL)isExcluded
{
  return self->_isExcluded;
}

- (void)setIsExcluded:(BOOL)a3
{
  self->_isExcluded = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end