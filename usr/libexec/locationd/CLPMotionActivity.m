@interface CLPMotionActivity
- (id)initWithCLMotionActivity:(CLMotionActivity *)a3;
@end

@implementation CLPMotionActivity

- (id)initWithCLMotionActivity:(CLMotionActivity *)a3
{
  v13 = -[CLPMotionActivity init]( self,  "init",  a3,  *(void *)&a5,  *(void *)&a6,  *(void *)&a7,  *(void *)&a8,  *(void *)&a9,  a4,  a10);
  v14 = v13;
  if (v13)
  {
    int type = a3->type;
    if (a3->type <= 3015)
    {
      if (type <= 99)
      {
        int v16 = 0;
        switch(type)
        {
          case 0:
            goto LABEL_79;
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 11:
            goto LABEL_12;
          case 10:
            int v16 = 1;
            goto LABEL_79;
          default:
            int v16 = 0;
            switch(type)
            {
              case '4':
              case '8':
                goto LABEL_12;
              case '5':
              case '6':
              case '7':
              case '9':
              case ':':
              case ';':
              case '<':
              case 'C':
              case 'D':
              case 'E':
              case 'F':
                goto LABEL_80;
              case '=':
              case '>':
              case '?':
              case '@':
              case 'A':
              case 'B':
              case 'G':
                goto LABEL_79;
              default:
                int v16 = a3->type;
                if (type == 41) {
                  goto LABEL_79;
                }
                break;
            }

            break;
        }

        goto LABEL_80;
      }

      if (type > 2064)
      {
        if (type <= 2100)
        {
          int v16 = a3->type;
          if (type != 2065)
          {
            int v16 = 0;
            if (type != 2068)
            {
              int v16 = a3->type;
              if (type != 2071) {
                goto LABEL_80;
              }
            }
          }

          goto LABEL_79;
        }

        if (type > 2149)
        {
          int v16 = a3->type;
          if (type != 2150)
          {
            int v16 = a3->type;
            if (type != 3015) {
              goto LABEL_80;
            }
          }

          goto LABEL_79;
        }

        if (type != 2101)
        {
          int v16 = 0;
          if (type != 2105) {
            goto LABEL_80;
          }
          goto LABEL_79;
        }
      }

      else
      {
        if (type <= 2021)
        {
          int v16 = a3->type;
          if (type != 100)
          {
            int v16 = a3->type;
            if (type != 2010)
            {
              int v16 = 0;
              if (type != 2020) {
                goto LABEL_80;
              }
            }
          }

          goto LABEL_79;
        }

        if (type > 2047)
        {
          int v16 = a3->type;
          if (type != 2048)
          {
            int v16 = a3->type;
            if (type != 2061) {
              goto LABEL_80;
            }
          }

          goto LABEL_79;
        }

        if (type != 2022)
        {
          int v16 = 0;
          if (type != 2024) {
            goto LABEL_80;
          }
          goto LABEL_79;
        }
      }

      goto LABEL_78;
    }

    if (type > 15651)
    {
      if (type > 18199)
      {
        if (type <= 19149)
        {
          if (type <= 19029)
          {
            int v16 = 0;
            if (type != 18200)
            {
              int v17 = 18240;
              goto LABEL_48;
            }

            goto LABEL_79;
          }

          if (type != 19030)
          {
            int v16 = 0;
            int v17 = 19090;
            goto LABEL_76;
          }
        }

        else
        {
          if (type <= 515620)
          {
            int v16 = 0;
            if (type != 19150)
            {
              if (type != 90603) {
                goto LABEL_80;
              }
LABEL_12:
              int v16 = a3->type;
            }

            goto LABEL_79;
          }

          if (type != 515621 && type != 515652)
          {
            int v16 = 0;
            int v17 = 519150;
            goto LABEL_76;
          }
        }
      }

      else
      {
        if (type <= 15732)
        {
          int v16 = 0;
          goto LABEL_79;
        }

        if (type <= 18049)
        {
          int v16 = 0;
          if (type != 15733)
          {
            int v17 = 17150;
            goto LABEL_48;
          }

@end