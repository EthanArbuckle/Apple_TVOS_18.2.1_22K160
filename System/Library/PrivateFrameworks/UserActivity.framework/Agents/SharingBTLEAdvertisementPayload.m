@interface SharingBTLEAdvertisementPayload
+ (id)dateEpochStart:(id)a3;
- (BOOL)compareOptionBits:(unsigned __int8)a3;
- (BOOL)containsPasteboard;
- (BOOL)isCurrent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualHashedPayloadBytes:(id)a3;
- (BOOL)matchesItem:(id)a3;
- (NSData)payloadBytes;
- (NSDate)currentUntil;
- (NSDate)epochEnd;
- (NSDate)epochStart;
- (NSDate)time;
- (NSDate)validUntil;
- (NSDate)when;
- (NSDictionary)options;
- (NSUUID)activityUUID;
- (SharingBTLEAdvertisementPayload)initWithAdvertisedBytes:(id)a3;
- (SharingBTLEAdvertisementPayload)initWithAdvertisedBytes:(id)a3 options:(id)a4;
- (SharingBTLEAdvertisementPayload)initWithItem:(id)a3 isCurrent:(BOOL)a4 when:(id)a5;
- (SharingBTLEAdvertisementPayload)initWithItem:(id)a3 isCurrent:(BOOL)a4 when:(id)a5 versionFlags:(unsigned __int8)a6;
- (SharingBTLEAdvertisementPayload)initWithSFActivityAdvertisement:(id)a3;
- (SharingBTLEAdvertisementPayload)initWithType:(unint64_t)a3 string:(id)a4 dynamicType:(id)a5 teamID:(id)a6 webpageURL:(id)a7 options:(id)a8 isCurrent:(BOOL)a9 when:(id)a10;
- (SharingBTLEAdvertisementPayload)initWithType:(unint64_t)a3 string:(id)a4 dynamicType:(id)a5 teamID:(id)a6 webpageURL:(id)a7 options:(id)a8 isCurrent:(BOOL)a9 when:(id)a10 versionFlags:(unsigned __int8)a11;
- (id)advertisementPayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)now;
- (int)advertisementKind;
- (unsigned)optionBits;
- (unsigned)timeOffset;
- (void)setCurrent:(BOOL)a3;
- (void)setEpochStart:(id)a3;
- (void)setOptionBits:(unsigned __int8)a3;
- (void)setOptions:(id)a3;
- (void)setPayloadBytes:(id)a3;
- (void)setTimeOffset:(unsigned __int8)a3;
- (void)setWhen:(id)a3;
@end

@implementation SharingBTLEAdvertisementPayload

- (SharingBTLEAdvertisementPayload)initWithItem:(id)a3 isCurrent:(BOOL)a4 when:(id)a5 versionFlags:(unsigned __int8)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 type];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 activityType]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 dynamicActivityType]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 teamIdentifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 webpageURL]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 options]);
  LOBYTE(v20) = a6;
  LOBYTE(v19) = a4;
  v17 = -[SharingBTLEAdvertisementPayload initWithType:string:dynamicType:teamID:webpageURL:options:isCurrent:when:versionFlags:]( self,  "initWithType:string:dynamicType:teamID:webpageURL:options:isCurrent:when:versionFlags:",  v11,  v12,  v13,  v14,  v15,  v16,  v19,  v10,  v20);

  return v17;
}

- (SharingBTLEAdvertisementPayload)initWithItem:(id)a3 isCurrent:(BOOL)a4 when:(id)a5
{
  return -[SharingBTLEAdvertisementPayload initWithItem:isCurrent:when:versionFlags:]( self,  "initWithItem:isCurrent:when:versionFlags:",  a3,  a4,  a5,  0LL);
}

- (SharingBTLEAdvertisementPayload)initWithType:(unint64_t)a3 string:(id)a4 dynamicType:(id)a5 teamID:(id)a6 webpageURL:(id)a7 options:(id)a8 isCurrent:(BOOL)a9 when:(id)a10 versionFlags:(unsigned __int8)a11
{
  id v70 = a4;
  id v71 = a5;
  id v72 = a6;
  id v73 = a7;
  id v17 = a8;
  id v74 = a10;
  v75.receiver = self;
  v75.super_class = (Class)&OBJC_CLASS___SharingBTLEAdvertisementPayload;
  v18 = -[SharingBTLEAdvertisementPayload init](&v75, "init");
  if (v18)
  {
    id v19 = v70;
    id v69 = v71;
    id v20 = v72;
    id v21 = v73;
    id v22 = 0LL;
    uint64_t v23 = 1LL;
    if ((uint64_t)a3 > 2)
    {
      switch(a3)
      {
        case 3uLL:
          id v22 = v19;
          uint64_t v23 = 3LL;
          break;
        case 0x15uLL:
          *(_DWORD *)&buf[3] = 1196312912;
          *(_DWORD *)buf = 1342177280;
          uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 7LL));
LABEL_12:
          v26 = (void *)v24;
          id v22 = 0LL;
          uint64_t v23 = 1LL;
          if (v24) {
            goto LABEL_24;
          }
          break;
        case 0x16uLL:
          *(_DWORD *)&buf[3] = 1196314448;
          *(_DWORD *)buf = 1342177280;
          uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 7LL));
          goto LABEL_12;
      }

- (SharingBTLEAdvertisementPayload)initWithType:(unint64_t)a3 string:(id)a4 dynamicType:(id)a5 teamID:(id)a6 webpageURL:(id)a7 options:(id)a8 isCurrent:(BOOL)a9 when:(id)a10
{
  LOBYTE(v12) = 0;
  LOBYTE(v11) = a9;
  return -[SharingBTLEAdvertisementPayload initWithType:string:dynamicType:teamID:webpageURL:options:isCurrent:when:versionFlags:]( self,  "initWithType:string:dynamicType:teamID:webpageURL:options:isCurrent:when:versionFlags:",  a3,  a4,  a5,  a6,  a7,  a8,  v11,  a10,  v12);
}

- (SharingBTLEAdvertisementPayload)initWithSFActivityAdvertisement:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___SharingBTLEAdvertisementPayload;
  v5 = -[SharingBTLEAdvertisementPayload init](&v28, "init");
  v6 = v5;
  if (v5)
  {
    activityUUID = v5->_activityUUID;
    v5->_activityUUID = 0LL;

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 advertisementPayload]);
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 advertisementPayload]);
      id v10 = [v9 length];

      if (v10 == (id)9)
      {
        id v11 = objc_claimAutoreleasedReturnValue([v4 advertisementPayload]);
        uint64_t v12 = [v11 bytes];
        uint64_t v13 = *(void *)v12;
        v6->_bytes.timeOffset = v12[8];
        *(void *)v6->_bytes.hashedAdvertisementBytes = v13;
      }
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v15));
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 options]);
    options = v6->_options;
    v6->_options = (NSDictionary *)v17;

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[SharingBTLEAdvertisementPayload dateEpochStart:]( &OBJC_CLASS___SharingBTLEAdvertisementPayload,  "dateEpochStart:",  v19));
    epochStart = v6->_epochStart;
    v6->_epochStart = (NSDate *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload time](v6, "time"));
    when = v6->_when;
    v6->_when = (NSDate *)v22;

    unsigned __int8 optionBits = v6->_bytes.optionBits;
    if ((optionBits & 1) != 0)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:UAUserActivityHasWebPageURLOptionKey];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
    }

    if ((optionBits & 2) != 0)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:_LSUserActivityContainsFileProviderURLKey];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
    }

    if ((optionBits & 4) != 0)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:_UAUserActivityContainsCloudDocsKey];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
    }

    if ((optionBits & 8) != 0)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UAPasteboardAvailable"];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
      if ((optionBits & 0x10) != 0)
      {
        [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UAPasteboardVersionBit"];
        unsigned __int8 optionBits = v6->_bytes.optionBits;
      }
    }

    if ((optionBits & 0x20) != 0)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:UAUserActivityAutoPullActivitiesListKey];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
    }

    if ((optionBits & 0x40) != 0)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UAUserActivityAdvertiserHasMoreActivities"];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
    }

    if ((optionBits & 0x80) != 0) {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UAUserActivityItemIsNotActiveKey"];
    }
    v25 = (NSDictionary *)[v16 copy];
    v26 = v6->_options;
    v6->_options = v25;
  }

  return v6;
}

- (SharingBTLEAdvertisementPayload)initWithAdvertisedBytes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SharingBTLEAdvertisementPayload;
  v8 = -[SharingBTLEAdvertisementPayload init](&v18, "init");
  id v9 = v8;
  if (v8)
  {
    activityUUID = v8->_activityUUID;
    v8->_activityUUID = 0LL;

    if (v7)
    {
      id v11 = (NSDictionary *)[v7 copy];
      options = v9->_options;
      v9->_options = v11;
    }

    else
    {
      options = v9->_options;
      v9->_options = 0LL;
    }

    if (v6)
    {
      if ([v6 length] == (id)9)
      {
        uint64_t v13 = [v6 bytes];
        uint64_t v14 = *(void *)v13;
        v9->_bytes.timeOffset = v13[8];
        *(void *)v9->_bytes.hashedAdvertisementBytes = v14;
        goto LABEL_11;
      }

      if ([v6 length] == (id)7)
      {
        v15 = (int *)[v6 bytes];
        int v16 = *v15;
        *(_DWORD *)&v9->_bytes.hashedAdvertisementBytes[3] = *(int *)((char *)v15 + 3);
        *(_DWORD *)v9->_bytes.hashedAdvertisementBytes = v16;
        *(_WORD *)&v9->_bytes.unsigned __int8 optionBits = 0;
        goto LABEL_11;
      }
    }

    v9->_bytes.timeOffset = 0;
    *(void *)v9->_bytes.hashedAdvertisementBytes = 0LL;
  }

- (SharingBTLEAdvertisementPayload)initWithAdvertisedBytes:(id)a3
{
  return -[SharingBTLEAdvertisementPayload initWithAdvertisedBytes:options:]( self,  "initWithAdvertisedBytes:options:",  a3,  0LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___SharingBTLEAdvertisementPayload);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &self->_bytes, 9LL));
  id v6 = -[SharingBTLEAdvertisementPayload initWithAdvertisedBytes:](v4, "initWithAdvertisedBytes:", v5);

  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload epochStart](self, "epochStart"));
    epochStart = v6->_epochStart;
    v6->_epochStart = (NSDate *)v7;
  }

  return v6;
}

- (NSData)payloadBytes
{
  return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &self->_bytes, 7LL);
}

- (void)setPayloadBytes:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 length] != (id)8) {
      __assert_rtn( "-[SharingBTLEAdvertisementPayload setPayloadBytes:]",  "SharingAdvertisementPayload.mm",  376,  "[payloadBytes length] == sizeof( sizeof( _bytes.hashedAdvertisementBytes))");
    }
    [v5 getBytes:&self->_bytes length:7];
  }

  else
  {
    self->_bytes.timeOffset = 0;
    *(void *)self->_bytes.hashedAdvertisementBytes = 0LL;
  }
}

- (BOOL)isCurrent
{
  return self->_bytes.timeOffset >> 7;
}

- (void)setCurrent:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  self->_bytes.timeOffset = v3 & 0x80 | self->_bytes.timeOffset & 0x7F;
}

- (unsigned)timeOffset
{
  return self->_bytes.timeOffset & 0x7F;
}

- (void)setTimeOffset:(unsigned __int8)a3
{
  self->_bytes.timeOffset = self->_bytes.timeOffset & 0x80 | a3 & 0x7F;
}

- (unsigned)optionBits
{
  return self->_bytes.optionBits;
}

- (void)setOptionBits:(unsigned __int8)a3
{
  self->_bytes.unsigned __int8 optionBits = a3;
}

- (BOOL)compareOptionBits:(unsigned __int8)a3
{
  return ((self->_bytes.optionBits ^ a3) & 7) == 0;
}

- (BOOL)containsPasteboard
{
  return (self->_bytes.optionBits >> 3) & 1;
}

- (id)advertisementPayload
{
  return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &self->_bytes, 9LL);
}

- (int)advertisementKind
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &self->_bytes, 9LL));
  uint64_t v3 = _LSAdvertisementBytesKind(v2);
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (SharingBTLEAdvertisementPayload *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    unsigned int v5 = -[SharingBTLEAdvertisementPayload optionBits](self, "optionBits");
    if (v5 == -[SharingBTLEAdvertisementPayload optionBits](v4, "optionBits")
      && ((unsigned int v6 = -[SharingBTLEAdvertisementPayload isCurrent](self, "isCurrent"),
           v6 == -[SharingBTLEAdvertisementPayload isCurrent](v4, "isCurrent"))
       || (unsigned int v7 = -[SharingBTLEAdvertisementPayload timeOffset](self, "timeOffset"),
           v7 == -[SharingBTLEAdvertisementPayload timeOffset](v4, "timeOffset"))))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload payloadBytes](self, "payloadBytes"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload payloadBytes](v4, "payloadBytes"));
      unsigned __int8 v10 = [v8 isEqual:v9];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isEqualHashedPayloadBytes:(id)a3
{
  if (!a3) {
    return 0;
  }
  return *(_DWORD *)self->_bytes.hashedAdvertisementBytes == *((_DWORD *)a3 + 2)
      && *(_DWORD *)&self->_bytes.hashedAdvertisementBytes[3] == *(_DWORD *)((char *)a3 + 11);
}

- (BOOL)matchesItem:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[SharingBTLEAdvertisementPayload initWithItem:isCurrent:when:]( objc_alloc(&OBJC_CLASS___SharingBTLEAdvertisementPayload),  "initWithItem:isCurrent:when:",  v4,  0LL,  0LL);
  id v6 = objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload payloadBytes](self, "payloadBytes"));
  unsigned int v7 = [v6 bytes];
  id v8 = objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload payloadBytes](v5, "payloadBytes"));
  id v9 = [v8 bytes];
  BOOL v11 = *v7 == *v9 && *(_DWORD *)((char *)v7 + 3) == *(_DWORD *)((char *)v9 + 3);

  return v11;
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload payloadBytes](self, "payloadBytes"));
  id v4 = sub_1000034D8(v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = &stru_1000BE738;
  if (-[SharingBTLEAdvertisementPayload isCurrent](self, "isCurrent")) {
    unsigned int v7 = @"*";
  }
  else {
    unsigned int v7 = &stru_1000BE738;
  }
  uint64_t v8 = -[SharingBTLEAdvertisementPayload timeOffset](self, "timeOffset");
  if ((-[SharingBTLEAdvertisementPayload optionBits](self, "optionBits") & 1) != 0) {
    id v9 = @" u";
  }
  else {
    id v9 = &stru_1000BE738;
  }
  if ((-[SharingBTLEAdvertisementPayload optionBits](self, "optionBits") & 2) != 0) {
    id v6 = @" fp";
  }
  if ((-[SharingBTLEAdvertisementPayload optionBits](self, "optionBits") & 4) != 0) {
    unsigned __int8 v10 = " cloud";
  }
  else {
    unsigned __int8 v10 = "";
  }
  BOOL v11 = "";
  if ((-[SharingBTLEAdvertisementPayload optionBits](self, "optionBits") & 8) != 0)
  {
    if ((-[SharingBTLEAdvertisementPayload optionBits](self, "optionBits") & 0x10) != 0) {
      BOOL v11 = " pb-1";
    }
    else {
      BOOL v11 = " pb-0";
    }
  }

  unsigned __int8 v12 = -[SharingBTLEAdvertisementPayload optionBits](self, "optionBits");
  uint64_t v13 = " ap";
  if ((v12 & 0x20) == 0) {
    uint64_t v13 = "";
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"$%@/%@%d%@%@%s%s%s",  v5,  v7,  v8,  v9,  v6,  v10,  v11,  v13));

  return v14;
}

+ (id)dateEpochStart:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceReferenceDate];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  trunc(v5 / 496.0) * 496.0));
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (NSDate)time
{
  unsigned int v2 = -[SharingBTLEAdvertisementPayload timeOffset](self, "timeOffset");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SharingBTLEAdvertisementPayload dateEpochStart:]( &OBJC_CLASS___SharingBTLEAdvertisementPayload,  "dateEpochStart:",  v3));
  [v3 timeIntervalSinceReferenceDate];
  double v6 = v5;
  [v4 timeIntervalSinceReferenceDate];
  double v8 = v6 - v7;
  uint64_t v9 = (uint64_t)v8;
  uint64_t v10 = (uint64_t)v8 + 3;
  if (v2 == 255)
  {
    os_log_t v22 = sub_100039584(0LL);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v37) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "TIME: -- since timeOffsetByteInTicks == 0xff, storing maximum age time.",  (uint8_t *)&v37,  2u);
    }

    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -500.0));
  }

  else
  {
    uint64_t v11 = v10 >> 2;
    unsigned __int8 v12 = (void *)(v2 & 0x7F);
    uint64_t v13 = 4 * ((v10 >> 2) - (void)v12);
    uint64_t v14 = -496 - v13;
    if (v13 + 496 > 247) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v15 = v14;
    }
    if (v15 < 248)
    {
      if (v15 < 1)
      {
        uint64_t v27 = v15 + v9;
        id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v4,  (double)(v15 + v9)));
        os_log_t v28 = sub_100039584(0LL);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          os_log_t v29 = sub_1000758E0(v17);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          int v37 = 134219266;
          uint64_t v38 = v11;
          __int16 v39 = 2048;
          v40 = v12;
          __int16 v41 = 2048;
          uint64_t v42 = v15;
          __int16 v43 = 2048;
          uint64_t v44 = v27;
          __int16 v45 = 2114;
          id v46 = v17;
          __int16 v47 = 2114;
          unsigned int v48 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "TIME: --- Guessing that their clock is the same or behind of our clock, and in the same epoch, ourOffset=%ld , theirs %ld, so setting result to delta (%ld) + %ld seconds from epoch, result=%{public}@/%{public}@",  (uint8_t *)&v37,  0x3Eu);
        }
      }

      else
      {
        id v17 = v3;
        os_log_t v24 = sub_100039584(0LL);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v25 = sub_1000758E0(v17);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          int v37 = 134218754;
          uint64_t v38 = v11;
          __int16 v39 = 2048;
          v40 = v12;
          __int16 v41 = 2114;
          uint64_t v42 = (uint64_t)v17;
          __int16 v43 = 2114;
          uint64_t v44 = (uint64_t)v26;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "TIME: --- Guessing that their clock is somewhat ahead of our clock, and in the same epoch, ourOffset=%ld, th eirs %ld, so setting result == no, result=%{public}@=%{public}@",  (uint8_t *)&v37,  0x2Au);
        }
      }
    }

    else
    {
      uint64_t v16 = v15 - 496;
      id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v4,  (double)(v16 + v9)));
      os_log_t v18 = sub_100039584(0LL);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = sub_1000758E0(v17);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        int v37 = 134219266;
        uint64_t v38 = v11;
        __int16 v39 = 2048;
        v40 = v12;
        __int16 v41 = 2048;
        uint64_t v42 = -496LL;
        __int16 v43 = 2048;
        uint64_t v44 = v16;
        __int16 v45 = 2114;
        id v46 = v17;
        __int16 v47 = 2114;
        unsigned int v48 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "TIME: --- Guessing that their clock and our clock are in different epochs, ourOffset=%ld, theirs %ld, so falli ng back %ld seconds and setting delta to %ld. result=%{public}@/%{public}@",  (uint8_t *)&v37,  0x3Eu);
      }
    }
  }

  os_log_t v31 = sub_100039584(0LL);
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    id v33 = sub_1000758E0(v17);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    int v37 = 138543618;
    uint64_t v38 = (uint64_t)v17;
    __int16 v39 = 2114;
    v40 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "TIME: result time = %{public}@ %{public}@",  (uint8_t *)&v37,  0x16u);
  }

  v35 = (NSDate *)v17;
  return v35;
}

- (NSDate)currentUntil
{
  if (-[SharingBTLEAdvertisementPayload isCurrent](self, "isCurrent"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload when](self, "when"));
    if (v3) {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload when](self, "when"));
    }
    else {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    }
    double v6 = (void *)v4;
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v4,  248.0));
  }

  else
  {
    double v5 = 0LL;
  }

  return (NSDate *)v5;
}

- (NSDate)validUntil
{
  if (-[SharingBTLEAdvertisementPayload isCurrent](self, "isCurrent"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload currentUntil](self, "currentUntil"));
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload time](self, "time"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v4,  256.0));
  }

  return (NSDate *)v3;
}

- (id)now
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SharingBTLEAdvertisementPayload dateEpochStart:]( &OBJC_CLASS___SharingBTLEAdvertisementPayload,  "dateEpochStart:",  v2));
  [v2 timeIntervalSinceDate:v3];
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v3,  trunc(v4 * 0.25) * 4.0));

  return v5;
}

- (NSDate)epochEnd
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload when](self, "when"));
  id v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceReferenceDate];
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  trunc(v4 / 496.0) * 496.0 + 496.0));
  }

  else
  {
    double v5 = 0LL;
  }

  return (NSDate *)v5;
}

- (NSUUID)activityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setOptions:(id)a3
{
}

- (NSDate)when
{
  return (NSDate *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setWhen:(id)a3
{
}

- (NSDate)epochStart
{
  return (NSDate *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setEpochStart:(id)a3
{
}

- (void).cxx_destruct
{
}

@end