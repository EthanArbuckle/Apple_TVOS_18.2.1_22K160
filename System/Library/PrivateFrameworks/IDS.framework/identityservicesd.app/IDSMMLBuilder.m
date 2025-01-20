@interface IDSMMLBuilder
+ (id)mmlsFromAggregates:(id)a3 service:(id)a4 sendMode:(id)a5 guid:(id)a6;
@end

@implementation IDSMMLBuilder

+ (id)mmlsFromAggregates:(id)a3 service:(id)a4 sendMode:(id)a5 guid:(id)a6
{
  id v9 = a3;
  id v29 = a4;
  id v28 = a5;
  id v10 = a6;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  id v13 = [v12 maxSize];

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v9;
  id v14 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = 0LL;
    uint64_t v17 = *(void *)v31;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)v18);
        if (-[NSMutableArray count](v11, "count")
          && (v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v11, "lastObject")),
              unsigned int v21 = [v20 hasSpaceForAggregateMessage:v19],
              v20,
              v21))
        {
          v22 = (IDSMMLMessage *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v11, "lastObject"));
          -[IDSMMLMessage addAggregateMessage:](v22, "addAggregateMessage:", v19);
        }

        else
        {
          ++v16;
          v22 = -[IDSMMLMessage initWithSendMode:topic:maxSize:]( objc_alloc(&OBJC_CLASS___IDSMMLMessage),  "initWithSendMode:topic:maxSize:",  v28,  v29,  v13);
          -[IDSMMLMessage addAggregateMessage:](v22, "addAggregateMessage:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
          -[IDSMMLMessage setChunkNumber:](v22, "setChunkNumber:", v23);

          -[IDSMMLMessage setIdentifier:](v22, "setIdentifier:", v10);
          -[NSMutableArray addObject:](v11, "addObject:", v22);
        }

        v18 = (char *)v18 + 1;
      }

      while (v15 != v18);
      id v15 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }

    while (v15);
  }

  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = -[NSMutableArray count](v11, "count");
    *(_DWORD *)buf = 138413058;
    id v35 = v10;
    __int16 v36 = 2048;
    id v37 = v25;
    __int16 v38 = 2112;
    id v39 = v29;
    __int16 v40 = 2112;
    id v41 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Finished creating MMLs { mmlGUID : %@ count : %ld service : %@ sendMode : %@ }",  buf,  0x2Au);
  }

  return v11;
}

@end