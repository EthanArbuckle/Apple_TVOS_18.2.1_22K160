@interface CDRecentServiceInfo
+ (BOOL)supportsSecureCoding;
+ (id)CDRecentServiceInfo:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 info:(id)a7;
- (BOOL)isEmpty;
- (BOOL)updateAmount:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 deductFromCurrentAmount:(BOOL)a7 info:(id)a8;
- (BOOL)validate:(double)a3 atUrgency:(int)a4;
- (CDRecentServiceInfo)initWithAmount:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 info:(id)a7;
- (CDRecentServiceInfo)initWithCoder:(id)a3;
- (NSDictionary)serviceInfo;
- (id)amountAtUrgency:(int)a3 checkTimestamp:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nonPurgeableAmount;
- (id)serialize;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)log;
- (void)setServiceInfo:(id)a3;
- (void)updateInfo:(id)a3;
@end

@implementation CDRecentServiceInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateInfo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    v5 = -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
    v6 = (void *)[v5 mutableCopy];

    if (!v6) {
      v6 = (void *)objc_opt_new();
    }
    v7 = -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
    [v7 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
    }

    else
    {
      [v4 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_7:
        v9 = -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
        [v9 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
        }

        else
        {
          [v4 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16) {
            goto LABEL_10;
          }
          [v4 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 setObject:v17 forKeyedSubscript:@"CACHE_DELETE_PROCNAME"];

          v18 = (void *)[v6 copy];
          -[CDRecentServiceInfo setServiceInfo:](self, "setServiceInfo:", v18);

          CDGetLogHandle((uint64_t)"client");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
          {
            v19 = -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
            [v19 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            int v21 = 138412290;
            v22 = v20;
            _os_log_impl( &dword_1874E4000,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "CDRecentServiceInfo updated procname: %@",  (uint8_t *)&v21,  0xCu);
          }
        }

LABEL_10:
        goto LABEL_11;
      }

      [v4 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v12 forKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];

      v13 = (void *)[v6 copy];
      -[CDRecentServiceInfo setServiceInfo:](self, "setServiceInfo:", v13);

      CDGetLogHandle((uint64_t)"client");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
        [v14 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        int v21 = 138412290;
        v22 = v15;
        _os_log_impl( &dword_1874E4000,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "CDRecentServiceInfo updated signingID: %@",  (uint8_t *)&v21,  0xCu);
      }
    }

    goto LABEL_7;
  }

- (CDRecentServiceInfo)initWithAmount:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 info:(id)a7
{
  v30[1] = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CDRecentServiceInfo;
  v15 = -[CDRecentServiceInfo init](&v28, sel_init);
  v16 = v15;
  if (!v15)
  {
LABEL_19:
    int v21 = v16;
    goto LABEL_20;
  }

  if (v12 && a4)
  {
    *(_OWORD *)(v15 + 8) = 0u;
    v17 = v15 + 8;
    *((void *)v15 + 9) = 0LL;
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    else {
      int v18 = 2;
    }
    *(_OWORD *)(v15 + 24) = 0uLL;
    if ([v12 longLongValue] < 0) {
      uint64_t v19 = 0LL;
    }
    else {
      uint64_t v19 = [v12 unsignedLongLongValue];
    }
    v22 = &v17[16 * v18];
    *((void *)v22 + 1) = v19;
    *(double *)v22 = a5;
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16[9] = [v13 unsignedLongLongValue];
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = @"CACHE_DELETE_ITEMIZED_NONPURGEABLE";
          v30[0] = v13;
          uint64_t v23 = [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:&v29 count:1];
          v24 = (void *)v16[10];
          v16[10] = v23;

          tallyDict(v13);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v16[9] = [v25 unsignedLongLongValue];
        }
      }
    }

    [v16 updateInfo:v14];
    goto LABEL_19;
  }

  CDGetLogHandle((uint64_t)"client");
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __int16 v27 = 0;
    _os_log_error_impl( &dword_1874E4000,  v20,  OS_LOG_TYPE_ERROR,  "parameter error, must supply amount and urgency",  (uint8_t *)&v27,  2u);
  }

  int v21 = 0LL;
LABEL_20:

  return v21;
}

+ (id)CDRecentServiceInfo:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 info:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  id v14 = -[CDRecentServiceInfo initWithAmount:atUrgency:withTimestamp:nonPurgeableAmount:info:]( objc_alloc(&OBJC_CLASS___CDRecentServiceInfo),  "initWithAmount:atUrgency:withTimestamp:nonPurgeableAmount:info:",  v13,  v9,  v12,  v11,  a5);

  return v14;
}

- (BOOL)validate:(double)a3 atUrgency:(int)a4
{
  int v5 = a4 - 1;
  [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:self->recentinfo.urgencies[v5].timestamp];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = validateTimestamp(v6, a3);

  return v7;
}

- (id)serialize
{
  v3 = (void *)MEMORY[0x1896079E8];
  -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = 0LL;
  [v3 dataWithPropertyList:v4 format:200 options:0 error:&v10];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FB8]), "initWithCapacity:", objc_msgSend(v5, "length") + 72);
  [v6 appendBytes:&self->recentinfo length:72];
  id v7 = v5;
  objc_msgSend(v6, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  v8 = (void *)[v6 copy];

  return v8;
}

- (CDRecentServiceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CDRecentServiceInfo;
  int v5 = -[CDRecentServiceInfo init](&v16, sel_init);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_SERVICE_INFO"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)[v6 length] >= 0x48)
    {
      id v7 = v6;
      uint64_t v8 = [v7 bytes];
      *(_OWORD *)(v5 + 8) = *(_OWORD *)v8;
      __int128 v10 = *(_OWORD *)(v8 + 32);
      __int128 v9 = *(_OWORD *)(v8 + 48);
      uint64_t v11 = *(void *)(v8 + 64);
      *(_OWORD *)(v5 + 24) = *(_OWORD *)(v8 + 16);
      *((void *)v5 + 9) = v11;
      *(_OWORD *)(v5 + 56) = v9;
      *(_OWORD *)(v5 + 40) = v10;
      if ((unint64_t)[v7 length] >= 0x49)
      {
        uint64_t v12 = [v7 length] - 72;
        objc_msgSend( MEMORY[0x189603F48], "dataWithBytes:length:", objc_msgSend(v7, "bytes") + 72, v12);
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x1896079E8] propertyListWithData:v13 options:0 format:0 error:0];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setServiceInfo:v14];
      }
    }
  }

  return (CDRecentServiceInfo *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[CDRecentServiceInfo serialize](self, "serialize");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"CACHE_DELETE_SERVICE_INFO"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___CDRecentServiceInfo);
  v4->recentinfo.urgencies[0] = self->recentinfo.urgencies[0];
  $C140E3A606D9645FEAC1A095AC7A3D5E v5 = self->recentinfo.urgencies[2];
  $C140E3A606D9645FEAC1A095AC7A3D5E v6 = self->recentinfo.urgencies[3];
  unint64_t non_purgeable_amount = self->recentinfo.non_purgeable_amount;
  v4->recentinfo.urgencies[1] = self->recentinfo.urgencies[1];
  v4->recentinfo.unint64_t non_purgeable_amount = non_purgeable_amount;
  v4->recentinfo.urgencies[3] = v6;
  v4->recentinfo.urgencies[2] = v5;
  -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v9 = (void *)[v8 copy];
  -[CDRecentServiceInfo setServiceInfo:](v4, "setServiceInfo:", v9);

  return v4;
}

- (id)amountAtUrgency:(int)a3 checkTimestamp:(BOOL)a4
{
  else {
    int v4 = 2;
  }
  p_recentinfo = &self->recentinfo;
  p_timestamp = &self->recentinfo.urgencies[v4].timestamp;
  if (*p_timestamp == 0.0) {
    goto LABEL_15;
  }
  int v7 = v4;
  uint64_t v8 = &p_recentinfo->urgencies[v4];
  unint64_t amount = v8->amount;
  p_unint64_t amount = &v8->amount;
  unint64_t v9 = amount;
  if (*p_timestamp == 1.0 && v9 == 0) {
    goto LABEL_15;
  }
  BOOL v13 = a4;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= 2
    && v13
    && v14
    && *p_timestamp < p_recentinfo->urgencies[v7 - 1].timestamp
    && *p_amount < p_recentinfo->urgencies[v7 - 1].amount)
  {

LABEL_15:
    id v14 = 0LL;
  }

  return v14;
}

- (id)nonPurgeableAmount
{
  return (id)[MEMORY[0x189607968] numberWithUnsignedLongLong:self->recentinfo.non_purgeable_amount];
}

- (BOOL)updateAmount:(id)a3 atUrgency:(int)a4 withTimestamp:(double)a5 nonPurgeableAmount:(id)a6 deductFromCurrentAmount:(BOOL)a7 info:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a6;
  -[CDRecentServiceInfo updateInfo:](self, "updateInfo:", a8);
  else {
    int v16 = 2;
  }
  uint64_t v17 = [v14 unsignedLongLongValue];
  if (v9)
  {
    BOOL v18 = v17 != 0;
    uint64_t v19 = (char *)self + 16 * v16;
    uint64_t v20 = v16;
    unint64_t v22 = *((void *)v19 + 2);
    int v21 = v19 + 16;
    if (v22 <= [v14 unsignedLongLongValue]) {
      *int v21 = 0LL;
    }
    else {
      *v21 -= [v14 unsignedLongLongValue];
    }
  }

  else
  {
    uint64_t v23 = (char *)self + 16 * v16;
    uint64_t v20 = v16;
    uint64_t v25 = *((void *)v23 + 2);
    v24 = v23 + 16;
    if (v17 == v25)
    {
      BOOL v18 = 0;
    }

    else
    {
      void *v24 = [v14 unsignedLongLongValue];
      BOOL v18 = 1;
    }
  }

  self->recentinfo.urgencies[v20].timestamp = a5;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->recentinfo.unint64_t non_purgeable_amount = [v15 unsignedLongLongValue];
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
        __int16 v27 = (void *)[v26 mutableCopy];

        [v27 setObject:v15 forKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
        objc_super v28 = (NSDictionary *)[v27 copy];
        serviceInfo = self->_serviceInfo;
        self->_serviceInfo = v28;

        tallyDict(v15);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        self->recentinfo.unint64_t non_purgeable_amount = [v30 unsignedLongLongValue];
      }
    }
  }

  return v18;
}

- (BOOL)isEmpty
{
  if (self->recentinfo.urgencies[0].timestamp > 0.0) {
    return 0;
  }
  unint64_t v3 = 0LL;
  int v4 = &self->recentinfo.urgencies[1];
  do
  {
    unint64_t v5 = v3;
    if (v3 == 3) {
      break;
    }
    double timestamp = v4->timestamp;
    ++v4;
    ++v3;
  }

  while (timestamp <= 0.0);
  return v5 > 2;
}

- (void)invalidate
{
  for (uint64_t i = 0LL; i != 4; ++i)
    self->recentinfo.urgencies[i].double timestamp = 1.0;
}

- (void)log
{
  uint64_t v2 = 0LL;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  p_unint64_t amount = &self->recentinfo.urgencies[0].amount;
  do
  {
    CDGetLogHandle((uint64_t)"client");
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = *p_amount;
      [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:*((double *)p_amount - 1)];
      $C140E3A606D9645FEAC1A095AC7A3D5E v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      int v8 = v2;
      __int16 v9 = 2048;
      unint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl( &dword_1874E4000,  v4,  OS_LOG_TYPE_DEFAULT,  "     urgency %d, amount : %llu, timestamp: %@",  buf,  0x1Cu);
    }

    ++v2;
    p_amount += 2;
  }

  while (v2 != 4);
}

- (id)description
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_unint64_t amount = &self->recentinfo.urgencies[0].amount;
  uint64_t v6 = -4LL;
  do
  {
    int v7 = (void *)NSString;
    unint64_t v8 = *p_amount;
    unint64_t v9 = (unint64_t)*((double *)p_amount - 1);
    if (v9)
    {
      objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceReferenceDate:");
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v10 = v2;
    }

    else
    {
      unint64_t v10 = 0LL;
    }

    [v7 stringWithFormat:@"u:%d : %llu : %@", v6 + 5, v8, v10];
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v11];

    if (v9) {
    p_amount += 2;
    }
  }

  while (!__CFADD__(v6++, 1LL));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * v16);
        BOOL v18 = (void *)NSString;
        -[CDRecentServiceInfo serviceInfo](self, "serviceInfo");
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 objectForKeyedSubscript:v17];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 stringWithFormat:@"%@ : %@", v17, v20];
        int v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 addObject:v21];

        ++v16;
      }

      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v14);
  }

  objc_msgSend(v4, "componentsJoinedByString:", @", ");
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
}

- (void)setServiceInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end