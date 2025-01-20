@interface NRApplicationServiceClient
- (NSString)description;
- (void)dealloc;
- (void)didCompleteIncomingResolveRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStartBrowseRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStartResolveRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStopBrowseRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStopResolveRequestForASName:(id)a3 asClient:(id)a4;
@end

@implementation NRApplicationServiceClient

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  if (self)
  {
    if (self->_started)
    {
      v4 = "started";
    }

    else if (self->_cancelled)
    {
      v4 = "cancelled";
    }

    else
    {
      v4 = "";
    }

    v5 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"NRASClient[%llu %s ", self->_identifier, v4);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"browsing: %@ ", self->_asNamesForBrowsing);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"resolving: %@ ", self->_asNamesForResolving);
    asNamesForIncomingResolveRequests = self->_asNamesForIncomingResolveRequests;
  }

  else
  {
    v5 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"NRASClient[%llu %s ", 0LL, "");
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"browsing: %@ ", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"resolving: %@ ", 0LL);
    asNamesForIncomingResolveRequests = 0LL;
  }

  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"incoming-requests: %@ ",  asNamesForIncomingResolveRequests);
  -[NSMutableString appendString:](v5, "appendString:", @"]");
  return (NSString *)v5;
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (NRApplicationServiceClient *)self->_nrUUID;
  }
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  int IsLevelEnabled = _NRLogIsLevelEnabled(v3, 1LL);

  if (IsLevelEnabled)
  {
    if (v2) {
      nrUUID = v2->_nrUUID;
    }
    else {
      nrUUID = 0LL;
    }
    v7 = nrUUID;
    v9 = (void *)_NRCopyLogObjectForNRUUID(v7, v8);
    _NRLogWithArgs(v9, 1LL, "%s%.30s:%-4d %@ dealloc", ", "-[NRApplicationServiceClient dealloc]"", 807LL, v2);
  }

  sub_1000F6C6C((uint64_t)v2, v5);
  v10.receiver = v2;
  v10.super_class = (Class)&OBJC_CLASS___NRApplicationServiceClient;
  -[NRApplicationServiceClient dealloc](&v10, "dealloc");
}

- (void)didStartBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  id v16 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  v7 = v6;
  if (v6 != self) {
    goto LABEL_13;
  }
  if (v6)
  {
    if (v6->_cancelled) {
      goto LABEL_13;
    }
    if (-[NSMutableArray containsObject:](v6->_asNamesForBrowsing, "containsObject:", v16))
    {
      nrUUID = v7->_nrUUID;
      goto LABEL_6;
    }

    -[NSMutableArray addObject:](v7->_asNamesForBrowsing, "addObject:", v16);
    id WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
LABEL_11:
    [WeakRetained didStartBrowseRequestForASName:v16 asClient:v7];
LABEL_12:

    goto LABEL_13;
  }

  unsigned __int8 v15 = [0 containsObject:v16];
  nrUUID = 0LL;
  if ((v15 & 1) == 0)
  {
    [0 addObject:v16];
    id WeakRetained = 0LL;
    goto LABEL_11;
  }

- (void)didStopBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  id v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (!v6)
    {
      [0 removeObject:v9];
      id WeakRetained = 0LL;
      goto LABEL_6;
    }

    if (!v6->_cancelled
      && -[NSMutableArray containsObject:](v6->_asNamesForBrowsing, "containsObject:", v9))
    {
      [p_isa[2] removeObject:v9];
      id WeakRetained = objc_loadWeakRetained(p_isa + 6);
LABEL_6:
      [WeakRetained didStopBrowseRequestForASName:v9 asClient:p_isa];
    }
  }

- (void)didStartResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (!v6)
    {
      id WeakRetained = 0LL;
      if (([0 containsObject:v9] & 1) == 0)
      {
        [0 addObject:v9];
        id WeakRetained = 0LL;
      }

      goto LABEL_7;
    }

    if (!v6->_cancelled)
    {
      id WeakRetained = objc_loadWeakRetained(p_isa + 6);
LABEL_7:
      [WeakRetained didStartResolveRequestForASName:v9 asClient:p_isa];
    }
  }
}

- (void)didStopResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (!v6)
    {
      [0 removeObject:v9];
      id WeakRetained = 0LL;
      goto LABEL_6;
    }

    if (!v6->_cancelled
      && -[NSMutableArray containsObject:](v6->_asNamesForResolving, "containsObject:", v9))
    {
      [p_isa[3] removeObject:v9];
      id WeakRetained = objc_loadWeakRetained(p_isa + 6);
LABEL_6:
      [WeakRetained didStopResolveRequestForASName:v9 asClient:p_isa];
    }
  }

- (void)didCompleteIncomingResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v9 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  p_isa = (id *)&v6->super.isa;
  if (v6 == self)
  {
    if (!v6)
    {
      id WeakRetained = 0LL;
      goto LABEL_6;
    }

    if (!v6->_cancelled
      && -[NSMutableArray containsObject:](v6->_asNamesForIncomingResolveRequests, "containsObject:", v9))
    {
      id WeakRetained = objc_loadWeakRetained(p_isa + 6);
LABEL_6:
      [WeakRetained didCompleteIncomingResolveRequestForASName:v9 asClient:p_isa];
    }
  }

- (void).cxx_destruct
{
}

@end