@interface SAEmailSend
- (id)_ad_transformedMailSuccessResponse;
- (id)_ad_transformedSendEmailRequest;
- (id)_personsForRecipients:(id)a3;
@end

@implementation SAEmailSend

- (id)_ad_transformedSendEmailRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAEmailSend email](self, "email"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
  unsigned __int8 v5 = [v4 isEqualToString:SAEmailTypeNewValue];

  if ((v5 & 1) != 0)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
    unsigned __int8 v8 = [v7 isEqualToString:SAEmailTypeReplyValue];

    if ((v8 & 1) != 0)
    {
      uint64_t v6 = 1LL;
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
      unsigned __int8 v10 = [v9 isEqualToString:SAEmailTypeReplyAllValue];

      if ((v10 & 1) != 0)
      {
        uint64_t v6 = 2LL;
      }

      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
        unsigned int v12 = [v11 isEqualToString:SAEmailTypeForwardValue];

        if (v12) {
          uint64_t v6 = 3LL;
        }
        else {
          uint64_t v6 = 0LL;
        }
      }
    }
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___STEmailMessage);
  [v13 setType:v6];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 recipientsTo]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SAEmailSend _personsForRecipients:](self, "_personsForRecipients:", v14));
  [v13 setToRecipients:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 recipientsCc]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SAEmailSend _personsForRecipients:](self, "_personsForRecipients:", v16));
  [v13 setCcRecipients:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 recipientsBcc]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SAEmailSend _personsForRecipients:](self, "_personsForRecipients:", v18));
  [v13 setBccRecipients:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 receivingAddresses]);
  [v13 setReceivingAddresses:v20];

  uint64_t v21 = objc_claimAutoreleasedReturnValue([v3 fromEmail]);
  v22 = (void *)v21;
  if (v21)
  {
    uint64_t v31 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SAEmailSend _personsForRecipients:](self, "_personsForRecipients:", v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 firstObject]);
    [v13 setSender:v25];
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v3 subject]);
  [v13 setSubject:v26];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v3 message]);
  [v13 setMessageBody:v27];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  [v13 setMessageIdentifier:v28];

  id v29 = [[STSendEmailRequest alloc] _initWithMessage:v13];
  return v29;
}

- (id)_ad_transformedMailSuccessResponse
{
  return objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
}

- (id)_personsForRecipients:(id)a3
{
  id v3 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v7);
        id v9 = objc_alloc_init(&OBJC_CLASS___STPersonContactHandle);
        [v9 setType:0];
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 data]);
        [v9 setHandle:v10];

        id v11 = objc_alloc_init(&OBJC_CLASS___STPerson);
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v9));
        [v11 setContactHandles:v12];

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 displayText]);
        [v11 setFullName:v13];

        if (v11) {
          [v16 addObject:v11];
        }

        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }

  return v16;
}

@end