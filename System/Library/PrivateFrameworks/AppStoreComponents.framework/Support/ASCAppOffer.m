@interface ASCAppOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCAppOffer)initWithCoder:(id)a3;
- (ASCAppOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 baseBuyParams:(id)a9 metricsBuyParams:(id)a10 additionalHeaders:(id)a11 preflightPackageURL:(id)a12 bundleID:(id)a13 itemName:(id)a14 vendorName:(id)a15 capabilities:(id)a16;
- (ASCAppOffer)offerWithMetrics:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)capabilities;
- (NSArray)metrics;
- (NSDictionary)additionalHeaders;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSString)baseBuyParams;
- (NSString)bundleID;
- (NSString)description;
- (NSString)itemName;
- (NSString)metricsBuyParams;
- (NSString)vendorName;
- (NSURL)preflightPackageURL;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCAppOffer

- (ASCAppOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 baseBuyParams:(id)a9 metricsBuyParams:(id)a10 additionalHeaders:(id)a11 preflightPackageURL:(id)a12 bundleID:(id)a13 itemName:(id)a14 vendorName:(id)a15 capabilities:(id)a16
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v58 = a7;
  id v60 = a7;
  id v23 = a8;
  v24 = v21;
  id v63 = a9;
  id v62 = a10;
  v25 = v22;
  id v61 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  id v30 = a16;
  v64.receiver = self;
  v64.super_class = (Class)&OBJC_CLASS___ASCAppOffer;
  v31 = -[ASCAppOffer init](&v64, "init");
  if (v31)
  {
    v32 = (ASCAdamID *)[v20 copy];
    id = v31->_id;
    v31->_id = v32;

    v34 = (NSDictionary *)[v24 copy];
    titles = v31->_titles;
    v31->_titles = v34;

    v36 = (NSDictionary *)[v25 copy];
    subtitles = v31->_subtitles;
    v31->_subtitles = v36;

    v31->_flags = a6;
    objc_storeStrong((id *)&v31->_ageRating, v58);
    v38 = (NSArray *)[v23 copy];
    metrics = v31->_metrics;
    v31->_metrics = v38;

    v40 = (NSString *)[v63 copy];
    baseBuyParams = v31->_baseBuyParams;
    v31->_baseBuyParams = v40;

    v42 = (NSString *)[v62 copy];
    metricsBuyParams = v31->_metricsBuyParams;
    v31->_metricsBuyParams = v42;

    v44 = (NSDictionary *)[v61 copy];
    additionalHeaders = v31->_additionalHeaders;
    v31->_additionalHeaders = v44;

    v46 = (NSURL *)[v26 copy];
    preflightPackageURL = v31->_preflightPackageURL;
    v31->_preflightPackageURL = v46;

    v48 = (NSString *)[v27 copy];
    bundleID = v31->_bundleID;
    v31->_bundleID = v48;

    v50 = (NSString *)[v28 copy];
    itemName = v31->_itemName;
    v31->_itemName = v50;

    v52 = (NSString *)[v29 copy];
    vendorName = v31->_vendorName;
    v31->_vendorName = v52;

    v54 = (NSArray *)[v30 copy];
    capabilities = v31->_capabilities;
    v31->_capabilities = v54;
  }

  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCAppOffer)initWithCoder:(id)a3
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
          id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"baseBuyParams"];
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (v17)
          {
            id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"metricsBuyParams"];
            v113 = (void *)objc_claimAutoreleasedReturnValue(v18);
            if (v113)
            {
              id v106 = v11;
              v109 = v13;
              v19 = objc_alloc(&OBJC_CLASS___NSSet);
              uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary);
              v108 = -[NSSet initWithObjects:]( v19,  "initWithObjects:",  v20,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
              v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:"));
              id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"preflightPackageURL"];
              v111 = (void *)objc_claimAutoreleasedReturnValue(v21);
              id v22 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleID"];
              v110 = (void *)objc_claimAutoreleasedReturnValue(v22);
              if (v110)
              {
                id v23 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"itemName"];
                v107 = (void *)objc_claimAutoreleasedReturnValue(v23);
                if (v107)
                {
                  id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"vendorName"];
                  uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
                  if (v25)
                  {
                    v104 = objc_alloc(&OBJC_CLASS___NSSet);
                    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSArray);
                    v105 = -[NSSet initWithObjects:]( v104,  "initWithObjects:",  v26,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
                    id v27 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v105 forKey:@"capabilities"]);
                    self =  -[ASCAppOffer initWithID:titles:subtitles:flags:ageRating:metrics:baseBuyParams:metricsBuyParams:additionalHeaders:preflightPackageURL:bundleID:itemName:vendorName:capabilities:]( self,  "initWithID:titles:subtitles:flags:ageRating:metrics:baseBuyParams:metricsBuyParams:additi onalHeaders:preflightPackageURL:bundleID:itemName:vendorName:capabilities:",  v6,  v8,  v10,  v106,  v109,  v15,  v17,  v113,  v112,  v111,  v110,  v107,  v25,  v27);

                    id v28 = (void *)v25;
                    v13 = v109;
                    id v29 = self;
                    id v30 = v108;
                  }

                  else
                  {
                    BOOL v95 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                    if (v95) {
                      sub_1000E0BD0(v95, v96, v97, v98, v99, v100, v101, v102);
                    }
                    id v29 = 0LL;
                    id v30 = v108;
                    v13 = v109;
                    id v28 = 0LL;
                  }
                }

                else
                {
                  BOOL v87 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                  if (v87) {
                    sub_1000E0B9C(v87, v88, v89, v90, v91, v92, v93, v94);
                  }
                  id v29 = 0LL;
                  id v30 = v108;
                  v13 = v109;
                }
              }

              else
              {
                BOOL v79 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v79) {
                  sub_1000E0B68(v79, v80, v81, v82, v83, v84, v85, v86);
                }
                id v29 = 0LL;
                id v30 = v108;
                v13 = v109;
              }
            }

            else
            {
              BOOL v71 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v71) {
                sub_1000E0B34(v71, v72, v73, v74, v75, v76, v77, v78);
              }
              id v29 = 0LL;
            }
          }

          else
          {
            BOOL v63 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v63) {
              sub_1000E0B00(v63, v64, v65, v66, v67, v68, v69, v70);
            }
            id v29 = 0LL;
          }
        }

        else
        {
          BOOL v55 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v55) {
            sub_1000E0ACC(v55, v56, v57, v58, v59, v60, v61, v62);
          }
          id v29 = 0LL;
        }
      }

      else
      {
        BOOL v47 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v47) {
          sub_1000E0A98(v47, v48, v49, v50, v51, v52, v53, v54);
        }
        id v29 = 0LL;
      }
    }

    else
    {
      BOOL v39 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v39) {
        sub_1000E0A64(v39, v40, v41, v42, v43, v44, v45, v46);
      }
      id v29 = 0LL;
    }
  }

  else
  {
    BOOL v31 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v31) {
      sub_1000E0A30(v31, v32, v33, v34, v35, v36, v37, v38);
    }
    id v29 = 0LL;
  }

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer id](self, "id"));
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer titles](self, "titles"));
  [v4 encodeObject:v6 forKey:@"titles"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer subtitles](self, "subtitles"));
  [v4 encodeObject:v7 forKey:@"subtitles"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCAppOffer flags](self, "flags"), @"flags");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer ageRating](self, "ageRating"));
  [v4 encodeObject:v8 forKey:@"ageRating"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer metrics](self, "metrics"));
  [v4 encodeObject:v9 forKey:@"metrics"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer baseBuyParams](self, "baseBuyParams"));
  [v4 encodeObject:v10 forKey:@"baseBuyParams"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer metricsBuyParams](self, "metricsBuyParams"));
  [v4 encodeObject:v11 forKey:@"metricsBuyParams"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer additionalHeaders](self, "additionalHeaders"));
  [v4 encodeObject:v12 forKey:@"additionalHeaders"];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer preflightPackageURL](self, "preflightPackageURL"));
  [v4 encodeObject:v13 forKey:@"preflightPackageURL"];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer bundleID](self, "bundleID"));
  [v4 encodeObject:v14 forKey:@"bundleID"];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer itemName](self, "itemName"));
  [v4 encodeObject:v15 forKey:@"itemName"];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer vendorName](self, "vendorName"));
  [v4 encodeObject:v16 forKey:@"vendorName"];

  id v17 = (id)objc_claimAutoreleasedReturnValue(-[ASCAppOffer capabilities](self, "capabilities"));
  [v4 encodeObject:v17 forKey:@"capabilities"];
}

- (ASCAppOffer)offerWithMetrics:(id)a3
{
  id v18 = a3;
  id v16 = objc_alloc((Class)objc_opt_class(self));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer id](self, "id"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer titles](self, "titles"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer subtitles](self, "subtitles"));
  int64_t v15 = -[ASCAppOffer flags](self, "flags");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer ageRating](self, "ageRating"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer baseBuyParams](self, "baseBuyParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer metricsBuyParams](self, "metricsBuyParams"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer additionalHeaders](self, "additionalHeaders"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer preflightPackageURL](self, "preflightPackageURL"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer bundleID](self, "bundleID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer itemName](self, "itemName"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer vendorName](self, "vendorName"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer capabilities](self, "capabilities"));
  id v17 = [v16 initWithID:v20 titles:v19 subtitles:v4 flags:v15 ageRating:v5 metrics:v18 baseBuyParams:v14 metricsBuyParams:v6 additionalHeaders:v7 preflight PackageURL:v8 bundleID:v9 itemName:v10 vendorName:v11 capabilities:v12];

  return (ASCAppOffer *)v17;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer id](self, "id"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer titles](self, "titles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer subtitles](self, "subtitles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCAppOffer flags](self, "flags"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer ageRating](self, "ageRating"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer metrics](self, "metrics"));
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer baseBuyParams](self, "baseBuyParams"));
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer metricsBuyParams](self, "metricsBuyParams"));
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer additionalHeaders](self, "additionalHeaders"));
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer preflightPackageURL](self, "preflightPackageURL"));
  -[ASCHasher combineObject:](v3, "combineObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer bundleID](self, "bundleID"));
  -[ASCHasher combineObject:](v3, "combineObject:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer itemName](self, "itemName"));
  -[ASCHasher combineObject:](v3, "combineObject:", v14);

  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer vendorName](self, "vendorName"));
  -[ASCHasher combineObject:](v3, "combineObject:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer capabilities](self, "capabilities"));
  -[ASCHasher combineObject:](v3, "combineObject:", v16);

  unint64_t v17 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCAppOffer);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer id](self, "id"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 id]);
    id v12 = (void *)v11;
    if (v10 && v11)
    {
      if ([v10 isEqual:v11])
      {
LABEL_10:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer titles](self, "titles"));
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 titles]);
        int64_t v15 = (void *)v14;
        if (v13 && v14)
        {
          if ([v13 isEqual:v14])
          {
LABEL_13:
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer subtitles](self, "subtitles"));
            uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 subtitles]);
            id v18 = (void *)v17;
            if (v16 && v17)
            {
            }

            else if (v16 != (void *)v17)
            {
              goto LABEL_54;
            }

            id v20 = -[ASCAppOffer flags](self, "flags");
            if (v20 == [v9 flags])
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer ageRating](self, "ageRating"));
              uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 ageRating]);
              id v23 = (void *)v22;
              if (v21 && v22)
              {
                id v24 = v21;
                uint64_t v73 = v16;
                uint64_t v25 = v18;
                uint64_t v26 = v21;
                id v27 = v23;
                unsigned int v28 = [v24 isEqual:v23];
                id v23 = v27;
                id v21 = v26;
                id v18 = v25;
                id v16 = v73;
                if (v28)
                {
LABEL_27:
                  BOOL v71 = v23;
                  uint64_t v72 = v21;
                  uint64_t v29 = objc_claimAutoreleasedReturnValue(-[ASCAppOffer metrics](self, "metrics"));
                  uint64_t v30 = objc_claimAutoreleasedReturnValue([v9 metrics]);
                  BOOL v31 = (void *)v30;
                  uint64_t v75 = (void *)v29;
                  if (v29 && v30)
                  {
                    uint64_t v32 = (void *)v30;
                    unsigned int v33 = [v75 isEqual:v30];
                    BOOL v31 = v32;
                    if (v33)
                    {
LABEL_30:
                      uint64_t v69 = v31;
                      uint64_t v34 = objc_claimAutoreleasedReturnValue(-[ASCAppOffer baseBuyParams](self, "baseBuyParams"));
                      uint64_t v35 = objc_claimAutoreleasedReturnValue([v9 baseBuyParams]);
                      uint64_t v36 = (void *)v35;
                      uint64_t v70 = (void *)v34;
                      if (v34 && v35)
                      {
                        uint64_t v37 = (void *)v35;
                        unsigned int v38 = [v70 isEqual:v35];
                        uint64_t v36 = v37;
                        if (v38)
                        {
LABEL_33:
                          uint64_t v67 = v36;
                          uint64_t v39 = objc_claimAutoreleasedReturnValue(-[ASCAppOffer metricsBuyParams](self, "metricsBuyParams"));
                          uint64_t v40 = objc_claimAutoreleasedReturnValue([v9 metricsBuyParams]);
                          uint64_t v41 = (void *)v40;
                          uint64_t v68 = (void *)v39;
                          if (v39 && v40)
                          {
                            uint64_t v42 = (void *)v40;
                            unsigned int v43 = [v68 isEqual:v40];
                            uint64_t v41 = v42;
                            if (v43)
                            {
LABEL_36:
                              uint64_t v65 = v41;
                              uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer additionalHeaders](self, "additionalHeaders"));
                              uint64_t v45 = objc_claimAutoreleasedReturnValue([v9 additionalHeaders]);
                              uint64_t v66 = v44;
                              uint64_t v64 = (void *)v45;
                              if (v44 && v45)
                              {
                                if ([v44 isEqual:v45])
                                {
LABEL_39:
                                  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer preflightPackageURL](self, "preflightPackageURL"));
                                  uint64_t v47 = objc_claimAutoreleasedReturnValue([v9 preflightPackageURL]);
                                  uint64_t v62 = (void *)v47;
                                  BOOL v63 = v46;
                                  if (v46 && v47)
                                  {
                                    if ([v46 isEqual:v47])
                                    {
LABEL_42:
                                      uint64_t v48 = objc_claimAutoreleasedReturnValue(-[ASCAppOffer bundleID](self, "bundleID"));
                                      uint64_t v49 = objc_claimAutoreleasedReturnValue([v9 bundleID]);
                                      uint64_t v61 = (void *)v48;
                                      if (v48 && v49)
                                      {
                                        uint64_t v50 = (void *)v49;
                                        if ([v61 isEqual:v49])
                                        {
LABEL_45:
                                          uint64_t v74 = v16;
                                          uint64_t v60 = v18;
                                          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer itemName](self, "itemName"));
                                          uint64_t v52 = objc_claimAutoreleasedReturnValue([v9 itemName]);
                                          uint64_t v53 = v51;
                                          uint64_t v59 = (void *)v52;
                                          if (v51 && v52)
                                          {
                                            if ([v51 isEqual:v52])
                                            {
LABEL_48:
                                              uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer vendorName](self, "vendorName"));
                                              uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v9 vendorName]);
                                              if (v57 && v58)
                                              {
                                              }

                                              else if (v57 == v58)
                                              {
LABEL_51:
                                                uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer capabilities](self, "capabilities"));
                                                uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v9 capabilities]);
                                                if (v54 && v56) {
                                                  unsigned __int8 v19 = [v54 isEqual:v56];
                                                }
                                                else {
                                                  unsigned __int8 v19 = v54 == v56;
                                                }

                                                goto LABEL_75;
                                              }

                                              unsigned __int8 v19 = 0;
LABEL_75:

                                              goto LABEL_76;
                                            }
                                          }

                                          else if (v51 == (void *)v52)
                                          {
                                            goto LABEL_48;
                                          }

                                          unsigned __int8 v19 = 0;
LABEL_76:

                                          id v18 = v60;
                                          id v16 = v74;
                                          goto LABEL_77;
                                        }
                                      }

                                      else
                                      {
                                        uint64_t v50 = (void *)v49;
                                      }

                                      unsigned __int8 v19 = 0;
LABEL_77:

                                      goto LABEL_78;
                                    }
                                  }

                                  else if (v46 == (void *)v47)
                                  {
                                    goto LABEL_42;
                                  }

                                  unsigned __int8 v19 = 0;
LABEL_78:

                                  goto LABEL_79;
                                }
                              }

                              else if (v44 == (void *)v45)
                              {
                                goto LABEL_39;
                              }

                              unsigned __int8 v19 = 0;
LABEL_79:

                              uint64_t v41 = v65;
                              goto LABEL_80;
                            }
                          }

                          else if (v39 == v40)
                          {
                            goto LABEL_36;
                          }

                          unsigned __int8 v19 = 0;
LABEL_80:

                          uint64_t v36 = v67;
                          goto LABEL_81;
                        }
                      }

                      else if (v34 == v35)
                      {
                        goto LABEL_33;
                      }

                      unsigned __int8 v19 = 0;
LABEL_81:

                      BOOL v31 = v69;
                      goto LABEL_82;
                    }
                  }

                  else if (v29 == v30)
                  {
                    goto LABEL_30;
                  }

                  unsigned __int8 v19 = 0;
LABEL_82:

                  id v23 = v71;
                  id v21 = v72;
                  goto LABEL_83;
                }
              }

              else if (v21 == (void *)v22)
              {
                goto LABEL_27;
              }

              unsigned __int8 v19 = 0;
LABEL_83:

              goto LABEL_84;
            }

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer id](self, "id"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"id");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer titles](self, "titles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"titles");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer subtitles](self, "subtitles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"subtitles");

  id Description = ASCOfferFlagsGetDescription((__int16)-[ASCAppOffer flags](self, "flags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(Description);
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, @"flags");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer ageRating](self, "ageRating"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, @"ageRating");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer metrics](self, "metrics"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v10, @"metrics");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer baseBuyParams](self, "baseBuyParams"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v11, @"baseBuyParams");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer metricsBuyParams](self, "metricsBuyParams"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v12, @"metricsBuyParams");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer additionalHeaders](self, "additionalHeaders"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v13, @"additionalHeaders");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer preflightPackageURL](self, "preflightPackageURL"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v14, @"preflightPackageURL");

  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer bundleID](self, "bundleID"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v15, @"bundleID");

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer itemName](self, "itemName"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v16, @"itemName");

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer vendorName](self, "vendorName"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v17, @"vendorName");

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppOffer capabilities](self, "capabilities"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v18, @"capabilities");

  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v19;
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

- (NSString)baseBuyParams
{
  return self->_baseBuyParams;
}

- (NSString)metricsBuyParams
{
  return self->_metricsBuyParams;
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (NSURL)preflightPackageURL
{
  return self->_preflightPackageURL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)itemName
{
  return self->_itemName;
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
}

@end