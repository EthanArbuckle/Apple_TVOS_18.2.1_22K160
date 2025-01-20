@interface TVHPlayer
- (id)playbackErrorFromError:(id)a3 forMediaItem:(id)a4;
@end

@implementation TVHPlayer

- (id)playbackErrorFromError:(id)a3 forMediaItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
  if (![v8 isEqualToString:NSURLErrorDomain])
  {

    goto LABEL_7;
  }

  if ([v6 code] != (id)-1008)
  {
    id v9 = [v6 code];

    if (v9 == (id)-1100LL) {
      goto LABEL_6;
    }
LABEL_7:
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___TVHPlayer;
    id v14 = -[TVHPlayer playbackErrorFromError:forMediaItem:](&v16, "playbackErrorFromError:forMediaItem:", v6, v7);
    v13 = (NSError *)objc_claimAutoreleasedReturnValue(v14);
    goto LABEL_8;
  }

LABEL_6:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"URL_NOT_FOUND_ERROR" value:0 table:0]);

  v17[0] = NSLocalizedDescriptionKey;
  v17[1] = NSUnderlyingErrorKey;
  v18[0] = v11;
  v18[1] = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  v13 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"TVPlaybackErrorDomain",  836LL,  v12);

LABEL_8:
  return v13;
}

@end