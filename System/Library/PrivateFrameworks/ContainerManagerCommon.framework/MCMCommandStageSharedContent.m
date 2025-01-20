@interface MCMCommandStageSharedContent
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandStageSharedContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (NSString)destinationRelativePath;
- (NSString)identifier;
- (NSString)sourceRelativePath;
- (void)execute;
@end

@implementation MCMCommandStageSharedContent

- (MCMCommandStageSharedContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMCommandStageSharedContent;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v17, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    uint64_t v10 = [v8 identifier];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    uint64_t v12 = [v8 sourceRelativePath];
    sourceRelativePath = v9->_sourceRelativePath;
    v9->_sourceRelativePath = (NSString *)v12;

    uint64_t v14 = [v8 destinationRelativePath];
    destinationRelativePath = v9->_destinationRelativePath;
    v9->_destinationRelativePath = (NSString *)v14;
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToStageSharedContent];

  return v4;
}

- (void)execute
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895CE3A8](self, a2);
  v3 = -[MCMCommand context](self, "context");
  [v3 userIdentityCache];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 defaultUserIdentity];

  uint64_t v90 = 1LL;
  v6 = -[MCMCommand context](self, "context");
  [v6 globalConfiguration];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 staticConfig];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 configForContainerClass:13];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMCommandStageSharedContent identifier](self, "identifier");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MCMCommand context](self, "context");
  [v11 userIdentityCache];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)v5;
  v13 = +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v5,  v10,  v9,  0LL,  v12,  &v90);
  if (!v13)
  {
    objc_super v17 = objc_alloc(&OBJC_CLASS___MCMError);
    uint64_t v18 = -[MCMError initWithErrorType:](v17, "initWithErrorType:", v90);
LABEL_12:
    id v22 = 0LL;
    v23 = 0LL;
    v84 = 0LL;
LABEL_13:
    v24 = 0LL;
    v25 = 0LL;
    v83 = 0LL;
LABEL_14:
    id v26 = 0LL;
    goto LABEL_15;
  }

  id v14 = containermanager_copy_global_configuration();
  int v15 = [v14 systemContainerMode];

  if (!v15)
  {
    uint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 72LL);
    container_log_handle_for_category();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_188846000, v19, OS_LOG_TYPE_ERROR, "System containers are not supported", buf, 2u);
    }

    goto LABEL_11;
  }
  v16 = -[MCMCommandStageSharedContent sourceRelativePath](self, "sourceRelativePath");
  if ([v16 containsDotDotPathComponents])
  {

    goto LABEL_9;
  }
  v20 = -[MCMCommandStageSharedContent destinationRelativePath](self, "destinationRelativePath");
  int v21 = [v20 containsDotDotPathComponents];

  if (v21)
  {
LABEL_9:
    uint64_t v18 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 38LL);
    container_log_handle_for_category();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v64 = -[MCMCommandStageSharedContent sourceRelativePath](self, "sourceRelativePath");
      v65 = -[MCMCommandStageSharedContent destinationRelativePath](self, "destinationRelativePath");
      *(_DWORD *)buf = 138412546;
      id v92 = v64;
      __int16 v93 = 2112;
      uint64_t v94 = (uint64_t)v65;
      _os_log_error_impl( &dword_188846000,  v19,  OS_LOG_TYPE_ERROR,  "Paths can't contain dots. source: %@, dest: %@",  buf,  0x16u);
    }

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (NSString)destinationRelativePath
{
  return self->_destinationRelativePath;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 26LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

  ;
}

@end