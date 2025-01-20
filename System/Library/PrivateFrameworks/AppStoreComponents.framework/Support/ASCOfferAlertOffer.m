@interface ASCOfferAlertOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCOffer)completionOffer;
- (ASCOfferAlertOffer)initWithCoder:(id)a3;
- (ASCOfferAlertOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 alertTitle:(id)a9 alertMessage:(id)a10 alertFooterMessage:(id)a11 isCancelable:(BOOL)a12 checkRestrictionsForContentRating:(id)a13 shouldCheckForAvailableDiskSpace:(BOOL)a14 remoteControllerRequirement:(id)a15 shouldIncludeActiveAccountInFooterMessage:(BOOL)a16 shouldPromptForConfirmation:(BOOL)a17 completionOffer:(id)a18;
- (ASCOfferAlertOffer)offerWithMetrics:(id)a3;
- (BOOL)isCancelable;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldCheckForAvailableDiskSpace;
- (BOOL)shouldIncludeActiveAccountInFooterMessage;
- (BOOL)shouldPromptForConfirmation;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSNumber)checkRestrictionsForContentRating;
- (NSString)alertFooterMessage;
- (NSString)alertMessage;
- (NSString)alertTitle;
- (NSString)description;
- (NSString)remoteControllerRequirement;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCOfferAlertOffer

- (ASCOfferAlertOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 alertTitle:(id)a9 alertMessage:(id)a10 alertFooterMessage:(id)a11 isCancelable:(BOOL)a12 checkRestrictionsForContentRating:(id)a13 shouldCheckForAvailableDiskSpace:(BOOL)a14 remoteControllerRequirement:(id)a15 shouldIncludeActiveAccountInFooterMessage:(BOOL)a16 shouldPromptForConfirmation:(BOOL)a17 completionOffer:(id)a18
{
  id v22 = a3;
  id v23 = a4;
  id v58 = a5;
  id v56 = a7;
  id v57 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a13;
  id v28 = a15;
  id v29 = a18;
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___ASCOfferAlertOffer;
  v30 = -[ASCOfferAlertOffer init](&v59, "init");
  if (v30)
  {
    v31 = (ASCAdamID *)[v22 copy];
    id = v30->_id;
    v30->_id = v31;

    v33 = (NSDictionary *)[v23 copy];
    titles = v30->_titles;
    v30->_titles = v33;

    v35 = (NSDictionary *)[v58 copy];
    subtitles = v30->_subtitles;
    v30->_subtitles = v35;

    v30->_flags = a6;
    objc_storeStrong((id *)&v30->_ageRating, a7);
    v37 = (NSArray *)[v57 copy];
    metrics = v30->_metrics;
    v30->_metrics = v37;

    v39 = (NSString *)[v24 copy];
    alertTitle = v30->_alertTitle;
    v30->_alertTitle = v39;

    v41 = (NSString *)[v25 copy];
    alertMessage = v30->_alertMessage;
    v30->_alertMessage = v41;

    v43 = (NSString *)[v24 copy];
    v44 = v30->_alertTitle;
    v30->_alertTitle = v43;

    v45 = (NSString *)[v26 copy];
    alertFooterMessage = v30->_alertFooterMessage;
    v30->_alertFooterMessage = v45;

    v30->_isCancelable = a12;
    v47 = (NSNumber *)[v27 copy];
    checkRestrictionsForContentRating = v30->_checkRestrictionsForContentRating;
    v30->_checkRestrictionsForContentRating = v47;

    v30->_shouldCheckForAvailableDiskSpace = a14;
    v49 = (NSString *)[v28 copy];
    remoteControllerRequirement = v30->_remoteControllerRequirement;
    v30->_remoteControllerRequirement = v49;

    v30->_shouldIncludeActiveAccountInFooterMessage = a16;
    v30->_shouldPromptForConfirmation = a17;
    v51 = (ASCOffer *)[v29 copyWithZone:0];
    completionOffer = v30->_completionOffer;
    v30->_completionOffer = v51;
  }

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCOfferAlertOffer)initWithCoder:(id)a3
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
        v71 = (void *)objc_claimAutoreleasedReturnValue(v12);
        id v13 = sub_100019B2C(v4, @"metrics");
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          id v67 = v11;
          id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"alertTitle"];
          v66 = (void *)objc_claimAutoreleasedReturnValue(v15);
          id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"alertMessage"];
          v70 = (void *)objc_claimAutoreleasedReturnValue(v16);
          id v17 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"alertFooterMessage"];
          v65 = (void *)objc_claimAutoreleasedReturnValue(v17);
          v69 = v10;
          v68 = v14;
          else {
            unsigned __int8 v64 = 1;
          }
          id v51 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"checkRestrictionsForContentRating"];
          v63 = (void *)objc_claimAutoreleasedReturnValue(v51);
          unsigned __int8 v52 = [v4 decodeBoolForKey:@"shouldCheckForAvailableDiskSpace"];
          id v53 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"remoteControllerRequirement"];
          v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
          unsigned __int8 v55 = [v4 decodeBoolForKey:@"shouldIncludeActiveAccountInFooterMessage"];
          unsigned __int8 v56 = [v4 decodeBoolForKey:@"shouldPromptForConfirmation"];
          id v57 = sub_10001ACFC(v4, @"completionOffer");
          id v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
          BYTE1(v62) = v56;
          LOBYTE(v62) = v55;
          LOBYTE(v61) = v52;
          LOBYTE(v60) = v64;
          v10 = v69;
          self =  -[ASCOfferAlertOffer initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertFooterMessage:isCancelable:checkRestrictionsForContentRating:shouldCheckForAvailableDiskSpace:remoteControllerRequirement:shouldIncludeActiveAccountInFooterMessage:shouldPromptForConfirmation:completionOffer:]( self,  "initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertFooterMessage:isCa ncelable:checkRestrictionsForContentRating:shouldCheckForAvailableDiskSpace:remoteControllerRequire ment:shouldIncludeActiveAccountInFooterMessage:shouldPromptForConfirmation:completionOffer:",  v6,  v8,  v69,  v67,  v71,  v68,  v66,  v70,  v65,  v60,  v63,  v61,  v54,  v62,  v58);

          v14 = v68;
          id v26 = self;
        }

        else
        {
          BOOL v43 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v43) {
            sub_1000E14C8(v43, v44, v45, v46, v47, v48, v49, v50);
          }
          id v26 = 0LL;
        }
      }

      else
      {
        BOOL v35 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v35) {
          sub_1000E1494(v35, v36, v37, v38, v39, v40, v41, v42);
        }
        id v26 = 0LL;
      }
    }

    else
    {
      BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v27) {
        sub_1000E1460(v27, v28, v29, v30, v31, v32, v33, v34);
      }
      id v26 = 0LL;
    }
  }

  else
  {
    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v18) {
      sub_1000E142C(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    id v26 = 0LL;
  }

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer id](self, "id"));
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer titles](self, "titles"));
  [v4 encodeObject:v6 forKey:@"titles"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer subtitles](self, "subtitles"));
  [v4 encodeObject:v7 forKey:@"subtitles"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCOfferAlertOffer flags](self, "flags"), @"flags");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer ageRating](self, "ageRating"));
  [v4 encodeObject:v8 forKey:@"ageRating"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer metrics](self, "metrics"));
  [v4 encodeObject:v9 forKey:@"metrics"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertTitle](self, "alertTitle"));
  [v4 encodeObject:v10 forKey:@"alertTitle"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertMessage](self, "alertMessage"));
  [v4 encodeObject:v11 forKey:@"alertMessage"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertFooterMessage](self, "alertFooterMessage"));
  [v4 encodeObject:v12 forKey:@"alertFooterMessage"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[ASCOfferAlertOffer isCancelable](self, "isCancelable"),  @"isCancelable");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer checkRestrictionsForContentRating](self, "checkRestrictionsForContentRating"));
  [v4 encodeObject:v13 forKey:@"checkRestrictionsForContentRating"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[ASCOfferAlertOffer shouldCheckForAvailableDiskSpace](self, "shouldCheckForAvailableDiskSpace"),  @"shouldCheckForAvailableDiskSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer remoteControllerRequirement](self, "remoteControllerRequirement"));
  [v4 encodeObject:v14 forKey:@"remoteControllerRequirement"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[ASCOfferAlertOffer shouldIncludeActiveAccountInFooterMessage](self, "shouldIncludeActiveAccountInFooterMessage"),  @"shouldIncludeActiveAccountInFooterMessage");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[ASCOfferAlertOffer shouldPromptForConfirmation](self, "shouldPromptForConfirmation"),  @"shouldPromptForConfirmation");
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer completionOffer](self, "completionOffer"));
  [v4 encodeObject:v15 forKey:@"completionOffer"];
}

- (ASCOfferAlertOffer)offerWithMetrics:(id)a3
{
  id v25 = a3;
  id v23 = objc_alloc((Class)objc_opt_class(self));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer id](self, "id"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer titles](self, "titles"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer subtitles](self, "subtitles"));
  int64_t v19 = -[ASCOfferAlertOffer flags](self, "flags");
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer ageRating](self, "ageRating"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertTitle](self, "alertTitle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertMessage](self, "alertMessage"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertFooterMessage](self, "alertFooterMessage"));
  unsigned __int8 v6 = -[ASCOfferAlertOffer isCancelable](self, "isCancelable");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer checkRestrictionsForContentRating](self, "checkRestrictionsForContentRating"));
  unsigned __int8 v8 = -[ASCOfferAlertOffer shouldCheckForAvailableDiskSpace](self, "shouldCheckForAvailableDiskSpace");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer remoteControllerRequirement](self, "remoteControllerRequirement"));
  unsigned __int8 v10 = -[ASCOfferAlertOffer shouldIncludeActiveAccountInFooterMessage]( self,  "shouldIncludeActiveAccountInFooterMessage");
  unsigned __int8 v11 = -[ASCOfferAlertOffer shouldPromptForConfirmation](self, "shouldPromptForConfirmation");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer completionOffer](self, "completionOffer"));
  BYTE1(v16) = v11;
  LOBYTE(v16) = v10;
  LOBYTE(v15) = v8;
  LOBYTE(v14) = v6;
  id v24 = objc_msgSend( v23,  "initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertFooterMessage:isCancelable:ch eckRestrictionsForContentRating:shouldCheckForAvailableDiskSpace:remoteControllerRequirement:shouldIncludeActi veAccountInFooterMessage:shouldPromptForConfirmation:completionOffer:",  v22,  v21,  v20,  v19,  v18,  v25,  v17,  v4,  v5,  v14,  v7,  v15,  v9,  v16,  v12);

  return (ASCOfferAlertOffer *)v24;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer id](self, "id"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer titles](self, "titles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer subtitles](self, "subtitles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCOfferAlertOffer flags](self, "flags"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer ageRating](self, "ageRating"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer metrics](self, "metrics"));
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertTitle](self, "alertTitle"));
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertMessage](self, "alertMessage"));
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertFooterMessage](self, "alertFooterMessage"));
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCOfferAlertOffer isCancelable](self, "isCancelable"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer checkRestrictionsForContentRating](self, "checkRestrictionsForContentRating"));
  -[ASCHasher combineObject:](v3, "combineObject:", v12);

  -[ASCHasher combineBool:]( v3,  "combineBool:",  -[ASCOfferAlertOffer shouldCheckForAvailableDiskSpace](self, "shouldCheckForAvailableDiskSpace"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer remoteControllerRequirement](self, "remoteControllerRequirement"));
  -[ASCHasher combineObject:](v3, "combineObject:", v13);

  -[ASCHasher combineBool:]( v3,  "combineBool:",  -[ASCOfferAlertOffer shouldIncludeActiveAccountInFooterMessage](self, "shouldIncludeActiveAccountInFooterMessage"));
  -[ASCHasher combineBool:]( v3,  "combineBool:",  -[ASCOfferAlertOffer shouldPromptForConfirmation](self, "shouldPromptForConfirmation"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer completionOffer](self, "completionOffer"));
  -[ASCHasher combineObject:](v3, "combineObject:", v14);

  unint64_t v15 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCOfferAlertOffer);
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      unsigned __int8 v8 = v7;
    }
    else {
      unsigned __int8 v8 = 0LL;
    }
  }

  else
  {
    unsigned __int8 v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer id](self, "id"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 id]);
    id v12 = (void *)v11;
    if (v10 && v11)
    {
      if ([v10 isEqual:v11])
      {
LABEL_10:
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer titles](self, "titles"));
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 titles]);
        unint64_t v15 = (void *)v14;
        if (v13 && v14)
        {
          if ([v13 isEqual:v14])
          {
LABEL_13:
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer subtitles](self, "subtitles"));
            uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 subtitles]);
            BOOL v18 = (void *)v17;
            if (v16 && v17)
            {
            }

            else if (v16 != (void *)v17)
            {
              goto LABEL_40;
            }

            id v20 = -[ASCOfferAlertOffer flags](self, "flags");
            if (v20 == [v9 flags])
            {
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer ageRating](self, "ageRating"));
              uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 ageRating]);
              id v23 = (void *)v22;
              if (v21 && v22)
              {
                id v24 = v21;
                v72 = v16;
                id v25 = v18;
                id v26 = v21;
                BOOL v27 = v23;
                unsigned int v28 = [v24 isEqual:v23];
                id v23 = v27;
                uint64_t v21 = v26;
                BOOL v18 = v25;
                uint64_t v16 = v72;
                if (v28)
                {
LABEL_27:
                  v70 = v23;
                  v71 = v21;
                  uint64_t v29 = objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer metrics](self, "metrics"));
                  uint64_t v30 = objc_claimAutoreleasedReturnValue([v9 metrics]);
                  uint64_t v31 = (void *)v30;
                  v75 = (void *)v29;
                  if (v29 && v30)
                  {
                    uint64_t v32 = (void *)v30;
                    unsigned int v33 = [v75 isEqual:v30];
                    uint64_t v31 = v32;
                    if (v33)
                    {
LABEL_30:
                      v68 = v31;
                      uint64_t v34 = objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertTitle](self, "alertTitle"));
                      uint64_t v35 = objc_claimAutoreleasedReturnValue([v9 alertTitle]);
                      uint64_t v36 = (void *)v35;
                      v69 = (void *)v34;
                      if (v34 && v35)
                      {
                        uint64_t v37 = (void *)v35;
                        unsigned int v38 = [v69 isEqual:v35];
                        uint64_t v36 = v37;
                        if (v38)
                        {
LABEL_33:
                          v66 = v36;
                          uint64_t v39 = objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertMessage](self, "alertMessage"));
                          uint64_t v40 = objc_claimAutoreleasedReturnValue([v9 alertMessage]);
                          uint64_t v41 = (void *)v40;
                          id v67 = (void *)v39;
                          if (v39 && v40)
                          {
                            uint64_t v42 = (void *)v40;
                            unsigned int v43 = [v67 isEqual:v40];
                            uint64_t v41 = v42;
                            if (v43)
                            {
LABEL_36:
                              unsigned __int8 v64 = v41;
                              uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertFooterMessage](self, "alertFooterMessage"));
                              uint64_t v45 = objc_claimAutoreleasedReturnValue([v9 alertFooterMessage]);
                              v65 = v44;
                              v63 = (void *)v45;
                              if (v44 && v45)
                              {
                              }

                              else if (v44 != (void *)v45)
                              {
LABEL_51:
                                unsigned __int8 v19 = 0;
LABEL_69:

                                uint64_t v41 = v64;
                                goto LABEL_70;
                              }

                              unsigned int v46 = -[ASCOfferAlertOffer isCancelable](self, "isCancelable");
                              uint64_t v47 = objc_claimAutoreleasedReturnValue( -[ASCOfferAlertOffer checkRestrictionsForContentRating]( self,  "checkRestrictionsForContentRating"));
                              uint64_t v48 = objc_claimAutoreleasedReturnValue([v9 checkRestrictionsForContentRating]);
                              uint64_t v62 = (void *)v47;
                              if (v47 && v48)
                              {
                                uint64_t v49 = (void *)v48;
                              }

                              else
                              {
                                uint64_t v49 = (void *)v48;
                                if (v62 != (void *)v48)
                                {
LABEL_58:
                                  unsigned __int8 v19 = 0;
LABEL_68:

                                  goto LABEL_69;
                                }
                              }

                              unsigned int v73 = -[ASCOfferAlertOffer shouldCheckForAvailableDiskSpace]( self,  "shouldCheckForAvailableDiskSpace");
                              v74 = v16;
                              uint64_t v61 = v18;
                              uint64_t v50 = objc_claimAutoreleasedReturnValue( -[ASCOfferAlertOffer remoteControllerRequirement]( self,  "remoteControllerRequirement"));
                              uint64_t v51 = objc_claimAutoreleasedReturnValue([v9 remoteControllerRequirement]);
                              unsigned __int8 v52 = (void *)v51;
                              id v53 = (void *)v50;
                              if (v50 && v51)
                              {
                                v54 = (void *)v50;
                                unsigned __int8 v55 = v52;
                              }

                              else
                              {
                                unsigned __int8 v55 = (void *)v51;
                              }

                              unsigned int v58 = -[ASCOfferAlertOffer shouldIncludeActiveAccountInFooterMessage]( self,  "shouldIncludeActiveAccountInFooterMessage");
                              if (v58 == [v9 shouldIncludeActiveAccountInFooterMessage])
                              {
                                unsigned int v59 = -[ASCOfferAlertOffer shouldPromptForConfirmation]( self,  "shouldPromptForConfirmation");
                                if (v59 == [v9 shouldPromptForConfirmation])
                                {
                                  id v57 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer completionOffer](self, "completionOffer"));
                                  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v9 completionOffer]);
                                  if (v57 && v60) {
                                    unsigned __int8 v19 = [v57 isEqual:v60];
                                  }
                                  else {
                                    unsigned __int8 v19 = v57 == v60;
                                  }

                                  goto LABEL_67;
                                }
                              }

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer id](self, "id"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"id");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer titles](self, "titles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"titles");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer subtitles](self, "subtitles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"subtitles");

  id Description = ASCOfferFlagsGetDescription((__int16)-[ASCOfferAlertOffer flags](self, "flags"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(Description);
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, @"flags");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer ageRating](self, "ageRating"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, @"ageRating");

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer metrics](self, "metrics"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v10, @"metrics");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertTitle](self, "alertTitle"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, @"alertTitle");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertMessage](self, "alertMessage"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, @"alertMessage");

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer alertFooterMessage](self, "alertFooterMessage"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v13, @"alertFooterMessage");

  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCOfferAlertOffer isCancelable](self, "isCancelable"),  @"isCancelable");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer checkRestrictionsForContentRating](self, "checkRestrictionsForContentRating"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v14, @"checkRestrictionsForContentRating");

  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCOfferAlertOffer shouldCheckForAvailableDiskSpace](self, "shouldCheckForAvailableDiskSpace"),  @"shouldCheckForAvailableDiskSpace");
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer remoteControllerRequirement](self, "remoteControllerRequirement"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v15, @"remoteControllerRequirement");

  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCOfferAlertOffer shouldIncludeActiveAccountInFooterMessage](self, "shouldIncludeActiveAccountInFooterMessage"),  @"shouldIncludeActiveAccountInFooterMessage");
  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCOfferAlertOffer shouldPromptForConfirmation](self, "shouldPromptForConfirmation"),  @"shouldPromptForConfirmation");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCOfferAlertOffer completionOffer](self, "completionOffer"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v16, @"completionOffer");

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

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (NSString)alertFooterMessage
{
  return self->_alertFooterMessage;
}

- (BOOL)isCancelable
{
  return self->_isCancelable;
}

- (NSNumber)checkRestrictionsForContentRating
{
  return self->_checkRestrictionsForContentRating;
}

- (BOOL)shouldCheckForAvailableDiskSpace
{
  return self->_shouldCheckForAvailableDiskSpace;
}

- (NSString)remoteControllerRequirement
{
  return self->_remoteControllerRequirement;
}

- (BOOL)shouldIncludeActiveAccountInFooterMessage
{
  return self->_shouldIncludeActiveAccountInFooterMessage;
}

- (BOOL)shouldPromptForConfirmation
{
  return self->_shouldPromptForConfirmation;
}

- (ASCOffer)completionOffer
{
  return self->_completionOffer;
}

- (void).cxx_destruct
{
}

@end