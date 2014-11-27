//
//  WXBaseModel.h
//  MTWeibo
//  所有对象实体的基类

//  Created by wei.chen on 11-9-22.
//  Copyright 2011年 www.iphonetrain.com 无限互联ios开发培训中心 All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXBaseModel : NSObject <NSCoding>{

}
//初始化数据
+ (NSArray *)hardpickDicArray;
+ (NSArray *)hardpickArray;
//获取图片
+ (NSData *)getUserInfoImageWithIcon: (NSString *)Id;
/* ------获取用户等级Icon标
 *数据模型
 *global =         
 {
 blocked = 295;
 cache = "<null>";
 good = 856;
 "hidden_block" = 1;
 icon = 25;
 lat = 1394984962;
 level = 30;
 pn = MichaelChong;
 "save_hero_100" = 0;
 sn = "\U7535\U4fe1\U56db";
 };
 *------------------------*/
+ (NSDictionary *)getUserGlobleDataWithOriginalDic: (NSDictionary *)dic;

/*-----------
 *数据模型
 mostUsedHeros =
 {
 LeeSin = 1;
 Renekton = 2;
 Riven = 50;
 Vayne = 1;
 Zed = 6;
 };
 *---------------*/
+ (NSDictionary *)getUserMostUserHerosWithOriginalDic:(NSDictionary *)dic;

/*------------------*
 *normal =         {
 cache = "<null>";
 clat = 1394984962;
 le = 7;
 lo = 856;
 "o_le" = 0;
 "o_lo" = 0;
 "o_w" = 0;
 olat = 0;
 pn = MichaelChong;
 sn = "\U7535\U4fe1\U56db";
 w = 946;
 };
 *-------------------*/
+ (NSDictionary *)getUserNormalWithOriginalDic:(NSDictionary *)dic;

/**------------------
 *获取用户rank值
 *zdl =         
 {
  elo = 1811;
  eloScore = 3746;
  historyRank =             
 {
  lo = 134;
  r = 54;
  t = 295;
  w = 161;
  };
  originalWinRatio = "52.89";
  rank = 1;
  tier = 3;
  totalBattles = 2108;
  totalScore = 7795;
  updatedTime = 1395022719;
  winBattleScore = 2288;
  winRatio = "52.89";
  winRatioScore = 1761;
  wins = 1115;
 };

 *------------------*/
+ (NSDictionary *)getUserZdlWithOriginalDic:(NSDictionary *)dic;
/*------------------------
 *获取用户排位记录
 *ranked =         {
 "R_P_3" = 0;
 "R_P_3_le" = 0;
 "R_P_3_lo" = 0;
 "R_P_3_w" = 0;
 "R_P_5" = 0;
 "R_P_5_le" = 0;
 "R_P_5_lo" = 0;
 "R_P_5_w" = 0;
 "R_S_5" = 0;
 "R_S_5_le" = 0;
 "R_S_5_lo" = 3;//输
 "R_S_5_w" = 8;//赢
 cache = "<null>";
 "history_rank" = "{\"t\":295,\"w\":161,\"lo\":134,\"r\":54}";
 pn = MichaelChong;
 rlat = 1394343129;
 sn = "\U7535\U4fe1\U56db";
 };
 *-----------------*/
+ (NSDictionary *)getUserRankedWithOriginalDic:(NSDictionary *)dic;

/*------获取用户战区
 *warzone =         
 {
 "R_S_5" =             
 {
 "fresh_blood" = 0;
 "hot_streak" = 0;
 id = 2928355431;
 inactive = 0;
 "last_played" = 0;
 "league_points" = 28; //战区分数
 "mini_series" = null;
 pn = MichaelChong;
 "previous_day_league_position" = 14;
 "queue_type" = "RANKED_SOLO_5x5";
 rank = 1;
 tier = 3;
 type = 0;
 updatedToDB = 1;
 veteran = 0;
 "warzone_name" = "Olaf's Swarm";//战区名称
 "warzone_updated" = 1395128803;
 };
 };
 *-----------------------------*/

+ (NSDictionary *)getUserWarzoneWithOriginalDic:(NSDictionary *)dic;
/*获取极地大乱斗数据
 *aram =         {
 "a_le" = 0;
 "a_lo" = 20;//输
 "a_w" = 19;//赢
 alat = 1386590462;
 cache = "<null>";
 pn = MichaelChong;
 sn = "\U7535\U4fe1\U56db";
 };
 *--------------------*/
+ (NSDictionary *)getUserAramWithOriginalDic:(NSDictionary *)dic;
/*获取人机数据
 *bot =         {
 "b_le" = 15;
 "b_lo" = 15;//输
 "b_w" = 278;//赢
 blat = 1394966433;
 cache = "<null>";
 pn = MichaelChong;
 sn = "\U7535\U4fe1\U56db";
 };
 *----------------*/
+ (NSDictionary *)getUserBotWithOriginalDic:(NSDictionary *)dic;

//返回段位组合如黄金||/28
+ (NSString *)returnUserRankAndTierWithRank: (NSString *)rank
                                       tier: (NSString *)tier
                                      point: (NSString *)point;

//返回资料站tablview
+ (NSArray *)returnDataStationViewInfo;
//返回所有物品资料
+ (NSArray *)returnAllGoodsViewInfo;

+ (NSDictionary *)getUrlStringContentWithUrlString: (NSString *)urlString;

- (id)initWithDataDic:(NSDictionary*)data;
- (NSDictionary*)attributeMapDictionary;
- (void)setAttributes:(NSDictionary*)dataDic;
- (NSString *)customDescription;
- (NSString *)description;
- (NSData*)getArchivedData;
- (NSString *)cleanString:(NSString *)str;    //清除\n和\r的字符串

@end
