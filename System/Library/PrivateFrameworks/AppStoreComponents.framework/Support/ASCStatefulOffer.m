@interface ASCStatefulOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCOffer)buyOffer;
- (ASCOffer)defaultOffer;
- (ASCOffer)openOffer;
- (ASCStatefulOffer)initWithCoder:(id)a3;
- (ASCStatefulOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 defaultOffer:(id)a9 buyOffer:(id)a10 openOffer:(id)a11;
- (ASCStatefulOffer)offerWithMetrics:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSString)description;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCStatefulOffer

- (ASCStatefulOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 defaultOffer:(id)a9 buyOffer:(id)a10 openOffer:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v38 = a7;
  id v37 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___ASCStatefulOffer;
  v23 = -[ASCStatefulOffer init](&v39, "init");
  if (v23)
  {
    v24 = (ASCAdamID *)objc_msgSend(v17, "copy", v37, v38);
    id = v23->_id;
    v23->_id = v24;

    v26 = (NSDictionary *)[v18 copy];
    titles = v23->_titles;
    v23->_titles = v26;

    v28 = (NSDictionary *)[v19 copy];
    subtitles = v23->_subtitles;
    v23->_subtitles = v28;

    v23->_flags = a6;
    objc_storeStrong((id *)&v23->_ageRating, a7);
    objc_storeStrong((id *)&v23->_metrics, a8);
    v30 = (ASCOffer *)[v20 copyWithZone:0];
    defaultOffer = v23->_defaultOffer;
    v23->_defaultOffer = v30;

    v32 = (ASCOffer *)[v21 copyWithZone:0];
    buyOffer = v23->_buyOffer;
    v23->_buyOffer = v32;

    v34 = (ASCOffer *)[v22 copyWithZone:0];
    openOffer = v23->_openOffer;
    v23->_openOffer = v34;
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCStatefulOffer)initWithCoder:(id)a3
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
          id v16 = sub_10001ACFC(v4, @"defaultOffer");
          id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (v17)
          {
            id v18 = sub_10001ACFC(v4, @"buyOffer");
            id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            id v20 = sub_10001ACFC(v4, @"openOffer");
            uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
            id v22 = v11;
            v23 = v13;
            v24 = (void *)v21;
            self =  -[ASCStatefulOffer initWithID:titles:subtitles:flags:ageRating:metrics:defaultOffer:buyOffer:openOffer:]( self,  "initWithID:titles:subtitles:flags:ageRating:metrics:defaultOffer:buyOffer:openOffer:",  v6,  v8,  v10,  v22,  v23,  v15,  v17,  v19,  v21);

            v13 = v23;
            v25 = self;
          }

          else
          {
            BOOL v58 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v58) {
              sub_1000E1BD8(v58, v59, v60, v61, v62, v63, v64, v65);
            }
            v25 = 0LL;
          }
        }

        else
        {
          BOOL v50 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v50) {
            sub_1000E1BA4(v50, v51, v52, v53, v54, v55, v56, v57);
          }
          v25 = 0LL;
        }
      }

      else
      {
        BOOL v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v42) {
          sub_1000E1B70(v42, v43, v44, v45, v46, v47, v48, v49);
        }
        v25 = 0LL;
      }
    }

    else
    {
      BOOL v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v34) {
        sub_1000E1B3C(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      v25 = 0LL;
    }
  }

  else
  {
    BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v26) {
      sub_1000E1B08(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    v25 = 0LL;
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer id](self, "id"));
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer titles](self, "titles"));
  [v4 encodeObject:v6 forKey:@"titles"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer subtitles](self, "subtitles"));
  [v4 encodeObject:v7 forKey:@"subtitles"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCStatefulOffer flags](self, "flags"), @"flags");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer ageRating](self, "ageRating"));
  [v4 encodeObject:v8 forKey:@"ageRating"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer metrics](self, "metrics"));
  [v4 encodeObject:v9 forKey:@"metrics"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer defaultOffer](self, "defaultOffer"));
  [v4 encodeObject:v10 forKey:@"defaultOffer"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer buyOffer](self, "buyOffer"));
  [v4 encodeObject:v11 forKey:@"buyOffer"];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer openOffer](self, "openOffer"));
  [v4 encodeObject:v12 forKey:@"openOffer"];
}

- (ASCStatefulOffer)offerWithMetrics:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer id](self, "id"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer titles](self, "titles"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer subtitles](self, "subtitles"));
  int64_t v9 = -[ASCStatefulOffer flags](self, "flags");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer ageRating](self, "ageRating"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer defaultOffer](self, "defaultOffer"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer buyOffer](self, "buyOffer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer openOffer](self, "openOffer"));
  id v14 = [v5 initWithID:v6 titles:v7 subtitles:v8 flags:v9 ageRating:v10 metrics:v4 defaultOffer:v11 buyOffer:v12 openOffer:v13];

  return (ASCStatefulOffer *)v14;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer id](self, "id"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer titles](self, "titles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer subtitles](self, "subtitles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCStatefulOffer flags](self, "flags"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer ageRating](self, "ageRating"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer metrics](self, "metrics"));
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer defaultOffer](self, "defaultOffer"));
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer buyOffer](self, "buyOffer"));
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer openOffer](self, "openOffer"));
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  unint64_t v12 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCStatefulOffer);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer id](self, "id"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 id]);
    unint64_t v12 = (void *)v11;
    if (v10 && v11)
    {
      if ([v10 isEqual:v11])
      {
LABEL_10:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer titles](self, "titles"));
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 titles]);
        v15 = (void *)v14;
        if (v13 && v14)
        {
          if ([v13 isEqual:v14])
          {
LABEL_13:
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer subtitles](self, "subtitles"));
            uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 subtitles]);
            id v18 = (void *)v17;
            if (v16 && v17)
            {
            }

            else if (v16 != (void *)v17)
            {
              goto LABEL_39;
            }

            id v20 = -[ASCStatefulOffer flags](self, "flags");
            if (v20 == [v9 flags])
            {
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer ageRating](self, "ageRating"));
              uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 ageRating]);
              v23 = (void *)v22;
              uint64_t v56 = v21;
              if (v21 && v22)
              {
                v24 = v21;
                v25 = v23;
                unsigned int v26 = [v24 isEqual:v23];
                v23 = v25;
                uint64_t v21 = v56;
                if (v26)
                {
LABEL_27:
                  uint64_t v54 = v23;
                  uint64_t v27 = objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer metrics](self, "metrics"));
                  uint64_t v28 = objc_claimAutoreleasedReturnValue([v9 metrics]);
                  uint64_t v29 = (void *)v28;
                  uint64_t v55 = (void *)v27;
                  if (v27 && v28)
                  {
                    uint64_t v30 = (void *)v28;
                    unsigned int v31 = [v55 isEqual:v28];
                    uint64_t v29 = v30;
                    if (v31)
                    {
LABEL_30:
                      uint64_t v52 = v29;
                      uint64_t v32 = objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer defaultOffer](self, "defaultOffer"));
                      uint64_t v33 = objc_claimAutoreleasedReturnValue([v9 defaultOffer]);
                      BOOL v34 = (void *)v33;
                      uint64_t v53 = (void *)v32;
                      if (v32 && v33)
                      {
                        uint64_t v35 = (void *)v33;
                        unsigned int v36 = [v53 isEqual:v33];
                        BOOL v34 = v35;
                        if (v36)
                        {
LABEL_33:
                          BOOL v50 = v34;
                          uint64_t v37 = objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer buyOffer](self, "buyOffer"));
                          uint64_t v38 = objc_claimAutoreleasedReturnValue([v9 buyOffer]);
                          uint64_t v39 = (void *)v38;
                          uint64_t v51 = (void *)v37;
                          if (v37 && v38)
                          {
                            uint64_t v40 = (void *)v38;
                            unsigned int v41 = [v51 isEqual:v38];
                            uint64_t v39 = v40;
                            if (v41) {
                              goto LABEL_36;
                            }
                          }

                          else if (v37 == v38)
                          {
LABEL_36:
                            BOOL v42 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer openOffer](self, "openOffer", v39));
                            uint64_t v43 = objc_claimAutoreleasedReturnValue([v9 openOffer]);
                            uint64_t v44 = (void *)v43;
                            if (v42 && v43)
                            {
                              uint64_t v45 = (void *)v43;
                              unsigned __int8 v46 = [v42 isEqual:v43];
                              uint64_t v44 = v45;
                              uint64_t v47 = v42;
                              BOOL v19 = v46;
                            }

                            else
                            {
                              uint64_t v47 = v42;
                              BOOL v19 = v42 == (void *)v43;
                            }

                            uint64_t v39 = v49;
                            goto LABEL_50;
                          }

                          BOOL v19 = 0;
LABEL_50:

                          BOOL v34 = v50;
                          goto LABEL_51;
                        }
                      }

                      else if (v32 == v33)
                      {
                        goto LABEL_33;
                      }

                      BOOL v19 = 0;
LABEL_51:

                      uint64_t v29 = v52;
                      goto LABEL_52;
                    }
                  }

                  else if (v27 == v28)
                  {
                    goto LABEL_30;
                  }

                  BOOL v19 = 0;
LABEL_52:

                  v23 = v54;
                  uint64_t v21 = v56;
                  goto LABEL_53;
                }
              }

              else if (v21 == (void *)v22)
              {
                goto LABEL_27;
              }

              BOOL v19 = 0;
LABEL_53:

              goto LABEL_54;
            }

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer id](self, "id"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"id");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer titles](self, "titles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"titles");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer subtitles](self, "subtitles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"subtitles");

  id Description = ASCOfferFlagsGetDescription((__int16)-[ASCStatefulOffer flags](self, "flags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(Description);
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, @"flags");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer ageRating](self, "ageRating"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, @"ageRating");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer metrics](self, "metrics"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v10, @"metrics");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer defaultOffer](self, "defaultOffer"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, @"defaultOffer");

  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer buyOffer](self, "buyOffer"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, @"buyOffer");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCStatefulOffer openOffer](self, "openOffer"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v13, @"openOffer");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v14;
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

- (ASCOffer)defaultOffer
{
  return self->_defaultOffer;
}

- (ASCOffer)buyOffer
{
  return self->_buyOffer;
}

- (ASCOffer)openOffer
{
  return self->_openOffer;
}

- (void).cxx_destruct
{
}

@end