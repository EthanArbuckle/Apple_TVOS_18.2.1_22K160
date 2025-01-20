@interface RPNWUtils
+ (id)getBundleIDForPID:(int)a3;
@end

@implementation RPNWUtils

+ (id)getBundleIDForPID:(int)a3
{
  if (!a3)
  {
    if (dword_100130F18 <= 30
      && (dword_100130F18 != -1 || _LogCategory_Initialize(&dword_100130F18, 30LL)))
    {
      LogPrintF(&dword_100130F18, "+[RPNWUtils getBundleIDForPID:]", 30LL, "Invalid PID provided (%d)");
    }

    goto LABEL_17;
  }

  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = 0LL;
  memset(buffer, 0, sizeof(buffer));
  if (proc_pidinfo(a3, 17, 1uLL, buffer, 56) == 56 && !uuid_is_null((const unsigned __int8 *)buffer))
  {
    v4 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", buffer);
    if (dword_100130F18 <= 30
      && (dword_100130F18 != -1 || _LogCategory_Initialize(&dword_100130F18, 30LL)))
    {
      LogPrintF(&dword_100130F18, "+[RPNWUtils getBundleIDForPID:]", 30LL, "Looked up PID (%d) -> UUID (%@)", v3, v4);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));
    id v8 = -[objc_class defaultWorkspace](off_100130F88(), "defaultWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v17 = 0LL;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifiersForMachOUUIDs:v7 error:&v17]);
    id v11 = v17;

    if (v11)
    {
      if (dword_100130F18 <= 30
        && (dword_100130F18 != -1 || _LogCategory_Initialize(&dword_100130F18, 30LL)))
      {
        LogPrintF( &dword_100130F18,  "+[RPNWUtils getBundleIDForPID:]",  30LL,  "bundleIdentifiersForMachOUUIDs failed for %@ [%@]",  v4,  v11);
      }
    }

    else
    {
      if ([v10 count])
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v4]);
        id v13 = [v12 count];

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v4]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allObjects]);
          v5 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:0]);

          if (dword_100130F18 <= 30
            && (dword_100130F18 != -1 || _LogCategory_Initialize(&dword_100130F18, 30LL)))
          {
            LogPrintF( &dword_100130F18,  "+[RPNWUtils getBundleIDForPID:]",  30LL,  "Looked up UUID (%@) -> bundleID (%@)",  v4,  v5);
          }

          goto LABEL_37;
        }
      }

      if (dword_100130F18 <= 30
        && (dword_100130F18 != -1 || _LogCategory_Initialize(&dword_100130F18, 30LL)))
      {
        LogPrintF(&dword_100130F18, "+[RPNWUtils getBundleIDForPID:]", 30LL, "No bundleID found for UUID %@", v4, v16);
      }
    }

    v5 = 0LL;
LABEL_37:

    return v5;
  }

@end