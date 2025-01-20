@interface IMDChatUtilities
+ (IMDChatUtilities)sharedUtilities;
+ (id)_stringForChatIDs:(id)a3 onServices:(id)a4;
- (NSMutableSet)currentlyDownloadingSet;
- (void)setCurrentlyDownloadingSet:(id)a3;
@end

@implementation IMDChatUtilities

+ (IMDChatUtilities)sharedUtilities
{
  if (qword_100071058 != -1) {
    dispatch_once(&qword_100071058, &stru_1000655F8);
  }
  return (IMDChatUtilities *)(id)qword_100071060;
}

+ (id)_stringForChatIDs:(id)a3 onServices:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    id v7 = [&stru_100066EE8 mutableCopy];
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 appendFormat:@"%@:\n", *(void *)(*((void *)&v24 + 1) + 8 * (void)v12)];
          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v10);
    }

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          [v7 appendFormat:@"%@\n", *(void *)(*((void *)&v20 + 1) + 8 * (void)v17)];
          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }

      while (v15);
    }

    id v18 = [v7 copy];
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

- (NSMutableSet)currentlyDownloadingSet
{
  return self->_currentlyDownloadingSet;
}

- (void)setCurrentlyDownloadingSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end