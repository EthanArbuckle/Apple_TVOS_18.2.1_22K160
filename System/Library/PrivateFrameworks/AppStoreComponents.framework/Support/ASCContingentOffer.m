@interface ASCContingentOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCContingentOffer)initWithCoder:(id)a3;
- (ASCContingentOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 organicOffer:(id)a9 streamlinedOffer:(id)a10 offerID:(id)a11 iapItemID:(id)a12 iapItemName:(id)a13 iapProductName:(id)a14 offerType:(int64_t)a15;
- (ASCContingentOffer)offerWithMetrics:(id)a3;
- (ASCOffer)organicOffer;
- (ASCOffer)streamlinedOffer;
- (BOOL)isEqual:(id)a3;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSNumber)iapItemID;
- (NSString)description;
- (NSString)iapItemName;
- (NSString)iapProductName;
- (NSString)offerID;
- (int64_t)flags;
- (int64_t)offerType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCContingentOffer

- (ASCContingentOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 organicOffer:(id)a9 streamlinedOffer:(id)a10 offerID:(id)a11 iapItemID:(id)a12 iapItemName:(id)a13 iapProductName:(id)a14 offerType:(int64_t)a15
{
  id v54 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a7;
  id v53 = a7;
  id v55 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v26 = v20;
  id v27 = a13;
  id v28 = a14;
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___ASCContingentOffer;
  v29 = -[ASCContingentOffer init](&v56, "init");
  if (v29)
  {
    v30 = (ASCAdamID *)[v54 copy];
    id = v29->_id;
    v29->_id = v30;

    v32 = (NSDictionary *)[v19 copy];
    titles = v29->_titles;
    v29->_titles = v32;

    v34 = (NSDictionary *)[v26 copy];
    subtitles = v29->_subtitles;
    v29->_subtitles = v34;

    v29->_flags = a6;
    objc_storeStrong((id *)&v29->_ageRating, v21);
    v36 = (NSArray *)[v55 copy];
    metrics = v29->_metrics;
    v29->_metrics = v36;

    v38 = (ASCOffer *)[v22 copyWithZone:0];
    organicOffer = v29->_organicOffer;
    v29->_organicOffer = v38;

    v40 = (ASCOffer *)[v23 copyWithZone:0];
    streamlinedOffer = v29->_streamlinedOffer;
    v29->_streamlinedOffer = v40;

    v42 = (NSString *)[v24 copy];
    offerID = v29->_offerID;
    v29->_offerID = v42;

    v44 = (NSNumber *)[v25 copy];
    iapItemID = v29->_iapItemID;
    v29->_iapItemID = v44;

    v46 = (NSString *)[v27 copy];
    iapItemName = v29->_iapItemName;
    v29->_iapItemName = v46;

    v48 = (NSString *)[v28 copy];
    iapProductName = v29->_iapProductName;
    v29->_iapProductName = v48;

    v29->_offerType = a15;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCContingentOffer)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(ASCAdamID) forKey:@"id"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = sub_10001AB28(v4, @"titles");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      id v9 = sub_10001AB28(v4, @"subtitles");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if (v10)
      {
        id v11 = [v4 decodeIntegerForKey:@"flags"];
        id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ageRating"];
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        id v14 = sub_100019B2C(v4, @"metrics");
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v15)
        {
          id v16 = sub_10001ACFC(v4, @"organicOffer");
          uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
          v18 = (void *)v17;
          if (v17)
          {
            v110 = (void *)v17;
            v108 = v13;
            id v19 = sub_10001ACFC(v4, @"streamlinedOffer");
            v109 = (void *)objc_claimAutoreleasedReturnValue(v19);
            id v20 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"offerID"];
            id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            if (v21)
            {
              id v22 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"iapItemID"];
              id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
              if (v23)
              {
                id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"iapItemName"];
                v107 = (void *)objc_claimAutoreleasedReturnValue(v24);
                if (v107)
                {
                  id v25 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"iapProductName"];
                  uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
                  if (v26)
                  {
                    uint64_t v105 = v26;
                    id v106 = [v4 decodeIntegerForKey:@"offerType"];
                    id v27 = self;
                    id v28 = (void *)v26;
                    v13 = v108;
                    v29 =  -[ASCContingentOffer initWithID:titles:subtitles:flags:ageRating:metrics:organicOffer:streamlinedOffer:offerID:iapItemID:iapItemName:iapProductName:offerType:]( v27,  "initWithID:titles:subtitles:flags:ageRating:metrics:organicOffer:streamlinedOffer:offerID: iapItemID:iapItemName:iapProductName:offerType:",  v6,  v8,  v10,  v11,  v108,  v15,  v110,  v109,  v21,  v23,  v107,  v105,  v106);
                    v30 = v28;
                    self = v29;
                    v31 = v29;
                  }

                  else
                  {
                    BOOL v96 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                    v13 = v108;
                    if (v96) {
                      sub_1000E1048(v96, v97, v98, v99, v100, v101, v102, v103);
                    }
                    v31 = 0LL;
                    v30 = 0LL;
                  }
                }

                else
                {
                  BOOL v88 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                  if (v88) {
                    sub_1000E1014(v88, v89, v90, v91, v92, v93, v94, v95);
                  }
                  v31 = 0LL;
                }
              }

              else
              {
                BOOL v80 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v80) {
                  sub_1000E0FE0(v80, v81, v82, v83, v84, v85, v86, v87);
                }
                v31 = 0LL;
              }
            }

            else
            {
              BOOL v72 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v72) {
                sub_1000E0FAC(v72, v73, v74, v75, v76, v77, v78, v79);
              }
              v31 = 0LL;
            }

            v18 = v110;
          }

          else
          {
            BOOL v64 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v64) {
              sub_1000E0F78(v64, v65, v66, v67, v68, v69, v70, v71);
            }
            v31 = 0LL;
          }
        }

        else
        {
          BOOL v56 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v56) {
            sub_1000E0F44(v56, v57, v58, v59, v60, v61, v62, v63);
          }
          v31 = 0LL;
        }
      }

      else
      {
        BOOL v48 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v48) {
          sub_1000E0F10(v48, v49, v50, v51, v52, v53, v54, v55);
        }
        v31 = 0LL;
      }
    }

    else
    {
      BOOL v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v40) {
        sub_1000E0EDC(v40, v41, v42, v43, v44, v45, v46, v47);
      }
      v31 = 0LL;
    }
  }

  else
  {
    BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v32) {
      sub_1000E0EA8(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    v31 = 0LL;
  }

  return v31;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer id](self, "id"));
  [v15 encodeObject:v4 forKey:@"id"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer titles](self, "titles"));
  [v15 encodeObject:v5 forKey:@"titles"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer subtitles](self, "subtitles"));
  [v15 encodeObject:v6 forKey:@"subtitles"];

  objc_msgSend(v15, "encodeInteger:forKey:", -[ASCContingentOffer flags](self, "flags"), @"flags");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer ageRating](self, "ageRating"));
  [v15 encodeObject:v7 forKey:@"ageRating"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer metrics](self, "metrics"));
  [v15 encodeObject:v8 forKey:@"metrics"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer organicOffer](self, "organicOffer"));
  [v15 encodeObject:v9 forKey:@"organicOffer"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer streamlinedOffer](self, "streamlinedOffer"));
  [v15 encodeObject:v10 forKey:@"streamlinedOffer"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer offerID](self, "offerID"));
  [v15 encodeObject:v11 forKey:@"offerID"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapItemID](self, "iapItemID"));
  [v15 encodeObject:v12 forKey:@"iapItemID"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapItemName](self, "iapItemName"));
  [v15 encodeObject:v13 forKey:@"iapItemName"];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapProductName](self, "iapProductName"));
  [v15 encodeObject:v14 forKey:@"iapProductName"];

  objc_msgSend(v15, "encodeInteger:forKey:", -[ASCContingentOffer offerType](self, "offerType"), @"offerType");
}

- (ASCContingentOffer)offerWithMetrics:(id)a3
{
  id v18 = a3;
  id v4 = objc_alloc((Class)objc_opt_class(self));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer id](self, "id"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer titles](self, "titles"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer subtitles](self, "subtitles"));
  id v14 = -[ASCContingentOffer flags](self, "flags");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer ageRating](self, "ageRating"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer organicOffer](self, "organicOffer"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer streamlinedOffer](self, "streamlinedOffer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer offerID](self, "offerID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapItemID](self, "iapItemID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapItemName](self, "iapItemName"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapProductName](self, "iapProductName"));
  id v15 = objc_msgSend( v4,  "initWithID:titles:subtitles:flags:ageRating:metrics:organicOffer:streamlinedOffer:offerID:iapItemID:iapItemNam e:iapProductName:offerType:",  v5,  v17,  v16,  v14,  v6,  v18,  v13,  v7,  v8,  v9,  v10,  v11,  -[ASCContingentOffer offerType](self, "offerType"));

  return (ASCContingentOffer *)v15;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer id](self, "id"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer titles](self, "titles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer subtitles](self, "subtitles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCContingentOffer flags](self, "flags"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer ageRating](self, "ageRating"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer metrics](self, "metrics"));
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer organicOffer](self, "organicOffer"));
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer streamlinedOffer](self, "streamlinedOffer"));
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer offerID](self, "offerID"));
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapItemID](self, "iapItemID"));
  -[ASCHasher combineObject:](v3, "combineObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapItemName](self, "iapItemName"));
  -[ASCHasher combineObject:](v3, "combineObject:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapProductName](self, "iapProductName"));
  -[ASCHasher combineObject:](v3, "combineObject:", v14);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCContingentOffer offerType](self, "offerType"));
  unint64_t v15 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCContingentOffer);
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      v8 = v7;
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer id](self, "id"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 id]);
    id v12 = (void *)v11;
    if (v10 && v11)
    {
      if ([v10 isEqual:v11])
      {
LABEL_10:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer titles](self, "titles"));
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 titles]);
        unint64_t v15 = (void *)v14;
        if (v13 && v14)
        {
          if ([v13 isEqual:v14])
          {
LABEL_13:
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer subtitles](self, "subtitles"));
            uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 subtitles]);
            id v18 = (void *)v17;
            if (v16 && v17)
            {
            }

            else if (v16 != (void *)v17)
            {
              goto LABEL_49;
            }

            id v20 = -[ASCContingentOffer flags](self, "flags");
            if (v20 == [v9 flags])
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer ageRating](self, "ageRating"));
              uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 ageRating]);
              id v23 = (void *)v22;
              if (v21 && v22)
              {
                id v24 = v21;
                uint64_t v68 = v18;
                id v25 = v21;
                uint64_t v26 = v23;
                unsigned int v27 = [v24 isEqual:v23];
                id v23 = v26;
                id v21 = v25;
                id v18 = v68;
                if (v27)
                {
LABEL_27:
                  uint64_t v66 = v23;
                  uint64_t v67 = v21;
                  uint64_t v28 = objc_claimAutoreleasedReturnValue(-[ASCContingentOffer metrics](self, "metrics"));
                  uint64_t v29 = objc_claimAutoreleasedReturnValue([v9 metrics]);
                  v30 = (void *)v29;
                  uint64_t v70 = (void *)v28;
                  if (v28 && v29)
                  {
                    v31 = (void *)v29;
                    unsigned int v32 = [v70 isEqual:v29];
                    v30 = v31;
                    if (v32)
                    {
LABEL_30:
                      BOOL v64 = v30;
                      uint64_t v33 = objc_claimAutoreleasedReturnValue(-[ASCContingentOffer organicOffer](self, "organicOffer"));
                      uint64_t v34 = objc_claimAutoreleasedReturnValue([v9 organicOffer]);
                      uint64_t v35 = (void *)v34;
                      uint64_t v65 = (void *)v33;
                      if (v33 && v34)
                      {
                        uint64_t v36 = (void *)v34;
                        unsigned int v37 = [v65 isEqual:v34];
                        uint64_t v35 = v36;
                        if (v37)
                        {
LABEL_33:
                          uint64_t v62 = v35;
                          uint64_t v38 = objc_claimAutoreleasedReturnValue(-[ASCContingentOffer streamlinedOffer](self, "streamlinedOffer"));
                          uint64_t v39 = objc_claimAutoreleasedReturnValue([v9 streamlinedOffer]);
                          BOOL v40 = (void *)v39;
                          uint64_t v63 = (void *)v38;
                          if (v38 && v39)
                          {
                            uint64_t v41 = (void *)v39;
                            unsigned int v42 = [v63 isEqual:v39];
                            BOOL v40 = v41;
                            if (v42)
                            {
LABEL_36:
                              uint64_t v60 = v40;
                              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer offerID](self, "offerID"));
                              uint64_t v44 = objc_claimAutoreleasedReturnValue([v9 offerID]);
                              uint64_t v61 = v43;
                              uint64_t v59 = (void *)v44;
                              if (v43 && v44)
                              {
                                if ([v43 isEqual:v44])
                                {
LABEL_39:
                                  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapItemID](self, "iapItemID"));
                                  uint64_t v46 = objc_claimAutoreleasedReturnValue([v9 iapItemID]);
                                  uint64_t v57 = (void *)v46;
                                  uint64_t v58 = v45;
                                  if (v45 && v46)
                                  {
                                    if ([v45 isEqual:v46])
                                    {
LABEL_42:
                                      uint64_t v47 = objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapItemName](self, "iapItemName"));
                                      uint64_t v48 = objc_claimAutoreleasedReturnValue([v9 iapItemName]);
                                      BOOL v56 = (void *)v47;
                                      if (v47 && v48)
                                      {
                                        uint64_t v49 = (void *)v48;
                                        if ([v56 isEqual:v48])
                                        {
LABEL_45:
                                          uint64_t v69 = v18;
                                          uint64_t v50 = objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapProductName](self, "iapProductName"));
                                          uint64_t v51 = objc_claimAutoreleasedReturnValue([v9 iapProductName]);
                                          uint64_t v55 = (void *)v50;
                                          if (v50 && v51)
                                          {
                                            uint64_t v52 = (void *)v51;
                                            if ([v55 isEqual:v51])
                                            {
LABEL_48:
                                              id v53 = -[ASCContingentOffer offerType](self, "offerType");
                                              BOOL v19 = v53 == [v9 offerType];
LABEL_66:

                                              id v18 = v69;
                                              goto LABEL_67;
                                            }
                                          }

                                          else
                                          {
                                            uint64_t v52 = (void *)v51;
                                          }

                                          BOOL v19 = 0;
                                          goto LABEL_66;
                                        }
                                      }

                                      else
                                      {
                                        uint64_t v49 = (void *)v48;
                                      }

                                      BOOL v19 = 0;
LABEL_67:

                                      goto LABEL_68;
                                    }
                                  }

                                  else if (v45 == (void *)v46)
                                  {
                                    goto LABEL_42;
                                  }

                                  BOOL v19 = 0;
LABEL_68:

                                  goto LABEL_69;
                                }
                              }

                              else if (v43 == (void *)v44)
                              {
                                goto LABEL_39;
                              }

                              BOOL v19 = 0;
LABEL_69:

                              BOOL v40 = v60;
                              goto LABEL_70;
                            }
                          }

                          else if (v38 == v39)
                          {
                            goto LABEL_36;
                          }

                          BOOL v19 = 0;
LABEL_70:

                          uint64_t v35 = v62;
                          goto LABEL_71;
                        }
                      }

                      else if (v33 == v34)
                      {
                        goto LABEL_33;
                      }

                      BOOL v19 = 0;
LABEL_71:

                      v30 = v64;
                      goto LABEL_72;
                    }
                  }

                  else if (v28 == v29)
                  {
                    goto LABEL_30;
                  }

                  BOOL v19 = 0;
LABEL_72:

                  id v23 = v66;
                  id v21 = v67;
                  goto LABEL_73;
                }
              }

              else if (v21 == (void *)v22)
              {
                goto LABEL_27;
              }

              BOOL v19 = 0;
LABEL_73:

              goto LABEL_74;
            }

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer id](self, "id"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"id");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer titles](self, "titles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"titles");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer subtitles](self, "subtitles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"subtitles");

  id Description = ASCOfferFlagsGetDescription((__int16)-[ASCContingentOffer flags](self, "flags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(Description);
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, @"flags");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer ageRating](self, "ageRating"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, @"ageRating");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer metrics](self, "metrics"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v10, @"metrics");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer organicOffer](self, "organicOffer"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, @"organicOffer");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer streamlinedOffer](self, "streamlinedOffer"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, @"streamlinedOffer");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer offerID](self, "offerID"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v13, @"offerID");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapItemID](self, "iapItemID"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v14, @"iapItemID");

  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapItemName](self, "iapItemName"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v15, @"iapItemName");

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCContingentOffer iapProductName](self, "iapProductName"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v16, @"iapProductName");

  -[ASCDescriber addInteger:withName:]( v3,  "addInteger:withName:",  -[ASCContingentOffer offerType](self, "offerType"),  @"offerType");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));

  return (NSString *)v17;
}

- (ASCAdamID)id
{
  return self->_id;
}

- (NSDictionary)titles
{
  return self->_titles;
}

- (NSDictionary)subtitles
{
  return self->_subtitles;
}

- (int64_t)flags
{
  return self->_flags;
}

- (NSNumber)ageRating
{
  return self->_ageRating;
}

- (NSArray)metrics
{
  return self->_metrics;
}

- (ASCOffer)organicOffer
{
  return self->_organicOffer;
}

- (ASCOffer)streamlinedOffer
{
  return self->_streamlinedOffer;
}

- (NSString)offerID
{
  return self->_offerID;
}

- (NSNumber)iapItemID
{
  return self->_iapItemID;
}

- (NSString)iapItemName
{
  return self->_iapItemName;
}

- (NSString)iapProductName
{
  return self->_iapProductName;
}

- (int64_t)offerType
{
  return self->_offerType;
}

- (void).cxx_destruct
{
}

@end