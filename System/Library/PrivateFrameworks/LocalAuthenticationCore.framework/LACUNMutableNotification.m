@interface LACUNMutableNotification
- (BOOL)isBodyLocalized;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTimeSensitive;
- (BOOL)isTitleLocalized;
- (BOOL)shouldDisplayActionsInline;
- (NSString)body;
- (NSString)categoryIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)systemIconName;
- (NSString)title;
- (NSURL)defaultActionURL;
- (double)triggerInterval;
- (double)withdrawInterval;
- (void)setBody:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setDefaultActionURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsBodyLocalized:(BOOL)a3;
- (void)setIsTimeSensitive:(BOOL)a3;
- (void)setIsTitleLocalized:(BOOL)a3;
- (void)setShouldDisplayActionsInline:(BOOL)a3;
- (void)setSystemIconName:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTriggerInterval:(double)a3;
- (void)setWithdrawInterval:(double)a3;
@end

@implementation LACUNMutableNotification

- (NSString)description
{
  v36[12] = *MEMORY[0x1895F89C0];
  v31 = (void *)NSString;
  uint64_t v30 = objc_opt_class();
  v35[0] = @"identifier";
  uint64_t v3 = -[LACUNMutableNotification identifier](self, "identifier");
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x189603FE8] null];
  }

  v34 = v4;
  v27 = (void *)v3;
  v36[0] = v3;
  v35[1] = @"categoryIdentifier";
  uint64_t v5 = -[LACUNMutableNotification categoryIdentifier](self, "categoryIdentifier");
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x189603FE8] null];
  }

  v26 = (void *)v5;
  v36[1] = v5;
  v35[2] = @"shouldDisplayActionsInline";
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACUNMutableNotification shouldDisplayActionsInline](self, "shouldDisplayActionsInline"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v32;
  v35[3] = @"title";
  uint64_t v7 = -[LACUNMutableNotification title](self, "title");
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x189603FE8] null];
  }

  v25 = (void *)v7;
  v36[3] = v7;
  v35[4] = @"isTitleLocalized";
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACUNMutableNotification isTitleLocalized](self, "isTitleLocalized"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v29;
  v35[5] = @"body";
  uint64_t v9 = -[LACUNMutableNotification body](self, "body");
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x189603FE8] null];
  }

  v33 = v6;
  v24 = (void *)v9;
  v36[5] = v9;
  v35[6] = @"isBodyLocalized";
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACUNMutableNotification isBodyLocalized](self, "isBodyLocalized"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v28;
  v35[7] = @"systemIconName";
  uint64_t v11 = -[LACUNMutableNotification systemIconName](self, "systemIconName");
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x189603FE8] null];
  }

  v23 = (void *)v11;
  v36[7] = v11;
  v35[8] = @"defaultActionURL";
  v13 = -[LACUNMutableNotification defaultActionURL](self, "defaultActionURL");
  v14 = v13;
  if (!v13)
  {
    [MEMORY[0x189603FE8] null];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v36[8] = v14;
  v35[9] = @"isTimeSensitive";
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACUNMutableNotification isTimeSensitive](self, "isTimeSensitive"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v15;
  v35[10] = @"withdrawInterval";
  v16 = (void *)MEMORY[0x189607968];
  -[LACUNMutableNotification withdrawInterval](self, "withdrawInterval");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v17;
  v35[11] = @"triggerInterval";
  v18 = (void *)MEMORY[0x189607968];
  -[LACUNMutableNotification triggerInterval](self, "triggerInterval");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[11] = v19;
  [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:12];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 stringWithFormat:@"<%@ %p; %@>", v30, self, v20];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13) {
  if (!v12)
  }

  if (!v10) {
  if (!v8)
  }

  if (!v33) {
  if (!v34)
  }

  return (NSString *)v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_18C797AF8])
  {
    id v5 = v4;
    v6 = -[LACUNMutableNotification identifier](self, "identifier");
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }

    else
    {
      v8 = (void *)v7;
      -[LACUNMutableNotification identifier](self, "identifier");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 identifier];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_32;
      }
    }
    v13 = -[LACUNMutableNotification categoryIdentifier](self, "categoryIdentifier");
    uint64_t v14 = [v5 categoryIdentifier];
    if (v13 == (void *)v14)
    {
    }

    else
    {
      v15 = (void *)v14;
      v16 = -[LACUNMutableNotification categoryIdentifier](self, "categoryIdentifier");
      [v5 categoryIdentifier];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = [v16 isEqualToString:v17];

      if (!v18) {
        goto LABEL_32;
      }
    }

    int v19 = -[LACUNMutableNotification shouldDisplayActionsInline](self, "shouldDisplayActionsInline");
    if (v19 == [v5 shouldDisplayActionsInline])
    {
      v20 = -[LACUNMutableNotification title](self, "title");
      uint64_t v21 = [v5 title];
      if (v20 == (void *)v21)
      {
      }

      else
      {
        v22 = (void *)v21;
        v23 = -[LACUNMutableNotification title](self, "title");
        [v5 title];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        int v25 = [v23 isEqualToString:v24];

        if (!v25) {
          goto LABEL_32;
        }
      }
      v26 = -[LACUNMutableNotification body](self, "body");
      uint64_t v27 = [v5 body];
      if (v26 == (void *)v27)
      {
      }

      else
      {
        v28 = (void *)v27;
        v29 = -[LACUNMutableNotification body](self, "body");
        [v5 body];
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        int v31 = [v29 isEqualToString:v30];

        if (!v31) {
          goto LABEL_32;
        }
      }
      v32 = -[LACUNMutableNotification systemIconName](self, "systemIconName");
      uint64_t v33 = [v5 systemIconName];
      if (v32 == (void *)v33)
      {
      }

      else
      {
        v34 = (void *)v33;
        v35 = -[LACUNMutableNotification systemIconName](self, "systemIconName");
        [v5 systemIconName];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        int v37 = [v35 isEqualToString:v36];

        if (!v37) {
          goto LABEL_32;
        }
      }
      v38 = -[LACUNMutableNotification defaultActionURL](self, "defaultActionURL");
      uint64_t v39 = [v5 defaultActionURL];
      if (v38 == (void *)v39)
      {
      }

      else
      {
        v40 = (void *)v39;
        v41 = -[LACUNMutableNotification defaultActionURL](self, "defaultActionURL");
        [v5 defaultActionURL];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        int v43 = [v41 isEqual:v42];

        if (!v43) {
          goto LABEL_32;
        }
      }

      int v44 = -[LACUNMutableNotification isTitleLocalized](self, "isTitleLocalized");
      if (v44 == [v5 isTitleLocalized])
      {
        int v45 = -[LACUNMutableNotification isBodyLocalized](self, "isBodyLocalized");
        if (v45 == [v5 isBodyLocalized])
        {
          int v46 = -[LACUNMutableNotification isTimeSensitive](self, "isTimeSensitive");
          if (v46 == [v5 isTimeSensitive])
          {
            -[LACUNMutableNotification withdrawInterval](self, "withdrawInterval");
            double v48 = v47;
            [v5 withdrawInterval];
            if (v48 == v49)
            {
              -[LACUNMutableNotification triggerInterval](self, "triggerInterval");
              double v52 = v51;
              [v5 triggerInterval];
              BOOL v12 = v52 == v53;
              goto LABEL_33;
            }
          }
        }
      }
    }

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (BOOL)shouldDisplayActionsInline
{
  return self->_shouldDisplayActionsInline;
}

- (void)setShouldDisplayActionsInline:(BOOL)a3
{
  self->_shouldDisplayActionsInline = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isTitleLocalized
{
  return self->_isTitleLocalized;
}

- (void)setIsTitleLocalized:(BOOL)a3
{
  self->_isTitleLocalized = a3;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (BOOL)isBodyLocalized
{
  return self->_isBodyLocalized;
}

- (void)setIsBodyLocalized:(BOOL)a3
{
  self->_isBodyLocalized = a3;
}

- (NSString)systemIconName
{
  return self->_systemIconName;
}

- (void)setSystemIconName:(id)a3
{
}

- (NSURL)defaultActionURL
{
  return self->_defaultActionURL;
}

- (void)setDefaultActionURL:(id)a3
{
}

- (BOOL)isTimeSensitive
{
  return self->_isTimeSensitive;
}

- (void)setIsTimeSensitive:(BOOL)a3
{
  self->_isTimeSensitive = a3;
}

- (double)withdrawInterval
{
  return self->_withdrawInterval;
}

- (void)setWithdrawInterval:(double)a3
{
  self->_withdrawInterval = a3;
}

- (double)triggerInterval
{
  return self->_triggerInterval;
}

- (void)setTriggerInterval:(double)a3
{
  self->_triggerInterval = a3;
}

- (void).cxx_destruct
{
}

@end