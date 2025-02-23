@interface SRPlayContentViewController
- (SRPlayContentViewController)initWithPlayContent:(id)a3;
@end

@implementation SRPlayContentViewController

- (SRPlayContentViewController)initWithPlayContent:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SRPlayContentViewController;
  v6 = -[SRPlayContentViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6)
  {
    p_playContent = (id *)&v6->_playContent;
    objc_storeStrong((id *)&v6->_playContent, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *p_playContent,  "_sr_playerForHighResolutionPlayback:",  -[SRPlayContentViewController shouldPlayHighResolutionContent]( v7,  "shouldPlayHighResolutionContent")));
    v10 = (void *)AFSiriLogContextConnection;
    if (v9)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = *p_playContent;
        v12 = v10;
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 dictionary]);
        *(_DWORD *)buf = 136315650;
        v17 = "-[SRPlayContentViewController initWithPlayContent:]";
        __int16 v18 = 2112;
        v19 = v9;
        __int16 v20 = 2112;
        v21 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Received player from SAVCSPlayContent; beginning playback\n    Player: %@\n    Play content command: %@",
          buf,
          0x20u);
      }

      -[SRPlayContentViewController setPlayer:](v7, "setPlayer:", v9);
    }

    else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      sub_10006C6A0((void **)&v7->_playContent, v10);
    }
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end