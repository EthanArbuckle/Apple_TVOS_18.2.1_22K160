@interface GTMTLReplayController
@end

@implementation GTMTLReplayController

id __GTMTLReplayController_defaultDispatchFunction_noPinning_block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) length];
}

id __GTMTLReplayController_generateWireframeTexture_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) device];
}

void __GTMTLReplayController_init_block_invoke( id a1,  unint64_t a2,  const char *a3,  unsigned int a4,  NSString *a5)
{
  if ((((unint64_t)qword_5B9DC8 >> a2) & 1) != 0)
  {
    uint64_t v5 = *(void *)&a4;
    v13[0] = @"GTErrorKeyFile";
    v7 = a5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
    v14[0] = v8;
    v13[1] = @"GTErrorKeyLine";
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
    v14[1] = v9;
    v14[2] = @"The replayer encountered a Metal validation layer error.";
    v13[2] = NSLocalizedDescriptionKey;
    v13[3] = NSLocalizedFailureReasonErrorKey;
    v14[3] = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  4LL));

    id NSError = MakeNSError(200, v10);
    id v12 = (id)objc_claimAutoreleasedReturnValue(NSError);

    GTMTLReplay_handleNSError(v12);
  }

@end