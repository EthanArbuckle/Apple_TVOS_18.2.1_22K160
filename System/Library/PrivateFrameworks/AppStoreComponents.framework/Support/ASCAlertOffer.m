@interface ASCAlertOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCAlertOffer)initWithCoder:(id)a3;
- (ASCAlertOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 alertTitle:(id)a9 alertMessage:(id)a10 alertButtonOffer:(id)a11 alertButtonTitle:(id)a12;
- (ASCAlertOffer)offerWithMetrics:(id)a3;
- (ASCOffer)alertButtonOffer;
- (BOOL)isEqual:(id)a3;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSString)alertButtonTitle;
- (NSString)alertMessage;
- (NSString)alertTitle;
- (NSString)description;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCAlertOffer

- (ASCAlertOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 alertTitle:(id)a9 alertMessage:(id)a10 alertButtonOffer:(id)a11 alertButtonTitle:(id)a12
{
  id v44 = a3;
  id v18 = a4;
  id v19 = a5;
  id v43 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___ASCAlertOffer;
  v25 = -[ASCAlertOffer init](&v45, "init");
  if (v25)
  {
    v26 = (ASCAdamID *)objc_msgSend(v44, "copy", v43);
    id = v25->_id;
    v25->_id = v26;

    v28 = (NSDictionary *)[v18 copy];
    titles = v25->_titles;
    v25->_titles = v28;

    v30 = (NSDictionary *)[v19 copy];
    subtitles = v25->_subtitles;
    v25->_subtitles = v30;

    v25->_flags = a6;
    objc_storeStrong((id *)&v25->_ageRating, a7);
    v32 = (NSArray *)[v20 copy];
    metrics = v25->_metrics;
    v25->_metrics = v32;

    v34 = (NSString *)[v21 copy];
    alertTitle = v25->_alertTitle;
    v25->_alertTitle = v34;

    v36 = (NSString *)[v22 copy];
    alertMessage = v25->_alertMessage;
    v25->_alertMessage = v36;

    v38 = (ASCOffer *)[v23 copyWithZone:0];
    alertButtonOffer = v25->_alertButtonOffer;
    v25->_alertButtonOffer = v38;

    v40 = (NSString *)[v24 copy];
    alertButtonTitle = v25->_alertButtonTitle;
    v25->_alertButtonTitle = v40;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCAlertOffer)initWithCoder:(id)a3
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
          v58 = v13;
          id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"alertTitle"];
          v57 = (void *)objc_claimAutoreleasedReturnValue(v16);
          id v17 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"alertMessage"];
          v56 = (void *)objc_claimAutoreleasedReturnValue(v17);
          id v18 = sub_10001ACFC(v4, @"alertButtonOffer");
          id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          id v20 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"alertButtonTitle"];
          id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          self =  -[ASCAlertOffer initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertButtonOffer:alertButtonTitle:]( self,  "initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertButtonOffer:alertButtonTitle:",  v6,  v8,  v10,  v11,  v58,  v15,  v57,  v56,  v19,  v21);

          v13 = v58;
          id v22 = self;
        }

        else
        {
          BOOL v47 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v47) {
            sub_1000E0850(v47, v48, v49, v50, v51, v52, v53, v54);
          }
          id v22 = 0LL;
        }
      }

      else
      {
        BOOL v39 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v39) {
          sub_1000E081C(v39, v40, v41, v42, v43, v44, v45, v46);
        }
        id v22 = 0LL;
      }
    }

    else
    {
      BOOL v31 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v31) {
        sub_1000E07E8(v31, v32, v33, v34, v35, v36, v37, v38);
      }
      id v22 = 0LL;
    }
  }

  else
  {
    BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v23) {
      sub_1000E07B4(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    id v22 = 0LL;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer id](self, "id"));
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer titles](self, "titles"));
  [v4 encodeObject:v6 forKey:@"titles"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer subtitles](self, "subtitles"));
  [v4 encodeObject:v7 forKey:@"subtitles"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCAlertOffer flags](self, "flags"), @"flags");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer ageRating](self, "ageRating"));
  [v4 encodeObject:v8 forKey:@"ageRating"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer metrics](self, "metrics"));
  [v4 encodeObject:v9 forKey:@"metrics"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertTitle](self, "alertTitle"));
  [v4 encodeObject:v10 forKey:@"alertTitle"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertMessage](self, "alertMessage"));
  [v4 encodeObject:v11 forKey:@"alertMessage"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertButtonOffer](self, "alertButtonOffer"));
  [v4 encodeObject:v12 forKey:@"alertButtonOffer"];

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertButtonTitle](self, "alertButtonTitle"));
  [v4 encodeObject:v13 forKey:@"alertButtonTitle"];
}

- (ASCAlertOffer)offerWithMetrics:(id)a3
{
  id v4 = a3;
  id v16 = objc_alloc((Class)objc_opt_class(self));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer id](self, "id"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer titles](self, "titles"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer subtitles](self, "subtitles"));
  int64_t v7 = -[ASCAlertOffer flags](self, "flags");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer ageRating](self, "ageRating"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertTitle](self, "alertTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertMessage](self, "alertMessage"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertButtonOffer](self, "alertButtonOffer"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertButtonTitle](self, "alertButtonTitle"));
  id v13 = [v16 initWithID:v15 titles:v5 subtitles:v6 flags:v7 ageRating:v8 metrics:v4 alertTitle:v9 alertMessage:v10 alertButtonOffer:v11 alertButtonTitle:v12];

  return (ASCAlertOffer *)v13;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer id](self, "id"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer titles](self, "titles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer subtitles](self, "subtitles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCAlertOffer flags](self, "flags"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer ageRating](self, "ageRating"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer metrics](self, "metrics"));
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertTitle](self, "alertTitle"));
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertMessage](self, "alertMessage"));
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertButtonOffer](self, "alertButtonOffer"));
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertButtonTitle](self, "alertButtonTitle"));
  -[ASCHasher combineObject:](v3, "combineObject:", v12);

  unint64_t v13 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCAlertOffer);
  id v6 = v4;
  int64_t v7 = v6;
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer id](self, "id"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 id]);
    id v12 = (void *)v11;
    if (v10 && v11)
    {
      if ([v10 isEqual:v11])
      {
LABEL_10:
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer titles](self, "titles"));
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 titles]);
        v15 = (void *)v14;
        if (v13 && v14)
        {
          if ([v13 isEqual:v14])
          {
LABEL_13:
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer subtitles](self, "subtitles"));
            uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 subtitles]);
            id v18 = (void *)v17;
            if (v16 && v17)
            {
            }

            else if (v16 != (void *)v17)
            {
              goto LABEL_42;
            }

            id v20 = -[ASCAlertOffer flags](self, "flags");
            if (v20 == [v9 flags])
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer ageRating](self, "ageRating"));
              uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 ageRating]);
              BOOL v23 = (void *)v22;
              v60 = v21;
              if (v21 && v22)
              {
                uint64_t v24 = v21;
                uint64_t v25 = v23;
                unsigned int v26 = [v24 isEqual:v23];
                BOOL v23 = v25;
                id v21 = v60;
                if (v26)
                {
LABEL_27:
                  v58 = v23;
                  uint64_t v27 = objc_claimAutoreleasedReturnValue(-[ASCAlertOffer metrics](self, "metrics"));
                  uint64_t v28 = objc_claimAutoreleasedReturnValue([v9 metrics]);
                  uint64_t v29 = (void *)v28;
                  v59 = (void *)v27;
                  if (v27 && v28)
                  {
                    uint64_t v30 = (void *)v28;
                    unsigned int v31 = [v59 isEqual:v28];
                    uint64_t v29 = v30;
                    if (v31)
                    {
LABEL_30:
                      v56 = v29;
                      uint64_t v32 = objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertTitle](self, "alertTitle"));
                      uint64_t v33 = objc_claimAutoreleasedReturnValue([v9 alertTitle]);
                      uint64_t v34 = (void *)v33;
                      v57 = (void *)v32;
                      if (v32 && v33)
                      {
                        uint64_t v35 = (void *)v33;
                        unsigned int v36 = [v57 isEqual:v33];
                        uint64_t v34 = v35;
                        if (v36)
                        {
LABEL_33:
                          uint64_t v54 = v34;
                          uint64_t v37 = objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertMessage](self, "alertMessage"));
                          uint64_t v38 = objc_claimAutoreleasedReturnValue([v9 alertMessage]);
                          BOOL v39 = (void *)v38;
                          v55 = (void *)v37;
                          if (v37 && v38)
                          {
                            uint64_t v40 = (void *)v38;
                            unsigned int v41 = [v55 isEqual:v38];
                            BOOL v39 = v40;
                            if (v41)
                            {
LABEL_36:
                              uint64_t v52 = v39;
                              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertButtonOffer](self, "alertButtonOffer"));
                              uint64_t v43 = objc_claimAutoreleasedReturnValue([v9 alertButtonOffer]);
                              uint64_t v53 = v42;
                              uint64_t v51 = (void *)v43;
                              if (v42 && v43)
                              {
                              }

                              else if (v42 == (void *)v43)
                              {
LABEL_39:
                                uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertButtonTitle](self, "alertButtonTitle", v51));
                                uint64_t v45 = objc_claimAutoreleasedReturnValue([v9 alertButtonTitle]);
                                uint64_t v46 = (void *)v45;
                                if (v44 && v45)
                                {
                                  BOOL v47 = (void *)v45;
                                  unsigned __int8 v48 = [v44 isEqual:v45];
                                  uint64_t v46 = v47;
                                  uint64_t v49 = v44;
                                  BOOL v19 = v48;
                                }

                                else
                                {
                                  uint64_t v49 = v44;
                                  BOOL v19 = v44 == (void *)v45;
                                }

                                goto LABEL_55;
                              }

                              BOOL v19 = 0;
LABEL_55:

                              BOOL v39 = v52;
                              goto LABEL_56;
                            }
                          }

                          else if (v37 == v38)
                          {
                            goto LABEL_36;
                          }

                          BOOL v19 = 0;
LABEL_56:

                          uint64_t v34 = v54;
                          goto LABEL_57;
                        }
                      }

                      else if (v32 == v33)
                      {
                        goto LABEL_33;
                      }

                      BOOL v19 = 0;
LABEL_57:

                      uint64_t v29 = v56;
                      goto LABEL_58;
                    }
                  }

                  else if (v27 == v28)
                  {
                    goto LABEL_30;
                  }

                  BOOL v19 = 0;
LABEL_58:

                  BOOL v23 = v58;
                  id v21 = v60;
                  goto LABEL_59;
                }
              }

              else if (v21 == (void *)v22)
              {
                goto LABEL_27;
              }

              BOOL v19 = 0;
LABEL_59:

              goto LABEL_60;
            }

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer id](self, "id"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"id");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer titles](self, "titles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"titles");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer subtitles](self, "subtitles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"subtitles");

  id Description = ASCOfferFlagsGetDescription((__int16)-[ASCAlertOffer flags](self, "flags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(Description);
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, @"flags");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer ageRating](self, "ageRating"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, @"ageRating");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer metrics](self, "metrics"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v10, @"metrics");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertTitle](self, "alertTitle"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, @"alertTitle");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertMessage](self, "alertMessage"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, @"alertMessage");

  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertButtonOffer](self, "alertButtonOffer"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v13, @"alertButtonOffer");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCAlertOffer alertButtonTitle](self, "alertButtonTitle"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v14, @"alertButtonTitle");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return (NSString *)v15;
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

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (ASCOffer)alertButtonOffer
{
  return self->_alertButtonOffer;
}

- (NSString)alertButtonTitle
{
  return self->_alertButtonTitle;
}

- (void).cxx_destruct
{
}

@end