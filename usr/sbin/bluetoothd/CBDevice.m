@interface CBDevice
- (CBDevice)initWithBTStackDevice:(void *)a3 error:(id *)a4;
- (unint64_t)updateWithBLEDevice:(id)a3 btAddr:(unint64_t)a4;
- (unint64_t)updateWithClassicDevice:(void *)a3 deviceUUID:(id)a4;
@end

@implementation CBDevice

- (CBDevice)initWithBTStackDevice:(void *)a3 error:(id *)a4
{
  v26.receiver = self;
  v26.super_class = &OBJC_CLASS___CBDevice;
  v6 = -[CBDevice init](&v26, "init");
  if (!v6)
  {
    if (a4)
    {
      id v20 = [(id)objc_opt_class(0) description];
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = CBErrorF(4294960540LL, "%@ super init failed", v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v22);
    }

    goto LABEL_13;
  }

  uint64_t v7 = *((unsigned __int8 *)a3 + 128);
  uint64_t v8 = *((unsigned __int8 *)a3 + 129);
  uint64_t v9 = *((unsigned __int8 *)a3 + 130);
  uint64_t v10 = *((unsigned __int8 *)a3 + 131);
  uint64_t v11 = *((unsigned __int8 *)a3 + 133);
  unint64_t v12 = (v7 << 40) | (v8 << 32) | (v9 << 24) | (v10 << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 132) << 8);
  unint64_t v13 = v12 | v11;
  if (!(v12 | v11))
  {
    if (a4)
    {
      uint64_t v23 = CBErrorF(4294960535LL, "Get device address failed");
      v18 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v23);
      goto LABEL_8;
    }

- (unint64_t)updateWithBLEDevice:(id)a3 btAddr:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v166 = 0LL;
  v167 = &v166;
  uint64_t v168 = 0x2020000000LL;
  __int16 v169 = 0;
  uint64_t v162 = 0LL;
  v163 = &v162;
  uint64_t v164 = 0x2020000000LL;
  char v165 = 0;
  uint64_t v158 = 0LL;
  v159 = &v158;
  uint64_t v160 = 0x2020000000LL;
  char v161 = 0;
  uint64_t v154 = 0LL;
  v155 = &v154;
  uint64_t v156 = 0x2020000000LL;
  char v157 = 0;
  uint64_t v150 = 0LL;
  v151 = &v150;
  uint64_t v152 = 0x2020000000LL;
  char v153 = 0;
  uint64_t v146 = 0LL;
  v147 = &v146;
  uint64_t v148 = 0x2020000000LL;
  __int16 v149 = 0;
  uint64_t v142 = 0LL;
  v143 = &v142;
  uint64_t v144 = 0x2020000000LL;
  char v145 = 0;
  uint64_t v136 = 0LL;
  v137 = &v136;
  uint64_t v138 = 0x3032000000LL;
  v139 = sub_100020BC4;
  v140 = sub_100020BD4;
  id v141 = 0LL;
  uint64_t v132 = 0LL;
  v133 = &v132;
  uint64_t v134 = 0x2020000000LL;
  char v135 = 0;
  uint64_t v128 = 0LL;
  v129 = &v128;
  uint64_t v130 = 0x2020000000LL;
  char v131 = 0;
  v126[0] = 0LL;
  v126[1] = v126;
  v126[2] = 0x2020000000LL;
  char v127 = 0;
  uint64_t v120 = 0LL;
  v121 = &v120;
  uint64_t v122 = 0x3032000000LL;
  v123 = sub_100020BC4;
  v124 = sub_100020BD4;
  id v125 = 0LL;
  uint64_t v116 = 0LL;
  v117 = &v116;
  uint64_t v118 = 0x2020000000LL;
  char v119 = 0;
  uint64_t v110 = 0LL;
  v111 = &v110;
  uint64_t v112 = 0x3032000000LL;
  v113 = sub_100020BC4;
  v114 = sub_100020BD4;
  id v115 = 0LL;
  uint64_t v106 = 0LL;
  v107 = &v106;
  uint64_t v108 = 0x2020000000LL;
  char v109 = 0;
  uint64_t v100 = 0LL;
  v101 = &v100;
  uint64_t v102 = 0x3032000000LL;
  v103 = sub_100020BC4;
  v104 = sub_100020BD4;
  id v105 = 0LL;
  uint64_t v96 = 0LL;
  v97 = &v96;
  uint64_t v98 = 0x2020000000LL;
  int v99 = 0;
  uint64_t v92 = 0LL;
  v93 = &v92;
  uint64_t v94 = 0x2020000000LL;
  char v95 = 0;
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_10087F720);
  }
  uint64_t v7 = off_1008D5F28;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_100020BDC;
  v72[3] = &unk_10087F6E0;
  v74 = &v166;
  v75 = &v150;
  v76 = &v146;
  v77 = &v158;
  v78 = &v154;
  v79 = &v136;
  v80 = &v132;
  v81 = &v128;
  v82 = v126;
  v83 = &v120;
  v84 = &v116;
  id v73 = v6;
  v85 = &v162;
  v86 = &v110;
  v87 = &v106;
  v88 = &v100;
  v89 = &v96;
  v90 = &v92;
  v91 = &v142;
  v69 = v73;
  sub_1005D5604((uint64_t)v7, v73, v72);
  if (*((_WORD *)v167 + 12)
    && (unsigned int v8 = -[CBDevice appearanceValue](self, "appearanceValue"), v8 != *((unsigned __int16 *)v167 + 12)))
  {
    -[CBDevice setAppearanceValue:](self, "setAppearanceValue:");
    unint64_t v9 = 0x80000000000LL;
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  if ((unint64_t)[(id)v101[5] length] < 5)
  {
    uint64_t v13 = 0LL;
    unsigned __int16 v12 = 0;
    uint64_t v11 = 0LL;
    if (!a4) {
      goto LABEL_18;
    }
  }

  else
  {
    uint64_t v10 = (unsigned __int8 *)[(id) v101[5] bytes];
    uint64_t v11 = *v10;
    unsigned __int16 v12 = *(_WORD *)(v10 + 1);
    uint64_t v13 = *(unsigned __int16 *)(v10 + 3);
    if (!a4) {
      goto LABEL_18;
    }
  }

  LOBYTE(v70) = BYTE5(a4);
  BYTE1(v70) = BYTE4(a4);
  BYTE2(v70) = BYTE3(a4);
  HIBYTE(v70) = BYTE2(a4);
  LOBYTE(v71) = BYTE1(a4);
  HIBYTE(v71) = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](self, "btAddressData"));
  if ([v14 length] != (id)6
    || ((v15 = [v14 bytes], v70 == *(_DWORD *)v15)
      ? (BOOL v16 = v71 == v15[2])
      : (BOOL v16 = 0),
        !v16))
  {
    v17 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v70, 6LL);
    -[CBDevice setBtAddressData:](self, "setBtAddressData:", v17);

    unint64_t v9 = 0x80000000000LL;
  }

LABEL_18:
  unsigned int v18 = *((unsigned __int8 *)v163 + 24);
  if (!*((_BYTE *)v163 + 24)) {
    goto LABEL_30;
  }
  if (v18 > 0xD) {
    v19 = "?";
  }
  else {
    v19 = off_10087F800[(char)(v18 - 1)];
  }
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btVersion](self, "btVersion"));
  id v22 = v20;
  id v23 = v21;
  if (v22 == v23)
  {
  }

  else
  {
    uint64_t v24 = v23;
    if ((v22 == 0LL) != (v23 != 0LL))
    {
      unsigned __int8 v25 = [v22 isEqual:v23];

      if ((v25 & 1) != 0) {
        goto LABEL_29;
      }
    }

    else
    {
    }

    -[CBDevice setBtVersion:](self, "setBtVersion:", v22);
    unint64_t v9 = 0x80000000000LL;
  }

- (unint64_t)updateWithClassicDevice:(void *)a3 deviceUUID:(id)a4
{
  id v243 = a4;
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_10087F720);
  }
  id v6 = off_1008D5F28;
  if (qword_1008D60C0 != -1) {
    dispatch_once(&qword_1008D60C0, &stru_10087F740);
  }
  uint64_t v7 = off_1008D60B8;
  if (qword_1008D60D0 != -1) {
    dispatch_once(&qword_1008D60D0, &stru_10087F760);
  }
  unsigned int v8 = off_1008D60C8;
  unsigned int v239 = sub_1004272C4((uint64_t)off_1008D60C8, (uint64_t)a3);
  uint64_t v235 = (uint64_t)v7;
  v260 = 0LL;
  uint64_t v261 = 0LL;
  uint64_t v262 = 0LL;
  sub_1003D8F04((uint64_t)a3, (uint64_t)&v260);
  if (0xAAAAAAAAAAAAAAABLL * ((v261 - (uint64_t)v260) >> 3) < 4)
  {
    v242 = 0LL;
    uint64_t v10 = 0LL;
LABEL_19:
    v241 = 0LL;
    goto LABEL_20;
  }

  unint64_t v9 = v260 + 72;
  if (v260[95] < 0) {
    unint64_t v9 = (void *)*v9;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
  if (0xAAAAAAAAAAAAAAABLL * ((v261 - (uint64_t)v260) >> 3) < 9)
  {
    v242 = 0LL;
    goto LABEL_19;
  }

  uint64_t v11 = v260 + 192;
  if (v260[215] < 0) {
    uint64_t v11 = (void *)*v11;
  }
  v242 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
  unsigned __int16 v12 = v260 + 216;
  if (v260[239] < 0) {
    unsigned __int16 v12 = (void *)*v12;
  }
  v241 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
LABEL_20:
  uint64_t v233 = (uint64_t)v6;
  if (![v10 length])
  {
    id v18 = 0LL;
    v17 = 0LL;
    char v231 = 0;
    goto LABEL_35;
  }

  id v13 = sub_1005D77C0((uint64_t)v6, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (!v14)
  {
    id v18 = 0LL;
    v17 = 0LL;
    char v231 = 0;
LABEL_34:

    goto LABEL_35;
  }

  else {
    char v15 = 2;
  }
  id v16 = sub_1005D7C70((uint64_t)v6, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  char v231 = v15;
  if (sub_1005D7E40((uint64_t)v6, v14) != 2)
  {
    id v18 = 0LL;
    goto LABEL_34;
  }

  id v18 = (id)objc_claimAutoreleasedReturnValue([v14 UUIDString]);

  if (!v18) {
    goto LABEL_35;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice findMyCaseIdentifier](self, "findMyCaseIdentifier"));
  id v18 = v18;
  id v20 = v19;
  if (v18 == v20)
  {

    v14 = v18;
    goto LABEL_34;
  }

  v21 = v20;
  if (v20)
  {
    unsigned __int8 v22 = [v18 isEqual:v20];

    if ((v22 & 1) == 0) {
      goto LABEL_473;
    }
LABEL_35:
    unint64_t v23 = 0LL;
    goto LABEL_36;
  }

LABEL_473:
  -[CBDevice setFindMyCaseIdentifier:](self, "setFindMyCaseIdentifier:", v18);
  unint64_t v23 = 0x80000000000LL;
LABEL_36:
  v238 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
  if (!v238) {
    goto LABEL_44;
  }
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice findMyGroupIdentifier](self, "findMyGroupIdentifier"));
  id v25 = v238;
  id v26 = v24;
  if (v25 == v26)
  {

    goto LABEL_44;
  }

  int v27 = v26;
  if (!v26)
  {

    goto LABEL_43;
  }

  unsigned __int8 v28 = [v25 isEqual:v26];

  if ((v28 & 1) == 0)
  {
LABEL_43:
    -[CBDevice setFindMyGroupIdentifier:](self, "setFindMyGroupIdentifier:", v25);
    unint64_t v23 = 0x80000000000LL;
  }

@end