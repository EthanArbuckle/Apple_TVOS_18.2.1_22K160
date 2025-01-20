@interface MRGroupSessionInfo
- (id)initWithGroupSession:(id)a3;
@end

@implementation MRGroupSessionInfo

- (id)initWithGroupSession:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 leader]);
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 displayName]);
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 joinToken]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 hostInfo]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v11 displayName]);
    }

    id v12 = objc_alloc(&OBJC_CLASS___MRGroupSessionHostInfo);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 joinToken]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 hostInfo]);
    id v15 = objc_msgSend(v12, "initWithRouteType:displayName:", objc_msgSend(v14, "routeType"), v9);

    v16 = objc_alloc(&OBJC_CLASS___MRGroupSessionInfo);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    id v18 = [v5 isHosted];
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 joinToken]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 equivalentMediaIdentifier]);
    v10 = -[MRGroupSessionInfo initWithIdentifier:hostInfo:isHosted:equivalentMediaIdentifier:isPlaceholder:]( v16,  "initWithIdentifier:hostInfo:isHosted:equivalentMediaIdentifier:isPlaceholder:",  v17,  v15,  v18,  v20,  0LL);
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

@end