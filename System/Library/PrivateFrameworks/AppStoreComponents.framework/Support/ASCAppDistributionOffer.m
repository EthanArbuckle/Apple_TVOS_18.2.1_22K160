@interface ASCAppDistributionOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCAppDistributionOffer)initWithCoder:(id)a3;
- (ASCAppDistributionOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 appVersionId:(id)a9 distributorId:(id)a10;
- (ASCAppDistributionOffer)offerWithMetrics:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSString)appVersionId;
- (NSString)description;
- (NSString)distributorId;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCAppDistributionOffer

- (ASCAppDistributionOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 appVersionId:(id)a9 distributorId:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___ASCAppDistributionOffer;
  v23 = -[ASCAppDistributionOffer init](&v37, "init");
  if (v23)
  {
    v24 = (ASCAdamID *)[v16 copy];
    id = v23->_id;
    v23->_id = v24;

    v26 = (NSDictionary *)[v17 copy];
    titles = v23->_titles;
    v23->_titles = v26;

    v28 = (NSDictionary *)[v18 copy];
    subtitles = v23->_subtitles;
    v23->_subtitles = v28;

    v23->_flags = a6;
    objc_storeStrong((id *)&v23->_ageRating, a7);
    v30 = (NSArray *)[v20 copy];
    metrics = v23->_metrics;
    v23->_metrics = v30;

    v32 = (NSString *)[v21 copy];
    appVersionId = v23->_appVersionId;
    v23->_appVersionId = v32;

    v34 = (NSString *)[v22 copy];
    distributorId = v23->_distributorId;
    v23->_distributorId = v34;
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCAppDistributionOffer)initWithCoder:(id)a3
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
          id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"appVersionId"];
          id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (v17)
          {
            id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"distributorId"];
            uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
            id v20 = (void *)v19;
            if (v19)
            {
              self =  -[ASCAppDistributionOffer initWithID:titles:subtitles:flags:ageRating:metrics:appVersionId:distributorId:]( self,  "initWithID:titles:subtitles:flags:ageRating:metrics:appVersionId:distributorId:",  v6,  v8,  v10,  v11,  v13,  v15,  v17,  v19);
              id v21 = self;
            }

            else
            {
              BOOL v62 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v62) {
                sub_1000E0988(v62, v63, v64, v65, v66, v67, v68, v69);
              }
              id v21 = 0LL;
            }
          }

          else
          {
            BOOL v54 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v54) {
              sub_1000E0954(v54, v55, v56, v57, v58, v59, v60, v61);
            }
            id v21 = 0LL;
          }
        }

        else
        {
          BOOL v46 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v46) {
            sub_1000E0920(v46, v47, v48, v49, v50, v51, v52, v53);
          }
          id v21 = 0LL;
        }
      }

      else
      {
        BOOL v38 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v38) {
          sub_1000E08EC(v38, v39, v40, v41, v42, v43, v44, v45);
        }
        id v21 = 0LL;
      }
    }

    else
    {
      BOOL v30 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v30) {
        sub_1000E08B8(v30, v31, v32, v33, v34, v35, v36, v37);
      }
      id v21 = 0LL;
    }
  }

  else
  {
    BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v22) {
      sub_1000E0884(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    id v21 = 0LL;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer id](self, "id"));
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer titles](self, "titles"));
  [v4 encodeObject:v6 forKey:@"titles"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer subtitles](self, "subtitles"));
  [v4 encodeObject:v7 forKey:@"subtitles"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCAppDistributionOffer flags](self, "flags"), @"flags");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer ageRating](self, "ageRating"));
  [v4 encodeObject:v8 forKey:@"ageRating"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer metrics](self, "metrics"));
  [v4 encodeObject:v9 forKey:@"metrics"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer appVersionId](self, "appVersionId"));
  [v4 encodeObject:v10 forKey:@"appVersionId"];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer distributorId](self, "distributorId"));
  [v4 encodeObject:v11 forKey:@"distributorId"];
}

- (ASCAppDistributionOffer)offerWithMetrics:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer id](self, "id"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer titles](self, "titles"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer subtitles](self, "subtitles"));
  int64_t v9 = -[ASCAppDistributionOffer flags](self, "flags");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer ageRating](self, "ageRating"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer appVersionId](self, "appVersionId"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer distributorId](self, "distributorId"));
  id v13 = [v5 initWithID:v6 titles:v7 subtitles:v8 flags:v9 ageRating:v10 metrics:v4 appVersionId:v11 distributorId:v12];

  return (ASCAppDistributionOffer *)v13;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer id](self, "id"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer titles](self, "titles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer subtitles](self, "subtitles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCAppDistributionOffer flags](self, "flags"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer ageRating](self, "ageRating"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer metrics](self, "metrics"));
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer appVersionId](self, "appVersionId"));
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer distributorId](self, "distributorId"));
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  unint64_t v11 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCAppDistributionOffer);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer id](self, "id"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 id]);
    id v12 = (void *)v11;
    if (v10 && v11)
    {
      if ([v10 isEqual:v11])
      {
LABEL_10:
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer titles](self, "titles"));
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 titles]);
        v15 = (void *)v14;
        if (v13 && v14)
        {
          if ([v13 isEqual:v14])
          {
LABEL_13:
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer subtitles](self, "subtitles"));
            uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 subtitles]);
            id v18 = (void *)v17;
            if (v16 && v17)
            {
            }

            else if (v16 != (void *)v17)
            {
              goto LABEL_36;
            }

            id v20 = -[ASCAppDistributionOffer flags](self, "flags");
            if (v20 == [v9 flags])
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer ageRating](self, "ageRating"));
              uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 ageRating]);
              uint64_t v23 = (void *)v22;
              uint64_t v49 = v21;
              if (v21 && v22)
              {
                uint64_t v24 = v21;
                uint64_t v25 = v23;
                unsigned int v26 = [v24 isEqual:v23];
                uint64_t v23 = v25;
                id v21 = v49;
                if (v26)
                {
LABEL_27:
                  uint64_t v47 = v23;
                  uint64_t v27 = objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer metrics](self, "metrics"));
                  uint64_t v28 = objc_claimAutoreleasedReturnValue([v9 metrics]);
                  uint64_t v29 = (void *)v28;
                  uint64_t v48 = (void *)v27;
                  if (v27 && v28)
                  {
                    BOOL v30 = (void *)v28;
                    unsigned int v31 = [v48 isEqual:v28];
                    uint64_t v29 = v30;
                    if (v31)
                    {
LABEL_30:
                      uint64_t v45 = v29;
                      uint64_t v32 = objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer appVersionId](self, "appVersionId"));
                      uint64_t v33 = objc_claimAutoreleasedReturnValue([v9 appVersionId]);
                      uint64_t v34 = (void *)v33;
                      BOOL v46 = (void *)v32;
                      if (v32 && v33)
                      {
                        uint64_t v35 = (void *)v33;
                        unsigned int v36 = [v46 isEqual:v33];
                        uint64_t v34 = v35;
                        if (v36) {
                          goto LABEL_33;
                        }
                      }

                      else if (v32 == v33)
                      {
LABEL_33:
                        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer distributorId](self, "distributorId", v34));
                        uint64_t v38 = objc_claimAutoreleasedReturnValue([v9 distributorId]);
                        uint64_t v39 = (void *)v38;
                        if (v37 && v38)
                        {
                          uint64_t v40 = (void *)v38;
                          unsigned __int8 v41 = [v37 isEqual:v38];
                          uint64_t v39 = v40;
                          uint64_t v42 = v37;
                          BOOL v19 = v41;
                        }

                        else
                        {
                          uint64_t v42 = v37;
                          BOOL v19 = v37 == (void *)v38;
                        }

                        uint64_t v34 = v44;
                        goto LABEL_45;
                      }

                      BOOL v19 = 0;
LABEL_45:

                      uint64_t v29 = v45;
                      goto LABEL_46;
                    }
                  }

                  else if (v27 == v28)
                  {
                    goto LABEL_30;
                  }

                  BOOL v19 = 0;
LABEL_46:

                  uint64_t v23 = v47;
                  id v21 = v49;
                  goto LABEL_47;
                }
              }

              else if (v21 == (void *)v22)
              {
                goto LABEL_27;
              }

              BOOL v19 = 0;
LABEL_47:

              goto LABEL_48;
            }

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer id](self, "id"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"id");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer titles](self, "titles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"titles");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer subtitles](self, "subtitles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"subtitles");

  id Description = ASCOfferFlagsGetDescription((__int16)-[ASCAppDistributionOffer flags](self, "flags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(Description);
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, @"flags");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer ageRating](self, "ageRating"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, @"ageRating");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer metrics](self, "metrics"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v10, @"metrics");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer appVersionId](self, "appVersionId"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, @"appVersionId");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAppDistributionOffer distributorId](self, "distributorId"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, @"distributorId");

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v13;
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

- (NSString)appVersionId
{
  return self->_appVersionId;
}

- (NSString)distributorId
{
  return self->_distributorId;
}

- (void).cxx_destruct
{
}

@end