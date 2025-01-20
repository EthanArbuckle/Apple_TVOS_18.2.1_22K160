@interface BMXPCSyncChangeReporter
- (BMXPCSyncChangeReporter)init;
- (BMXPCSyncChangeReporter)initWithAccount:(id)a3;
- (BOOL)streamUpdatedForStreamName:(id)a3 deviceIdentifier:(id)a4 error:(id *)a5;
- (BOOL)userDeletesForStreamName:(id)a3 deviceIdentifier:(id)a4 error:(id *)a5;
- (id)streamRemoteIdentifierForStreamName:(id)a3 deviceIdentifier:(id)a4;
@end

@implementation BMXPCSyncChangeReporter

- (BMXPCSyncChangeReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BMXPCSyncChangeReporter;
  v2 = -[BMXPCSyncChangeReporter init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___GDXPCCoordinationService);
    coordinationService = v2->_coordinationService;
    v2->_coordinationService = v3;
  }

  return v2;
}

- (BMXPCSyncChangeReporter)initWithAccount:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BMXPCSyncChangeReporter;
  v5 = -[BMXPCSyncChangeReporter init](&v9, "init");
  if (v5)
  {
    objc_super v6 = -[GDXPCCoordinationService initWithAccount:]( objc_alloc(&OBJC_CLASS___GDXPCCoordinationService),  "initWithAccount:",  v4);
    coordinationService = v5->_coordinationService;
    v5->_coordinationService = v6;
  }

  return v5;
}

- (id)streamRemoteIdentifierForStreamName:(id)a3 deviceIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:remotes:%@",  v6,  v5);

  return v7;
}

- (BOOL)streamUpdatedForStreamName:(id)a3 deviceIdentifier:(id)a4 error:(id *)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[BMXPCSyncChangeReporter streamRemoteIdentifierForStreamName:deviceIdentifier:]( self,  "streamRemoteIdentifierForStreamName:deviceIdentifier:",  a3,  a4));
  coordinationService = self->_coordinationService;
  id v15 = 0LL;
  unsigned __int8 v9 = -[GDXPCCoordinationService streamUpdatedWithStreamName:isDelete:error:]( coordinationService,  "streamUpdatedWithStreamName:isDelete:error:",  v7,  0LL,  &v15);
  id v10 = v15;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5) {
      *a5 = v10;
    }
    uint64_t v12 = __biome_log_for_category(11LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000402D8();
    }
  }

  return v9;
}

- (BOOL)userDeletesForStreamName:(id)a3 deviceIdentifier:(id)a4 error:(id *)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[BMXPCSyncChangeReporter streamRemoteIdentifierForStreamName:deviceIdentifier:]( self,  "streamRemoteIdentifierForStreamName:deviceIdentifier:",  a3,  a4));
  coordinationService = self->_coordinationService;
  id v15 = 0LL;
  unsigned __int8 v9 = -[GDXPCCoordinationService streamUpdatedWithStreamName:isDelete:error:]( coordinationService,  "streamUpdatedWithStreamName:isDelete:error:",  v7,  1LL,  &v15);
  id v10 = v15;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5) {
      *a5 = v10;
    }
    uint64_t v12 = __biome_log_for_category(11LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10004033C();
    }
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end