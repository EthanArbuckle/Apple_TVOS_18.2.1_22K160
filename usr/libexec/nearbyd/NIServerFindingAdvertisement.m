@interface NIServerFindingAdvertisement
+ (array<unsigned)convertCBAddressToRoseAddress:(id)a3;
+ (id)advertisementForFinder:(BOOL)a3 address:(const void *)a4 statusFlags:(unsigned __int8)a5 payload:(id)a6 uniqueIdentifier:(id)a7;
+ (id)advertisementFromByteRepresentation:(id)a3;
- (BOOL)canRange;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinder;
- (NSData)byteRepresentation;
- (NSData)payload;
- (NSData)uniqueIdentifier;
- (NSNumber)nbUwbAcquisitionChannelIdx;
- (array<unsigned)address;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForFinder:(BOOL)a3 address:(const void *)a4;
- (int)selectedTechnology;
- (int)useCase;
- (unsigned)narrowBandMask;
- (unsigned)protocolVersion;
- (unsigned)statusFlags;
- (vector<rose::finding::Technology,)supportedTechnologies;
- (void)setAddress:(array<unsigned)char;
- (void)setCanRange:(BOOL)a3;
- (void)setNarrowBandMask:(unsigned __int8)a3;
- (void)setNbUwbAcquisitionChannelIdx:(id)a3;
- (void)setProtocolVersion:(unsigned __int8)a3;
- (void)setSupportedTechnologies:()vector<rose:(std::allocator<rose::finding::Technology>> *)a3 :finding::Technology;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUseCase:(int)a3;
@end

@implementation NIServerFindingAdvertisement

- (id)initForFinder:(BOOL)a3 address:(const void *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NIServerFindingAdvertisement;
  v6 = -[NIServerFindingAdvertisement init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    v6->_isFinder = a3;
    int v8 = *(_DWORD *)a4;
    *(_WORD *)&v6->_address.__elems_[4] = *((_WORD *)a4 + 2);
    v6->_canRange = 1;
    v6->_useCase = 0;
    *(_DWORD *)v6->_address.__elems_ = v8;
    v6->_supportedTechnologies.__end_ = v6->_supportedTechnologies.__begin_;
    nbUwbAcquisitionChannelIdx = v6->_nbUwbAcquisitionChannelIdx;
    v6->_nbUwbAcquisitionChannelIdx = 0LL;

    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = 0LL;

    *(_WORD *)&v7->_protocolVersion = 0;
  }

  return v7;
}

+ (id)advertisementForFinder:(BOOL)a3 address:(const void *)a4 statusFlags:(unsigned __int8)a5 payload:(id)a6 uniqueIdentifier:(id)a7
{
  unsigned int v8 = a5;
  BOOL v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = -[NIServerFindingAdvertisement initForFinder:address:]( objc_alloc(&OBJC_CLASS___NIServerFindingAdvertisement),  "initForFinder:address:",  v10,  a4);
  [v13 setUniqueIdentifier:v12];
  [v13 setProtocolVersion:0];
  if ((v8 & 1) != 0 && [v11 length])
  {
    id v14 = v11;
    v15 = v14;
    if (v10)
    {
      unsigned int v16 = *(unsigned __int8 *)[v14 bytes];
      [v13 setProtocolVersion:v16 & 7];
      [v13 setNarrowBandMask:(v16 >> 3) & 3];
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  *(unsigned __int8 *)[v14 bytes]));
      [v13 setNbUwbAcquisitionChannelIdx:v17];

      if ((unint64_t)[v15 length] >= 2)
      {
        unsigned int v18 = *((unsigned __int8 *)[v15 bytes] + 1);
        [v13 setProtocolVersion:v18 & 7];
        [v13 setNarrowBandMask:(v18 >> 3) & 3];
      }
    }
  }

  v19 = 0LL;
  v20 = 0LL;
  v34 = 0LL;
  v35 = 0LL;
  v36 = 0LL;
  if ((v8 & 4) != 0)
  {
    v19 = operator new(4uLL);
    _DWORD *v19 = 1;
    v20 = v19 + 1;
    v35 = v19 + 1;
    v36 = (char *)(v19 + 1);
    v34 = v19;
  }

  unsigned int v21 = !+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild");
  if ((v8 & 8) == 0) {
    LOBYTE(v21) = 1;
  }
  if ((v21 & 1) == 0)
  {
    uint64_t v22 = v20 - (_BYTE *)v19;
    uint64_t v23 = (v20 - (_BYTE *)v19) >> 2;
    unint64_t v24 = v23 + 1;
    if (v22 >> 1 > v24) {
      unint64_t v24 = v22 >> 1;
    }
    else {
      unint64_t v25 = v24;
    }
    if (v25)
    {
      v26 = (char *)sub_100031724((uint64_t)&v36, v25);
      v19 = v34;
      v20 = v35;
    }

    else
    {
      v26 = 0LL;
    }

    v27 = &v26[4 * v23];
    *(_DWORD *)v27 = 2;
    v28 = v27 + 4;
    while (v20 != (_BYTE *)v19)
    {
      int v29 = *((_DWORD *)v20 - 1);
      v20 -= 4;
      *((_DWORD *)v27 - 1) = v29;
      v27 -= 4;
    }

    v34 = v27;
    v35 = v28;
    v36 = &v26[4 * v25];
    if (v19) {
      operator delete(v19);
    }
    v35 = v28;
  }

  [v13 setUseCase:(v8 >> 4) & 1];
  __p = 0LL;
  v32 = 0LL;
  uint64_t v33 = 0LL;
  sub_1002A2A3C(&__p, v34, (uint64_t)v35, (v35 - (_BYTE *)v34) >> 2);
  [v13 setSupportedTechnologies:&__p];
  if (__p)
  {
    v32 = __p;
    operator delete(__p);
  }

  [v13 setCanRange:(v8 >> 1) & 1];
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }

  return v13;
}

+ (id)advertisementFromByteRepresentation:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0x65)
  {
    v6 = (void *)OPACKDecodeData(v3, 8LL, &v28);
    if (!v6 || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5), (objc_opt_isKindOfClass(v6, v7) & 1) == 0))
    {
      uint64_t v22 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_1003A5E30(&v28, v22);
      }
      v4 = 0LL;
      goto LABEL_26;
    }

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:&off_1007D26B8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:&off_1007D26D0]);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:&off_1007D26E8]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:&off_1007D2700]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:&off_1007D2718]);
    if (!v8) {
      goto LABEL_24;
    }
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSData, v15);
    if ((objc_opt_isKindOfClass(v9, v16) & 1) == 0) {
      goto LABEL_24;
    }
    v4 = 0LL;
    if ([v9 length] != (id)6 || !v10) {
      goto LABEL_25;
    }
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber, v17);
    if ((objc_opt_isKindOfClass(v10, v18) & 1) == 0) {
      goto LABEL_24;
    }
    if (!v11
      || (v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
          v19,
          v11 == v19))
    {

      id v11 = 0LL;
    }

    else
    {
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSData, v20);
      if ((objc_opt_isKindOfClass(v11, v21) & 1) == 0) {
        goto LABEL_24;
      }
    }

    if (!v13
      || (uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
          v23,
          v13 == v23))
    {

      id v13 = 0LL;
    }

    else
    {
      uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSData, v24);
      if ((objc_opt_isKindOfClass(v13, v25) & 1) == 0)
      {
LABEL_24:
        v4 = 0LL;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
    }

    [v9 getBytes:v27 length:6];
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingAdvertisement advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:]( NIServerFindingAdvertisement,  "advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:",  [v8 BOOLValue],  v27,  objc_msgSend(v10, "unsignedCharValue"),  v11,  v13));
    goto LABEL_25;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
    sub_1003A5E04();
  }
  v4 = 0LL;
LABEL_27:

  return v4;
}

- (NSData)byteRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &self->_address, 6LL));
  v14[0] = &off_1007D26B8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isFinder));
  v15[0] = v4;
  v15[1] = v3;
  v14[1] = &off_1007D26D0;
  v14[2] = &off_1007D26E8;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[NIServerFindingAdvertisement statusFlags](self, "statusFlags")));
  v15[2] = v5;
  v14[3] = &off_1007D2700;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement payload](self, "payload"));
  if (v6) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement payload](self, "payload"));
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  unsigned int v8 = (void *)v7;
  v15[3] = v7;
  v14[4] = &off_1007D2718;
  uint64_t v9 = NSRandomData(3LL, 0LL);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v15[4] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  5LL));

  Data = (void *)OPACKEncoderCreateData(v11, 8LL, 0LL);
  return (NSData *)Data;
}

+ (array<unsigned)convertCBAddressToRoseAddress:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    BOOL v10 = "cbAddress";
    int v11 = 2290;
    goto LABEL_9;
  }

  if ((unint64_t)[v3 length] <= 5)
  {
    BOOL v10 = "cbAddress.length >= rose::kBtAdvAddressByteLength";
    int v11 = 2291;
LABEL_9:
    __assert_rtn( "+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:]",  "NIServerFindingDiscovery.mm",  v11,  v10);
  }

  [v4 getBytes:&v12 length:6];
  uint64_t v5 = (char *)&v13 + 1;
  v6 = (char *)&v12 + 1;
  do
  {
    char v7 = *(v6 - 1);
    *(v6 - 1) = *v5;
    *v5-- = v7;
  }

  while (v6++ < v5);

  return (array<unsigned char, 6UL>)(v12 | ((unint64_t)v13 << 32));
}

- (unsigned)statusFlags
{
  if (self->_nbUwbAcquisitionChannelIdx || self->_protocolVersion || (int narrowBandMask = self->_narrowBandMask) != 0) {
    int narrowBandMask = 1;
  }
  if (self->_canRange) {
    narrowBandMask |= 2u;
  }
  if (self->_useCase == 1) {
    int v3 = narrowBandMask | 0x10;
  }
  else {
    int v3 = narrowBandMask;
  }
  begin = self->_supportedTechnologies.__begin_;
  for (i = self->_supportedTechnologies.__end_; begin != i; ++begin)
  {
    if (*begin == 2)
    {
      if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")) {
        v3 |= 8u;
      }
    }

    else if (*begin == 1)
    {
      v3 |= 4u;
    }
  }

  return v3;
}

- (NSData)payload
{
  unint64_t __p = 0LL;
  uint64_t v20 = 0LL;
  nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
  if (nbUwbAcquisitionChannelIdx)
  {
    unsigned __int8 v4 = -[NSNumber intValue](nbUwbAcquisitionChannelIdx, "intValue");
    uint64_t v5 = operator new(1uLL);
    *uint64_t v5 = v4;
    v6 = v5 + 1;
    unint64_t __p = (unint64_t)v5;
    uint64_t v20 = v5 + 1;
  }

  else
  {
    v6 = 0LL;
  }

  unsigned int protocolVersion = self->_protocolVersion;
  if (self->_protocolVersion)
  {
    if (protocolVersion >= 8) {
      __assert_rtn( "-[NIServerFindingAdvertisement payload]",  "NIServerFindingDiscovery.mm",  2355,  "(_protocolVersion & kProtocolVersionMask) == _protocolVersion");
    }
    unsigned int narrowBandMask = self->_narrowBandMask;
    if (!self->_narrowBandMask) {
      goto LABEL_11;
    }
  }

  else
  {
    unsigned int narrowBandMask = self->_narrowBandMask;
    if (!self->_narrowBandMask) {
      goto LABEL_30;
    }
  }

  if (narrowBandMask >= 4) {
    __assert_rtn( "-[NIServerFindingAdvertisement payload]",  "NIServerFindingDiscovery.mm",  2361,  "(_narrowBandMask & narrowBandMaskValueMask) == _narrowBandMask");
  }
  LOBYTE(protocolVersion) = protocolVersion | (8 * narrowBandMask);
LABEL_11:
  if (v6 >= v20)
  {
    BOOL v10 = &v6[-__p];
    uint64_t v11 = (uint64_t)&v6[-__p + 1];
    if (v11 < 0) {
      sub_10001E11C();
    }
    unint64_t v12 = (unint64_t)&v20[-__p];
    if (v12 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v13 = v11;
    }
    if (v13) {
      unint64_t v14 = (unint64_t)operator new(v13);
    }
    else {
      unint64_t v14 = 0LL;
    }
    v10[v14] = protocolVersion;
    uint64_t v9 = (uint64_t)&v10[v14 + 1];
    if (v6 == (_BYTE *)__p)
    {
      v14 += (unint64_t)v10;
    }

    else
    {
      uint64_t v15 = &v6[~__p];
      do
      {
        char v16 = *--v6;
        (v15--)[v14] = v16;
      }

      while (v6 != (_BYTE *)__p);
      v6 = (_BYTE *)__p;
    }

    unint64_t __p = v14;
    if (v6) {
      operator delete(v6);
    }
  }

  else
  {
    _BYTE *v6 = protocolVersion;
    uint64_t v9 = (uint64_t)(v6 + 1);
  }

  v6 = (_BYTE *)v9;
LABEL_30:
  if (v6 == (_BYTE *)__p)
  {
    uint64_t v17 = 0LL;
    if (!v6) {
      return (NSData *)v17;
    }
    goto LABEL_32;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", __p, &v6[-__p]));
  v6 = (_BYTE *)__p;
  if (__p) {
LABEL_32:
  }
    operator delete(v6);
  return (NSData *)v17;
}

- (int)selectedTechnology
{
  begin = self->_supportedTechnologies.__begin_;
  else {
    return 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NIServerFindingAdvertisement initForFinder:address:]( objc_alloc(&OBJC_CLASS___NIServerFindingAdvertisement),  "initForFinder:address:",  self->_isFinder,  &self->_address);
  uint64_t v5 = v4;
  if (!v4) {
    __assert_rtn("-[NIServerFindingAdvertisement copyWithZone:]", "NIServerFindingDiscovery.mm", 2386, "advertisement");
  }
  [v4 setCanRange:self->_canRange];
  [v5 setUseCase:self->_useCase];
  unint64_t __p = 0LL;
  unsigned int v8 = 0LL;
  uint64_t v9 = 0LL;
  sub_1002A2A3C( &__p,  self->_supportedTechnologies.__begin_,  (uint64_t)self->_supportedTechnologies.__end_,  self->_supportedTechnologies.__end_ - self->_supportedTechnologies.__begin_);
  [v5 setSupportedTechnologies:&__p];
  if (__p)
  {
    unsigned int v8 = __p;
    operator delete(__p);
  }

  [v5 setNbUwbAcquisitionChannelIdx:self->_nbUwbAcquisitionChannelIdx];
  [v5 setProtocolVersion:self->_protocolVersion];
  [v5 setNarrowBandMask:self->_narrowBandMask];
  [v5 setUniqueIdentifier:self->_uniqueIdentifier];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    char v7 = (NIServerFindingAdvertisement *)v4;
    unsigned int v8 = v7;
    if (v7 == self)
    {
      BOOL v10 = 1;
LABEL_56:

      goto LABEL_57;
    }

    id v48 = v4;
    if (!self->_isFinder) {
      goto LABEL_10;
    }
    if (-[NIServerFindingAdvertisement isFinder](v7, "isFinder"))
    {
      unsigned int v9 = 0;
      goto LABEL_11;
    }

    if (self->_isFinder) {
      unsigned int v9 = 1;
    }
    else {
LABEL_10:
    }
      unsigned int v9 = -[NIServerFindingAdvertisement isFinder](v8, "isFinder");
LABEL_11:
    id v11 = (id)-[NIServerFindingAdvertisement address](v8, "address");
    int v12 = (int)v11;
    WORD2(v49) = WORD2(v11);
    int v13 = *(_DWORD *)self->_address.__elems_;
    int v46 = WORD2(v11);
    int v47 = *(unsigned __int16 *)&self->_address.__elems_[4];
    int canRange = self->_canRange;
    unsigned int v45 = -[NIServerFindingAdvertisement canRange](v8, "canRange");
    int useCase = self->_useCase;
    unsigned int v43 = -[NIServerFindingAdvertisement useCase](v8, "useCase");
    if (v8)
    {
      -[NIServerFindingAdvertisement supportedTechnologies](v8, "supportedTechnologies");
      uint64_t v15 = v49;
      uint64_t v16 = v50;
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v16 = 0LL;
    }

    begin = self->_supportedTechnologies.__begin_;
    end = self->_supportedTechnologies.__end_;
    if ((char *)end - (char *)begin == v16 - (void)v15)
    {
      if (begin == end)
      {
        BOOL v23 = 0;
        if (!v15)
        {
LABEL_26:
          if (self->_nbUwbAcquisitionChannelIdx)
          {
            BOOL v42 = 0;
          }

          else
          {
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement nbUwbAcquisitionChannelIdx](v8, "nbUwbAcquisitionChannelIdx"));
            BOOL v42 = v25 == 0LL;

            if (!self->_nbUwbAcquisitionChannelIdx)
            {
              unsigned int v29 = 0;
LABEL_33:
              uniqueIdentifier = self->_uniqueIdentifier;
              if (uniqueIdentifier)
              {
                BOOL v41 = 0;
              }

              else
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement uniqueIdentifier](v8, "uniqueIdentifier"));
                BOOL v41 = v31 == 0LL;

                uniqueIdentifier = self->_uniqueIdentifier;
              }

              v32 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement uniqueIdentifier](v8, "uniqueIdentifier"));
              unsigned int v33 = -[NSData isEqualToData:](uniqueIdentifier, "isEqualToData:", v32);

              int protocolVersion = self->_protocolVersion;
              unsigned int v39 = -[NIServerFindingAdvertisement protocolVersion](v8, "protocolVersion");
              int narrowBandMask = self->_narrowBandMask;
              unsigned int v35 = -[NIServerFindingAdvertisement narrowBandMask](v8, "narrowBandMask");
              BOOL v10 = 0;
              if (v13 ^ v12 | v47 ^ v46) {
                int v36 = 1;
              }
              else {
                int v36 = v9;
              }
              if (canRange != v45) {
                int v36 = 1;
              }
              if (useCase != v43) {
                int v36 = 1;
              }
              if (((v36 | v23) & 1) != 0)
              {
                id v4 = v48;
              }

              else
              {
                id v4 = v48;
                if ((((v42 | v29) ^ 1) & 1) == 0 && (((v41 | v33) ^ 1) & 1) == 0) {
                  BOOL v10 = protocolVersion == v39 && narrowBandMask == v35;
                }
              }

              goto LABEL_56;
            }
          }

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement nbUwbAcquisitionChannelIdx](v8, "nbUwbAcquisitionChannelIdx"));
          if (v26)
          {
            nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
            int v28 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingAdvertisement nbUwbAcquisitionChannelIdx](v8, "nbUwbAcquisitionChannelIdx"));
            unsigned int v29 = -[NSNumber isEqualToNumber:](nbUwbAcquisitionChannelIdx, "isEqualToNumber:", v28);
          }

          else
          {
            unsigned int v29 = 0;
          }

          goto LABEL_33;
        }

- (id)description
{
  int v3 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", @"0x");
  for (uint64_t i = 0LL; i != 6; ++i)
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"%02x", self->_address.__elems_[i]);
  uint64_t v5 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", @"[");
  begin = self->_supportedTechnologies.__begin_;
  if (self->_supportedTechnologies.__end_ != begin)
  {
    unint64_t v7 = 0LL;
    do
    {
      -[NSMutableString appendFormat:](v5, "appendFormat:", @"%s", sub_100278458(begin[v7]));
      begin = self->_supportedTechnologies.__begin_;
      unint64_t v8 = self->_supportedTechnologies.__end_ - begin;
      if (v8 - 1 > v7)
      {
        -[NSMutableString appendString:](v5, "appendString:", @", ");
        begin = self->_supportedTechnologies.__begin_;
        unint64_t v8 = self->_supportedTechnologies.__end_ - begin;
      }

      ++v7;
    }

    while (v8 > v7);
  }

  -[NSMutableString appendString:](v5, "appendString:", @"]");
  unsigned int v9 = sub_100277A54(self->_isFinder);
  BOOL canRange = self->_canRange;
  id v11 = sub_100277A38(self->_useCase);
  uint64_t protocolVersion = self->_protocolVersion;
  uint64_t narrowBandMask = self->_narrowBandMask;
  nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    uint64_t v16 = CUPrintNSDataHex(uniqueIdentifier, -[NSData length](uniqueIdentifier, "length"), 0LL);
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue(v16);
  }

  else
  {
    uint64_t v17 = @"-";
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%s, addr: %@, canRange:%d, useCase: %s, supportedTech:%@, nbUwbChIdx:%@, protocolVer: %d, nbMask:%hu, ID:0x%@>",  v9,  v3,  canRange,  v11,  v5,  nbUwbAcquisitionChannelIdx,  protocolVersion,  narrowBandMask,  v17));
  if (uniqueIdentifier) {

  }
  return v18;
}

- (BOOL)isFinder
{
  return self->_isFinder;
}

- (array<unsigned)address
{
  return (array<unsigned char, 6UL>)(dest | ((unint64_t)v4 << 32));
}

- (void)setAddress:(array<unsigned)char
{
  array<unsigned char, 6UL> src = a3;
  objc_copyStruct(&self->_address, &src, 6LL, 1, 0);
}

- (BOOL)canRange
{
  return self->_canRange;
}

- (void)setCanRange:(BOOL)a3
{
  self->_BOOL canRange = a3;
}

- (int)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(int)a3
{
  self->_int useCase = a3;
}

- (NSNumber)nbUwbAcquisitionChannelIdx
{
  return self->_nbUwbAcquisitionChannelIdx;
}

- (void)setNbUwbAcquisitionChannelIdx:(id)a3
{
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unsigned __int8)a3
{
  self->_uint64_t protocolVersion = a3;
}

- (unsigned)narrowBandMask
{
  return self->_narrowBandMask;
}

- (void)setNarrowBandMask:(unsigned __int8)a3
{
  self->_uint64_t narrowBandMask = a3;
}

- (NSData)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (vector<rose::finding::Technology,)supportedTechnologies
{
  return result;
}

- (void)setSupportedTechnologies:()vector<rose:(std::allocator<rose::finding::Technology>> *)a3 :finding::Technology
{
}

- (void).cxx_destruct
{
  begin = self->_supportedTechnologies.__begin_;
  if (begin)
  {
    self->_supportedTechnologies.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0LL);
  objc_storeStrong((id *)&self->_nbUwbAcquisitionChannelIdx, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0LL;
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  return self;
}

@end