@interface MREffectPictureFrames
+ (BOOL)hasCustomTiming;
+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7;
+ (void)initialize;
- (BOOL)getVerticesCoordinates:(MREffectPictureFrames *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGRect)_frameRectFromInfo:(id)a3 onShelf:(BOOL)a4;
- (CGRect)_rectForFrameID:(id)a3 rect:(CGRect)a4 onTable:(BOOL)a5 aspectRatio:(double)a6 slideAspectRatio:(double)a7;
- (MREffectPictureFrames)initWithEffectID:(id)a3;
- (double)_aspectRatioForSlideIndex:(int64_t)a3;
- (double)_durationForEffect;
- (double)_durationForEffect:(BOOL)a3;
- (double)_nextSlideProviderAspectRatioToFitInAspectRatio:(id)a3 providerKeys:(id)a4 slideInformation:(id)a5 index:(int64_t *)a6 force:(BOOL)a7;
- (double)_startingOffset;
- (double)_startingWidth;
- (double)_xForSlideAtIndex:(int64_t)a3 layoutWidth:(double *)a4;
- (double)displayTimeForSlideAtIndex:(unint64_t)a3;
- (double)displayTimeForTextAtIndex:(unint64_t)a3;
- (double)lowestDisplayTime;
- (double)showDurationForSlideAtIndex:(unint64_t)a3;
- (double)showTimeForSlideAtIndex:(unint64_t)a3;
- (id)_drawFrame:(id)a3 provider:(id)a4 index:(int64_t)a5 rect:(CGRect)a6 time:(double)a7 onTable:(BOOL)a8 inContext:(id)a9 withArguments:(id)a10;
- (id)_populateFrames;
- (id)_randomFrameForAspectRatio:(id)a3 forTable:(BOOL)a4 allowMatte:(BOOL)a5 onlyLoaded:(BOOL)a6 ignoreFrames:(id)a7 randomGenerator:(id)a8;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (id)layoutsWithSlidesInfo:(id)a3 seed:(unint64_t)a4 hasShelf:(BOOL)a5;
- (void)_applyTimingToSlideProviders;
- (void)_cleanup;
- (void)_drawBreakFrame:(id)a3 provider:(id)a4 index:(int64_t)a5 rect:(CGRect)a6 time:(double)a7 inContext:(id)a8 withArguments:(id)a9;
- (void)_drawBreakFrameInRect:(CGRect)a3 frameWidth:(double)a4 time:(double)a5 inContext:(id)a6 withArguments:(id)a7;
- (void)_setSizeScripts:(double)a3;
- (void)_setupLayoutWithSlideInformation:(id)a3;
- (void)_unload;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectPictureFrames

+ (void)initialize
{
  v84.receiver = a1;
  v84.super_class = (Class)&OBJC_METACLASS___MREffectPictureFrames;
  objc_msgSendSuper2(&v84, "initialize");
  if (!qword_2B05F0)
  {
    v2 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "resourcePathForStyleID:",  @"PhotoWall"),  "stringByAppendingPathComponent:",  @"MREffectPhotoWall.plist"));
    if (v2) {
      id v3 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v2,  2LL,  0LL,  0LL);
    }
    else {
      id v3 = 0LL;
    }
    v66 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    id v68 = [v3 countByEnumeratingWithState:&v80 objects:v86 count:16];
    if (v68)
    {
      uint64_t v64 = *(void *)v81;
      v65 = v3;
      do
      {
        uint64_t v4 = 0LL;
        do
        {
          if (*(void *)v81 != v64) {
            objc_enumerationMutation(v3);
          }
          uint64_t v74 = v4;
          uint64_t v71 = *(void *)(*((void *)&v80 + 1) + 8 * v4);
          id v69 = [v3 objectForKey:v64];
          id v5 = [v69 objectForKey:@"frames"];
          v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          __int128 v79 = 0u;
          id v7 = [v5 countByEnumeratingWithState:&v76 objects:v85 count:16];
          if (v7)
          {
            id v8 = v7;
            uint64_t v9 = *(void *)v77;
            do
            {
              for (i = 0LL; i != v8; i = (char *)i + 1)
              {
                if (*(void *)v77 != v9) {
                  objc_enumerationMutation(v5);
                }
                v11 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
                v12 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameInfo);
                v13 = (NSString *)[v11 objectForKey:@"tableRect"];
                if (v13)
                {
                  v12->tableRect = CGRectFromString(v13);
                }

                else
                {
                  CGSize size = CGRectZero.size;
                  v12->tableRect.origin = CGRectZero.origin;
                  v12->tableRect.CGSize size = size;
                }

                v12->rect = CGRectFromString((NSString *)[v11 objectForKey:@"rect"]);
                -[MRPictureFrameInfo setAspectRatio:]( v12,  "setAspectRatio:",  [v11 objectForKey:@"aspectRatio"]);
                v12->onTable = objc_msgSend( objc_msgSend(v11, "objectForKey:", @"onTable"),  "BOOLValue");
                v12->ignoreMatte = objc_msgSend( objc_msgSend(v11, "objectForKey:", @"ignoreMatte"),  "BOOLValue");
                v12->useLastFrame = objc_msgSend( objc_msgSend(v11, "objectForKey:", @"useLastFrame"),  "BOOLValue");
                -[NSMutableArray addObject:](v6, "addObject:", v12);
              }

              id v8 = [v5 countByEnumeratingWithState:&v76 objects:v85 count:16];
            }

            while (v8);
          }

          [v69 setObject:v6 forKey:@"frames"];

          -[NSMutableDictionary setObject:forKey:](v66, "setObject:forKey:", v69, v71);
          uint64_t v4 = v74 + 1;
          id v3 = v65;
        }

        while ((id)(v74 + 1) != v68);
        id v68 = [v65 countByEnumeratingWithState:&v80 objects:v86 count:16];
      }

      while (v68);
    }

    qword_2B05F0 = (uint64_t)v66;
  }

  if (!qword_2B05F8)
  {
    qword_2B05F8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v15 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v15->outer.origin = (CGPoint)xmmword_1F8EE0;
    v15->outer.CGSize size = (CGSize)xmmword_1F8EF0;
    v15->inner.origin = (CGPoint)xmmword_1F8F00;
    v15->inner.CGSize size = (CGSize)xmmword_1F8F10;
    v15->CGSize size = (CGSize)xmmword_1F8F20;
    [(id)qword_2B05F8 setObject:v15 forKey:@"1"];

    v16 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v16->outer.origin = (CGPoint)xmmword_1F8F30;
    v16->outer.CGSize size = (CGSize)xmmword_1F8F40;
    v16->inner.origin = (CGPoint)xmmword_1F8F50;
    v16->inner.CGSize size = (CGSize)xmmword_1F8F60;
    v16->CGSize size = (CGSize)xmmword_1F8F70;
    [(id)qword_2B05F8 setObject:v16 forKey:@"1PL"];

    v17 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v17->outer.origin = (CGPoint)xmmword_1F8F80;
    v17->outer.CGSize size = (CGSize)xmmword_1F8F90;
    v17->inner.origin = (CGPoint)xmmword_1F8FA0;
    v17->inner.CGSize size = (CGSize)xmmword_1F8FB0;
    v17->CGSize size = (CGSize)xmmword_1F8FC0;
    [(id)qword_2B05F8 setObject:v17 forKey:@"2LS"];

    v18 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v18->outer.origin = (CGPoint)xmmword_1F8FD0;
    v18->outer.CGSize size = (CGSize)xmmword_1F8FE0;
    v18->inner.origin = (CGPoint)xmmword_1F8FF0;
    v18->inner.CGSize size = (CGSize)xmmword_1F9000;
    v18->CGSize size = (CGSize)xmmword_1F9010;
    [(id)qword_2B05F8 setObject:v18 forKey:@"2PS"];

    v19 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v19->outer.origin = (CGPoint)xmmword_1F9020;
    v19->outer.CGSize size = (CGSize)xmmword_1F9030;
    v19->inner.origin = (CGPoint)xmmword_1F9040;
    v19->inner.CGSize size = (CGSize)xmmword_1F9050;
    v19->CGSize size = (CGSize)xmmword_1F9060;
    [(id)qword_2B05F8 setObject:v19 forKey:@"3-Matte"];

    v20 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v20->outer.origin = (CGPoint)xmmword_1F9070;
    v20->outer.CGSize size = (CGSize)xmmword_1F9080;
    v20->inner.origin = (CGPoint)xmmword_1F9090;
    v20->inner.CGSize size = (CGSize)xmmword_1F90A0;
    v20->CGSize size = (CGSize)xmmword_1F90B0;
    [(id)qword_2B05F8 setObject:v20 forKey:@"3"];

    v21 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v21->outer.origin = (CGPoint)xmmword_1F90C0;
    v21->outer.CGSize size = (CGSize)xmmword_1F90D0;
    v21->inner.origin = (CGPoint)xmmword_1F90E0;
    v21->inner.CGSize size = (CGSize)xmmword_1F90F0;
    v21->CGSize size = (CGSize)xmmword_1F9100;
    [(id)qword_2B05F8 setObject:v21 forKey:@"3PL"];

    v22 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v22->outer.origin = (CGPoint)xmmword_1F9110;
    v22->outer.CGSize size = (CGSize)xmmword_1F9120;
    v22->inner.origin = (CGPoint)xmmword_1F9130;
    v22->inner.CGSize size = (CGSize)xmmword_1F9140;
    v22->CGSize size = (CGSize)xmmword_1F9150;
    [(id)qword_2B05F8 setObject:v22 forKey:@"4"];

    v23 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v23->outer.origin = (CGPoint)xmmword_1F9160;
    v23->outer.CGSize size = (CGSize)xmmword_1F9170;
    v23->inner.origin = (CGPoint)xmmword_1F9180;
    v23->inner.CGSize size = (CGSize)xmmword_1F9190;
    v23->CGSize size = (CGSize)xmmword_1F91A0;
    [(id)qword_2B05F8 setObject:v23 forKey:@"4PL"];

    v24 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v24->outer.origin = (CGPoint)xmmword_1F91B0;
    v24->outer.CGSize size = (CGSize)xmmword_1F91C0;
    v24->inner.origin = (CGPoint)xmmword_1F91D0;
    v24->inner.CGSize size = (CGSize)xmmword_1F91E0;
    v24->CGSize size = (CGSize)xmmword_1F91F0;
    [(id)qword_2B05F8 setObject:v24 forKey:@"5-Matte"];

    v25 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v25->outer.origin = (CGPoint)xmmword_1F9200;
    v25->outer.CGSize size = (CGSize)xmmword_1F9210;
    v25->inner.origin = (CGPoint)xmmword_1F9220;
    v25->inner.CGSize size = (CGSize)xmmword_1F9230;
    v25->CGSize size = (CGSize)xmmword_1F9240;
    [(id)qword_2B05F8 setObject:v25 forKey:@"5"];

    v26 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v26->outer.origin = (CGPoint)xmmword_1F9250;
    v26->outer.CGSize size = (CGSize)xmmword_1F9260;
    v26->inner.origin = (CGPoint)xmmword_1F9270;
    v26->inner.CGSize size = (CGSize)xmmword_1F9280;
    v26->CGSize size = (CGSize)xmmword_1F9290;
    [(id)qword_2B05F8 setObject:v26 forKey:@"5PL"];

    v27 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v27->outer.origin = (CGPoint)xmmword_1F92A0;
    v27->outer.CGSize size = (CGSize)xmmword_1F92B0;
    v27->inner.origin = (CGPoint)xmmword_1F92C0;
    v27->inner.CGSize size = (CGSize)xmmword_1F92D0;
    v27->CGSize size = (CGSize)xmmword_1F92E0;
    [(id)qword_2B05F8 setObject:v27 forKey:@"6"];

    v28 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v28->outer.origin = (CGPoint)xmmword_1F92F0;
    v28->outer.CGSize size = (CGSize)xmmword_1F9300;
    v28->inner.origin = (CGPoint)xmmword_1F9310;
    v28->inner.CGSize size = (CGSize)xmmword_1F9320;
    v28->CGSize size = (CGSize)xmmword_1F9330;
    [(id)qword_2B05F8 setObject:v28 forKey:@"6PL"];

    v29 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v29->outer.origin = (CGPoint)xmmword_1F9340;
    v29->outer.CGSize size = (CGSize)xmmword_1F9350;
    v29->inner.origin = (CGPoint)xmmword_1F9360;
    v29->inner.CGSize size = (CGSize)xmmword_1F9370;
    v29->CGSize size = (CGSize)xmmword_1F9380;
    [(id)qword_2B05F8 setObject:v29 forKey:@"7"];

    v30 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v30->outer.origin = (CGPoint)xmmword_1F9390;
    v30->outer.CGSize size = (CGSize)xmmword_1F93A0;
    v30->inner.origin = (CGPoint)xmmword_1F93B0;
    v30->inner.CGSize size = (CGSize)xmmword_1F93C0;
    v30->CGSize size = (CGSize)xmmword_1F93D0;
    [(id)qword_2B05F8 setObject:v30 forKey:@"7PL"];

    v31 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v31->outer.origin = (CGPoint)xmmword_1F93E0;
    v31->outer.CGSize size = (CGSize)xmmword_1F93F0;
    v31->inner.origin = (CGPoint)xmmword_1F9400;
    v31->inner.CGSize size = (CGSize)xmmword_1F9410;
    v31->CGSize size = (CGSize)xmmword_1F9420;
    [(id)qword_2B05F8 setObject:v31 forKey:@"8"];

    v32 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v32->outer.origin = (CGPoint)xmmword_1F9430;
    v32->outer.CGSize size = (CGSize)xmmword_1F9440;
    v32->inner.origin = (CGPoint)xmmword_1F9450;
    v32->inner.CGSize size = (CGSize)xmmword_1F9460;
    v32->CGSize size = (CGSize)xmmword_1F9470;
    [(id)qword_2B05F8 setObject:v32 forKey:@"8PL"];

    v33 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v33->outer.origin = (CGPoint)xmmword_1F9480;
    v33->outer.CGSize size = (CGSize)xmmword_1F9490;
    v33->inner.origin = (CGPoint)xmmword_1F94A0;
    v33->inner.CGSize size = (CGSize)xmmword_1F94B0;
    v33->CGSize size = (CGSize)xmmword_1F94C0;
    [(id)qword_2B05F8 setObject:v33 forKey:@"table1L"];

    v34 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v34->outer.origin = (CGPoint)xmmword_1F94D0;
    v34->outer.CGSize size = (CGSize)xmmword_1F94E0;
    v34->inner.origin = (CGPoint)xmmword_1F94F0;
    v34->inner.CGSize size = (CGSize)xmmword_1F9500;
    v34->CGSize size = (CGSize)xmmword_1F9510;
    [(id)qword_2B05F8 setObject:v34 forKey:@"table1P"];

    v35 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v35->outer.origin = (CGPoint)xmmword_1F9520;
    v35->outer.CGSize size = (CGSize)xmmword_1F9530;
    v35->inner.origin = (CGPoint)xmmword_1F9540;
    v35->inner.CGSize size = (CGSize)xmmword_1F9550;
    v35->CGSize size = (CGSize)xmmword_1F9560;
    [(id)qword_2B05F8 setObject:v35 forKey:@"table2L"];

    v36 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v36->outer.origin = (CGPoint)xmmword_1F9570;
    v36->outer.CGSize size = (CGSize)xmmword_1F9580;
    v36->inner.origin = (CGPoint)xmmword_1F9590;
    v36->inner.CGSize size = (CGSize)xmmword_1F95A0;
    v36->CGSize size = (CGSize)xmmword_1F95B0;
    [(id)qword_2B05F8 setObject:v36 forKey:@"table2P"];

    v37 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v37->outer.origin = (CGPoint)xmmword_1F95C0;
    v37->outer.CGSize size = (CGSize)xmmword_1F95D0;
    v37->inner.origin = (CGPoint)xmmword_1F95E0;
    v37->inner.CGSize size = (CGSize)xmmword_1F95F0;
    v37->CGSize size = (CGSize)xmmword_1F9600;
    [(id)qword_2B05F8 setObject:v37 forKey:@"table4L"];

    v38 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v38->outer.origin = (CGPoint)xmmword_1F9610;
    v38->outer.CGSize size = (CGSize)xmmword_1F9620;
    v38->inner.origin = (CGPoint)xmmword_1F9630;
    v38->inner.CGSize size = (CGSize)xmmword_1F9640;
    v38->CGSize size = (CGSize)xmmword_1F9650;
    [(id)qword_2B05F8 setObject:v38 forKey:@"table4P"];

    v39 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v39->outer.origin = (CGPoint)xmmword_1F9660;
    v39->outer.CGSize size = (CGSize)xmmword_1F9670;
    v39->inner.origin = (CGPoint)xmmword_1F9680;
    v39->inner.CGSize size = (CGSize)xmmword_1F9690;
    v39->CGSize size = (CGSize)xmmword_1F96A0;
    [(id)qword_2B05F8 setObject:v39 forKey:@"table5L"];

    v40 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v40->outer.origin = (CGPoint)xmmword_1F96B0;
    v40->outer.CGSize size = (CGSize)xmmword_1F96C0;
    v40->inner.origin = (CGPoint)xmmword_1F96D0;
    v40->inner.CGSize size = (CGSize)xmmword_1F96E0;
    v40->CGSize size = (CGSize)xmmword_1F96F0;
    [(id)qword_2B05F8 setObject:v40 forKey:@"table5P"];

    v41 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v41->outer.origin = (CGPoint)xmmword_1F9700;
    v41->outer.CGSize size = (CGSize)xmmword_1F9710;
    v41->inner.origin = (CGPoint)xmmword_1F9720;
    v41->inner.CGSize size = (CGSize)xmmword_1F9730;
    v41->CGSize size = (CGSize)xmmword_1F9740;
    [(id)qword_2B05F8 setObject:v41 forKey:@"table6L"];

    v42 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v42->outer.origin = (CGPoint)xmmword_1F9750;
    v42->outer.CGSize size = (CGSize)xmmword_1F9760;
    v42->inner.origin = (CGPoint)xmmword_1F9770;
    v42->inner.CGSize size = (CGSize)xmmword_1F9780;
    v42->CGSize size = (CGSize)xmmword_1F9790;
    [(id)qword_2B05F8 setObject:v42 forKey:@"table6P"];

    double y = CGRectZero.origin.y;
    double height = CGRectZero.size.height;
    double width = CGRectZero.size.width;
    v43 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v43->outer.origin.x = CGRectZero.origin.x / 450.0;
    v43->outer.origin.double y = y / 450.0;
    v43->outer.size.double width = width / 450.0;
    v43->outer.size.double height = height / 450.0;
    v43->inner.origin.x = CGRectZero.origin.x / 450.0;
    v43->inner.origin.double y = y / 450.0;
    v43->inner.size.double width = width / 450.0;
    v43->inner.size.double height = height / 450.0;
    int64x2_t v72 = vdupq_n_s64(0x407C200000000000uLL);
    v43->CGSize size = (CGSize)v72;
    [(id)qword_2B05F8 setObject:v43 forKey:@"break-slice_01"];

    v44 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v44->outer.origin.x = CGRectZero.origin.x / 1080.0;
    v44->outer.origin.double y = y / 450.0;
    v44->outer.size.double width = width / 1080.0;
    v44->outer.size.double height = height / 450.0;
    v44->inner.origin.x = CGRectZero.origin.x / 1080.0;
    v44->inner.origin.double y = y / 450.0;
    v44->inner.size.double width = width / 1080.0;
    v44->inner.size.double height = height / 450.0;
    v44->CGSize size = (CGSize)xmmword_1F97A0;
    [(id)qword_2B05F8 setObject:v44 forKey:@"break-slice_02"];

    v45 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v45->outer.origin.x = CGRectZero.origin.x / 450.0;
    v45->outer.origin.double y = y / 450.0;
    v45->outer.size.double width = width / 450.0;
    v45->outer.size.double height = height / 450.0;
    v45->inner.origin.x = CGRectZero.origin.x / 450.0;
    v45->inner.origin.double y = y / 450.0;
    v45->inner.size.double width = width / 450.0;
    v45->inner.size.double height = height / 450.0;
    v45->CGSize size = (CGSize)v72;
    [(id)qword_2B05F8 setObject:v45 forKey:@"break-slice_03"];

    v46 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v46->outer.origin.x = CGRectZero.origin.x / 450.0;
    v46->outer.origin.double y = y / 1080.0;
    v46->outer.size.double width = width / 450.0;
    v46->outer.size.double height = height / 1080.0;
    v46->inner.origin.x = CGRectZero.origin.x / 450.0;
    v46->inner.origin.double y = y / 1080.0;
    v46->inner.size.double width = width / 450.0;
    v46->inner.size.double height = height / 1080.0;
    v46->CGSize size = (CGSize)xmmword_1F97B0;
    [(id)qword_2B05F8 setObject:v46 forKey:@"break-slice_04"];

    v47 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v47->outer.origin.x = CGRectZero.origin.x / 450.0;
    v47->outer.origin.double y = y / 450.0;
    v47->outer.size.double width = width / 450.0;
    v47->outer.size.double height = height / 450.0;
    v47->inner.origin.x = CGRectZero.origin.x / 450.0;
    v47->inner.origin.double y = y / 450.0;
    v47->inner.size.double width = width / 450.0;
    v47->inner.size.double height = height / 450.0;
    v47->CGSize size = (CGSize)v72;
    [(id)qword_2B05F8 setObject:v47 forKey:@"break-slice_05"];

    v48 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v48->outer.origin.x = CGRectZero.origin.x / 1080.0;
    v48->outer.origin.double y = y / 450.0;
    v48->outer.size.double width = width / 1080.0;
    v48->outer.size.double height = height / 450.0;
    v48->inner.origin.x = CGRectZero.origin.x / 1080.0;
    v48->inner.origin.double y = y / 450.0;
    v48->inner.size.double width = width / 1080.0;
    v48->inner.size.double height = height / 450.0;
    v48->CGSize size = (CGSize)xmmword_1F97A0;
    [(id)qword_2B05F8 setObject:v48 forKey:@"break-slice_06"];

    v49 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v49->outer.origin.x = CGRectZero.origin.x / 450.0;
    v49->outer.origin.double y = y / 450.0;
    v49->outer.size.double width = width / 450.0;
    v49->outer.size.double height = height / 450.0;
    v49->inner.origin.x = CGRectZero.origin.x / 450.0;
    v49->inner.origin.double y = y / 450.0;
    v49->inner.size.double width = width / 450.0;
    v49->inner.size.double height = height / 450.0;
    v49->CGSize size = (CGSize)v72;
    [(id)qword_2B05F8 setObject:v49 forKey:@"break-slice_07"];

    v50 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v50->outer.origin.x = CGRectZero.origin.x / 450.0;
    v50->outer.origin.double y = y / 1080.0;
    v50->outer.size.double width = width / 450.0;
    v50->outer.size.double height = height / 1080.0;
    v50->inner.origin.x = CGRectZero.origin.x / 450.0;
    v50->inner.origin.double y = y / 1080.0;
    v50->inner.size.double width = width / 450.0;
    v50->inner.size.double height = height / 1080.0;
    v50->CGSize size = (CGSize)xmmword_1F97B0;
    [(id)qword_2B05F8 setObject:v50 forKey:@"break-slice_08"];

    v51 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v51->outer.origin.x = CGRectZero.origin.x / 25.0;
    v51->outer.origin.double y = y / 25.0;
    v51->outer.size.double width = width / 25.0;
    v51->outer.size.double height = height / 25.0;
    v51->inner.origin.x = CGRectZero.origin.x / 25.0;
    v51->inner.origin.double y = y / 25.0;
    v51->inner.size.double width = width / 25.0;
    v51->inner.size.double height = height / 25.0;
    __asm { FMOV            V0.2D, #25.0 }

    CGSize v73 = _Q0;
    v51->CGSize size = _Q0;
    [(id)qword_2B05F8 setObject:v51 forKey:@"break-slice_01-small"];

    v57 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v57->outer.origin.x = CGRectZero.origin.x / 60.0;
    v57->outer.origin.double y = y / 25.0;
    v57->outer.size.double width = width / 60.0;
    v57->outer.size.double height = height / 25.0;
    v57->inner.origin.x = CGRectZero.origin.x / 60.0;
    v57->inner.origin.double y = y / 25.0;
    v57->inner.size.double width = width / 60.0;
    v57->inner.size.double height = height / 25.0;
    v57->CGSize size = (CGSize)xmmword_1F97C0;
    [(id)qword_2B05F8 setObject:v57 forKey:@"break-slice_02-small"];

    v58 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v58->outer.origin.x = CGRectZero.origin.x / 25.0;
    v58->outer.origin.double y = y / 25.0;
    v58->outer.size.double width = width / 25.0;
    v58->outer.size.double height = height / 25.0;
    v58->inner.origin.x = CGRectZero.origin.x / 25.0;
    v58->inner.origin.double y = y / 25.0;
    v58->inner.size.double width = width / 25.0;
    v58->inner.size.double height = height / 25.0;
    v58->CGSize size = v73;
    [(id)qword_2B05F8 setObject:v58 forKey:@"break-slice_03-small"];

    v59 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v59->outer.origin.x = CGRectZero.origin.x / 25.0;
    v59->outer.origin.double y = y / 60.0;
    v59->outer.size.double width = width / 25.0;
    v59->outer.size.double height = height / 60.0;
    v59->inner.origin.x = CGRectZero.origin.x / 25.0;
    v59->inner.origin.double y = y / 60.0;
    v59->inner.size.double width = width / 25.0;
    v59->inner.size.double height = height / 60.0;
    v59->CGSize size = (CGSize)xmmword_1F97D0;
    [(id)qword_2B05F8 setObject:v59 forKey:@"break-slice_04-small"];

    v60 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v60->outer.origin.x = CGRectZero.origin.x / 25.0;
    v60->outer.origin.double y = y / 25.0;
    v60->outer.size.double width = width / 25.0;
    v60->outer.size.double height = height / 25.0;
    v60->inner.origin.x = CGRectZero.origin.x / 25.0;
    v60->inner.origin.double y = y / 25.0;
    v60->inner.size.double width = width / 25.0;
    v60->inner.size.double height = height / 25.0;
    v60->CGSize size = v73;
    [(id)qword_2B05F8 setObject:v60 forKey:@"break-slice_05-small"];

    v61 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v61->outer.origin.x = CGRectZero.origin.x / 60.0;
    v61->outer.origin.double y = y / 25.0;
    v61->outer.size.double width = width / 60.0;
    v61->outer.size.double height = height / 25.0;
    v61->inner.origin.x = CGRectZero.origin.x / 60.0;
    v61->inner.origin.double y = y / 25.0;
    v61->inner.size.double width = width / 60.0;
    v61->inner.size.double height = height / 25.0;
    v61->CGSize size = (CGSize)xmmword_1F97C0;
    [(id)qword_2B05F8 setObject:v61 forKey:@"break-slice_06-small"];

    v62 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v62->outer.origin.x = CGRectZero.origin.x / 25.0;
    v62->outer.origin.double y = y / 25.0;
    v62->outer.size.double width = width / 25.0;
    v62->outer.size.double height = height / 25.0;
    v62->inner.origin.x = CGRectZero.origin.x / 25.0;
    v62->inner.origin.double y = y / 25.0;
    v62->inner.size.double width = width / 25.0;
    v62->inner.size.double height = height / 25.0;
    v62->CGSize size = v73;
    [(id)qword_2B05F8 setObject:v62 forKey:@"break-slice_07-small"];

    v63 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameImage);
    v63->outer.origin.x = CGRectZero.origin.x / 25.0;
    v63->outer.origin.double y = y / 60.0;
    v63->outer.size.double width = width / 25.0;
    v63->outer.size.double height = height / 60.0;
    v63->inner.origin.x = CGRectZero.origin.x / 25.0;
    v63->inner.origin.double y = y / 60.0;
    v63->inner.size.double width = width / 25.0;
    v63->inner.size.double height = height / 60.0;
    v63->CGSize size = (CGSize)xmmword_1F97D0;
    [(id)qword_2B05F8 setObject:v63 forKey:@"break-slice_08-small"];
  }

- (MREffectPictureFrames)initWithEffectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MREffectPictureFrames;
  id v3 = -[MREffect initWithEffectID:](&v5, "initWithEffectID:", a3);
  if (v3)
  {
    *(void *)(v3 + 233) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v3 + 193) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v3 + 201) = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    *(void *)(v3 + 225) = 0LL;
    *(void *)(v3 + 217) = 0LL;
    *(void *)(v3 + 209) = 0LL;
  }

  return (MREffectPictureFrames *)v3;
}

- (void)_cleanup
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v3 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( objc_msgSend( *(id *)((char *)&self->mSprites + 1),  "objectForKey:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)i)),  "cleanup");
      }

      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v5);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = *(MRImageProvider **)((char *)&self->mGradientProvider + 1);
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (j = 0LL; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)j) cleanup];
      }

      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v10);
  }

  *(MRImageProvider **)((char *)&self->mGradientProvider + 1) = 0LL;
  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  [*(id *)((char *)&self->mFrameSprite + 1) cleanup];

  *(MRCroppingSprite **)((char *)&self->mFrameSprite + 1) = 0LL;
  [*(id *)((char *)&self->mWallProvider + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mWallProvider + 1) = 0LL;
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mTableProviders + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mWallSprites + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mFrames + 1) = 0LL;
  *(void *)(&self->mIsLoaded + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mLayouts + 1) = 0LL;
  *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mAspectRatios + 1) = 0LL;
  *(NSString **)((char *)&self->mFirstFrame + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mSlideOrder + 1) = 0LL;
  BYTE1(self->mXOffset) = 0;
}

- (id)layoutsWithSlidesInfo:(id)a3 seed:(unint64_t)a4 hasShelf:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = *(void **)(&self->mIsLoaded + 1);
  if (!v8 || ![v8 count])
  {
    self->super.mSeed = a4;
    self->super.mFlattenedAttributes =  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5),  @"hasShelf");
    -[MREffectPictureFrames _setupLayoutWithSlideInformation:](self, "_setupLayoutWithSlideInformation:", a3);
    *(NSMutableArray **)((char *)&self->mFrames + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v9 = -[NSMutableIndexSet initWithIndexesInRange:]( [NSMutableIndexSet alloc],  "initWithIndexesInRange:",  0,  [a3 count]);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id obj = *(id *)(&self->mIsLoaded + 1);
    id v22 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v33;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = v10;
          id v11 = objc_msgSend( objc_msgSend((id)qword_2B05F0, "objectForKey:", *(void *)(*((void *)&v32 + 1) + 8 * v10)),  "objectForKey:",  @"frames");
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          id v24 = v11;
          id v27 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v27)
          {
            uint64_t v26 = *(void *)v29;
            do
            {
              for (i = 0LL; i != v27; i = (char *)i + 1)
              {
                if (*(void *)v29 != v26) {
                  objc_enumerationMutation(v24);
                }
                __int128 v13 = 0LL;
                __int128 v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
                while (1)
                {
                  __int128 v15 = (char *)-[NSMutableIndexSet indexGreaterThanOrEqualToIndex:]( v9,  "indexGreaterThanOrEqualToIndex:",  v13);
                  objc_msgSend( objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v15), "objectForKey:", @"aspectRatio"),  "floatValue");
                  float v17 = v16;
                  if (objc_msgSend(objc_msgSend(v14, "aspectRatio"), "isEqualToString:", @"vBreak"))
                  {
                    if (v17 < 0.5) {
                      break;
                    }
                  }

                  if (objc_msgSend(objc_msgSend(v14, "aspectRatio"), "isEqualToString:", @"hBreak")
                    && v17 > 2.0)
                  {
                    break;
                  }

                  if (objc_msgSend( objc_msgSend(v14, "aspectRatio"),  "isEqualToString:",  @"landscape")
                    && v17 >= 1.0)
                  {
                    break;
                  }

                  unsigned int v18 = objc_msgSend( objc_msgSend(v14, "aspectRatio"),  "isEqualToString:",  @"portrait");
                  __int128 v13 = v15 + 1;
                  if (v18)
                  {
                    if (v17 < 1.0) {
                      break;
                    }
                  }
                }

                -[NSMutableIndexSet removeIndex:](v9, "removeIndex:", v15);
                objc_msgSend( *(id *)((char *)&self->mFrames + 1),  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
              }

              id v27 = [v24 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }

            while (v27);
          }

          uint64_t v10 = v23 + 1;
        }

        while ((id)(v23 + 1) != v22);
        id v22 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }

      while (v22);
    }
  }

  return +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  *(void *)(&self->mIsLoaded + 1),  *(NSMutableArray **)((char *)&self->mLayouts + 1),  *(NSMutableArray **)((char *)&self->mFrames + 1),  0LL);
}

- (BOOL)isLoadedForTime:(double)a3
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v4 = [*(id *)((char *)&self->mSprites + 1) objectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![*(id *)(*((void *)&v23 + 1) + 8 * (void)i) isLoaded])
        {
          unsigned int v9 = 0;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  unsigned int v9 = 1;
LABEL_11:
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v10 = *(MRImageProvider **)((char *)&self->mGradientProvider + 1);
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        if ((v9 & 1) != 0) {
          unsigned int v9 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)j) isLoaded];
        }
        else {
          unsigned int v9 = 0;
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v12);
  }

  if (v9)
  {
    __int128 v15 = *(MRCroppingSprite **)((char *)&self->mFrameSprite + 1);
    if (!v15 || (unsigned int v16 = [v15 isLoaded]) != 0)
    {
      float v17 = *(MRImageProvider **)((char *)&self->mWallProvider + 1);
      if (v17) {
        LOBYTE(v16) = [v17 isLoaded];
      }
      else {
        LOBYTE(v16) = 1;
      }
    }
  }

  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_mPixelSize = &self->super.mPixelSize;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___MREffectPictureFrames;
    -[MREffect setPixelSize:](&v8, "setPixelSize:", a3.width, a3.height);
    -[MREffectPictureFrames _setSizeScripts:](self, "_setSizeScripts:", width / height);
    objc_msgSend( *(id *)((char *)&self->mWallProvider + 1),  "setDefaultSize:",  p_mPixelSize->width * 0.109999999,  p_mPixelSize->height * 0.5);
    objc_msgSend(*(id *)((char *)&self->mFrameSprite + 1), "setDefaultSize:", width, height);
  }

- (void)_setSizeScripts:(double)a3
{
  unsigned int v100 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"hasShelf"),  "BOOLValue");
  v103 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  id obj = *(id *)(&self->mIsLoaded + 1);
  id v93 = [obj countByEnumeratingWithState:&v116 objects:v123 count:16];
  if (v93)
  {
    uint64_t v101 = 0LL;
    uint64_t v92 = *(void *)v117;
    double height = CGSizeZero.height;
    do
    {
      for (i = 0LL; i != v93; i = (char *)i + 1)
      {
        if (*(void *)v117 != v92) {
          objc_enumerationMutation(obj);
        }
        id v8 = objc_msgSend( objc_msgSend((id)qword_2B05F0, "objectForKey:", *(void *)(*((void *)&v116 + 1) + 8 * (void)i)),  "objectForKey:",  @"frames");
        __int128 v112 = 0u;
        __int128 v113 = 0u;
        __int128 v114 = 0u;
        __int128 v115 = 0u;
        id v98 = v8;
        id v9 = [v8 countByEnumeratingWithState:&v112 objects:v122 count:16];
        if (v9)
        {
          id v10 = v9;
          v94 = i;
          uint64_t v11 = *(void *)v113;
          do
          {
            for (j = 0LL; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v113 != v11) {
                objc_enumerationMutation(v98);
              }
              uint64_t v13 = *(void *)(*((void *)&v112 + 1) + 8LL * (void)j);
              __int128 v14 = ImageKey((int64_t)objc_msgSend( objc_msgSend( *(id *)((char *)&self->mFrames + 1),  "objectAtIndex:",  (char *)j + v101),  "integerValue"));
              id v15 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  v14);
              id v16 = [*(id *)((char *)&self->mLayouts + 1) objectAtIndex:(char *)j + v101];
              -[MREffectPictureFrames _frameRectFromInfo:onShelf:](self, "_frameRectFromInfo:onShelf:", v13, v100);
              double v18 = v17;
              double v20 = v19;
              double v22 = v21;
              double v24 = v23;
              uint64_t v25 = *(unsigned __int8 *)(v13 + 72);
              [v15 imageAspectRatio];
              -[MREffectPictureFrames _rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:]( self,  "_rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:",  v16,  v25,  v18,  v20,  v22,  v24,  a3,  v26);
              double v28 = v27;
              double v30 = v29;
              id v31 = -[NSMutableDictionary objectForKey:](v103, "objectForKey:", v16);
              if (!v31 || (([v31 CGSizeValue], v28 <= v33) ? (BOOL v34 = v30 <= v32) : (BOOL v34 = 0), !v34)) {
                -[NSMutableDictionary setObject:forKey:]( v103,  "setObject:forKey:",  +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v28, v30),  v16);
              }
              __int128 v35 = (double *)[(id)qword_2B05F8 objectForKey:v16];
              [v15 setImageSizeScript:0];
              if ([v16 hasPrefix:@"break"])
              {
                if ([v16 isEqualToString:@"breakV"]
                  && ([v15 imageAspectRatio], v36 <= 0.400000006))
                {
                  double v38 = v28 * 0.425000012 * self->super.mPixelSize.width * 0.5;
                  [v15 imageAspectRatio];
                  double v40 = v28 * 0.425000012 / v47 * self->super.mPixelSize.height;
                }

                else
                {
                  [v15 imageAspectRatio];
                  if (v37 >= 1.0)
                  {
                    [v15 imageAspectRatio];
                    double v38 = v30 * v46 / a3 * self->super.mPixelSize.width * 0.5;
                    double v40 = v30 * self->super.mPixelSize.height;
                  }

                  else
                  {
                    double v38 = v28 * self->super.mPixelSize.width * 0.5;
                    [v15 imageAspectRatio];
                    double v40 = self->super.mPixelSize.height * (v28 / v39 * a3);
                  }
                }

                double v45 = v40 * 0.5;
              }

              else
              {
                double v41 = v28 * 0.5 * v35[7];
                double v42 = v30 * 0.5 * v35[8];
                double width = self->super.mPixelSize.width;
                if (width >= 500.0)
                {
                  double v38 = v41 * 0.850000024 * width;
                  double v44 = self->super.mPixelSize.height;
                  double v42 = v42 * 0.850000024;
                }

                else
                {
                  double v38 = v41 * width;
                  double v44 = self->super.mPixelSize.height;
                }

                double v45 = v42 * v44;
              }

              id v48 = [v5 objectForKey:v14];
              double v49 = CGSizeZero.width;
              double v50 = height;
              if (v48) {
                objc_msgSend(v48, "CGSizeValue", CGSizeZero.width, height);
              }
              if (v38 > v49 || v45 > v50)
              {
                objc_msgSend(v15, "setDefaultSize:", v38, v45);
                objc_msgSend( v5,  "setObject:forKey:",  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v38, v45),  v14);
              }
            }

            id v10 = [v98 countByEnumeratingWithState:&v112 objects:v122 count:16];
            v101 += (uint64_t)j;
          }

          while (v10);
          i = v94;
        }
      }

      id v93 = [obj countByEnumeratingWithState:&v116 objects:v123 count:16];
    }

    while (v93);
  }

  id v52 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  v53 = *(NSMutableArray **)((char *)&self->mLayouts + 1);
  v54 = (char *)[v53 countByEnumeratingWithState:&v108 objects:v121 count:16];
  if (v54)
  {
    v55 = v54;
    char v56 = 0;
    uint64_t v57 = *(void *)v109;
    v102 = v52;
    v95 = v53;
    uint64_t v96 = *(void *)v109;
    do
    {
      v58 = 0LL;
      v97 = v55;
      do
      {
        if (*(void *)v109 != v57) {
          objc_enumerationMutation(v53);
        }
        v99 = v58;
        v59 = *(void **)(*((void *)&v108 + 1) + 8LL * (void)v58);
        if ([v59 hasPrefix:@"break"])
        {
          if ((v56 & 1) != 0)
          {
            char v56 = 1;
          }

          else
          {
            __int128 v106 = 0u;
            __int128 v107 = 0u;
            __int128 v104 = 0u;
            __int128 v105 = 0u;
            id v68 = (void *)qword_2B05F8;
            id v69 = [(id)qword_2B05F8 countByEnumeratingWithState:&v104 objects:v120 count:16];
            if (v69)
            {
              id v70 = v69;
              uint64_t v71 = *(void *)v105;
              do
              {
                for (k = 0LL; k != v70; k = (char *)k + 1)
                {
                  if (*(void *)v105 != v71) {
                    objc_enumerationMutation(v68);
                  }
                  CGSize v73 = *(void **)(*((void *)&v104 + 1) + 8LL * (void)k);
                  if ([v73 hasPrefix:@"break"])
                  {
                    uint64_t v74 = (double *)[(id)qword_2B05F8 objectForKey:v73];
                    double v75 = v74[9];
                    double v76 = v74[10];
                    objc_msgSend(-[NSMutableDictionary objectForKey:](v103, "objectForKey:", v59), "CGSizeValue");
                    double v78 = v77;
                    double v80 = v79;
                    id v81 = [*(id *)((char *)&self->mSprites + 1) objectForKey:v73];
                    if (v81)
                    {
                      objc_msgSend( v81,  "setDefaultSize:",  v78 * 0.5 * self->super.mPixelSize.width,  v80 * 0.5 * self->super.mPixelSize.height);
                    }

                    else
                    {
                      __int128 v82 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
                      [*(id *)((char *)&self->mSprites + 1) setObject:v82 forKey:v73];
                      -[MRImageProvider setAssetPath:]( v82,  "setAssetPath:",  [v102 resourcePathForEffectID:self->super.mEffectID, +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@.png", v73) andResource]);
                      -[MRImageProvider setImageSizeScript:](v82, "setImageSizeScript:", 0LL);
                      -[MRImageProvider setOriginalImageSize:](v82, "setOriginalImageSize:", v75, v76);
                      -[MRImageProvider setDefaultSize:]( v82,  "setDefaultSize:",  v78 * 0.5 * self->super.mPixelSize.width,  v80 * 0.5 * self->super.mPixelSize.height);
                    }
                  }
                }

                id v70 = [v68 countByEnumeratingWithState:&v104 objects:v120 count:16];
              }

              while (v70);
              char v56 = 1;
              id v52 = v102;
              v53 = v95;
            }

            else
            {
              char v56 = 1;
            }

            uint64_t v57 = v96;
            v55 = v97;
          }
        }

        else
        {
          v60 = (double *)[(id)qword_2B05F8 objectForKey:v59];
          double v61 = v60[9];
          double v62 = v60[10];
          objc_msgSend(-[NSMutableDictionary objectForKey:](v103, "objectForKey:", v59), "CGSizeValue");
          double v64 = v63;
          double v66 = v65;
          id v67 = [*(id *)((char *)&self->mSprites + 1) objectForKey:v59];
          if (v67)
          {
            objc_msgSend( v67,  "setDefaultSize:",  v64 * 0.5 * self->super.mPixelSize.width,  v66 * 0.5 * self->super.mPixelSize.height);
          }

          else
          {
            __int128 v83 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
            [*(id *)((char *)&self->mSprites + 1) setObject:v83 forKey:v59];
            -[MRImageProvider setAssetPath:]( v83,  "setAssetPath:",  [v52 resourcePathForEffectID:self->super.mEffectID, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.png", v59) andResource]);
            -[MRImageProvider setImageSizeScript:](v83, "setImageSizeScript:", 0LL);
            -[MRImageProvider setOriginalImageSize:](v83, "setOriginalImageSize:", v61, v62);
            -[MRImageProvider setDefaultSize:]( v83,  "setDefaultSize:",  v64 * 0.5 * self->super.mPixelSize.width,  v66 * 0.5 * self->super.mPixelSize.height);

            v55 = v97;
          }
        }

        ++v58;
      }

      while (v99 + 1 != v55);
      v55 = (char *)[v53 countByEnumeratingWithState:&v108 objects:v121 count:16];
    }

    while (v55);
  }

  if (v100)
  {
    if (*(MRImageProvider **)((char *)&self->mGradientProvider + 1))
    {
      uint64_t v84 = 0LL;
      char v85 = 1;
      do
      {
        char v86 = v85;
        objc_msgSend( objc_msgSend(*(id *)((char *)&self->mGradientProvider + 1), "objectAtIndex:", v84),  "setDefaultSize:",  self->super.mPixelSize.height * 0.2 * 4.0);
        char v85 = 0;
        uint64_t v84 = 1LL;
      }

      while ((v86 & 1) != 0);
    }

    else
    {
      *(MRImageProvider **)((char *)&self->mGradientProvider + 1) = (MRImageProvider *)objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      char v87 = 1;
      uint64_t v88 = 1LL;
      do
      {
        char v89 = v87;
        v90 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
        -[MRImageProvider setAssetPath:]( v90,  "setAssetPath:",  [v52 resourcePathForEffectID:self->super.mEffectID, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"table%d.png", v88) andResource]);
        -[MRImageProvider setOriginalImageSize:](v90, "setOriginalImageSize:", 1359.0, 297.0);
        -[MRImageProvider setDefaultSize:](v90, "setDefaultSize:", self->super.mPixelSize.height * 0.2 * 4.0);
        [*(id *)((char *)&self->mGradientProvider + 1) addObject:v90];

        char v87 = 0;
        uint64_t v88 = 2LL;
      }

      while ((v89 & 1) != 0);
    }
  }
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  unsigned int v9 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"hasShelf"),  "BOOLValue");
  unsigned int v10 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"turnsCorner"),  "BOOLValue");
  if (!BYTE1(self->mXOffset))
  {
    unsigned int v11 = v10;
    -[MREffectPictureFrames _setupLayoutWithSlideInformation:](self, "_setupLayoutWithSlideInformation:", 0LL);
    id v141 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
    id v12 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    if (!*(MRCroppingSprite **)((char *)&self->mFrameSprite + 1))
    {
      *(MRCroppingSprite **)((char *)&self->mFrameSprite + 1) = (MRCroppingSprite *)objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mFrameSprite + 1),  "setAssetPath:",  objc_msgSend(v12, "resourcePathForEffectID:andResource:", self->super.mEffectID, @"wall.jpg"));
      objc_msgSend(*(id *)((char *)&self->mFrameSprite + 1), "setOriginalImageSize:", 2240.0, 1680.0);
      objc_msgSend( *(id *)((char *)&self->mFrameSprite + 1),  "setDefaultSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    }

    unsigned int v138 = v9;
    double v139 = a3;
    id v140 = a5;
    else {
      unsigned int v13 = v11;
    }
    if (v13 == 1)
    {
      *(MRImageProvider **)((char *)&self->mWallProvider + 1) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
      objc_msgSend( *(id *)((char *)&self->mWallProvider + 1),  "setAssetPath:",  objc_msgSend(v12, "resourcePathForEffectID:andResource:", self->super.mEffectID, @"gradient.png"));
      objc_msgSend(*(id *)((char *)&self->mWallProvider + 1), "setOriginalImageSize:", 300.0, 1650.0);
      objc_msgSend( *(id *)((char *)&self->mWallProvider + 1),  "setDefaultSize:",  self->super.mPixelSize.width * 0.109999999,  self->super.mPixelSize.height * 0.5);
    }

    -[MREffectPictureFrames _durationForEffect:](self, "_durationForEffect:", 0LL);
    double v15 = v14 / 25.0;
    double v16 = (2.5 - v15) * 0.5;
    if (v15 < 2.5) {
      double v15 = 2.5;
    }
    else {
      double v16 = 0.0;
    }
    *(double *)((char *)&self->mTotalWidth + 1) = v16;
    *(double *)((char *)&self->mLayoutWidths + 1) = v15;
    unsigned int v153 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"hasShelf"),  "BOOLValue");
    -[MREffectPictureFrames _startingOffset](self, "_startingOffset");
    double v18 = v17;
    double v19 = *(double *)((char *)&self->mTotalWidth + 1);
    *(NSMutableArray **)((char *)&self->mWallSprites + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    double v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v181 = 0u;
    __int128 v182 = 0u;
    __int128 v183 = 0u;
    __int128 v184 = 0u;
    id obj = *(id *)(&self->mIsLoaded + 1);
    v151 = v20;
    id v146 = [obj countByEnumeratingWithState:&v181 objects:v190 count:16];
    if (v146)
    {
      uint64_t v21 = 0LL;
      double v22 = v18 + v19 + -1.0;
      uint64_t v144 = *(void *)v182;
      CGFloat y = CGRectZero.origin.y;
      CGFloat width = CGRectZero.size.width;
      CGFloat rect1 = CGRectZero.size.height;
      do
      {
        uint64_t v23 = 0LL;
        do
        {
          if (*(void *)v182 != v144) {
            objc_enumerationMutation(obj);
          }
          uint64_t v150 = v23;
          uint64_t v24 = *(void *)(*((void *)&v181 + 1) + 8 * v23);
          uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          id v149 = [(id)qword_2B05F0 objectForKey:v24];
          id v26 = [v149 objectForKey:@"frames"];
          __int128 v177 = 0u;
          __int128 v178 = 0u;
          __int128 v179 = 0u;
          __int128 v180 = 0u;
          id v152 = v26;
          id v27 = [v26 countByEnumeratingWithState:&v177 objects:v189 count:16];
          if (v27)
          {
            id v28 = v27;
            double v148 = v22;
            id v29 = a4;
            uint64_t v30 = *(void *)v178;
            CGFloat v32 = y;
            CGFloat x = CGRectZero.origin.x;
            double v33 = width;
            CGFloat v34 = rect1;
            do
            {
              for (i = 0LL; i != v28; i = (char *)i + 1)
              {
                CGFloat v159 = v33;
                if (*(void *)v178 != v30) {
                  objc_enumerationMutation(v152);
                }
                uint64_t v36 = *(void *)(*((void *)&v177 + 1) + 8LL * (void)i);
                id v37 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int64_t)objc_msgSend( objc_msgSend( *(id *)((char *)&self->mFrames + 1),  "objectAtIndex:",  (char *)i + v21),  "integerValue")));
                id v38 = [*(id *)((char *)&self->mLayouts + 1) objectAtIndex:(char *)i + v21];
                -[MREffectPictureFrames _frameRectFromInfo:onShelf:](self, "_frameRectFromInfo:onShelf:", v36, v153);
                double v40 = v39;
                double v42 = v41;
                double v44 = v43;
                double v46 = v45;
                uint64_t v47 = *(unsigned __int8 *)(v36 + 72);
                [v29 localAspectRatio];
                double v49 = v48;
                [v37 imageAspectRatio];
                -[MREffectPictureFrames _rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:]( self,  "_rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:",  v38,  v47,  v40,  v42,  v44,  v46,  v49,  v50);
                double v52 = v51;
                double v54 = v53;
                double v56 = v55;
                double v58 = v57;
                v191.origin.CGFloat y = y;
                v191.origin.CGFloat x = CGRectZero.origin.x;
                v191.size.CGFloat width = width;
                v191.size.double height = rect1;
                v193.origin.CGFloat x = x;
                v193.origin.CGFloat y = v32;
                v193.size.CGFloat width = v159;
                v193.size.double height = v34;
                BOOL v59 = CGRectEqualToRect(v191, v193);
                double v60 = v52;
                double v61 = v54;
                double v62 = v56;
                double v63 = v58;
                if (!v59)
                {
                  v192.origin.CGFloat x = v52;
                  v192.origin.CGFloat y = v54;
                  v192.size.CGFloat width = v56;
                  v192.size.double height = v58;
                  v194.origin.CGFloat x = x;
                  v194.origin.CGFloat y = v32;
                  v194.size.CGFloat width = v159;
                  v194.size.double height = v34;
                  *(CGRect *)&double v60 = CGRectUnion(v192, v194);
                }

                CGFloat v34 = v63;
                double v33 = v62;
                CGFloat v32 = v61;
                CGFloat x = v60;
                if ([v38 isEqualToString:@"breakV"])
                {
                  [v37 imageAspectRatio];
                  if (v64 > 0.400000006)
                  {
                    double v56 = v56 * 0.800000012;
                    double v58 = v58 * 0.800000012;
                  }
                }

                -[NSMutableArray addObject:]( v25,  "addObject:",  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v52, v54, v56, v58));
              }

              id v28 = [v152 countByEnumeratingWithState:&v177 objects:v189 count:16];
              v21 += (uint64_t)i;
            }

            while (v28);
            a4 = v29;
            double v20 = v151;
            double v22 = v148;
          }

          else
          {
            double v33 = width;
          }

          id v65 = [v149 objectForKey:@"width"];
          double v66 = v33;
          if (v65)
          {
            objc_msgSend(objc_msgSend(v149, "objectForKey:", @"width", v33), "floatValue");
            double v66 = v67;
          }

          if (v66 >= v33) {
            double v68 = v66;
          }
          else {
            double v68 = v33;
          }
          objc_msgSend(objc_msgSend(v149, "objectForKey:", @"padding"), "floatValue");
          double v70 = v69;
          double v71 = v68 + v70;
          *(float *)&double v70 = v71;
          objc_msgSend( *(id *)((char *)&self->mWallSprites + 1),  "addObject:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v70));
          __int128 v175 = 0u;
          __int128 v176 = 0u;
          __int128 v173 = 0u;
          __int128 v174 = 0u;
          id v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v173,  v188,  16LL);
          if (v72)
          {
            id v73 = v72;
            uint64_t v74 = *(void *)v174;
            do
            {
              for (j = 0LL; j != v73; j = (char *)j + 1)
              {
                if (*(void *)v174 != v74) {
                  objc_enumerationMutation(v25);
                }
                [*(id *)(*((void *)&v173 + 1) + 8 * (void)j) CGRectValue];
                -[NSMutableArray addObject:]( v20,  "addObject:",  +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v22 + v76 * v71));
              }

              id v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v173,  v188,  16LL);
            }

            while (v73);
          }

          double v22 = v22 + v71 + 0.0500000007;
          uint64_t v23 = v150 + 1;
        }

        while ((id)(v150 + 1) != v146);
        id v146 = [obj countByEnumeratingWithState:&v181 objects:v190 count:16];
      }

      while (v146);
    }

    [*(id *)((char *)&self->mFrameSprite + 1) imageAspectRatio];
    double v78 = v77;
    [a4 localAspectRatio];
    float v80 = v79;
    else {
      double v81 = 2.0;
    }
    if (![*(id *)((char *)&self->mTableProviders + 1) count])
    {
      double v82 = (v78 + v78) / v80;
      float v83 = v81 / v82;
      uint64_t v143 = vcvtps_s32_f32(v83);
      if (v143 >= 1)
      {
        uint64_t v84 = 0LL;
        double v85 = 0.400000006;
        do
        {
          uint64_t v147 = v84;
          double v86 = v82 * 0.5 + -1.0 + (double)v84 * v82;
          char v87 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
          LODWORD(v88) = 0;
          double v145 = v86;
          char v89 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v87,  "initWithPosition:size:zRotation:innerRect:context:",  a4,  v86,  0.0,  v82,  2.0,  v88,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
          __int128 v169 = 0u;
          __int128 v170 = 0u;
          __int128 v171 = 0u;
          __int128 v172 = 0u;
          id v90 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v169,  v187,  16LL);
          if (v90)
          {
            id v92 = v90;
            uint64_t v93 = 0LL;
            uint64_t v94 = *(void *)v170;
            do
            {
              for (k = 0LL; k != v92; k = (char *)k + 1)
              {
                if (*(void *)v170 != v94) {
                  objc_enumerationMutation(v20);
                }
                [*(id *)(*((void *)&v169 + 1) + 8 * (void)k) CGRectValue];
                double v97 = v96;
                double v99 = v98;
                double v101 = v100;
                double v103 = v102;
                -[MRTiledSprite position](v89, "position");
                if (v97 > v104 - v82)
                {
                  -[MRTiledSprite position](v89, "position");
                  if (v97 < v82 + v105)
                  {
                    id v106 = [*(id *)((char *)&self->mLayouts + 1) objectAtIndex:(char *)k + v93];
                    if (([v106 hasPrefix:@"break"] & 1) == 0)
                    {
                      __int128 v107 = (double *)[(id)qword_2B05F8 objectForKey:v106];
                      double v108 = v107[3];
                      double v109 = v107[4];
                      double v101 = v101 * v108 * 0.99000001;
                      double v103 = v103 * v109 * 0.99000001;
                      double v97 = v97 + (v107[1] - (1.0 - (v107[1] + v108))) * 0.5;
                      double v99 = v99 + (v107[2] - (1.0 - (v107[2] + v109))) * 0.5;
                    }

                    if ([v106 isEqualToString:@"breakV"])
                    {
                      objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int64_t)objc_msgSend( objc_msgSend( *(id *)((char *)&self->mFrames + 1),  "objectAtIndex:",  (char *)k + v93),  "integerValue"))),  "imageAspectRatio");
                      double v20 = v151;
                      if (v111 <= v85)
                      {
                        double v113 = v101 * 0.425000012;
                        double v114 = v85;
                        double v115 = v103 * 0.899999976;
                        double v116 = v103 * 0.899999976 * 0.5;
                        double v117 = (1.0 - v116) * 0.5;
                        BOOL v118 = v116 < 0.75;
                        double v119 = 0.0;
                        if (v118) {
                          double v119 = v117;
                        }
                        double v156 = v99 + v103 * 0.5 - v115 * 0.5 + -0.0199999996 - v119;
                        double v158 = v97 - v113 * 0.5 + -0.0250000004;
                        double v97 = v97 + v113 * 0.5 + 0.0250000004;
                        double v99 = v99 - v103 * 0.5 + v115 * 0.5 + 0.0199999996 + v119;
                        double v101 = v113 + -0.0500000007;
                        [a4 localAspectRatio];
                        double v103 = v115 + (float)(v120 * -0.05);
                        double v85 = v114;
                        LODWORD(v121) = 0;
                        -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v89,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a4,  v158,  v156,  v101,  v103,  v121,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
                      }
                    }

                    else
                    {
                      if ([v106 isEqualToString:@"breakH"])
                      {
                        double v101 = v101 + -0.0500000007;
                        [a4 localAspectRatio];
                        double v103 = v103 + (float)(v112 * -0.05);
                      }

                      double v20 = v151;
                    }

                    LODWORD(v110) = 0;
                    -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v89,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a4,  v97,  v99,  v101,  v103,  v110,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
                  }
                }
              }

              id v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v169,  v187,  16LL);
              v93 += (uint64_t)k;
            }

            while (v92);
          }

          if (v153)
          {
            LODWORD(v91) = 0;
            -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v89,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a4,  v145,  -0.959999979,  v82,  0.25,  v91,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
          }

          [*(id *)((char *)&self->mTableProviders + 1) addObject:v89];

          uint64_t v84 = v147 + 1;
        }

        while (v147 + 1 != v143);
      }
    }

    [a4 localAspectRatio];
    -[MREffectPictureFrames _setSizeScripts:](self, "_setSizeScripts:", v122);
    -[MREffectPictureFrames _applyTimingToSlideProviders](self, "_applyTimingToSlideProviders");
    v123 = *(NSMutableArray **)((char *)&self->mAspectRatios + 1);
    if (v123)
    {

      *(NSMutableArray **)((char *)&self->mAspectRatios + 1) = 0LL;
    }

    *(NSMutableArray **)((char *)&self->mAspectRatios + 1) = (NSMutableArray *)objc_msgSend( -[MREffectPictureFrames _randomFrameForAspectRatio:forTable:allowMatte:onlyLoaded:ignoreFrames:randomGenerator:]( self,  "_randomFrameForAspectRatio:forTable:a llowMatte:onlyLoaded:ignoreFrames:randomGenerator:",  @"landscape",  0,  1,  1,  0,  v141),  "copy");
    v124 = *(NSString **)((char *)&self->mFirstFrame + 1);
    a5 = v140;
    a3 = v139;
    unsigned int v9 = v138;
    if (v124)
    {

      *(NSString **)((char *)&self->mFirstFrame + 1) = 0LL;
    }

    *(NSString **)((char *)&self->mFirstFrame + 1) = (NSString *)objc_msgSend( -[MREffectPictureFrames _randomFrameForAspectRatio:forTable:allowMatte:onlyLoaded:ignoreFrames:randomGenerator:]( self,  "_randomFrameForAspectRatio:forTable:allowMatte:only Loaded:ignoreFrames:randomGenerator:",  @"landscape",  0,  1,  1,  0,  v141),  "copy");
    BYTE1(self->mXOffset) = 1;
  }

  if (-[MRLayer isActivated](self->super.mEffectLayer, "isActivated"))
  {
    id v125 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"previousAttributes");
    if (a3 < 4.0 && v125)
    {
      if (-[MRLayerEffect asynchronousOperationsAreSuspended]( self->super.mEffectLayer,  "asynchronousOperationsAreSuspended"))
      {
        goto LABEL_87;
      }

      BOOL v126 = 1LL;
    }

    else
    {
      BOOL v126 = self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration + -4.0 + -1.0 <= a3;
      if (-[MRLayerEffect asynchronousOperationsAreSuspended]( self->super.mEffectLayer,  "asynchronousOperationsAreSuspended") == v126) {
        goto LABEL_87;
      }
    }

    -[MRLayerEffect suspendAsynchronousOperations:](self->super.mEffectLayer, "suspendAsynchronousOperations:", v126);
  }

+ (BOOL)hasCustomTiming
{
  return 1;
}

+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7
{
  unsigned int v9 = -[MREffectPictureFrames initWithEffectID:]( objc_alloc(&OBJC_CLASS___MREffectPictureFrames),  "initWithEffectID:",  a3);
  -[MREffect setAttributes:](v9, "setAttributes:", a4);
  -[MREffectPictureFrames _setupLayoutWithSlideInformation:](v9, "_setupLayoutWithSlideInformation:", a5);
  -[MREffectPictureFrames _durationForEffect](v9, "_durationForEffect");
  double v11 = v10 + -50.0;
  unsigned int v12 = objc_msgSend(objc_msgSend(a4, "objectForKey:", @"turnsCorner"), "BOOLValue");
  unsigned int v13 = objc_msgSend( objc_msgSend( objc_msgSend(a4, "objectForKey:", @"previousAttributes"),  "objectForKey:",  @"turnsCorner"),  "BOOLValue");
  double v14 = 4.0;
  if (v13) {
    double v15 = 4.0;
  }
  else {
    double v15 = 0.0;
  }
  if (!v12) {
    double v14 = 0.0;
  }
  -[MREffectPictureFrames setPhaseInDuration:mainDuration:phaseOutDuration:]( v9,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  v15,  v11,  v14);
  return v9;
}

- (void)setPhaseInDuration:(double)a3 mainDuration:(double)a4 phaseOutDuration:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectPictureFrames;
  -[MREffect setPhaseInDuration:mainDuration:phaseOutDuration:]( &v6,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  a3,  a4,  a5);
  -[MREffectPictureFrames _applyTimingToSlideProviders](self, "_applyTimingToSlideProviders");
}

- (void)_applyTimingToSlideProviders
{
  mEffectLayer = self->super.mEffectLayer;
  if (mEffectLayer && *(void *)(&self->mIsLoaded + 1))
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v4 = -[NSDictionary objectEnumerator]( -[MRLayerEffect slideProvidersForElementIDs](mEffectLayer, "slideProvidersForElementIDs", 0LL),  "objectEnumerator");
    id v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v4);
          }
          unsigned int v9 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          [v9 setShowTime:1.0e10];
          [v9 setShowDuration:0.0];
        }

        id v6 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
      }

      while (v6);
    }

    NSUInteger v10 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
    unint64_t v11 = v10;
    if (v10 <= 8) {
      uint64_t v12 = 8LL;
    }
    else {
      uint64_t v12 = v10;
    }
    id v13 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
    for (unint64_t j = 0LL; j != v12; ++j)
    {
      id v15 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(j % v11));
      [v13 randomFloatInRange:0.5 :1.25];
      double v17 = v16;
      [v15 showTime];
      double v19 = v18;
      -[MREffectPictureFrames showTimeForSlideAtIndex:](self, "showTimeForSlideAtIndex:", j);
      if (v19 < v20) {
        double v20 = v19;
      }
      double v21 = v20 - v17;
      if (v21 < 0.0) {
        double v21 = 0.0;
      }
      [v15 setShowTime:v21];
      if (v11 > 7)
      {
        [v15 showDuration];
        double v26 = v25;
        -[MREffectPictureFrames showDurationForSlideAtIndex:](self, "showDurationForSlideAtIndex:", j);
        if (v26 >= v27) {
          double v27 = v26;
        }
        double v24 = v17 + v27;
      }

      else
      {
        double v22 = self->super.mMainDuration + self->super.mPhaseInDuration + self->super.mPhaseOutDuration;
        [v15 showTime];
        double v24 = v22 - v23;
      }

      [v15 setShowDuration:v24];
    }
  }

- (double)_durationForEffect
{
  return result;
}

- (double)_durationForEffect:(BOOL)a3
{
  id v4 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"hasShelf"),  "BOOLValue");
  -[MREffectPictureFrames _startingWidth](self, "_startingWidth");
  double v6 = v5;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id obj = *(id *)(&self->mIsLoaded + 1);
  id v44 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v44)
  {
    uint64_t v7 = 0LL;
    uint64_t v43 = *(void *)v57;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat rect1 = CGRectZero.size.height;
    do
    {
      for (i = 0LL; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v57 != v43) {
          objc_enumerationMutation(obj);
        }
        id v9 = [(id)qword_2B05F0 objectForKey:*(void *)(*((void *)&v56 + 1) + 8 * (void)i)];
        id v10 = [v9 objectForKey:@"frames"];
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v11)
        {
          id v12 = v11;
          id v45 = v9;
          double v46 = i;
          double v47 = v6;
          uint64_t v13 = *(void *)v53;
          CGFloat v15 = y;
          CGFloat x = CGRectZero.origin.x;
          double v16 = width;
          CGFloat height = rect1;
          do
          {
            for (unint64_t j = 0LL; j != v12; unint64_t j = (char *)j + 1)
            {
              CGFloat v51 = height;
              if (*(void *)v53 != v13) {
                objc_enumerationMutation(v10);
              }
              -[MREffectPictureFrames _frameRectFromInfo:onShelf:]( self,  "_frameRectFromInfo:onShelf:",  *(void *)(*((void *)&v52 + 1) + 8LL * (void)j),  v4);
              double v20 = v19;
              double v22 = v21;
              double v24 = v23;
              double v26 = v25;
              objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSlideOrder + 1), "objectAtIndex:", (char *)j + v7),  "floatValue");
              -[MREffectPictureFrames _rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:]( self,  "_rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:",  [*(id *)((char *)&self->mLayouts + 1) objectAtIndex:(char *)j + v7],  0,  v20,  v22,  v24,  v26,  1.77777779,  v27);
              CGFloat v29 = v28;
              CGFloat v31 = v30;
              CGFloat v33 = v32;
              CGFloat height = v34;
              v62.origin.CGFloat y = y;
              v62.origin.CGFloat x = CGRectZero.origin.x;
              v62.size.CGFloat height = rect1;
              v65.origin.CGFloat x = x;
              v65.origin.CGFloat y = v15;
              v65.size.CGFloat width = v16;
              v62.size.CGFloat width = width;
              v65.size.CGFloat height = v51;
              if (CGRectEqualToRect(v62, v65))
              {
                CGFloat x = v29;
                CGFloat v15 = v31;
                double v16 = v33;
              }

              else
              {
                v63.origin.CGFloat x = v29;
                v63.origin.CGFloat y = v31;
                v63.size.CGFloat width = v33;
                v63.size.CGFloat height = height;
                v66.origin.CGFloat x = x;
                v66.origin.CGFloat y = v15;
                v66.size.CGFloat width = v16;
                v66.size.CGFloat height = v51;
                CGRect v64 = CGRectUnion(v63, v66);
                CGFloat x = v64.origin.x;
                CGFloat v15 = v64.origin.y;
                double v16 = v64.size.width;
                CGFloat height = v64.size.height;
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
            v7 += (uint64_t)j;
          }

          while (v12);
          double v6 = v47;
          id v9 = v45;
          i = v46;
        }

        else
        {
          double v16 = width;
        }

        id v35 = [v9 objectForKey:@"width"];
        double v36 = v16;
        if (v35)
        {
          objc_msgSend(objc_msgSend(v9, "objectForKey:", @"width", v16), "floatValue");
          double v36 = v37;
        }

        if (v36 >= v16) {
          double v38 = v36;
        }
        else {
          double v38 = v16;
        }
        objc_msgSend(objc_msgSend(v9, "objectForKey:", @"padding"), "floatValue");
        double v6 = v6 + v38 + v39 + 0.0500000007;
      }

      id v44 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }

    while (v44);
  }

  double result = (v6 + -0.0500000007) * 25.0;
  if (v6 + -0.0500000007 < 2.5 && a3) {
    return 62.5;
  }
  return result;
}

- (double)_startingWidth
{
  unsigned int v3 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"hasShelf"),  "BOOLValue");
  unsigned int v4 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"turnsCorner"),  "BOOLValue");
  id v5 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"previousAttributes");
  unsigned int v6 = objc_msgSend(objc_msgSend(v5, "objectForKey:", @"turnsCorner"), "BOOLValue");
  unsigned int v7 = objc_msgSend(objc_msgSend(v5, "objectForKey:", @"hasShelf"), "BOOLValue");
  double v8 = 0.200000003;
  if (!v4) {
    double v8 = 0.0;
  }
  if (v6) {
    double v8 = v8 + 0.100000001;
  }
  double v9 = dbl_1F97E0[v5 == 0LL];
  if (!v3) {
    double v9 = -0.0;
  }
  double result = v8 + v9;
  if (v7) {
    double result = result + 0.349999994;
  }
  if (!v5) {
    double result = result + 0.100000001;
  }
  if (!(v4 | v3)) {
    return result + 0.314999998;
  }
  return result;
}

- (double)_startingOffset
{
  id v2 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"previousAttributes");
  unsigned int v3 = objc_msgSend(objc_msgSend(v2, "objectForKey:", @"turnsCorner"), "BOOLValue");
  if (v2) {
    int v4 = v3;
  }
  else {
    int v4 = 1;
  }
  double result = 0.349999994;
  if (v4) {
    return 0.100000001;
  }
  return result;
}

- (void)_setupLayoutWithSlideInformation:(id)a3
{
  id v74 = +[MURandom randomGeneratorWithSeed:](&OBJC_CLASS___MURandom, "randomGeneratorWithSeed:", self->super.mSeed);
  id v5 = -[MREffectPictureFrames _populateFrames](self, "_populateFrames");
  unsigned __int8 v67 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"hasShelf"),  "BOOLValue");
  id obj = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  float v83 = self;
  if (a3) {
    unsigned int v6 = (NSDictionary *)a3;
  }
  else {
    unsigned int v6 = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
  }
  unint64_t v7 = -[NSDictionary count](v6, "count");
  unint64_t v79 = v7;
  id v70 = a3;
  if (v7 > 7) {
    goto LABEL_9;
  }
  if (!objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"isLast"),  "BOOLValue"))
  {
    unint64_t v79 = 8LL;
    goto LABEL_9;
  }

  unint64_t v79 = v7;
  if (v7)
  {
LABEL_9:
    unint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    char v76 = 0;
    uint64_t v10 = 1LL;
    unint64_t v11 = v79;
    while (1)
    {
      uint64_t v71 = v9;
      uint64_t v12 = v11 - v8;
      else {
        uint64_t v13 = v11 - v8;
      }
      if (v10 > 3) {
        uint64_t v12 = v13;
      }
      uint64_t v14 = 2LL;
      if (v12 < 2) {
        uint64_t v14 = v12;
      }
      if (v8 >= 4) {
        uint64_t v14 = v12;
      }
      if (v12 >= 1) {
        uint64_t v12 = 1LL;
      }
      if (v8) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v12;
      }
      double v16 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15),  @"numOfImages",  0LL);
      if ((v76 & 1) != 0) {
        uint64_t v17 = v10;
      }
      else {
        uint64_t v17 = 1LL;
      }
      if (v11 >= 5 && !(v76 & 1 | (v15 == 1)))
      {
        id v18 = [v5 getRandomIndexMeetingContraints:v16];
        if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_33:
          [v5 ignoreIndex:v18];
        }

        else
        {
          while (1)
          {
            double v19 = objc_msgSend(objc_msgSend(v5, "allConstraints"), "objectAtIndex:", v18);
            uint64_t v17 = v19[8] + v19[9];
            [v5 ignoreIndex:v18];
            if (v10 != v17) {
              break;
            }
            id v18 = [v5 getRandomIndexMeetingContraints:v16];
            if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v17 = v10;
              goto LABEL_33;
            }
          }
        }
      }

      uint64_t v10 = v17;
      [v5 clearIgnoreIndices];

      id v80 = (id)v8;
      if (v17 < 1)
      {
        uint64_t v23 = 0LL;
        uint64_t v22 = 0LL;
        uint64_t v21 = 0LL;
        uint64_t v20 = 0LL;
      }

      else
      {
        uint64_t v20 = 0LL;
        uint64_t v21 = 0LL;
        uint64_t v22 = 0LL;
        uint64_t v23 = 0LL;
        do
        {
          if (v70)
          {
            unint64_t v24 = (unint64_t)[v70 count];
            LODWORD(v25) = -1.0;
            if (v8 % v7 < v24) {
              objc_msgSend( objc_msgSend(objc_msgSend(v70, "objectAtIndex:", v8 % v7, v25), "objectForKey:", @"aspectRatio"),  "floatValue");
            }
            double v26 = *(float *)&v25;
          }

          else
          {
            -[MREffectPictureFrames _aspectRatioForSlideIndex:](v83, "_aspectRatioForSlideIndex:", v8 % v7);
          }

          if (v26 > 2.0) {
            ++v22;
          }
          uint64_t v27 = v26 < 0.5 && v26 <= 2.0;
          v23 += v27;
          if (v26 >= 1.0) {
            ++v20;
          }
          else {
            ++v21;
          }
          ++v8;
          --v17;
        }

        while (v17);
      }

      id v28 = [v5 getRandomItemMeetingNumberOfFaceLandscapes:v20 facePortraits:v21 imageLandscapes:0 imagePortraits:0 vPanoramas:v23 hPanora mas:v22 movies:0 fitsInExtraWide:0 aspectRatios:0 previousTags:0];
      unint64_t v8 = (unint64_t)v80;
      if (v28)
      {
        id v29 = v28;
        id v30 = objc_msgSend(objc_msgSend(v5, "allItems"), "indexOfObject:", v28);
        if ((v67 & 1) != 0
          || (CGFloat v31 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  &__kCFBooleanFalse,  @"shelf",  0),  v32 = [v5 itemAtIndex:v30 meetsContraints:v31],  v31,  v32))
        {
          [obj addObject:v29];
          unint64_t v8 = (unint64_t)v80 + v10;
          [v5 addIndexToIgnore:v30];
LABEL_60:
          char v76 = 0;
          uint64_t v9 = 0LL;
          goto LABEL_61;
        }

        char v76 = 1;
      }

      if (v71 >= 3)
      {
        objc_msgSend(v5, "ignoreIndices:", +[NSIndexSet indexSet](NSIndexSet, "indexSet"));
        goto LABEL_60;
      }

      uint64_t v9 = v71 + 1;
LABEL_61:
      unint64_t v11 = v79;
      if (v8 >= v79) {
        goto LABEL_62;
      }
    }
  }

  unint64_t v79 = 0LL;
LABEL_62:
  id v77 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  id v68 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
  if (v68)
  {
    CGFloat v33 = 0LL;
    uint64_t v66 = *(void *)v98;
    do
    {
      uint64_t v34 = 0LL;
      do
      {
        if (*(void *)v98 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v72 = v34;
        id v35 = objc_msgSend( objc_msgSend((id)qword_2B05F0, "objectForKey:", *(void *)(*((void *)&v97 + 1) + 8 * v34)),  "objectForKey:",  @"frames");
        __int128 v93 = 0u;
        __int128 v94 = 0u;
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        id v36 = [v35 countByEnumeratingWithState:&v93 objects:v103 count:16];
        if (v36)
        {
          id v37 = v36;
          id v81 = *(id *)v94;
          do
          {
            for (i = 0LL; i != v37; i = (char *)i + 1)
            {
              float v39 = v33;
              if (*(id *)v94 != v81) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void *)(*((void *)&v93 + 1) + 8LL * (void)i);
              int v41 = *(unsigned __int8 *)(v40 + 89);
              id v42 = [(id)v40 aspectRatio];
              int v43 = *(unsigned __int8 *)(v40 + 72);
              int v44 = *(unsigned __int8 *)(v40 + 88);
              id v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              double v46 = v45;
              if (*(double *)(v40 + 24) < 0.5 || *(double *)(v40 + 32) < 0.5)
              {
                -[NSMutableArray addObject:](v45, "addObject:", @"4LL");
                -[NSMutableArray addObject:](v46, "addObject:", @"4PL");
                -[NSMutableArray addObject:](v46, "addObject:", @"6LL");
                -[NSMutableArray addObject:](v46, "addObject:", @"6PL");
                -[NSMutableArray addObject:](v46, "addObject:", @"8LL");
                -[NSMutableArray addObject:](v46, "addObject:", @"8PL");
              }

              if ((unint64_t)[v35 count] >= 3)
              {
                -[NSMutableArray addObject:](v46, "addObject:", @"8LL");
                -[NSMutableArray addObject:](v46, "addObject:", @"8PL");
              }

              CGFloat v33 = @"breakV";
              if (([v42 isEqualToString:@"vBreak"] & 1) == 0)
              {
                unsigned int v48 = [v42 isEqualToString:@"hBreak"];
                CGFloat v33 = v48 ? @"breakH" : (__CFString *)v39;
                if (!v41 && (v48 & 1) == 0) {
                  CGFloat v33 = -[MREffectPictureFrames _randomFrameForAspectRatio:forTable:allowMatte:onlyLoaded:ignoreFrames:randomGenerator:]( v83,  "_randomFrameForAspectRatio:forTable:allowMatte:onlyLoaded:ignoreFrames:randomGenerator:",  v42,  v43 != 0,  v44 == 0,  0LL,  v46,  v74);
                }
              }

              [v77 addObject:v33];
            }

            id v37 = [v35 countByEnumeratingWithState:&v93 objects:v103 count:16];
          }

          while (v37);
        }

        uint64_t v34 = v72 + 1;
      }

      while ((id)(v72 + 1) != v68);
      id v68 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
    }

    while (v68);
  }

  double v49 = *(void **)(&v83->mIsLoaded + 1);
  if (v49)
  {

    *(void *)(&v83->mIsLoaded + 1) = 0LL;
  }

  *(void *)(&v83->mIsLoaded + 1) = obj;
  double v50 = *(NSMutableArray **)((char *)&v83->mLayouts + 1);
  if (v50)
  {

    *(NSMutableArray **)((char *)&v83->mLayouts + 1) = 0LL;
  }

  *(NSMutableArray **)((char *)&v83->mLayouts + 1) = (NSMutableArray *)v77;
  CGFloat v51 = *(NSMutableArray **)((char *)&v83->mFrames + 1);
  if (v51)
  {

    *(NSMutableArray **)((char *)&v83->mFrames + 1) = 0LL;
  }

  *(NSMutableArray **)((char *)&v83->mFrames + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v52 = *(NSMutableArray **)((char *)&v83->mSlideOrder + 1);
  if (v52)
  {

    *(NSMutableArray **)((char *)&v83->mSlideOrder + 1) = 0LL;
  }

  *(NSMutableArray **)((char *)&v83->mSlideOrder + 1) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v92 = 0LL;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  id v69 = *(id *)(&v83->mIsLoaded + 1);
  id v75 = [v69 countByEnumeratingWithState:&v88 objects:v102 count:16];
  if (v75)
  {
    __int128 v53 = 0LL;
    uint64_t v73 = *(void *)v89;
    do
    {
      uint64_t v54 = 0LL;
      do
      {
        if (*(void *)v89 != v73) {
          objc_enumerationMutation(v69);
        }
        uint64_t v78 = v54;
        id v55 = objc_msgSend( objc_msgSend((id)qword_2B05F0, "objectForKey:", *(void *)(*((void *)&v88 + 1) + 8 * v54)),  "objectForKey:",  @"frames");
        __int128 v84 = 0u;
        __int128 v85 = 0u;
        __int128 v86 = 0u;
        __int128 v87 = 0u;
        id v82 = v55;
        id v56 = [v55 countByEnumeratingWithState:&v84 objects:v101 count:16];
        if (v56)
        {
          id v57 = v56;
          uint64_t v58 = *(void *)v85;
          do
          {
            for (unint64_t j = 0LL; j != v57; unint64_t j = (char *)j + 1)
            {
              if (*(void *)v85 != v58) {
                objc_enumerationMutation(v82);
              }
              double v60 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)j);
              if (!v53 || !-[NSMutableIndexSet count](v53, "count")) {
                __int128 v53 = +[NSMutableIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSMutableIndexSet,  "indexSetWithIndexesInRange:",  0LL,  v79);
              }
              -[MREffectPictureFrames _nextSlideProviderAspectRatioToFitInAspectRatio:providerKeys:slideInformation:index:force:]( v83,  "_nextSlideProviderAspectRatioToFitInAspectRatio:providerKeys:slideInformation:index:force:",  [v60 aspectRatio],  v53,  v70,  &v92,  0);
              double v62 = v61;
              if (v61 < 0.0)
              {
                __int128 v53 = +[NSMutableIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSMutableIndexSet,  "indexSetWithIndexesInRange:",  0LL,  v79);
                -[MREffectPictureFrames _nextSlideProviderAspectRatioToFitInAspectRatio:providerKeys:slideInformation:index:force:]( v83,  "_nextSlideProviderAspectRatioToFitInAspectRatio:providerKeys:slideInformation:index:force:",  [v60 aspectRatio],  v53,  v70,  &v92,  1);
                double v62 = v63;
              }

              objc_msgSend( *(id *)((char *)&v83->mFrames + 1),  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v92));
              *(float *)&double v64 = v62;
              objc_msgSend( *(id *)((char *)&v83->mSlideOrder + 1),  "addObject:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v64));
            }

            id v57 = [v82 countByEnumeratingWithState:&v84 objects:v101 count:16];
          }

          while (v57);
        }

        uint64_t v54 = v78 + 1;
      }

      while ((id)(v78 + 1) != v75);
      id v75 = [v69 countByEnumeratingWithState:&v88 objects:v102 count:16];
    }

    while (v75);
  }

- (double)_aspectRatioForSlideIndex:(int64_t)a3
{
  if (-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count") <= a3) {
    return -1.0;
  }
  id v5 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(a3));
  if (!v5) {
    return -1.0;
  }
  [v5 imageAspectRatio];
  return result;
}

- (id)_populateFrames
{
  unsigned int v20 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"hasShelf"),  "BOOLValue");
  uint64_t v21 = objc_alloc_init(&OBJC_CLASS___MPWeighter);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)qword_2B05F0;
  id v2 = [(id)qword_2B05F0 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v23 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v7 = [(id)qword_2B05F0 objectForKey:v6];
        id v8 = objc_msgSend(objc_msgSend(v7, "objectForKey:", @"landscape"), "integerValue");
        id v9 = objc_msgSend(objc_msgSend(v7, "objectForKey:", @"portrait"), "integerValue");
        id v10 = objc_msgSend(objc_msgSend(v7, "objectForKey:", @"hBreak"), "integerValue");
        id v11 = objc_msgSend(objc_msgSend(v7, "objectForKey:", @"vBreak"), "integerValue");
        unsigned int v12 = objc_msgSend(objc_msgSend(v7, "objectForKey:", @"shelf"), "BOOLValue");
        uint64_t v13 = objc_alloc_init(&OBJC_CLASS___MPWeighterConstraint);
        uint64_t v14 = v13;
        v13->numOfImages = (int64_t)v8 + (void)v9;
        v13->landscape = (int64_t)v8;
        v13->portrait = (int64_t)v9;
        v13->shelf = v12;
        v13->hPanoramas = (int64_t)v10;
        v13->vPanoramas = (int64_t)v11;
        BOOL v16 = (uint64_t)v10 > 0 || (uint64_t)v11 > 0;
        v13->hasPanorama = v16;
        if ((v12 & v20) != 0) {
          uint64_t v17 = 50LL;
        }
        else {
          uint64_t v17 = 1LL;
        }
        -[MPWeighter addItem:withWeight:andContraints:](v21, "addItem:withWeight:andContraints:", v6, v17, v13);
      }

      id v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v3);
  }

  return v21;
}

- (CGRect)_frameRectFromInfo:(id)a3 onShelf:(BOOL)a4
{
  if (a4)
  {
    int v5 = *((unsigned __int8 *)a3 + 72);
    v11.origin.CGFloat x = CGRectZero.origin.x;
    v11.origin.CGFloat y = CGRectZero.origin.y;
    v11.size.CGFloat width = CGRectZero.size.width;
    v11.size.CGFloat height = CGRectZero.size.height;
    if (CGRectEqualToRect(*(CGRect *)((char *)a3 + 40), v11))
    {
      double v6 = *((double *)a3 + 1);
      double v7 = *((double *)a3 + 2);
      float64x2_t v8 = *(float64x2_t *)((char *)a3 + 24);
      if (!v5)
      {
        float64x2_t v8 = vmulq_f64(v8, (float64x2_t)vdupq_n_s64(0x3FEE666660000000uLL));
        double v7 = v7 + 0.0250000004;
      }
    }

    else
    {
      double v6 = *((double *)a3 + 5);
      double v7 = *((double *)a3 + 6);
      float64x2_t v8 = *(float64x2_t *)((char *)a3 + 56);
    }
  }

  else
  {
    double v6 = *((double *)a3 + 1);
    double v7 = *((double *)a3 + 2);
    float64x2_t v8 = *(float64x2_t *)((char *)a3 + 24);
  }

  double v9 = v8.f64[1];
  result.size.CGFloat width = v8.f64[0];
  result.size.CGFloat height = v9;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (double)_xForSlideAtIndex:(int64_t)a3 layoutWidth:(double *)a4
{
  id v6 = objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"hasShelf"),  "BOOLValue");
  -[MREffectPictureFrames _startingOffset](self, "_startingOffset");
  double v8 = v7 + -1.0;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id obj = *(id *)(&self->mIsLoaded + 1);
  id v48 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v48)
  {
    id v45 = a4;
    int64_t v9 = 0LL;
    uint64_t v47 = *(void *)v61;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat rect1 = CGRectZero.size.height;
    while (2)
    {
      for (i = 0LL; i != v48; i = (char *)i + 1)
      {
        if (*(void *)v61 != v47) {
          objc_enumerationMutation(obj);
        }
        id v11 = [(id)qword_2B05F0 objectForKey:*(void *)(*((void *)&v60 + 1) + 8 * (void)i)];
        id v12 = [v11 objectForKey:@"frames"];
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v56 objects:v64 count:16];
        if (v13)
        {
          id v14 = v13;
          id v50 = v11;
          double v51 = v8;
          uint64_t v15 = *(void *)v57;
          CGFloat v17 = y;
          CGFloat x = CGRectZero.origin.x;
          double v18 = width;
          CGFloat height = rect1;
          do
          {
            for (unint64_t j = 0LL; j != v14; unint64_t j = (char *)j + 1)
            {
              CGFloat v55 = height;
              if (*(void *)v57 != v15) {
                objc_enumerationMutation(v12);
              }
              -[MREffectPictureFrames _frameRectFromInfo:onShelf:]( self,  "_frameRectFromInfo:onShelf:",  *(void *)(*((void *)&v56 + 1) + 8LL * (void)j),  v6);
              double v22 = v21;
              double v24 = v23;
              double v26 = v25;
              double v28 = v27;
              objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSlideOrder + 1), "objectAtIndex:", (char *)j + v9),  "floatValue");
              -[MREffectPictureFrames _rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:]( self,  "_rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:",  [*(id *)((char *)&self->mLayouts + 1) objectAtIndex:(char *)j + v9],  0,  v22,  v24,  v26,  v28,  1.77777778,  v29);
              CGFloat v31 = v30;
              CGFloat v33 = v32;
              CGFloat v35 = v34;
              CGFloat height = v36;
              v66.origin.CGFloat y = y;
              v66.origin.CGFloat x = CGRectZero.origin.x;
              v66.size.CGFloat height = rect1;
              v69.origin.CGFloat x = x;
              v69.origin.CGFloat y = v17;
              v69.size.CGFloat width = v18;
              v66.size.CGFloat width = width;
              v69.size.CGFloat height = v55;
              if (CGRectEqualToRect(v66, v69))
              {
                CGFloat x = v31;
                CGFloat v17 = v33;
                double v18 = v35;
              }

              else
              {
                v67.origin.CGFloat x = v31;
                v67.origin.CGFloat y = v33;
                v67.size.CGFloat width = v35;
                v67.size.CGFloat height = height;
                v70.origin.CGFloat x = x;
                v70.origin.CGFloat y = v17;
                v70.size.CGFloat width = v18;
                v70.size.CGFloat height = v55;
                CGRect v68 = CGRectUnion(v67, v70);
                CGFloat x = v68.origin.x;
                CGFloat v17 = v68.origin.y;
                double v18 = v68.size.width;
                CGFloat height = v68.size.height;
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v56 objects:v64 count:16];
            v9 += (int64_t)j;
          }

          while (v14);
          double v8 = v51;
          id v11 = v50;
        }

        else
        {
          double v18 = width;
        }

        id v37 = [v11 objectForKey:@"width"];
        double v38 = v18;
        if (v9 > a3)
        {
          if (v37)
          {
            objc_msgSend(objc_msgSend(v11, "objectForKey:", @"width", v18), "floatValue");
            double v38 = v42;
          }

          if (v38 < v18) {
            double v38 = v18;
          }
          double *v45 = v38;
          objc_msgSend(objc_msgSend(v11, "objectForKey:", @"padding"), "floatValue");
          double *v45 = *v45 + v43;
          return v8;
        }

        if (v37)
        {
          objc_msgSend(objc_msgSend(v11, "objectForKey:", @"width", v18), "floatValue");
          double v38 = v39;
        }

        if (v38 >= v18) {
          double v40 = v38;
        }
        else {
          double v40 = v18;
        }
        objc_msgSend(objc_msgSend(v11, "objectForKey:", @"padding"), "floatValue");
        double v8 = v8 + v40 + v41 + 0.0500000007;
      }

      id v48 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v48) {
        continue;
      }
      break;
    }
  }

  return v8;
}

- (double)showTimeForSlideAtIndex:(unint64_t)a3
{
  double v3 = 0.0;
  if (a3)
  {
    if (a3 + 1 != -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "count"))
    {
      -[MREffectPictureFrames _durationForEffect](self, "_durationForEffect");
      double v7 = v6 / 25.0;
      if (v6 / 25.0 > 2.5)
      {
        -[MREffectPictureFrames _xForSlideAtIndex:layoutWidth:](self, "_xForSlideAtIndex:layoutWidth:", a3, v11);
        double v9 = (v8 + -1.5) / (v7 + -2.0) * self->super.mMainDuration;
        if (v9 >= 0.0) {
          return v9;
        }
        else {
          return 0.0;
        }
      }
    }
  }

  return v3;
}

- (double)showDurationForSlideAtIndex:(unint64_t)a3
{
  if (!a3) {
    return self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
  }
  -[MREffectPictureFrames _durationForEffect](self, "_durationForEffect");
  double v6 = v5 / 25.0;
  if (v5 / 25.0 <= 2.5) {
    return self->super.mPhaseInDuration + self->super.mMainDuration + self->super.mPhaseOutDuration;
  }
  -[MREffectPictureFrames _xForSlideAtIndex:layoutWidth:](self, "_xForSlideAtIndex:layoutWidth:", a3, &v11);
  double mMainDuration = self->super.mMainDuration;
  double v9 = (v7 + -1.0) / (v6 + -2.0) * mMainDuration;
  if (v9 < 0.0) {
    double v9 = 0.0;
  }
  return self->super.mPhaseInDuration + mMainDuration * ((v7 + 2.0 + v11) / (v6 + -2.0)) - v9;
}

- (double)displayTimeForSlideAtIndex:(unint64_t)a3
{
  double v6 = v5 / 25.0;
  if (v5 / 25.0 <= 2.5) {
    return self->super.mPhaseInDuration;
  }
  -[MREffectPictureFrames _xForSlideAtIndex:layoutWidth:](self, "_xForSlideAtIndex:layoutWidth:", a3, v10);
  double v8 = (v7 + -0.5) / (v6 + -2.0) * self->super.mMainDuration;
  if (v8 < 0.0) {
    double v8 = 0.0;
  }
  return self->super.mPhaseInDuration + v8;
}

- (double)displayTimeForTextAtIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)lowestDisplayTime
{
  return 0.0;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v132 = v8;
  double v130 = *(double *)((char *)&self->mTotalWidth + 1);
  unsigned int v136 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"hasShelf"),  "BOOLValue");
  unsigned int v125 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"turnsCorner"),  "BOOLValue");
  id v124 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"previousAttributes");
  unsigned __int8 v123 = objc_msgSend(objc_msgSend(v124, "objectForKey:", @"hasShelf"), "BOOLValue");
  double mPhaseInDuration = self->super.mPhaseInDuration;
  double v134 = 0.0;
  if (mPhaseInDuration <= a3)
  {
    double mMainDuration = self->super.mMainDuration;
    if (mPhaseInDuration + mMainDuration <= a3)
    {
      double v16 = *(double *)((char *)&self->mLayoutWidths + 1);
      double v17 = v16 + -2.0;
      BOOL v33 = v16 < 2.0;
      double v18 = 0.0;
      if (!v33) {
        double v18 = v17;
      }
      double v15 = -v18;
    }

    else
    {
      double v11 = -(a3 - mPhaseInDuration) / mMainDuration;
      double v12 = *(double *)((char *)&self->mLayoutWidths + 1);
      double v13 = v12 + -2.0;
      BOOL v33 = v12 < 2.0;
      double v14 = 0.0;
      if (!v33) {
        double v14 = v13;
      }
      double v15 = v11 * v14;
    }

    double v134 = v15;
  }

  [*(id *)((char *)&self->mFrameSprite + 1) imageAspectRatio];
  double v20 = v19 + v19;
  [a4 localAspectRatio];
  double v22 = v20 / v21;
  double v23 = *(double *)((char *)&self->mLayoutWidths + 1);
  if (v23 < 2.0) {
    double v23 = 2.0;
  }
  float v24 = v23 / v22;
  uint64_t v25 = vcvtps_s32_f32(v24);
  id v26 = [*(id *)((char *)&self->mFrameSprite + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [v26 setClampMode:2];
  if (v25 >= 1)
  {
    for (uint64_t i = 0LL; i != v25; ++i)
    {
      id v29 = [*(id *)((char *)&self->mTableProviders + 1) objectAtIndex:i];
      double v30 = v134 + v22 * 0.5 + -1.0 + (double)i * v22;
      double v31 = v30 + v22 * 0.5;
      double v32 = v30 + -v22 * 0.5;
      BOOL v33 = v31 > -1.0 && v32 < 1.0;
      if (v33)
      {
        double v34 = v29;
        MRMatrix_Clear((uint64_t)v149);
        float v28 = v134;
        *(float *)&double v35 = MRMatrix_Translate(v149, v28, 0.0, 0.0);
        objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v149, v150, v35);
        [v34 renderImage:v26 inContext:a4];
        [a4 restoreModelViewMatrix:v150];
      }
    }
  }

  id v138 = a4;
  [v26 releaseByUser];
  objc_msgSend(*(id *)((char *)&self->mFrameProviders + 1), "setOuterRect:", 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(*(id *)((char *)&self->mFrameProviders + 1), "setInnerRect:", 0.0, 0.0, 1.0, 0.600000024);
  if (!v136) {
    goto LABEL_38;
  }
  objc_msgSend(objc_msgSend(*(id *)((char *)&self->mGradientProvider + 1), "objectAtIndex:", 0), "imageAspectRatio");
  double v37 = v36 * 0.25;
  [a4 localAspectRatio];
  double v39 = v37 / v38;
  double v40 = *(double *)((char *)&self->mLayoutWidths + 1);
  if (v40 < 2.0) {
    double v40 = 2.0;
  }
  float v41 = v40 / v39;
  uint64_t v42 = vcvtps_s32_f32(v41);
  if (v42 >= 1)
  {
    float v43 = 0LL;
    int v44 = 0LL;
    uint64_t v45 = 0LL;
    double v46 = 1.0;
    do
    {
      double v47 = v134 + v39 * 0.5 + -1.0 + (double)v45 * v39;
      if (v47 + v39 * 0.5 > -1.0 && v47 + -v39 * 0.5 < v46)
      {
        id v49 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mGradientProvider + 1), "objectAtIndex:", v45 & 1),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  v138,  a5,  a3);
        [v49 setClampMode:2];
        LODWORD(v50) = 0;
        objc_msgSend( *(id *)((char *)&self->mFrameProviders + 1),  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v49,  v138,  v47,  -0.875,  v39,  0.25,  v50);
        double v51 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameRenderable);
        -[MRPictureFrameRenderable setImage:](v51, "setImage:", [v49 insertingInCollection]);
        v51->rect.origin.CGFloat x = v47;
        v51->rect.origin.CGFloat y = -0.875;
        v51->rect.size.CGFloat width = v39;
        v51->rect.size.CGFloat height = 0.25;
        -[MRPictureFrameRenderable setWhere:](v51, "setWhere:", @"outer");
        __int128 v52 = v51;
        if (v43)
        {
          v44->next = v51;
          __int128 v52 = v43;
        }

        v51->next = 0LL;
        [v49 releaseByUser];
        float v43 = v52;
        int v44 = v51;
        double v46 = 1.0;
      }

      ++v45;
    }

    while (v42 != v45);
    id v53 = v138;
    [v138 blend:2];
    if (v43)
    {
      do
      {
        uint64_t v54 = -[MRPictureFrameRenderable image](v43, "image");
        LODWORD(v55) = 0;
        objc_msgSend( *(id *)((char *)&self->mFrameProviders + 1),  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v54,  v138,  v43->rect.origin.x,  v43->rect.origin.y,  v43->rect.size.width,  v43->rect.size.height,  v55);
        -[MRImage removingFromCollection](v54, "removingFromCollection");
        next = v43->next;

        float v43 = next;
      }

      while (next);
    }
  }

  else
  {
LABEL_38:
    id v53 = a4;
    [a4 blend:2];
  }

  if (v125)
  {
    double v57 = *(double *)((char *)&self->mLayoutWidths + 1);
    double v58 = v57 + -1.0 + -0.109999999;
    BOOL v33 = v57 < 2.0;
    double v59 = 0.890000001;
    if (!v33) {
      double v59 = v58;
    }
    double v60 = v134 + v59;
    double v61 = v134 + v59 + -0.109999999;
    if (v134 + v59 + 0.109999999 > -1.0 && v61 < 1.0)
    {
      id v63 = objc_msgSend( *(id *)((char *)&self->mFrameSprite + 1),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  v53,  a5,  a3,  -1.0,  v61);
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v63,  v53,  v60,  0.0,  v22,  2.0);
      [v63 releaseByUser];
      id v64 = [*(id *)((char *)&self->mWallProvider + 1) retainedByUserRenderedImageAtTime:v53 inContext:a5 withArguments:a3];
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v64,  v53,  v60,  0.0,  0.219999999,  2.0);
      [v64 releaseByUser];
    }
  }

  [v53 blend:0];
  double v65 = *(double *)&v132 + v130 + v134 + -1.0;
  __int128 v145 = 0u;
  __int128 v146 = 0u;
  __int128 v143 = 0u;
  __int128 v144 = 0u;
  id obj = *(id *)(&self->mIsLoaded + 1);
  id v128 = [obj countByEnumeratingWithState:&v143 objects:v148 count:16];
  double v122 = v65;
  if (v128)
  {
    uint64_t v66 = 0LL;
    uint64_t v67 = 0LL;
    CGRect v68 = 0LL;
    uint64_t v135 = 0LL;
    uint64_t v127 = *(void *)v144;
    do
    {
      uint64_t v69 = 0LL;
      do
      {
        if (*(void *)v144 != v127) {
          objc_enumerationMutation(obj);
        }
        uint64_t v129 = v69;
        id v70 = [(id)qword_2B05F0 objectForKey:*(void *)(*((void *)&v143 + 1) + 8 * v69)];
        uint64_t v131 = v66;
        objc_msgSend(objc_msgSend(*(id *)((char *)&self->mWallSprites + 1), "objectAtIndex:", v66), "floatValue");
        double v72 = v71;
        id v73 = [v70 objectForKey:@"frames"];
        __int128 v139 = 0u;
        __int128 v140 = 0u;
        __int128 v141 = 0u;
        __int128 v142 = 0u;
        id v133 = v73;
        id v74 = [v73 countByEnumeratingWithState:&v139 objects:v147 count:16];
        if (v74)
        {
          id v75 = v74;
          uint64_t v76 = *(void *)v140;
          do
          {
            for (unint64_t j = 0LL; j != v75; unint64_t j = (char *)j + 1)
            {
              if (*(void *)v140 != v76) {
                objc_enumerationMutation(v133);
              }
              uint64_t v78 = *(void *)(*((void *)&v139 + 1) + 8LL * (void)j);
              uint64_t v79 = *(unsigned __int8 *)(v78 + 72);
              id v80 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mFrames + 1), "objectAtIndex:", v67),  "integerValue");
              id v81 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int64_t)v80));
              -[MREffectPictureFrames _frameRectFromInfo:onShelf:](self, "_frameRectFromInfo:onShelf:", v78, v136);
              id v53 = v138;
              __int128 v86 = -[MREffectPictureFrames _drawFrame:provider:index:rect:time:onTable:inContext:withArguments:]( self,  "_drawFrame:provider:index:rect:time:onTable:inContext:withArguments:",  [*(id *)((char *)&self->mLayouts + 1) objectAtIndex:v67],  v81,  v80,  v79,  v138,  a5,  v65 + v82 * v72,  v83,  v84,  v85,  a3);
              if (v86)
              {
                if (v135)
                {
                  v68[17] = v86;
                  do
                  {
                    CGRect v68 = v86;
                    __int128 v86 = (void *)v86[17];
                  }

                  while (v86);
                }

                else
                {
                  __int128 v87 = v86;
                  do
                  {
                    CGRect v68 = v87;
                    __int128 v87 = (void *)v87[17];
                  }

                  while (v87);
                  uint64_t v135 = (double *)v86;
                }
              }

              ++v67;
            }

            id v75 = [v133 countByEnumeratingWithState:&v139 objects:v147 count:16];
          }

          while (v75);
        }

        double v65 = v65 + v72 + 0.0500000007;
        uint64_t v66 = v131 + 1;
        uint64_t v69 = v129 + 1;
      }

      while ((id)(v129 + 1) != v128);
      id v128 = [obj countByEnumeratingWithState:&v143 objects:v148 count:16];
    }

    while (v128);
  }

  else
  {
    CGRect v68 = 0LL;
    uint64_t v135 = 0LL;
  }

  char v88 = v136 ^ 1;
  if (!v124) {
    char v88 = 1;
  }
  if (((v123 & 1) != 0 || (v88 & 1) == 0)
    && -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count") >= 5)
  {
    __int128 v89 = (char *)-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "count")
        - 1;
    id v90 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int64_t)v89));
    uint64_t v91 = *(uint64_t *)((char *)&self->mAspectRatios + 1);
    if (v91)
    {
      uint64_t v92 = v90;
      [v53 localAspectRatio];
      double v94 = v93;
      [v92 imageAspectRatio];
      -[MREffectPictureFrames _rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:]( self,  "_rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:",  v91,  0LL,  0.5,  0.100000001,  0.899999976,  0.899999976,  v94,  v95);
      __int128 v97 = -[MREffectPictureFrames _drawFrame:provider:index:rect:time:onTable:inContext:withArguments:]( self,  "_drawFrame:provider:index:rect:time:onTable:inContext:withArguments:",  *(NSMutableArray **)((char *)&self->mAspectRatios + 1),  v92,  v89,  0LL,  v53,  a5,  v122 + v96 * -0.5 + -0.0500000007,  0.100000001,  0.899999976,  0.899999976,  a3);
      if (v97)
      {
        if (v135)
        {
          v68[17] = v97;
          do
          {
            CGRect v68 = v97;
            __int128 v97 = (void *)v97[17];
          }

          while (v97);
        }

        else
        {
          float v120 = v97;
          do
          {
            CGRect v68 = v120;
            float v120 = (void *)v120[17];
          }

          while (v120);
          uint64_t v135 = (double *)v97;
        }
      }
    }
  }

  if ((v136 | v125 ^ 1) != 1) {
    goto LABEL_89;
  }
  if (-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count") < 5) {
    goto LABEL_89;
  }
  id v98 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(0LL));
  uint64_t v99 = *(uint64_t *)((char *)&self->mFirstFrame + 1);
  if (!v99) {
    goto LABEL_89;
  }
  __int128 v100 = v98;
  [v53 localAspectRatio];
  double v102 = v101;
  [v100 imageAspectRatio];
  -[MREffectPictureFrames _rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:]( self,  "_rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:",  v99,  0LL,  0.5,  0.100000001,  0.899999976,  0.899999976,  v102,  v103);
  double v105 = -[MREffectPictureFrames _drawFrame:provider:index:rect:time:onTable:inContext:withArguments:]( self,  "_drawFrame:provider:index:rect:time:onTable:inContext:withArguments:",  *(NSString **)((char *)&self->mFirstFrame + 1),  v100,  0LL,  0LL,  v53,  a5,  v65 + v104 * 0.5,  0.100000001,  0.899999976,  0.899999976,  a3);
  if (!v105) {
    goto LABEL_89;
  }
  if (v135)
  {
    v68[17] = v105;
    do
      double v105 = (void *)v105[17];
    while (v105);
LABEL_89:
    id v106 = v135;
    goto LABEL_90;
  }

  v105[17] = 0LL;
  double v121 = v105;
  do
    double v121 = (void *)v121[17];
  while (v121);
  id v106 = (double *)v105;
LABEL_90:
  [v53 blend:2];
  if (v106)
  {
    do
    {
      id v107 = [v106 image];
      double v109 = v106[3];
      double v108 = v106[4];
      double v111 = v106[5];
      double v110 = v106[6];
      id v112 = [v106 where];
      int v113 = *((unsigned __int8 *)v106 + 128);
      if (*((_BYTE *)v106 + 128)) {
        [v138 blend:0];
      }
      objc_msgSend(*(id *)((char *)&self->mFrameProviders + 1), "setInnerRect:", v106[7], v106[8], v106[9], v106[10]);
      objc_msgSend(*(id *)((char *)&self->mFrameProviders + 1), "setOuterRect:", v106[11], v106[12], v106[13], v106[14]);
      if ([v112 isEqualToString:@"inner"])
      {
        LODWORD(v114) = 0;
        objc_msgSend( *(id *)((char *)&self->mFrameProviders + 1),  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v107,  v138,  v109,  v108,  v111,  v110,  v114);
      }

      else if ([v112 isEqualToString:@"middle"])
      {
        LODWORD(v115) = 0;
        objc_msgSend( *(id *)((char *)&self->mFrameProviders + 1),  "renderImageMiddle:inContext:atPosition:andSize:zRotation:",  v107,  v138,  v109,  v108,  v111,  v110,  v115);
      }

      else
      {
        unsigned int v116 = [v112 isEqualToString:@"outer"];
        double v117 = *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1);
        LODWORD(v118) = 0;
        if (v116) {
          objc_msgSend( v117,  "renderImageOuter:inContext:atPosition:andSize:zRotation:",  v107,  v138,  v109,  v108,  v111,  v110,  v118);
        }
        else {
          objc_msgSend( v117,  "renderImage:inContext:atPosition:andSize:zRotation:",  v107,  v138,  v109,  v108,  v111,  v110,  v118);
        }
      }

      if (v113) {
        [v138 blend:2];
      }
      [v107 removingFromCollection];
      double v119 = (double *)*((void *)v106 + 17);

      id v106 = v119;
    }

    while (v119);
  }

  [v138 blend:0];
  [v138 unsetShader];
}

- (double)_nextSlideProviderAspectRatioToFitInAspectRatio:(id)a3 providerKeys:(id)a4 slideInformation:(id)a5 index:(int64_t *)a6 force:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = [a4 firstIndex];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v12 = -1LL;
  }

  else
  {
    unint64_t v12 = (unint64_t)v11;
    while (1)
    {
      if (a5)
      {
        id v13 = [a5 count];
        LODWORD(v14) = -1.0;
        if (v12 < (unint64_t)v13) {
          objc_msgSend( objc_msgSend(objc_msgSend(a5, "objectAtIndex:", v12, v14), "objectForKey:", @"aspectRatio"),  "floatValue");
        }
        double v15 = *(float *)&v14;
      }

      else
      {
        -[MREffectPictureFrames _aspectRatioForSlideIndex:](self, "_aspectRatioForSlideIndex:", v12);
        double v15 = v16;
      }

      if ([a3 isEqualToString:@"vBreak"] && v15 < 0.5
        || [a3 isEqualToString:@"hBreak"] && v15 > 2.0)
      {
        break;
      }

      BOOL v17 = v15 < 0.5;
      unsigned int v18 = [a3 isEqualToString:@"landscape"];
      if (v15 > 2.0) {
        BOOL v17 = 1;
      }
      if (v18 && v15 >= 1.0 && !v17) {
        break;
      }
      unsigned int v19 = [a3 isEqualToString:@"portrait"] ^ 1;
      if (v15 >= 1.0) {
        unsigned int v19 = 1;
      }
      if ((v19 | v17) != 1) {
        break;
      }
      unint64_t v12 = (unint64_t)[a4 indexGreaterThanIndex:v12];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v12 = -1LL;
        break;
      }
    }
  }

  double v20 = -1.0;
  if (v12 == -1LL && !v7) {
    return v20;
  }
  if (v12 == -1LL)
  {
    id v21 = [a4 firstIndex];
    if (v21 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v12 = -1LL;
    }

    else
    {
      do
      {
        unint64_t v12 = (unint64_t)v21;
        if (a5)
        {
          id v24 = [a5 count];
          LODWORD(v25) = -1.0;
          if (v12 < (unint64_t)v24) {
            objc_msgSend( objc_msgSend(objc_msgSend(a5, "objectAtIndex:", v12, v25), "objectForKey:", @"aspectRatio"),  "floatValue");
          }
          double v26 = *(float *)&v25;
        }

        else
        {
          -[MREffectPictureFrames _aspectRatioForSlideIndex:](self, "_aspectRatioForSlideIndex:", v21);
          double v26 = v27;
        }

        id v21 = [a4 indexGreaterThanIndex:v12];
      }

      while (v21 != (id)0x7FFFFFFFFFFFFFFFLL);
    }
  }

  *a6 = v12;
  [a4 removeIndex:v12];
  if (a5)
  {
    if (v12 < (unint64_t)[a5 count])
    {
      objc_msgSend( objc_msgSend(objc_msgSend(a5, "objectAtIndex:", v12), "objectForKey:", @"aspectRatio"),  "floatValue");
      return v22;
    }

    return v20;
  }

  -[MREffectPictureFrames _aspectRatioForSlideIndex:](self, "_aspectRatioForSlideIndex:", v12);
  return result;
}

- (id)_randomFrameForAspectRatio:(id)a3 forTable:(BOOL)a4 allowMatte:(BOOL)a5 onlyLoaded:(BOOL)a6 ignoreFrames:(id)a7 randomGenerator:(id)a8
{
  BOOL v9 = a6;
  BOOL v30 = a4;
  double v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v11 = (void *)qword_2B05F8;
  id v12 = [(id)qword_2B05F8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        if ((!v9
           || [*(id *)((char *)&self->mSprites + 1) objectForKey:*(void *)(*((void *)&v31 + 1) + 8 * (void)i)])
          && ([a7 containsObject:v16] & 1) == 0)
        {
          BOOL v17 = (double *)[(id)qword_2B05F8 objectForKey:v16];
          double v18 = v17[9];
          double v19 = v17[10];
          HasPrefiCGFloat x = NSStringHasPrefix(v16, "table");
          BOOL v21 = NSStringHasPrefix(v16, "break-") || HasPrefix && !v30;
          BOOL v22 = v21 || !HasPrefix && v30;
          if (!v22 && (a5 || ([v16 hasSuffix:@"Matte"] & 1) == 0))
          {
            if ((double v23 = v18 / v19, [a3 isEqualToString:@"landscape"]) && v23 >= 1.0
              || [a3 isEqualToString:@"portrait"] && v23 < 1.0)
            {
              -[NSMutableArray addObject:](v27, "addObject:", v16);
            }
          }
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v13);
  }

  if (-[NSMutableArray count](v27, "count")) {
    id v24 = -[NSMutableArray objectAtIndex:]( v27,  "objectAtIndex:",  (unint64_t)[a8 randomInt] % (unint64_t)-[NSMutableArray count](v27, "count"));
  }
  else {
    id v24 = 0LL;
  }

  return v24;
}

- (CGRect)_rectForFrameID:(id)a3 rect:(CGRect)a4 onTable:(BOOL)a5 aspectRatio:(double)a6 slideAspectRatio:(double)a7
{
  BOOL v9 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v15 = (double *)objc_msgSend((id)qword_2B05F8, "objectForKey:");
  CGFloat v16 = CGSizeZero.height;
  CGFloat v26 = y;
  CGFloat v28 = x;
  if ([a3 isEqualToString:@"breakH"])
  {
    double width = height * a7;
LABEL_6:
    double v17 = CGSizeZero.width;
    double v18 = v16;
    goto LABEL_8;
  }

  if ([a3 isEqualToString:@"breakV"])
  {
    double v17 = 2.0;
    double v18 = 2.0;
    if (a7 <= 0.400000006) {
      goto LABEL_8;
    }
    double width = width * 0.425000012;
    double height = width / a7;
    goto LABEL_6;
  }

  double v17 = v15[9];
  double v18 = v15[10];
LABEL_8:
  double v19 = height * a6;
  if ((objc_msgSend(a3, "hasPrefix:", @"break", *(void *)&v26) & 1) == 0)
  {
    double v20 = v17 / v18;
    if (width / v19 > 1.0 || v20 < 1.0) {
      double width = v20 / a6 * v19;
    }
    else {
      double v19 = v19 / v20;
    }
  }

  double v23 = v27;
  double v22 = v28;
  if (v9) {
    double v23 = v27 / (1.77777779 / a6) + (1.77777779 - a6) * -0.5;
  }
  double v24 = width;
  double v25 = v19;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)_drawBreakFrame:(id)a3 provider:(id)a4 index:(int64_t)a5 rect:(CGRect)a6 time:(double)a7 inContext:(id)a8 withArguments:(id)a9
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  [a8 localAspectRatio];
  double v21 = v20;
  [a4 imageAspectRatio];
  -[MREffectPictureFrames _rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:]( self,  "_rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:",  a3,  0LL,  x,  y,  width,  height,  v21,  v22);
  double v26 = v23;
  double v28 = v27;
  if (v23 + v24 * 0.5 > -1.0 && v23 + v24 * -0.5 < 1.0)
  {
    double v30 = v24;
    double v31 = v25;
    id v32 = [a4 retainedByUserRenderedImageAtTime:a8 inContext:a9 withArguments:a7];
    __int128 v33 = *(void **)(&self->super._isInInteractiveMode + 1);
    __int128 v34 = ImageKey(a5);
    double v35 = (MRCroppingSprite *)[v33 objectForKey:v34];
    if (!v35)
    {
      double v35 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v33 setObject:v35 forKey:v34];
    }

    if (![a3 isEqualToString:@"breakV"])
    {
LABEL_13:
      [v32 releaseByUser];
      return;
    }

    [v32 aspectRatio];
    double v37 = v36;
    if (v36 > 0.400000006)
    {
LABEL_11:
      [a8 localAspectRatio];
      LODWORD(v39) = 0;
      -[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( v35,  "renderImage:inContext:atPosition:andSize:zRotation:",  v32,  a8,  v26,  v28,  v30 * (1.0 - 0.05 / v30),  v31 * (1.0 - v38 * 0.05 / v31),  v39);
      [a8 blend:2];
    }

    else
    {
      double v30 = v30 * 0.425000012;
      double v40 = v31 * 0.899999976;
      [a8 localAspectRatio];
      double v42 = v40 * (1.0 - v41 * 0.05 / v40);
      if (v31 * 0.899999976 * 0.5 >= 0.75) {
        double v43 = 0.0;
      }
      else {
        double v43 = (1.0 - v40 * 0.5) * 0.5;
      }
      double v46 = v26 - v30 * 0.5 + -0.0250000004;
      double v47 = v28 + v31 * 0.5 - v40 * 0.5 + -0.0199999996 - v43;
      double v26 = v26 + v30 * 0.5 + 0.0250000004;
      double v28 = v28 - v31 * 0.5 + v40 * 0.5 + 0.0199999996 + v43;
      float v44 = v37;
      -[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v35,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v32,  a8);
      *(float *)&double v45 = v44;
      -[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v35,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v32,  a8,  v26,  v28,  v30 * (1.0 - 0.05 / v30),  v42,  v45,  0.0,  3.0);
      [a8 blend:2];
      -[MREffectPictureFrames _drawBreakFrameInRect:frameWidth:time:inContext:withArguments:]( self,  "_drawBreakFrameInRect:frameWidth:time:inContext:withArguments:",  a8,  a9,  v46,  v47,  v30,  v40,  0.075000003,  a7);
      double v31 = v40;
    }

    -[MREffectPictureFrames _drawBreakFrameInRect:frameWidth:time:inContext:withArguments:]( self,  "_drawBreakFrameInRect:frameWidth:time:inContext:withArguments:",  a8,  a9,  v26,  v28,  v30,  v31,  0.075000003,  a7);
    [a8 blend:0];
    goto LABEL_13;
  }

- (void)_drawBreakFrameInRect:(CGRect)a3 frameWidth:(double)a4 time:(double)a5 inContext:(id)a6 withArguments:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [a6 localAspectRatio];
  double v16 = v15 * a4;
  double v17 = self->super.mPixelSize.width;
  if (v17 >= 512.0) {
    double v18 = @"break-slice_01";
  }
  else {
    double v18 = @"break-slice_01-small";
  }
  if (v17 >= 512.0) {
    double v19 = @"break-slice_03";
  }
  else {
    double v19 = @"break-slice_03-small";
  }
  if (v17 >= 512.0) {
    float v20 = @"break-slice_05";
  }
  else {
    float v20 = @"break-slice_05-small";
  }
  if (v17 >= 512.0) {
    double v21 = @"break-slice_07";
  }
  else {
    double v21 = @"break-slice_07-small";
  }
  if (v17 >= 512.0) {
    double v22 = @"break-slice_02";
  }
  else {
    double v22 = @"break-slice_02-small";
  }
  if (v17 >= 512.0) {
    double v23 = @"break-slice_06";
  }
  else {
    double v23 = @"break-slice_06-small";
  }
  double v24 = @"break-slice_04";
  if (v17 < 512.0) {
    double v24 = @"break-slice_04-small";
  }
  double v43 = v23;
  float v44 = v24;
  double v25 = @"break-slice_08-small";
  if (v17 >= 512.0) {
    double v25 = @"break-slice_08";
  }
  double v45 = v25;
  id v26 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", v18),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  double v40 = width;
  double v41 = x;
  double v27 = x;
  double v46 = x - width * 0.5 + a4 * 0.5;
  double v28 = y + height * 0.5 - v16 * 0.5;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v26,  a6);
  [v26 releaseByUser];
  id v29 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", v19),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  double v42 = v27 + width * 0.5 - a4 * 0.5;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v29,  a6,  v42,  v28,  a4,  v16);
  [v29 releaseByUser];
  double v30 = a5;
  id v31 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", v20),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  double v32 = y - height * 0.5 + v16 * 0.5;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v31,  a6,  v42,  v32,  a4,  v16);
  [v31 releaseByUser];
  id v33 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", v21),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  v30);
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v33,  a6,  v46,  v32,  a4,  v16);
  [v33 releaseByUser];
  double v34 = v40 - a4 * 2.0;
  id v35 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", v22),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  v30);
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v35,  a6,  v41,  v28,  v34,  v16);
  [v35 releaseByUser];
  id v36 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", v43),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  v30);
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v36,  a6,  v41,  v32,  v34,  v16);
  [v36 releaseByUser];
  double v37 = height - v16 * 2.0;
  id v38 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", v44),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  v30);
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v38,  a6,  v42,  y,  a4,  v37);
  [v38 releaseByUser];
  id v39 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", v45),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  v30);
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v39,  a6,  v46,  y,  a4,  v37);
  [v39 releaseByUser];
}

- (id)_drawFrame:(id)a3 provider:(id)a4 index:(int64_t)a5 rect:(CGRect)a6 time:(double)a7 onTable:(BOOL)a8 inContext:(id)a9 withArguments:(id)a10
{
  BOOL v12 = a8;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  if ([a3 hasPrefix:@"break"])
  {
    -[MREffectPictureFrames _drawBreakFrame:provider:index:rect:time:inContext:withArguments:]( self,  "_drawBreakFrame:provider:index:rect:time:inContext:withArguments:",  a3,  a4,  a5,  a9,  a10,  x,  y,  width,  height,  a7);
    return 0LL;
  }

  if (x + width * 0.5 <= -1.0 || x + width * -0.5 >= 1.0) {
    return 0LL;
  }
  id v22 = [a4 retainedByUserRenderedImageAtTime:a9 inContext:a10 withArguments:a7];
  [a9 localAspectRatio];
  double v24 = v23;
  [v22 aspectRatio];
  -[MREffectPictureFrames _rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:]( self,  "_rectForFrameID:rect:onTable:aspectRatio:slideAspectRatio:",  a3,  v12,  x,  y,  width,  height,  v24,  v25);
  double v27 = v26;
  double v53 = v28;
  double v30 = v29;
  double v32 = v31;
  id v33 = *(void **)(&self->super._isInInteractiveMode + 1);
  double v34 = ImageKey(a5);
  id v35 = (MRCroppingSprite *)[v33 objectForKey:v34];
  if (!v35)
  {
    id v35 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v33 setObject:v35 forKey:v34];
  }

  id v36 = (double *)[(id)qword_2B05F8 objectForKey:a3];
  double v37 = v36[5];
  double v38 = v36[6];
  double v39 = v36[7];
  CGFloat v49 = v36[2];
  CGFloat v50 = v36[1];
  CGFloat v51 = v36[4];
  CGFloat v52 = v36[3];
  double v40 = 0.5;
  double v41 = v27 + (v37 - (1.0 - (v37 + v39))) * 0.5;
  double v42 = v27;
  double v43 = v36[8];
  LODWORD(v40) = 0;
  -[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( v35,  "renderImage:inContext:atPosition:andSize:zRotation:",  v22,  a9,  v41,  v53 + (v38 - (1.0 - (v38 + v43))) * 0.5,  v30 * v39 * 1.02999997,  v32 * v43 * 1.02999997,  v40);
  [v22 releaseByUser];
  id v44 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", a3),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a9,  a10,  a7);
  double v45 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameRenderable);
  -[MRPictureFrameRenderable setImage:](v45, "setImage:", [v44 insertingInCollection]);
  v54.origin.double x = v37;
  v54.origin.double y = v38;
  v54.size.double width = v39;
  v54.size.double height = v43;
  v45->innerRect = CGRectInset(v54, 0.0399999991, 0.0399999991);
  v55.origin.double x = v37;
  v55.origin.double y = v38;
  v55.size.double width = v39;
  v55.size.double height = v43;
  v45->outerRect = CGRectInset(v55, -0.0199999996, -0.0199999996);
  v45->rect.origin.double x = v42;
  v45->rect.origin.double y = v53;
  v45->rect.size.double width = v30;
  v45->rect.size.double height = v32;
  -[MRPictureFrameRenderable setWhere:](v45, "setWhere:", @"middle");
  v45->next = 0LL;
  double v46 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameRenderable);
  v45->next = v46;
  -[MRPictureFrameRenderable setImage:](v46, "setImage:", [v44 insertingInCollection]);
  v56.origin.double x = v37;
  v56.origin.double y = v38;
  v56.size.double width = v39;
  v56.size.double height = v43;
  v46->innerRect = CGRectInset(v56, -0.0199999996, -0.0199999996);
  v57.origin.double x = v50;
  v57.origin.double y = v49;
  v57.size.double height = v51;
  v57.size.double width = v52;
  v46->outerRect = CGRectInset(v57, 0.00999999978, 0.00999999978);
  v46->rect.origin.double x = v42;
  v46->rect.origin.double y = v53;
  v46->rect.size.double width = v30;
  v46->rect.size.double height = v32;
  -[MRPictureFrameRenderable setWhere:](v46, "setWhere:", @"outer");
  double v47 = objc_alloc_init(&OBJC_CLASS___MRPictureFrameRenderable);
  v46->next = v47;
  -[MRPictureFrameRenderable setImage:](v47, "setImage:", [v44 insertingInCollection]);
  v58.origin.double x = v37;
  v58.size.double width = v39;
  v58.origin.double y = v38;
  v58.size.double height = v43;
  v47->innerRect = CGRectInset(v58, -0.0199999996, -0.0199999996);
  v59.origin.double x = v50;
  v59.origin.double y = v49;
  v59.size.double height = v51;
  v59.size.double width = v52;
  v47->outerRect = CGRectInset(v59, 0.00999999978, 0.00999999978);
  v47->rect.origin.double x = v42;
  v47->rect.origin.double y = v53;
  v47->rect.size.double width = v30;
  v47->rect.size.double height = v32;
  -[MRPictureFrameRenderable setWhere:](v47, "setWhere:", @"middle");
  v47->ignoreBlend = 1;
  v47->next = 0LL;
  [v44 releaseByUser];
  return v45;
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v10 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    id v13 = 0LL;
    uint64_t v14 = *(void *)v22;
    while (1)
    {
      for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        double v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v17 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:v16];
        if (v17 && objc_msgSend(v17, "hitAtPoint:withInverseMatrix:localPoint:", a4, &v20, x, y))
        {
          if (!v13)
          {
            if (a5) {
LABEL_16:
            }
              *a5 = v20;
            id v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (char *)&dword_0 + 1)
          {
            id v13 = v16;
            BOOL v18 = a5 == 0LL;
          }

          else
          {
            BOOL v18 = 1;
          }

          if (!v18) {
            goto LABEL_16;
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v12) {
        return v13;
      }
    }
  }

  return 0LL;
}

- (BOOL)getVerticesCoordinates:(MREffectPictureFrames *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)_unload
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  double v3 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)((char *)&self->mSprites + 1) objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)i)];
        [v8 unload];
        [v8 cleanup];
      }

      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v5);
  }

  [*(id *)((char *)&self->mSprites + 1) removeAllObjects];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  BOOL v9 = *(MRImageProvider **)((char *)&self->mGradientProvider + 1);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (unint64_t j = 0LL; j != v11; unint64_t j = (char *)j + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)j) unload];
      }

      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }

    while (v11);
  }

  *(MRImageProvider **)((char *)&self->mGradientProvider + 1) = 0LL;
  [*(id *)((char *)&self->mFrameSprite + 1) unload];
  [*(id *)((char *)&self->mWallProvider + 1) unload];
  [*(id *)(&self->super._isInInteractiveMode + 1) removeAllObjects];
  [*(id *)((char *)&self->mTableProviders + 1) removeAllObjects];

  *(NSMutableArray **)((char *)&self->mFrames + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mWallSprites + 1) = 0LL;

  *(void *)(&self->mIsLoaded + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mLayouts + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mAspectRatios + 1) = 0LL;
  *(NSString **)((char *)&self->mFirstFrame + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mSlideOrder + 1) = 0LL;
  BYTE1(self->mXOffset) = 0;
}

@end