@interface IDSAPNSAckTracker
- (IDSAPNSAckTrackerDelegate)delegate;
- (void)addBlockToAggregatableMessage:(id)a3 forURIs:(id)a4 trackingSet:(id)a5 guid:(id)a6;
- (void)addBlockToAggregateMessage:(id)a3 guid:(id)a4;
- (void)addBlockToMMLMessage:(id)a3 guid:(id)a4;
- (void)setDelegate:(id)a3;
- (void)trackMMLMessages:(id)a3 forURIs:(id)a4;
- (void)trackMessages:(id)a3 forURIs:(id)a4;
@end

@implementation IDSAPNSAckTracker

- (void)trackMMLMessages:(id)a3 forURIs:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = v6;
  id v24 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v40;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v7;
        v8 = *(void **)(*((void *)&v39 + 1) + 8 * v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
        -[IDSAPNSAckTracker addBlockToMMLMessage:guid:](self, "addBlockToMMLMessage:guid:", v8, v9);

        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        id v26 = (id)objc_claimAutoreleasedReturnValue([v8 aggregateMessages]);
        id v29 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v29)
        {
          uint64_t v28 = *(void *)v36;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v36 != v28) {
                objc_enumerationMutation(v26);
              }
              uint64_t v30 = v10;
              v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:v11]);
              v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
              v14 = (void *)objc_claimAutoreleasedReturnValue([v11 messageID]);
              -[IDSAPNSAckTracker addBlockToAggregateMessage:guid:](self, "addBlockToAggregateMessage:guid:", v11, v14);

              __int128 v33 = 0u;
              __int128 v34 = 0u;
              __int128 v31 = 0u;
              __int128 v32 = 0u;
              v15 = (void *)objc_claimAutoreleasedReturnValue([v11 individualPeerMessages]);
              id v16 = [v15 countByEnumeratingWithState:&v31 objects:v43 count:16];
              if (v16)
              {
                id v17 = v16;
                uint64_t v18 = *(void *)v32;
                do
                {
                  for (i = 0LL; i != v17; i = (char *)i + 1)
                  {
                    if (*(void *)v32 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
                    v21 = (void *)objc_claimAutoreleasedReturnValue([v11 messageID]);
                    -[IDSAPNSAckTracker addBlockToAggregatableMessage:forURIs:trackingSet:guid:]( self,  "addBlockToAggregatableMessage:forURIs:trackingSet:guid:",  v20,  v12,  v13,  v21);
                  }

                  id v17 = [v15 countByEnumeratingWithState:&v31 objects:v43 count:16];
                }

                while (v17);
              }

              uint64_t v10 = v30 + 1;
            }

            while ((id)(v30 + 1) != v29);
            id v29 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
          }

          while (v29);
        }

        uint64_t v7 = v25 + 1;
      }

      while ((id)(v25 + 1) != v24);
      id v24 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }

    while (v24);
  }
}

- (void)trackMessages:(id)a3 forURIs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v6;
  id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v9;
        uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 messageID]);
        -[IDSAPNSAckTracker addBlockToAggregateMessage:guid:](self, "addBlockToAggregateMessage:guid:", v10, v11);

        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 individualPeerMessages]);
        id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 messageID]);
              -[IDSAPNSAckTracker addBlockToAggregatableMessage:forURIs:trackingSet:guid:]( self,  "addBlockToAggregatableMessage:forURIs:trackingSet:guid:",  v17,  v7,  v8,  v18);
            }

            id v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }

          while (v14);
        }

        uint64_t v9 = v22 + 1;
      }

      while ((id)(v22 + 1) != v21);
      id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v21);
  }
}

- (void)addBlockToMMLMessage:(id)a3 guid:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001D11B4;
  v8[3] = &unk_1008FD6F8;
  id v9 = a4;
  id v5 = v9;
  id v6 = a3;
  id v7 = objc_retainBlock(v8);
  [v6 setDeliveryAcknowledgementBlock:v7];
}

- (void)addBlockToAggregateMessage:(id)a3 guid:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001D13F0;
  v8[3] = &unk_1008FD6F8;
  id v9 = a4;
  id v5 = v9;
  id v6 = a3;
  id v7 = objc_retainBlock(v8);
  [v6 setDeliveryAcknowledgementBlock:v7];
}

- (void)addBlockToAggregatableMessage:(id)a3 forURIs:(id)a4 trackingSet:(id)a5 guid:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  [v11 addObject:v14];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 targetPeerID]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 targetToken]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 URIByAddingPushToken:v16]);

  __int128 v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  __int128 v26 = sub_1001D1664;
  __int128 v27 = &unk_1008FD720;
  id v28 = v12;
  id v29 = v17;
  __int128 v30 = self;
  id v31 = v11;
  id v32 = v14;
  id v33 = v10;
  id v18 = v10;
  id v19 = v14;
  id v20 = v11;
  id v21 = v17;
  id v22 = v12;
  __int128 v23 = objc_retainBlock(&v24);
  objc_msgSend(v13, "setAckBlock:", v23, v24, v25, v26, v27);
}

- (IDSAPNSAckTrackerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end