@interface MREffectScrapbook
+ (void)initialize;
- (BOOL)getCurrentCenter:(CGPoint *)a3 scale:(double *)a4 rotation:(double *)a5 isMain:(BOOL *)a6 forElement:(id)a7;
- (BOOL)getVerticesCoordinates:(MREffectScrapbook *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)isAlphaFriendly;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isOpaque;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (MREffectScrapbook)initWithEffectID:(id)a3;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_cleanup;
- (void)_drawBlendedFrame:(id)a3 info:(id)a4 index:(int64_t)a5 rect:(CGRect)a6 zIndex:(int64_t)a7 zRotation:(double)a8 subtract:(id)a9 time:(double)a10 inContext:(id)a11 withArguments:(id)a12;
- (void)_drawBreakFrame:(id)a3 index:(int64_t)a4 rect:(CGRect)a5 rotation:(double)a6 forcedAspectRatio:(double)a7 layout:(id)a8 offset:(CGSize)a9 time:(double)a10 inContext:(id)a11 withArguments:(id)a12;
- (void)_drawBreakFrameInRect:(CGRect)a3 frameWidth:(double)a4 time:(double)a5 inContext:(id)a6 withArguments:(id)a7;
- (void)_drawBreakTwoPartFrame:(id)a3 index:(int64_t)a4 rect:(CGRect)a5 rotation:(double)a6 forcedAspectRatio:(double)a7 time:(double)a8 inContext:(id)a9 withArguments:(id)a10;
- (void)_drawFrame:(id)a3 info:(id)a4 index:(int64_t)a5 rect:(CGRect)a6 zIndex:(int64_t)a7 zRotation:(double)a8 subtract:(id)a9 time:(double)a10 inContext:(id)a11 withArguments:(id)a12;
- (void)_drawFrame:(id)a3 info:(id)a4 rect:(CGRect)a5 stretch:(BOOL)a6 zIndex:(int64_t)a7 zRotation:(double)a8 subtract:(id)a9 key:(id)a10 time:(double)a11 inContext:(id)a12 withArguments:(id)a13;
- (void)_drawLandscapePanoBackgroundInRect:(CGRect)a3 paperType:(id)a4 subtract:(id)a5 inTime:(double)a6 inContext:(id)a7 withArguments:(id)a8;
- (void)_drawMask:(id)a3 index:(int64_t)a4 rect:(CGRect)a5 zIndex:(int64_t)a6 zRotation:(double)a7 subtract:(id)a8 time:(double)a9 inContext:(id)a10 withArguments:(id)a11;
- (void)_drawPortraitPanoBackgroundInRect:(CGRect)a3 flippedRect:(CGRect)a4 paperType:(id)a5 subtract:(id)a6 inTime:(double)a7 inContext:(id)a8 withArguments:(id)a9;
- (void)_drawTextWithInfo:(id)a3 rect:(CGRect)a4 zIndex:(int64_t)a5 zRotation:(double)a6 time:(double)a7 inContext:(id)a8 withArguments:(id)a9;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_unload;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectScrapbook

+ (void)initialize
{
  v107.receiver = a1;
  v107.super_class = (Class)&OBJC_METACLASS___MREffectScrapbook;
  objc_msgSendSuper2(&v107, "initialize");
  if (!qword_2B05B0)
  {
    objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; /* image */ \n\t\tDeclareTexture1; /* frame */ \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 imageColor = SampleTexture0; \n\t\t\tDoFilter0(imageColor); \n\t\t\tlowp vec4 frameColor = SampleTexture1; \n\t\t\tgl_FragColor = uColor * vec4(vec3(frameColor.rgb + imageColor.rgb * (1. - frameColor.a)), 1.); \n\t\t} \n\t\t",
      @"VertexTexture01",
      @"FrameWithMask");
    v2 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "resourcePathForStyleID:",  @"Scrapbook"),  "stringByAppendingPathComponent:",  @"MREffectScrapbook.plist"));
    if (v2) {
      id v3 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v2,  2LL,  0LL,  0LL);
    }
    else {
      id v3 = 0LL;
    }
    v93 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    id v95 = [v3 countByEnumeratingWithState:&v103 objects:v109 count:16];
    if (v95)
    {
      uint64_t v90 = *(void *)v104;
      v92 = v3;
      do
      {
        uint64_t v4 = 0LL;
        do
        {
          if (*(void *)v104 != v90) {
            objc_enumerationMutation(v3);
          }
          uint64_t v97 = v4;
          uint64_t v96 = *(void *)(*((void *)&v103 + 1) + 8 * v4);
          id v5 = objc_msgSend(v3, "objectForKey:");
          id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
          __int128 v99 = 0u;
          __int128 v100 = 0u;
          __int128 v101 = 0u;
          __int128 v102 = 0u;
          id v7 = [v5 countByEnumeratingWithState:&v99 objects:v108 count:16];
          if (v7)
          {
            id v8 = v7;
            uint64_t v9 = *(void *)v100;
            do
            {
              for (i = 0LL; i != v8; i = (char *)i + 1)
              {
                if (*(void *)v100 != v9) {
                  objc_enumerationMutation(v5);
                }
                v11 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)i);
                v12 = objc_alloc_init(&OBJC_CLASS___MRScrapbookLayout);
                v12->rect = CGRectFromString((NSString *)[v11 objectForKey:@"rect"]);
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"zRotation"), "floatValue");
                v12->zRotation = (float)(v13 * 0.017453);
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"startTime"), "doubleValue");
                v12->startTime = v14;
                v12->slideIndex = (int64_t)objc_msgSend( objc_msgSend(v11, "objectForKey:", @"slideIndex"),  "integerValue");
                v12->isText = objc_msgSend( objc_msgSend(v11, "objectForKey:", @"isText"),  "BOOLValue");
                v12->stretch = objc_msgSend( objc_msgSend(v11, "objectForKey:", @"stretch"),  "BOOLValue");
                v12->isBreak = objc_msgSend( objc_msgSend(v11, "objectForKey:", @"isBreak"),  "BOOLValue");
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"aspectRatio"), "floatValue");
                v12->aspectRatio = v15;
                -[MRScrapbookLayout setBackgroundPaper:]( v12,  "setBackgroundPaper:",  [v11 objectForKey:@"backgroundPaper"]);
                objc_msgSend(objc_msgSend(v11, "objectForKey:", @"twoPart"), "floatValue");
                v12->twoPart = v16 != 0.0;
                v12->moveIndex = (int64_t)objc_msgSend( objc_msgSend(v11, "objectForKey:", @"moveIndex"),  "integerValue");
                v12->paperRect = CGRectFromString((NSString *)[v11 objectForKey:@"paperRect"]);
                v12->drawCardIndex = (int64_t)objc_msgSend( objc_msgSend(v11, "objectForKey:", @"drawCardIndex"),  "integerValue");
                v12->skip = objc_msgSend( objc_msgSend(v11, "objectForKey:", @"skip"),  "BOOLValue");
                v12->move = objc_msgSend( objc_msgSend(v11, "objectForKey:", @"move"),  "BOOLValue");
                -[MRScrapbookLayout setFrame:](v12, "setFrame:", [v11 objectForKey:@"frame"]);
                -[MRScrapbookLayout setMask:](v12, "setMask:", [v11 objectForKey:@"mask"]);
                -[MRScrapbookLayout setSubtract:]( v12,  "setSubtract:",  [v11 objectForKey:@"subtract"]);
                [v6 addObject:v12];
              }

              id v8 = [v5 countByEnumeratingWithState:&v99 objects:v108 count:16];
            }

            while (v8);
          }

          -[NSMutableDictionary setObject:forKey:](v93, "setObject:forKey:", v6, v96);
          uint64_t v4 = v97 + 1;
          id v3 = v92;
        }

        while ((id)(v97 + 1) != v95);
        id v95 = [v92 countByEnumeratingWithState:&v103 objects:v109 count:16];
      }

      while (v95);
    }

    qword_2B05B0 = (uint64_t)v93;
  }

  if (!qword_2B05B8)
  {
    qword_2B05B8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v17 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v17->outer.origin = (CGPoint)xmmword_1F8110;
    v17->outer.size = (CGSize)xmmword_1F8120;
    v17->inner.origin = (CGPoint)xmmword_1F8130;
    v17->inner.size = (CGSize)xmmword_1F8140;
    v17->size = (CGSize)xmmword_1F8150;
    v17->scale = 1.03;
    [(id)qword_2B05B8 setObject:v17 forKey:@"square-frame"];

    v18 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v18->outer.origin = (CGPoint)xmmword_1F8160;
    v18->outer.size = (CGSize)xmmword_1F8170;
    v18->inner.origin = (CGPoint)xmmword_1F8180;
    v18->inner.size = (CGSize)xmmword_1F8190;
    v18->size = (CGSize)xmmword_1F81A0;
    v18->scale = 1.03;
    [(id)qword_2B05B8 setObject:v18 forKey:@"portrait-frame"];

    v19 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v19->outer.origin = (CGPoint)xmmword_1F81B0;
    v19->outer.size = (CGSize)xmmword_1F81C0;
    v19->inner.origin = (CGPoint)xmmword_1F8180;
    v19->inner.size = (CGSize)xmmword_1F8190;
    v19->size = (CGSize)xmmword_1F81A0;
    v19->scale = 1.03;
    [(id)qword_2B05B8 setObject:v19 forKey:@"portrait-frame-small"];

    v20 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v20->outer.origin.x = 0.0;
    v20->outer.origin.double y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }

    CGSize v98 = _Q0;
    v20->outer.size = _Q0;
    v20->inner.origin = (CGPoint)xmmword_1F81D0;
    v20->inner.size = (CGSize)xmmword_1F81E0;
    v20->size = (CGSize)xmmword_1F81F0;
    v20->scale = 1.03;
    [(id)qword_2B05B8 setObject:v20 forKey:@"torn-paper"];

    v26 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v26->outer.origin.x = 0.0;
    v26->outer.origin.double y = 0.0;
    v26->outer.size = v98;
    v26->inner.origin = (CGPoint)xmmword_1F8200;
    v26->inner.size = (CGSize)xmmword_1F8210;
    v26->size = (CGSize)xmmword_1F8220;
    v26->scale = 1.03;
    [(id)qword_2B05B8 setObject:v26 forKey:@"torn-paper-small"];

    v27 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v27->outer.origin.x = 0.0;
    v27->outer.origin.double y = 0.0;
    v27->outer.size = v98;
    v27->inner.origin = (CGPoint)xmmword_1F8230;
    v27->inner.size = (CGSize)xmmword_1F8240;
    v27->size = (CGSize)xmmword_1F8250;
    v27->scale = 1.03;
    [(id)qword_2B05B8 setObject:v27 forKey:@"torn-paper-01"];

    v28 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v28->outer.origin.x = 0.0;
    v28->outer.origin.double y = 0.0;
    v28->outer.size = v98;
    v28->inner.origin = (CGPoint)xmmword_1F8260;
    v28->inner.size = (CGSize)xmmword_1F8270;
    v28->size = (CGSize)xmmword_1F8280;
    v28->scale = 1.03;
    [(id)qword_2B05B8 setObject:v28 forKey:@"torn-paper-02"];

    v29 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v29->outer.origin.x = 0.0;
    v29->outer.origin.double y = 0.0;
    v29->outer.size = v98;
    v29->inner.origin = (CGPoint)xmmword_1F8260;
    v29->inner.size = (CGSize)xmmword_1F8240;
    v29->size = (CGSize)xmmword_1F8250;
    v29->scale = 1.03;
    [(id)qword_2B05B8 setObject:v29 forKey:@"torn-paper-03"];

    v30 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v30->outer.origin.x = 0.0;
    v30->outer.origin.double y = 0.0;
    v30->outer.size = v98;
    v30->inner.origin = (CGPoint)xmmword_1F8290;
    v30->inner.size = (CGSize)xmmword_1F82A0;
    v30->size = (CGSize)xmmword_1F82B0;
    v30->scale = 1.03;
    [(id)qword_2B05B8 setObject:v30 forKey:@"brown-paper-01"];

    v31 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v31->outer.origin.x = 0.0;
    v31->outer.origin.double y = 0.0;
    v31->outer.size = v98;
    v31->inner.origin = (CGPoint)xmmword_1F82C0;
    v31->inner.size = (CGSize)xmmword_1F82D0;
    v31->size = (CGSize)xmmword_1F82E0;
    v31->scale = 1.03;
    [(id)qword_2B05B8 setObject:v31 forKey:@"brown-paper-02"];

    v32 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v32->outer.origin.x = 0.0;
    v32->outer.origin.double y = 0.0;
    v32->outer.size = v98;
    v32->inner.origin = (CGPoint)xmmword_1F82C0;
    v32->inner.size = (CGSize)xmmword_1F82A0;
    v32->size = (CGSize)xmmword_1F82B0;
    v32->scale = 1.03;
    [(id)qword_2B05B8 setObject:v32 forKey:@"brown-paper-03"];

    v33 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v33->outer.origin = (CGPoint)xmmword_1F82F0;
    v33->outer.size = (CGSize)xmmword_1F8300;
    v33->inner.origin = (CGPoint)xmmword_1F8310;
    v33->inner.size = (CGSize)xmmword_1F8320;
    v33->size = (CGSize)xmmword_1F8330;
    v33->scale = 1.03;
    [(id)qword_2B05B8 setObject:v33 forKey:@"deckle-edge-frame"];

    v34 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v34->outer.origin = (CGPoint)xmmword_1F8340;
    v34->outer.size = (CGSize)xmmword_1F8350;
    v34->inner.origin = (CGPoint)xmmword_1F8360;
    v34->inner.size = (CGSize)xmmword_1F8370;
    v34->size = (CGSize)xmmword_1F8330;
    v34->scale = 1.03;
    [(id)qword_2B05B8 setObject:v34 forKey:@"deckle-edge-frame-small"];

    v35 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v35->outer.origin = (CGPoint)xmmword_1F8380;
    v35->outer.size = (CGSize)xmmword_1F8390;
    v35->inner.origin = (CGPoint)xmmword_1F83A0;
    v35->inner.size = (CGSize)xmmword_1F83B0;
    v35->size = (CGSize)xmmword_1F83C0;
    v35->scale = 1.03;
    [(id)qword_2B05B8 setObject:v35 forKey:@"deckle-edge-frame-portrait"];

    v36 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v36->outer.origin = (CGPoint)xmmword_1F83D0;
    v36->outer.size = (CGSize)xmmword_1F83E0;
    v36->inner.origin = (CGPoint)xmmword_1F83F0;
    v36->inner.size = (CGSize)xmmword_1F8400;
    v36->size = (CGSize)xmmword_1F8410;
    v36->scale = 1.05;
    [(id)qword_2B05B8 setObject:v36 forKey:@"rough-vignette"];

    v37 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v37->outer.origin = (CGPoint)xmmword_1F8420;
    v37->outer.size = (CGSize)xmmword_1F8430;
    v37->inner.origin = (CGPoint)xmmword_1F8440;
    v37->inner.size = (CGSize)xmmword_1F8450;
    v37->size = (CGSize)xmmword_1F8410;
    v37->scale = 1.03;
    [(id)qword_2B05B8 setObject:v37 forKey:@"rough-vignette-small"];

    v38 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v38->outer.origin = (CGPoint)xmmword_1F8460;
    v38->outer.size = (CGSize)xmmword_1F8470;
    v38->inner.origin = (CGPoint)xmmword_1F8480;
    v38->inner.size = (CGSize)xmmword_1F8490;
    v38->size = (CGSize)xmmword_1F84A0;
    v38->scale = 1.08;
    [(id)qword_2B05B8 setObject:v38 forKey:@"rough-vignette-portrait"];

    v39 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v39->outer.origin = (CGPoint)xmmword_1F8460;
    v39->outer.size = (CGSize)xmmword_1F8470;
    v39->inner.origin = (CGPoint)xmmword_1F8480;
    v39->inner.size = (CGSize)xmmword_1F8490;
    v39->size = (CGSize)xmmword_1F84A0;
    v39->scale = 1.08;
    [(id)qword_2B05B8 setObject:v39 forKey:@"rough-vignette-portrait-small"];

    v40 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v40->outer.origin = (CGPoint)xmmword_1F84B0;
    v40->outer.size = (CGSize)xmmword_1F84C0;
    v40->inner.origin = (CGPoint)xmmword_1F84D0;
    v40->inner.size = (CGSize)xmmword_1F84E0;
    v40->size = (CGSize)xmmword_1F84F0;
    v40->scale = 1.06;
    [(id)qword_2B05B8 setObject:v40 forKey:@"vertical-lined-frame"];

    v41 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v41->outer.origin = (CGPoint)xmmword_1F8500;
    v41->outer.size = (CGSize)xmmword_1F8510;
    v41->inner.origin = (CGPoint)xmmword_1F84D0;
    v41->inner.size = (CGSize)xmmword_1F84E0;
    v41->size = (CGSize)xmmword_1F84F0;
    v41->scale = 1.06;
    [(id)qword_2B05B8 setObject:v41 forKey:@"vertical-lined-frame-small"];

    v42 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v42->outer.origin = (CGPoint)xmmword_1F8520;
    v42->outer.size = (CGSize)xmmword_1F8530;
    v42->inner.origin = (CGPoint)xmmword_1F8540;
    v42->inner.size = (CGSize)xmmword_1F8550;
    v42->size = (CGSize)xmmword_1F8560;
    v42->scale = 1.03;
    [(id)qword_2B05B8 setObject:v42 forKey:@"ruled-border"];

    v43 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v43->outer.origin = (CGPoint)xmmword_1F8570;
    v43->outer.size = (CGSize)xmmword_1F8580;
    v43->inner.origin = (CGPoint)xmmword_1F8590;
    v43->inner.size = (CGSize)xmmword_1F85A0;
    v43->size = (CGSize)xmmword_1F8560;
    v43->scale = 1.03;
    [(id)qword_2B05B8 setObject:v43 forKey:@"ruled-border-small"];

    v44 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v44->outer.origin.x = 0.0;
    v44->outer.origin.double y = 0.0;
    v44->outer.size = v98;
    v44->inner.origin.x = 0.0;
    v44->inner.origin.double y = 0.0;
    v44->inner.size = v98;
    v44->size = (CGSize)xmmword_1F85B0;
    v44->scale = 1.03;
    [(id)qword_2B05B8 setObject:v44 forKey:@"postcard-q1-mask"];

    v45 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v45->outer.origin.x = 0.0;
    v45->outer.origin.double y = 0.0;
    v45->outer.size = v98;
    v45->inner.origin.x = 0.0;
    v45->inner.origin.double y = 0.0;
    v45->inner.size = v98;
    v45->size = (CGSize)xmmword_1F85B0;
    v45->scale = 1.03;
    [(id)qword_2B05B8 setObject:v45 forKey:@"postcard-q2-mask"];

    v46 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v46->outer.origin.x = 0.0;
    v46->outer.origin.double y = 0.0;
    v46->outer.size = v98;
    v46->inner.origin.x = 0.0;
    v46->inner.origin.double y = 0.0;
    v46->inner.size = v98;
    v46->size = (CGSize)xmmword_1F85B0;
    v46->scale = 1.03;
    [(id)qword_2B05B8 setObject:v46 forKey:@"postcard-q3-mask"];

    v47 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v47->outer.origin.x = 0.0;
    v47->outer.origin.double y = 0.0;
    v47->outer.size = v98;
    v47->inner.origin.x = 0.0;
    v47->inner.origin.double y = 0.0;
    v47->inner.size = v98;
    v47->size = (CGSize)xmmword_1F85B0;
    v47->scale = 1.03;
    [(id)qword_2B05B8 setObject:v47 forKey:@"postcard-q4-mask"];

    v48 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v48->outer.origin.x = 0.0;
    v48->outer.origin.double y = 0.0;
    v48->outer.size = v98;
    v48->inner.origin.x = 0.0;
    v48->inner.origin.double y = 0.0;
    v48->inner.size = v98;
    v48->size = (CGSize)xmmword_1F85C0;
    v48->scale = 1.04;
    [(id)qword_2B05B8 setObject:v48 forKey:@"postcard-q5-mask"];

    double width = CGRectZero.size.width;
    CGFloat v50 = CGRectZero.origin.y / 2530.0;
    double y = CGRectZero.origin.y;
    CGFloat v52 = CGRectZero.size.height / 2530.0;
    double height = CGRectZero.size.height;
    v54 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v54->outer.origin = (CGPoint)xmmword_1F85D0;
    v54->outer.size = (CGSize)xmmword_1F85E0;
    v54->inner.origin.x = CGRectZero.origin.x / 4011.0;
    v54->inner.origin.double y = v50;
    v54->inner.size.double width = width / 4011.0;
    v54->inner.size.double height = v52;
    v54->size = (CGSize)xmmword_1F85F0;
    v54->scale = 1.03;
    [(id)qword_2B05B8 setObject:v54 forKey:@"postcard-back"];

    v55 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v55->outer.origin = (CGPoint)xmmword_1F85D0;
    v55->outer.size = (CGSize)xmmword_1F85E0;
    v55->inner.origin.x = CGRectZero.origin.x / 4011.0;
    v55->inner.origin.double y = v50;
    v55->inner.size.double width = width / 4011.0;
    v55->inner.size.double height = v52;
    v55->size = (CGSize)xmmword_1F85F0;
    v55->scale = 1.03;
    [(id)qword_2B05B8 setObject:v55 forKey:@"postcard-back-small"];

    v56 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v56->outer.origin = (CGPoint)xmmword_1F8600;
    v56->outer.size = (CGSize)xmmword_1F8610;
    v56->inner.origin.x = CGRectZero.origin.x / 3998.0;
    v56->inner.origin.double y = y / 2537.0;
    v56->inner.size.double width = width / 3998.0;
    v56->inner.size.double height = height / 2537.0;
    v56->size = (CGSize)xmmword_1F8620;
    v56->scale = 1.03;
    [(id)qword_2B05B8 setObject:v56 forKey:@"postcard-frame"];

    v57 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v57->outer.origin = (CGPoint)xmmword_1F8600;
    v57->outer.size = (CGSize)xmmword_1F8610;
    v57->inner.origin.x = CGRectZero.origin.x / 3998.0;
    v57->inner.origin.double y = y / 2537.0;
    v57->inner.size.double width = width / 3998.0;
    v57->inner.size.double height = height / 2537.0;
    v57->size = (CGSize)xmmword_1F8620;
    v57->scale = 1.03;
    [(id)qword_2B05B8 setObject:v57 forKey:@"postcard-frame-small"];

    v58 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v58->outer.origin.x = 0.0;
    v58->outer.origin.double y = 0.0;
    v58->outer.size = v98;
    v58->inner.origin = (CGPoint)xmmword_1F8630;
    v58->inner.size = (CGSize)xmmword_1F8640;
    v58->size = (CGSize)xmmword_1F8650;
    v58->scale = 1.03;
    [(id)qword_2B05B8 setObject:v58 forKey:@"brown-paper"];

    v59 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v59->outer.origin.x = 0.0;
    v59->outer.origin.double y = 0.0;
    v59->outer.size = v98;
    v59->inner.origin = (CGPoint)xmmword_1F8660;
    v59->inner.size = (CGSize)xmmword_1F8670;
    v59->size = (CGSize)xmmword_1F8650;
    v59->scale = 1.03;
    [(id)qword_2B05B8 setObject:v59 forKey:@"brown-paper-small"];

    v60 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v60->outer.origin = (CGPoint)xmmword_1F8680;
    v60->outer.size = (CGSize)xmmword_1F8690;
    v60->inner.origin = (CGPoint)xmmword_1F86A0;
    v60->inner.size = (CGSize)xmmword_1F86B0;
    v60->size = (CGSize)xmmword_1F86C0;
    v60->scale = 1.03;
    [(id)qword_2B05B8 setObject:v60 forKey:@"flourish-landscape1"];

    v61 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v61->outer.origin = (CGPoint)xmmword_1F8680;
    v61->outer.size = (CGSize)xmmword_1F8690;
    v61->inner.origin = (CGPoint)xmmword_1F86D0;
    v61->inner.size = (CGSize)xmmword_1F86E0;
    v61->size = (CGSize)xmmword_1F86C0;
    v61->scale = 1.03;
    [(id)qword_2B05B8 setObject:v61 forKey:@"flourish-landscape2"];

    v62 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v62->outer.origin = (CGPoint)xmmword_1F8680;
    v62->outer.size = (CGSize)xmmword_1F8690;
    v62->inner.origin = (CGPoint)xmmword_1F86F0;
    v62->inner.size = (CGSize)xmmword_1F8700;
    v62->size = (CGSize)xmmword_1F86C0;
    v62->scale = 1.03;
    [(id)qword_2B05B8 setObject:v62 forKey:@"flourish-landscape3"];

    v63 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v63->outer.origin = (CGPoint)xmmword_1F8710;
    v63->outer.size = (CGSize)xmmword_1F8720;
    v63->inner.origin = (CGPoint)xmmword_1F8730;
    v63->inner.size = (CGSize)xmmword_1F8740;
    v63->size = (CGSize)xmmword_1F8750;
    v63->scale = 1.03;
    [(id)qword_2B05B8 setObject:v63 forKey:@"flourish-portrait"];

    v64 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v64->outer.origin = (CGPoint)xmmword_1F8760;
    v64->outer.size = (CGSize)xmmword_1F8770;
    v64->inner.origin = (CGPoint)xmmword_1F8780;
    v64->inner.size = (CGSize)xmmword_1F8790;
    v64->size = (CGSize)xmmword_1F87A0;
    v64->scale = 1.03;
    [(id)qword_2B05B8 setObject:v64 forKey:@"mounted-frame"];

    v65 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v65->outer.origin = (CGPoint)xmmword_1F87B0;
    v65->outer.size = (CGSize)xmmword_1F87C0;
    v65->inner.origin = (CGPoint)xmmword_1F87D0;
    v65->inner.size = (CGSize)xmmword_1F87E0;
    v65->size = (CGSize)xmmword_1F87A0;
    v65->scale = 1.03;
    [(id)qword_2B05B8 setObject:v65 forKey:@"mounted-frame-small"];

    v66 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v66->outer.origin = (CGPoint)xmmword_1F87F0;
    v66->outer.size = (CGSize)xmmword_1F8800;
    v66->inner.origin = (CGPoint)xmmword_1F8810;
    v66->inner.size = (CGSize)xmmword_1F8820;
    v66->size = (CGSize)xmmword_1F8830;
    v66->scale = 1.03;
    [(id)qword_2B05B8 setObject:v66 forKey:@"torn-frame1"];

    v67 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v67->outer.origin = (CGPoint)xmmword_1F8840;
    v67->outer.size = (CGSize)xmmword_1F8850;
    v67->inner.origin = (CGPoint)xmmword_1F8860;
    v67->inner.size = (CGSize)xmmword_1F8870;
    v67->size = (CGSize)xmmword_1F8880;
    v67->scale = 1.03;
    [(id)qword_2B05B8 setObject:v67 forKey:@"torn-frame1-small"];

    v68 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v68->outer.origin = (CGPoint)xmmword_1F8890;
    v68->outer.size = (CGSize)xmmword_1F88A0;
    v68->inner.origin = (CGPoint)xmmword_1F88B0;
    v68->inner.size = (CGSize)xmmword_1F88C0;
    v68->size = (CGSize)xmmword_1F8830;
    v68->scale = 1.03;
    [(id)qword_2B05B8 setObject:v68 forKey:@"torn-frame2"];

    v69 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v69->outer.origin = (CGPoint)xmmword_1F88D0;
    v69->outer.size = (CGSize)xmmword_1F88E0;
    v69->inner.origin = (CGPoint)xmmword_1F88F0;
    v69->inner.size = (CGSize)xmmword_1F8900;
    v69->size = (CGSize)xmmword_1F8880;
    v69->scale = 1.03;
    [(id)qword_2B05B8 setObject:v69 forKey:@"torn-frame2-small"];

    v70 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v70->outer.origin = (CGPoint)xmmword_1F8910;
    v70->outer.size = (CGSize)xmmword_1F8920;
    v70->inner.origin = (CGPoint)xmmword_1F8930;
    v70->inner.size = (CGSize)xmmword_1F8940;
    v70->size = (CGSize)xmmword_1F8950;
    v70->scale = 1.03;
    [(id)qword_2B05B8 setObject:v70 forKey:@"torn-frame3"];

    v71 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v71->outer.origin = (CGPoint)xmmword_1F8960;
    v71->outer.size = (CGSize)xmmword_1F8970;
    v71->inner.origin = (CGPoint)xmmword_1F8980;
    v71->inner.size = (CGSize)xmmword_1F8990;
    v71->size = (CGSize)xmmword_1F89A0;
    v71->scale = 1.03;
    [(id)qword_2B05B8 setObject:v71 forKey:@"torn-frame3-small"];

    v72 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v72->outer.origin = (CGPoint)xmmword_1F89B0;
    v72->outer.size = (CGSize)xmmword_1F89C0;
    v72->inner.origin = (CGPoint)xmmword_1F89D0;
    v72->inner.size = (CGSize)xmmword_1F89E0;
    v72->size = (CGSize)xmmword_1F89F0;
    v72->scale = 1.03;
    [(id)qword_2B05B8 setObject:v72 forKey:@"rounded-corner"];

    v73 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v73->outer.origin = (CGPoint)xmmword_1F8A00;
    v73->outer.size = (CGSize)xmmword_1F8A10;
    v73->inner.origin = (CGPoint)xmmword_1F8A20;
    v73->inner.size = (CGSize)xmmword_1F8A30;
    v73->size = (CGSize)xmmword_1F89F0;
    v73->scale = 1.03;
    [(id)qword_2B05B8 setObject:v73 forKey:@"rounded-corner-small"];

    v74 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v74->outer.origin = (CGPoint)xmmword_1F8A40;
    v74->outer.size = (CGSize)xmmword_1F8A50;
    v74->inner.origin.x = CGRectZero.origin.x / 2212.0;
    v74->inner.origin.double y = y / 1327.0;
    v74->inner.size.double width = width / 2212.0;
    v74->inner.size.double height = height / 1327.0;
    v74->size = (CGSize)xmmword_1F8A60;
    v74->scale = 1.03;
    [(id)qword_2B05B8 setObject:v74 forKey:@"folded-paper"];

    v75 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v75->outer.origin = (CGPoint)xmmword_1F8A70;
    v75->outer.size = (CGSize)xmmword_1F8A80;
    v75->inner.origin.x = CGRectZero.origin.x / 2456.0;
    v75->inner.origin.double y = y / 1733.0;
    v75->inner.size.double width = width / 2456.0;
    v75->inner.size.double height = height / 1733.0;
    v75->size = (CGSize)xmmword_1F8A90;
    v75->scale = 1.03;
    [(id)qword_2B05B8 setObject:v75 forKey:@"text-card"];

    v76 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v76->outer.origin = (CGPoint)xmmword_1F8AA0;
    v76->outer.size = (CGSize)xmmword_1F8AB0;
    v76->inner.origin.x = CGRectZero.origin.x / 2484.0;
    v76->inner.origin.double y = y / 1382.0;
    v76->inner.size.double width = width / 2484.0;
    v76->inner.size.double height = height / 1382.0;
    v76->size = (CGSize)xmmword_1F8AC0;
    v76->scale = 1.03;
    [(id)qword_2B05B8 setObject:v76 forKey:@"ripped-paper"];

    double v94 = y;
    v77 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v77->outer.origin = (CGPoint)vdupq_n_s64(0x3F847AE147AE147BuLL);
    v77->outer.size = (CGSize)vdupq_n_s64(0x3FEF5C28F5C28F5CuLL);
    v77->inner.origin.x = CGRectZero.origin.x / 1000.0;
    v77->inner.origin.double y = y / 1000.0;
    v77->inner.size.double width = width / 1000.0;
    v77->inner.size.double height = height / 1000.0;
    v77->size = (CGSize)vdupq_n_s64(0x408F400000000000uLL);
    v77->scale = 1.0;
    [(id)qword_2B05B8 setObject:v77 forKey:@"break"];

    v78 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v78->outer.origin.x = 0.0;
    v78->outer.origin.double y = 0.0;
    v78->outer.size = v98;
    v78->inner.origin.x = CGRectZero.origin.x / 120.0;
    v78->inner.origin.double y = y / 120.0;
    v78->inner.size.double width = width / 120.0;
    v78->inner.size.double height = height / 120.0;
    int64x2_t v91 = vdupq_n_s64(0x405E000000000000uLL);
    v78->size = (CGSize)v91;
    v78->scale = 1.0;
    [(id)qword_2B05B8 setObject:v78 forKey:@"break_01"];

    v79 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v79->outer.origin.x = 0.0;
    v79->outer.origin.double y = 0.0;
    v79->outer.size = (CGSize)xmmword_1F8AD0;
    v79->inner.origin.x = CGRectZero.origin.x / 1805.0;
    v79->inner.origin.double y = y / 120.0;
    v79->inner.size.double width = width / 1805.0;
    v79->inner.size.double height = height / 120.0;
    v79->size = (CGSize)xmmword_1F8AE0;
    v79->scale = 1.0;
    [(id)qword_2B05B8 setObject:v79 forKey:@"break_02"];

    v80 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v80->outer.origin.x = 0.0;
    v80->outer.origin.double y = 0.0;
    v80->outer.size = (CGSize)xmmword_1F8AF0;
    v80->inner.origin.x = CGRectZero.origin.x / 120.0;
    v80->inner.origin.double y = y / 120.0;
    CGFloat v81 = y / 120.0;
    v80->inner.size.double width = width / 120.0;
    v80->inner.size.double height = height / 120.0;
    v80->size = (CGSize)v91;
    v80->scale = 1.0;
    [(id)qword_2B05B8 setObject:v80 forKey:@"break_03"];

    CGFloat v82 = y / 1805.0;
    v83 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v83->outer.origin.x = 0.0;
    v83->outer.origin.double y = 0.0;
    v83->outer.size = v98;
    v83->inner.origin.x = CGRectZero.origin.x / 120.0;
    v83->inner.origin.double y = v82;
    v83->inner.size.double width = width / 120.0;
    v83->inner.size.double height = height / 1805.0;
    v83->size = (CGSize)xmmword_1F8B00;
    v83->scale = 1.0;
    [(id)qword_2B05B8 setObject:v83 forKey:@"break_04"];

    v84 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v84->outer.origin.x = 0.0;
    v84->outer.origin.double y = 0.0;
    v84->outer.size = v98;
    v84->inner.origin.x = CGRectZero.origin.x / 120.0;
    v84->inner.origin.double y = v82;
    v84->inner.size.double width = width / 120.0;
    v84->inner.size.double height = height / 1805.0;
    v84->size = (CGSize)xmmword_1F8B00;
    v84->scale = 1.0;
    [(id)qword_2B05B8 setObject:v84 forKey:@"break_05"];

    v85 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v85->outer.origin.x = 0.0;
    v85->outer.origin.double y = 0.0;
    v85->outer.size = v98;
    v85->inner.origin.x = CGRectZero.origin.x / 750.0;
    v85->inner.origin.double y = v81;
    v85->inner.size.double width = width / 750.0;
    v85->inner.size.double height = height / 120.0;
    v85->size = (CGSize)xmmword_1F8B10;
    v85->scale = 1.0;
    [(id)qword_2B05B8 setObject:v85 forKey:@"break_06"];

    v86 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v86->outer.origin.x = 0.0;
    v86->outer.origin.double y = 0.0;
    v86->outer.size = v98;
    v86->inner.origin.x = CGRectZero.origin.x / 545.0;
    v86->inner.origin.double y = v81;
    v86->inner.size.double width = width / 545.0;
    v86->inner.size.double height = height / 120.0;
    v86->size = (CGSize)xmmword_1F8B20;
    v86->scale = 1.0;
    [(id)qword_2B05B8 setObject:v86 forKey:@"break_07"];

    v87 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v87->outer.origin.x = 0.0;
    v87->outer.origin.double y = 0.0;
    v87->outer.size = v98;
    v87->inner.origin.x = CGRectZero.origin.x / 750.0;
    v87->inner.origin.double y = v81;
    v87->inner.size.double width = width / 750.0;
    v87->inner.size.double height = height / 120.0;
    v87->size = (CGSize)xmmword_1F8B10;
    v87->scale = 1.0;
    [(id)qword_2B05B8 setObject:v87 forKey:@"break_08"];

    v88 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v88->outer.origin.x = CGRectZero.origin.x;
    v88->outer.origin.double y = v94;
    v88->outer.size.double width = width;
    v88->outer.size.double height = height;
    v88->inner.origin.x = CGRectZero.origin.x;
    v88->inner.origin.double y = v94;
    v88->inner.size.double width = width;
    v88->inner.size.double height = height;
    v88->size = v98;
    v88->scale = 1.03;
    [(id)qword_2B05B8 setObject:v88 forKey:@"None"];

    v89 = objc_alloc_init(&OBJC_CLASS___MRScrapbookImage);
    v89->outer.origin.x = CGRectZero.origin.x;
    v89->outer.origin.double y = v94;
    v89->outer.size.double width = width;
    v89->outer.size.double height = height;
    v89->inner.origin.x = CGRectZero.origin.x;
    v89->inner.origin.double y = v94;
    v89->inner.size.double width = width;
    v89->inner.size.double height = height;
    v89->size = v98;
    v89->scale = 1.03;
    [(id)qword_2B05B8 setObject:v89 forKey:@"Text"];
  }

- (MREffectScrapbook)initWithEffectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectScrapbook;
  id v3 = -[MREffect initWithEffectID:](&v6, "initWithEffectID:", a3);
  uint64_t v4 = v3;
  if (v3)
  {
    v3[201] = 0;
    *(void *)(v3 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v4 + 193) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v4 + 241) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  return (MREffectScrapbook *)v4;
}

- (void)_cleanup
{
  BYTE1(self->mSprites) = 0;
  [*(id *)((char *)&self->mTextRenderer0 + 1) releaseByUser];
  *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  [*(id *)((char *)&self->mLayouts + 1) cleanup];

  *(NSArray **)((char *)&self->mLayouts + 1) = 0LL;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( objc_msgSend( *(id *)(&self->super._isInInteractiveMode + 1),  "objectForKey:",  *(void *)(*((void *)&v8 + 1) + 8 * (void)i)),  "cleanup");
      }

      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1) = 0LL;
  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;

  *(MRImage **)((char *)&self->mTextImage0 + 1) = 0LL;
}

- (BOOL)isLoadedForTime:(double)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectEnumerator", 0);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      unsigned int v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) isLoaded];
      if (!v9) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    LOBYTE(v9) = !self->super.mNeedsToUpdateTexts;
  }

  return v9;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___MREffectScrapbook;
    -[MREffect setPixelSize:](&v16, "setPixelSize:", a3.width, a3.height);
    [*(id *)((char *)&self->mFrameProviders + 1) removeAllObjects];
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectEnumerator", 0);
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "setDefaultSize:", width, height);
        }

        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }

      while (v9);
    }
  }

- (BOOL)isAlphaFriendly
{
  return 0;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v6 = a4;
  [a4 localAspectRatio];
  int v10 = LODWORD(v9);
  if (*(float *)&v9 < 1.0)
  {
    LODWORD(v9) = 1068149419;
    [v6 setLocalAspectRatio:v9];
  }

  __int128 v11 = &OBJC_IVAR___MPFilter__internal;
  if (!BYTE1(self->mSprites))
  {
    obj = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"aspect")) {
      uint64_t v13 = (uint64_t)objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"aspect"),  "integerValue");
    }
    else {
      uint64_t v13 = -1LL;
    }
    *(void *)(&self->mIsLoaded + 1) = v13;
    __int128 v14 = -[NSString substringFromIndex:](self->super.mEffectID, "substringFromIndex:", 10LL);
    __int128 v15 = v14;
    uint64_t v16 = *(void *)(&self->mIsLoaded + 1);
    if (v16)
    {
      if (v16 != 1)
      {
LABEL_12:
        unsigned int v18 = -[NSString hasSuffix:](v15, "hasSuffix:", @"Movie");
        BYTE1(self->mRectsToSubtract) = v18;
        int v108 = v10;
        id v107 = a5;
        if (v18) {
          __int128 v15 = -[NSString stringByReplacingOccurrencesOfString:withString:]( v15,  "stringByReplacingOccurrencesOfString:withString:",  @"Movie",  &stru_259C60);
        }
        id v19 = [(id)qword_2B05B0 objectForKey:v15];
        *(int64_t *)((char *)&self->mTitleAspectRatio + 1) = (int64_t)v19;
        v125 = self;
        p_mPixelSize = &self->super.mPixelSize;
        double width = self->super.mPixelSize.width;
        __int128 v139 = 0u;
        __int128 v140 = 0u;
        __int128 v141 = 0u;
        __int128 v142 = 0u;
        id v21 = [v19 countByEnumeratingWithState:&v139 objects:v146 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v140;
          uint64_t v121 = *(void *)v140;
          id v110 = v19;
          double v109 = width;
          do
          {
            for (i = 0LL; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v140 != v23) {
                objc_enumerationMutation(v19);
              }
              v25 = *(double **)(*((void *)&v139 + 1) + 8LL * (void)i);
              id v26 = [v25 frame];
              if (!v26) {
                id v26 = [v25 mask];
              }
              if (([v26 isEqualToString:@"None"] & 1) == 0
                && ([v26 isEqualToString:@"Text"] & 1) == 0)
              {
                if ([v26 hasPrefix:@"break"])
                {
                  if (!-[NSMutableDictionary objectForKey:](v12, "objectForKey:", @"break_01"))
                  {
                    double v27 = v25[3];
                    double v28 = v25[4];
                    v29 = (double *)[(id)qword_2B05B8 objectForKey:@"break_01"];
                    v30 = (double *)[(id)qword_2B05B8 objectForKey:@"break_02"];
                    v31 = (double *)[(id)qword_2B05B8 objectForKey:@"break_03"];
                    v32 = (double *)[(id)qword_2B05B8 objectForKey:@"break_04"];
                    v115 = (double *)[(id)qword_2B05B8 objectForKey:@"break_05"];
                    v117 = (double *)[(id)qword_2B05B8 objectForKey:@"break_06"];
                    v119 = (double *)[(id)qword_2B05B8 objectForKey:@"break_07"];
                    v33 = (double *)[(id)qword_2B05B8 objectForKey:@"break_08"];
                    v34 = v33;
                    if (v27 == 0.0)
                    {
                      double v35 = v28 * 0.200000003;
                      double v36 = v28 * 0.200000003 * (v29[9] / v29[10]);
                      double v27 = v28 * 0.200000003 * (v30[9] / v30[10]);
                      double v37 = v28 * 0.200000003 * (v31[9] / v31[10]);
                      double v38 = v28 * (v32[9] / v32[10]);
                      double v39 = v28 * (v115[9] / v115[10]);
                      double v113 = v28 * 0.200000003 * (v117[9] / v117[10]);
                      double v114 = v28;
                      double v116 = v28 * 0.200000003 * (v119[9] / v119[10]);
                      double v118 = v28 * 0.200000003;
                      double v120 = v28 * 0.200000003;
                      double v40 = v28 * 0.200000003 * (v33[9] / v33[10]);
                      double v111 = v28 * 0.200000003;
                      double v112 = v28 * 0.200000003;
                      double v41 = v28 * 0.200000003;
                    }

                    else
                    {
                      double v39 = v27 * 0.200000003;
                      [v6 localAspectRatio];
                      double v50 = v27 * 0.200000003 * (v49 / (v29[9] / v29[10]));
                      [v6 localAspectRatio];
                      double v111 = v27 * (v51 / (v30[9] / v30[10]));
                      [v6 localAspectRatio];
                      double v112 = v27 * 0.200000003 * (v52 / (v31[9] / v31[10]));
                      [v6 localAspectRatio];
                      double v114 = v27 * 0.200000003 * (v53 / (v32[9] / v32[10]));
                      [v6 localAspectRatio];
                      double v28 = v27 * 0.200000003 * (v54 / (v115[9] / v115[10]));
                      double v40 = v27 * 0.400000006;
                      [v6 localAspectRatio];
                      double v118 = v27 * 0.400000006 * (v55 / (v117[9] / v117[10]));
                      [v6 localAspectRatio];
                      double v120 = v27 * 0.400000006 * (v56 / (v119[9] / v119[10]));
                      [v6 localAspectRatio];
                      double v41 = v50;
                      double v116 = v27 * 0.400000006;
                      double v35 = v27 * 0.400000006 * (v57 / (v34[9] / v34[10]));
                      double v113 = v27 * 0.400000006;
                      double v38 = v27 * 0.200000003;
                      double v37 = v27 * 0.200000003;
                      double v36 = v27 * 0.200000003;
                    }

                    -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v36, v41),  @"break_01");
                    -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v27, v111),  @"break_02");
                    -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v37, v112),  @"break_03");
                    -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v38, v114),  @"break_04");
                    -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v39, v28),  @"break_05");
                    -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v113, v118),  @"break_06");
                    -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v116, v120),  @"break_07");
                    -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v40, v35),  @"break_08");
                    -[NSMutableArray addObject:](obj, "addObject:", @"break_01");
                    -[NSMutableArray addObject:](obj, "addObject:", @"break_02");
                    -[NSMutableArray addObject:](obj, "addObject:", @"break_03");
                    -[NSMutableArray addObject:](obj, "addObject:", @"break_04");
                    -[NSMutableArray addObject:](obj, "addObject:", @"break_05");
                    -[NSMutableArray addObject:](obj, "addObject:", @"break_06");
                    -[NSMutableArray addObject:](obj, "addObject:", @"break_07");
                    -[NSMutableArray addObject:](obj, "addObject:", @"break_08");
                    uint64_t v23 = v121;
                    if ([v25 backgroundPaper]
                      && objc_msgSend( objc_msgSend(v25, "backgroundPaper"),  "isEqualToString:",  @"torn-paper"))
                    {
                      v58 = (double *)[(id)qword_2B05B8 objectForKey:@"torn-paper-01"];
                      -[NSMutableArray addObject:](obj, "addObject:", @"torn-paper-01");
                      [v6 localAspectRatio];
                      -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:]( &OBJC_CLASS___NSValue,  "valueWithCGSize:",  1.0,  v59 / (v58[9] / v58[10])),  @"torn-paper-01");
                      v60 = (double *)[(id)qword_2B05B8 objectForKey:@"torn-paper-02"];
                      -[NSMutableArray addObject:](obj, "addObject:", @"torn-paper-02");
                      [v6 localAspectRatio];
                      -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:]( &OBJC_CLASS___NSValue,  "valueWithCGSize:",  1.0,  v61 / (v60[9] / v60[10])),  @"torn-paper-02");
                      v62 = (double *)[(id)qword_2B05B8 objectForKey:@"torn-paper-03"];
                      -[NSMutableArray addObject:](obj, "addObject:", @"torn-paper-03");
                      [v6 localAspectRatio];
                      double v64 = v62[9];
                      double v65 = v62[10];
                      uint64_t v23 = v121;
                      -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", 1.0, v63 / (v64 / v65)),  @"torn-paper-03");
                      id v19 = v110;
                      double width = v109;
                    }

                    else
                    {
                      id v19 = v110;
                      double width = v109;
                      if ([v25 backgroundPaper]
                        && objc_msgSend( objc_msgSend(v25, "backgroundPaper"),  "isEqualToString:",  @"brown-paper"))
                      {
                        v66 = (double *)[(id)qword_2B05B8 objectForKey:@"brown-paper-01"];
                        -[NSMutableArray addObject:](obj, "addObject:", @"brown-paper-01");
                        [v6 localAspectRatio];
                        -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:]( &OBJC_CLASS___NSValue,  "valueWithCGSize:",  1.2,  v67 / (v66[9] / v66[10]) * 1.2),  @"brown-paper-01");
                        v68 = (double *)[(id)qword_2B05B8 objectForKey:@"brown-paper-02"];
                        -[NSMutableArray addObject:](obj, "addObject:", @"brown-paper-02");
                        [v6 localAspectRatio];
                        -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:]( &OBJC_CLASS___NSValue,  "valueWithCGSize:",  1.2,  v69 / (v68[9] / v68[10]) * 1.2),  @"brown-paper-02");
                        v70 = (double *)[(id)qword_2B05B8 objectForKey:@"brown-paper-03"];
                        id v19 = v110;
                        -[NSMutableArray addObject:](obj, "addObject:", @"brown-paper-03");
                        [v6 localAspectRatio];
                        double v72 = v70[9];
                        double v73 = v70[10];
                        uint64_t v23 = v121;
                        -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:]( &OBJC_CLASS___NSValue,  "valueWithCGSize:",  1.2,  v71 / (v72 / v73) * 1.2),  @"brown-paper-03");
                      }
                    }
                  }
                }

                else
                {
                  double v42 = v25[3];
                  double v43 = v25[4];
                  v44 = (double *)[(id)qword_2B05B8 objectForKey:v26];
                  if (v44)
                  {
                    v45 = v44;
                    if (v43 == 0.0)
                    {
                      [v6 localAspectRatio];
                      double v43 = v42 * (v46 / (v45[9] / v45[10]));
                    }

                    else
                    {
                      [v6 localAspectRatio];
                      double v48 = v47;
                      if (v42 == 0.0) {
                        double v42 = v43 / (v45[9] / v45[10] * v48);
                      }
                      else {
                        double v43 = v43 * v48;
                      }
                    }

                    uint64_t v23 = v121;
                    if (!-[NSMutableDictionary objectForKey:](v12, "objectForKey:", v26)
                      || (objc_msgSend(-[NSMutableDictionary objectForKey:](v12, "objectForKey:", v26), "CGSizeValue"),
                          v74 < v42))
                    {
                      -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v42, v43),  v26);
                    }

                    -[NSMutableArray addObject:](obj, "addObject:", v26);
                  }

                  else
                  {
                    NSLog(@"Missing frame: %@", v26);
                    uint64_t v23 = v121;
                  }
                }
              }
            }

            id v22 = [v19 countByEnumeratingWithState:&v139 objects:v146 count:16];
          }

          while (v22);
        }

        v75 = v12;
        id v122 = v6;
        id v76 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
        __int128 v135 = 0u;
        __int128 v136 = 0u;
        __int128 v137 = 0u;
        __int128 v138 = 0u;
        id v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v135,  v145,  16LL);
        if (v77)
        {
          id v78 = v77;
          uint64_t v79 = *(void *)v136;
          do
          {
            for (j = 0LL; j != v78; j = (char *)j + 1)
            {
              if (*(void *)v136 != v79) {
                objc_enumerationMutation(obj);
              }
              CGFloat v81 = *(__CFString **)(*((void *)&v135 + 1) + 8LL * (void)j);
              CGFloat v82 = (double *)[(id)qword_2B05B8 objectForKey:v81];
              double v83 = v82[9];
              double v84 = v82[10];
              objc_msgSend(-[NSMutableDictionary objectForKey:](v75, "objectForKey:", v81), "CGSizeValue");
              double v86 = v85;
              double v88 = v87;
              v89 = @"mounted-frame";
              if ((-[__CFString isEqualToString:](v81, "isEqualToString:", @"mounted-frame-small") & 1) == 0)
              {
                v89 = @"rounded-corner";
                if ((-[__CFString isEqualToString:]( v81,  "isEqualToString:",  @"rounded-corner-small") & 1) == 0)
                {
                  v89 = @"deckle-edge-frame";
                  if ((-[__CFString isEqualToString:]( v81,  "isEqualToString:",  @"deckle-edge-frame-small") & 1) == 0)
                  {
                    if (-[__CFString isEqualToString:]( v81,  "isEqualToString:",  @"portrait-frame-small")) {
                      v89 = @"portrait-frame";
                    }
                    else {
                      v89 = v81;
                    }
                  }
                }
              }

              uint64_t v90 = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
              [*(id *)(&v125->super._isInInteractiveMode + 1) setObject:v90 forKey:v81];
              -[MRImageProvider setAssetPath:]( v90,  "setAssetPath:",  [v76 resourcePathForEffectID:v125->super.mEffectID, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.png", v89) andResource]);
              -[MRImageProvider setOriginalImageSize:](v90, "setOriginalImageSize:", v83, v84);
              -[MRImageProvider setDefaultSize:]( v90,  "setDefaultSize:",  v86 * 0.5 * p_mPixelSize->width,  v88 * 0.5 * p_mPixelSize->height);
            }

            id v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v135,  v145,  16LL);
          }

          while (v78);
        }

        self = v125;
        a5 = v107;
        BYTE1(v125->mSprites) = 1;
        id v6 = v122;
        int v10 = v108;
        __int128 v11 = &OBJC_IVAR___MPFilter__internal;
        goto LABEL_64;
      }

      v17 = @"Portrait";
    }

    else
    {
      v17 = @"Landscape";
    }

    __int128 v15 = -[NSString stringByAppendingString:](v14, "stringByAppendingString:", v17);
    goto LABEL_12;
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v5 = a4;
  [a4 localAspectRatio];
  int v110 = LODWORD(v7);
  if (*(float *)&v7 < 1.0)
  {
    LODWORD(v7) = 1068149419;
    [v5 setLocalAspectRatio:v7];
  }

  id v8 = (float *)[v5 foreColor];
  double v9 = v8;
  *(float *)&double v10 = *v8;
  if (*v8 >= 1.0 && (LODWORD(v10) = 1.0, v8[1] >= 1.0) && v8[2] >= 1.0)
  {
    int v109 = 0;
  }

  else
  {
    __int128 v11 = (float *)objc_msgSend(v5, "backColor", v10);
    *(float *)&double v12 = *v11 * *v9;
    *(float *)&double v13 = v11[1] * v9[1];
    *(float *)&double v14 = v11[3];
    *(float *)&double v15 = v11[2] * v9[2];
    [v5 setBackColorRed:v138 green:v12 blue:v13 alpha:v15 saveTo:v14];
    int v109 = 1;
    [v5 clear:1];
  }

  double v111 = (float *)((char *)&self->mTextSize.height + 1);
  MRMatrix_Clear((uint64_t)&self->mTextSize.height + 1);
  MRMatrix_Clear((uint64_t)v137);
  double v16 = a3 / (self->super.mPhaseInDuration + self->super.mPhaseOutDuration + self->super.mMainDuration) * 0.075000003
      + 0.949999988;
  *(float *)&double v16 = v16;
  *(float *)&double v17 = MRMatrix_Scale(v137, *(float32x2_t *)&v16, *(float32_t *)&v16, 0.0);
  objc_msgSend(v5, "composeModelViewMatrix:saveTo:", v137, v136, v17);
  [v5 setShader:@"PlainTexture"];
  if (a3 - self->super.mPhaseInDuration >= 0.0) {
    double v18 = a3 - self->super.mPhaseInDuration;
  }
  else {
    double v18 = 0.0;
  }
  double width = self->super.mPixelSize.width;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  v20 = *(void **)((char *)&self->mTitleAspectRatio + 1);
  id v21 = [v20 countByEnumeratingWithState:&v128 objects:v135 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = 0LL;
    double height = CGSizeZero.height;
    double v113 = CGSizeZero.width;
    uint64_t v24 = *(void *)v129;
    v25 = (id *)&unk_2B0000;
    double v26 = 1.0;
    double v114 = v20;
    v115 = v5;
    uint64_t v117 = *(void *)v129;
    do
    {
      double v27 = 0LL;
      id v120 = v22;
      do
      {
        if (*(void *)v129 != v24) {
          objc_enumerationMutation(v20);
        }
        uint64_t v28 = *(void *)(*((void *)&v128 + 1) + 8LL * (void)v27);
        id v29 = [(id)v28 frame];
        if (!v29) {
          id v29 = [(id)v28 mask];
        }
        v30 = (double *)[v25[183] objectForKey:v29];
        if (v30 && !*(_BYTE *)(v28 + 160))
        {
          double v31 = *(double *)(v28 + 72);
          BOOL v33 = v31 > 0.0 && BYTE1(self->mRectsToSubtract) != 0;
          double v34 = v31 * self->super.mMainDuration;
          if (v18 < v34 || v33)
          {
            v25 = (id *)&unk_2B0000;
          }

          else
          {
            uint64_t v121 = v30;
            BOOL v35 = v34 != 0.0;
            if (v18 >= v34 + v26) {
              BOOL v35 = 0;
            }
            BOOL v122 = v35;
            if (v35)
            {
              float v36 = (v18 - v34 + -0.5) * 3.14159274;
              float v37 = (float)(sinf(v36) + 1.0) * 0.5;
              [v5 blend:2];
              int v38 = *(_DWORD *)[v5 foreColor];
              int v39 = *(_DWORD *)[v5 foreColor];
              LODWORD(v40) = *(_DWORD *)[v5 foreColor];
              LODWORD(v41) = v38;
              LODWORD(v42) = v39;
              *(float *)&double v43 = v37;
              [v5 setForeColorRed:v134 green:v41 blue:v42 alpha:v40 saveTo:v43];
            }

            [*(id *)((char *)&self->mTextImage0 + 1) removeAllObjects];
            if ([(id)v28 subtract])
            {
              __int128 v126 = 0u;
              __int128 v127 = 0u;
              __int128 v124 = 0u;
              __int128 v125 = 0u;
              id v44 = [(id)v28 subtract];
              id v45 = [v44 countByEnumeratingWithState:&v124 objects:v133 count:16];
              if (v45)
              {
                id v46 = v45;
                uint64_t v47 = *(void *)v125;
LABEL_37:
                uint64_t v48 = 0LL;
                while (1)
                {
                  if (*(void *)v125 != v47) {
                    objc_enumerationMutation(v44);
                  }
                  float v49 = (double *)objc_msgSend( *(id *)((char *)&self->mTitleAspectRatio + 1),  "objectAtIndex:",  objc_msgSend(*(id *)(*((void *)&v124 + 1) + 8 * v48), "integerValue"));
                  double v50 = v49[9];
                  if (BYTE1(self->mRectsToSubtract))
                  {
                    if (v50 > 0.0) {
                      break;
                    }
                  }

                  if (v18 > v26 + v50 * self->super.mMainDuration || v50 == 0.0) {
                    [*(id *)((char *)&self->mTextImage0 + 1) addObject:v49];
                  }
                  if (v46 == (id)++v48)
                  {
                    id v46 = [v44 countByEnumeratingWithState:&v124 objects:v133 count:16];
                    if (v46) {
                      goto LABEL_37;
                    }
                    break;
                  }
                }
              }
            }

            double v51 = *(double *)(v28 + 8);
            double v123 = *(double *)(v28 + 16);
            double v52 = *(double *)(v28 + 24);
            double v53 = *(double *)(v28 + 32);
            if (*(void *)(v28 + 80) == -1LL) {
              int64_t v54 = 0LL;
            }
            else {
              int64_t v54 = *(void *)(v28 + 80);
            }
            float v55 = ImageKey(v54);
            if (*(_BYTE *)(v28 + 113) || *(_BYTE *)(v28 + 98))
            {
              id v56 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  v55);
              double v57 = *(double *)(v28 + 88);
              if (v57 <= 0.0)
              {
                [v56 imageAspectRatio];
                double v57 = v58;
              }
            }

            else
            {
              double v57 = 0.0;
            }

            v20 = v114;
            id v5 = v115;
            id v22 = v120;
            if (*(_BYTE *)(v28 + 98))
            {
              if (v52 == 0.0)
              {
                [v115 localAspectRatio];
                double v52 = v57 * (v53 / v59);
              }

              else if (v53 == 0.0)
              {
                [v115 localAspectRatio];
                double v53 = v52 * v61 / v57;
              }
            }

            else
            {
              if (v53 == 0.0)
              {
                [v115 localAspectRatio];
                double v53 = v52 * (v60 / (v121[9] / v121[10]));
              }

              else
              {
                [v115 localAspectRatio];
                double v63 = v62;
                if (v52 == 0.0) {
                  double v52 = v53 / (v121[9] / v121[10] * v63);
                }
                else {
                  double v53 = v53 * v63;
                }
              }

              [v115 localAspectRatio];
              double v123 = v123 * v64;
            }

            if (!*(_BYTE *)(v28 + 113))
            {
              uint64_t v24 = v117;
              goto LABEL_125;
            }

            double v119 = v53;
            double v65 = v52;
            if (*(uint64_t *)(v28 + 168) >= 1)
            {
              v66 = (double *)objc_msgSend(*(id *)((char *)&self->mTitleAspectRatio + 1), "objectAtIndex:");
              double v65 = v66[3];
              double v53 = v66[4];
              if (v65 == 0.0)
              {
                [v115 localAspectRatio];
                double v65 = v57 * (v53 / v67);
              }

              else if (v53 == 0.0)
              {
                [v115 localAspectRatio];
                double v53 = v65 * v68 / v57;
              }
            }

            if (v57 < 1.0 && v53 < 1.89999998 || v57 > 1.0 && v65 < 1.89999998)
            {
              uint64_t v24 = v117;
              if (v57 < 1.0 && v53 > 1.70000005 || v57 > 1.0 && v65 > 1.70000005)
              {
                double v69 = MRMatrix_Clear((uint64_t)v132);
                LODWORD(v69) = 1063675494;
                *(float *)&double v70 = MRMatrix_Scale(v132, *(float32x2_t *)&v69, 0.9, 0.0);
                objc_msgSend(v115, "composeModelViewMatrix:saveTo:", v132, 0, v70);
              }

              double v26 = 1.0;
              double v53 = v119;
              goto LABEL_125;
            }

            double v71 = v113;
            if (v57 >= 1.0) {
              double v71 = 0.75 - v65 * 0.5;
            }
            double v72 = height;
            if (v57 < 1.0) {
              double v72 = v53 * 0.5 + -0.974999964;
            }
            double height = v72;
            double v113 = v71;
            if (v57 >= 1.0) {
              double v73 = v65 * 0.5 + -0.75;
            }
            else {
              double v73 = v53 * 0.5 + -0.75;
            }
            double mPhaseInDuration = self->super.mPhaseInDuration;
            double mMainDuration = self->super.mMainDuration;
            if (mPhaseInDuration + mMainDuration <= a3)
            {
              if (v57 >= 1.0) {
                double v81 = -v73;
              }
              else {
                double v81 = 0.0;
              }
              if (v57 >= 1.0) {
                double v82 = 0.0;
              }
              else {
                double v82 = v73;
              }
            }

            else if (mPhaseInDuration >= a3)
            {
              if (v57 < 1.0) {
                double v81 = 0.0;
              }
              else {
                double v81 = v73;
              }
              if (v57 < 1.0) {
                double v82 = -v73;
              }
              else {
                double v82 = 0.0;
              }
            }

            else
            {
              double v76 = (a3 - mPhaseInDuration) / mMainDuration;
              double v77 = 1.0;
              if (*(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1))
              {
                double v78 = 0.0;
                if (v76 >= 0.15)
                {
                  float v79 = ((v76 + -0.150000006) / 0.850000024 + -0.5) * 3.14159274;
                  double v108 = v73;
                  float v80 = sinf(v79);
                  double v73 = v108;
                  goto LABEL_109;
                }
              }

              else
              {
                float v83 = (v76 + -0.5) * 3.14159274;
                double v84 = v73;
                float v80 = sinf(v83);
                double v73 = v84;
                double v77 = 1.0;
LABEL_109:
                double v78 = (v80 + v77) * 0.5;
              }

              double v85 = v73 * (v78 * 2.0 + -1.0);
              double v86 = v73 * (v77 + v78 * -2.0);
              if (v57 >= v77) {
                double v81 = v86;
              }
              else {
                double v81 = 0.0;
              }
              if (v57 >= v77) {
                double v82 = 0.0;
              }
              else {
                double v82 = v85;
              }
            }

            if (*(_BYTE *)(v28 + 98) && self->super._panoramaPanningOffsets)
            {
              if (v57 <= 2.0) {
                double v87 = v82;
              }
              else {
                double v87 = v81;
              }
              -[MREffect valueForPanoramaPanningForElementID:value:minValue:maxValue:]( self,  "valueForPanoramaPanningForElementID:value:minValue:maxValue:",  v55,  -v87,  -v73,  v73);
              double v89 = -v88;
              if (v57 <= 2.0) {
                double v82 = v89;
              }
              else {
                double v81 = v89;
              }
            }

            [v115 localAspectRatio];
            float v92 = v82 / v91;
            float v90 = v81;
            *(float *)&double v93 = MRMatrix_Translate(v111, v90, v92, 0.0);
            objc_msgSend(v115, "composeModelViewMatrix:saveTo:", v111, 0, v93);
            uint64_t v24 = v117;
            double v26 = 1.0;
            double v53 = v119;
LABEL_125:
            if (*(_BYTE *)(v28 + 98))
            {
              int v94 = *(unsigned __int8 *)(v28 + 112);
              id v95 = [(id)v28 frame];
              uint64_t v96 = *(void *)(v28 + 80);
              double v97 = *(double *)(v28 + 56);
              double v98 = *(double *)(v28 + 88);
              if (v94) {
                -[MREffectScrapbook _drawBreakTwoPartFrame:index:rect:rotation:forcedAspectRatio:time:inContext:withArguments:]( self,  "_drawBreakTwoPartFrame:index:rect:rotation:forcedAspectRatio:time:inContext:withArguments:",  v95,  v96,  v115,  a5,  v51,  v123,  v52,  v53,  v97,  v98,  a3);
              }
              else {
                -[MREffectScrapbook _drawBreakFrame:index:rect:rotation:forcedAspectRatio:layout:offset:time:inContext:withArguments:]( self,  "_drawBreakFrame:index:rect:rotation:forcedAspectRatio:layout:offset:time:inContext:withArguments:",  v95,  v96,  v28,  v115,  a5,  v51,  v123,  v52,  v53,  v97,  v98,  v113,  height,  *(void *)&a3);
              }
              v25 = (id *)&unk_2B0000;
              if (v122) {
                goto LABEL_134;
              }
            }

            else
            {
              double v99 = v123 + height;
              double v100 = v51 + v113;
              v25 = (id *)&unk_2B0000;
              if (*(_BYTE *)(v28 + 97))
              {
                -[MREffectScrapbook _drawTextWithInfo:rect:zIndex:zRotation:time:inContext:withArguments:]( self,  "_drawTextWithInfo:rect:zIndex:zRotation:time:inContext:withArguments:",  v121,  v23,  v115,  a5,  v51 + v113,  v123 + height,  v52,  v53,  *(double *)(v28 + 56),  a3);
              }

              else if (*(void *)(v28 + 80) == -1LL)
              {
                -[MREffectScrapbook _drawFrame:info:rect:stretch:zIndex:zRotation:subtract:key:time:inContext:withArguments:]( self,  "_drawFrame:info:rect:stretch:zIndex:zRotation:subtract:key:time:inContext:withArguments:",  v29,  v121,  *(unsigned __int8 *)(v28 + 96),  v23,  *(MRImage **)((char *)&self->mTextImage0 + 1),  0LL,  v51 + v113,  v123 + height,  v52,  v53,  *(double *)(v28 + 56),  a3,  v115,  a5);
              }

              else if ([(id)v28 mask])
              {
                -[MREffectScrapbook _drawMask:index:rect:zIndex:zRotation:subtract:time:inContext:withArguments:]( self,  "_drawMask:index:rect:zIndex:zRotation:subtract:time:inContext:withArguments:",  [(id)v28 mask],  *(void *)(v28 + 80),  v23,  *(MRImage **)((char *)&self->mTextImage0 + 1),  v115,  a5,  v100,  v99,  v52,  v53,  *(double *)(v28 + 56),  a3);
              }

              else
              {
                id v101 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(*(void *)(v28 + 80)));
                [v101 showTime];
                if (v102 > a3
                  || ([v101 showTime], double v104 = v103, objc_msgSend(v101, "showDuration"), v104 + v105 <= a3))
                {
                  -[MREffectScrapbook _drawFrame:info:rect:stretch:zIndex:zRotation:subtract:key:time:inContext:withArguments:]( self,  "_drawFrame:info:rect:stretch:zIndex:zRotation:subtract:key:time:inContext:withArguments:",  v29,  v121,  *(unsigned __int8 *)(v28 + 96),  v23,  *(MRImage **)((char *)&self->mTextImage0 + 1),  0LL,  v100,  v99,  v52,  v53,  *(double *)(v28 + 56),  v115,  a5);
                }

                else
                {
                  -[MREffectScrapbook _drawBlendedFrame:info:index:rect:zIndex:zRotation:subtract:time:inContext:withArguments:]( self,  "_drawBlendedFrame:info:index:rect:zIndex:zRotation:subtract:time:inContext:withArguments:",  v29,  v121,  *(void *)(v28 + 80),  v23,  *(MRImage **)((char *)&self->mTextImage0 + 1),  v115,  v100,  v99,  v52,  v53,  *(double *)(v28 + 56),  a5);
                }

                uint64_t v24 = v117;
              }

              double v26 = 1.0;
              if (v122) {
LABEL_134:
              }
                [v115 restoreForeColor:v134];
            }
          }

          ++v23;
        }

        double v27 = (char *)v27 + 1;
      }

      while (v27 != v22);
      id v106 = [v20 countByEnumeratingWithState:&v128 objects:v135 count:16];
      id v22 = v106;
    }

    while (v106);
  }

  [v5 unsetShader];
  [v5 restoreModelViewMatrix:v136];
  if (v109) {
    [v5 restoreBackColor:v138];
  }
  LODWORD(v107) = v110;
  [v5 setLocalAspectRatio:v107];
}

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  MRMatrix_Invert((float *)((char *)&self->mTextSize.height + 1), v30);
  id v10 = objc_msgSend( *(id *)((char *)&self->mFrameProviders + 1),  "objectForKey:",  @"text0",  MRMatrix_PreMultiply(a4, (uint64_t)v30));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  double v12 = *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1);
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v13) {
    return 0LL;
  }
  id v14 = v13;
  __int128 v11 = 0LL;
  uint64_t v15 = *(void *)v26;
  do
  {
    double v16 = 0LL;
    do
    {
      if (*(void *)v26 != v15) {
        objc_enumerationMutation(v12);
      }
      double v17 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v16);
      if ([v17 hasPrefix:@"image"])
      {
        id v18 = [*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v17];
        if (v18 && objc_msgSend(v18, "hitAtPoint:withInverseMatrix:localPoint:", v30, &v24, x, y))
        {
          if (v11)
          {
            id v19 = (char *)[v17 compare:v11];
            if (v19 == (_BYTE *)&dword_0 + 1) {
              v20 = v17;
            }
            else {
              v20 = v11;
            }
            if (v19 != (_BYTE *)&dword_0 + 1 || a5 == 0LL) {
              double v17 = v20;
            }
            else {
LABEL_27:
            }
              *a5 = v24;
          }

          else if (a5)
          {
            goto LABEL_27;
          }
        }

        else
        {
          double v17 = v11;
        }

        __int128 v11 = v17;
      }

      double v16 = (char *)v16 + 1;
    }

    while (v14 != v16);
    id v22 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    id v14 = v22;
  }

  while (v22);
  return v11;
}

- (BOOL)getVerticesCoordinates:(MREffectScrapbook *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  *(float *)&double v8 = MRMatrix_MultiplyWithMatrix((float *)((char *)&self->mTextSize.height + 1), a4, v11);
  id v9 = objc_msgSend(*(id *)((char *)&self->mFrameProviders + 1), "objectForKey:", a5, v8);
  if (v9) {
    LOBYTE(v9) = [v9 getVerticesCoordinates:a3 withMatrix:v11];
  }
  return (char)v9;
}

- (BOOL)getCurrentCenter:(CGPoint *)a3 scale:(double *)a4 rotation:(double *)a5 isMain:(BOOL *)a6 forElement:(id)a7
{
  id v11 = [*(id *)((char *)&self->mFrameProviders + 1) objectForKey:a7];
  double v12 = v11;
  if (v11)
  {
    if (a3)
    {
      [v11 position];
      a3->double x = v13;
      a3->double y = v14;
    }

    if (a4)
    {
      [v12 halfSize];
      *(void *)a4 = v15;
    }

    if (a5)
    {
      [v12 rotation];
      *(void *)a5 = v16;
    }

    if (a6) {
      *a6 = 1;
    }
  }

  return v12 != 0LL;
}

- (void)_drawTextWithInfo:(id)a3 rect:(CGRect)a4 zIndex:(int64_t)a5 zRotation:(double)a6 time:(double)a7 inContext:(id)a8 withArguments:(id)a9
{
  id v10 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v10)
  {
    double y = a4.origin.y;
    double x = a4.origin.x;
    objc_msgSend(v10, "width", a3, a5, a8, a9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a6, a7);
    double v16 = v15 / self->super.mPixelSize.width + v15 / self->super.mPixelSize.width;
    [*(id *)((char *)&self->mTextRenderer0 + 1) height];
    double v18 = v17;
    double height = self->super.mPixelSize.height;
    unsigned int v20 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"L1_Subtitle");
    if (!-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title2")
      && !-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"_Title")
      && !v20)
    {
      double x = x + v16 * 0.5;
    }

    id v21 = *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1);
    double v22 = v18 / height;
    uint64_t v23 = (MRCroppingSprite *)[v21 objectForKey:@"text0"];
    if (!v23)
    {
      uint64_t v23 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
      [v21 setObject:v23 forKey:@"text0"];
    }

    double v24 = v22 + v22;
    if (-[NSString isEqualToString:]( -[MRLayerEffect editedElement](self->super.mEffectLayer, "editedElement"),  "isEqualToString:",  @"text0")
      && -[MRLayerEffect _hideTextWhileEditing](self->super.mEffectLayer, "_hideTextWhileEditing"))
    {
      *(float *)&double v25 = a6;
      -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v23,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a8,  x,  y,  v16,  v24,  v25);
      if (!v20) {
        return;
      }
LABEL_13:
      float64x2_t v28 = vdivq_f64(*(float64x2_t *)(&self->mIsMovieOnly + 1), (float64x2_t)self->super.mPixelSize);
      *(float *)&double v26 = a6;
      -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v23,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a8,  x,  y,  vaddq_f64(v28, v28),  v26);
      return;
    }

    [a8 blend:2];
    *(float *)&double v27 = a6;
    -[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:]( v23,  "renderImage:inContext:atPosition:andSize:zRotation:",  *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1),  a8,  x,  y,  v16,  v24,  v27);
    [a8 blend:0];
    if (v20) {
      goto LABEL_13;
    }
  }

- (void)_drawFrame:(id)a3 info:(id)a4 rect:(CGRect)a5 stretch:(BOOL)a6 zIndex:(int64_t)a7 zRotation:(double)a8 subtract:(id)a9 key:(id)a10 time:(double)a11 inContext:(id)a12 withArguments:(id)a13
{
  BOOL v16 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat v23 = *((double *)a4 + 7);
  CGFloat v70 = *((double *)a4 + 6);
  CGFloat v71 = *((double *)a4 + 5);
  CGFloat v24 = *((double *)a4 + 8);
  id v25 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", a3),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a12,  a13,  a11);
  if (v16)
  {
    if (!a10) {
      a10 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%d-%d",  a7,  [a9 count]);
    }
    double v26 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:a10];
    if (!v26)
    {
      id v27 = a9;
      float64x2_t v28 = self;
      id v29 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
      *(float *)&double v30 = a8;
      double v26 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v29,  "initWithPosition:size:zRotation:innerRect:context:",  a12,  x,  y,  width,  height,  v30,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      double v31 = v27;
      id v32 = [v27 countByEnumeratingWithState:&v76 objects:v81 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v77;
        do
        {
          for (i = 0LL; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v77 != v34) {
              objc_enumerationMutation(v31);
            }
            float v36 = *(double **)(*((void *)&v76 + 1) + 8LL * (void)i);
            double v37 = v36[7];
            *(float *)&double v37 = v37;
            -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v26,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a12,  v36[1],  v36[2],  v36[3],  v36[4],  v37,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
          }

          id v33 = [v31 countByEnumeratingWithState:&v76 objects:v81 count:16];
        }

        while (v33);
      }

      [*(id *)((char *)&v28->mFrameProviders + 1) setObject:v26 forKey:a10];
    }

    [a12 blend:2];
    -[MRTiledSprite renderDumbImage:inContext:](v26, "renderDumbImage:inContext:", v25, a12);
    goto LABEL_40;
  }

  int v38 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%d-%d",  a7,  [a9 count]);
  int v39 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v38];
  if (!v39)
  {
    float v68 = v38;
    id v41 = a9;
    double v42 = self;
    id v69 = v25;
    double v43 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    *(float *)&double v44 = a8;
    double v40 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v43,  "initWithPosition:size:zRotation:innerRect:context:",  a12,  x,  y,  width,  height,  v44,  *(void *)&v71,  *(void *)&v70,  *(void *)&v23,  *(void *)&v24);
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    id v45 = v41;
    id v46 = [v41 countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (!v46) {
      goto LABEL_36;
    }
    id v47 = v46;
    uint64_t v48 = *(void *)v73;
    while (1)
    {
      for (j = 0LL; j != v47; j = (char *)j + 1)
      {
        if (*(void *)v73 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = *(void *)(*((void *)&v72 + 1) + 8LL * (void)j);
        double v52 = *(double *)(v50 + 8);
        double v51 = *(double *)(v50 + 16);
        double v53 = *(double *)(v50 + 24);
        double v54 = *(double *)(v50 + 32);
        float v55 = (double *)objc_msgSend((id)qword_2B05B8, "objectForKey:", objc_msgSend((id)v50, "frame"));
        if (v53 == 0.0 && *(_BYTE *)(v50 + 98))
        {
LABEL_25:
          id v56 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](v42->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(*(void *)(v50 + 80)));
          [a12 localAspectRatio];
          [v56 imageAspectRatio];
          goto LABEL_28;
        }

        if (v54 == 0.0)
        {
          if (*(_BYTE *)(v50 + 98)) {
            goto LABEL_25;
          }
          [a12 localAspectRatio];
          double v54 = v53 * (v58 / (v55[9] / v55[10]));
        }

        else
        {
          [a12 localAspectRatio];
          double v54 = v54 * v57;
        }

- (void)_drawMask:(id)a3 index:(int64_t)a4 rect:(CGRect)a5 zIndex:(int64_t)a6 zRotation:(double)a7 subtract:(id)a8 time:(double)a9 inContext:(id)a10 withArguments:(id)a11
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat v23 = ImageKey(a4);
  id v24 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v23),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a10,  a11,  a9);
  id v25 = *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1);
  double v26 = (MRCroppingSprite *)[v25 objectForKey:v23];
  if (!v26)
  {
    double v26 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v25 setObject:v26 forKey:v23];
  }

  if (NSStringIsEqual(a3, "None"))
  {
    id v27 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%d-%d",  a6,  [a8 count]);
    float64x2_t v28 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v27];
    if (v28)
    {
      id v29 = v28;
      float v30 = a7;
    }

    else
    {
      float v59 = v27;
      double v61 = v26;
      uint64_t v34 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
      float v35 = a7;
      float v60 = v35;
      id v29 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v34,  "initWithPosition:size:zRotation:innerRect:context:",  a10,  x,  y,  width,  height,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      id v36 = [a8 countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v64;
        do
        {
          for (i = 0LL; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v64 != v38) {
              objc_enumerationMutation(a8);
            }
            double v40 = *(double **)(*((void *)&v63 + 1) + 8LL * (void)i);
            double v42 = v40[1];
            double v41 = v40[2];
            double v43 = v40[3];
            double v44 = v40[4];
            id v45 = (double *)objc_msgSend((id)qword_2B05B8, "objectForKey:", objc_msgSend(v40, "frame"));
            [a10 localAspectRatio];
            double v47 = v46;
            if (v44 == 0.0) {
              double v48 = v43 * (v47 / (v45[9] / v45[10]));
            }
            else {
              double v48 = v44 * v47;
            }
            [a10 localAspectRatio];
            double v50 = v41 * v49;
            double v51 = v45[1];
            double v52 = v45[2];
            if (v51 == 0.0) {
              double v53 = 0.0;
            }
            else {
              double v53 = 0.00999999978;
            }
            if (v52 == 0.0) {
              double v54 = 0.0;
            }
            else {
              double v54 = 0.00999999978;
            }
            uint64_t v55 = *((void *)v45 + 3);
            uint64_t v56 = *((void *)v45 + 4);
            CGRect v68 = CGRectInset(*(CGRect *)&v51, v53, v54);
            double v57 = v40[7];
            *(float *)&double v57 = v57;
            -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v29,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a10,  v42,  v50,  v43,  v48,  v57,  *(void *)&v68.origin.x,  *(void *)&v68.origin.y,  *(void *)&v68.size.width,  *(void *)&v68.size.height);
          }

          id v37 = [a8 countByEnumeratingWithState:&v63 objects:v67 count:16];
        }

        while (v37);
      }

      [*(id *)((char *)&self->mFrameProviders + 1) setObject:v29 forKey:v59];

      double v26 = v61;
      float v30 = v60;
    }

    -[MRTiledSprite renderImage:inContext:](v29, "renderImage:inContext:", v24, a10);
    *(float *)&double v58 = v30;
    -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v26,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a10,  x,  y,  width,  height,  v58);
  }

  else
  {
    id v31 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", a3),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a10,  a11,  a9);
    [v31 setPreservesAspectRatio:0];
    LODWORD(v32) = 0;
    [v31 setOnContext:a10 onTextureUnit:1 withReferenceAspectRatio:&v62 state:v32];
    [a10 blend:2];
    [a10 unsetShader];
    [a10 setShader:@"AlphaMaskPremultipliedOnlyAlpha"];
    *(float *)&double v33 = a7;
    -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v26,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v24,  a10,  x,  y,  width,  height,  v33);
    [v31 unsetOnContext:a10 onTextureUnit:1 state:&v62];
    [a10 unsetShader];
    [a10 setShader:@"PlainTexture"];
    [a10 blend:0];
    [v31 releaseByUser];
  }

  [v24 releaseByUser];
}

- (void)_drawFrame:(id)a3 info:(id)a4 index:(int64_t)a5 rect:(CGRect)a6 zIndex:(int64_t)a7 zRotation:(double)a8 subtract:(id)a9 time:(double)a10 inContext:(id)a11 withArguments:(id)a12
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v23 = a12;
  id v24 = ImageKey(a5);
  id v25 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v24),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a11,  a12,  a10);
  double v26 = *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1);
  id v106 = (MRCroppingSprite *)[v26 objectForKey:v24];
  if (!v106)
  {
    id v27 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v26 setObject:v27 forKey:v24];
    id v106 = v27;
  }

  double v28 = *((double *)a4 + 7);
  double v29 = *((double *)a4 + 8);
  double v31 = *((double *)a4 + 1);
  double v30 = *((double *)a4 + 2);
  CGFloat v112 = *((double *)a4 + 3);
  CGFloat rect = *((double *)a4 + 4);
  double v110 = height * v29 * 1.02999997;
  double v111 = width * v28 * 1.02999997;
  double v102 = v29;
  double v103 = v28;
  double v104 = *((double *)a4 + 6);
  double v105 = *((double *)a4 + 5);
  id v101 = (double *)a4;
  double v108 = y + (v104 - (1.0 - (v104 + v29))) * 0.5 / (*((double *)a4 + 9) / *((double *)a4 + 10));
  double v109 = x + (v105 - (1.0 - (v105 + v28))) * 0.5;
  double v32 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"outer-%d-%d",  a7,  [a9 count]);
  double v33 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"tiled-%d-%d",  a7,  [a9 count]);
  uint64_t v34 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v32];
  float v35 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v33];
  if (!v34 || (id v36 = v35) == 0LL)
  {
    int v94 = v32;
    id v95 = v25;
    double v97 = self;
    double v98 = a10;
    id v37 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    double v96 = a8;
    float v38 = a8;
    float v100 = v38;
    double v40 = v104;
    double v39 = v105;
    if (v105 == 0.0) {
      double v41 = 0.0;
    }
    else {
      double v41 = -0.00999999978;
    }
    if (v104 == 0.0) {
      double v42 = 0.0;
    }
    else {
      double v42 = -0.00999999978;
    }
    double v44 = v102;
    double v43 = v103;
    CGRect v122 = CGRectInset(*(CGRect *)&v39, v41, v42);
    double v115 = height;
    double v116 = x;
    CGFloat v93 = v122.origin.x;
    CGFloat v45 = v122.origin.y;
    CGFloat v46 = v122.size.width;
    double v114 = width;
    CGFloat v47 = v122.size.height;
    if (v31 == 0.0) {
      double v48 = 0.0;
    }
    else {
      double v48 = 0.00999999978;
    }
    if (v30 == 0.0) {
      double v49 = 0.0;
    }
    else {
      double v49 = 0.00999999978;
    }
    v123.origin.double x = v31;
    v123.origin.double y = v30;
    v123.size.double width = v112;
    v123.size.double height = rect;
    CGRect v124 = CGRectInset(v123, v48, v49);
    CGFloat v92 = v46;
    double v51 = width;
    double v50 = v115;
    double v52 = v116;
    *(float *)&double v53 = v100;
    uint64_t v34 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:outerRect:context:]( v37,  "initWithPosition:size:zRotation:innerRect:outerRect:context:",  a11,  v116,  y,  width,  v115,  v53,  *(void *)&v93,  *(void *)&v45,  *(void *)&v92,  *(void *)&v47,  *(void *)&v124.origin.x,  *(void *)&v124.origin.y,  *(void *)&v124.size.width,  *(void *)&v124.size.height);
    double v54 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    *(float *)&double v55 = v100;
    id v36 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v54,  "initWithPosition:size:zRotation:innerRect:context:",  a11,  v109,  v108,  v111,  v110,  v55,  *(void *)&CGRectZero.origin.x,  *(void *)&CGRectZero.origin.y,  *(void *)&CGRectZero.size.width,  *(void *)&CGRectZero.size.height);
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    id v56 = [a9 countByEnumeratingWithState:&v117 objects:v121 count:16];
    if (v56)
    {
      id v57 = v56;
      uint64_t v58 = *(void *)v118;
      double v113 = y;
      do
      {
        float v59 = 0LL;
        do
        {
          if (*(void *)v118 != v58) {
            objc_enumerationMutation(a9);
          }
          float v60 = *(double **)(*((void *)&v117 + 1) + 8LL * (void)v59);
          double v62 = v60[1];
          double v61 = v60[2];
          double v64 = v60[3];
          double v63 = v60[4];
          __int128 v65 = (double *)objc_msgSend((id)qword_2B05B8, "objectForKey:", objc_msgSend(v60, "frame"));
          [a11 localAspectRatio];
          double v67 = v66;
          if (v63 == 0.0) {
            double v68 = v64 * (v67 / (v65[9] / v65[10]));
          }
          else {
            double v68 = v63 * v67;
          }
          [a11 localAspectRatio];
          double v70 = v61 * v69;
          double v71 = v65[1];
          double v72 = v65[2];
          if (v71 == 0.0) {
            double v73 = 0.0;
          }
          else {
            double v73 = 0.00999999978;
          }
          if (v72 == 0.0) {
            double v74 = 0.0;
          }
          else {
            double v74 = 0.00999999978;
          }
          uint64_t v75 = *((void *)v65 + 3);
          uint64_t v76 = *((void *)v65 + 4);
          CGRect v125 = CGRectInset(*(CGRect *)&v71, v73, v74);
          CGFloat v77 = v125.origin.x;
          CGFloat v78 = v125.origin.y;
          CGFloat v79 = v125.size.width;
          CGFloat v80 = v125.size.height;
          *(float *)&double v81 = v60[7];
          -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v36,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a11,  v62,  v70,  v64,  v68,  v81,  *(void *)&v125.origin.x,  *(void *)&v125.origin.y,  *(void *)&v125.size.width,  *(void *)&v125.size.height);
          *(float *)&double v82 = v60[7];
          -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v34,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a11,  v62,  v70,  v64,  v68,  v82,  *(void *)&v77,  *(void *)&v78,  *(void *)&v79,  *(void *)&v80);
          float v59 = (char *)v59 + 1;
          double y = v113;
          double v50 = v115;
          double v52 = v116;
          double v51 = v114;
        }

        while (v57 != v59);
        id v57 = [a9 countByEnumeratingWithState:&v117 objects:v121 count:16];
      }

      while (v57);
    }

    double v84 = v104;
    double v83 = v105;
    if (v105 == 0.0) {
      double v85 = 0.0;
    }
    else {
      double v85 = 0.00999999978;
    }
    if (v104 == 0.0) {
      double v86 = 0.0;
    }
    else {
      double v86 = 0.00999999978;
    }
    double v88 = v102;
    double v87 = v103;
    CGRect v126 = CGRectInset(*(CGRect *)&v83, v85, v86);
    double v89 = v51 * v126.size.width;
    *(float *)&double v89 = v100;
    -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v34,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a11,  v52 + (v126.origin.x - (1.0 - (v126.origin.x + v126.size.width))) * 0.5,  y + (v126.origin.y - (1.0 - (v126.origin.y + v126.size.height))) * 0.5 / (v101[9] / v101[10]),  v51 * v126.size.width,  v50 * v126.size.height,  v89,  *(void *)&v126.origin.x,  *(void *)&v126.origin.y,  *(void *)&v126.size.width,  *(void *)&v126.size.height);
    self = v97;
    [*(id *)((char *)&v97->mFrameProviders + 1) setObject:v34 forKey:v94];
    [*(id *)((char *)&v97->mFrameProviders + 1) setObject:v36 forKey:v33];

    a10 = v98;
    id v23 = a12;
    a8 = v96;
    id v25 = v95;
  }

  if (v25)
  {
    -[MRTiledSprite renderImage:inContext:](v36, "renderImage:inContext:", v25, a11);
    *(float *)&double v90 = a8;
    -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v106,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a11,  v109,  v108,  v111,  v110,  v90);
    [v25 releaseByUser];
  }

  id v91 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", a3),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a11,  v23,  a10);
  -[MRTiledSprite renderImageMiddle:inContext:](v34, "renderImageMiddle:inContext:", v91, a11);
  [a11 blend:2];
  -[MRTiledSprite renderImageInner:inContext:](v34, "renderImageInner:inContext:", v91, a11);
  -[MRTiledSprite renderImageOuter:inContext:](v34, "renderImageOuter:inContext:", v91, a11);
  [a11 blend:0];
  [v91 releaseByUser];
}

- (void)_drawBlendedFrame:(id)a3 info:(id)a4 index:(int64_t)a5 rect:(CGRect)a6 zIndex:(int64_t)a7 zRotation:(double)a8 subtract:(id)a9 time:(double)a10 inContext:(id)a11 withArguments:(id)a12
{
  double height = a6.size.height;
  double width = a6.size.width;
  double x = a6.origin.x;
  double y = a6.origin.y;
  id v19 = a12;
  unsigned int v20 = ImageKey(a5);
  double v87 = a10;
  id v94 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v20),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a11,  a12,  a10);
  id v21 = *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1);
  double v22 = (MRCroppingSprite *)[v21 objectForKey:v20];
  if (!v22)
  {
    double v22 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v21 setObject:v22 forKey:v20];
  }

  double v23 = *((double *)a4 + 5);
  double v24 = *((double *)a4 + 6);
  double v25 = *((double *)a4 + 7);
  double v84 = *((double *)a4 + 2);
  double v85 = *((double *)a4 + 1);
  uint64_t v82 = *((void *)a4 + 4);
  uint64_t v83 = *((void *)a4 + 3);
  double v88 = width;
  double rect = *((double *)a4 + 8);
  double v26 = width * v25;
  double v27 = v23 - (1.0 - (v23 + v25));
  double v28 = 0.5;
  double v29 = *((double *)a4 + 11);
  double v30 = (v24 - (1.0 - (v24 + rect))) * 0.5 / (*((double *)a4 + 9) / *((double *)a4 + 10));
  double v31 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%d-%d",  a7,  [a9 count]);
  double v32 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v31];
  double v33 = v94;
  if (!v32)
  {
    CGFloat v78 = v31;
    double v79 = v30;
    double v80 = v23 - (1.0 - (v23 + v25));
    double v81 = self;
    uint64_t v34 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    if (v23 == 0.0) {
      double v36 = 0.0;
    }
    else {
      double v36 = 0.00999999978;
    }
    if (v24 == 0.0) {
      double v37 = 0.0;
    }
    else {
      double v37 = 0.00999999978;
    }
    v101.origin.double x = v23;
    v101.origin.double y = v24;
    v101.size.double width = v25;
    v101.size.double height = rect;
    CGRect v102 = CGRectInset(v101, v36, v37);
    CGFloat v38 = v102.origin.x;
    CGFloat v39 = v102.origin.y;
    CGFloat v40 = v102.size.width;
    CGFloat v41 = v102.size.height;
    double v43 = v84;
    double v42 = v85;
    if (v85 == 0.0) {
      double v44 = 0.0;
    }
    else {
      double v44 = 0.00999999978;
    }
    if (v84 == 0.0) {
      double v45 = 0.0;
    }
    else {
      double v45 = 0.00999999978;
    }
    uint64_t v47 = v82;
    uint64_t v46 = v83;
    CGRect v103 = CGRectInset(*(CGRect *)&v42, v44, v45);
    float v35 = a8;
    *(float *)&double v48 = v35;
    double v32 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:outerRect:context:]( v34,  "initWithPosition:size:zRotation:innerRect:outerRect:context:",  a11,  x,  y,  v88,  height,  v48,  *(void *)&v38,  *(void *)&v39,  *(void *)&v40,  *(void *)&v41,  *(void *)&v103.origin.x,  *(void *)&v103.origin.y,  *(void *)&v103.size.width,  *(void *)&v103.size.height);
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    id v49 = [a9 countByEnumeratingWithState:&v96 objects:v100 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v97;
      do
      {
        for (i = 0LL; i != v50; i = (char *)i + 1)
        {
          if (*(void *)v97 != v51) {
            objc_enumerationMutation(a9);
          }
          double v53 = *(double **)(*((void *)&v96 + 1) + 8LL * (void)i);
          double v54 = v53[1];
          double v55 = v53[2];
          double v56 = v53[3];
          double v57 = v53[4];
          uint64_t v58 = (double *)objc_msgSend((id)qword_2B05B8, "objectForKey:", objc_msgSend(v53, "frame"));
          [a11 localAspectRatio];
          double v60 = v59;
          if (v57 == 0.0) {
            double v61 = v56 * (v60 / (v58[9] / v58[10]));
          }
          else {
            double v61 = v57 * v60;
          }
          [a11 localAspectRatio];
          double v63 = v55 * v62;
          double v64 = v58[1];
          double v65 = v58[2];
          if (v64 == 0.0) {
            double v66 = 0.0;
          }
          else {
            double v66 = 0.00999999978;
          }
          if (v65 == 0.0) {
            double v67 = 0.0;
          }
          else {
            double v67 = 0.00999999978;
          }
          uint64_t v68 = *((void *)v58 + 3);
          uint64_t v69 = *((void *)v58 + 4);
          CGRect v104 = CGRectInset(*(CGRect *)&v64, v66, v67);
          double v70 = v53[7];
          *(float *)&double v70 = v70;
          -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v32,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a11,  v54,  v63,  v56,  v61,  v70,  *(void *)&v104.origin.x,  *(void *)&v104.origin.y,  *(void *)&v104.size.width,  *(void *)&v104.size.height);
        }

        id v50 = [a9 countByEnumeratingWithState:&v96 objects:v100 count:16];
      }

      while (v50);
    }

    self = v81;
    [*(id *)((char *)&v81->mFrameProviders + 1) setObject:v32 forKey:v78];

    double v33 = v94;
    id v19 = a12;
    double v27 = v80;
    double v28 = 0.5;
    double v30 = v79;
  }

  double v71 = v26 * v29;
  double v72 = x + v27 * v28;
  double v73 = y + v30;
  if (v33)
  {
    id v74 = [v33 retainedByUserImage];
    [v74 setScale:v71 / v88];
    [v74 setCenterX:v72 - x + v72 - x];
    [v74 setCenterY:(v73 - y) * -2.0];
    -[MRTiledSprite renderImageInner:inContext:](v32, "renderImageInner:inContext:", v74, a11);
  }

  else
  {
    id v74 = 0LL;
  }

  id v75 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", a3),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a11,  v19,  v87);
  [v75 setPreservesAspectRatio:0];
  [a11 unsetShader];
  [a11 setShader:@"FrameWithMask"];
  double v76 = v88 * self->super.mPixelSize.width / (height * self->super.mPixelSize.height);
  *(float *)&double v76 = v76;
  [v75 setOnContext:a11 onTextureUnit:1 withReferenceAspectRatio:&v95 state:v76];
  -[MRTiledSprite setNeedsInSpriteCoordinates:](v32, "setNeedsInSpriteCoordinates:", 1LL);
  -[MRTiledSprite renderImageMiddle:inContext:](v32, "renderImageMiddle:inContext:", v74, a11);
  *(float *)&double v77 = a8;
  -[MRCroppingSprite fakeRenderInContext:atPosition:andSize:zRotation:]( v22,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a11,  v72,  v73,  v71,  height * rect * v29,  v77);
  [v75 unsetOnContext:a11 onTextureUnit:1 state:&v95];
  [a11 unsetShader];
  [a11 setShader:@"PlainTexture"];
  -[MRTiledSprite setNeedsInSpriteCoordinates:](v32, "setNeedsInSpriteCoordinates:", 0LL);
  [a11 blend:2];
  -[MRTiledSprite renderImageOuter:inContext:](v32, "renderImageOuter:inContext:", v75, a11);
  [a11 blend:0];
  [v75 releaseByUser];
  [v74 releaseByUser];
  [v33 releaseByUser];
}

- (void)_drawBreakTwoPartFrame:(id)a3 index:(int64_t)a4 rect:(CGRect)a5 rotation:(double)a6 forcedAspectRatio:(double)a7 time:(double)a8 inContext:(id)a9 withArguments:(id)a10
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v22 = ImageKey(a4);
  id v23 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v22),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a9,  a10,  a8);
  double v24 = *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1);
  double v25 = (MRCroppingSprite *)[v24 objectForKey:v22];
  if (!v25)
  {
    double v25 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v24 setObject:v25 forKey:v22];
  }

  [v23 aspectRatio];
  if ((v26 >= 1.0 || ([v23 aspectRatio], v27 >= a7))
    && (([v23 aspectRatio], v28 < 1.0) || (objc_msgSend(v23, "aspectRatio"), v29 <= a7)))
  {
    -[MREffectScrapbook _drawBreakFrame:index:rect:rotation:forcedAspectRatio:layout:offset:time:inContext:withArguments:]( self,  "_drawBreakFrame:index:rect:rotation:forcedAspectRatio:layout:offset:time:inContext:withArguments:",  a3,  a4,  0LL,  a9,  a10,  x,  y,  width,  height,  a6,  a7,  CGSizeZero.width,  CGSizeZero.height,  *(void *)&a8);
  }

  else
  {
    if (a7 <= 0.0)
    {
      [v23 aspectRatio];
      a7 = v30;
    }

    if (width == 0.0)
    {
      [a9 localAspectRatio];
      double width = a7 * (height / v31);
    }

    else if (height == 0.0)
    {
      [a9 localAspectRatio];
      double height = width * v32 / a7;
    }

    MRMatrix_Clear((uint64_t)v58);
    if (a7 >= 1.0) {
      float v33 = 4.0;
    }
    else {
      float v33 = 2.0;
    }
    *(float *)&double v34 = MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v58, 0.0, 0.0, v33);
    objc_msgSend(a9, "composeModelViewMatrix:saveTo:", v58, v57, v34);
    if (a7 >= 1.0) {
      double v35 = 3.0;
    }
    else {
      double v35 = CGPointZero.x;
    }
    if (a7 >= 1.0) {
      double v36 = CGPointZero.y;
    }
    else {
      double v36 = 1.0;
    }
    double v51 = v36;
    double v52 = v35;
    double v56 = a8;
    if (a7 < 1.0)
    {
      double v38 = x + width * -0.5;
      double v37 = y + 0.100000001;
      double v54 = CGPointZero.x;
      double v55 = 3.0;
    }

    else
    {
      double v37 = y + height * -0.5;
      double v38 = x + 0.100000001;
      double v55 = CGPointZero.y;
      double v54 = 1.0;
    }

    double v53 = width * (-0.05 / width * 0.800000012 + 1.0);
    [a9 localAspectRatio];
    double v40 = height * (v39 * -0.05 / height * 0.800000012 + 1.0);
    [v23 aspectRatio];
    *(float *)&double v42 = v41;
    -[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v25,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v23,  a9,  v38,  v37,  v53,  v40,  v42,  v52,  v51);
    [a9 blend:2];
    -[MREffectScrapbook _drawBreakFrameInRect:frameWidth:time:inContext:withArguments:]( self,  "_drawBreakFrameInRect:frameWidth:time:inContext:withArguments:",  a9,  a10,  v38,  v37,  width,  height);
    [a9 blend:0];
    [a9 restoreModelViewMatrix:v57];
    MRMatrix_Clear((uint64_t)v58);
    *(float *)&double v43 = MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v58, 0.0, 0.0, -1.0);
    objc_msgSend(a9, "composeModelViewMatrix:saveTo:", v58, v57, v43);
    double v44 = width * 0.5 + -0.025;
    if (a7 >= 1.0) {
      double v45 = y + height * 0.5;
    }
    else {
      double v45 = y + -0.100000001;
    }
    if (a7 >= 1.0) {
      double v44 = -0.100000001;
    }
    double v46 = x + v44;
    [a9 localAspectRatio];
    double v48 = height * (v47 * -0.05 / height * 0.800000012 + 1.0);
    [v23 aspectRatio];
    *(float *)&double v50 = v49;
    -[MRCroppingSprite renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:]( v25,  "renderImage:inContext:atPosition:andSize:withReferenceAspectRatio:andJustifications:",  v23,  a9,  v46,  v45,  v53,  v48,  v50,  v54,  v55);
    [a9 blend:2];
    -[MREffectScrapbook _drawBreakFrameInRect:frameWidth:time:inContext:withArguments:]( self,  "_drawBreakFrameInRect:frameWidth:time:inContext:withArguments:",  a9,  a10,  v46,  v45,  width,  height,  0.05,  v56);
    [a9 blend:0];
    [a9 restoreModelViewMatrix:v57];
  }

  [v23 releaseByUser];
}

- (void)_drawBreakFrame:(id)a3 index:(int64_t)a4 rect:(CGRect)a5 rotation:(double)a6 forcedAspectRatio:(double)a7 layout:(id)a8 offset:(CGSize)a9 time:(double)a10 inContext:(id)a11 withArguments:(id)a12
{
  double height = a9.height;
  double width = a9.width;
  double v17 = a5.size.height;
  double v18 = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v22 = ImageKey(a4);
  id v23 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v22),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a11,  a12,  a10);
  double v24 = *(NSMutableDictionary **)((char *)&self->mFrameProviders + 1);
  double v25 = (MRCroppingSprite *)[v24 objectForKey:v22];
  if (!v25)
  {
    double v25 = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    [v24 setObject:v25 forKey:v22];
  }

  if (a7 <= 0.0)
  {
    [v23 aspectRatio];
    a7 = v26;
  }

  [v23 aspectRatio];
  objc_msgSend(v23, "setScale:", fmax(v27 / a7, 1.0));
  MRMatrix_Clear((uint64_t)v65);
  float v28 = a6 * 57.2957764;
  *(float *)&double v29 = MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v65, 0.0, 0.0, v28);
  objc_msgSend(a11, "composeModelViewMatrix:saveTo:", v65, v64, v29);
  [a11 localAspectRatio];
  float v61 = v30;
  double v62 = x;
  double v63 = y;
  if ([a8 backgroundPaper])
  {
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    double v57 = v18;
    double v58 = v17;
    v66.size.double width = v18;
    v66.size.double height = v17;
    CGRect v67 = CGRectInset(v66, -0.15, -0.15);
    double v32 = v67.size.width;
    double v33 = v67.size.height;
    double v34 = v67.origin.x + 0.15;
    double v35 = v67.origin.y + 0.15;
    v67.origin.CGFloat x = CGRectZero.origin.x;
    v67.origin.CGFloat y = CGRectZero.origin.y;
    v67.size.double width = CGRectZero.size.width;
    v67.size.double height = CGRectZero.size.height;
    if (!CGRectEqualToRect(v67, *(CGRect *)((char *)a8 + 120)))
    {
      else {
        double v36 = v32;
      }
      else {
        double v32 = v36;
      }
      double v34 = v34 + *((double *)a8 + 15);
      double v35 = v35 + *((double *)a8 + 16);
    }

    double v37 = v32;
    double v38 = v33;
    if (a7 < 1.0)
    {
      [a11 localAspectRatio];
      double v37 = v33 / v39;
      [a11 localAspectRatio];
      double v38 = v32 * v40;
    }

    if ([*(id *)((char *)&self->mFrameProviders + 1) objectForKey:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@-01", objc_msgSend(a8, "backgroundPaper"))])
    {
      double v41 = 0LL;
    }

    else
    {
      double v42 = objc_alloc_init(&OBJC_CLASS___MRScrapbookLayout);
      v42->rect.origin.CGFloat x = v62;
      v42->rect.origin.CGFloat y = v63;
      v42->rect.size.double width = v57 + -0.0399999991;
      v42->rect.size.double height = v58 + -0.150000006;
      double v41 = +[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v42);
    }

    id v43 = [a8 backgroundPaper];
    if (a7 >= 1.0) {
      -[MREffectScrapbook _drawLandscapePanoBackgroundInRect:paperType:subtract:inTime:inContext:withArguments:]( self,  "_drawLandscapePanoBackgroundInRect:paperType:subtract:inTime:inContext:withArguments:",  v43,  v41,  a11,  a12,  v34,  v35,  v32,  v33,  a10);
    }
    else {
      -[MREffectScrapbook _drawPortraitPanoBackgroundInRect:flippedRect:paperType:subtract:inTime:inContext:withArguments:]( self,  "_drawPortraitPanoBackgroundInRect:flippedRect:paperType:subtract:inTime:inContext:withArguments:",  v43,  v41,  a11,  a12,  v34,  v35,  v32,  v33,  v34,  v35,  v37,  v38,  *(void *)&a10);
    }
    double v18 = v57;
    double v17 = v58;
  }

  else if (!a8)
  {
    goto LABEL_34;
  }

  if (*((uint64_t *)a8 + 19) >= 1)
  {
    double v44 = (double *)objc_msgSend(*(id *)((char *)&self->mTitleAspectRatio + 1), "objectAtIndex:");
    double v45 = v44[1];
    double v46 = v44[2];
    double v48 = v44[3];
    double v47 = v44[4];
    id v49 = [v44 frame];
    if (!v49) {
      id v49 = [v44 mask];
    }
    double v50 = (double *)[(id)qword_2B05B8 objectForKey:v49];
    double v51 = v50;
    if (v47 == 0.0)
    {
      [a11 localAspectRatio];
      double v47 = v48 * (v52 / (v51[9] / v51[10]));
    }

    else if (v48 == 0.0)
    {
      double v53 = v47 / (v50[9] / v50[10]);
      [a11 localAspectRatio];
      double v48 = v53 * v54;
    }

    else
    {
      [a11 localAspectRatio];
      double v47 = v47 * v55;
    }

    [a11 localAspectRatio];
    -[MREffectScrapbook _drawFrame:info:rect:stretch:zIndex:zRotation:subtract:key:time:inContext:withArguments:]( self,  "_drawFrame:info:rect:stretch:zIndex:zRotation:subtract:key:time:inContext:withArguments:",  v49,  v51,  *((unsigned __int8 *)v44 + 96),  1LL,  0LL,  0LL,  width + v45,  height + v46 * v56,  v48,  v47,  v44[7],  a10,  a11,  a12);
  }

- (void)_drawLandscapePanoBackgroundInRect:(CGRect)a3 paperType:(id)a4 subtract:(id)a5 inTime:(double)a6 inContext:(id)a7 withArguments:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [a7 blend:2];
  double v81 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-01", a4);
  BOOL v16 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-02", a4);
  double v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-03", a4);
  double v18 = (double *)[(id)qword_2B05B8 objectForKey:v81];
  double v76 = v16;
  id v19 = (double *)[(id)qword_2B05B8 objectForKey:v16];
  unsigned int v20 = (double *)[(id)qword_2B05B8 objectForKey:v17];
  double v21 = height * (v18[9] / v18[10]);
  [a7 localAspectRatio];
  double v23 = v21 / v22;
  double v24 = height * (v19[9] / v19[10]);
  [a7 localAspectRatio];
  double v26 = v24 / v25;
  id v27 = a8;
  double v28 = height * (v20[9] / v20[10]);
  [a7 localAspectRatio];
  double v30 = v28 / v29;
  double v31 = width - v23 - v26;
  uint64_t v32 = (uint64_t)(v31 / v30);
  double v33 = v31 - (double)v32 * v30;
  BOOL v34 = v33 >= v30 * 0.75;
  double v35 = v23 + v33 * 0.5;
  double v36 = v26 + v33 * 0.5;
  if (v33 >= v30 * 0.75) {
    double v36 = v26;
  }
  double v73 = v36;
  if (v33 < v30 * 0.75) {
    double v23 = v23 + v33 * 0.5;
  }
  if (v32 > 0) {
    BOOL v34 = 1;
  }
  BOOL v78 = v34;
  id v37 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", v81, v35),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a7,  v27,  a6);
  double v38 = x - width * 0.5 + v23 * 0.5;
  float v39 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v81];
  uint64_t v80 = v32;
  if (!v39)
  {
    id v74 = v17;
    float v40 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    LODWORD(v41) = 0;
    float v39 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v40,  "initWithPosition:size:zRotation:innerRect:context:",  a7,  v38,  y,  v23,  height,  v41,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    id v42 = [a5 countByEnumeratingWithState:&v92 objects:v98 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v93;
      do
      {
        for (i = 0LL; i != v43; i = (char *)i + 1)
        {
          if (*(void *)v93 != v44) {
            objc_enumerationMutation(a5);
          }
          double v46 = *(double **)(*((void *)&v92 + 1) + 8LL * (void)i);
          double v47 = v46[7];
          *(float *)&double v47 = v47;
          -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v39,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a7,  v46[1],  v46[2],  v46[3],  v46[4],  v47,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
        }

        id v43 = [a5 countByEnumeratingWithState:&v92 objects:v98 count:16];
      }

      while (v43);
    }

    [*(id *)((char *)&self->mFrameProviders + 1) setObject:v39 forKey:v81];

    double v17 = v74;
  }

  -[MRTiledSprite renderDumbImage:inContext:](v39, "renderDumbImage:inContext:", v37, a7);
  [v37 releaseByUser];
  id v48 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", v17),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a7,  v27,  a6);
  id v49 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v17];
  if (!v49)
  {
    id v82 = v48;
    id v75 = v17;
    double v50 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    LODWORD(v51) = 0;
    id v49 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v50,  "initWithPosition:size:zRotation:innerRect:context:",  a7,  x + width * 0.5 - v73 * 0.5,  y,  v73,  height,  v51,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    id v52 = [a5 countByEnumeratingWithState:&v88 objects:v97 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v89;
      do
      {
        for (j = 0LL; j != v53; j = (char *)j + 1)
        {
          if (*(void *)v89 != v54) {
            objc_enumerationMutation(a5);
          }
          float v56 = *(double **)(*((void *)&v88 + 1) + 8LL * (void)j);
          double v57 = v56[7];
          *(float *)&double v57 = v57;
          -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v49,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a7,  v56[1],  v56[2],  v56[3],  v56[4],  v57,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
        }

        id v53 = [a5 countByEnumeratingWithState:&v88 objects:v97 count:16];
      }

      while (v53);
    }

    [*(id *)((char *)&self->mFrameProviders + 1) setObject:v49 forKey:v75];

    id v48 = v82;
  }

  -[MRTiledSprite renderDumbImage:inContext:](v49, "renderDumbImage:inContext:", v48, a7);
  [v48 releaseByUser];
  if (v78)
  {
    id v83 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", v76),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a7,  v27,  a6);
    double v58 = v38 + v23 * 0.5;
    if (v32 < 1)
    {
      double v61 = y;
    }

    else
    {
      uint64_t v59 = 0LL;
      double v60 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
      double v61 = y;
      do
      {
        id v62 = -[AVAudioTimePitchAlgorithm stringWithFormat:]( (id)v60[244],  "stringWithFormat:",  @"paper-02-%d",  v59);
        double v63 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v62];
        if (!v63)
        {
          double v64 = self;
          double v65 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
          LODWORD(v66) = 0;
          double v63 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v65,  "initWithPosition:size:zRotation:innerRect:context:",  a7,  v58 + v30 * 0.5,  y,  v30,  height,  v66,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
          __int128 v84 = 0u;
          __int128 v85 = 0u;
          __int128 v86 = 0u;
          __int128 v87 = 0u;
          id v67 = [a5 countByEnumeratingWithState:&v84 objects:v96 count:16];
          if (v67)
          {
            id v68 = v67;
            uint64_t v69 = *(void *)v85;
            do
            {
              for (k = 0LL; k != v68; k = (char *)k + 1)
              {
                if (*(void *)v85 != v69) {
                  objc_enumerationMutation(a5);
                }
                double v71 = *(double **)(*((void *)&v84 + 1) + 8LL * (void)k);
                double v72 = v71[7];
                *(float *)&double v72 = v72;
                -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v63,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a7,  v71[1],  v71[2],  v71[3],  v71[4],  v72,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
              }

              id v68 = [a5 countByEnumeratingWithState:&v84 objects:v96 count:16];
            }

            while (v68);
          }

          self = v64;
          [*(id *)((char *)&v64->mFrameProviders + 1) setObject:v63 forKey:v62];

          double v60 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
          uint64_t v32 = v80;
        }

        -[MRTiledSprite renderDumbImage:inContext:](v63, "renderDumbImage:inContext:", v83, a7);
        double v58 = v30 + v58;
        ++v59;
      }

      while (v59 != v32);
    }

    if (v33 >= v30 * 0.75) {
      +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v83,  a7,  v58 + v33 * 0.5,  v61,  v33,  height);
    }
    [v83 releaseByUser];
  }

  [a7 blend:0];
}

- (void)_drawPortraitPanoBackgroundInRect:(CGRect)a3 flippedRect:(CGRect)a4 paperType:(id)a5 subtract:(id)a6 inTime:(double)a7 inContext:(id)a8 withArguments:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double v15 = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_msgSend(a8, "blend:", 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y);
  __int128 v93 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-01", a5);
  double v18 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-02", a5);
  id v19 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-03", a5);
  unsigned int v20 = (double *)[(id)qword_2B05B8 objectForKey:v93];
  __int128 v88 = v18;
  double v21 = (double *)[(id)qword_2B05B8 objectForKey:v18];
  float v22 = (double *)[(id)qword_2B05B8 objectForKey:v19];
  double v23 = height * (v20[9] / v20[10]);
  [a8 localAspectRatio];
  double v25 = v23 / v24;
  double v26 = height * (v21[9] / v21[10]);
  [a8 localAspectRatio];
  double v28 = v26 / v27;
  id v29 = a9;
  double v90 = height;
  double v30 = height * (v22[9] / v22[10]);
  [a8 localAspectRatio];
  double v32 = v30 / v31;
  double v33 = width - v25 - v28;
  uint64_t v34 = (uint64_t)(v33 / v32);
  double v35 = v33 - (double)v34 * v32;
  BOOL v36 = v35 >= v32 * 0.75;
  double v37 = v28 + v35 * 0.5;
  if (v35 >= v32 * 0.75) {
    double v37 = v28;
  }
  double v85 = v37;
  if (v35 < v32 * 0.75) {
    double v38 = v25 + v35 * 0.5;
  }
  else {
    double v38 = v25;
  }
  if (v34 > 0) {
    BOOL v36 = 1;
  }
  BOOL v89 = v36;
  id v39 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", v93, v25 + v35 * 0.5),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a8,  v29,  a7);
  [a8 localAspectRatio];
  double v41 = v38 * -0.5;
  double v42 = y + v15 * 0.5 + v38 * -0.5 * v40;
  id v43 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v93];
  uint64_t v91 = v34;
  if (!v43)
  {
    __int128 v86 = v19;
    uint64_t v44 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    LODWORD(v45) = -1077342245;
    id v43 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v44,  "initWithPosition:size:zRotation:innerRect:context:",  a8,  x,  v42,  v38,  v90,  v45,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    id v46 = [a6 countByEnumeratingWithState:&v104 objects:v110 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v105;
      do
      {
        for (i = 0LL; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v105 != v48) {
            objc_enumerationMutation(a6);
          }
          double v50 = *(double **)(*((void *)&v104 + 1) + 8LL * (void)i);
          double v51 = v50[7];
          *(float *)&double v51 = v51;
          -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v43,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a8,  v50[1],  v50[2],  v50[3],  v50[4],  v51,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
        }

        id v47 = [a6 countByEnumeratingWithState:&v104 objects:v110 count:16];
      }

      while (v47);
    }

    [*(id *)((char *)&self->mFrameProviders + 1) setObject:v43 forKey:v93];

    id v19 = v86;
  }

  -[MRTiledSprite renderDumbImage:inContext:](v43, "renderDumbImage:inContext:", v39, a8);
  [v39 releaseByUser];
  id v52 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", v19),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a8,  v29,  a7);
  [a8 localAspectRatio];
  float v54 = v53;
  float v55 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v19];
  if (!v55)
  {
    id v94 = v52;
    __int128 v87 = v19;
    float v56 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
    LODWORD(v57) = -1077342245;
    float v55 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v56,  "initWithPosition:size:zRotation:innerRect:context:",  a8,  x,  y - v15 * 0.5 + v85 * 0.5 * v54,  v85,  v90,  v57,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    id v58 = [a6 countByEnumeratingWithState:&v100 objects:v109 count:16];
    if (v58)
    {
      id v59 = v58;
      uint64_t v60 = *(void *)v101;
      do
      {
        for (j = 0LL; j != v59; j = (char *)j + 1)
        {
          if (*(void *)v101 != v60) {
            objc_enumerationMutation(a6);
          }
          id v62 = *(double **)(*((void *)&v100 + 1) + 8LL * (void)j);
          double v63 = v62[7];
          *(float *)&double v63 = v63;
          -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v55,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a8,  v62[1],  v62[2],  v62[3],  v62[4],  v63,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
        }

        id v59 = [a6 countByEnumeratingWithState:&v100 objects:v109 count:16];
      }

      while (v59);
    }

    [*(id *)((char *)&self->mFrameProviders + 1) setObject:v55 forKey:v87];

    id v52 = v94;
  }

  -[MRTiledSprite renderDumbImage:inContext:](v55, "renderDumbImage:inContext:", v52, a8);
  [v52 releaseByUser];
  if (v89)
  {
    id v95 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", v88),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a8,  v29,  a7);
    [a8 localAspectRatio];
    double v65 = v42 + v41 * v64;
    if (v34 < 1)
    {
      double v68 = v90;
    }

    else
    {
      uint64_t v66 = 0LL;
      id v67 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
      double v68 = v90;
      do
      {
        id v69 = -[AVAudioTimePitchAlgorithm stringWithFormat:]( (id)v67[244],  "stringWithFormat:",  @"paper-02-%d",  v66);
        double v70 = (MRTiledSprite *)[*(id *)((char *)&self->mFrameProviders + 1) objectForKey:v69];
        if (!v70)
        {
          double v71 = self;
          [a8 localAspectRatio];
          double v73 = v65 + v32 * -0.5 * v72;
          id v74 = objc_alloc(&OBJC_CLASS___MRTiledSprite);
          LODWORD(v75) = -1077342245;
          double v70 = -[MRTiledSprite initWithPosition:size:zRotation:innerRect:context:]( v74,  "initWithPosition:size:zRotation:innerRect:context:",  a8,  x,  v73,  v32,  v90,  v75,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
          __int128 v96 = 0u;
          __int128 v97 = 0u;
          __int128 v98 = 0u;
          __int128 v99 = 0u;
          id v76 = [a6 countByEnumeratingWithState:&v96 objects:v108 count:16];
          if (v76)
          {
            id v77 = v76;
            uint64_t v78 = *(void *)v97;
            do
            {
              for (k = 0LL; k != v77; k = (char *)k + 1)
              {
                if (*(void *)v97 != v78) {
                  objc_enumerationMutation(a6);
                }
                uint64_t v80 = *(double **)(*((void *)&v96 + 1) + 8LL * (void)k);
                double v81 = v80[7];
                *(float *)&double v81 = v81;
                -[MRTiledSprite subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:]( v70,  "subtractSpriteAtPosition:withSize:zRotation:andOpaqueRect:inContext:",  a8,  v80[1],  v80[2],  v80[3],  v80[4],  v81,  0LL,  0LL,  0x3FF0000000000000LL,  0x3FF0000000000000LL);
              }

              id v77 = [a6 countByEnumeratingWithState:&v96 objects:v108 count:16];
            }

            while (v77);
          }

          self = v71;
          [*(id *)((char *)&v71->mFrameProviders + 1) setObject:v70 forKey:v69];

          id v67 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
          uint64_t v34 = v91;
        }

        -[MRTiledSprite renderDumbImage:inContext:](v70, "renderDumbImage:inContext:", v95, a8);
        [a8 localAspectRatio];
        double v65 = v65 + -v32 * v82;
        ++v66;
      }

      while (v66 != v34);
    }

    if (v35 >= v32 * 0.75)
    {
      [a8 localAspectRatio];
      LODWORD(v84) = -1077342245;
      +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:zRotation:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:zRotation:",  v95,  a8,  x,  v65 + v35 * -0.5 * v83,  v35,  v68,  v84);
    }

    [v95 releaseByUser];
  }

  [a8 blend:0];
}

- (void)_drawBreakFrameInRect:(CGRect)a3 frameWidth:(double)a4 time:(double)a5 inContext:(id)a6 withArguments:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double v45 = a3.origin.y;
  double x = a3.origin.x;
  [a6 localAspectRatio];
  double v17 = v16 * a4;
  double v44 = height;
  if (width >= height) {
    double v18 = 0.0;
  }
  else {
    double v18 = v17 * 0.5;
  }
  id v19 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", @"break_01"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  double v42 = x - width * 0.5;
  double v40 = width;
  double v41 = y + height * 0.5 - v17 * 0.5 - v18;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v19,  a6);
  [v19 releaseByUser];
  id v20 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", @"break_03"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  double v21 = x + width * 0.5;
  double v22 = x;
  double v43 = v21 - a4 * 0.5;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v20,  a6);
  [v20 releaseByUser];
  id v23 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", @"break_08"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  [v23 aspectRatio];
  double v25 = v17 * v24;
  [a6 localAspectRatio];
  double v27 = v25 / v26;
  double v28 = v21 - v27 * 0.5;
  double v29 = v45 - v44 * 0.5 + v17 * 0.5 + v18;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v23,  a6,  v28,  v29,  v27,  v17);
  [v23 releaseByUser];
  id v30 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", @"break_06"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  [v30 aspectRatio];
  double v32 = v17 * v31;
  [a6 localAspectRatio];
  double v34 = v32 / v33;
  +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v30,  a6,  v42 + v34 * 0.5,  v29,  v34,  v17);
  [v30 releaseByUser];
  id v35 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", @"break_02"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v35,  a6,  v22,  v41,  v40 - a4 * 2.0,  v17);
  [v35 releaseByUser];
  id v36 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", @"break_07"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v36,  a6,  v22,  v29,  v40 - v34 - v27,  v17);
  [v36 releaseByUser];
  double v37 = v44 - v17 * 2.0 - v18 * 2.0;
  id v38 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", @"break_05"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v38,  a6,  v43,  v45,  a4,  v37);
  [v38 releaseByUser];
  id v39 = objc_msgSend( objc_msgSend(*(id *)(&self->super._isInInteractiveMode + 1), "objectForKey:", @"break_04"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a6,  a7,  a5);
  +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v39,  a6,  v42 + a4 * 0.5,  v45,  a4,  v37);
  [v39 releaseByUser];
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  double mPhaseInDuration = self->super.mPhaseInDuration;
  if (a4)
  {
    -[MREffectScrapbook interestingTimeForTime:](self, "interestingTimeForTime:", a3);
    double v12 = self->super.mPhaseInDuration;
    if (v11 <= v12)
    {
LABEL_31:
      LOBYTE(v17) = 0;
      return (char)v17;
    }

    double v13 = v11 - v12;
  }

  else
  {
    double mMainDuration = self->super.mMainDuration;
    NSUInteger v15 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    float v16 = *(void **)((char *)&self->mTitleAspectRatio + 1);
    id v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v17) {
      return (char)v17;
    }
    id v18 = v17;
    double mPhaseInDuration = mPhaseInDuration + mMainDuration;
    uint64_t v19 = *(void *)v29;
    double v13 = 0.0;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
        if (*(void *)(v21 + 80) < v15)
        {
          double v22 = *(double *)(v21 + 72);
          double v23 = self->super.mPhaseInDuration + v22 * self->super.mMainDuration;
          double v24 = v23 + 1.0;
          if (v22 > 0.0 && (v24 > a3 ? (BOOL v25 = v24 < mPhaseInDuration) : (BOOL v25 = 0), v25))
          {
            double v13 = mPhaseInDuration - v24;
            double mPhaseInDuration = v23 + 1.0;
          }

          else if (v24 > mPhaseInDuration && v23 - mPhaseInDuration < v13)
          {
            double v13 = v23 - mPhaseInDuration;
          }
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v18);
  }

  if (v13 <= 0.0) {
    goto LABEL_31;
  }
  if (a5) {
    *a5 = mPhaseInDuration;
  }
  if (a6) {
    *a6 = v13;
  }
  LOBYTE(v17) = 1;
  return (char)v17;
}

- (double)interestingTimeForTime:(double)a3
{
  double mPhaseInDuration = self->super.mPhaseInDuration;
  NSUInteger v6 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  double v7 = *(void **)((char *)&self->mTitleAspectRatio + 1);
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (*(void *)(v12 + 80) < v6)
        {
          double v13 = *(double *)(v12 + 72);
          double v14 = self->super.mPhaseInDuration;
          if (v13 > 0.0) {
            double v14 = v14 + v13 * self->super.mMainDuration + 1.0;
          }
          if (v14 > mPhaseInDuration && v14 <= a3) {
            double mPhaseInDuration = v14;
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  return mPhaseInDuration;
}

- (double)interestingTimeForElement:(id)a3
{
  unsigned int v4 = objc_msgSend(objc_msgSend(a3, "substringFromIndex:", 5), "intValue");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = *(void **)((char *)&self->mTitleAspectRatio + 1);
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (*(void *)(v10 + 80) == v4)
        {
          double v12 = *(double *)(v10 + 72);
          double result = self->super.mPhaseInDuration;
          if (v12 > 0.0) {
            return result + v12 * self->super.mMainDuration + 1.0;
          }
          return result;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  return self->super.mPhaseInDuration;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  double v10 = self->super.mPhaseInDuration + self->super.mMainDuration;
  NSUInteger v11 = -[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count");
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  double v12 = *(void **)((char *)&self->mTitleAspectRatio + 1);
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        if (*(void *)(v17 + 80) < v11)
        {
          double v18 = *(double *)(v17 + 72);
          double v19 = self->super.mPhaseInDuration + v18 * self->super.mMainDuration;
          double v20 = v18 <= 0.0 ? self->super.mPhaseInDuration + v18 * self->super.mMainDuration : v19 + 1.0;
          BOOL v21 = v19 >= v10 || v20 <= a6;
          if (!v21) {
            double v10 = v20;
          }
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v14);
  }

  double v22 = v10 - a6 + -1.0;
  if (a3) {
    *a3 = v22;
  }
  if (a4)
  {
    double v23 = 0.25 / v22;
    BOOL v21 = v22 <= 0.0;
    double v24 = 1.0;
    if (!v21) {
      double v24 = v23;
    }
    *a4 = v24;
  }

  if (a5) {
    *a5 = 1.0;
  }
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super.mNeedsToUpdateTexts = 0;
  id v7 = -[NSDictionary objectForKey:]( -[MRLayerEffect textsForElementIDs](self->super.mEffectLayer, "textsForElementIDs", a4, a5, a3),  "objectForKey:",  @"text0");
  uint64_t v8 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v8)
  {
    [v8 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

  id v9 = *(NSArray **)((char *)&self->mLayouts + 1);
  if (v7)
  {
    if (!v9) {
      *(NSArray **)((char *)&self->mLayouts + 1) = (NSArray *)objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
    }
    if (![v7 length]) {
      objc_msgSend( *(id *)((char *)&self->mLayouts + 1),  "setPlaceholderText:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID"),  0,  0));
    }
    unsigned int v10 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"L1_Subtitle");
    if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title2")) {
      unsigned __int8 v11 = 1;
    }
    else {
      unsigned __int8 v11 = -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"_Title");
    }
    p_mPixelSize = (float64x2_t *)&self->super.mPixelSize;
    objc_msgSend( *(id *)((char *)&self->mLayouts + 1),  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
    [*(id *)((char *)&self->mLayouts + 1) setTruncate:1];
    if (v10) {
      uint64_t v13 = 2LL;
    }
    else {
      uint64_t v13 = 3LL;
    }
    [*(id *)((char *)&self->mLayouts + 1) setMaxNumberOfLines:v13];
    if ((-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"L1_Title") | v10) == 1)
    {
      float64x2_t v14 = *p_mPixelSize;
      __asm { FMOV            V1.2D, #3.5 }
    }

    else
    {
      if (-[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"Title2")
        || -[NSString hasSuffix:](self->super.mEffectID, "hasSuffix:", @"P1_Title"))
      {
        __asm { FMOV            V0.2D, #3.0 }

        *(void *)&v22.f64[0] = *(_OWORD *)&vdivq_f64(*p_mPixelSize, _Q0);
        __asm { FMOV            V2.2D, #0.5 }

        v22.f64[1] = vmulq_f64(*p_mPixelSize, _Q2).f64[1];
LABEL_25:
        [*(id *)((char *)&self->mLayouts + 1) setDefinedSize:*(_OWORD *)&v22];
        [*(id *)((char *)&self->mLayouts + 1) setText:v7];
        -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
        +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
        objc_msgSend(*(id *)((char *)&self->mLayouts + 1), "setScale:");
        if ((v11 & 1) == 0)
        {
          [*(id *)((char *)&self->mLayouts + 1) tightFrameOfLineAtIndex:0];
          [*(id *)((char *)&self->mLayouts + 1) setExtraFooter:v23 * 0.25];
          [*(id *)((char *)&self->mLayouts + 1) setRenderAtDefinedSize:1];
        }

        if (v10)
        {
          [*(id *)((char *)&self->mLayouts + 1) setCenterVertically:1];
          [*(id *)((char *)&self->mLayouts + 1) sizeOfText];
          *(void *)(&self->mIsMovieOnly + 1) = v24;
          *(void *)((char *)&self->mTextSize.width + 1) = v25;
        }

        __int128 v26 = (CGContext *)[*(id *)((char *)&self->mLayouts + 1) retainedContext];
        if (v26)
        {
          __int128 v27 = v26;
          __int128 v28 = (MRTextRenderer *)objc_msgSend( objc_msgSend(a4, "imageManager"),  "retainedByUserImageWithCGContext:",  v26);
          *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = v28;
          -[MRTextRenderer setLabel:](v28, "setLabel:", @"Marimba Scrapbook Label");
          CGContextRelease(v27);
        }

        return;
      }

      float64x2_t v14 = *p_mPixelSize;
      _Q1 = (float64x2_t)xmmword_1F8B30;
    }

    float64x2_t v22 = vdivq_f64(v14, _Q1);
    goto LABEL_25;
  }

  if (v9)
  {

    *(NSArray **)((char *)&self->mLayouts + 1) = 0LL;
  }

  [*(id *)((char *)&self->mFrameProviders + 1) removeObjectForKey:@"text0"];
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double v3 = self->super.mPixelSize.width / 3.0;
  double v4 = self->super.mPixelSize.height * 0.5;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 3LL;
}

- (void)_unload
{
  double v3 = *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1);
  if (v3)
  {
    [v3 releaseByUser];
    *(MRTextRenderer **)((char *)&self->mTextRenderer0 + 1) = 0LL;
  }

  double v4 = *(NSArray **)((char *)&self->mLayouts + 1);
  if (v4)
  {
    [v4 cleanup];

    *(NSArray **)((char *)&self->mLayouts + 1) = 0LL;
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * (void)i)];
        [v10 unload];
        [v10 cleanup];
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  [*(id *)(&self->super._isInInteractiveMode + 1) removeAllObjects];

  *(int64_t *)((char *)&self->mTitleAspectRatio + 1) = 0LL;
  [*(id *)((char *)&self->mTextImage0 + 1) removeAllObjects];
  [*(id *)((char *)&self->mFrameProviders + 1) removeAllObjects];
  BYTE1(self->mSprites) = 0;
}

@end