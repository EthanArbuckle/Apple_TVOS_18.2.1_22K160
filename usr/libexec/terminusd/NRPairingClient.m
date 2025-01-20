@interface NRPairingClient
- (BOOL)sendPacketData:(id)a3;
- (NSString)description;
- (void)dealloc;
- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8;
@end

@implementation NRPairingClient

- (void)dealloc
{
  if (qword_1001DC630 != -1) {
    dispatch_once(&qword_1001DC630, &stru_1001ADE00);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC628, 0LL))
  {
    if (qword_1001DC630 != -1) {
      dispatch_once(&qword_1001DC630, &stru_1001ADE00);
    }
    _NRLogWithArgs(qword_1001DC628, 0LL, "%s%.30s:%-4d %@: Dealloc", ", "-[NRPairingClient dealloc]"", 137LL, self);
  }

  sub_100005DB0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRPairingClient;
  -[NRPairingClient dealloc](&v3, "dealloc");
}

- (NSString)description
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = v3;
  else {
    v5 = *(&off_1001ADE60 + (self->_state - 1));
  }
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"NRPairingClient[%llu, %@, %@]",  self->_identifier,  v5,  self->_nrUUID);
  return (NSString *)v4;
}

- (BOOL)sendPacketData:(id)a3
{
  return 1;
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (qword_1001DC630 != -1) {
    dispatch_once(&qword_1001DC630, &stru_1001ADE00);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC628, 0LL))
  {
    if (qword_1001DC630 != -1) {
      dispatch_once(&qword_1001DC630, &stru_1001ADE00);
    }
    _NRLogWithArgs( qword_1001DC628,  0LL,  "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@",  ",  "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  1591LL,  self,  v14,  v15,  v16,  v17);
  }

  if ((self->_state & 0xFE) != 6)
  {
    v160 = (void (**)(void, void, void, void))v19;
    v161 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
    id v21 = [v20 identifierType];

    if (v21 == (id)11)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteIdentifier]);
      id v23 = [v22 identifierType];

      if (v23 == (id)11)
      {
        v158 = self;
        v155 = sub_100129B30((uint64_t)&OBJC_CLASS___NRDLocalDevice, self->_nrUUID);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteIdentifier]);
        unsigned __int8 v26 = [v24 isEqual:v25];

        v157 = v18;
        char v154 = v26;
        id v156 = v14;
        if ((v26 & 1) != 0) {
          goto LABEL_29;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
        if (qword_1001DCA68 != -1) {
          dispatch_once(&qword_1001DCA68, &stru_1001AFD30);
        }
        v28 = v158;
        id v29 = (id)qword_1001DCA60;
        if (([v27 isEqual:v29] & 1) == 0)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
          if (qword_1001DCA78 != -1) {
            dispatch_once(&qword_1001DCA78, &stru_1001AFD50);
          }
          id v31 = (id)qword_1001DCA70;
          if (([v30 isEqual:v31] & 1) == 0)
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
            v150 = v30;
            id v85 = sub_10010B930();
            unsigned __int8 v152 = [v84 isEqual:v85];

            v28 = v158;
            if ((v152 & 1) == 0)
            {
              id v15 = v161;
              if (qword_1001DC630 != -1) {
                dispatch_once(&qword_1001DC630, &stru_1001ADE00);
              }
              v45 = v155;
              id v14 = v156;
              id v18 = v157;
              id v19 = v160;
              if (_NRLogIsLevelEnabled(qword_1001DC628, 16LL))
              {
                id v86 = sub_100003B10();
                v87 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
                v88 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteIdentifier]);
                _NRLogWithArgs( v86,  16LL,  "%s%.30s:%-4d %@: Local identifier %@ does not match remote identifier %@",  ",  "-[NRPairingClient requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]"",  1616LL,  v158,  v87,  v88);

                id v15 = v161;
                id v18 = v157;

                id v19 = v160;
              }

              goto LABEL_131;
            }

- (void).cxx_destruct
{
}

@end